---
type: theorem
status: proved
depends-on:
  - entity-set
see-also:
  - relaxed-bilattice-homomorphism-classification
---

# No $\mathrm{Sym}(E)$-equivariant non-principal ultrafilter

For $E$ infinite and any subgroup $G \leq \mathrm{Sym}(E)$ acting on $E$ as the full symmetric group on a cofinite subset $R \subseteq E$, no $G$-invariant non-principal ultrafilter on $E$ exists. In particular, $\mathrm{Sym}(E)$ admits no non-principal invariant ultrafilter on $E$.

This is a small obstruction theorem isolated to keep the proof out of the body of the [relaxed bilattice homomorphism classification](relaxed-bilattice-homomorphism-classification.md), where it's the crucial step ruling out the conjectured "boundary at infinity."

## Proof

Suppose $\mathcal U$ is a $G$-invariant non-principal ultrafilter on $E$, where $G$ acts on a cofinite $R \subseteq E$ as $\mathrm{Sym}(R)$. Since $\mathcal U$ is non-principal, every cofinite subset of $E$ lies in $\mathcal U$; in particular $R \in \mathcal U$.

The trace $\mathcal U|_R := \{A \cap R : A \in \mathcal U\}$ is a $G$-invariant non-principal ultrafilter on $R$. So WLOG replace $E$ by $R$ and $G$ by $\mathrm{Sym}(R)$: it suffices to show no $\mathrm{Sym}(R)$-invariant non-principal ultrafilter on $R$ exists.

Pick any partition $R = A \sqcup B$ with $|A| = |B| = |R|$ — such a partition exists since $R$ is infinite. WLOG $A \in \mathcal U$ (an ultrafilter selects exactly one of $A, A^c$). Choose $\sigma \in \mathrm{Sym}(R)$ with $\sigma(A) = B$ and $\sigma(B) = A$ — exists since both have cardinality $|R|$. Then $\sigma_* \mathcal U \ni \sigma(A) = B$. By $\mathrm{Sym}(R)$-invariance $\sigma_* \mathcal U = \mathcal U$, so $B \in \mathcal U$. But also $A \in \mathcal U$, and $A \cap B = \emptyset$ — contradicting $\mathcal U$'s closure under finite intersections (no proper filter contains both halves of a disjoint pair). $\square$

## Corollary — boundary at infinity is empty

For each output cell $(s', o') \in E\times E$ with $\mathrm{Stab}(s', o') = \mathrm{Sym}(E\setminus F)$ for $F$ finite, no $\mathrm{Stab}(s', o')$-invariant non-principal ultrafilter on $E\times E$ exists with support disjoint from the four $\mathrm{Stab}$-fixed points $F\times F$. The non-principal stratum that the [relaxed bilattice homomorphism classification](relaxed-bilattice-homomorphism-classification.md) would otherwise admit is therefore empty, leaving only the principal evaluations at $\mathrm{Stab}$-fixed points and the two constant lattice homs ($\mathrm{constant\text{-}}\bot$, $\mathrm{constant\text{-}}\top$) as available per-coordinate $\alpha$.

The corollary applies on every non-singleton orbit of $\mathrm{Stab}(s', o')$ on $E\times E$: each such orbit is $\mathrm{Stab}$-equivariantly isomorphic to $R$, $R\times R$ minus a diagonal, or a similar $\mathrm{Sym}(R)$-equivariantly-trivial $\mathrm{Stab}$-set on which the obstruction theorem applies directly.

## Reading

The obstruction is a tight expression of "the natural symmetric group acts too transitively to admit invariant non-principal asymptotic information." It is the structural reason why the conjectured Lindström-quantifier extension of the chapter does not exist: $\mathrm{Sym}(E)$-naturality is fundamentally incompatible with the kind of "for $\mathcal U$-almost-all entities" content that non-principal ultrafilters express.

This is also the reason why the chapter's four-generator inventory is *almost* the whole story even without bottom-preservation — the bottom-preservation hypothesis happens to coincide with the principal-evaluation restriction, and the only generators it silently excludes are the finite, concrete [orbit-coloring generators](teaching/explanations/orbit-coloring-generator.md) that introduce constant-$\top$ on a $\mathrm{Sym}(E)$-orbit.
