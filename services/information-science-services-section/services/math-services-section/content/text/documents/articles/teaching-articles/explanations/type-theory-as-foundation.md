---
type: explanation
article-kind: narrative
status: current
depends-on: [dependent-type-theory, universe, identity-type, univalence-axiom]
title: Type theory as a foundation, alongside set theory
description: For most of the 20th century, the foundation of mathematics was Zermelo-Fraenkel set theory with choice (ZFC).
---

# Type theory as a foundation, alongside set theory

For most of the 20th century, *the* foundation of mathematics was Zermelo-Fraenkel set theory with choice (ZFC). Type theory — Martin-Löf's, then the Calculus of Constructions, then HoTT — has emerged as a *peer* foundation, not a replacement. This narrative scopes what changes when the foundation is type theory rather than set theory.

## What stays the same

- *The mathematics*. Numbers, groups, rings, manifolds, spaces, measures — every mathematical object can be defined in either foundation. The proofs change in style but not in content.
- *Classical mathematics is recoverable*. Adding an excluded-middle axiom (and choice, if needed) to MLTT recovers everything ZFC can prove. The classical/intuitionistic split is orthogonal to the set/type split.
- *Mathlib-style libraries are foundation-agnostic in practice*. Whether mathlib is "really" set-theoretic or type-theoretic is a perspective question; the lemmas are the same.

## What changes

- *Equality is structured.* In set theory, $a = b$ is a primitive predicate, true or false. In type theory, $a =_A b$ is the [identity-type](../../../../glossary/terms/identity-type.md) — itself a type, with potentially many inhabitants (in HoTT, with [univalence](../../../../glossary/terms/univalence-axiom.md), the inhabitants of $A =_{\mathrm{Type}} B$ are *equivalences* between $A$ and $B$).
- *Quantifiers carry computational content.* A constructive proof of $\forall n.\,\exists m.\,P(n, m)$ is a *function* $n \mapsto m$, by [pi-types](../../../../glossary/terms/pi-type.md) and [sigma-types](../../../../glossary/terms/sigma-type.md) under [curry-howard](../../research-articles/curry-howard-correspondence.md). The same statement in ZFC is a model-theoretic claim with no preferred witness.
- *Mathematical structures are bundles, not sets-with-decoration.* A group is a [sigma-type](../../../../glossary/terms/sigma-type.md) bundling a carrier with operations and proofs of the axioms — categorically, an inhabitant of the *type of groups*. In ZFC, a group is a set together with externally-attached structure.
- *Universes are stratified by [level](../../../../glossary/terms/universe-level.md).* Russell's paradox in set-theoretic guise is the size paradox of "the set of all sets"; in type-theoretic guise, $\mathrm{Type} : \mathrm{Type}$. The fixes (proper classes; universe stratification) play the same role.

## Why this matters for the corpus

The corpus's preferred proof assistant is [Lean](../../../../glossary/terms/dependent-type-theory.md), which uses MLTT plus an impredicative `Prop`. Mathlib is built in Lean. So when the corpus binds a theorem to Lean, the theorem lives in *type theory*, regardless of how it was originally proved. Type theory is therefore not a pet topic — it is the foundation in which the corpus's formalised mathematics actually lives.

The corpus's predication-categories directory carries the *categorical semantics* of dependent type theory; this directory carries the *syntactic* side. Together they constitute the foundation the corpus uses.
