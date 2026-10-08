---
name: project_mash-engine-rename
description: mash-engine binary renamed to mash-engine — Cargo package was already mash-engine, binary now matches
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: project_mash-engine-rename
---

The mash-engine binary is being renamed to mash-engine. The Cargo package was already named mash-engine; only the binary name and all command references needed updating.

**Why:** mash-engine was an internal codename. mash-engine reflects what it is — the MASH (Multi-Agentic Semiotic Hub) runtime engine.

**How to apply:** Use mash-engine in new code and documentation. A symlink from mash-engine → mash-engine exists for backwards compatibility during transition. Session 2364b2d8 is handling the rename.
