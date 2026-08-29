---
title: "Predication hyperdoctrine"
description: "A predication fibration that additionally supports two parallel adjoint quantifier systems — one in the knowledge order, one in the truth order — with Frobenius reciprocity, Beck–Chevalley coherence, and comprehension. The predicate-logical layer of the predication framework."
defines:
  - predication hyperdoctrine
related:
  - predication-fibration
  - predicate-category
  - knowledge-order
  - truth-order
  - predication
date-created: 2026-04-28
---

A **predication hyperdoctrine** is a [predication fibration](predication-fibration.md) that additionally supports four classes of structure, each a property in the Kelly–Lack sense (present-or-not, no choice involved, unique up to unique iso when present). It is the *predicate-logical layer* of the framework — the structure at which substitution, quantification, equality, and comprehension all appear, and at which predication can be reasoned about as a logic in the Lawvere–Seely sense.

## The four conditions

**(B1) Quantifier adjoints.** For every morphism $f : q \to p$ in the [predicate category](predicate-category.md) $\mathcal{C}$, the reindexing $f^* : \mathcal{E}_p \to \mathcal{E}_q$ has both a left adjoint and a right adjoint in *each* of the two parallel orders. In the [knowledge order](knowledge-order.md):

$$\exists_f^k \dashv f^* \dashv \forall_f^k.$$

In the [truth order](truth-order.md):

$$\exists_f^t \dashv f^* \dashv \forall_f^t.$$

The two adjoint systems are independent and coexist on the same fibration.

**(B2) Frobenius reciprocity.** For each of the four generator classes and for each of the two orders, the existential quantifier interacts with conjunction via the Frobenius condition. In the knowledge order: for every $f : q \to p$, every $\alpha \in \mathcal{E}_p$, $\phi \in \mathcal{E}_q$,

$$\exists_f^k(f^*(\alpha) \wedge_k \phi) \cong \alpha \wedge_k \exists_f^k(\phi),$$

with the analogous statement holding in the truth order.

**(B3) Beck–Chevalley coherence.** For every pullback square in $\mathcal{C}$, the canonical natural transformation between $\exists$-then-$f^*$ and $f^*$-then-$\exists$ (in both adjoint systems) is an isomorphism. This is the coherence condition that makes substitution and quantification commute up to natural iso, in both the knowledge and truth orderings.

**(B4) Comprehension.** For every predicate $p \in \mathcal{C}$, the *extension functor* $\mathrm{Ext} : \mathcal{C}/p \to \mathcal{E}_p$ has a right adjoint, in each of the two adjoint systems. The right adjoint is the comprehension schema: it sends a fiber element to the slice object that *embodies* the element. The two comprehension schemas (one per order) yield two derived equality predicates: classical equality (from truth-order comprehension) and a paraconsistent equality (from knowledge-order comprehension).

## Two parallel adjoint systems

The presence of *two* parallel adjoint quantifier systems is structurally distinctive. In ordinary first-order logic over Heyting-valued fibers, there is one adjoint system per logical operation; the structure does not distinguish between *evidence direction* and *evidence amount*. The [bilattice](bilattice.md) fiber algebra has two natural orders, and the predication hyperdoctrine carries hyperdoctrinal adjoint structure in each. The two systems do not collapse and are not equivalent.

The two derived equality predicates are not redundant. *Classical equality* (from truth-order comprehension) treats two predication-cell positions as equal when their truth-axis values match; *paraconsistent equality* (from knowledge-order comprehension) treats them as equal when their full bilattice positions match, distinguishing *both*-determined cases from *true*-only cases. Both equalities are necessary because the framework records evidential richness, not just truth value.

## Frobenius for fusion fails

The [twist-product](twist-product.md) fusion $\odot$ is non-integral: its monoidal unit is not the truth-order top, and its absorber is not the knowledge-order bottom. For Frobenius to hold, the connective's absorber must align with the value $\exists_f$ extends by — $\bot$ in the knowledge order, $\mathbf{f}$ in the truth order. The bilattice operations $\wedge_k$ and $\wedge_t$ each have absorbers that align (so Frobenius holds). The fusion $\odot$ does not — its absorber misaligns with three of the four generator classes, so Frobenius fails for $\odot$ in the knowledge order. The hyperdoctrine therefore carries Frobenius for $\wedge_k$ and $\wedge_t$ but not for $\odot$.

## In the layer stack

1. The [predicate category](predicate-category.md) gives the indexing base.
2. The [predication fibration](predication-fibration.md) adds the fibrational structure.
3. **The predication hyperdoctrine** adds the hyperdoctrinal structure.

Beyond this layer sit settling-equipped hyperdoctrines (temporal content, via a coalgebra for a settling endofunctor), Priestley-dual stratifications (cohomological content), and the applied programs that build on predication.

## See also

- [Predication fibration](predication-fibration.md) — the layer below.
- [Predicate category](predicate-category.md) — the indexing base.
- [Knowledge order](knowledge-order.md), [Truth order](truth-order.md) — the two orders that support parallel adjoint systems.
- [Predication](predication.md) — the framework these layers articulate.
