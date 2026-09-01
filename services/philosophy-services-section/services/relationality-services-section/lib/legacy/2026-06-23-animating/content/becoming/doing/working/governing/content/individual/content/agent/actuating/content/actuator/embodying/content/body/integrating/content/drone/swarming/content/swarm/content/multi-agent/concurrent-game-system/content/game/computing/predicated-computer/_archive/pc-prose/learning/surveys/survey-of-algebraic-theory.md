---
description: Peer-effort scan checking whether anyone has already derived Lawvere algebraic theories from predication-categorical (bilattice-fibered, closure-driven, settling-based) primitives. Run before attempting the derivation in the question file, to avoid duplicating published work.
status: complete
session-date: 2026-05-16
topic: research-prep
authorizing-prompt: skunkworks contract to extend predication category theory by deriving Lawvere algebraic theories from its primitives
---

## Scope and motivation

This survey does **not** define a Lawvere algebraic theory for a reader — that pin is in [`prose/learning/questions/what-is-algebraic-theory.md`](../questions/what-is-algebraic-theory.md). Its purpose is narrower: to check whether the literature already contains the derivation we are about to attempt, so we don't duplicate peer effort. The derivation, briefly, is: starting from bilattice-fibered predication hyperdoctrines, closure-2-monads, settling dynamics, and the bigraded diamond tower of the [predication-categories corpus](../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/_index.md), construct what a Lawvere algebraic theory is as a *derived* structure inside that vocabulary — not by encoding Lawvere's axioms into translation-equivalents.

## Top-line finding

**No published work performs this derivation.** Predication category theory as developed in the corpus is not a public framework; the term "predication category" in 2026 returns Aristotelian-logic glosses, not bilattice-fibered hyperdoctrines. The corpus's primitives — closure 2-monads on bilattice-valued fiber algebras, settling as transfinite closure iteration, bigraded diamond towers, the four-regime dichotomy — have no peer literature to duplicate from.

What *does* exist is a small set of adjacent threads that any honest derivation must position itself against. The derivation is research-novel; the surrounding machinery is mature.

## Adjacent threads to position against

### Bilattice-valued and many-valued hyperdoctrines

- **Maruyama, *Fibred Algebraic Semantics for a Variety of Non-Classical First-Order Logics and Topological Logical Translation* (2021+).** Extends Lawvere-hyperdoctrinal semantics across substructural and many-valued first-order logics, with a uniform completeness theorem. Closest peer work in spirit: uses Lawvere-hyperdoctrines as the ambient frame, allows non-classical (including bilattice-relevant) values in fibers. Does **not** derive Lawvere algebraic theories; treats them as ambient apparatus.
- **Kamide, *Lattice Logic, Bilattice Logic and Paraconsistent Quantum Logic: a Unified Framework Based on Monosequent Systems* (2020).** Proof-theoretic foundation for bilattice logic; categorical-algebraic angle, but not Lawvere-theoretic and not fibered. Tangential.
- **Fitting tradition (Ginsberg, Fitting, Arieli–Avron).** Bilattices for logic-programming and well-founded paraconsistent semantics. Establishes the bilattice-as-truth-value-space vocabulary the corpus inherits but does not pursue Lawvere-style universal algebra.

### Lawvere-hyperdoctrine reconstructions

- **Melliès–Zeilberger, *A bifibrational reconstruction of Lawvere's presheaf hyperdoctrine* (arXiv:1601.06098, 2016; LICS 2018).** Reconstructs *the* presheaf hyperdoctrine via a full-faithful embedding into a monoidal closed bifibration. Aim is reconstructing one named hyperdoctrine, not deriving Lawvere theories.
- **Bonchi–Di Liberti–Genovese–Santamaria, *When Lawvere Meets Peirce: An Equational Presentation of Boolean Hyperdoctrines* (MFCS 2024).** Establishes a correspondence between Lawvere's Boolean hyperdoctrines and Peircean (first-order) bicategories. Direction: presenting hyperdoctrines equationally, not extracting Lawvere theories from hyperdoctrines.
- **Trotta and collaborators, *Dialectica principles via Gödel doctrines* (2023).** Doctrine-level structural results that bear on the comprehension-and-quantifier-adjoint shape the predication-hyperdoctrine already has, but again not Lawvere-theoretic.

### Enriched monad-theory correspondence

- **Lucyshyn-Wright, *An enriched view on the extended finitary monad-Lawvere theory correspondence* (arXiv:1707.08694, 2017).** Enriched-categorical generalization of Lawvere's correspondence between finitary monads and Lawvere theories. This is the technology a bilattice-enriched Lawvere theory would lean on.
- **Lucyshyn-Wright, *Enriched structure-semantics adjunctions and monad-theory equivalences for subcategories of arities* (arXiv:2305.07076, 2023).** Axiomatic framework subsuming Lawvere, Linton, Dubuc, Power, Nishizawa–Power. The natural ambient for stating any "Lawvere theory enriched in a bilattice-valued context."
- **Smirnov / Katsumata / Levy / Mellies–Petrişan and successors, *Graded Algebraic Theories* (arXiv:2002.06784, 2020).** Graded Lawvere theories — Lawvere theories indexed by a monoid of effects. Resonates with the corpus's bigraded diamond tower if one wants to bigrade by the (truth, knowledge) Klein-four.

These three (especially Lucyshyn-Wright 2023) supply the abstract enriched-Lawvere-theoretic vocabulary the derivation can target. None of them is set in a bilattice-fibered, closure-driven, settling-based ambient.

### Closure operators, 2-monads, and fixpoint semantics

- **Marra–Predoiu–Rotenberg, *Categorical Approximation Fixpoint Theory* (Springer 2023+).** Generalizes Denecker–Vennekens–Bruynooghe AFT from complete lattices to categories; studies non-monotonic operators' fixpoints. Conceptually parallel to the corpus's settling-as-transfinite-closure machinery but does not connect to Lawvere theories.
- **Kelly–Lack and successors on lax-idempotent (KZ) 2-monads.** The corpus's closure 2-monad sits inside this tradition. Property-likeness (Kelly–Lack 1997) is invoked in `predication-hyperdoctrine.md`. No work in this tradition derives Lawvere theories from lax-idempotent 2-monad data; Lawvere theories are property-like in a different (finite-product–preserving) sense.
- **Emmenegger, *fibrations as comonad-pseudo-coalgebras* (cited by `predication-fibration.md`).** Used inside the corpus already; cited here for completeness.

### Predication-category-internal work

Inside the corpus itself, the following sit closest to the question but are **not** what a Lawvere algebraic theory is:

- [`objects/predication-theory.md`](../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-theory.md) — quadruple $(\mathbf L, \mathcal C, E, \mathrm{Cl})$. The corpus's *theory* notion. Different from a Lawvere algebraic theory: it has a residuated-lattice value object and an explicit closure operator; the Lawvere notion has neither.
- [`objects/subtheory.md`](../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/subtheory.md) — type-embedded subtheory with restricted closure. Internal to predication-theories; not Lawverian.
- [`theorems/lawvere-comprehension-classical.md`](../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/lawvere-comprehension-classical.md) and [`lawvere-comprehension-paraconsistent.md`](../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/lawvere-comprehension-paraconsistent.md) — *Lawvere's comprehension scheme* realized in predication-hyperdoctrines. This is a different Lawverian construction: comprehension is the right adjoint to extension, picking out an object from a predicate; an algebraic theory is a category presenting operations on a sort. The corpus already has the former; the latter is what the question seeks.
- [`theorems/tarski-lawvere-*`](../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/) — direct-limit / fixed-point / cellular-stalk results in the Tarski-Lawvere fixed-point lineage. Concern fixed-point semantics of settling, not algebraic-theory structure.
- [`theorems/q-enriched-hodge-theorem-lawvere-quantale.md`](../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/q-enriched-hodge-theorem-lawvere-quantale.md) — uses Lawvere's quantale enrichment for $\mathbb R$-valued Hodge theory. The "Lawvere quantale" is the half-line $[0, \infty]$ as a monoidal category, after Lawvere's *Metric spaces, generalized logic, and closed categories*. Tangential to the algebraic-theory question.

## Where the gap is

Combining the threads above:

- bilattice-valued hyperdoctrines exist (Maruyama, Kamide tradition);
- enriched Lawvere theories exist (Lucyshyn-Wright and predecessors);
- lax-idempotent 2-monads with comprehension are property-like doctrines (Kelly–Lack tradition);
- closure-driven fixpoint semantics in categorical form exist (Marra et al.);

but no published work **simultaneously**: (i) takes a bilattice-fibered hyperdoctrine, (ii) treats it as having a closure 2-monad driving transfinite settling, and (iii) extracts from that data a Lawvere algebraic theory as a derived structure. The corpus has (i)–(iii); the literature does not link them to (iv) the Lawvere-theory output.

The derivation we are attempting is therefore not duplicative. It can borrow:

- enriched-Lawvere-theory technology (Lucyshyn-Wright) for the target shape;
- graded Lawvere theories (Smirnov et al.) if the bigraded diamond should be folded in;
- the corpus's own comprehension theorems (Lawvere comprehension classical / paraconsistent) as the right adjoint that gives "the object satisfying a predicate" — almost certainly load-bearing in the derivation.

## What the derivation must *not* do

To be honest about the gap:

- Not re-derive a Lawvere theory by translating "finite-product category with single generator" into predication vocabulary phrase-by-phrase. That is an encoding, not a derivation, and the corpus's own integration specifications reject such encodings.
- Not conflate Lawvere comprehension (already in the corpus) with a Lawvere algebraic theory (the target). These are different Lawverian constructions; sharing his name is incidental.
- Not conflate predication-theory (the corpus's $(\mathbf L, \mathcal C, E, \mathrm{Cl})$ notion) with a Lawvere algebraic theory. These are different theory-notions; both are categories of mathematical theories, but the structural commitments differ.

## Sources

- Maruyama, [*Fibred Algebraic Semantics for a Variety of Non-Classical First-Order Logics and Topological Logical Translation*](https://www.researchgate.net/publication/352294485_Fibred_Algebraic_Semantics_for_a_Variety_of_Non-Classical_First-Order_Logics_and_Topological_Logical_Translation), 2021+
- Kamide, [*Lattice Logic, Bilattice Logic and Paraconsistent Quantum Logic: a Unified Framework Based on Monosequent Systems*](https://link.springer.com/article/10.1007/s10992-020-09585-2), 2020
- Melliès–Zeilberger, [*A bifibrational reconstruction of Lawvere's presheaf hyperdoctrine*](https://arxiv.org/abs/1601.06098), 2016/2018
- Bonchi et al., [*When Lawvere Meets Peirce: An Equational Presentation of Boolean Hyperdoctrines*](https://drops.dagstuhl.de/storage/00lipics/lipics-vol306-mfcs2024/LIPIcs.MFCS.2024.30/LIPIcs.MFCS.2024.30.pdf), MFCS 2024
- Lucyshyn-Wright, [*An enriched view on the extended finitary monad–Lawvere theory correspondence*](https://arxiv.org/abs/1707.08694), 2017
- Lucyshyn-Wright, [*Enriched structure-semantics adjunctions and monad-theory equivalences for subcategories of arities*](https://arxiv.org/abs/2305.07076), 2023
- Smirnov et al., [*Graded Algebraic Theories*](https://arxiv.org/pdf/2002.06784), 2020
- Trotta et al., [*Dialectica principles via Gödel doctrines*](https://www.sciencedirect.com/science/article/abs/pii/S0304397523000051), 2023
- [Lawvere theory — nLab](https://ncatlab.org/nlab/show/Lawvere+theory)
- [lax-idempotent 2-monad — nLab](https://ncatlab.org/nlab/show/lax-idempotent+2-monad)
