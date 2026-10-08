---
name: supersedes
description: "The history morphism between specifications. Maps a spec to the prior spec it replaces. Domain: specification. Codomain: specification."
title: supersedes
---

Domain: `work/governance/rules/specifications/<slug>.md`
Codomain: `work/governance/rules/specifications/<slug>.md`

A spec R `supersedes` spec S means: R replaces S as the authoritative statement of invariants for the same subject. S is retained with `status: superseded` — the history is load-bearing for audit. The inverse predication `superseded-by` on S is the same edge read from the other direction.
