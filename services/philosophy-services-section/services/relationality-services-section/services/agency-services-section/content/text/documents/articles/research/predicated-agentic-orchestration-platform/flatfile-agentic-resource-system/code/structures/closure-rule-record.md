---
name: closure-rule-record
description: Closure rule record
type: definition
class: record
instantiates: [closure-rule-record]
depends-on: [closure-rule, fiber, four-layer-rule-architecture]
see-also: [closure-rule-system, settle, repair]
title: closure-rule-record
---

# Closure rule record

The substrate-record carrying one closure rule at the entity-fiber layer of the [four-layer rule architecture](../../architecture/four-layer-rule-architecture/four-layer-rule-architecture.md): the substrate-resident entity whose fiber declares *what* the rule checks, *what* it concludes when matched, and *how* failures are handled.
A `ClosureRuleRecord` is FARS's realization of the parent-theory's [`closure-rule-record`](../../../../../objects/closure-rule-record.md), specialized to the four-valued bilattice value-domain.

A `ClosureRuleRecord` is not a piece of code.
It is a substrate entity whose fiber the realization's stepping map $\gamma_t$ reads and acts on.
Two realizations that share the same rule records and have correct stepping maps produce byte-identical substrate behavior on the same inputs.

## Required fields

Every conforming realization SHALL hold, for each `ClosureRuleRecord`:

- **`name`** — the rule's canonical identifier within its rule system.
  Used in witnesses and diagnostics for citing which rule fired.
- **`premise`** — the predication pattern matched against the substrate.
  May be a single-fiber pattern (cells the rule expects on one entity), a multi-fiber pattern (cells across two or more adjacent entities), or a substrate-level pattern (e.g., "every entity carrying `kind: theorem` SHOULD also carry `status`").
  The premise's expressiveness is constrained by the rule's `match-radius`.
- **`conclusion`** — the predication pattern produced when the premise matches.
  Cells (with their value-domain values) the rule contributes to the substrate.
  May produce single-fiber additions (a derived cell on the matched entity), multi-fiber additions (cells on multiple entities), or new entities (with `apply-edit`-shape conclusions).
- **`match-radius`** — the bound on how many predications and how many neighbor-fibers the rule reads.
  Single-fiber rules have radius 1; rules that traverse one relation hop have radius 2; rules that traverse two hops have radius 3.
  The radius bounds the rule's locality cost: the substrate's working memory during settle is the union of radius-bounded neighborhoods.
- **`severity`** — `error` | `warning` | `info`.
  Informs how `$\top$`-cells produced by this rule are surfaced: `error` blocks the containing operation; `warning` records a diagnostic but admits the operation; `info` records the diagnostic without escalation.
- **`repair-catalog-entry`** — optional.
  The repair recipe to invoke when this rule produces $\top$.
  References a [repair](../../../../teaching/explanations/repair.md) record.
  If absent, a $\top$-producing rule simply records the contradiction; if present, the repair is invoked per the substrate's repair discipline.
- **`alternatives`** — optional list of `ClosureRuleRecord` references.
  Per the Voyager re-dispatch pattern: if the primary rule's premise matches but its conclusion produces $\top$ (an unresolvable contradiction), the substrate may fall back to an alternative rule whose conclusion is admissible.
  The alternatives list is in priority order.
- **`description`** — human-readable note declaring the rule's purpose.
  Provenance only; not part of `premise`/`conclusion` matching.
- **`provenance`** — for each premise/conclusion cell, the source: which interpretation rule produced it, which substrate edit introduced it.
  Used in witnesses for replay verification.

## Invariants

- **Substrate entity.** A `ClosureRuleRecord` SHALL be a substrate entity, not realization-side code.
  Its fiber is the rule's substrate-resident statement.
- **Bounded match-radius.** The `match-radius` SHALL be finite and explicitly declared.
  Rules with unbounded radius (matching against the global substrate) are non-conformant; per the upstream [unbounded-radius-rules](../../../../questions/unbounded-radius-rules.md) question, FARS commits to bounded-radius for v0.1.0 of the spec.
- **Side-effect-free in matching.** Evaluating a rule's premise SHALL NOT mutate the substrate.
  Premise matching is a fiber-restriction operation per [`restrict`](../transformers/restrict.md); it produces a Boolean-equivalent ($t$/$f$/$\top$/$\bot$) value indicating match strength but produces no events.
- **Conclusion-explicit.** A rule's conclusion SHALL be a predication pattern, not a procedural callback.
  Rules cannot escape the algebra to do arbitrary work; their effect is fully captured by the conclusion fiber.
- **Witness-cited.** Every closure-rule application produces a witness citing the `ClosureRuleRecord`'s canonical hash.
  An auditor replaying the witness SHALL be able to find the rule by hash and re-evaluate.

## How rules compose

Rules compose under the substrate's value-domain.
When two rules' premises both match the same substrate state, both rules fire, and their conclusions compose pointwise via [`compose`](../morphisms/compose.md).
Concordant conclusions ($t$ from both rules at the same cell) sustain $t$; discordant conclusions ($t$ from one rule, $f$ from another) produce $\top$ — a substrate-visible contradiction the repair catalog or a downstream rule can address.

Rules SHALL NOT have ordering constraints among themselves; the substrate's [determinism](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/determinism.md) discipline orders rule firings within a settle layer by canonical hash, not by author-declared priority.
Rule designers who want priority encode it in the premise pattern (more specific premises naturally fire when their conditions hold; the substrate doesn't need a priority slot).

## What a `ClosureRuleRecord` is not

- **Not a callback.** A rule does not invoke a function.
  Its effect is a predication-pattern conclusion that the substrate's $\gamma_t$ stepping map composes into the substrate.
- **Not a constraint in the schema sense.** Constraints in schemas reject candidates; rules in FARS *participate in the algebra*.
  A constraint-shaped rule produces $\top$ on violation, which the substrate then reads as a substrate-visible contradiction (per [validation-as-settlement](../../settlement/validation-as-settlement/validation-as-settlement.md)) — distinct from "the candidate is rejected" because the contradiction is recorded and the substrate's repair catalog can address it.
- **Not a hook.** Hooks fire on external events (file edits, CLI invocations); rules fire on substrate state.
  A hook that fires on a file edit and produces a substrate event is a *protocol adapter* for rule firing per the [four-layer architecture](../../architecture/four-layer-rule-architecture/four-layer-rule-architecture.md), not a rule itself.

## Position

`ClosureRuleRecord` is the layer-1 substrate entity in the [four-layer rule architecture](../../architecture/four-layer-rule-architecture/four-layer-rule-architecture.md).
It is what humans and agents author when they want the substrate to enforce, derive, or check something.
The realization's stepping map $\gamma_t$ reads `ClosureRuleRecord` fibers and produces substrate effects per the rule's premise and conclusion.

Multiple `ClosureRuleRecord`s organize into a [`ClosureRuleSystem`](closure-rule-system.md) — the versioned collection that [`settle`](../transformers/settle.md), [`respond`](../transformers/respond.md), [`apply-edit`](../transformers/apply-edit.md), and [`dispatch`](../morphisms/dispatch.md) cite as the active rule set at a scope.
