# HappeningNowSignal — lightweight Übersicht widget
# Feed: https://happeningnow.news/api/public/today.json?view=categories

WIDGET_VERSION = '2.2.5'
WIDGET_WIDTH = 400
MENU_LAYER_TOP = 52
MENU_LAYER_RIGHT = 16
THEME_KEY = 'hn-signal-theme'
POSITION_KEY = 'hn-signal-position'
STORIES_KEY = 'hn-signal-stories-per-category'
POSITIONS = ['top-right', 'top-left', 'center']
THEMES = ['dark', 'light']
STORIES_PER_CATEGORY_OPTS = [1, 2, 3]

position =
  x: 24
  y: 24
  menuGap: 56

config =
  refreshMinutes: 15
  defaultTheme: 'dark'
  defaultStoriesPerCategory: 3
  logoFile: 'logo.webp'
  websiteUrl: 'https://happeningnow.news'
  githubUrl: 'https://github.com/ReyWins/happeningnow-widget'
  donateUrl: 'https://buymeacoffee.com/happeningnow'

API_URL = 'https://happeningnow.news/api/public/today.json?view=categories'
PROXY = 'http://127.0.0.1:41417/'
WIDGET_ID = 'HappeningNowSignal.widget'

refreshFrequency: config.refreshMinutes * 60 * 1000

style: """
  top: 24px
  right: 24px
  left: auto
  width: #{WIDGET_WIDTH}px
  min-width: #{WIDGET_WIDTH}px
  max-width: #{WIDGET_WIDTH}px
  padding: 14px
  position: relative
  overflow: visible
  pointer-events: auto
  font-family: -apple-system, BlinkMacSystemFont, "SF Pro Text", "Helvetica Neue", sans-serif
  font-size: 12px
  line-height: 1.4
  -webkit-font-smoothing: antialiased
  border-radius: 18px
  transition: background 200ms ease, color 200ms ease, border-color 200ms ease

  h1, h2, p, footer, article, button, select
    margin: 0
    padding: 0
    font-family: inherit
    font-style: normal
    font-weight: inherit
    background: transparent
    color: inherit
    -webkit-appearance: none
    appearance: none

  &.hn-theme-dark
    color: rgba(248, 250, 252, 0.94)
    background: linear-gradient(145deg, rgba(255,255,255,0.06) 0%, rgba(255,255,255,0.01) 42%, rgba(255,255,255,0) 100%), rgba(10, 12, 16, 0.78)
    border: 1px solid rgba(255, 255, 255, 0.11)
    box-shadow: 0 18px 48px rgba(0, 0, 0, 0.38), inset 0 1px 0 rgba(255, 255, 255, 0.07)
    -webkit-backdrop-filter: blur(22px) saturate(155%)

  &.hn-theme-light
    color: rgba(30, 41, 59, 0.94)
    background: linear-gradient(145deg, rgba(255,255,255,0.72) 0%, rgba(255,255,255,0.52) 45%, rgba(255,255,255,0.38) 100%), rgba(255, 255, 255, 0.58)
    border: 1px solid rgba(255, 255, 255, 0.72)
    box-shadow: 0 18px 48px rgba(15, 23, 42, 0.1), inset 0 1px 0 rgba(255, 255, 255, 0.92)
    -webkit-backdrop-filter: blur(26px) saturate(180%)

  .hn-card
    position: relative
    z-index: 1
    overflow: visible

  .hn-header
    overflow: visible
    margin-bottom: 10px
    padding-bottom: 10px
    border-bottom: 1px solid rgba(127, 127, 127, 0.18)

  &.hn-theme-dark .hn-header
    border-bottom-color: rgba(255, 255, 255, 0.1)

  &.hn-theme-light .hn-header
    border-bottom-color: rgba(15, 23, 42, 0.1)

  .hn-header-row
    overflow: visible
    display: flex
    align-items: flex-start
    justify-content: space-between
    gap: 8px

  .hn-brand
    display: flex
    align-items: center
    min-width: 0
    flex: 1

  .hn-logo
    width: 40px
    height: 40px
    border-radius: 10px
    flex-shrink: 0
    margin-right: 10px
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.24)
    background-color: rgba(14, 165, 233, 0.15)
    background-image: url('HappeningNowSignal.widget/logo.webp')
    background-size: cover
    background-position: center
    background-repeat: no-repeat

  .hn-brand-text
    min-width: 0

  .hn-title
    display: inline-flex
    align-items: center
    gap: 6px
    font-size: 13px
    font-weight: 600
    letter-spacing: -0.01em

  &.hn-theme-dark .hn-title
    color: rgba(255, 255, 255, 0.96)

  &.hn-theme-light .hn-title
    color: rgba(15, 23, 42, 0.96)

  .hn-subtitle
    margin-top: 2px
    font-size: 10px

  &.hn-theme-dark .hn-subtitle
    color: rgba(255, 255, 255, 0.45)

  &.hn-theme-light .hn-subtitle
    color: rgba(51, 65, 85, 0.78)

  .hn-menu-bar
    display: flex
    align-items: center
    gap: 4px
    flex-shrink: 0

  .hn-menu-layer
    position: absolute
    top: #{MENU_LAYER_TOP}px
    right: #{MENU_LAYER_RIGHT}px
    width: 188px
    height: 0
    overflow: visible
    z-index: 9999
    pointer-events: none

  .hn-menu-btn
    padding: 3px 8px
    border-radius: 999px
    border: 1px solid rgba(127, 127, 127, 0.22)
    font-size: 10px
    font-weight: 500
    cursor: pointer
    white-space: nowrap

  &.hn-theme-dark .hn-menu-btn
    color: rgba(255, 255, 255, 0.9)
    background: rgba(255, 255, 255, 0.08)
    border-color: rgba(255, 255, 255, 0.14)

  &.hn-theme-light .hn-menu-btn
    color: rgba(30, 41, 59, 0.92)
    background: rgba(255, 255, 255, 0.48)
    border-color: rgba(255, 255, 255, 0.72)

  .hn-dropdown
    display: none
    position: absolute
    top: 0
    right: 0
    width: 188px
    max-height: 280px
    overflow-y: auto
    overflow-x: hidden
    padding: 8px
    border-radius: 18px
    pointer-events: auto
    font-size: 11px
    -webkit-backdrop-filter: blur(24px) saturate(165%)

  &.hn-theme-dark .hn-dropdown
    color: rgba(255, 255, 255, 0.94)
    background: rgba(18, 20, 26, 0.96)
    border: 1px solid rgba(255, 255, 255, 0.14)
    box-shadow: 0 24px 60px rgba(0, 0, 0, 0.35)

  &.hn-theme-light .hn-dropdown
    color: rgba(30, 41, 59, 0.94)
    background: rgba(255, 255, 255, 0.92)
    border: 1px solid rgba(255, 255, 255, 0.72)
    box-shadow: 0 24px 60px rgba(15, 23, 42, 0.18)

  .hn-dropdown.is-open
    display: block

  .hn-dropdown-label
    padding: 4px 7px 3px
    font-size: 9px
    font-weight: 600
    letter-spacing: 0.07em
    text-transform: uppercase

  &.hn-theme-dark .hn-dropdown-label
    color: rgba(255, 255, 255, 0.52)

  &.hn-theme-light .hn-dropdown-label
    color: rgba(51, 65, 85, 0.72)

  .hn-dropdown-note
    padding: 2px 7px 5px
    font-size: 9px
    line-height: 1.35

  &.hn-theme-dark .hn-dropdown-note
    color: rgba(255, 255, 255, 0.48)

  &.hn-theme-light .hn-dropdown-note
    color: rgba(51, 65, 85, 0.68)

  .hn-dropdown-item
    display: block
    width: 100%
    padding: 5px 7px
    border: none
    border-radius: 7px
    text-align: left
    font-size: 11px
    cursor: pointer

  &.hn-theme-dark .hn-dropdown-item
    color: rgba(255, 255, 255, 0.92)

  &.hn-theme-dark .hn-dropdown-item:hover
    background: rgba(255, 255, 255, 0.1)

  &.hn-theme-dark .hn-dropdown-item.is-active
    color: #93e6ff
    background: rgba(56, 189, 248, 0.18)

  &.hn-theme-light .hn-dropdown-item
    color: rgba(30, 41, 59, 0.92)

  &.hn-theme-light .hn-dropdown-item:hover
    background: rgba(255, 255, 255, 0.55)

  &.hn-theme-light .hn-dropdown-item.is-active
    color: #0369a1
    background: rgba(56, 189, 248, 0.16)

  .hn-dropdown-divider
    height: 1px
    margin: 4px 5px
    background: rgba(127, 127, 127, 0.2)

  .hn-dropdown-select
    display: block
    width: calc(100% - 10px)
    margin: 2px 5px 6px
    padding: 5px 22px 5px 8px
    border-radius: 8px
    border: 1px solid rgba(127, 127, 127, 0.22)
    font-size: 10px
    cursor: pointer
    outline: none
    background: rgba(127, 127, 127, 0.08) url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='10' height='6' viewBox='0 0 10 6'%3E%3Cpath fill='%23888' d='M1 1l4 4 4-4'/%3E%3C/svg%3E") no-repeat right 8px center

  &.hn-theme-dark .hn-dropdown-select
    color: rgba(255, 255, 255, 0.92)
    border-color: rgba(255, 255, 255, 0.14)
    background-color: rgba(255, 255, 255, 0.06)

  &.hn-theme-light .hn-dropdown-select
    color: rgba(30, 41, 59, 0.92)
    border-color: rgba(15, 23, 42, 0.12)
    background-color: rgba(255, 255, 255, 0.65)

  .hn-dropdown-link
    display: block
    padding: 5px 7px
    border-radius: 7px
    text-decoration: none
    word-break: break-all
    font-size: 10px
    line-height: 1.4

  &.hn-theme-dark .hn-dropdown-link
    color: #7dd3fc

  &.hn-theme-light .hn-dropdown-link
    color: #0284c7

  .hn-dropdown-meta
    padding: 4px 7px
    font-size: 10px
    line-height: 1.45

  &.hn-theme-dark .hn-dropdown-meta
    color: rgba(255, 255, 255, 0.72)

  &.hn-theme-light .hn-dropdown-meta
    color: rgba(51, 65, 85, 0.82)

  .hn-status-dot
    display: block
    flex-shrink: 0
    width: 7px
    height: 7px
    border-radius: 50%
    background: rgba(127, 127, 127, 0.35)
    box-shadow: 0 0 0 2px rgba(0, 0, 0, 0.88)

  .hn-status-dot.is-live
    background: #3dd68c
    box-shadow: 0 0 0 2px rgba(0, 0, 0, 0.88), 0 0 8px rgba(61, 214, 140, 0.45)
    animation: hn-pulse 2.4s ease-in-out infinite

  .hn-status-dot.is-waiting
    background: #f5b942
    box-shadow: 0 0 0 2px rgba(0, 0, 0, 0.88), 0 0 6px rgba(245, 185, 66, 0.35)

  .hn-status-dot.is-error
    background: #f87171
    box-shadow: 0 0 0 2px rgba(0, 0, 0, 0.88), 0 0 6px rgba(248, 113, 113, 0.35)

  .hn-updated
    margin-top: 7px
    font-size: 10px

  &.hn-theme-dark .hn-updated
    color: rgba(255, 255, 255, 0.42)

  &.hn-theme-light .hn-updated
    color: rgba(51, 65, 85, 0.82)

  .hn-body
    overflow-x: hidden
    overflow-y: auto
    max-height: 480px

  .hn-body.hn-body--compact
    max-height: none

  .hn-story-list
    display: flex
    flex-direction: column

  .hn-tile
    display: block
    margin-bottom: 4px
    border-radius: 12px
    text-decoration: none
    color: inherit
    transition: background 180ms ease, border-color 180ms ease

  .hn-tile--linked
    cursor: pointer
    -webkit-user-select: none
    user-select: none

  .hn-tile--static
    cursor: default

  &.hn-theme-dark .hn-tile
    border: 1px solid rgba(255, 255, 255, 0.07)
    background: rgba(255, 255, 255, 0.035)

  &.hn-theme-dark .hn-tile:hover
    background: rgba(255, 255, 255, 0.065)
    border-color: rgba(255, 255, 255, 0.16)

  &.hn-theme-light .hn-tile
    border: 1px solid rgba(255, 255, 255, 0.55)
    background: rgba(255, 255, 255, 0.28)

  &.hn-theme-light .hn-tile:hover
    background: rgba(255, 255, 255, 0.42)

  .hn-tile:last-child
    margin-bottom: 0

  .hn-tile-content
    padding: 9px 10px

  .hn-tile-meta
    display: flex
    align-items: center
    justify-content: space-between
    gap: 6px
    margin-bottom: 5px

  .hn-badge-group
    display: inline-flex
    align-items: center
    gap: 4px
    flex-shrink: 0

  .hn-tile + .hn-tile .hn-tile-meta
    padding-top: 9px
    margin-top: 2px
    border-top: 1px solid rgba(127, 127, 127, 0.16)

  &.hn-theme-light .hn-tile + .hn-tile .hn-tile-meta
    border-top-color: rgba(15, 23, 42, 0.1)

  .hn-pill
    display: inline-block
    max-width: 62%
    padding: 2px 7px
    border-radius: 999px
    font-size: 9px
    font-weight: 600
    letter-spacing: 0.06em
    text-transform: uppercase
    white-space: nowrap
    overflow: hidden
    text-overflow: ellipsis
    border: 1px solid transparent

  &.hn-theme-dark .hn-pill--global
    color: #bfdbfe
    background: rgba(96, 165, 250, 0.16)
    border-color: rgba(96, 165, 250, 0.32)
  &.hn-theme-dark .hn-pill--business
    color: #fde68a
    background: rgba(251, 191, 36, 0.14)
    border-color: rgba(251, 191, 36, 0.3)
  &.hn-theme-dark .hn-pill--tech
    color: #c7d2fe
    background: rgba(99, 102, 241, 0.18)
    border-color: rgba(99, 102, 241, 0.34)
  &.hn-theme-dark .hn-pill--cyber
    color: #67e8f9
    background: rgba(8, 145, 178, 0.16)
    border-color: rgba(8, 145, 178, 0.32)
  &.hn-theme-dark .hn-pill--energy
    color: #fde68a
    background: rgba(251, 191, 36, 0.14)
    border-color: rgba(251, 191, 36, 0.3)
  &.hn-theme-dark .hn-pill--science
    color: #5eead4
    background: rgba(20, 184, 166, 0.16)
    border-color: rgba(20, 184, 166, 0.32)
  &.hn-theme-dark .hn-pill--health
    color: #86efac
    background: rgba(34, 197, 94, 0.16)
    border-color: rgba(34, 197, 94, 0.32)
  &.hn-theme-dark .hn-pill--crime
    color: #fca5a5
    background: rgba(248, 113, 113, 0.16)
    border-color: rgba(248, 113, 113, 0.32)
  &.hn-theme-dark .hn-pill--sports
    color: #fdba74
    background: rgba(251, 146, 60, 0.16)
    border-color: rgba(251, 146, 60, 0.32)
  &.hn-theme-dark .hn-pill--weather
    color: #bae6fd
    background: rgba(125, 211, 252, 0.16)
    border-color: rgba(125, 211, 252, 0.32)
  &.hn-theme-dark .hn-pill--entertainment
    color: #d8b4fe
    background: rgba(168, 85, 247, 0.16)
    border-color: rgba(168, 85, 247, 0.32)
  &.hn-theme-dark .hn-pill--default
    color: #d1d5db
    background: rgba(156, 163, 175, 0.14)
    border-color: rgba(156, 163, 175, 0.28)

  &.hn-theme-light .hn-pill--global
    color: #1d4ed8
    background: rgba(59, 130, 246, 0.18)
    border-color: rgba(37, 99, 235, 0.35)
  &.hn-theme-light .hn-pill--business
    color: #b45309
    background: rgba(251, 191, 36, 0.22)
    border-color: rgba(217, 119, 6, 0.35)
  &.hn-theme-light .hn-pill--tech
    color: #4338ca
    background: rgba(99, 102, 241, 0.18)
    border-color: rgba(79, 70, 229, 0.35)
  &.hn-theme-light .hn-pill--cyber
    color: #0e7490
    background: rgba(6, 182, 212, 0.18)
    border-color: rgba(8, 145, 178, 0.35)
  &.hn-theme-light .hn-pill--energy
    color: #c2410c
    background: rgba(251, 146, 60, 0.2)
    border-color: rgba(234, 88, 12, 0.35)
  &.hn-theme-light .hn-pill--science
    color: #0f766e
    background: rgba(20, 184, 166, 0.18)
    border-color: rgba(13, 148, 136, 0.35)
  &.hn-theme-light .hn-pill--health
    color: #15803d
    background: rgba(34, 197, 94, 0.18)
    border-color: rgba(22, 163, 74, 0.35)
  &.hn-theme-light .hn-pill--crime
    color: #b91c1c
    background: rgba(239, 68, 68, 0.16)
    border-color: rgba(220, 38, 38, 0.35)
  &.hn-theme-light .hn-pill--sports
    color: #c2410c
    background: rgba(249, 115, 22, 0.18)
    border-color: rgba(234, 88, 12, 0.35)
  &.hn-theme-light .hn-pill--weather
    color: #0369a1
    background: rgba(56, 189, 248, 0.2)
    border-color: rgba(2, 132, 199, 0.35)
  &.hn-theme-light .hn-pill--entertainment
    color: #7e22ce
    background: rgba(168, 85, 247, 0.18)
    border-color: rgba(126, 34, 206, 0.35)
  &.hn-theme-light .hn-pill--default
    color: #475569
    background: rgba(148, 163, 184, 0.22)
    border-color: rgba(100, 116, 139, 0.35)

  .hn-badge
    flex-shrink: 0
    padding: 2px 6px
    border-radius: 6px
    font-size: 9px
    font-weight: 600
    text-transform: uppercase
    border: 1px solid transparent

  &.hn-theme-dark .hn-badge--breaking
    color: #fecaca
    background: rgba(239, 68, 68, 0.22)
    border-color: rgba(248, 113, 113, 0.45)
  &.hn-theme-dark .hn-badge--fresh
    color: #86efac
    background: rgba(34, 197, 94, 0.16)
    border-color: rgba(34, 197, 94, 0.34)
  &.hn-theme-dark .hn-badge--aging
    color: #fcd34d
    background: rgba(245, 158, 11, 0.18)
    border-color: rgba(245, 158, 11, 0.36)
  &.hn-theme-dark .hn-badge--stale
    color: #fca5a5
    background: rgba(248, 113, 113, 0.16)
    border-color: rgba(248, 113, 113, 0.34)
  &.hn-theme-dark .hn-badge--neutral
    color: rgba(255, 255, 255, 0.58)
    background: rgba(255, 255, 255, 0.06)
    border-color: rgba(255, 255, 255, 0.1)

  &.hn-theme-light .hn-badge--breaking
    color: #b91c1c
    background: rgba(239, 68, 68, 0.18)
    border-color: rgba(220, 38, 38, 0.4)
  &.hn-theme-light .hn-badge--fresh
    color: #15803d
    background: rgba(34, 197, 94, 0.2)
    border-color: rgba(22, 163, 74, 0.4)
  &.hn-theme-light .hn-badge--aging
    color: #b45309
    background: rgba(245, 158, 11, 0.22)
    border-color: rgba(217, 119, 6, 0.4)
  &.hn-theme-light .hn-badge--stale
    color: #b91c1c
    background: rgba(239, 68, 68, 0.18)
    border-color: rgba(220, 38, 38, 0.4)
  &.hn-theme-light .hn-badge--neutral
    color: rgba(51, 65, 85, 0.82)
    background: rgba(255, 255, 255, 0.45)
    border-color: rgba(15, 23, 42, 0.12)

  .hn-headline
    font-size: 12px
    font-weight: 500
    line-height: 1.38

  &.hn-theme-dark .hn-headline
    color: rgba(255, 255, 255, 0.94)

  &.hn-theme-light .hn-headline
    color: rgba(15, 23, 42, 0.94)

  .hn-tile-foot
    margin-top: 6px
    padding-top: 5px
    border-top: 1px solid rgba(127, 127, 127, 0.14)

  &.hn-theme-light .hn-tile-foot
    border-top-color: rgba(15, 23, 42, 0.1)

  .hn-source
    font-size: 10px

  &.hn-theme-dark .hn-source
    color: rgba(255, 255, 255, 0.55)

  &.hn-theme-light .hn-source
    color: rgba(51, 65, 85, 0.88)

  .hn-message
    padding: 24px 10px
    text-align: center
    font-size: 12px
    line-height: 1.45

  &.hn-theme-dark .hn-message
    color: rgba(255, 255, 255, 0.55)

  &.hn-theme-light .hn-message
    color: rgba(51, 65, 85, 0.86)

  @keyframes hn-pulse
    0%, 100%
      opacity: 1
    50%
      opacity: 0.55
"""

escapeHtml: (value) ->
  String(value ? '')
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')

escapeAttr: (value) ->
  String(value ? '')
    .replace(/&/g, '&amp;')
    .replace(/"/g, '&quot;')

formatUpdatedAt: (iso) ->
  return '' unless iso?
  try
    d = new Date(iso)
    return '' if isNaN(d.getTime())
    text = d.toLocaleTimeString([], hour: 'numeric', minute: '2-digit')
    if text? then String(text) else ''
  catch
    ''

normalizeHref: (raw) ->
  value = if raw? then String(raw).trim() else ''
  return '' unless value
  if /^https?:\/\//i.test(value) then value
  else if value.indexOf('//') is 0 then "https:#{value}"
  else if /^[\w.-]+\.[a-z]{2,}/i.test(value) then "https://#{value}"
  else ''

storyHref: (story) ->
  return '' unless story?
  href = @normalizeHref(story.url)
  if href and /happeningnow\.news\/s\//i.test(href) then href else ''

shellEscapeUrl: (url) ->
  String(url).replace(/'/g, "'\\''")

categorySlug: (id) ->
  slug = String(id ? '').toLowerCase().replace(/[^a-z0-9-]/g, '')
  if slug then slug else 'default'

freshnessSlug: (freshness) ->
  key = String(freshness ? '').toLowerCase().trim()
  if key is 'breaking' then 'breaking'
  else if key is 'fresh' then 'fresh'
  else if key is 'stale' then 'stale'
  else if key is 'aging' or key is 'aged' then 'aging'
  else 'neutral'

showBreakingBadge: (story) ->
  return false unless story?.breaking is true
  @freshnessSlug(story?.freshness) is 'breaking'

renderStoryBadges: (story) ->
  freshness = if story?.freshness then String(story.freshness) else ''
  if @showBreakingBadge(story)
    return '<span class="hn-badge hn-badge--breaking">Breaking</span>'
  if freshness
    freshSlug = @freshnessSlug(freshness)
    return "<span class=\"hn-badge hn-badge--#{freshSlug}\">#{@escapeHtml(freshness)}</span>"
  ''

enrichStory: (story, category) ->
  return null unless story?
  id = String(category?.id ? story.categoryId ? 'default')
  label = String(category?.label ? story.categoryLabel ? id)
  {
    title: story.title
    source: story.source
    freshness: story.freshness
    breaking: story.breaking
    popularityPct: story.popularityPct
    shortUrl: if story.shortUrl? then String(story.shortUrl) else ''
    url: if story.url? then String(story.url) else ''
    categoryId: id
    categoryLabel: label
  }

balancedAllStories: (categories, maxPerCategory) ->
  return [] unless Array.isArray(categories)
  max = Math.max(1, Math.min(3, Number(maxPerCategory) or 3))
  buckets = []
  for category in categories
    raw = if Array.isArray(category?.stories) then category.stories else []
    buckets.push
      id: category?.id ? 'default'
      label: category?.label ? category?.id ? 'News'
      stories: raw.slice(0, max)
  result = []
  round = 0
  loop
    added = false
    for bucket in buckets
      if round < bucket.stories.length
        enriched = @enrichStory(bucket.stories[round], id: bucket.id, label: bucket.label)
        result.push enriched if enriched?
        added = true
    break unless added
    round++
  result

storiesForCategory: (categories, selectedId, maxPerCategory) ->
  return [] unless Array.isArray(categories) and selectedId?
  max = Math.max(1, Math.min(3, Number(maxPerCategory) or 3))
  key = String(selectedId)
  for category in categories
    id = String(category?.id ? '')
    continue unless id is key
    raw = if Array.isArray(category.stories) then category.stories else []
    out = []
    for story in raw.slice(0, max)
      enriched = @enrichStory(story, category)
      out.push enriched if enriched?
    return out
  []

renderCategoryOptions: (selected, categories) ->
  selected ?= 'all'
  categories ?= []
  html = '<option value="all">All</option>'
  for category in categories
    id = String(category?.id ? '')
    continue unless id
    label = if category?.label then category.label else id
    sel = if id is selected then ' selected' else ''
    html += "<option value=\"#{@escapeHtml(id)}\"#{sel}>#{@escapeHtml(label)}</option>"
  html

renderStoriesPerCategoryOptions: (selected) ->
  selected = Number(selected) or config.defaultStoriesPerCategory
  html = ''
  for n in STORIES_PER_CATEGORY_OPTS
    sel = if n is selected then ' selected' else ''
    html += "<option value=\"#{n}\"#{sel}>#{n} #{if n is 1 then 'story' else 'stories'}</option>"
  html

loadTheme: ->
  try
    stored = localStorage.getItem THEME_KEY
    return stored if stored in THEMES
  catch
    #
  config.defaultTheme

saveTheme: (theme) ->
  try
    localStorage.setItem THEME_KEY, theme
  catch
    #

loadPosition: ->
  try
    stored = localStorage.getItem POSITION_KEY
    return stored if stored in POSITIONS
  catch
    #
  'top-right'

savePosition: (anchor) ->
  try
    localStorage.setItem POSITION_KEY, anchor
  catch
    #

loadStoriesPerCategory: ->
  try
    stored = Number(localStorage.getItem STORIES_KEY)
    return stored if stored in STORIES_PER_CATEGORY_OPTS
  catch
    #
  config.defaultStoriesPerCategory

saveStoriesPerCategory: (count) ->
  n = Number(count)
  return unless n in STORIES_PER_CATEGORY_OPTS
  try
    localStorage.setItem STORIES_KEY, String(n)
  catch
    #

applyTheme: (domEl, theme) ->
  theme ?= @loadTheme()
  $root = $(domEl)
  $root.removeClass('hn-theme-dark hn-theme-light')
  $root.addClass if theme is 'light' then 'hn-theme-light' else 'hn-theme-dark'
  $root.find('[data-theme-option]').removeClass('is-active')
  $root.find("[data-theme-option=\"#{theme}\"]").addClass('is-active')

applyPosition: (domEl) ->
  anchor = @loadPosition()
  $el = $(domEl)
  x = position.x
  y = position.y
  gap = position.menuGap
  topInset = gap + y
  vh = window.innerHeight or 900
  vw = window.innerWidth or 1440
  reset =
    top: 'auto'
    right: 'auto'
    left: 'auto'
    bottom: 'auto'

  if anchor is 'top-left'
    $el.css $.extend {}, reset, top: "#{topInset}px", left: "#{x}px", transform: 'none'
  else if anchor is 'center'
    w = $el.outerWidth() or WIDGET_WIDTH
    h = $el.outerHeight() or 320
    $el.css $.extend {}, reset,
      top: "#{Math.max(topInset, Math.round((vh - h) / 2))}px"
      left: "#{Math.max(x, Math.round((vw - w) / 2))}px"
      transform: 'none'
  else
    w = $el.outerWidth() or WIDGET_WIDTH
    $el.css $.extend {}, reset,
      top: "#{topInset}px"
      left: "#{Math.max(x, Math.round(vw - w - x))}px"
      transform: 'none'

  $root = $(domEl)
  $root.find('[data-position-option]').removeClass('is-active')
  $root.find("[data-position-option=\"#{anchor}\"]").addClass('is-active')

syncCategorySelect: (domEl) ->
  $root = $(domEl)
  categories = @lastPayload?.categories
  selected = @selectedCategory ? 'all'
  if selected isnt 'all'
    found = false
    for category in categories ? []
      if String(category?.id) is String(selected)
        found = true
        break
    unless found
      selected = 'all'
      @selectedCategory = 'all'
  $root.find('[data-category-filter]').html @renderCategoryOptions(selected, categories)
  perCat = @loadStoriesPerCategory()
  $root.find('[data-stories-per-category]').html @renderStoriesPerCategoryOptions(perCat)

closeMenus: ($root) ->
  $root.find('.hn-dropdown').removeClass('is-open')
  $root.find('.hn-menu-layer').attr('aria-hidden', 'true')

renderStoryTile: (story) ->
  return '' unless story?
  href = @storyHref(story)
  categoryLabel = if story.categoryLabel then story.categoryLabel else 'News'
  catSlug = @categorySlug(story.categoryId)
  title = if story.title then story.title else 'Untitled'
  source = if story.source then story.source else 'Unknown source'
  badgeHtml = @renderStoryBadges(story)
  inner = """
    <div class="hn-tile-content">
      <div class="hn-tile-meta">
        <span class="hn-pill hn-pill--#{catSlug}">#{@escapeHtml(categoryLabel)}</span>
        <span class="hn-badge-group">#{badgeHtml}</span>
      </div>
      <h2 class="hn-headline">#{@escapeHtml(title)}</h2>
      <footer class="hn-tile-foot">
        <span class="hn-source">Source: #{@escapeHtml(source)}</span>
      </footer>
    </div>
  """
  if href
    safeHref = @escapeAttr(href)
    """
    <div class="hn-tile hn-tile--linked" role="link" tabindex="0" data-story-href="#{safeHref}" title="Open story">
      #{inner}
    </div>
    """
  else
    """
    <article class="hn-tile hn-tile--static">
      #{inner}
    </article>
    """

setStatus: ($root, state) ->
  $root.find('.hn-status-dot')
    .removeClass('is-live is-waiting is-error')
    .addClass("is-#{state}")

setUpdated: ($root, iso) ->
  label = @formatUpdatedAt(iso)
  text = if label then "Updated #{label}" else ''
  $root.find('.hn-updated').text(text)

showMessage: ($root, text, state) ->
  @setStatus $root, state
  safeText = if text? then String(text) else ''
  $root.find('.hn-body').html "<p class=\"hn-message\">#{@escapeHtml(safeText)}</p>"
  @setUpdated $root, ''

setLogo: (domEl) ->
  el = $(domEl).find('.hn-logo')[0]
  return unless el
  candidates = ["#{WIDGET_ID}/#{config.logoFile}", "#{WIDGET_ID}/logo.webp"]
  tryPath = (i) ->
    return if i >= candidates.length
    img = new Image()
    img.onload = -> el.style.backgroundImage = "url('#{candidates[i]}')"
    img.onerror = -> tryPath(i + 1)
    img.src = candidates[i]
  tryPath 0

openUrl: (url) ->
  href = @normalizeHref(url)
  return unless href
  safe = @shellEscapeUrl(href)
  @run "open '#{safe}'", ->

openStoryFromEvent: (event) ->
  $tile = $(event.target).closest('.hn-tile--linked')
  return unless $tile.length
  event.preventDefault()
  event.stopPropagation()
  href = $tile.attr('data-story-href')
  @openUrl href

renderFeed: (domEl) ->
  $root = $(domEl)
  payload = @lastPayload
  unless payload?.ok and Array.isArray(payload.categories)
    @showMessage $root, 'Signal temporarily unavailable.', 'error'
    return

  @syncCategorySelect domEl
  selected = @selectedCategory ? 'all'
  maxPer = @loadStoriesPerCategory()
  stories = if selected is 'all'
    @balancedAllStories(payload.categories, maxPer)
  else
    @storiesForCategory(payload.categories, selected, maxPer)

  if stories.length is 0
    hasCategories = payload.categories?.length > 0
    msg = if hasCategories
      'No stories in this category. Try All in Settings.'
    else
      "Waiting for Today's Signal…"
    @showMessage $root, msg, 'waiting'
    @applyPosition domEl
    return

  @setStatus $root, 'live'
  @setUpdated $root, payload.generatedAt ? payload.updatedAt

  html = '<div class="hn-story-list">'
  for story in stories
    tileHtml = @renderStoryTile(story)
    html += tileHtml if tileHtml
  html += '</div>'
  $body = $root.find('.hn-body')
  $body.removeClass('hn-body--compact')
  $body.addClass('hn-body--compact') if stories.length <= 2
  $body.html html
  @applyPosition domEl

renderMenuLayer: ->
  theme = @loadTheme()
  pos = @loadPosition()
  darkActive = if theme is 'dark' then ' is-active' else ''
  lightActive = if theme is 'light' then ' is-active' else ''
  trActive = if pos is 'top-right' then ' is-active' else ''
  tlActive = if pos is 'top-left' then ' is-active' else ''
  cActive = if pos is 'center' then ' is-active' else ''
  """
  <div class="hn-menu-layer" aria-hidden="true">
    <div class="hn-dropdown" data-menu="settings">
      <div class="hn-dropdown-label">Appearance</div>
      <button type="button" class="hn-dropdown-item#{darkActive}" data-theme-option="dark">Dark</button>
      <button type="button" class="hn-dropdown-item#{lightActive}" data-theme-option="light">Light</button>
      <div class="hn-dropdown-divider"></div>
      <div class="hn-dropdown-label">Position</div>
      <button type="button" class="hn-dropdown-item#{trActive}" data-position-option="top-right">Top Right</button>
      <button type="button" class="hn-dropdown-item#{tlActive}" data-position-option="top-left">Top Left</button>
      <button type="button" class="hn-dropdown-item#{cActive}" data-position-option="center">Center</button>
      <div class="hn-dropdown-divider"></div>
      <div class="hn-dropdown-label">Stories per category</div>
      <select class="hn-dropdown-select" data-stories-per-category aria-label="Stories per category">
        #{@renderStoriesPerCategoryOptions(config.defaultStoriesPerCategory)}
      </select>
      <div class="hn-dropdown-divider"></div>
      <div class="hn-dropdown-label">Category</div>
      <div class="hn-dropdown-note">All lanes from grouped feed</div>
      <select class="hn-dropdown-select" data-category-filter aria-label="Category">
        #{@renderCategoryOptions('all', [])}
      </select>
    </div>
    <div class="hn-dropdown" data-menu="about">
      <div class="hn-dropdown-label">HappeningNow Signal</div>
      <div class="hn-dropdown-meta">Version: v#{WIDGET_VERSION}</div>
      <div class="hn-dropdown-divider"></div>
      <a class="hn-dropdown-link" href="#" data-open-url="#{@escapeHtml(config.websiteUrl)}">Website</a>
      <a class="hn-dropdown-link" href="#" data-open-url="#{@escapeHtml(API_URL)}">API feed</a>
      <a class="hn-dropdown-link" href="#" data-open-url="#{@escapeHtml(config.githubUrl)}">GitHub</a>
      <a class="hn-dropdown-link" href="#" data-open-url="#{@escapeHtml(config.donateUrl)}">Donate</a>
    </div>
  </div>
  """

renderMenuBar: ->
  """
  <div class="hn-menu-bar">
    <button type="button" class="hn-menu-btn" data-menu-toggle="settings">Settings ▾</button>
    <button type="button" class="hn-menu-btn" data-menu-toggle="about">About ▾</button>
  </div>
  """

command: (callback) ->
  $.ajax
    url: PROXY + API_URL
    dataType: 'json'
    timeout: 12000
  .done (data) ->
    payload = if data? then JSON.stringify(data) else '{}'
    callback null, payload
  .fail (_, __, err) ->
    callback (err ? new Error('fetch failed')), '{}'

render: ->
  """
  <div class="hn-card">
    <header class="hn-header">
      <div class="hn-header-row">
        <div class="hn-brand">
          <div class="hn-logo" role="img" aria-label="HappeningNow"></div>
          <div class="hn-brand-text">
            <h1 class="hn-title">HappeningNow Signal<span class="hn-status-dot is-waiting" aria-hidden="true"></span></h1>
            <p class="hn-subtitle">Today's top intelligence</p>
          </div>
        </div>
        #{@renderMenuBar()}
      </div>
      <p class="hn-updated"></p>
    </header>
    <div class="hn-body">
      <p class="hn-message">Waiting for Today's Signal…</p>
    </div>
  </div>
  #{@renderMenuLayer()}
  """

update: (output, domEl) ->
  unless output?
    @showMessage $(domEl), 'Signal temporarily unavailable.', 'error'
    return
  try
    @lastPayload = JSON.parse(output)
  catch
    @showMessage $(domEl), 'Signal temporarily unavailable.', 'error'
    return
  @selectedCategory ?= 'all'
  @renderFeed domEl

afterRender: (domEl) ->
  @lastPayload = null
  @selectedCategory = 'all'
  @setLogo domEl
  @applyTheme domEl
  @applyPosition domEl

  $root = $(domEl)

  $root.on 'click', '[data-menu-toggle]', (event) =>
    event.stopPropagation()
    menuName = $(event.currentTarget).attr('data-menu-toggle')
    $menu = $root.find("[data-menu=\"#{menuName}\"]")
    isOpen = $menu.hasClass('is-open')
    @closeMenus $root
    unless isOpen
      $menu.addClass('is-open')
      $root.find('.hn-menu-layer').attr('aria-hidden', 'false')

  $root.on 'click', '[data-theme-option]', (event) =>
    event.stopPropagation()
    theme = $(event.currentTarget).attr('data-theme-option')
    return unless theme in THEMES
    @saveTheme theme
    @applyTheme domEl, theme

  $root.on 'click', '[data-position-option]', (event) =>
    event.stopPropagation()
    anchor = $(event.currentTarget).attr('data-position-option')
    return unless anchor in POSITIONS
    @savePosition anchor
    @applyPosition domEl

  $root.on 'change', '[data-category-filter]', (event) =>
    event.stopPropagation()
    @selectedCategory = $(event.currentTarget).val() ? 'all'
    @renderFeed domEl

  $root.on 'change', '[data-stories-per-category]', (event) =>
    event.stopPropagation()
    @saveStoriesPerCategory $(event.currentTarget).val()
    @renderFeed domEl

  $root.on 'click', '.hn-tile--linked', (event) =>
    @openStoryFromEvent event

  $root.on 'keydown', '.hn-tile--linked', (event) =>
    return unless event.key is 'Enter' or event.key is ' '
    @openStoryFromEvent event

  $root.on 'click', '[data-open-url]', (event) =>
    event.preventDefault()
    event.stopPropagation()
    @openUrl $(event.currentTarget).attr('data-open-url')

  $root.on 'click', (event) =>
    return if $(event.target).closest('.hn-menu-bar, .hn-menu-layer').length
    @closeMenus $root
