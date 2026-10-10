---
name: creating-a-work-item
description: Creates a new work-item-inhabiting record at a target path. Initializes the 3 required characteristic cells of the work-item shape and any optional cells the caller supplies. The lawful work-item creator; replaces the various making-a-task and opening-a-* hack scaffolders.
---

Run `node scripts/creating-a-work-item.mjs --target=<path> --kind=<kind> --name=<slug> --owned-by=<actor> --description="<text>" [--has-priority=<p> --has-deadline=<date> --assigned-to=<actor>]` and parse the JSON result.
