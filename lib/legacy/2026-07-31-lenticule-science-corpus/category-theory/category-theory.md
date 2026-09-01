---
title: Category Theory (staged derivation)
description: A staged proof tree deriving the objects of category theory by what generates them, rooted arrows-first (an object is recovered from its morphisms, Yoneda). Standard category theory is a degenerate shadow; its realized in-chain instance is the predicate-category — a Lawvere hyperdoctrine over the bilattice FOUR, generated downstream at predicating/positing/settling. Lives in _archive pending graft onto the live spine.
date-created: 2026-06-19
date-modified: 2026-06-21
keywords: ["category-theory", "morphism", "yoneda", "functor", "hyperdoctrine", "predicate-category", "staged"]
---


## What this is

This is **not** a discipline bucket. "Category theory" names a human study-of, not a
math object; there is no `category-theory` node on the spine. What lives here is a
**staged proof tree** that derives the *objects* category theory is about — by what
generates each, read left-to-right as a proof — kept under `_archive/` until its graft
point onto the live `mark/` spine is derived. It mirrors the `algebra/` staging:
[`_archive/`](_archive) holds the tree; schemas carry the entailment edges
(`allOf` = is-a refinement, `$ref` = a map's domain/codomain).

## The reading: arrows first

The corpus's law is read three ways — syntactically (type theory), proof-theoretically
([logic](../../mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/logic/logic.md) at positing),
and **semantically** (here). The semantic statement is the Yoneda embedding
`𝒴(A) = Hom(−, A)`: an object is recovered, fully and faithfully, from its bundle of
incoming arrows, and from nothing else. So this tree is rooted **arrows-first** — the
[`morphism`](_archive/morphism/morphism.md) is the primitive; the
[`object`](_archive/category/scripts/functoring/content/functor/scripts/representing/content/presheaf/scripts/pointing/content/object/object.md)
is *recovered* far downstream, at the representable [`presheaf`](_archive/category/scripts/functoring/content/functor/scripts/representing/content/presheaf/presheaf.md),
not assumed at the top. Filing here is a tag (an arrow the document offers), never a
container that owns an object — that is the corpus's own holographic method.

## The two roots

- [`morphism`](_archive/morphism/morphism.md) — the arrow (the foundation): generates
  [`composition`](_archive/morphism/scripts/composing/content/composition/composition.md)
  (`composing`), [`identity-morphism`](_archive/morphism/scripts/identifying/content/identity-morphism/identity-morphism.md)
  (`identifying`), and [`isomorphism`](_archive/morphism/scripts/inverting/content/isomorphism/isomorphism.md) (`inverting`).
- [`category`](_archive/category/category.md) — morphisms closed under associative
  composition with identities (its schema `$ref`s the foundation). From it descend:
  - `functoring` → [`functor`](_archive/category/scripts/functoring/content/functor/functor.md) → `transforming` → `natural-transformation` → `adjoining` → `adjoint-pair` (→ `invertibilizing` → `equivalence`);
  - `functor`'s further branches: `extending` → `kan-extension`; `fibering` → **`hyperdoctrine`**; `representing` → `presheaf` → `pointing` → `object`, and `simplicializing` → `simplicial-set` → (`puncturing` → `horn`) → `filling` → `quasi-category` → `ascending` → `infinity-category` → `groupoidifying` → `infinity-1-category` → `descending` → `infinity-1-topos`;
  - `diagramming` → `commutative-diagram` → `factoring` → `factorization`;
  - `dualizing` → `opposite-category` (the carrier of duality);
  - `tensoring` → `monoidal-category` (→ `multiplying` → `tensor-product`, `uniting` → `unit-object`, `enriching` → `enriched-category` → `internalizing` → `hom-object`).

## The shadow and its realized instance

What standard category theory states in full generality is the **degenerate shadow**
of theorems this program proves in its own chain. The realized in-chain category is the
**predicate-category**: a Lawvere [`hyperdoctrine`](_archive/category/scripts/functoring/content/functor/scripts/fibering/content/hyperdoctrine/hyperdoctrine.md)
`P : C^op → MALL_FOUR` whose fibers are the bilattice **FOUR**, with reindexing carrying
`∃ ⊣ f* ⊣ ∀`, settling as the least fixpoint of a fiber-wise nucleus, and H¹ = 0 by
cohomological dimension ≤ 1. That object is generated downstream at
predicating/positing/settling (where `presheaf`, `sheaf`, `adjunction`, and the
subobject classifier already live). `fibering` is the bridge: it is where this abstract
shadow tree points at its concrete realization. When this tree is grafted, the shadow
nodes collapse into those in-chain ones; until then they are staged here, derived but
not yet wired to the spine.
