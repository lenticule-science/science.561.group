---
kind: theorem
status: proved
depends-on: [predication-hyperdoctrine, dual-predication-hyperdoctrine, jung-rivieccio-duality, settling-coalgebra-structure, closure-2-monad, temporal-2-category, beck-chevalley-commutation-on-predication-bilattices, frobenius-for-knowledge-and-truth-meets, lawvere-comprehension-classical, lawvere-comprehension-paraconsistent, predicate-specialization, predicate-converse, predicate-subject-projection, predicate-object-projection]
---

# Priestley dualizability

For every [predication hyperdoctrine](../objects/predication-hyperdoctrine.md) $\mathcal{E}$ over $(\mathbf{L}, \mathcal{C}, E)$ there exists a coherent [dual predication hyperdoctrine](../objects/dual-predication-hyperdoctrine.md) $(\mathcal{E}^*, p^*, \mathbb{M}^*, \mathbb{N}^*, \mathrm{Cl}^*, \mathbf{T}^*)$.
All four structural coherences below are satisfied.

## Proof

The dualization is performed piece by piece; coherence then follows from the functoriality of [Jung–Rivieccio duality](jung-rivieccio-duality.md) and the involutive shape of the KZ diamond.

**Fiberwise duality.** Each [predication fiber algebra](../objects/predication-fiber-algebra.md) $A_q = \mathcal{E}_q$ is a distributive bilattice; Jung–Rivieccio gives $\mathcal{E}^*_q := \mathrm{Spec}(A_q) \in \mathbf{PairedPriSp}$.

**Variance flip.** A fibration whose fibers live in a contravariantly-dual category dualizes to an opfibration: morphism direction in $\mathcal{C}$ is preserved, but the fiber-direction variance flips, yielding $p^* : \mathcal{E}^* \to \mathcal{C}^{\mathrm{op}}$.

**Generator dualization.** Each of the four predicate generators has the Priestley dual recorded in [dual predication hyperdoctrine](../objects/dual-predication-hyperdoctrine.md): specialization $\to$ inclusion of spectra; converse $\to$ swap; subject-projection $\to$ diagonal-extension; object-projection $\to$ columnwise-extension.

**Adjoint-system dualization.** $\leq_k$ on fibers dualizes to Priestley-refinement order on paired Priestley points; $\leq_t$ to designated-values-comparison order.
Adjoints in each order dualize via Jung–Rivieccio functoriality; explicit formulas come from the fiberwise duality together with the [quantifier adjoint structure](../theorems/predicate-converse-quantifier-adjoints.md).
[Frobenius for $\wedge_k, \wedge_t$](frobenius-for-knowledge-and-truth-meets.md), [Beck–Chevalley](beck-chevalley-commutation-on-predication-bilattices.md), and Lawvere comprehension ([classical](lawvere-comprehension-classical.md), [paraconsistent](lawvere-comprehension-paraconsistent.md)) all cross over.

**Fibration-KZ dualization.** Under the $\mathcal{K}^{\mathrm{op}}$-identity, a colax-idempotent 2-monad dualizes to a lax-idempotent 2-comonad and vice versa.
Hence the [Gray–Street fibration 2-monad](gray-street-fibration-monad.md) $\mathbb{M}$ dualizes to $\mathbb{M}^*$ (lax-idempotent 2-comonad) and the [Emmenegger comonad](emmenegger-fibration-comonad.md) $\mathbb{N}$ to $\mathbb{N}^*$ (colax-idempotent 2-monad).
The 2-adjunction $\mathbb{M} \dashv \mathbb{N}$ dualizes to $\mathbb{M}^* \dashv \mathbb{N}^*$ with the diamond shape preserved, monad/comonad roles swapped.

**Closure-KZ dualization.** $\mathrm{Cl}$ (lax-idempotent 2-monad on $\mathbf{PrFib}$) dualizes to $\mathrm{Cl}^*$ (colax-idempotent 2-comonad on $\mathbf{PrFib}^*$).
Where $\mathrm{Cl}$ inflates and adds consequences, $\mathrm{Cl}^*$ deflates and removes non-confirming Priestley points.

**Temporal 2-category dualization.** The 0-cells $(\tau, X)$ of $\mathbf{T}(\mathcal{C}, \lambda)$ dualize to $(\tau, X^*)$ with $\tau \in \lambda^{\mathrm{op}}$ and $X^* \in \mathbf{Cat}/\mathcal{C}^{\mathrm{op}}$; 1- and 2-cells dualize via the dual 2-adjunction.

**Settling coalgebra–algebra duality.** Standard categorical duality sends coalgebras $c : X \to F(X)$ to algebras $c^* : F^*(X^*) \to X^*$ of the dual functor.
The [knowledge-presheaf settling coalgebra](../objects/settling-coalgebra-structure.md) $c : \mathcal{E} \to F_U(\mathcal{E})$ dualizes to a settling algebra $c^* : F_U^*(\mathcal{E}^*) \to \mathcal{E}^*$, with $\leq_k$-monotone primal orbit becoming a co-monotone dual orbit.

## Coherence checks

1. **Functoriality.** Morphisms of predication hyperdoctrines dualize to morphisms of dual structures, composition preserved — by Jung–Rivieccio's categorical duality.
2. **Self-duality of the KZ diamond.** $(\mathbb{M}, \mathbb{N})$ has the same abstract structure as $(\mathbb{M}^*, \mathbb{N}^*)$ with monad/comonad swapped — an involutive structure preserving the diamond shape.
3. **Compatibility of the two adjoint systems.** Both $\leq_k$ and $\leq_t$ systems dualize to parallel dual systems; Jung–Rivieccio preserves both orders since they correspond to orthogonal directions on the paired Priestley space.
4. **Coalgebra–algebra duality with KZ duality.** Both are $\mathcal{K}^{\mathrm{op}}$-style dualizations; they commute.
  Coalgebra structure $c$ dualizing to algebra structure $c^*$ is consistent with dualizing $F_U$ to $F_U^*$ via $\mathrm{Cl} \leftrightarrow \mathrm{Cl}^*$. $\square$

## Regime-dependent dual structure

Each [regime](four-regime-dichotomy.md) has a dual face:

- **A.** Finite Priestley spaces; dual settling converges in finite steps.
  Standard finite Stone-duality.
- **B.** Scott-cocontinuous dual closure; dual settling converges at $\omega$.
- **C.** Transfinite-bounded co-closure ordinal matching the primal $\kappa$.
- **D.** [Aperiodic](../concepts/aperiodic-settling.md) dual settling.
  The dual Priestley spectrum carries cohomology classes detecting the orbit's invariants — invariants inaccessible to any primal fixed-point theorem.
