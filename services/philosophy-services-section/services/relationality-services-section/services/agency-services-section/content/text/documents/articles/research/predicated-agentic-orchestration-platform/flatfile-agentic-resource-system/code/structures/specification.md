---
name: specification
description: An entity that states conformance requirements for entities of a given kind — what frontmatter keys are required, what body structure is permitted, and what linting rules apply.
title: specification
---

A specification entity states what a conformant entity of a given kind looks like.
In the [predication-fibration](predication-fibration.md) $(\mathbf{FOUR}, \mathcal{C}, E)$, specifications are governance entities whose kind-classifier locates them at `governance/rules/specifications/`.
Each specification entity covers one kind of entity in a [filestore](filestore.md).

A specification is the substrate's record of its own conformance requirements.
It is what [linting](../transformers/linting.md) reads when evaluating whether an entity passes or fails a rule: the [linting](../transformers/linting.md) cell $(e, \mathtt{linting}, r)$ is evaluated by testing $e$ against the antecedent pattern named in specification $r$.

Specifications state: required frontmatter keys (`name:`, `description:`, and any kind-specific keys), permitted additional frontmatter keys (must be [transformer](transformer.md) slugs per R7), body structure constraints (e.g., R13: no H1 in body), and any kind-specific invariants the kind imposes beyond the universal rules R1–R13.

Per AgOP's agential-self-generation invariant, the conformance rules for substrate entities are themselves substrate entities.
A specification entity is the operative record of a rule — it is auditable, versionable, and subject to the same predication-fibration algebra as the entities it governs.
The self-application is exact: the specification for "specification" is itself a specification, and must conform to its own rules.
