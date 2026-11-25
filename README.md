# RAZOV hub

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
| `assets/css/base.css` | Design tokens (dark and light), header, buttons, footer (same as in razov-db) |
| `assets/css/hub.css` | Hub layout, the two doors, slim footer, forwarder pages |
| `assets/js/site.js` | Theme toggle (a copy of razov-db's file; the store switches there do nothing here) |
| `assets/js/hero-network.js` | The animated network behind the hub |
| `robots.txt` | The only robots file crawlers read; lists the sitemaps of `/`, `/razov-db/`, `/razov-bots/` |
| `sitemap.xml` | Lists `/` only; each project repo has its own sitemap |

The legal links in the footer go to `/razov-db/legal.html`.

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
