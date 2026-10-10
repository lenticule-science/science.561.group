---
name: closure-position
description: A four-valued enumeration of settlement-grades — the joint (σ-fixed?, Δ-fixed?) closure-status of the work-graph an entry occupies. Carried by skills as has-closure-position; carried by work as work-type.
specializing: computer-operating-system
enumerates:
  - derivation
  - procedure
  - process
  - inquiry
references:
  agentive-triad-study:
    class: internal
    path: doing/working/hacking/doing/working/planning/library/project/library/realigning-the-repository-layout/study-notes/agentive-triad.md
---

A **closure-position** is one of the four corners of the joint (σ-fixed?, Δ-fixed?) settlement-status enumeration.
The four corners are derived from the agentive-triad's two doing-act nuclei — the σ-nucleus (knowledge-axis closure-2-monad nucleus, produces stratum-1 σ-saturated atoms) and the Δ-nucleus (truth-axis bilattice-stabilization nucleus, produces stratum-2 Δ-settled atoms) — per the [agentive-triad study notes](../../../../../../../../../../doing/working/hacking/doing/working/planning/library/project/library/realigning-the-repository-layout/study-notes/agentive-triad.md).

## The four corners

| Closure-position | σ-fixed? | Δ-fixed? | Meaning settled? | Execution settled? |
|---|---|---|---|---|
| `derivation` | yes | yes | no (output not pre-specified) | yes (the rules force it) |
| `procedure` | yes | no | yes (output described in advance) | no (each run may differ in detail) |
| `process` | no | no | yes | yes |
| `inquiry` | no | no | no | no |

The σ-fixed and Δ-fixed columns name the closure-grade derived from the agentive-triad nuclei; the meaning-settled and execution-settled columns name the same enumeration as it appears on work-items per [the work structure](../work/work.md).
Both readings name the same four corners — the closure-position enumeration is a single mathematical object viewed from either the doing-act side (σ/Δ nuclei) or the work side (meaning/execution).

## Same enumeration on skills and work

The closure-position cell appears in two characteristic predication-shapes:

- On a **skill**: `has-closure-position(skill, closure-position)`.
  Per [the skill structure](../../../agentic-systems/library/skill/skill.md), a skill's closure-position names the settlement-grade of the work the skill produces.
- On a **work**: `work-type(work, closure-position)`.
  Per [the work structure](../work/work.md), a work's work-type names the corner it occupies.

A dispatch matches a skill to a work only when their closure-positions agree.

## Distinguishing predication-shape

- `enumerates` is the structure-level cell naming the four members.
- The four substructures (derivation, procedure, process, inquiry) each carry their own characterization of which closure-corner they occupy.

## Why one parent rather than four standalone

The four corners are not independent objects; they are the four points of a 2×2 product (σ-fixed × Δ-fixed).
The parent closure-position structure carries the product's identity and the joint enumeration; the four substructures carry the corner-specific characterizations.
Treating them as four standalone roots would lose the structural fact that they jointly enumerate one set.
