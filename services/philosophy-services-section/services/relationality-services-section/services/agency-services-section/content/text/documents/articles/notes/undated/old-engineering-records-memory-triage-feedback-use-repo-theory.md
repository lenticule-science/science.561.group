---

name: feedback_use-repo-theory
description: This repo has rigorous specs (FARS, work taxonomy, predication theory) that should govern agent design — don't cargo-cult external patterns
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: feedback_use-repo-theory
---

Don't import patterns from external sources (ECC, generic agent frameworks) without grounding them in the repo's own theory. The repo contains:

- **FARS** (`operations/engineering/fars/docs/terms/`) — spec for how files ARE the system
- **Work taxonomy** (`library/theories/humanities/theories/sociology/theories/work/terms/`) — process/procedure/derivation/inquiry, the four work types classified by whether meaning and execution are settled
- **Predication theory** (`library/theories/science/theories/information/texts/the-adjoint-structure-of-predication-on-bilattice-valued-fibers.md`) — frontmatter keys are predicates, predicates are residuations, this has real algebraic structure
- **Distributed relationality** (`library/theories/science/theories/relationality/docs/app/spec/distributed-relationality.md`) — distributed system spec

**Why:** The user corrected me repeatedly for writing generic ECC-derived skills when the repo's own theory is more rigorous. ECC is the conformance target for structure, but our theory governs semantics. Critically: when a field is missing (e.g., `description` on a plan), DERIVE the substitute from relational similarity in the datastore — don't hardcode fallback chains like `entity.goal || entity.description`. The predication paper's fiber functor tells you how: predicates whose fibers overlap on the same entities are relationally similar. The derivation belongs in the graph generator (build time), not in hooks (query time).

**How to apply:** Before writing any agent/skill/command, check what the library says about the concept. Query the datastore (`require('./datastore.js').load()`) for related entities. When you need a field an entity doesn't have, compute the best substitute from attribute co-occurrence in the corpus, not from type-specific hardcoded logic.
