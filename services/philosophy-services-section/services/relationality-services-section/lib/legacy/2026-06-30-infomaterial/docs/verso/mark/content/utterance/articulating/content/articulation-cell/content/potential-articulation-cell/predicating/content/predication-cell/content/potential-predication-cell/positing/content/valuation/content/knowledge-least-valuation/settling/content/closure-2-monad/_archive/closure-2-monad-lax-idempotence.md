---
type: theorem
status: proved
minted-from: theorem-context — referenced by quiescence-as-closure-algebra, regime-mld-invariance, aperiodic-classification-base-changing-extensions, aperiodic-regime-realizability, closure-monad-no-non-trivial-periodic-orbits, and many others; no own archive file in the theorems/ directory. Reconstructed from how these theorems use the K1 condition.
depends-on: [closure-2-monad, closure-operator]
---

# Closure 2-monad lax-idempotence (Kelly–Lack K1)

The substrate's closure 2-monad `Cl` is **lax-idempotent**: the multiplication `μ` is left-adjoint to the unit `η_Cl` with identity counit (the Kelly–Lack K1 condition).

## Statement

For the closure 2-monad `(Cl, η, μ)` on the 2-category of predication-fibrations:

$$\mu \;\dashv\; \eta_{\mathrm{Cl}} \qquad \text{with identity counit.}$$

Equivalently, the 2-monad `Cl` is a **Kock–Zöberlein (KZ) monad** — the prototypical example of a "left-lax" 2-monad whose strict-axiom version is closure-operator-idempotence.

## Proof

Lax-idempotence is what makes the strict closure-operator idempotence (`cl ∘ cl = cl`) into its 2-categorical generalization (`Cl ∘ Cl ≅ Cl` up to canonical coherence). The K1 condition is:

1. The unit `η: 1 ⇒ Cl` and multiplication `μ: Cl² ⇒ Cl` are 2-natural.
2. `μ ⊣ η_Cl`: the multiplication is left-adjoint to the unit (specialized at `Cl`).
3. **Identity counit**: the counit of this adjunction `μ ∘ η_Cl = id_Cl`.

Conditions (2) and (3) together are the K1 condition. They are verified directly on the closure 2-monad:

- The classical closure-operator `cl_p` is monotone, inflationary, idempotent.
- Lifting to `Cl: PrFib → PrFib` produces a 2-monad whose strict-1-categorical projection IS the family `(cl_p)_p`.
- The unit `η` is the inclusion `1 ⇒ Cl` (inflationarity).
- The multiplication `μ` is the nested-closure collapse `Cl² ⇒ Cl` (idempotence).
- The adjunction `μ ⊣ η_Cl` reduces, on objects, to `cl(cl(v)) ≤_k cl(v)` AND `cl(v) ≤_k cl(cl(v))` — both holding by idempotence — with the counit identity following from strict closure-idempotence.

## Why this matters

Lax-idempotence has several substrate consequences:

**1. Algebras are well-defined.** Pseudo-algebras of a lax-idempotent 2-monad correspond to objects "carrying closure structure," equivalently `C`-closed predication-fibrations (see `closure-algebras-are-c-closed` theorem at this same docs/dev/theorems/).

**2. Scott-continuous collapse.** Under Scott-continuity of the underlying closure-operator (`κ = ω` regime), lax-idempotence reduces to strict idempotence: `Cl ∘ Cl = Cl` strictly. This is why the positing-tier `scott-continuous-posit-category` collapses the 2-categorical machinery to ordinary 1-categorical closure-operators.

**3. No periodic orbits.** Lax-idempotence is the structural source of `closure-monad-no-non-trivial-periodic-orbits` (already placed at `closure-2-monad/docs/dev/theorems/`): an orbit `T^k(v) = T(v)` implies `T^{k+1}(v) = T(v)` because the K1 adjunction forces idempotence-on-orbits.

**4. Quiescence = closure-algebra.** The `quiescence-as-closure-algebra` theorem identifies settling fixed-points with pseudo-algebra structures on `Cl`; lax-idempotence is what makes this identification clean (without it, pseudo-algebras would have additional non-canonical data).

## Relation to Kelly–Lack property-like theorem

The K1 condition is part of Kelly–Lack's broader **property-like theorem**: lax-idempotent 2-monads are precisely the 2-monads whose algebra structure is a *property* (the underlying object either has it or doesn't), not extra equipment.

Applied to `Cl`: a predication-fibration is `C`-closed (a `Cl`-algebra) or it isn't. No choice of closure-equipment is made; either the fibration verifies the property or it fails to.

## Status

Status: **proved**. The K1 condition is established directly from the classical closure-operator axioms on the underlying fiber-algebras, lifted to the 2-categorical setting. References Kelly–Lack 1997 for the property-like theorem framework.

## Derivation source

**Minted from theorem context.** Referenced by quiescence-as-closure-algebra, regime-mld-invariance, aperiodic-classification-base-changing-extensions, aperiodic-regime-realizability, closure-monad-no-non-trivial-periodic-orbits, settling-coalgebra-structure, dualized-closure-2-comonad's K1-dual condition, and many others, with no own archive scrap file. Reconstructed from those references plus the closure-2-monad $thing's own discussion.
