---
specialization:
  - predication-retraction
  - boundary-component
located-at: system-boundary
projects-from: external-representation
projects-into: predicate-space
section-embeds: predicate-change
replaces: interfacer
realizes: restriction-carrier-dyad
cites:
  - parnas-1972
  - mealy-1955
  - busaniche-2014
  - lawvere-1970
date-created: 2026-04-07
---

# Projector

A projector is a boundary component that projects an external representation into predicate space and embeds predicate changes back out. It is the concrete realization of the [restriction-carrier dyad](relational-machine-carrier.md) at the system boundary.

The mathematical structure is a **retraction**: an idempotent projection P (where P² = P) equipped with a section s satisfying the counit law P ∘ s = id. The projection maps from a larger space (file content with prose, formatting, ordering) to a smaller subspace (predicates). The section lifts predicate changes back into the larger space, preserving everything the projection discards.

## Two directions

- **Project (restriction):** parse external representation into predicates. The idempotent, information-losing direction. Full content enters; only predicates survive. The kernel of the projection — prose, formatting, key ordering, whitespace — is annihilated. Projecting twice yields the same result as projecting once.
- **Section (carrier):** embed predicate changes into an updated external representation. Must preserve what the projection discards — the kernel content that isn't predicates. The section is the right inverse of the projection.

The counit law is the correctness criterion: projecting from a sectioned result must recover the expected predicates. If `project(section(changes, content))` does not equal the original predicates with changes applied, the projector is lossy.

## Why "projector" and not "interface"

An interface (Parnas 1972) is symmetric — it hides internals behind a boundary, but both sides are peers. A transducer (Mealy 1955) converts signals in either direction without privileging one.

A projector names the asymmetry that actually holds: the predicate space is the essential content; the external format is the vehicle. The projection direction is primary — it determines what counts as information. The section direction is derived — it exists to serve the projection's counit law. This asymmetry is not a design choice; it follows from the [adjoint structure of predication](../../science/domains/information/texts/the-adjoint-structure-of-predication-on-bilattice-valued-fibers.md).

In the Lawvere hyperdoctrine (1970), substitution along a morphism f* is a projection between fiber algebras. The left adjoint ∃ (extending) and right adjoint ∀ (restricting) compose predicates across contexts. A filetype projector is a concrete instance: it projects between the "external representation context" and the "internal predication context," with the section as the embedding that goes back.

## Projection geometry

Each projector defines a **projection geometry**: it determines which directions in the full content space correspond to predicates and which are transverse (the kernel). The markdown projector has a fat kernel (body text, key ordering, quote style). The JSONL projector has a thin kernel (newline formatting). The JSON projector has almost no kernel.

The kernel matters because it is what the section must preserve. A projector with a larger kernel requires a more careful section — more structure to thread through without damage. This is why the markdown section uses text-editing rather than YAML regeneration: it must preserve kernel content (human-authored ordering, quoting, comments) that a regeneration strategy would destroy.

## Composition

Two projectors compose when their ranges are appropriately nested. The composition of two idempotent operators is idempotent when they commute or when one range contains the other. A markdown projector composed with an HTTP projector yields a web-view projector; the counit law on the composition requires that both individual counit laws hold.
