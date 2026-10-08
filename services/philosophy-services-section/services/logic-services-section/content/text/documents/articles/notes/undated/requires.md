---
name: requires
description: "The dependency morphism between specifications. Maps a spec to another spec that must hold for the first to be enforceable. Domain: specification. Codomain: specification."
title: requires
---

Domain: `work/governance/rules/specifications/<slug>.md`
Codomain: `work/governance/rules/specifications/<slug>.md`

A spec R `requires` spec S means: S must be active and conformant for R's invariants to be enforceable. If S is violated, R's invariants cannot be checked — R depends on S's ground being stable.

`requires` edges must not be cyclic. A dangling `requires` edge (S does not exist) is a broken DAG edge and a substrate violation.
