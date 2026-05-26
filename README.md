# HappeningNowSignal

A lightweight, public [Übersicht](https://tracesof.net/uebersicht/) desktop widget for macOS that surfaces **Today's Signal** from [HappeningNow](https://happeningnow.news) — a curated, real-time news feed focused on what matters right now.

This repository contains **client/widget code only**. No backend, Supabase, Netlify, secrets, or internal APIs.

## What is HappeningNow?

HappeningNow aggregates and ranks breaking stories across categories like Technology, Business, Global, and more. The widget reads a public cached JSON feed and displays the top headlines on your desktop — category, title, source, and freshness — in a compact news-terminal layout.

**Feed:** `https://happeningnow.news/api/public/today.json`

## Install Übersicht

1. Download [Übersicht](https://tracesof.net/uebersicht/) for macOS.
2. Open the app and allow it to run (System Settings → Privacy & Security if prompted).
3. Übersicht lives in your menu bar and renders widgets on your desktop.

## Install this widget

### Option A — Clone into your widgets folder

```bash
git clone https://github.com/YOUR_ORG/happeningnow-ubersicht-widget.git
cp -R happeningnow-ubersicht-widget/HappeningNowSignal.widget ~/Library/Application\ Support/Übersicht/widgets/
```

### Option B — Manual copy

1. In Übersicht, choose **Open Widgets Folder** from the menu bar.
2. Copy the `HappeningNowSignal.widget` folder into that directory.
3. Übersicht hot-reloads widgets — the signal should appear within a few seconds.

### Position

The widget defaults to the **top-right** (`top: 24px; right: 24px`). Edit the `style` block in `index.coffee` to move it.

## Refresh interval

Default: **15 minutes** (900,000 ms).

The public feed is cached server-side, so polling every 10–15 minutes keeps network and CPU use low while staying reasonably fresh. Adjust in `index.coffee`:

```coffee
config =
  refreshMinutes: 15   # try 10–15
```

## Privacy

**Widget consumes a public cached JSON feed. No account or API key required.**

- No localStorage or persistent local data
- No tokens or credentials
- Only calls the public `today.json` endpoint via Übersicht's built-in proxy
- Clicking a story opens its URL in your default browser

## Screenshots

Add desktop captures to `screenshots/` for the README gallery.

| File | Suggested size | Description |
|------|----------------|-------------|
| `screenshots/widget-loaded.png` | **760 × 520 px** (2× retina: 1520 × 1040) | Widget with live stories |
| `screenshots/widget-empty.png` | **760 × 520 px** | Empty / waiting state |
| `screenshots/widget-error.png` | **760 × 520 px** | Error state |
| `screenshots/widget-ultrawide.png` | **1200 × 520 px** | Top-right on ultrawide |

Capture tip: hide other widgets, use a dark wallpaper, and crop to the widget plus ~40px margin.

## Customization

All options live at the top of `HappeningNowSignal.widget/index.coffee`:

```coffee
config =
  refreshMinutes: 15    # poll interval (10–15 recommended)
  maxStories: 5         # headlines shown (feed may return fewer)
  categories: []        # future v2 — e.g. ['tech', 'business', 'cyber']
```

### Refresh interval

Set `refreshMinutes` between **10** and **15**. The widget multiplies by 60,000 for `refreshFrequency`.

### Max stories

Increase or decrease `maxStories` to fit your screen. The layout scrolls when content exceeds `max-height`.

### Category filtering (future v2)

The API URL builder already supports an optional `?categories=` query when `config.categories` is populated:

```coffee
categories: ['tech', 'business', 'cyber']
```

Category filtering UI is **not implemented yet** — this is a placeholder for a future release.

### Styling

Edit `HappeningNowSignal.widget/styles.css` for colors, blur, sizing, and typography. Positioning stays in the `style` block in `index.coffee`.

## Widget preview

Dark glassmorphism panel with:

- **Header** — HappeningNow / Today's Signal + live status dot
- **Story cards** — category pill, freshness, headline, source
- **Hover** — subtle lift and border brightening
- **Click** — opens story in browser
- **Empty** — “Waiting for Today's Signal…”
- **Error** — “Signal temporarily unavailable.”

Responsive `clamp()` width works on MacBook, standard, and ultrawide displays.

## Repository structure

```
happeningnow-ubersicht-widget/
├── LICENSE
├── README.md
├── screenshots/
│   └── .gitkeep
└── HappeningNowSignal.widget/
    ├── index.coffee
    └── styles.css
```

## Requirements

- macOS with Übersicht installed
- Network access (public JSON feed only)

## License

MIT — see [LICENSE](LICENSE).

## Links

- [HappeningNow](https://happeningnow.news)
- [Public feed](https://happeningnow.news/api/public/today.json)
- [Übersicht](https://tracesof.net/uebersicht/)
