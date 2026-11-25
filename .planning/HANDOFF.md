# RAZOV hub (root site): handoff

Updated: 2026-11-25 (session e9b8e228-a8c9-4941-8e10-76d7177fe510)

## Where things are

- **Repo:** public `hasanradi93/hasanradi93.github.io`, branch `main`. GitHub Pages serves the root of `main`.
- **Live:** https://hasanradi93.github.io/ is the small RAZOV hub with two doors:
  - Razov Bots, `/razov-bots/`, repo `razov-bots`. The owner's agents site. Never touch it from here.
  - Razov DB, `/razov-db/`, repo `razov-db`. The database products site, with `datapilot/` and `schemazone/`
    inside it, and `sqlnext/` later.
- **Forwarders here:** `/schemazone/` goes to `/razov-db/schemazone/` and keeps the hash. `/legal.html` goes to
  `/razov-db/legal.html` and keeps the hash.
- **Forwarders elsewhere:** `/datapilot/` (repo `datapilot`) goes to `/razov-db/datapilot/` and keeps `?lang`
  and the hash. The DataPilot session made it.

## Owner decision, 2026-11-25 ~11:50 (relayed by datapilot-ai-e5)

The owner said: "there the agents site on https://hasanradi93.github.io/ so dont' kill it, keep the new
Sites of DBs Apps seperated udner on name site after https://hasanradi93.github.io/". The owner then chose:
- The database site moves to `/razov-db/`.
- All three app pages live inside it.
- The root becomes a small hub with two doors, legal links pointing to `/razov-db/legal.html`, and the email.
- The old `/schemazone/` and `/legal.html` become forwarders.

## Steps

| # | Step | State |
|---|---|---|
| 1–6 | Database site built, published at the root, legal page, SchemaZone, live checks | done, then moved |
| 7 | Database site moved to the new repo `razov-db` (history kept), live at /razov-db/ | done 2026-11-25 |
| 8 | Root turned into the hub; old SchemaZone build, sections.css and og-image removed; 404 rewritten | done 2026-11-25 |
| 9 | Forwarders `/schemazone/` and `/legal.html` keep the hash (checked locally: a saved Zone opened from the old link) | done 2026-11-25 |
| 10 | robots.txt lists the sitemaps of `/`, `/razov-db/` and `/razov-bots/` | done 2026-11-25 |
| 11 | Push and live check (542f8f9): /, /legal.html, /schemazone/, robots, sitemap 200; unknown path gives the hub 404; doors and legal links checked in Chrome; no console messages | done 2026-11-25 |
| 12 | SQLNext door wording: "move a MySQL database to a newer version" (1.0 is MySQL-only) | done 2026-11-25 (c69f7c0) |
| 13 | Brand (owner, done by datapilot-ai-8d): "RAZOV.tech solutions" header with a light star, the hub's own graphite background with two lit doors (teal Bots, violet DB), Anybody + Readex Pro from `assets/fonts/`; the canvas, `hero-network.js` and `site.js` removed (no script, dark only); 404 and forwarders restyled | done 2026-11-25 (fd8d126) |

## Brand (since 2026-11-25)

See README, "Brand". In short: one razov.tech family. The hub reads "RAZOV.tech solutions" with a light star.
Razov Bots reads `razov.tech ↳ bots` (teal) and Razov DB reads `razov.tech ↳ db` (violet). Each door shows its
line's lockup.

## Open points for the owner

- The hub has no social preview image (`og:image`). Add a 1200×630 razov.tech image later if wanted.
- The hub's headline, "Software that talks to your customers and works with your data", and its door texts
  come from each site's own description. Change them if wanted.
- If Razov Bots gets its own terms page, point the hub's footer links to a page that covers both product
  lines.
