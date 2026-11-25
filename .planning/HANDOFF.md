# RAZOV.tech solutions site: handoff

Updated: 2026-11-25 (session e9b8e228-a8c9-4941-8e10-76d7177fe510)

## Where things are

- **Repo:** public `hasanradi93/hasanradi93.github.io`, branch `main`.
- **Live:** https://hasanradi93.github.io/, served by GitHub Pages from the root of `main`.
- **Paths served by other repos:**
  - `/datapilot/` comes from `hasanradi93/datapilot` (page and installer releases).
  - `/sqlnext/` will come from `hasanradi93/sqlnext`, which is not published yet and waits for the owner.
- `/schemazone/` is a build copied from the private repo `hasanradi93/schemazone` (see README, "Updating SchemaZone").

## Steps

| # | Step | State |
|---|---|---|
| 1 | One-page site: hero network, products, how-to for .sql, pricing, contact, 404 (agent) | done |
| 2 | Review: SQLNext sketch uses a documented SQLNext fix (DEFINER removed, error 1449) | done |
| 3 | Legal page and Terms, Privacy, Refunds and email in every footer (for the Paddle domain review) | done |
| 4 | SchemaZone build in `/schemazone/`; sitemap lists `/`, `/schemazone/`, `/legal.html` | done |
| 5 | Local check at 375 px: no sideways scroll, no console errors; SchemaZone sample opens | done |
| 6 | Create the public repo, push, turn on Pages, check the live URLs | next |

## Switches for later

- **Paddle store live:** set `STORE_URL` in `assets/js/site.js`.
- **SQLNext page live:** add `'/sqlnext/'` to `LIVE_PENDING_LINKS` in `assets/js/site.js`.
- **New SchemaZone version:** rebuild it and copy it into `schemazone/`.

## Open points for the owner

- Lighthouse Performance was not measured. Run PageSpeed Insights on the live URL.
- Hero numbers ("3 products, 4 SQL dialects, 2 languages, $0 to start") come from the product facts. Change them if wanted.
- `legal.html` was written from the products' facts and DataPilot's own policies. Review it before the Paddle application.
