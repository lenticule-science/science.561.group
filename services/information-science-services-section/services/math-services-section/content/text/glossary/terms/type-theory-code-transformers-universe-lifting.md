---
type: definition
class: embedding
status: current
depends-on: [universe, universe-level]
name: Universe lifting
description: "Universe lifting $\\mathrm{Lift}{i,j} : \\mathrm{Type}i \\hookrightarrow \\mathrm{Type}j$ (for $i \\le j$) is the canonical embedding that sends a type at level $i$ to its image at level $j$."
---


**Universe lifting** $\mathrm{Lift}_{i,j} : \mathrm{Type}_i \hookrightarrow \mathrm{Type}_j$ (for $i \le j$) is the canonical embedding that sends a type at level $i$ to its image at level $j$. It is the operator that realises *cumulativity* of the [universe](universe.md) hierarchy.

## Definition

For each pair $i \le j$ a coercion:

$$
\mathrm{Lift}_{i,j}(A) := A \quad (\text{at level } j).
$$

In systems with explicit lifting (Coq, some Agda configurations), the operator is named and visible; in systems with cumulative universes (Lean), the lift is implicit and inserted by the elaborator.

## Properties

- *Identity on terms*: an inhabitant of $A : \mathrm{Type}_i$ is also an inhabitant of $\mathrm{Lift}_{i,j}(A) : \mathrm{Type}_j$.
- *Composition*: $\mathrm{Lift}_{j,k} \circ \mathrm{Lift}_{i,j} = \mathrm{Lift}_{i,k}$.
- *Compatibility with type formers*: $\mathrm{Lift}(\Pi(x : A).\,B) = \Pi(x : \mathrm{Lift}(A)).\,\mathrm{Lift}(B(x))$ and similarly for the other formers.

## Position

Universe lifting is what makes [universe-level](../../documents/articles/research/2026/07/31/lenticule-import/_archive/teaching/explanations/universe-level.md) discipline workable in practice: definitions written at level $0$ remain available at every higher level without re-statement. The opposite move — *impredicativity* — collapses lifting locally by allowing some quantifications over $\mathrm{Type}_i$ to live in $\mathrm{Type}_i$ itself; the trade-offs around when this is sound are the subject of [questions/impredicativity](../../documents/articles/research-articles/questions/impredicativity.md). Reference: [Univalent Foundations Program 2013](../../documents/articles/bibliographies/univalent-foundations2013.md) §A.2.
