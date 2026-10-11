---
type: theorem
class: engineering-claim
status: proved
depends-on: [repair, four-bilattice, paraconsistent-equality, bilattice-network-sheaf-consensus, predication-fiber-algebra, witness, federation-trust-bilattice-graded, replication-consistency-via-network-sheaf]
see-also: [transaction-atomicity-via-closure-idempotence, federation-trust-bilattice-graded]
---

# Repair is structurally $\top$-cell resolution on the bilattice

**Claim.** For any [coherence repair](teaching/explanations/repair.md) operation in the substrate, the operation has the structural form of a *$\top \to \{\mathbf{t}, \mathbf{f}, \bot\}$ resolution* on the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md): take a cell currently at value $\top$ (told both — $\mathrm{con}$-failure in the d-frame), apply a substrate-recorded resolution rule, produce a non-$\top$ value at that cell, and witness the resolution. Per [paraconsistent-equality](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/paraconsistent-equality.md), the substrate may carry $\top$-cells without trivialization; per [bilattice-network-sheaf-consensus](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md), $\top$-cells are exactly the $\mathrm{con}$-failure cells.

## Why this holds

Per [bilattice-network-sheaf-consensus](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md), the disagreement-join over multiple sources produces a d-frame whose $\mathrm{con}$ relation fails at exactly the cells where two sources hold contradictory values. By the bilattice's definition, these con-failure cells receive value $\top = (\mathbf{t}, \mathbf{f})$ in the joint settling — recording the contradictory co-witness.

Per [paraconsistent-equality](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/paraconsistent-equality.md), the substrate's reasoning continues despite $\top$-cells: the paraconsistent fiber algebra does not validate ex falso quodlibet, so a $\top$-cell does not propagate "anything follows" to neighboring cells. The substrate's repair discipline can therefore operate locally on a $\top$-cell without first re-establishing global consistency.

A coherence repair operation takes:

- **Input.** A cell currently at $\top$ in the fiber-algebra. By [bilattice-network-sheaf-consensus](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md), this records two contradicting sources.
- **Resolution rule.** A substrate-declared recipe (per [repair](teaching/explanations/repair.md)) for which non-$\top$ value to produce — typically a priority rule, a value-domain join, or an abort/escalate.
- **Output.** A new value in $\{\mathbf{t}, \mathbf{f}, \bot\}$ — non-$\top$, restored to $\mathrm{con}$.
- **Witness.** A record of the resolution (which $\top$-cell, which rule, what the prior values were, what the resolved value is).

The structural form is therefore: $\mathrm{repair}_R : \top \to \{\mathbf{t}, \mathbf{f}, \bot\}$ where $R$ is the declared resolution rule.

## The three resolution shapes

- **Priority rule** ($\mathrm{repair}^{\mathrm{prio}}$). Pick one of the two contradicting sources as authoritative; the cell takes that source's value (typically $\mathbf{t}$ or $\mathbf{f}$). Witness records which source won.
- **Value-domain join** ($\mathrm{repair}^{\vee}$). When the value-domain admits a join compatible with both assertions, take that join. For example, a numeric cell with two readings $5$ and $7$ may resolve to a midpoint or a $\max$, depending on the value-domain's join. Witness records the join recipe.
- **Abort/escalate** ($\mathrm{repair}^{\bot}$). When no admissible resolution is available, set the cell to $\bot$ (uninformed) and surface the $\top$-witness to governance. Witness records the escalation. Per [governance-decision-modal-decidability](governance-decision-modal-decidability.md), governance's resolution is itself a decidable modal computation.

In each case, the resolution moves the cell out of the $\mathrm{con}$-failure region of the d-frame, restoring the substrate's consistency.

## Engineering consequence

- **Repair catalog corresponds to bilattice resolution recipes.** The substrate's declared repair catalog is a list of $\mathrm{repair}_R$ functions; each entry maps a $\top$-cell pattern to a chosen resolution.
- **$\top$-cells are first-class state.** Per [paraconsistent-equality](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/paraconsistent-equality.md), the substrate need not panic-stop when a $\top$-cell appears. Repair operates locally; other substrate computations continue.
- **Federation-aware repair.** Per [federation-trust-bilattice-graded](federation-trust-bilattice-graded.md), federation peers may produce $\top$-cells via accessibility-relation conflicts. The same repair catalog applies.
- **Replication-aware repair.** Per [replication-consistency-via-network-sheaf](replication-consistency-via-network-sheaf.md), inter-replica disagreements produce $\top$-witnesses; the repair catalog handles them. Same mechanism, different source of disagreement.
- **Witness-based audit.** Every repair produces a witness recording (input $\top$-cell, applied recipe, output value). Auditors can replay the repair history and verify the chosen recipes match the catalog.

## What the theorem rules out

- **Silent contradiction-resolution.** A substrate that resolves a $\top$-cell without recording the choice in the witness is not implementing a declared repair — the resolution is irreproducible. Per [witness](teaching/explanations/witness.md), every repair must be auditable.
- **Trivialization on $\top$.** A substrate that responds to a $\top$-cell by aborting computation on neighboring cells (treating $\top$ as ex falso) is not running paraconsistent equality. Per [paraconsistent-equality](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/paraconsistent-equality.md), the substrate's value-domain explicitly refuses this collapse.
- **Repair-as-overwrite.** A repair that overwrites a $\top$-cell without recording the prior values loses the substrate's audit trail. Per the theorem, the witness must record what was contradicted, not just the resolution.
- **Repair-introducing-$\top$.** A "repair" that introduces a $\top$-cell where none existed before is not resolution — it's contradiction-introduction, the opposite of what repair does. The substrate refuses such operations.

## What the theorem requires

- The substrate's value-domain admits the bilattice $\top$ value (per [four-bilattice](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/four-bilattice.md) or richer bilattices).
- The substrate's reasoning is paraconsistent (per [paraconsistent-equality](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/paraconsistent-equality.md)) — $\top$-cells don't trivialize.
- The repair catalog is substrate content (not implementation-internal logic) — auditors can read which recipes are in the catalog.
- Every repair recipe is deterministic — per [settlement-determinism](../theorems/settlement-determinism.md), replaying the same $\top$-cell with the same recipe produces the same resolution.

## Position

This theorem grounds the substrate's repair discipline in the bilattice's $\top$-as-substrate-state structure. Together with [federation-trust-bilattice-graded](federation-trust-bilattice-graded.md) and [replication-consistency-via-network-sheaf](replication-consistency-via-network-sheaf.md), it forms the substrate's contradiction-handling layer: contradictions arise structurally (federation conflicts, replica disagreements, parallel admissions); they are recorded as $\top$-cells without trivialization; the repair catalog provides declared recipes for resolution; the witness chain makes resolution auditable. The substrate's contradiction discipline is one structural phenomenon — bilattice $\top$-cell resolution — at multiple engineering surfaces.
