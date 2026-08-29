---
kind: theorem
status: proved
depends-on: [closure-operator, jung-rivieccio-duality, predication-fiber-algebra, paired-priestley-space]
---

# Closure-fixed-points correspond to closed Priestley subspaces

Let $A$ be a bounded distributive lattice and $\mathrm{cl} : A \to A$ a [closure operator](../morphisms/closure-operator.md) — monotone, inflationary, idempotent.
Then the set of closure-fixed points

$$A^{\mathrm{cl}} \;:=\; \{a \in A : \mathrm{cl}(a) = a\}$$

is a sub-meet-semilattice of $A$ containing the top element, closed under arbitrary meets extant in $A$.
Under Priestley duality $\mathbf{DLat}^{\mathrm{op}} \simeq \mathbf{PriSp}$, the inclusion $A^{\mathrm{cl}} \hookrightarrow A$ dualizes to a Priestley-space surjection $\mathrm{Spec}(A) \twoheadrightarrow \mathrm{Spec}(A^{\mathrm{cl}})$ — equivalently, the selection of a closed subspace $K \subseteq \mathrm{Spec}(A)$.

## Proof

*Closure of $A^{\mathrm{cl}}$ under meets.* For $a, b \in A^{\mathrm{cl}}$: $\mathrm{cl}(a \wedge b) \geq a \wedge b$ by inflationarity, and $\mathrm{cl}(a \wedge b) \leq \mathrm{cl}(a) \wedge \mathrm{cl}(b) = a \wedge b$ by monotonicity.
Equality.

*Top-closure.* $\mathrm{cl}(\top) \geq \top$ by inflationarity, $\leq \top$ by maximality.

*Priestley side.* Sub-meet-semilattices of $A$ containing $\top$ correspond to Priestley quotients of $\mathrm{Spec}(A)$ via the standard characterization of Priestley-space morphisms; quotients of compact Hausdorff ordered spaces by closed equivalence relations are equivalent to selecting closed sub-spaces. $\square$

## Adoption in the bilattice setting

On a [predication fiber algebra](../objects/predication-fiber-algebra.md) $A_q = \mathbf{L}^{\bowtie E \times E}$, applying the lemma to the $\leq_k$-lattice structure gives that the closure-fixed-point sub-lattice $A_q^{\mathrm{cl}}$ corresponds to a closed subspace $K_q \subseteq X_q = \mathrm{Spec}(A_q)$ in the [paired Priestley dual](../objects/paired-priestley-space.md).
The paired structure is preserved because [predicate-category naturality](../concepts/predicate-category-naturality.md) of closure respects both $+$ and $-$ components of the twist product.

This is the lattice-theoretic underpinning of the dualized-closure 2-comonad: where the primal closure inflates valuations, the dual closure restricts to confirming Priestley points.
