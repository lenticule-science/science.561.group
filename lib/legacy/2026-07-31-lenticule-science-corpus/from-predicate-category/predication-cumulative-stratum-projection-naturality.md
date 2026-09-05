---
type: theorem
class: naturality
status: proved
depends-on: [projection-merge-naturality, presheaf-indexed-fiber, knowledge-join, stratified-predication-fiber, settling-monotonicity, knowledge-order]
see-also: [cache-coherence-via-functorial-projection, federation-convergence]
---

# Cumulative-stratum projection naturality

**Claim.** The cumulative-stratum restriction $\pi_{\le s} \colon A^{\flat}_p \to A^{\flat}_p$ that retains atoms whose stratum lies in the downward-closed set $\{0, 1, \dots, s\} \subseteq \{0, 1, 2\}$ is a presheaf-restriction morphism in the [presheaf-indexed fiber](teaching/explanations/presheaf-indexed-fiber.md), and it commutes with [knowledge-join merge](../morphisms/knowledge-join.md):

$$
\pi_{\le s}(H_1 \odot H_2) \;=\; \pi_{\le s}(H_1) \;\odot\; \pi_{\le s}(H_2).
$$

The naturality holds for every $s \in \{0, 1, 2\}$. The substrate's `project_stratum_at_or_below(\cdot, s)` operation is a wire-form realisation of $\pi_{\le s}$.

## Why it holds

The cumulative narrowing fixes context $c = (\le s, \star, \star, \infty)$ and uses the per-atom admission predicate $\mathrm{adm}_c(\alpha) = (\mathrm{strat}(\alpha) \in \{0, \dots, s\})$. This predicate consults only the atom's stratum field — which is fixed at emission and never modified per [stratified-predication-fiber](../objects/stratified-predication-fiber.md) — and not any other atom in the surrounding fiber. So $\mathrm{adm}_c$ is a per-atom admission predicate in the sense of [presheaf-indexed-fiber](teaching/explanations/presheaf-indexed-fiber.md), and the cumulative narrowing is a morphism in $\mathcal{C}_{\mathrm{sub}}$.

Naturality of $\odot$ against this morphism is then a special case of [projection-merge-naturality](projection-merge-naturality.md). The argument's load-bearing step — that the admission predicate is unchanged by surrounding atoms — is satisfied because stratum is a *static* field on each atom: per [stratified-predication-fiber](../objects/stratified-predication-fiber.md)'s forward-only stratum property, an atom's stratum is set at emission and is never demoted, promoted, or rewritten. The merge $\odot$ does not modify stratum on any atom (it adds atoms, joins co-canonical-identity values, unions witness chains; none of these touch the stratum field). Hence the admission predicate's truth value on each atom is invariant under merge.

## Interaction with stratum-monotonicity

A subtle additional fact: the cumulative restriction $\pi_{\le s}$ commutes with the *closure-degree generation* on the merged history at strata up to $s$.

Concretely: given $H_1, H_2$ at full stratum $\le 2$, and $s \in \{0, 1\}$, the question arises whether $\pi_{\le s}$ might *miss* a saturated atom that would have been derived had the merge been performed first. The answer is no, because the substrate's σ- and Δ-passes derive new atoms at strata $\ge 1$ from atoms at strata $\le s'$ for $s' < $ derived stratum; pre-existing higher-stratum atoms in the operands are unchanged by the merge (per [stratified-predication-fiber](../objects/stratified-predication-fiber.md)'s atoms-not-modified-in-place). The merge does not *re-derive* — it composes existing atom sets. Re-derivation against the merged history is a *separate* operation, performed by a fresh σ-pass or Δ-pass on the merged fiber, and produces atoms at strata $\ge 1$; those new atoms are *outside* $\pi_{\le 0}$'s admitted set.

So the cumulative restriction does not commute with the *re-derivation* operation, only with the merge operation. The substrate's discipline keeps these distinct: federation receive performs $\odot$-merge but does not auto-derive; subsequent σ/Δ-passes on the merged fiber are explicit and produce new stratified atoms that the cumulative projection then exposes accordingly.

## Specialisations

Three useful instantiations:

| $s$ | Reading | Substrate name |
|---|---|---|
| $0$ | "asserted-only view" | `project_stratum_at_or_below(_, 0)` |
| $1$ | "asserted plus saturated" | `project_stratum_at_or_below(_, 1)` |
| $2$ | "full fiber" — identity restriction | `project_stratum_at_or_below(_, 2) = id` |

For $s = 2$, the restriction is the identity (no atoms are excluded), and naturality is trivially the identity $\odot = \odot$. For $s = 0$ and $s = 1$, naturality is the substantive claim that the cumulative read agrees with the cumulative-then-merge or merge-then-cumulative composite.

## What this rules out

- **A non-constant stratum field.** A substrate that re-tagged atoms with new stratum values mid-merge would break the stratum-invariance under $\odot$ that the proof relies on. The substrate's discipline forbids this.
- **Cumulative reads that bypass missing-stratum atoms by re-deriving.** A read that, when handed a fiber missing stratum-$1$ atoms at certain coordinates, *re-derives* them on the fly is doing more than $\pi_{\le 1}$ — it is composing the projection with a fresh σ-pass. Naturality fails for this composite operation: re-derivation depends on the surrounding atom set (the σ-pass's premise atoms come from elsewhere in the fiber), violating the per-atom admission requirement. The substrate avoids this by separating projection (presheaf morphism) from saturation (closure operator).

## What this requires

- Stratum is a static, per-atom field set at emission and never modified — the [stratified-predication-fiber](../objects/stratified-predication-fiber.md) commitment.
- Atoms-not-modified-in-place discipline holds, so merge operates by atom-set union rather than in-place updates.
- The substrate's `project_stratum_at_or_below` operation is implemented as the morphism $\pi_{\le s}$ — i.e. by atom-set filtering on the stratum field, without re-derivation.

## Position

This theorem grounds the dev spec's commitment that `project_stratum_at_or_below` honours the same naturality square as `project_stratum`. The two projections differ only in their admission predicate (downward-closed-set vs. exact-match); both are per-atom admissions on the stratum field; both inherit naturality from [projection-merge-naturality](projection-merge-naturality.md).

Together with [projection-merge-naturality](projection-merge-naturality.md), this completes the math content underlying the substrate's per-stratum and cumulative-stratum projection discipline. The engineering surface — that the federation-merge `local_projection ⊙ peer_projection` equals `project(local_history ⊙ peer_history, s)` for both exact-stratum and at-or-below variants — is the substrate's `PCC_PROJECTION_DIVERGED` invariant, structurally guaranteed by the conjunction of these two theorems.
