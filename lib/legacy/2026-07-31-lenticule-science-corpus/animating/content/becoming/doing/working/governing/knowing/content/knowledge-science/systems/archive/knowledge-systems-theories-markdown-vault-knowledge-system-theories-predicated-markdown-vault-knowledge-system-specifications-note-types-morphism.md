---
title: "Morphism notes"
---


A *morphism note* (frontmatter `type: morphism`, directory `morphisms/`) introduces an operator: a function, functor, natural transformation, adjunction, 2-cell, substrate API operator, or other structure-preserving map. Morphisms get their own type because in many theories — predication categories most strikingly — the operators carry as much content as the objects do.

The math/engineering parallel is exact. A functor `F : 𝒞 → 𝒟` is the math morphism; an API operator `settle : Fiber → Fiber` is the engineering morphism. Both have signatures, semantics, invariants, and composition behavior; both belong in `morphisms/`.

## Required frontmatter

```yaml
---
type: morphism
class: <classifier>             # operator | functor | natural-transformation | adjunction | substrate-api | ...
---
```

A theorem-rich theory SHOULD additionally carry:

- `realizes: [...]` — the concepts this morphism realizes.
- `depends-on: [...]` — the objects, concepts, and morphisms this morphism's signature and definition cite.

A formally-verified theory SHOULD additionally carry:

- `symbol:` — the canonical mathematical symbol (e.g. `\mathrm{cl}`, `f^*`, `\vee_k`). Symbols MUST be unique within the theory; cross-theory collisions are warnings.
- `lean:` — the Lean 4 module path the morphism mirrors.

## Recommended frontmatter

- `instantiates: [...]` — for morphisms that specialize an upstream parent's morphism (e.g. FARS `settle` instantiates AOP's `settle`).
- `closes: <slug>` — for the morphism that closes a chapter. The renderer positions a morphism with `closes: predication-fiber-algebra` at the end of the chapter that builds up to it. Most morphisms do not close chapters.
- `acts-on: [...]` — the objects this morphism takes as inputs / acts on. Useful for grouping morphisms by what they operate over.
- `produces: [...]` — the objects this morphism returns. Symmetric to `acts-on:`.
- `see-also: [...]` — non-load-bearing related morphisms.

## Body conventions

A morphism note SHOULD have this shape:

```
# <Display name>

<First paragraph: the definition. For mathematical morphisms, a precise statement
of the signature and the action — "A *closure operator* on F is a family of
maps cl = (cl_p) ... such that ...". For engineering operators, a precise
account of the signature and the operational semantics.>

## Signature                              (any)

<The signature spelled out: domain, codomain, type parameters, effect annotations.
For substrate API operators, the inputs / outputs / preconditions /
postconditions / witness format.>

## Operational semantics                  (engineering operators)
or
## Definition / Construction              (mathematical morphisms)

<How the morphism acts. For mathematical morphisms, the construction —
typically axiomatic conditions or an explicit formula. For engineering
operators, the operational steps the realization must perform.>

## Invariants                             (any)

<The morphism's required invariants. For mathematical morphisms, e.g.
naturality squares, functoriality. For engineering operators, e.g. determinism,
witness-emission, locality.>

## Composition                            (recommended)

<How this morphism composes with neighboring morphisms in the theory. Often
references theorems that establish the composition's properties.>

## Position                               (recommended)

<The morphism's structural place in the theory: what it closes (if anything),
what it enables, what depends on it.>
```

## When to use `morphism` vs. alternatives

- Use `morphism` when the thing has a *signature*: takes inputs, produces outputs.
- Use [object](object.md) when the thing is a *structure* the morphism acts on.
- Use [theorem](theorem.md) when the content is a *claim* about a morphism (e.g. "settle is deterministic" is a theorem; `settle` itself is a morphism).
- Use [concept](concept.md) when the thing is a *role* without a fixed signature ("composition" is a concept; specific compositions are morphisms).

## Validation rules (informal)

- A morphism note MUST declare `type: morphism` and live in `morphisms/`.
- A morphism note's body MUST state the signature (domain/codomain or input/output) explicitly.
- A morphism's `realizes:` set MUST resolve to existing concepts.
- A morphism's `instantiates:` set MUST resolve to existing morphisms in upstream theories.
- A morphism's invariants SHOULD be cited via `depends-on:` or `realizes:` to the theorems that establish them.

## Examples

- Math morphism: [closure-operator](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md). Symbol `\mathrm{cl}`. Realizes adjudication, closure-drivenness, scott-continuous-closure. Closes the predication-fiber-algebra chapter. Lean-verified.
- Engineering operator: [settle](../../../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/morphisms/settle.md). FARS realization of AOP's `settle`. Spelled-out signature, operational semantics, invariants, and witness format.
