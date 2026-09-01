---
title: "Concept notes"
---


A *concept note* fixes the meaning of a recurring word or phrase the theory needs. Concepts are not mathematical objects in themselves — they are the *roles* objects fill. The theory's [knowledge-order](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) is a concept; specific lattices realize it. The agential platform's [skill](../../../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/concepts/skill.md) is a concept; specific `skill-record` objects realize it.

## Required frontmatter

```yaml
---
type: concept
class: <classifier>          # the kind of concept this is — e.g. discipline, role, pattern, identity-binding, program-unit
---
```

`class:` is the typed-DAG classifier per [frontmatter-relations](../frontmatter-relations.md#class). It SHOULD be a short slug; concepts of the same class form a navigable family.

## Recommended frontmatter

- `depends-on: [...]` — concepts, objects, or morphisms whose meaning this concept presupposes. A concept whose definition cites another concept MUST list that concept here.
- `see-also: [...]` — non-load-bearing related concepts.
- `realized-by: [...]` (or, more commonly, the inverse `realizes:` on the realizing object) — the objects that instantiate this role. In practice, this edge is declared on the realizing-side, not the concept-side.

## Body conventions

A concept note SHOULD be **short** — typically 10–50 lines. Its job is to fix meaning, not to develop theory.

The body SHOULD have this shape:

```
# <Display name>

<First paragraph: an italicized phrase fixing the role this concept plays in the theory, followed
by a sentence or two of explanation. The italicized phrase is the canonical
one-line description.>

<Optional structure: bullet list of the concept's *components* or *aspects*.>

<Optional discussion: how the concept gets realized, what distinguishes it from
neighboring concepts, what the theory commits to about it.>
```

The italicized first-paragraph phrase is the convention used by predication-categories and predicated-computing concepts; it makes the concept's role greppable and renders cleanly. See [function](../../../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/functional-runtime-platform/concepts/function.md) for an exemplar.

A concept note MUST NOT include proofs, theorem statements, or substantive worked examples. Those go in `theorems/` and `examples/`. A concept note MAY cite a theorem to anchor a structural commitment, but the citation is one line, not a proof.

## When to use `concept` vs. alternatives

- Use `concept` when the word is a **role** the theory recurs to and other notes need to cite by name.
- Use [object](object.md) (`type: definition` in `objects/`) when the thing has structure the theory commits to as such — fields, invariants, a record shape, a mathematical definition with quantifiers.
- Use [morphism](morphism.md) when the thing is an operator that takes inputs and produces outputs.
- Use [theorem](theorem.md) when the content is a claim the theory proves.

The boundary between concept and object is the most common confusion. The test: if the next sentence after "X is..." is most naturally an *italicized role description* ("the substrate's binding of a user to..."), it is a concept. If the next sentence is most naturally a *structural specification* ("an X is a tuple $(A, \cdot, e)$ such that..."), it is an object.

## Validation rules (informal)

- A concept note MUST declare `type: concept` and `class:`.
- A concept note's body MUST have an `# H1` heading whose text matches the display name.
- A concept note SHOULD NOT exceed 200 lines. Concepts longer than 200 lines are signals to split into a concept (the role) and one or more objects (the structures realizing it).
- A concept note's `depends-on:` cycle is forbidden — concepts form a DAG.
- The set of concepts cited but not defined within the theory SHOULD point upstream to a parent theory's concepts; bare unresolved citations are dangling-reference diagnostics.

## Examples

- [agent](../../../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/concepts/agent.md) — class `participant`; the role of any party operating on the substrate.
- [closure](../../../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/functional-runtime-platform/concepts/closure.md) — class `program-unit`; the role of a function bundled with its captured environment.
- [knowledge-order](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) — class `order`; the role of a partial order ranking values by epistemic content.
