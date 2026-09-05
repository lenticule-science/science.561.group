---
name: transformer
description: A formal operation recorded at code/transformers/<gerund>.md — a morphism of the predication category and (by slice and functor constructions) both a category in its own right and a functor between two categories.
---

## Definition

A **transformer** is an entity recorded at `code/transformers/<gerund>.md`.
It is a morphism of the predication category $\mathcal{P}$ — an arrow $T : A \to B$ with a domain entity $A$ and a codomain entity $B$.

## Every transformer is a category

A transformer $T$ is an entity, hence an object of $\mathcal{P}$, hence a category by the slice construction at [`category.md`](category.md).
Concretely, $T$ is identified with $\mathcal{P}/T$.

## Every transformer is a functor

A transformer $T$ with domain $A$ and codomain $B$ is, by the chain $A, B \in \mathrm{Ob}(\mathcal{P})$ and $T \in \mathcal{P}(A, B)$, a morphism between two structures.
Both $A$ and $B$ are themselves categories (by the slice construction).
The morphism $T : A \to B$ in $\mathcal{P}$ extends canonically to a **functor** $T_* : A \to B$ between the slice categories:

- On objects: $T_*(X, f) := (X, T \circ f)$ for $(X, f) \in \mathrm{Ob}(A) = \mathrm{Ob}(\mathcal{P}/A)$.
- On morphisms: $T_*$ sends a commuting triangle $h : (X, f) \to (Y, g)$ over $A$ to the commuting triangle $h : (X, T \circ f) \to (Y, T \circ g)$ over $B$.
  The commutation $T \circ g \circ h = T \circ f$ follows from $g \circ h = f$ by left-composition with $T$.

$T_*$ preserves identities ($T_*(\mathrm{id}_{(X, f)}) = T_*(\mathrm{id}_X) = \mathrm{id}_X = \mathrm{id}_{T_*(X, f)}$) and preserves composition ($T_*(h_2 \circ h_1) = h_2 \circ h_1 = T_*(h_2) \circ T_*(h_1)$, since the underlying $\mathcal{P}$-arrow is unchanged).
So $T_* : \mathcal{P}/A \to \mathcal{P}/B$ is a functor.

The slice-pushforward construction $T \mapsto T_*$ is itself functorial — the assignment is the post-composition functor of Mac Lane 1971, ch. I §3.

## Single domain, single codomain

A transformer has exactly one domain entity and exactly one codomain entity, by the definition of a morphism in $\mathcal{P}$.
An operation that wants multiple inputs is a composition: a constructor transformer that builds a carrier structure from the inputs, followed by a unary transformer on the carrier.
The carrier is the categorical product (or another universal carrier construction) in the appropriate fiber.

## Characteristic predications

| Predicate | Description |
|---|---|
| `name(transformer, gerund)` | The verb's gerund form. Matches the filename. |
| `gerund(transformer, gerund)` | Same value as `name`; carried separately because the agent and skill naming grammars resolve their heads against this field. |
| `agent-noun(transformer, agent-noun)` | The deverbal agent-noun form. |
| `domain(transformer, structure)` | The single domain. |
| `codomain(transformer, structure)` | The single codomain. |
| `category(transformer, category)` | The category this transformer is a morphism of. |
| `preserves(transformer, invariant)` | Structure-preservation conditions; the functoriality data of $T_*$. |

## Distinguishing transformer from structure

A structure is recorded at `code/structures/`; a transformer is recorded at `code/transformers/`.
Both are entities (objects of $\mathcal{P}$), both are categories (by slice).
Transformers additionally are functors between the slice categories of their domain and codomain.

## External references

- Mac Lane, S.
  (1971). *Categories for the Working Mathematician*.
  Springer.
  Ch. I §§2–3, II §1 (functors and slice categories).
