---
kind: example
status: draft
depends-on: [tribonacci-classifying-invariant, padovan-anderson-putnam-comparison, anderson-putnam-direct-limit]
instantiates: [aperiodic-regime-classification]
lineage: 5
---

# Tribonacci: corpus vs Anderson-Putnam

Comparison instance for L5e — confirms rank-3 prediction and tests AP-distinguishability of Tribonacci from Padovan.

## Anderson-Putnam Tribonacci

For the Tribonacci substitution tiling, $\check{H}^1(\Omega_{\text{Tribonacci}}) \cong \mathbb{Z}^3$. The matrix action by $M_{\text{Tribonacci}}$ on this $\mathbb{Z}^3$ characterizes the substitution.

## Corpus computation

[tribonacci-classifying-invariant](tribonacci-classifying-invariant.md) gives $\mathbb{Z}^3$ as well. **Match.**

## AP-distinguishability of Tribonacci and Padovan

Both invariants are $\mathbb{Z}^3$ but with different matrix actions. AP literature distinguishes them via the matrix conjugacy class — they're MLD-distinct because $M_{\text{Tribonacci}}$ and $M_{\text{Padovan}}$ are non-conjugate over $\mathbb{Z}$.

The corpus's framework matches: same rank, different complete invariants.

## What this exhibits

The corpus's framework correctly handles the *intra-rank* distinction between step-3 substitutions, agreeing with Anderson-Putnam's classification. **Two step-3 substitutions can both have $\mathrm{cl}\text{-}\mathrm{inv}^{(3)} = \mathbb{Z}^3$ but be MLD-distinct via their substitution-matrix structures.**

## Position in Lineage 5e

Validates the corpus's framework on a second step-3 substitution. Confirms that the rank theorem captures the *cardinality* but not the *full* invariant within $\mathscr{M}^{(3)}$.
