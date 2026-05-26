# HappeningNowSignal — public Übersicht widget
# Consumes: https://happeningnow.news/api/public/today.json

config =
  refreshMinutes: 15          # 10–15 recommended; default 15
  maxStories: 5               # number of headlines to show
  categories: []              # future v2: ['tech', 'business', 'cyber']

API_HOST = 'https://happeningnow.news'
API_PATH = '/api/public/today.json'
PROXY = 'http://127.0.0.1:41417/'

refreshFrequency: config.refreshMinutes * 60 * 1000

style: """
  top: 24px
  right: 24px
  left: auto
  color: #fff
  pointer-events: auto
"""

buildApiUrl: ->
  url = "#{API_HOST}#{API_PATH}"
  if config.categories?.length
    cats = config.categories.join(',')
    "#{url}?categories=#{encodeURIComponent(cats)}"
  else
    url

escapeHtml: (value) ->
  String(value ? '')
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')

formatUpdatedAt: (iso) ->
  return '' unless iso
  try
    d = new Date(iso)
    return '' if isNaN(d.getTime())
    d.toLocaleTimeString([], hour: '2-digit', minute: '2-digit')
  catch
    ''

command: (callback) ->
  url = @buildApiUrl()
  $.ajax
    url: PROXY + url
    dataType: 'json'
    timeout: 12000
  .done (data) ->
    callback null, JSON.stringify(data)
  .fail (_, __, err) ->
    callback err ? new Error('fetch failed')

render: ->
  """
  <link rel="stylesheet" href="styles.css">
  <div class="hn-widget">
    <header class="hn-header">
      <div class="hn-brand">
        <p class="hn-title">HappeningNow</p>
        <p class="hn-subtitle">Today's Signal</p>
      </div>
      <span class="hn-status-dot is-waiting" aria-hidden="true"></span>
    </header>
    <div class="hn-body">
      <p class="hn-message">Waiting for Today's Signal…</p>
    </div>
    <footer class="hn-footer"></footer>
  </div>
  """

update: (output, domEl) ->
  @$root = $(domEl)
  $body = @$root.find('.hn-body')
  $dot = @$root.find('.hn-status-dot')
  $footer = @$root.find('.hn-footer')

  try
    payload = JSON.parse(output)
  catch
    $dot.removeClass('is-live is-waiting').addClass('is-error')
    $body.html '<p class="hn-message">Signal temporarily unavailable.</p>'
    $footer.text ''
    return

  unless payload?.ok and Array.isArray(payload.top)
    $dot.removeClass('is-live is-waiting').addClass('is-error')
    $body.html '<p class="hn-message">Signal temporarily unavailable.</p>'
    $footer.text ''
    return

  stories = payload.top.slice(0, config.maxStories)

  if stories.length is 0
    $dot.removeClass('is-live is-error').addClass('is-waiting')
    $body.html '<p class="hn-message">Waiting for Today\'s Signal…</p>'
    $footer.text ''
    return

  $dot.removeClass('is-waiting is-error').addClass('is-live')

  html = '<div class="hn-story-list">'
  for story in stories
    url = story.url ? story.shortUrl ? '#'
    html += """
      <article class="hn-story" data-url="#{@escapeHtml(url)}" title="Open story">
        <div class="hn-story-meta">
          <span class="hn-category">#{@escapeHtml(story.category ? 'News')}</span>
          <span class="hn-freshness">#{@escapeHtml(story.freshness ? '')}</span>
        </div>
        <h2 class="hn-headline">#{@escapeHtml(story.title ? 'Untitled')}</h2>
        <p class="hn-source">#{@escapeHtml(story.source ? 'Unknown source')}</p>
      </article>
    """
  html += '</div>'
  $body.html html

  updated = @formatUpdatedAt(payload.updatedAt ? payload.generatedAt)
  $footer.text if updated then "Updated #{updated}" else ''

afterRender: (domEl) ->
  $(domEl).on 'click', '.hn-story', (event) =>
    url = $(event.currentTarget).data('url')
    return unless url
    @run "open \"#{url.replace(/"/g, '\\"')}\"", ->
