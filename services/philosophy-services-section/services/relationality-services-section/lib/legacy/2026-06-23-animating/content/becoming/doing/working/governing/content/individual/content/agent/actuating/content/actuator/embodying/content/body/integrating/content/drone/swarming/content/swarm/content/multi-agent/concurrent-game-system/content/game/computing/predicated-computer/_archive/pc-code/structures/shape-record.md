---
type: definition
class: substrate-entity
realizes: [predicate-classification]
depends-on: [vocabulary-completeness]
see-also: [closure-rule-record, constraint-record, validate-against-shape]
---

# Shape record

The substrate-entity formal definition of a *predication shape*: a declaration of which predications carrying a target predicate are admissible, what value range each is permitted, what kind of subject and object each requires. Where [closure-rule records](closure-rule-record.md) derive new content and [constraint records](constraint-record.md) check substrate-wide invariants, a shape record checks single-predication structural conformance — the per-write gate that ensures every admitted predication is well-formed.

This is the parent-theory shape; the [agential-orchestration-platform](theories/agential-orchestration-platform/objects/shape-record.md) subtheory specializes shape further with agential commitments (which agents may admit a predication, which scopes admit which shapes).

## Structural fields

A shape record carries:

- **`id`** — kebab-case identifier matching the predicate the shape governs (commonly the predicate's name, e.g., `depends-on-shape`, `published-at-shape`).
- **`description`** — one-line summary of what the predicate means and what the shape enforces.
- **`target-predicate`** — reference to the substrate entity defining the predicate this shape governs. Per [vocabulary-completeness](teaching/explanations/vocabulary-completeness.md), every predicate-in-use must have a defining entity; this field cites it.
- **`subject-class`** — the entity class admissible as the predication's subject. May be a specific class (`agent-record`, `task-cell-system`), a class union, or `any` for predicates whose subject is unrestricted.
- **`object-class`** — the entity class admissible as the predication's object. Same shape as subject-class.
- **`value-range`** — the [substrate value-domain](teaching/explanations/substrate-value-domain.md) values the shape admits. Common shapes:
  - `bilattice-four`: any of $\{\bot, \mathbf{t}, \mathbf{f}, \top\}$
  - `truth-only`: only $\mathbf{t}$ admissible (e.g., for inferred-true predications)
  - `evidence-bound`: a declared range in the [knowledge order](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) (a confidence threshold)
- **`cardinality`** — declared cardinality constraint: `one` (each subject has at most one such predication), `many` (no constraint), or `bounded(n)` (at most $n$ predications per subject).
- **`severity`** — one of `strict-rejection` (a violating admission is rejected), `repairable` (admission produces a repair-catalog ticket), or `warning` (the violation is logged but admitted).

## Invariants

- **Target-predicate must exist.** Per [vocabulary-completeness](teaching/explanations/vocabulary-completeness.md), the cited target predicate must resolve to a substrate entity. A shape with a dangling target reference is malformed.
- **Subject and object classes must exist.** The cited classes must resolve to entity-class records or be the `any` wildcard.
- **Value-range admits canonical-form check.** The substrate's [shape conformance morphism](../morphisms/validate-against-shape.md) must be able to deterministically check whether a candidate value falls in the declared range.
- **Self-representation respected.** The shape record itself is substrate content; editing the shape catalog is editing substrate content; per [self-representation](teaching/explanations/self-representation.md), shape changes produce witnesses.

## Operations

- *Validate.* Given a candidate predication, the substrate's [validate-against-shape](../morphisms/validate-against-shape.md) operator checks the predication against the applicable shape record. Returns `pass`, `fail-with-cause`, or `repair-needed-cause` per the shape's severity.
- *Audit.* Given a shape record's id, the substrate's audit can identify all predications admitted under that shape's discipline, including the witnesses recording each validation outcome.
- *Compose.* When a predication's target predicate has multiple applicable shape records (e.g., a parent shape and a more-specific child shape), the substrate composes the shapes — the predication must satisfy all of them. Composition is via the [extend-restrict adjoint](teaching/explanations/extend-restrict-adjoint.md): per-shape constraints fuse, with the target value bounded by the strictest applicable.
- *Retire.* When a shape becomes obsolete (the predicate is being deprecated, the shape's constraints are too strict for new use cases), the shape's retirement is itself a substrate operation. Per [installed-base constraint](teaching/explanations/infrastructure-as-substrate.md), retirement does not retract previously-admitted predications; existing predications carry the shape's witness from when they were admitted.

## What the shape record is not

- **Not a closure rule.** A [closure-rule record](closure-rule-record.md) derives new predications from existing premises; a shape checks whether a candidate predication is admissible at the gate. The two run at different commit-path stages: shape conformance first, closure-rule application after admission.
- **Not a constraint record.** A [constraint record](constraint-record.md) checks substrate-wide invariants quantifying over many predications; a shape checks single-predication conformance. The two complement each other in the commit path.
- **Not a type system in the typed-language sense.** A typed language's type-checker rejects ill-typed terms before they are written; the substrate's shape conformance is per-predication and runs at admission. Predications that fail shape conformance are explicit substrate content (rejection witnesses) rather than compile-time errors.

## Position in the substrate

The shape record is the substrate's *per-predication well-formedness gate*. Without it, every predication is admissible at the substrate's value-domain level, and the substrate accepts predications whose subject, object, or value disagrees with the predicate's intended use. With it, every predication is checked against its predicate's declared shape at admission; mismatches are surfaced (per the shape's severity) as substrate content rather than silently accepted.

The pattern composes with [vocabulary-completeness](teaching/explanations/vocabulary-completeness.md) (which requires every predicate to have a defining entity, of which the shape is part), with [validate-against-shape](../morphisms/validate-against-shape.md) (the morphism that exercises shape conformance), with [constraint-record](constraint-record.md) (the substrate-wide-invariant complement), and with the agential subtheory's [shape-record](theories/agential-orchestration-platform/objects/shape-record.md) (which adds agent-identity and authorization commitments to the shape).
