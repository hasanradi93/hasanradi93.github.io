# RAZOV.tech solutions hub

The root page of <https://hasanradi93.github.io/>, published with GitHub Pages. It is one simple page with two
doors:

- **Razov Bots**: <https://hasanradi93.github.io/razov-bots/>, AI assistants that answer, book and sell on
  Telegram. Its own repo `hasanradi93/razov-bots`; nothing here changes it.
- **Razov DB**: <https://hasanradi93.github.io/razov-db/>, the database products DataPilot AI, SchemaZone and
  SQLNext. Its own repo `hasanradi93/razov-db`.

Until 2026-11-25 this repo held the database site itself. Its history continues in `razov-db`.

## What is in the repo

| Path | Purpose |
| --- | --- |
| `index.html` | The hub page |
| `404.html` | Not-found page for paths that no project repo serves (uses `/...` paths on purpose) |
| `legal.html` | Forwarder to `/razov-db/legal.html`; keeps `#terms`, `#privacy`, `#refunds` |
| `schemazone/index.html` | Forwarder to `/razov-db/schemazone/`; keeps the `#/zone/<id>` hash |
| `assets/css/base.css` | Fonts, tokens (graphite, dark only), the brand header, buttons, footer |
| `assets/css/hub.css` | The hub's own background, the two lit doors, forwarder pages |
| `assets/fonts/` | Anybody and Readex Pro, the razov.tech brand fonts (SIL OFL, see `OFL.txt`) |
| `assets/img/` | The star mark (`logo-mark.svg`, used by the JSON-LD) and the apple-touch icon |
| `favicon.svg` | The star mark on a rounded square, light on graphite |
| `robots.txt` | The only robots file crawlers read; lists the sitemaps of `/`, `/razov-db/`, `/razov-bots/` |
| `sitemap.xml` | Lists `/` only; each project repo has its own sitemap |

The page has no script. The legal links in the footer go to `/razov-db/legal.html`.

## Brand

The razov.tech brand is shared with Razov Bots and Razov DB: the eight-point star (the `#star` symbol at
the top of each page), Anybody for the brand and headings, Readex Pro for text. Here, at the parent, the
header reads **RAZOV.tech solutions** with a light star; Razov Bots reads `razov.tech ↳ bots` with a teal
star and Razov DB `razov.tech ↳ db` with a violet one. Each door on the hub shows its line's lockup.

The hub's background is its own: a calm graphite room, and each door a large panel lit from within by its
line's colour (teal for Bots, violet for DB). CSS only, and still when the visitor prefers reduced motion.
When the razov.tech domain is live, the `razov.tech` links in Razov DB's header change to `https://razov.tech`.

## Rules

- Never add folders named `razov-db`, `razov-bots`, `datapilot` or `sqlnext` here. A project repo of the same
  name serves that path, and a folder here would clash with it.
- Never create public repos named `schemazone` or `legal`. `/schemazone/` is a forwarder folder here.
- Saved SchemaZone Zones live in the browser's localStorage for `hasanradi93.github.io`, so they survive the
  move from `/schemazone/` to `/razov-db/schemazone/`.

## Preview locally

From the parent folder that holds both `razov-site` and `razov-db`:

```sh
python -m http.server 8078
```

Then open <http://localhost:8078/razov-site/>. The Razov DB door and the forwarders work there, because
`/razov-db/` exists in that folder. The Razov Bots door works only on the live site.
