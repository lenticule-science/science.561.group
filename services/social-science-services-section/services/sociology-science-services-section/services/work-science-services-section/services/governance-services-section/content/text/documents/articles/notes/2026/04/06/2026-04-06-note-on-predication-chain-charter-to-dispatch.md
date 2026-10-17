---
title: "Predication Chain: Charter to Dispatch"
description: Explains how respond() calls compose entity fibers through the charter-to-dispatch chain and identifies predicate enrichment as the key work.
date-created: 2026-04-06
type: note
name: predication-chain-charter-to-dispatch
keywords:
  - predication-chain
  - fiber-composition
  - respond-calls
  - dispatch-computation
  - predicate-enrichment
specialization: idea
source: first-officer-insight-from-captain-guidance
serves: [system-architecture-refactor, operations-loop, work-management-parity]
aliases:
  - The charter-to-dispatch chain is algebraically composable via respond()
in-service-of: lib/emsenn/services/561-group/services/561-group-services-section
---

The entire chain from charter to dispatched session is a sequence of respond() calls — each level's entity fiber composing with the next via ⊙/⇒. No special-purpose code at any level. The same algebra handles every transition.

The chain:

1. respond(ship, "what goals serve the function?") — ship fiber has ⟨ship, function, X, t⟩, goals have ⟨goal, serves, function, t⟩. Extending ⊙ composes ship-function with goal-serves.

2. respond(goal, "what objectives are decidable?") — goal fiber has ⟨goal, aim, X, t⟩, objectives have ⟨objective, target, Y, t⟩ and ⟨objective, deadline, Z, t⟩. Restricting ⇒ asks what the goal can conclude about each objective.

3. respond(objective, "what projects advance this?") — composes down to projects.

4. respond(project, "what plans are active?") — composes down to plans.

5. respond(plan, "what tasks are ready?") — plan fiber has dependency ordering, tasks have ⟨task, depends-on, X, t⟩ and ⟨task, status, Y, t⟩. Restricting ⇒ computes readiness from dependency satisfaction.

6. respond(office, task) — THE dispatch computation. Office-fiber ⊙ task-fiber: what's true of the combination? Office-fiber ⇒ task-fiber: given what the office knows (capabilities), what can it conclude about the task (requirements)? Result in {⊥, t, f, ⊤}.

Each entity at each level IS its predicates (Curry-Howard-Lambek: propositions = types = terms). The predicates ARE the term language. There is no separate vocabulary to define. What matters is that entities have ENOUGH predications for the algebra to produce non-⊥ results at each level.

Our entities are currently thin — most queries produce ⊥ (unknown) because the fibers don't have enough predicates. The work is enriching entities with atomic predications so the algebra composes through the full chain. Not creating new record types or meta-layers — adding predicates to existing entities.

Every frontmatter triple, no matter how fragmentary, is already valid in the algebra. It just has limited meaning. Enrichment increases meaning by increasing the fiber's predicate count, which increases the non-trivial results ⊙/⇒ can produce.
