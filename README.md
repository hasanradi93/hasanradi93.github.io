# RAZOV.tech solutions website

The company website for **RAZOV.tech solutions**, published with GitHub Pages at
<https://hasanradi93.github.io/>. It presents the three database products:

- **DataPilot AI**: ask your company's database questions in plain words.
- **SQLNext**: convert databases between versions and engines, with every change explained.
- **SchemaZone**: see a `.sql` file as an interactive ER diagram, in your browser.

## What is in the repo

Plain static files with no framework, build step or npm:

| Path | Purpose |
| --- | --- |
| `index.html` | The one-page site |
| `404.html` | Not-found page served by GitHub Pages |
| `assets/css/base.css` | Design tokens (dark and light), layout, header, buttons, footer |
| `assets/css/sections.css` | Hero, products, sketches, how-to, pricing, contact |
| `assets/js/site.js` | Theme toggle, mobile menu, reveals, tabs, copy buttons, store link |
| `assets/js/hero-network.js` | The animated database network on the hero canvas |
| `assets/img/` | Logo mark and social images |
| `legal.html` | Terms, privacy and refunds for the company (linked in every footer) |
| `schemazone/` | The built SchemaZone app; do not edit by hand |

`/datapilot/` and `/sqlnext/` are served by their own public repositories (`hasanradi93/datapilot`, and later
`hasanradi93/sqlnext`). Never add folders with those names here.

## Updating SchemaZone

The source is in the private repo `hasanradi93/schemazone`. To publish a new version:

```sh
cd ../SchemaZone && npm test && npm run build:site
rm -rf ../razov-site/schemazone && mkdir ../razov-site/schemazone && cp -r dist/* ../razov-site/schemazone/
```

Then commit and push this repo.

## Preview locally

```sh
python -m http.server 8077
```

Then open <http://localhost:8077/>. Links to `/datapilot/` and `/schemazone/`
only work on the live site.

## Switching things on later

- **Store:** set `STORE_URL` at the top of `assets/js/site.js` to an `https://` URL.
  The store button appears and the paid DataPilot plans change from
  "Contact us to buy" to "Buy".
- **SQLNext product page:** add `'/sqlnext/'` to `LIVE_PENDING_LINKS` in
  `assets/js/site.js`. Every element with `data-link-pending="/sqlnext/"`
  turns into a real link.

## Notes for editors

- Colours, fonts and spacing are CSS custom properties at the top of
  `assets/css/base.css`, with a dark set (default) and a light set.
- Sections inside `<main>` use `content-visibility: auto` so the first paint
  stays fast. Same-page links render everything first, so jumps stay exact.
- Product visuals are illustrative SVG/CSS sketches, not screenshots.
- Animations stop when `prefers-reduced-motion: reduce` is set.
