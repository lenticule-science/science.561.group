---
title: "Seed charter clauses"
description: "Which charter clauses become substrate-checkable closure rules first."
kind: question
status: open
---


[apps/governance.md](../specs/apps/governance.md) commits to the charter as a substrate entity with clauses-as-closure-rules.
The captain has many charter clauses; which become substrate-checkable first?

## Categories of clause

- **Function commitments** — what the ship serves (Black Liberation, Indigenous Sovereignty).
  Hard to make substrate-checkable directly; possibly machine-suggestible, captain-judged.
- **Operational disciplines** — "agents must dispatch through the planner; no direct work assignment without dispatch."
  Substrate-checkable: closure rule on session-start.
- **Resource policies** — "expenses against the operations account require captain approval."
  Substrate-checkable: closure rule on transaction posting.
- **Authorship rules** — "publications under a persona must include the persona's commitment statement."
  Substrate-checkable: closure rule on persona-publication route.
- **Federation rules** — "peer events from `<peer>` are subject to `<scope>` filtering."
  Substrate-checkable: closure rule on federation receive.

## Captain's view

The captain prioritizes clauses based on:

- Frequency of violation (rules that catch real misalignments are higher priority than aspirational ones).
- Cost of violation (expensive mistakes catch first).
- Ease of substrate expression (some clauses defy machine-checkability; defer to manual review).

A first set of 3–5 seed clauses is enough for plan 15.
The captain picks.

## Resolution

The captain answers; plan 15 implements the chosen clauses' closure rules.

## Options

Three captain-decidable seed-set options, scored on substrate-checkability surface, captain-attention required, false-positive risk, and v0.7 productivity-stack coverage.
Default disposition: `defer-to-v0.7-charter-app` (the seed set lands at the v0.7 governance-app slice that authors [`specs/apps/governance.md`](../specs/apps/governance.md)'s charter surface; the option-set is named here so the captain can pre-pick).

### Option E — operations-first seed (3 clauses)

Three operational-discipline clauses become substrate-checkable closure rules first:

1. **Dispatch discipline.** "Agents must dispatch through the planner; no direct work assignment without dispatch."
  Closure rule on session-start checks the session's `(session, dispatch-source, *)` cell exists.
2. **Spec-edit gate.** "Source-tree edits to specs require a paired test-fixture per [`fixture-authoring-paired-task.md`](../decisions/fixture-authoring-paired-task.md)."
  Closure rule on commit-record asserts paired-fixture cell.
3. **Capability-rotation cadence.** "Long-lived capabilities are rotated per [`security/capability-model.md`](../specs/security/capability-model.md) cadence."
  Closure rule on capability-grant emits a `(capability:<id>, expires-at-ord, <ord>)` cell.

- **Substrate-checkability surface.** All three reduce to single-premise closure rules over existing substrate cells; no new schema.
- **Captain-attention to seed.** Lowest — three clauses, all written down already in operational decisions.
- **False-positive risk.** Lowest — the rules are checks on substrate state already authored.
- **v0.7 productivity-stack coverage.** Adequate — operations is one of three v0.7 surfaces (operations, governance, persona); this option seeds operations.
- **Best when.** The captain wants the seed set to validate the closure-rule mechanism on operationally-mature clauses before exposing the mechanism to charter clauses with policy controversy.

### Option F — governance-first seed (4 clauses)

Four resource/authorship/federation clauses become substrate-checkable closure rules first:

1. **Operations-account approval.** "Expenses against the operations account require captain approval per [`governance/budget.md`](../specs/governance/budget.md)."
  Closure rule on transaction-posting checks `(decision:<approval>, decided-by, captain) = t`.
2. **Persona-publication discipline.** "Publications under a persona must include the persona's commitment statement."
  Closure rule on persona-publication asserts `(publication:<id>, includes-commitment, *) = t`.
3. **Federation receive scope.** "Peer events from `<peer>` are subject to `<scope>` filtering per the regime-meet at handshake."
  Closure rule on federation-receive (the [`specs/network/network-algebraic-contract.md`](../specs/network/network-algebraic-contract.md) §1.3 invariant).
4. **Decision-record provenance.** "Every charter-amending decision-record cites the prior decision-record it amends per [`hierarchy-and-supersession.md`](../specs/_patterns/hierarchy-and-supersession.md)."
  Closure rule on decision-record append checks `supersedes` field.

- **Substrate-checkability surface.** All four reduce to single-premise closure rules; one (decision-record provenance) extends an existing pattern.
- **Captain-attention to seed.** Medium — four clauses, two require the captain to specify the per-persona commitment statement and the per-peer scope filter.
- **False-positive risk.** Medium — federation-receive scope is sensitive to peer-relationship state and may surface false `PCC_FEDERATION_REGIME_MISMATCH` rejects on under-specified scope cells.
- **v0.7 productivity-stack coverage.** Best — covers governance and federation, the two v0.7 surfaces with highest charter-clause density.
- **Best when.** The captain wants the seed set to demonstrate the substrate's governance-discipline at v0.7, accepting the medium-attention cost of seeding peer-scope cells.

### Option G — function-commitment seed (5 clauses, captain-judged)

Five function-commitment clauses are seeded as **captain-judged** rather than substrate-checkable: the substrate emits a `(action:<id>, may-violate, charter:<clause>) = candidate` witness when the agent infers a possible violation; the captain reviews and resolves per [`specs/_patterns/witness-lifecycle.md`](../specs/_patterns/witness-lifecycle.md).

1. **Black Liberation.** "Substrate actions that conflict with Black Liberation function commitment are flagged for captain review."
2. **Indigenous Sovereignty.** Same shape, different function commitment.
3. **Anti-extraction.** "Substrate actions that extract value from non-consenting parties are flagged."
4. **Non-Western preservation.** "Substrate actions that collapse non-Western/non-Boolean discipline are flagged."
5. **Trust-non-erosion.** "Substrate actions that erode federation trust without explicit captain ratification are flagged."

- **Substrate-checkability surface.** Captain-judged, not substrate-checkable directly.
  The closure rule on action-emission checks the agent's per-action `infer-charter-conflict` step's output and emits a witness; captain resolution is the lifecycle's `proposed → resolved` transition with `kind: captain-judged`.
- **Captain-attention to seed.** Highest — five clauses, each requires the captain to author the inference heuristic the agent uses for `may-violate` candidate generation.
- **False-positive risk.** Highest — the inference heuristic is captain-authored prose; the substrate cannot validate it; false positives are reviewed-and-discarded by the captain at lifecycle resolution.
- **v0.7 productivity-stack coverage.** Forward-looking — function commitments are the substrate's normative ground but their substrate-mediated enforcement is v0.7+ work; the seed validates the *pattern*, not the *content*.
- **Best when.** The captain wants the seed set to validate that the substrate can *carry* function commitments as first-class records (with witness-lifecycle resolution), even when their substrate-checkability is partial.

### Comparison

| Dimension | E. operations | F. governance | G. function-commitment |
|---|---|---|---|
| Clauses | 3 | 4 | 5 |
| Substrate-checkability | full (closure rules) | full (closure rules) | partial (captain-judged) |
| Captain-attention to seed | low | medium | high |
| False-positive risk | low | medium | high |
| v0.7 surface coverage | operations | governance + federation | function-commitment ground |
| Discipline preserved | dispatch-as-substrate | resource/authorship-as-substrate | charter-as-witness-source |
| Western default refused | manual-process oversight | per-action audit-log | aspirational-clause prose |

### Recommended-for-captain ordering

The agent's recommended evaluation order, **conditional on the captain's appetite for inference-heuristic authoring**:

1. **E (operations)** as the v0.7 *first* seed pass.
  Lowest captain attention; validates the closure-rule mechanism on three already-authored disciplines.
  After this seed clears, F is the natural next pass.
2. **F (governance)** as the v0.7 *second* seed pass.
  Adds governance/federation clauses; captain-attention cost is medium; coverage is best.
3. **G (function-commitment)** as the v0.7+ *forward* seed pass.
  Highest captain-attention cost; substrate-checkability is partial; the captain authors the inference heuristics.
  Recommended only after E + F have validated the closure-rule and witness-lifecycle mechanisms in the small.

A captain-elected combination (e.g., E + a single G clause) is permitted; the v0.7 governance-app slice (which authors [`specs/apps/governance.md`](../specs/apps/governance.md)'s charter surface) carries the seed-list.

### Cross-references

- [`specs/apps/governance.md`](../specs/apps/governance.md) — the v0.7 charter surface that consumes the seed.
- [`specs/_patterns/closure-rule-activation.md`](../specs/_patterns/closure-rule-activation.md) — the closure-rule pattern these seeds instantiate.
- [`specs/_patterns/witness-lifecycle.md`](../specs/_patterns/witness-lifecycle.md) — option G's captain-judged witness lifecycle.
- [`specs/network/network-algebraic-contract.md`](../specs/network/network-algebraic-contract.md) — option F clause 3's federation-receive scope.
