---
type: narrative
status: current
recaps: [dispatch, skill, office]
introduces: []
title: Dispatch from properties, not categories
description: The recurring failure mode of multi-agent systems is dispatch by category.
---

# Dispatch from properties, not categories

The recurring failure mode of multi-agent systems is dispatch by category.
Each agent is declared to be a kind of thing — `code-reviewer`, `planner`, `architect`, `database-expert` — and the dispatcher matches incoming work to these declared kinds by keyword overlap, prompt classification, or hardcoded routing rules.
The category is the dispatch surface; the agent's actual capabilities are whatever the category implies, plus whatever its current model and tool set happen to support.

This shape has three failure modes that compound:

- **Drift between declared kind and actual capability.** An agent declared `code-reviewer` may have its tool set narrowed (no test runner, no static-analysis tool); the category continues to attract review work, but the agent's capability has eroded under the label.
- **Compositionality breaks at the category boundary.** When work needs both review and migration help, the dispatcher has to choose one category.
  The agents on either side of the boundary may be partial matches, but the category-shaped dispatcher has no way to combine them.
- **Adding capabilities is a code change.** A new dispatch-relevant property of an agent (it now reads telemetry, it now has access to a new repository) requires updating the category catalog or the dispatch rules.
  The properties live in code, not in the substrate.

Software prior art that does dispatch well does it from properties.
Open-ended skill libraries with semantic indexing match by description fibers, not by declared skill categories.
Code-aware coding assistants rank by graph-structural relevance over a definition-reference graph, not by pre-declared agent kinds.
Simulation games dispatch work to colonists by per-work-type priority and currently-relevant skill, not by character class.
Deeply-modeled simulations don't code "this material cuts that material" — they encode material hardness and tissue resistance, and the cutting behavior emerges from the property composition.
Every well-engineered dispatch in adjacent systems converges on the same shape: dispatch is a composition over properties, not a lookup over categories.

The substrate's response is to make dispatch *the same kind of thing as every other substrate operation*.
Per [dispatch](../teaching/explanations/dispatch.md), an agent is what its predications say it is.
Its capability is a set of capability predications on the agent entity.
A message's required-capabilities are predications on the message entity.
The dispatch operator composes the two fibers and returns a match-strength value.
No category lookup.
No prompt classification.
The substrate's algebra evaluates the match.

The pattern's load-bearing detail is that dispatch ranking uses *composition*, not *restriction*.
Composition surfaces mismatch as an explicit value: when one side carries a capability the other lacks, the composition records the gap.
Restriction washes mismatches toward "consistent with no opinion" — the dispatcher loses the engineering signal it needs to rank candidates.
Per [dispatch](../teaching/explanations/dispatch.md), this is not a casual choice; it is the difference between a dispatcher that ranks usefully and one that ranks unstably.
A dispatch operator that uses restriction will, in practice, score random matches as equally valid, because the substrate's value-domain treats unknowns as compatible with everything.
The composition operator preserves the distinctions the dispatcher needs.

Several engineering consequences follow:

- **New capabilities are predication edits.** Adding a capability predication to an agent makes it eligible for new work-types on the next dispatch cycle.
  There is no category catalog to update, no dispatch rule to recompile.
- **Partial matches are first-class.** When no agent fully satisfies a message's required-capabilities, the dispatcher can compose across agents — handing parts of the work to different agents whose composed capability covers the whole.
  The category-shaped dispatcher cannot do this; the property-shaped dispatcher does it by the substrate's same join operation.
- **Re-dispatch on failure carries the diagnosis.** When an agent fails on a work-item, the failure produces a [failure-diagnosis](../../failure-diagnosis/failure-diagnosis.md) predication on the work entity.
  Subsequent dispatch composes the failure predicate with candidate agents' capabilities; agents whose capability fiber would have produced the same failure are now ranked lower, agents whose capability is exactly what the failure diagnosis suggests are ranked higher.
  The diagnosis is substrate content, not a separate retry-policy.
- **Dispatch decisions are auditable.** Per [witness](../../../teaching/explanations/witness.md), every dispatch produces a witness recording the message, the candidate set, the match-strengths, and the chosen agent-skill pair.
  The audit trail covers dispatch as a first-class operation; reconstructing past dispatch behavior is reading past substrate state.
- **Authority constraints compose into dispatch.** When dispatch is a fiber composition, the agent's [authorization](../../governance/authorization/authorization.md) fiber composes alongside its capability fiber.
  An agent that *could* handle a message but is *not authorized* to handle it produces a different match-strength than an agent that lacks the capability outright.
  The dispatcher does not need a separate authorization check; the substrate's composition does both at once.

A second engineering refinement is *dependency-derived relevance*.
When multiple agents are eligible matches, the substrate can rank them by how connected they are to the message's neighborhood — counting inbound dependency predications, weighting by the structural weight of the connected entities.
This is a graph measurement, not a category lookup, and it is local to the candidate set's neighborhood (per [wavefront](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/wavefront.md), no global graph computation is required).
Particular platform realizations may use this as one input to dispatch ranking; the substrate-level claim is that the signal is computable from substrate content alone.

The discipline's hard edge is its insistence that capability is *not* a label.
An agent declared with `type: code-reviewer` and no further capability predications carries one predication: a label.
Dispatch composing a message's required-capabilities against this agent finds nothing to compose with — the agent has no offered-capability predications.
The dispatcher correctly cannot rank this agent against anything, and the substrate surfaces this as vocabulary debt: the agent's capability fiber needs predications declaring what it can actually do, in shared vocabulary with the messages it expects to handle.

The pattern composes with [office](../teaching/explanations/office.md) (an office's authority is a capability fiber on the office entity), with [skill-position](../../skill/skill-position/skill-position.md) (a skill's preconditions are predications on the skill entity that compose against the work-item's content), and with [federation](../teaching/explanations/federation.md) (cross-substrate dispatch composes the message's required-capabilities against the foreign substrate's offered-capabilities, with bridges translating vocabulary at the boundary).
None of these requires a separate dispatcher; each is the same substrate composition applied at a different boundary.
