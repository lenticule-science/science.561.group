---
type: concept
class: normative-pathology
depends-on: [normative-system, norm, operations-settling, authority-gate]
see-also: [deontic-modality, governance-pattern, charter-as-closure-system]
---

# Norm conflict

A **norm conflict** is a situation in which two or more norms within a single normative system $N$ apply to the same predication cell and impose incompatible normative pressures — both norms are in force, both apply to the same subject-predicate-object triple, and their consequents cannot simultaneously hold.

## Types of norm conflict

**Contrariety** (the primary case): norm $n_1$ and norm $n_2$ both fire on cell $\langle s, p, o\rangle$, but $n_1$'s consequent pushes $\langle s, p, o\rangle$ toward $\mathbf{t}$ while $n_2$'s pushes it toward $\mathbf{f}$. In the four-bilattice, both increments are applied; the result is $\langle s, p, o\rangle = \top$ (overdetermined/contested). This is substrate-detectable: $\top$-valued cells in $\mathcal{S}_{\mathrm{charter}}$ are norm-conflict witnesses.

**Incompleteness** (borderline case): $n_1$ pushes toward $\mathbf{t}$ and $n_2$ imposes no constraint (or fires $\bot$). This is not a conflict in the strong sense — $n_1$ governs, $n_2$ is silent — but if the two norms are understood as exhaustively partitioning cases, the $n_2$-silence indicates a gap rather than a conflict.

**Redundancy** (not a conflict): $n_1$ and $n_2$ both push toward $\mathbf{t}$ on the same cell. The cell's value is unchanged by having both fire. Redundancy is harmless in the knowledge order.

## What norm conflict is not

Norm conflict as defined here is **synchronic** — occurring within a single normative system at a single time — and **intra-pattern**:

- **Jurisdictional conflict** ([conflict-of-laws-as-beck-chevalley-failure](../theorems/conflict-of-laws-as-beck-chevalley-failure.md)): two *jurisdictions'* rules fire on the same cell. Inter-system, not intra-system.
- **Temporal conflict**: norm $n_1$ at time $\tau_1$ versus revised norm $n_2$ at time $\tau_2$. Handled by [norm-revision-as-cocompletion](../theorems/norm-revision-as-cocompletion.md).
- **Inter-pattern conflict**: rules from two different governance patterns — consensus vs. Hohfeldian — fire on the same cell. Handled by the [tradition-pluralism-as-fragment-coproduct](../theorems/tradition-pluralism-as-fragment-coproduct.md) framework.

## Detection

Because the four-bilattice records overdetermination as $\top$, norm conflicts are detectable by auditing $\mathcal{S}_{\mathrm{charter}}$ for $\top$-valued cells. The [audit-as-cech-resolution](../../../theorems/audit-as-cech-resolution-of-operations-settling.md) morphism performs this detection as part of its Čech resolution of the operations settling. A persistent norm conflict — one no adjudication resolves — contributes a non-trivial class to $H^1$ of the operations settling.

## Resolution paths

Three resolution paths exist:

1. **Adjudication**: applying [adjudicate-witness-conflict](../../../morphisms/adjudicate-witness-conflict.md) to the $\top$ cell. Requires authority-gate standing. Produces a finding that provisionally selects one norm's outcome over the other, without removing either norm. The conflict remains latent.
2. **Norm revision**: applying [norm-revision-as-cocompletion](../theorems/norm-revision-as-cocompletion.md) to remove or revise one of the conflicting norms. Structural change to $\mathcal{S}_{\mathrm{charter}}$.
3. **Visible automorphism**: a [charter-amendment-as-visible-automorphism](../theorems/charter-amendment-as-visible-automorphism.md) that restructures the normative system to eliminate the conflict at its source.

The first path is reversible (the conflict recurs if the same cells are presented again); the second and third are irreversible under settling monotonicity.
