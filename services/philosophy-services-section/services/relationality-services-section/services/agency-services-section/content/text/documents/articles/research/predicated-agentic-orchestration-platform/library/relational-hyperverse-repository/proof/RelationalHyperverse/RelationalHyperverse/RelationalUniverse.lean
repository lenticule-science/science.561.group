import RelationalHyperverse.Reindexing
import RelationalHyperverse.FixedFiber

-- Establishes: relational-universe (derived results)

/-!
# RelationalUniverse: derived results for the presheaf R

Corresponds to `math/relational-universe.md`.

The `RelationalUniverse` structure is defined in `Reindexing.lean` (corresponding to
`math/reindexing.md`). This file proves the derived consequences that hold for any
RelationalUniverse:

- Restriction commutes with the joint projection π
- Restriction preserves the fixed fiber H* ⊆ H
- The stabilization map π is natural

## Main results
- `restrict_pi` : H(f) ∘ π = π ∘ H(f)
- `restrict_fixedFiber` : H(f) maps H*_{t'} into H*_t
- `restrict_stab_nat` : naturality of the stabilization map

## Open items
- `fixedFiber_sheaf` : the assignment t ↦ H*_t is a sheaf of frames (requires sheaf condition on R)
- `relational_universe_initial` : R is initial in the category RU (requires morphism equality)
-/

namespace RelationalUniverse

variable (R : RelationalUniverse)

-- Make the instances available for dot-notation
instance : PartialOrder R.T := R.T_order
instance : Monoid R.T := R.T_monoid
instance (t : R.T) : HeytingAlgebra (R.FiberCarrier t) := R.FiberHA t

-- ── Derived: restriction commutes with π ─────────────────────────────────────

/-- H(f) commutes with the joint projection π = σ∘Δ. -/
theorem restrict_pi {t t' : R.T} (h : t ≤ t') (a : R.FiberCarrier t') :
    R.restrict h ((R.fiberAlg t').pi a) = (R.fiberAlg t).pi (R.restrict h a) := by
  simp only [BiNucleus.pi, R.restrict_σ, R.restrict_Δ]

-- ── Derived: restriction preserves fixed fibers ───────────────────────────────

/-- H(f) maps H*_{t'} into H*_t: the fixed fiber is preserved under restriction. -/
theorem restrict_fixedFiber {t t' : R.T} (h : t ≤ t') {a : R.FiberCarrier t'}
    (ha : a ∈ (R.fiberAlg t').fixedFiber) : R.restrict h a ∈ (R.fiberAlg t).fixedFiber := by
  rw [(R.fiberAlg t).mem_fixedFiber_iff]
  calc (R.fiberAlg t).pi (R.restrict h a)
      = R.restrict h ((R.fiberAlg t').pi a)    := (R.restrict_pi h a).symm
    _ = R.restrict h a                          := by
          rw [(R.fiberAlg t').mem_fixedFiber_iff.mp ha]

-- ── Derived: the stabilization map π is natural ───────────────────────────────

/-- The stabilization map Stab = π is natural: H(f) ∘ π_{t'} = π_t ∘ H(f).
    This is the key naturality condition from `math/relational-universe.md`. -/
theorem restrict_stab_nat {t t' : R.T} (h : t ≤ t') (a : R.FiberCarrier t') :
    (R.fiberAlg t).pi (R.restrict h a) = R.restrict h ((R.fiberAlg t').pi a) :=
  (R.restrict_pi h a).symm

-- ── Derived: restriction preserves individual nucleus fixed points ────────────

/-- H(f) maps Fix(σ_{t'}) into Fix(σ_t): restriction preserves σ-fixed points. -/
theorem restrict_fixedFiber_σ {t t' : R.T} (h : t ≤ t') {a : R.FiberCarrier t'}
    (ha : a ∈ (R.fiberAlg t').σ.fixedPoints) :
    R.restrict h a ∈ (R.fiberAlg t).σ.fixedPoints := by
  simp only [Nucleus.mem_fixedPoints] at ha ⊢
  calc (R.fiberAlg t).σ.toFun (R.restrict h a)
      = R.restrict h ((R.fiberAlg t').σ.toFun a) := (R.restrict_σ h a).symm
    _ = R.restrict h a                            := by rw [ha]

/-- H(f) maps Fix(Δ_{t'}) into Fix(Δ_t): restriction preserves Δ-fixed points. -/
theorem restrict_fixedFiber_Δ {t t' : R.T} (h : t ≤ t') {a : R.FiberCarrier t'}
    (ha : a ∈ (R.fiberAlg t').Δ.fixedPoints) :
    R.restrict h a ∈ (R.fiberAlg t).Δ.fixedPoints := by
  simp only [Nucleus.mem_fixedPoints] at ha ⊢
  calc (R.fiberAlg t).Δ.toFun (R.restrict h a)
      = R.restrict h ((R.fiberAlg t').Δ.toFun a) := (R.restrict_Δ h a).symm
    _ = R.restrict h a                            := by rw [ha]

/-- π is natural with respect to joins: H(f)(π(a ⊔ b)) = π(H(f)(a) ⊔ H(f)(b)).
    Uses restrict_sup then restrict_pi to commute π past restriction. -/
theorem restrict_pi_sup {t t' : R.T} (h : t ≤ t') (a b : R.FiberCarrier t') :
    R.restrict h ((R.fiberAlg t').pi (a ⊔ b)) =
    (R.fiberAlg t).pi (R.restrict h a ⊔ R.restrict h b) := by
  calc R.restrict h ((R.fiberAlg t').pi (a ⊔ b))
      = (R.fiberAlg t).pi (R.restrict h (a ⊔ b)) := R.restrict_pi h _
    _ = (R.fiberAlg t).pi (R.restrict h a ⊔ R.restrict h b) := by rw [R.restrict_sup]

-- ── OPEN: The sheaf of fixed fibers ──────────────────────────────────────────

-- Theorem (math/invariant-locale.md): the assignment t ↦ H*_t with the induced
-- restriction maps forms a sheaf of frames (finite Heyting algebras).
-- This requires: (1) the sheaf condition on R, (2) H*_t inheriting the lattice
-- structure from H_t and the nuclei being identity on H*_t.
--
-- theorem fixedFiber_sheaf : ... := sorry  -- OPEN

-- ── OPEN: Initiality / existence ─────────────────────────────────────────────

-- The paper claims R is the least fixed point of U_G, and in particular is initial
-- in the category of relational universes. This would require:
-- (1) A category of RelationalUniverses with morphisms being natural transformations
--     of the presheaf data.
-- (2) A proof that R is initial in that category.
--
-- theorem relational_universe_initial : ... := sorry  -- OPEN

end RelationalUniverse
