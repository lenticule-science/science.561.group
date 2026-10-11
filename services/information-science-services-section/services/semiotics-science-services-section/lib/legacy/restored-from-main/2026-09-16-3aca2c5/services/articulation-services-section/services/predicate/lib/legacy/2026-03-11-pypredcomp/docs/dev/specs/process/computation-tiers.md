---
title: "Computation tiers"
description: "Office work runs on one of three computation tiers: algebraic substrate (Tier 1), statistical model (Tier 2), or language-model inference (Tier 3). The dispatch scheduler picks the cheapest sufficient tier."
kind: spec
status: normative
version: "0.2"
---


The OS recognises **three tiers of computation** as peer execution surfaces for office work, not a fallback chain into language-model inference.
Each tier is a different algebra of how a respond invocation actually computes its result; each tier composes with the same substrate primitives, the same capability discipline, and the same witness chain.

This spec is the umbrella; [`scheduling/tier-routing.md`](../scheduling/tier-routing.md) specifies how the dispatch scheduler picks a tier, and [`agential/non-lm-models.md`](../agential/non-lm-models.md) specifies how the Tier-2 model artefacts live as substrate cells.
The framing is committed by [`decisions/cheapest-sufficient-computation-tier.md`](../../decisions/cheapest-sufficient-computation-tier.md).

The captain's [`beyond-language-models-for-agent-computation.md`](../../../../engineering/triage/operations/command/ideas/triage/beyond-language-models-for-agent-computation.md) is the source idea; this spec is its integration.

## 1. The three tiers

### Tier 1 — Algebraic substrate computation

Closure rules and the bilattice operators $\odot$ and $\Rightarrow$ as defined in [`kernel/computational-model.md`](../kernel/computational-model.md) §2.
Settlement is finite, deterministic, replayable; cost per respond is bounded by the engine's fuel budget; no probabilistic component.

A Tier-1 dispatch is the substrate computing a fixed point of its own algebra against the asserted premises.
Most of the OS's computation already runs here.
The kernel's σ/Δ engine ([`kernel/sigma-delta-passes.md`](../kernel/sigma-delta-passes.md)) is the Tier-1 surface.

### Tier 2 — Statistical model computation

Markov chains, decision forests, classifiers, graph neural networks, and other small statistical models, evaluated against substrate fibers.
The model **weights** are substrate cells (per [`agential/non-lm-models.md`](../agential/non-lm-models.md)); the **inference** is a deterministic function of weights + input fiber projection.

Tier 2 is fast (sub-millisecond to single-digit-millisecond invocation), deterministic given the weights, fine-tunable on substrate evidence (per the algebraic learning calculus tasks in v0.9), and produces output cells that compose with Tier-1 closure rules through the standard $\odot$/$\Rightarrow$ operators.

Suitable for office work that is *recognisable but not algebraically derivable from premises alone*: dispatch routing, office-task classification, "is this thing settled?" predictions, "what's the next likely predicate?" inference, scoring, deduplication, anomaly classification.

### Tier 3 — Language-model inference

A prompt is composed from the input fiber, sent to an LLM (Opus / Sonnet / Haiku / local-fine-tuned), the response is parsed back into substrate cells.
Slow (seconds), expensive (tokens), non-deterministic (sampling temperature ≠ 0 unless pinned), and bounded only by token budgets and operator review.

Tier 3 is the surface the captain's harness already speaks.
It remains the right tool for genuinely natural-language work: novel decomposition, prose authoring, judgment under ambiguity, reading comprehension over arbitrary external text.

## 2. The tier-routing predicate

The substrate carries a fiber predicate `computation-tier` whose value at a given dispatch decision names the tier picked:

```json
{"s": "session:<id>", "p": "computation-tier", "o": "tier-1 | tier-2 | tier-3", "v": "True"}
```

The predicate is asserted by the dispatch scheduler at session-open; it is recorded on the session record alongside the existing capability fiber and budget fields ([`session-as-process.md`](session-as-process.md) §1).
Every cell authored within the session inherits the tier attribution through the standard `authored-by-session` chain, so the witness for any derived fact reaches back to the tier that produced it.

The predicate is **observable by closure rules**, so policy can be expressed as substrate algebra: a rule may refuse to absorb a Tier-3 conclusion at a stratum that the office's discipline only honours from Tier-1 derivations, etc.

## 3. Composition with the formality layer

The formality layer (F0–F6 per [`security/persona-and-personnel.md`](../security/persona-and-personnel.md) §2 and `agential-orchestration-platform/concepts/formality-layer`) grades the **office's own discipline** — how much of its work is implicit narrative vs. fully algebraic.
The computation tier grades **how the dispatched session actually computes a respond**.

These are orthogonal axes; one does not collapse into the other.
An F2 office may dispatch a respond to Tier 1 when the substrate's algebra alone is sufficient for the specific premises in front of it, to Tier 2 when only a learned classifier can decide, or to Tier 3 when the operator has explicitly requested LLM judgment.
An F3 office that has converged its algorithm can in principle dispatch all of its work to Tier 1 or Tier 2, but it is not *prevented* from reaching Tier 3 for an outlier case.

The composition rule:

```
admissible-tiers(office) =
    {tier-1, tier-2, tier-3}                          if formality-layer ∈ {F0, F1}
  ⊆ {tier-1, tier-2, tier-3} \ explicit-denials       if formality-layer ∈ {F2, F3, F4}
  ⊆ {tier-1, tier-2}                                  if formality-layer ∈ {F5, F6}     (default)
```

The default for F5 / F6 offices excludes Tier 3 because their discipline is fully algebraic by construction; Tier 3 escalation requires an explicit `permits-tier: tier-3` cell on the office record.
Lower-formality offices may also explicitly *deny* a tier (e.g., `denies-tier: tier-3` on a privacy-sensitive office) — denials compose via $\Rightarrow$ with the office's capability fiber and override the default admissibility.

## 4. The cheapest-sufficient principle

The dispatch scheduler picks the cheapest tier whose admissibility includes "can decide this respond."
Cheapest is monotone in the same `agential-orchestration-platform/theorems/settlement-path-cost-monotonicity` sense already cited by the heartbeat: a respond that Tier 1 can settle is *not* sent to Tier 2; a respond that Tier 2 can answer with sufficient confidence is *not* sent to Tier 3.

"Sufficient" is per-tier and is itself a substrate predicate:

- Tier 1 is sufficient when the office's algebra reaches a settled value for the predicates the respond produces.
  The σ/Δ engine returns a `settled` cell; the scheduler stops.
- Tier 2 is sufficient when the model's output crosses an office-configured confidence threshold expressed as a bilattice value (e.g., $t$ at confidence $\ge \tau$, $\bot$ otherwise).
  Confidence is per-model-record per [`agential/non-lm-models.md`](../agential/non-lm-models.md) §6.
- Tier 3 is the catch-all.
  There is no further escalation tier in v0.9; an LLM-uncertain answer is returned to the operator with explicit `requires-operator-review` attribution.

The scheduler's exact procedure is in [`scheduling/tier-routing.md`](../scheduling/tier-routing.md).

## 5. Substrate seam

All three tiers honour the same substrate contract:

- Inputs are read as fiber projections at a stated stratum and event-ordinal cursor (per [`filesystem/presheaf-storage.md`](../filesystem/presheaf-storage.md)).
- Outputs are appended as cells with the appropriate stratum: Tier 1 emits at the stratum the σ/Δ engine emits at; Tier 2 emits its outputs at `"asserted"` stratum with the model record in the `derived_from` chain (so the σ-pass can re-saturate downstream consequences); Tier 3 emits at `"asserted"` with the LLM call record in `derived_from` and `requires-operator-review` set per office policy.
- Every output cell carries `computation-tier` attribution back to the deciding tier.
- Every output cell carries the standard signed-event chain.

This is what lets a cell produced by Tier 2 be merged via $\odot$ with a cell produced by Tier 1 without the tier distinction leaking into the algebra.
Tier identity is preserved as an attribution predicate, not as a structural difference in the cell.

## 6. Tier transitions

A respond may begin on Tier 1, fail to settle, and be re-dispatched at Tier 2; may begin on Tier 2, return below threshold, and be re-dispatched at Tier 3.
The scheduler records the transition as substrate events:

```json
{"s": "session:<id>", "p": "tier-escalated-from", "o": "tier-1", "v": "True"}
{"s": "session:<id>", "p": "tier-escalated-to", "o": "tier-2", "v": "True"}
```

The two cells form a witness pair; replay reproduces the same escalation decisions because the underlying fiber state and policy cells are themselves replayable.
There is no Tier-3-to-Tier-2 *de-escalation* during a respond: once the LLM has been called, that decision is recorded and not retroactively cheapened.
(Subsequent responds against the same predicates may be cheaper if a v0.9 instinct-to-skill promotion has captured the LLM's behavior into a Tier-2 model or a Tier-1 closure rule.)

## 7. Tier-1 ⇒ Tier-2 ⇒ Tier-3 progression as a learning trajectory

The captain's continuous-learning pipeline ([`milestones/v0.9-publishing-and-learning.md`](../../milestones/v0.9-publishing-and-learning.md)) is now bicephalous:

- The original observe → instinct → skill → tool → hook trajectory captures *script-shaped* work (Tier 3 → Tier 1).
- The new algebraic-learning-calculus trajectory captures *model-shaped* work (Tier 3 → Tier 2 → eventually Tier 1 once the model itself has converged enough to be replaced by a closure rule).

Both trajectories share machinery: observation cells, governance review of promotions, witnessed model/skill records, federated propagation.
They are two paths through the same pipeline.
Per `agential-orchestration-platform/theorems/settlement-path-cost-monotonicity`, every promotion strictly reduces expected per-respond cost without changing observable behaviour beyond the office's confidence thresholds.

## 8. Errors

| Code | Meaning |
|---|---|
| `PCS_TIER_NOT_ADMISSIBLE` | Scheduler attempted to dispatch a respond at a tier the office's `denies-tier` or formality-default forbids. |
| `PCS_TIER_INSUFFICIENT` | Tier 1 or Tier 2 failed to produce a sufficient answer; escalation required. |
| `PCS_TIER_ESCALATION_DENIED` | Escalation needed but the next tier is also inadmissible (typically Tier 3 forbidden on an F6 office). Surfaces to the operator. |
| `PCS_TIER_MODEL_MISSING` | Tier 2 was selected but no model record matches the dispatch shape. |
| `PCS_TIER_BUDGET_EXCEEDED` | The session's per-tier budget (e.g., max LLM tokens) was exhausted mid-respond. |

## 9. Implementation

### Python (v0.8+)

- Tier dispatch is a guard inside the scheduler's `pick_session_handler` per [`scheduling/tier-routing.md`](../scheduling/tier-routing.md).
- Tier 1 invocation is the existing closure-engine path.
- Tier 2 invocation calls a `Model.infer(weights, input_fiber)` Python function.
  Model artefacts are loaded lazily from the cell store; weight blobs cached in process memory with LRU eviction.
- Tier 3 invocation is the existing LLM call path (Anthropic SDK, etc.).

### Rust (v0.8+)

- Same shape; Tier-2 inference dispatched via a Rust trait `StatisticalModel::infer(&self, fiber: &FiberProjection) -> CellSet`.

## 10. Conformance

Computation tiers pass:

1. **Tier attribution.** Every cell authored during a respond carries the deciding tier in its session attribution chain.
2. **Cheapest-sufficient routing.** A respond that Tier 1 settles is not dispatched to Tier 2 or Tier 3; Tier-2 dispatch only fires when Tier 1 returned $\bot$ for the predicates of interest.
3. **Tier-2 determinism.** Same model weights + same input fiber projection + same model record → byte-identical output cells across replays.
4. **Tier-3 attribution.** A Tier-3 cell carries the LLM model identifier in its `derived_from` chain.
5. **Escalation events.** A Tier 1 → Tier 2 escalation produces matching `tier-escalated-from` / `tier-escalated-to` events; replay reproduces them.
6. **Cross-language equivalence.** Tier-1 and Tier-2 outputs are byte-identical in Python and Rust for the same inputs and the same model record.
  (Tier-3 is excluded from byte-identity by definition; Tier-3 conformance is the operator-review surface, not byte equality.)

## 11. Plan 9 / Unix analogue

| Unix concept | Computation-tier analogue |
|---|---|
| `nice` levels | Tier preference per office |
| Compiled vs. interpreted | Tier 1 (compiled algebra) vs. Tier 2 (interpreted model) vs. Tier 3 (asks-the-oracle) |
| In-kernel fast path / userland fallback | Tier 1 fast path / Tier 2 / Tier 3 fallback |
| `setpriority` | Office sets `permits-tier` / `denies-tier` cells |
