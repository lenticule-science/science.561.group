---
type: theorem
class: engineering-claim
status: proved
depends-on: [scott-continuous-closure, settling-cohomology, four-regime-dichotomy, transfinite-bounded-regime-h1-generators, scott-continuous-regime-cohomology-vanishing, regime-classification-for-substrate, snapshot, federation-convergence]
see-also: [snapshot-replay-fidelity, federation-convergence]
---

# Scott-continuity is the substrate's checkpointability property

**Claim.** A predicated computer whose [regime](regime-classification-for-substrate.md) is *strict* or *Scott-continuous* admits **endpoint-only checkpointing**: the substrate's settled state at any quiescent ordinal is sufficient to reconstruct every operationally-relevant property of the substrate. The trajectory by which the substrate reached its settled state can be reconstructed from the endpoint, modulo $H^0$-content (which cells are designated).

A predicated computer whose regime is *transfinite-bounded* or *aperiodic* does **not** admit endpoint-only checkpointing: the trajectory of [non-Scott-continuous firing ordinals](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/non-scott-continuous-firing-ordinal.md) contributes one $\mathbb{Z}$-generator to $H^1$ per firing, and this cohomological invariant is not recoverable from the endpoint state. The substrate must store trajectory (the firing-ordinal pattern) alongside endpoint to preserve full content.

This is the substrate's structural decision-point for storage, replication, audit, and federation: **the rule-language fragment determines whether you can compress trajectory into state**.

## Why this holds

The argument rests directly on the cohomological vanishing structure of the [four-regime dichotomy](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md).

**Strict and Scott-continuous regimes have $H^1 = 0$.** Per [strict-regime cohomology vanishing](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/strict-regime-cohomology-vanishing.md) and [Scott-continuous regime cohomology vanishing](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/scott-continuous-regime-cohomology-vanishing.md), the [settling cohomology](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cohomology.md) of a strict or Scott-continuous settling has $H^n = 0$ for $n \geq 1$ and $H^0 = \mathbb{Z}^{N_\bullet}$ counting designated cells. The classifying invariant is forced to be zero. Equivalently: the entire structural content of the settling is exhausted by *which* cells are eventually designated; *when* they are designated does not contribute cohomologically.

The engineering consequence: a snapshot of the settled state's [predication valuation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-valuation.md) is full content. A replicating peer that receives the snapshot can reconstruct every operationally-relevant query result, every closure-rule derivation, every audit-relevant fact about the settling.

**Transfinite-bounded and aperiodic regimes have nontrivial $H^1$.** Per [transfinite-bounded regime $H^1$-generators](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/transfinite-bounded-regime-h1-generators.md), each non-Scott-continuous firing ordinal $\mu$ contributes one $\mathbb{Z}$-generator $e_\mu$ to $H^1$. The aperiodic classifying invariant is the sum $\sum_\mu e_\mu$ across all non-Scott-continuous firings. Two settlings with the same endpoint state but different firing-ordinal patterns are *not [mutually-locally-derivable](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/mutually-locally-derivable.md)* — they classify differently in the moduli, and their cohomological invariants distinguish them.

The engineering consequence: a snapshot of just the endpoint loses the $H^1$ content. A peer that receives the endpoint without the firing-ordinal record cannot reconstruct the substrate's MLD-class or its cohomological invariant. Operations that depend on these (audit verification of trajectory-bearing properties, federation convergence into the same MLD-class, replay reconstruction of trajectory-dependent witnesses) are no longer well-defined.

## Engineering consequence

The substrate's **storage discipline** is regime-determined:

- *Strict / Scott-continuous regime:* checkpoint = endpoint snapshot. [Snapshot-replay-fidelity](snapshot-replay-fidelity.md) reconstructs full content. Event-log retention beyond a recent snapshot is optional (for audit history).
- *Transfinite-bounded / aperiodic regime:* checkpoint = endpoint snapshot + firing-ordinal record. The event log must be retained at least for the non-Scott-continuous firing ordinals, since these contribute irrecoverable $H^1$ content.

The substrate's **federation discipline** is regime-determined:

- *Strict / Scott-continuous regime:* federate by shipping snapshots; convergence per [federation-convergence](federation-convergence.md) reduces to substrate-level CRDT merge of endpoint states.
- *Transfinite-bounded / aperiodic regime:* federate by shipping trajectory; an endpoint-only federation loses $H^1$ content and produces non-converging MLD-classes across the federation graph.

The substrate's **replication and disaster-recovery discipline** is regime-determined:

- *Strict / Scott-continuous regime:* recover from latest snapshot + recent event log.
- *Transfinite-bounded / aperiodic regime:* recover from latest snapshot + complete event log (or at minimum the log entries at non-Scott-continuous firing ordinals).

The substrate's **audit discipline** is regime-determined:

- *Strict / Scott-continuous regime:* an auditor with the endpoint can verify every trajectory-independent property.
- *Transfinite-bounded / aperiodic regime:* an auditor needs the firing-ordinal record to verify trajectory-dependent properties; without it, certain MLD-classifying questions are undecidable from the substrate's audit data alone.

## Engineering rule of thumb

If the substrate's [closure-rule system](../objects/closure-rule-system.md) is restricted to the *quantifier-free* fragment (no $\forall$-block antecedents over infinite domains), the substrate is checkpointable: store endpoints, ship endpoints, audit endpoints. If the substrate's rule system admits $\forall$-block antecedents, the substrate is not checkpointable in the simple sense: store and ship trajectory, audit on trajectory.

This is a **substrate-level architectural decision** the engineering must make at design time. Adding $\forall$-block rules to a previously quantifier-free substrate does not just add expressivity — it changes the storage, replication, federation, and audit obligations of every implementation. The change is not local to the rule system; it propagates through every operational discipline.

## What the theorem rules out

- A substrate in transfinite-bounded or aperiodic regime that ships only endpoint state in its replication or federation protocol has lost $H^1$ content. The protocol may produce byte-identical endpoint state at receivers, but the receivers' settlings are no longer in the same MLD-class as the sender's. This is *regime-incompatible* operation; the substrate is misdesigned for its rule-language fragment.
- A substrate that claims strict / Scott-continuous regime but admits $\forall$-block rules at runtime has misdeclared itself; the regime-classification's exclusivity (per [regime-classification-for-substrate](regime-classification-for-substrate.md)) means the substrate is in the non-Scott-continuous regime even if its declaration says otherwise. The misdeclaration produces silent $H^1$ loss in any operation that assumes checkpointability.

## What the theorem requires

- The substrate is conformant per [regime-classification-for-substrate](regime-classification-for-substrate.md).
- The substrate's regime is determined by its closure-rule system's rule-language fragment and base finiteness, per the four-regime dichotomy.
- The substrate's settling cohomology is well-defined per [settling-cohomology](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cohomology.md).
- The substrate's snapshot, replication, federation, and audit operators respect the regime's storage discipline.
