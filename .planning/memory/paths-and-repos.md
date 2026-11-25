---
name: paths-and-repos
description: Which repository serves which path under hasanradi93.github.io (since 2026-11-25 the root is the RAZOV hub)
---

- `/` is this repo (`hasanradi93.github.io`), the small RAZOV hub with two doors.
- `/razov-bots/` is the repo `razov-bots`, the owner's agents site. Never touch it.
- `/razov-db/` is the repo `razov-db`, the database products site. Inside it:
  - `datapilot/` comes from the DataPilot session.
  - `schemazone/` is a build of the private `hasanradi93/schemazone`.
  - `sqlnext/` comes later.
- `/datapilot/` is the repo `datapilot`, now a forwarder. Its GitHub Releases stay the download source.
- `/schemazone/` and `/legal.html` are forwarders in this repo.

**Why:** GitHub serves project repos under the user site's domain, so a folder here with the same name as a
project repo clashes with it. The owner wants the root shared by all of RAZOV, and the agents site kept apart.

**How to apply:**
- Never add folders here named `razov-db`, `razov-bots`, `datapilot` or `sqlnext`.
- Never create public repos named `schemazone` or `legal`.
- Database site changes go to `razov-db`, not here.
