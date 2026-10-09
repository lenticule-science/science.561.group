---
type: remark
discusses:
  - predication-fibration
  - predicate-specialization
  - twist-product-fusion
  - twist-product-right-residual
see-also:
  - orbit-coloring-fibration-extension
  - boundary-extended-predicate-category
---

# Residuated preservation tension on bottom cells

The [predication fibration](../../objects/predication-fibration.md) condition (A3) requires reindexing functors $f^*$ to preserve the [twist-product fusion](../../morphisms/twist-product-fusion.md) $\odot$ and the [twist-product right residual](../../morphisms/twist-product-right-residual.md) $\Rightarrow$ pointwise. This is not a mild extension of the bilattice-preservation conditions — it has bite at any cell where $f^*$ paints constant-$\bot$.

The local computation is

$$\bot \odot \bot \;=\; \langle 0, 0\rangle \odot \langle 0, 0\rangle \;=\; \langle 0\cdot 0,\ (0\to 0)\wedge(0\to 0)\rangle \;=\; \langle 0, 1\rangle \;=\; \mathbf f$$

— using $0 \to 0 = 1$ in any [residuated lattice](../../objects/residuated-lattice.md). So $\bot \odot \bot = \mathbf f$, not $\bot$. Symmetrically, $\bot \Rightarrow \bot = \mathbf t$, not $\bot$. The twist product $\mathbf L^\bowtie$ is *not* an integral residuated bilattice in the strong sense — its $\bot$ element does not absorb under $\odot$ or $\Rightarrow$.

The consequence for the fibration is concrete: any reindexing functor $f^*$ that paints $\bot$ at some cell $(s', o')$ violates (A3) at $(s', o')$. For two source elements $v_1, v_2 \in A_p$ with $f^*(v_i)(s', o') = \bot$, the LHS $f^*(v_1 \odot v_2)(s', o')$ equals $\bot$ by construction, while the RHS $f^*(v_1)(s', o') \odot f^*(v_2)(s', o') = \bot \odot \bot = \mathbf f$. These differ in any non-degenerate $\mathbf L$.

This affects multiple existing chapter constructions:

- [Predicate specialization](../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-specialization.md) with proper sub-support $\mathrm{dom}(q) \subsetneq E\times E$: $f^*(v)(s, o) = \bot$ off $\mathrm{dom}(q)$, so $f^*$ fails (A3) at off-domain cells.
- The [predicate-generator exhaustiveness](../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/predication-fibration/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md) statement's "encoded as output $\bot$ off $D$" representation device: any generator in the four-class family with $D \subsetneq E\times E$ inherits the same off-$D$ failure of (A3).

And in the boundary extension:

- The [orbit-coloring generators](../../../../../../../pre-bilattice/content/bilattice/content/klein-four-symmetry/content/orbit-coloring-generator/orbit-coloring-generator.md) with at least one orbit set to constant-$\bot$ — 8 of the 18 in the [boundary-extended predicate category](../../objects/boundary-extended-predicate-category.md) for $\mathbf L = \mathbf 2$ — fail (A3) at the painted-$\bot$ orbit. See the inventory in [orbit-coloring fibration extension](../../theorems/orbit-coloring-fibration-extension.md).

The structural reading is that (A3) splits into a *bilattice fragment* (preservation of $\wedge_t, \vee_t, \wedge_k, \vee_k, \sim$) which is well-behaved on every per-orbit lattice-homomorphism choice, and a *residuated fragment* (preservation of $\odot, \Rightarrow$) which fails on any constant-$\bot$ cell for elementary algebraic reasons. The chapter's effective working assumption — and the working assumption needed to close the boundary extension — is one of the following:

- **(R1)** Restrict to sub-fibrations whose generators have no constant-$\bot$ cell (the $\bot$-free fragment). For $\mathcal C^\beta$ at $\mathbf L = \mathbf 2$, $|E|\geq 3$, this gives 10 generators: 4 chapter generators with full domain plus 6 orbit-coloring generators with at most constant-$\top$ painting.
- **(R2)** Weaken (A3) to the bilattice fragment, dropping the residuated fragment from the fibration definition. This admits all 18 generators but loses the residuated structure on reindexing.
- **(R3)** Re-interpret the off-$D$ "$\bot$" as a vacuous-cell marker rather than a $\mathbf L^\bowtie$-element, and define $\odot, \Rightarrow$ at vacuous cells by extension rather than by the twist-product formula. This requires reformulating the fibration with explicit per-cell domain tracking.

The chapter does not currently take an explicit stance among these. The downstream theorems that use the fibration structure either work with the bilattice fragment alone (most of the chapter's two-internal-logics machinery and the Beck-Chevalley argument), or rely on full-domain generators only (the closure-2-monad and Verdier-duality material), or implicitly assume a reading like (R1) or (R3). None of them is invalidated by the tension — but it is unresolved in the chapter, and the boundary extension makes that visible by adding 8 more generators that exhibit the same failure mode.

The honest reading is that the residuated fragment of (A3) is the right place for a chapter-level convention to be stated explicitly, and the boundary-extension theorem [orbit-coloring fibration extension](../../theorems/orbit-coloring-fibration-extension.md) is best read as documenting both the bilattice extension (clean, all 18 generators) and the (A3-residuated) status (10 generators clean, 8 inheriting the chapter's pre-existing tension).
