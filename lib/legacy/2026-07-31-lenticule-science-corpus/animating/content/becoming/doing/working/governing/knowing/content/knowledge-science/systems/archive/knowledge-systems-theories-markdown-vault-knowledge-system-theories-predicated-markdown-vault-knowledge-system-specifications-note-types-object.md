---
title: "Object notes"
---

# Object notes

An *object note* (frontmatter `type: definition`, directory `objects/`) introduces a thing the theory commits to as such — a mathematical structure with a definition, an engineering record type with a shape, a substrate entity with required fields and invariants. Object notes do the heaviest structural work in a theory: they specify what exists.

The frontmatter type is `definition` because every object is introduced by *a definition*. The directory is `objects/` because what the directory holds is the *objects*. The two perspectives — the file is a definition; the file describes an object — are both correct and the convention takes both.

## Required frontmatter

```yaml
---
type: definition
class: <classifier>             # mathematical-object | record | structure | algebra | category | ...
---
```

A theorem-rich theory SHOULD additionally carry:

- `realizes: [...]` — the concepts this object realizes. An object whose body says "an X realizes the role of [knowledge-order](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md)" MUST list `knowledge-order` here.
- `depends-on: [...]` — the objects, concepts, and morphisms whose meaning this definition presupposes.

A formally-verified theory SHOULD additionally carry:

- `symbol:` — the canonical mathematical symbol (e.g. `\sim_H`, `(v_\tau)_{\tau<\lambda}`). Per [frontmatter-relations](../frontmatter-relations.md#symbol), symbols MUST be unique across the corpus.
- `lean:` — the Lean 4 module path the definition mirrors, validated at build time.

## Recommended frontmatter

- `instantiates: [...]` — when this object is a specialization or realization of an upstream parent theory's object. Used heavily in subtheories: a FARS `SkillRecord` `instantiates: [skill-record]` from AOP.
- `closes: <slug>` — for objects that complete a chapter (rare; most object notes do not close chapters).
- `see-also: [...]` — non-load-bearing related objects.

## Body conventions

An object note SHOULD have this shape:

```
# <Display name>

<First paragraph: the definition. For mathematical objects, a precise quantified
statement; for engineering records, a precise account of what the record holds.
This paragraph is the *definition* — everything else is consequence.>

## Required fields                        (engineering records)
or
## Structure                              (mathematical objects)

<Bulleted list of the object's components, each with a precise type and
description. Engineering records cite the substrate's value-domain;
mathematical objects cite the carriers and operations.>

## Invariants                             (any)

<The object's required invariants, as a numbered or bulleted list. Each invariant
has a one-line statement; non-trivial invariants link to the theorem that
establishes them.>

## Position                               (recommended)

<One paragraph on what this object composes with in the theory, what it depends
on, and what depends on it. The note's structural place in the theory.>
```

## When to use `object` vs. alternatives

- Use `object` when the thing has *structure* — fields, components, an invariant, a definition with quantifiers.
- Use [concept](concept.md) when the thing is a *role* without a fixed structure — different objects realize it differently.
- Use [morphism](morphism.md) when the thing is *operator-shaped*: takes inputs, produces outputs, has a signature.
- Use [theorem](theorem.md) when the content is a *claim* the theory proves.

## Validation rules (informal)

- An object note MUST declare `type: definition` and live in `objects/`.
- A mathematical object SHOULD declare a `symbol:`. Two objects MUST NOT share a symbol within the same theory; cross-theory symbol collisions are warnings.
- An object's `realizes:` set MUST resolve to existing concepts (within the theory or upstream).
- An object's `instantiates:` set MUST resolve to existing objects in upstream theories.
- An engineering record SHOULD enumerate its fields under a `## Required fields` heading; the FARS toolkit reads this section to derive the record's predication shape.
- Object notes SHOULD NOT exceed 300 lines. Objects longer than 300 lines are signals to split — typically into the object plus several theorems about it.

## Examples

- Math object: [predication-settling](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md). Symbol `(v_\tau)_{\tau<\lambda}`. Realizes settling-monotonicity, settling-continuity, settling-quiescence, evidence, knowledge-order, truth-order. Lean-verified.
- Engineering record: [skill-record](../../../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/objects/skill-record.md). Instantiates AOP's parent `skill-record`. Enumerates required fields with substrate semantics and the invariants the realization must hold.
