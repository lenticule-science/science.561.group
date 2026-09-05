---

title: "Semiotic Universe Agda Formalization"
introduces: documentation
date-created: 2026-03-07
tags:
  - agda
  - mathematical-universe---

# Agda Formalization of the Semiotic Universe

Agda formalization of the [semiotic universe](../../semiotic-universe.md)
specification, taking the **synthetic** approach: structures are
built from categorical primitives rather than axiomatized.

## Approach

The spec says: "We work inside a Grothendieck universe U." In
Agda, the universe hierarchy `Set₀ : Set₁ : Set₂ : ...` plays
the role of the Grothendieck universe — Lean's type-theoretic
universes already have the closure properties (closed under
dependent products, sums, etc.) that ZFC needs an explicit
Grothendieck universe axiom to guarantee.

The construction chain:

1. **Universe** — Agda's `Set ℓ` with explicit level management
2. **Category** — U-small category R of sign relations (finite
   limits, well-powered)
3. **Topos** — R has a subobject classifier Ω, making it a topos
4. **Sub(Y)** — constructed as the subobject lattice, proved to be
   a complete Heyting algebra
5. **j** — defined as a Lawvere-Tierney topology (j : Ω → Ω);
   meet-preservation is a *theorem*, not an axiom
6. **G** — trace comonad on Sub(Y), a Heyting algebra endomorphism

Properties that the Lean formalization axiomatizes (like
`meet_preserving`) become derived theorems here.

## Module structure

| File | Spec section | What it constructs |
|------|-------------|-------------------|
| `Category.agda` | §1.0–1.1 | U-small categories, finite limits |
| `Topos.agda` | §1.1–1.2 | Subobject classifier, topos structure |
| `SubobjectLattice.agda` | §1.2 | Sub(Y) as a Heyting algebra |
| `LawvereTierney.agda` | §1.3 | j as L-T topology, meet-preservation |
| `TraceComonad.agda` | §1.4 | G as Heyting-comonadic trace |
| `Ambient.agda` | §1.5 | Interaction axioms, assembly |

## Conventions

### Universe polymorphism is explicit

Every definition carries its universe level. The category R lives
at some level ℓ; Sub(Y) lives at the same level; j and G are
endomorphisms within that level. No implicit universe coercions.

### Proofs are terms

Agda has no tactic mode. Every proof is a program. This makes the
constructive content visible: you can read *what* the proof builds,
not just that it exists.

### One file, one construction

Each `.agda` file builds one layer of the construction. Files
import only from layers below them.

## Setup

Requires Agda (≥ 2.6.4) and agda-stdlib.

```sh
agda SemioticUniverse/Everything.agda
```

## Relationship to the Lean formalization

The Lean formalization axiomatizes what this one constructs. When
both are complete, every Lean axiom should correspond to a theorem
proved here. Discrepancies are findings about the spec.
