---
name: "Heyting Prealgebra"
identity: heyting-prealgebra
description: "A Heyting prealgebra is a preorder with top, bottom, binary meet, binary join and implication, each fixed by its universal property, so the laws of a Heyting algebra hold up to mutual entailment; its quotient by mutual entailment is a Heyting algebra."
date-created: 2026-10-15
see-also:
  - heyting-algebra
  - preorder
  - predication-fiber-algebra
  - prealgebra
target: lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/content/text/glossary/terms/
provenance:
  sources:
    - "The Leader's use of 'Heyting prealgebra' in the message of 2026-10-15 02:29 (cmsg_01XwuMccuzdSBUfcaeZbrBjDDEHzQZ3kADT9Wgv6Y2krbF)."
    - "Held neighbors, read in `content/research/2026-10-15-study-heyting-algebra.md`: glossary `heyting-algebra`, glossary `preorder`, and the relational Heyting theorem note, which builds its lattice on a preorder."
    - "Outside anchor, from the coordinator's relay of 2026-10-15 03:46 Hyland, Johnstone and Pitts, 'Tripos theory' (1980); van Oosten, 'Realizability: An Introduction to its Categorical Side' (2008)."
---
A **Heyting prealgebra** is a preorder `(P, <=)` that has the Heyting operations without requiring antisymmetry. Write `x ~ y` when `x <= y` and `y <= x` (mutual entailment). The structure supplies:

- a top `T` with `x <= T` for all `x`, and a bottom `F` with `F <= x` for all `x`;
- a binary meet `x ^ y` with `z <= x ^ y` if and only if `z <= x` and `z <= y`;
- a binary join `x v y` with `x v y <= z` if and only if `x <= z` and `y <= z`;
- an implication `x => y` with `z <= (x => y)` if and only if `z ^ x <= y`.

Each operation is fixed only up to `~`. Two choices of meet for the same pair are mutually entailing, not equal. A Heyting algebra is the special case in which `~` is equality.

## Relation to the held terms
- `heyting-algebra`: the quotient `P/~` is a Heyting algebra, and every Heyting algebra is a Heyting prealgebra. The two have the same logic. They differ in what an element is: in the prealgebra, a proof-relevant or presentation-dependent predicate; in the algebra, its class under entailment.
- `preorder`: the held entry already says every preorder is a partial order up to ties. A Heyting prealgebra is a preorder with the four operations above, so the quotient it needs is the one that entry describes.
- `predication-fiber-algebra`: if the fiber of a predicate over a point is a Heyting prealgebra, the predication fibers form an indexed family of them, which is the tripos shape below. This link is a reading to check against that entry, not a statement either source makes.

## Where the term comes from outside
In realizability, a **tripos** is a functor from `Set^op` to Heyting prealgebras that has adjoints for substitution along every function (existential and universal quantification, satisfying the Beck–Chevalley condition) and a generic predicate. Its fibers are Heyting prealgebras because realizability predicates are compared by the existence of a realizer, not by equality, so the order is a preorder and antisymmetry fails. The topos built from a tripos has the quotients of those fibers as its subobject lattices.

## What is not settled
No held source defines the term. The tension the reader recorded stands: the relational Heyting theorem note earns a preorder and says lattice. A Heyting prealgebra is the structure that note proves before quotienting. Whether the Leader means exactly this, or the tripos fiber with its quantifier adjoints, is for the Leader to confirm by editing this entry.

## Target
Target path: `lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/content/text/glossary/terms/` in `561-group/bare-cedar-fog`, the Mathematics Services Section glossary terms directory.
