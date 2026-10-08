---
name: skill
description: An entity that describes an executable capability — a procedure an agent can apply to a filestore or its entities, with named inputs and a substrate-recorded outcome.
title: skill
---

A skill entity describes one executable capability the substrate makes available to agents.
In the [predication-fibration](predication-fibration.md) $(\mathbf{FOUR}, \mathcal{C}, E)$, skills that exist as self-describing entities are members of $E$; when they live in `governance/staff/skills/` or an equivalent path, they are substrate-visible operative elements.

A skill specifies: what it does (its goal, expressed in the description and body), what inputs it takes (arguments passed at invocation), what it produces (new entities, modified cells, witnessed events), and what substrate-recorded outcome it emits.
Skills that include scripts have a `scripts/` subdirectory containing `.mjs` files; the script is not itself a substrate entity, but the skill entity that wraps it is.

Per AgOP's agential-self-generation invariant, the executable capabilities of the substrate must be substrate entities.
A skill entity is the operative declaration that this capability exists and is available — it makes the capability accountable to the same predication-fibration algebra as everything else.
An agent cannot invoke an unrecognized capability without first making a skill entity for it.

Skills participate in the [making](../transformers/making.md) transformer: the making cell $(e, \mathtt{making}, s)$ records that entity $e$ was produced by skill $s$.
Skills also participate in [linting](../transformers/linting.md) and [auditing](../transformers/auditing.md): the conformance of a skill entity is checked against the `governance/rules/specifications/skill.md` specification.
