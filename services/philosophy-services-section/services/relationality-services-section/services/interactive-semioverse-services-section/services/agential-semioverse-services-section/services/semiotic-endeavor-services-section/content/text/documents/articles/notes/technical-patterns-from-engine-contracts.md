---
title: "Technical patterns from engine contracts and simulation specs"
type: text
date-created: 2026-03-08
authors:
  - claude
keywords:
  - TriageMining
  - SemioticEndeavor
  - TechnicalStructure
description: "Extracted technical patterns from triage/engine/ contracts and triage/specifications/ simulation specs that can be formalized into the semiotic-endeavor specification."
cites:
  - triage/engine/contracts/spec-spec/README.md
  - triage/engine/contracts/semiotic-repository/semiotic-repository.md
  - triage/engine/contracts/semiotic-git/semiotic-git.md
  - triage/engine/contracts/README.md
  - triage/specifications/interface.md
  - triage/specifications/scheduler.md
  - triage/specifications/intake-stack.md
  - triage/specifications/policy.md
  - triage/specifications/storage.md
  - triage/specifications/testing.md
  - triage/specifications/concurrency.md
part-of: technology/specifications/semiotic-endeavor
---

## Summary

The engine/contracts directory and triage/specifications directory
contain concrete technical structure that the semiotic-endeavor spec
can formalize. Three patterns stand out.

## Pattern 1: Normative scaffold for specifications (spec-spec)

The spec-spec contract (engine/contracts/spec-spec/README.md) defines
a 10-section normative scaffold that every specification must satisfy:

1. **Versioning**: MAJOR.MINOR.PATCH; required metadata: spec-id,
   version, release-date, stability ∈ {draft, candidate, stable,
   deprecated}
2. **Canonicalization**: deterministic byte sequence, CANON(x) → bytes
3. **Error semantics**: stable schema with code, name, severity ∈
   {info, warn, error, fatal}, where, when, correlation-id, fault ∈
   {producer, consumer}, retryable, data
4. **Conformance matrix**: each normative statement mapped to actors
   (producer, consumer, intermediary, validator)
5. **Upgrade path**: feature flags, version ranges, deprecation
   windows (announcement → dual-stack → removal)
6. **Security/privacy**: attacker models, trust boundaries
7. **Determinism**: same canonical inputs → bit-identical outputs
8. **Registries**: extension points with registration policy
9. **Formal artifacts**: machine-readable schemas, executable
   pseudo-code
10. **Document hygiene**: MUST/SHOULD/MAY statements test-mapped to
    conformance IDs

**Use for semiotic-endeavor**: The "lifecycle of method components"
section currently says draft → candidate → stable → deprecated →
superseded but provides no guard conditions. The spec-spec scaffold
defines what each lifecycle state requires: a draft needs a spec-id
and version; a candidate needs a conformance matrix and test suite;
a stable spec needs passing determinism checks and a deprecation
policy for the previous version. These should become formal
transition guards.

## Pattern 2: Simulation spec template (all triage/specifications/)

Every simulation spec (interface, scheduler, intake-stack, policy,
storage, testing, concurrency) follows the same 5-section structure:

1. **State representation**: what data structures the component
   maintains
2. **Inputs**: typed parameters the component accepts
3. **Procedures**: ordered steps with preconditions at each step
4. **Invariants**: properties that must hold before, during, and after
5. **Outputs**: typed results the component produces

This is a consistent interface schema for method components. The
semiotic-endeavor spec's "aspects of method" section lists specs by
name but does not define what each spec must provide. The simulation
template gives a concrete answer: every aspect of method must declare
its state, inputs, procedures, invariants, and outputs.

**Use for semiotic-endeavor**: Define this as the required interface
for aspect specifications. Each semiotic-* spec must declare these
five sections. This makes aspect interoperability concrete: one
aspect's outputs are another's inputs; invariants from different
aspects can be checked for consistency.

## Pattern 3: Interaction surface declaration (semiotic-repository)

The semiotic-repository contract defines `semantics.yaml` as the
concrete interaction surface:

- `kind`: hardcoded discriminator selecting operator families
- kind-specific parameters (e.g., `book.source`, `publish.slug`)
- operator families declared but external to the repository

The key technical insight: a repository is operable iff it provides
a `semantics.yaml` at its root. Operators act on the declared surface,
not inside the repository by convention.

**Use for semiotic-endeavor**: The spec already says "a repository is
a persistent handle with a declared interaction surface" — the
semiotic-repository contract shows what that looks like concretely.
The spec can reference or incorporate the `semantics.yaml` schema as
the normative declaration format.

## Pattern 4: No implicit contracts (engine/contracts/README.md)

The engine contracts README states a rule: "if the emsemioverse's
agent guidance (AGENTS.md) cites a tooling-contract repository as a
contract source, that contract MUST be present here as an explicit
dependency. No implicit contracts."

This is already in the spec as the "no implicit contracts" principle.
The engine contracts give it concrete enforcement: contracts are
vendored as submodules so they are version-pinned, present on disk,
and checkable.

## Pattern 5: Provenance tracking (semiotic-git)

The semiotic-git contract defines provenance histories as finite
derivations with exactly 6 allowed step types:

1. Introduction as a generator (query result)
2. Heyting operations
3. Application of j (modality)
4. Application of G (trace)
5. Application of an operator f ∈ Op
6. Inclusion under fragment extension

This is a type system for provenance. No other justification is
permitted.

**Use for semiotic-endeavor**: The closure conditions section
mentions "trace presence" as a component of closure pressure. The
semiotic-git provenance model shows what trace presence looks like
technically: a finite derivation history with typed steps. The
endeavor spec could define an analogous provenance type system for
method decisions (why was this convention adopted? what steps led
to this stability?).
