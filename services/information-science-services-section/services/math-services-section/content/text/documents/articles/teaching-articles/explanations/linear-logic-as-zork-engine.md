---
title: "Linear Logic as a Zork Engine"
description: "A research note mapping classic ZIL interactive-fiction operations to linear-resource transitions and bilattice-valued predication."
date-created: 2026-04-06
type: explanation
article-kind: application-note
project: predicated-zork-project
---

Ceptre demonstrates that interactive fiction can be implemented with linear-logic rules. The same reading maps ZIL operations to bilattice-valued fiber composition:

- `COND` becomes filtering by the result of composing predicates; the four-valued result records whether a branch is supported, refuted, unknown, or contested.
- `FSET` and `FCLEAR` become resource transitions: a rule consumes an old state proposition and produces the new one, so an open flag is not duplicated alongside its closed predecessor.
- Verb dispatch becomes message-channel matching between an action and an entity's `responds-to` predicate.
- Text output becomes response-fiber content selected by the composed action and entity predicates.
- Conditional exits become predicates gated by the state of another entity; an exit resolves only when the relevant composition supports it.
- Inventory and containment become nested fibers, while `!` marks persistent or reusable state.

This is a design hypothesis for a predicated Zork engine, not a claim that an existing ZIL interpreter has been replaced. The formal contribution is the correspondence: imperative-looking state updates can be represented as typed linear consumption and production, with bilattice values retaining uncertainty and contradiction.
