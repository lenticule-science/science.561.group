---
name: instinct-confidence-is-closure-fixpoint-measure
description: "Instinct confidence is the closure fixed-point measure: learned equals zero $\\leq_k$-distance to next-round output"
type: theorem
class: engineering-claim
status: proved
depends-on:
  - teaching/explanations/consolidation-as-settlement.md
  - ../morphisms/consolidate.md
  - ../morphisms/settle.md
  - ../morphisms/compose.md
  - ../objects/observation-record.md
  - ../objects/instinct-record.md
  - ../objects/fiber.md
  - ../../../../teaching/explanations/knowledge-order.md
  - ../../../../teaching/explanations/settling-monotonicity.md
  - ../../../../../theorems/settlement-via-closure-2-monad.md
  - ../../../../../theorems/settlement-determinism.md
  - ../../../../../../../../../../../../theories/computability/prose/learning/claims/theory-of-computability.md
  - ../../../../../../../../../../../../theories/predicated-computing/prose/learning/claims/theory-of-predicated-computing.md
see-also:
  - teaching/explanations/formality-progression.md
  - ../../../../theorems/promote-is-strictly-cost-reducing.md
  - ../../../questions/micromodel-training-pipeline.md
  - questions/canonical-interpretation-rules.md
title: instinct-confidence-is-closure-fixpoint-measure
---

# Instinct confidence is the closure fixed-point measure: learned equals zero $\leq_k$-distance to next-round output

**Claim.** The [consolidation-as-settlement](../settlement/consolidation-as-settlement/consolidation-as-settlement.md) discipline identifies instinct confidence with *idempotence under further training, not with observation count*.
This is a precise mathematical claim: the confidence value of an instinct produced by [consolidate](../code/transformers/consolidate.md) over observation set $O$ is the $\leq_k$-distance between the current settled output fiber $F_O$ and the settled output fiber $F_{O'}$ produced by running consolidate over an extended observation set $O' \supset O$:

$$\mathrm{confidence}(I) \;\propto\; 1 - d_k(F_O,\, F_{O'})$$

where $d_k$ is the knowledge-order distance (number of cells that change value under $\leq_k$ when moving from $F_O$ to $F_{O'}$).
An instinct is **learned** — has maximum confidence — exactly when $d_k(F_O, F_{O'}) = 0$: the instinct's pattern is at a fixed point of the consolidation operator, unchanged by further observations.

## Why this is the right measure

**Part 1: Consolidation is a closure operator on the observation fiber space.** Per [consolidation-as-settlement](../settlement/consolidation-as-settlement/consolidation-as-settlement.md), `consolidate` is a `settle` of observations against `learning`-channel closure rules.
Per [theory-of-computability](../../../../../../../../../../../logic-services-section/content/text/glossary/concepts/theory-of-computability.md), every closure operator in $\mathbf{Eff}$ is a Medvedev-filter nucleus $j_F: \Omega_{\mathbf{Eff}} \to \Omega_{\mathbf{Eff}}$ satisfying idempotency, extensivity, and meet-preservation; the fixed-point existence is Kleene's fixed-point theorem internal to $\mathbf{Eff}$.
Per [settlement-via-closure-2-monad](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settlement-via-closure-2-monad.md), `settle` realizes this closure structure at the FARS substrate: it is lax-idempotent ($\mathrm{cl} \circ \mathrm{cl} \geq_k \mathrm{cl}$ in the knowledge-order) and monotone ($O \leq_k O'$ implies $\mathrm{cl}(O) \leq_k \mathrm{cl}(O')$).
The consolidation operator $\mathrm{cl}_{\mathrm{learn}}$ is therefore a closure operator on the lattice of observation fibers under $\leq_k$.

**Part 2: A closure operator's fixed points are its stable outputs.** For a closure operator $\mathrm{cl}$, a fiber $F$ is a *fixed point* iff $\mathrm{cl}(F) = F$.
Per [settling-monotonicity](../../../../teaching/explanations/settling-monotonicity.md), the closure operator's iteration toward fixed point is monotone: applying $\mathrm{cl}$ again to an already-settled fiber produces no change.
An instinct pattern that is a fixed point of $\mathrm{cl}_{\mathrm{learn}}$ is one that:

1. The current observation set already entails (adding the instinct's conclusion to the fiber adds no new $\leq_k$-information not already there).
2. Will not be overturned by extending the observation set in a consistent direction (because the pattern is stable at the fixed point under $\leq_k$-monotone extension).

**Part 3: The knowledge-order distance is the right confidence metric.** The $\leq_k$-distance $d_k(F, F')$ between two fibers counts how many cells change value when moving from $F$ to $F'$ in the knowledge-order.
For the consolidation context:

- $d_k(F_O, F_{O'}) = 0$: the instinct fiber is unchanged by further observations — the pattern is at a fixed point. *Maximum confidence.*
- $d_k(F_O, F_{O'}) > 0$: further observations change some cells — the pattern is not yet stable. *Lower confidence; the cells that change are precisely the instinct's unstable predicates.*

The distance is well-defined because $\leq_k$ is a partial order and the fiber space is a finite product of copies of the four-bilattice (one copy per predicate).
The distance is a bounded non-negative integer; it is zero iff the instinct is at fixed point.

**Part 4: Idempotence-under-further-training is exactly fixed-pointhood.** The [consolidation-as-settlement](../settlement/consolidation-as-settlement/consolidation-as-settlement.md) discipline states: "confidence is closure measure (idempotence under further training), not count."
Unpacked: an instinct has high confidence when re-running `consolidate` on an extended observation set produces no further change to that instinct's predications.
This is the definition of fixed-pointhood of $\mathrm{cl}_{\mathrm{learn}}$ at the instinct's fiber.
The claim that *this* is the confidence measure — not observation count — follows from two facts:

1. Observation count is not monotone in $\leq_k$: ten contradictory observations may produce less information than three concordant ones.
  The knowledge-order captures the *quality* of convergence, not the *quantity* of data.
2. The closure operator's fixed-pointhood is the correct convergence criterion because $\mathrm{cl}_{\mathrm{learn}}$ IS the consolidation: a pattern that is a fixed point of the consolidation is one that cannot be further settled — it has already reached everything the learning-channel rules can extract from the current evidence.

## The $\top$-cell signal

When observations disagree on the same predicate — multiple observations assert conflicting values for the same cell — the pointwise $\odot$ composition produces a $\top$-cell for that predicate (per [`consolidate`](../code/transformers/consolidate.md)'s Phase 2).
A $\top$-cell is *not* at fixed point under the knowledge-order: it is overdetermined and requires repair.
An instinct with $\top$-cells in its fiber has $d_k > 0$ under any well-formed extension (a consistent resolution would move the $\top$-cell to either $t$ or $f$, changing the value).
Therefore:

**$\top$-cells in the instinct's fiber are a direct signal of low confidence.** An instinct produced from a contradictory observation set carries $\top$-cells; these cells have nonzero $d_k$ to any future extension; the confidence is strictly below maximum.
The substrate's repair catalog (per [four-layer-rule-architecture](../architecture/four-layer-rule-architecture/four-layer-rule-architecture.md)) provides recipes for resolving $\top$-cells; resolution increases confidence toward fixed-pointhood.

## Engineering consequences

**Confidence assessment is a fiber-distance computation, not a count.** A FARS realization that tracks instinct confidence SHOULD compute $d_k(F_O, F_{O'})$ — or an estimate of it — rather than counting the number of observations that contributed to the instinct.
Two approaches for estimating $d_k$:

- *Incremental re-settle*: after adding new observations $O' \setminus O$, re-run `consolidate` on $O'$ and compare the output fiber to the prior output fiber cellwise.
  The number of cells that change is $d_k$.
- *Stability window*: after each consolidation batch, check whether the instinct's $\top$-cell count is decreasing.
  Zero $\top$-cells and unchanged predications over $N$ consecutive batches is a proxy for fixed-pointhood.

Both are admissible; the formal criterion is fixed-pointhood; the proxy approaches are approximations that implementations MAY use.

**Confidence threshold for promotion is a fixed-point gate.** Per [promote-is-strictly-cost-reducing](../../office/promote/promote-is-strictly-cost-reducing/promote-is-strictly-cost-reducing.md), promoting an instinct to a skill requires the source to meet a maturity threshold.
By the present theorem, the threshold is correctly stated as "instinct fiber is at fixed point under $\mathrm{cl}_{\mathrm{learn}}$" — equivalently, $d_k(F_O, F_{O'}) = 0$ for a sufficiently extended $O'$.
Realizations that use observation count as the promotion threshold are using a proxy that may promote unstable patterns (high count but not yet converged) or delay promoting stable ones (low count but already converged).

**Learning-channel $\top$-pressure predicts consolidation instability.** Per [agent-community-consensus](../../agent/agent-community/agent-community-consensus/agent-community-consensus.md), the substrate's $\top$-pressure (density of $\top$-cells in a region) is a signal of disagreement.
For the `learning` channel, $\top$-pressure in the observation fiber is a direct predictor of low instinct confidence: $\top$-cells mean contradictory observations, which means the instinct cannot reach fixed point until the contradiction is resolved.
The substrate can therefore use learning-channel $\top$-pressure as an *early warning* for consolidation instability — before even running `consolidate`.

**Federation of instincts is confidence-aware.** When a FARS instance receives a federated instinct from a peer (via [flatfile-federation-equivalence](../flatfile-federation-equivalence/flatfile-federation-equivalence.md)), the receiving instance can assess the imported instinct's confidence by running one consolidation round over its own observation set extended with the peer's observations.
If $d_k = 0$, the instinct is stable under the receiving instance's own evidence.
If $d_k > 0$, the instinct is not yet at fixed point from the local perspective — it should be held at lower confidence until local evidence accumulates.

## What the theorem requires

- The `learning`-channel closure-rule system $\mathrm{cl}_{\mathrm{learn}}$ is a valid closure operator on the observation fiber space under $\leq_k$ — it is extensive ($F \leq_k \mathrm{cl}(F)$), monotone, and idempotent ($\mathrm{cl}(\mathrm{cl}(F)) =_k \mathrm{cl}(F)$).
  This follows from [settlement-via-closure-2-monad](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settlement-via-closure-2-monad.md).
- The observation fiber space is a finite product of four-bilattice copies (one per predicate), so $d_k$ is well-defined and bounded.
- The consolidation's pointwise $\odot$ composition of observation fibers is the correct aggregation operation, not a non-monotone aggregation (e.g., majority vote without value-domain semantics).

## What the theorem does not claim

- **That all instincts eventually reach fixed point.** An observation set with irreducible $\top$-cells (persistent contradiction across all extensions) may never produce a fixed-point instinct for the contradictory predicates.
  The theorem characterizes the confidence of instincts; it does not guarantee convergence.
- **A specific implementation of $d_k$.** The $\leq_k$-distance is the formal criterion; realizations MAY use proxy measures that approximate it.
  The theorem establishes what the confidence IS, not how it MUST be computed.
- **That high confidence is sufficient for promotion.** Per [promote-is-strictly-cost-reducing](../../office/promote/promote-is-strictly-cost-reducing/promote-is-strictly-cost-reducing.md), promotion from instinct to skill requires additional conditions beyond confidence (body liftability, precondition derivability).
  Fixed-pointhood is necessary for promotion confidence; it is not the only condition.
