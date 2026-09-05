import Mathlib.Algebra.Group.Defs

-- Establishes: concatenating

/-!
# Concatenating: history concatenation

Corresponds to `math/concatenating.md`.

**Act facet** of the History (§history): what histories DO.

History concatenation ★ : T × T → T extends one history by another. It is the
monoid operation on T. The empty history e (monoidal unit `1 : T`) is the
identity: e ★ t = t = t ★ e.

Concatenation is what makes T a category (the morphism t → t' is prefix
extension by some u) and what makes H a presheaf (restriction maps go
against the prefix direction: ρ : H_{t'} → H_t when t ≤ t').

## Representation in Lean

Concatenation is encoded as `[Monoid T]`. The three axioms from `math/concatenating.md`:
- **Associativity**: (t ★ u) ★ v = t ★ (u ★ v) — `mul_assoc`
- **Left unit**: e ★ t = t — `one_mul`
- **Right unit**: t ★ e = t — `mul_one`

No additional Lean declarations are needed beyond `[Monoid T]`. This file
marks the correspondence: `math/concatenating.md` ↔ `[Monoid T]`.

## OPEN: concrete construction

In the abstract axiomatic setting (`math/history.md`), T is taken as given.
The concrete construction of T as M(Σ,I) — the free partially commutative
monoid on a step set Σ with commutation I — and the proof that it
satisfies `[Monoid T]` belongs in `HistoryUniversality.lean`.

See `math/history-universality.md` for the universality theorem: M(Σ,I) is
the initial history system.
-/

-- No additional declarations. The Act of concatenation is `[Monoid T]`.
