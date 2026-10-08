---
applies-to-runtimes: ["*"]
derives-from:
  - doing/working/hacking/doing/working/skills/corpus-show/SKILL.md
  - doing/working/hacking/doing/working/skills/corpus-search/SKILL.md
ordering: 150
status: active
title: Query the running engine
description: With a running engine (pyfars run .), query its API rather than re-reading files.
---

With a running engine (`pyfars run .`), query its API rather than re-reading files. The engine has the substrate loaded into a `pypredcalc.PredicationStore`; queries return cells the file-walk would have to reconstruct. The API is available over Unix Domain Socket at `.pyfars/run.sock`.

| Endpoint | Purpose |
|---|---|
| `/api/show/<slug>` | Show a single record by slug |
| `/api/context/<slug>` | Show a record with its relational context |
| `/api/search?q=<term>` | Full-text search across the substrate |
| `/api/list` | List all records |
| `/api/stats` | Substrate statistics |
