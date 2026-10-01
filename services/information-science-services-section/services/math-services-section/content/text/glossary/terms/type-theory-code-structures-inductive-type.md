---
type: definition
class: type-former
status: current
depends-on: [pi-type, sigma-type, sum-type]
name: Inductive type
description: An inductive type is a type defined by a finite list of constructors, each producing inhabitants of the type from data of specified types.
---

# Inductive type

An **inductive type** is a type defined by a finite list of *constructors*, each producing inhabitants of the type from data of specified types. The natural numbers are the canonical example:

$$
\mathbb{N} \;:=\; \mathrm{zero} : \mathbb{N} \;\mid\; \mathrm{suc} : \mathbb{N} \to \mathbb{N}
$$

Two constructors: $\mathrm{zero}$ produces a natural from no data, $\mathrm{suc}$ produces a natural from another natural. Every inhabitant of $\mathbb{N}$ is built by finitely many applications of these constructors.

## Structure

An inductive type is specified by:

- A finite list of constructors $c_i : \tau_i \to T$, where each $\tau_i$ may itself mention $T$ (in *strictly positive* positions only — the standard well-foundedness condition).
- An *induction principle* (recursion principle, or eliminator) saying: to construct a function $T \to C$, give a clause for each constructor and possibly recursive results.

Concrete instances include $\mathbb{N}$, lists $\mathrm{List}\,A$, binary trees, vectors $\mathrm{Vec}\,A\,n$ (a dependent inductive type — see [vec-as-dependent-type](../../documents/articles/teaching-articles/examples/vec-as-dependent-type.md)), and the [identity-type](identity-type.md).

## What this is not

An inductive type is *not* a [sum-type](sum-type.md) in general — sums are nullary inductives with two constant constructors, but a real inductive may have constructors taking arguments and may be recursive. An inductive type is *not* a coinductive type — inductives are well-founded (every term is finitely built), coinductives are not.

## Position

Inductive types are the basic data-shaping device of [dependent-type-theory](dependent-type-theory.md): every concrete data structure (numbers, lists, trees, syntax of a language) is presented as an inductive type, and every recursive function on it is presented as an instance of its induction principle. The [identity-type](identity-type.md) is itself an inductive type — the simplest nontrivial dependent inductive. Reference: [Martin-Löf 1984](../../documents/articles/bibliographies/martin-lof1984.md), [Univalent Foundations Program 2013](../../documents/articles/bibliographies/univalent-foundations2013.md) §5.
