---
title: "Semiotic Universe Lean Formalization"
type: documentation
date-created: 2026-03-07
tags:
  - Lean
  - MathematicalUniverse
---

# Lean Formalization of the Semiotic Universe

Lean 4 + Mathlib formalization of the
[semiotic universe](../../semiotic-universe.md) specification.

## Approach

This formalization takes the **axiomatic** approach: it postulates
that H is a Heyting algebra and that j and G satisfy certain
properties, then proves that the derived lemmas follow. The axioms
are justified by the constructive arguments in the spec (H = Sub(Y)
in a topos, j is a Lawvere-Tierney topology, etc.), but the
construction itself is not formalized here.

For the constructive approach that builds H from the ground up,
see the [Agda formalization](../agda/README.md).

## Setup

Requires Lean 4 and Lake. The `lean-toolchain` file pins the
version. To build:

```sh
cd formalization/lean/
lake build
```

Mathlib is a dependency (for `HeytingAlgebra`, `CompleteLattice`,
and standard order-theoretic lemmas).

## Module structure

| File | Spec section | What it formalizes |
|------|-------------|-------------------|
| `HeytingDomain.lean` | §1.1 | H as a Heyting algebra (axiomatized) |
| `ModalClosure.lean` | §1.2 | j : H → H (habit-formation) |
| `TraceComonad.lean` | §1.3 | G : H → H (semiotic provenance) |
| `Ambient.lean` | §1.4 | Interaction axioms (j and G cohere) |
| `Syntax.lean` | §2 | Typed lambda calculus, raw operators |
| `Fragment.lean` | §3 | Finitely generated modal-temporal subalgebras |
| `Interpretation.lean` | §4 | Interpretation mapping (semiosis formalized) |
| `Test/Trivial.lean` | — | Golden tests with concrete instances |

## Conventions

### One file, one concept

Each `.lean` file formalizes one section of the specification.
The file header comment names the corresponding spec section and
summarizes what mathematical structure it captures.

### Typeclass vs. structure

- **`class`** for ambient assumptions (`HeytingDomain`,
  `ModalClosure`, `TraceComonad`, `SemioticAmbient`). These are
  the operators and axioms that Lean's instance resolution should
  find automatically.
- **`structure`** for data objects (`Fragment`,
  `PartialSemiotic`). These are specific mathematical objects,
  not ambient properties.

### sorry is honest

Use `sorry` for steps that need more work. Document what the
sorry represents in a comment.

### Naming conventions

- Typeclasses: `CamelCase` (`ModalClosure`, `TraceComonad`)
- Predicates: `IsCamelCase` (`IsHabitual`, `IsFragment`)
- Lemmas: `snake_case` describing the statement
  (`isHabitual_top`, `TraceComonad.monotone`)
- Follow Mathlib naming conventions where applicable

## Roadmap

1. **Ambient structure (H, j, G)** — done (sorry-free)
2. **Typed lambda calculus** — done (`Syntax.lean`)
3. **Fragments** — done (`Fragment.lean`)
4. **Interpretation** — done (`Interpretation.lean`)
5. **Fusion and closure operators** — `SemioticUniverse/Fusion.lean`
6. **Initiality theorem** — `SemioticUniverse/Initiality.lean`
