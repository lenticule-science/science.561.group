---
type: narrative
discusses: [predication-hyperdoctrine, classical-equality, paraconsistent-equality, lawvere-comprehension-classical, lawvere-comprehension-paraconsistent, frobenius-for-knowledge-and-truth-meets, beck-chevalley-commutation-on-predication-bilattices]
---

# The Lawvere–Seely lineage in bilattice form

Lawvere's original hyperdoctrines (1969) require cartesian-closed fibers; [@seely1983] adds finite coproducts for disjunction. The [predication hyperdoctrine](../../objects/predication-hyperdoctrine.md) is in this family but with bilattice-valued fibers in place of cartesian-closed ones, so each of Lawvere's and Seely's signature contributions inherits in adapted form.

## Equality from diagonal-$\Sigma$

[@lawvere1970]'s equality predicate $\Delta_X = 1_X \Sigma_{\langle X, X \rangle}$ — image of the fiber terminal under the diagonal's $\Sigma$ — appears here twice, once per adjoint system. Applying the $\leq_t$-side $\exists$ to the diagonal specialization's $\leq_t$-terminal yields [classical equality](../../objects/classical-equality.md) $=_E$, two-valued $\mathbf{t}/\mathbf{f}$. Applying the $\leq_k$-side $\exists$ yields [paraconsistent equality](../../../../../../valuation/content/knowledge-least-valuation/settling/content/predication-hyperdoctrine/content/paraconsistent-equality/paraconsistent-equality.md) $\Delta_E^k$, four-valued $\top/\bot$. Both are derived rather than postulated — the postulate-as-primitive convention in BD∆-style first-order bilattice logics arises from not having identified the dual adjoint triple.

## Frobenius reciprocity, with caveats

Lawvere's $\wedge$-Frobenius generalizes here to $\wedge_k$ and $\wedge_t$ ([Frobenius for knowledge and truth meets](../../../../../../valuation/content/knowledge-least-valuation/settling/references/frobenius-for-knowledge-and-truth-meets.md)). It does *not* generalize to the [twist-product](../../../../../../residuated-lattice/content/twist-product/twist-product.md) fusion $\odot$ — see [Frobenius-for-fusion fails](../../../../../../valuation/content/knowledge-least-valuation/settling/references/frobenius-for-fusion-fails.md) — which is what Maruyama's $\otimes$-Frobenius would prefer; the obstruction is the non-integrality of $\odot$.

## Comprehension schema, twice

[@lawvere1970]'s comprehension functor as right adjoint to extension reappears as [Lawvere comprehension (classical)](../../../../../../valuation/content/knowledge-least-valuation/settling/content/predication-hyperdoctrine/references/lawvere-comprehension-classical.md) and [Lawvere comprehension (paraconsistent)](../../../../../../valuation/content/knowledge-least-valuation/settling/content/predication-hyperdoctrine/references/lawvere-comprehension-paraconsistent.md): two parallel comprehension schemas, one per designation, one per adjoint system.

## Seely's Beck–Chevalley

[@seely1983]'s main theorem reads "a hyperdoctrine satisfies BC for a pullback iff it knows the diagram is a pullback." [Beck–Chevalley commutation on predication bilattices](../../theorems/beck-chevalley-commutation-on-predication-bilattices.md) discharges this uniformly for every pullback square in $\mathcal{C}$. The cellwise structure of the [predication fiber algebras](../../objects/predication-fiber-algebra.md) — uniform $\mathbf{L}^{\bowtie E \times E}$ across fibers, with reindexing via equivariant partial maps — makes BC automatic in a way that classical type-varying hyperdoctrines do not enjoy. Seely's "knows the diagram is a pullback" reduces here to the cellwise base-change lemma on the index-map category.
