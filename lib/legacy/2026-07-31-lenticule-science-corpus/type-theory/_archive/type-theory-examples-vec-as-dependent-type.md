---
type: example
status: current
depends-on: [dependent-type-theory, inductive-type, pi-type]
---

# Length-indexed vectors as a dependent inductive type

The type $\mathrm{Vec}\,A\,n$ of length-$n$ lists of $A$-elements is the canonical worked example of a *dependent inductive type*: an [inductive-type](../objects/inductive-type.md) whose definition uses a [pi-type](../objects/pi-type.md) to make the length part of the type.

## The definition

$$
\mathrm{Vec} : \mathrm{Type} \to \mathbb{N} \to \mathrm{Type}
$$

with two constructors:

- $\mathrm{nil}_A : \mathrm{Vec}\,A\,0$ — the empty vector.
- $\mathrm{cons}_A : \Pi(n : \mathbb{N}).\,A \to \mathrm{Vec}\,A\,n \to \mathrm{Vec}\,A\,(n+1)$ — prepend an element, increasing the length by one.

Every closed inhabitant of $\mathrm{Vec}\,A\,n$ is built by exactly $n$ applications of $\mathrm{cons}$ to a $\mathrm{nil}$.

## What this enables

- *Total head function*. $\mathrm{head} : \Pi(n : \mathbb{N}).\,\mathrm{Vec}\,A\,(n+1) \to A$ is total — its domain is non-empty vectors, and the type system enforces non-emptiness. There is no possibility of "head of empty list" runtime errors; the empty vector cannot be passed.
- *Type-checked concatenation*. $\mathrm{append} : \Pi(m\,n : \mathbb{N}).\,\mathrm{Vec}\,A\,m \to \mathrm{Vec}\,A\,n \to \mathrm{Vec}\,A\,(m+n)$ — the type guarantees the length adds correctly. Off-by-one errors in the implementation become type errors.
- *Dependent pattern matching*. Matching a $\mathrm{Vec}\,A\,n$ on its constructor refines $n$: pattern $\mathrm{nil}$ refines $n$ to $0$; pattern $\mathrm{cons}\,m\,a\,xs$ refines $n$ to $m+1$. The type checker tracks this and uses it to type subsequent code.

## What this exhibits

- *Types as static specifications*. Properties usually proved separately ("this output has the right length") become typing obligations.
- *The cost of dependence*. The function signatures are heavier; the proof obligations are heavier; type inference becomes incomplete in general. The trade is depth of guarantee for surface complexity.
- *Why proof assistants formalise this way*. A [dependent-type-theory](../objects/dependent-type-theory.md) where vectors are length-indexed makes verified data structures (sorted lists, balanced trees, finite-state automata) *type-checkable* — the proof is the program.
