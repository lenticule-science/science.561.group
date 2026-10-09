import Mathlib.Order.Heyting.Basic
import Mathlib.Order.Lattice
import RelationalHyperverse.RelationalUniverse

-- Establishes: universe-morphism

/-!
# UniverseMorphisms: morphisms in the category of Relational Universes

Corresponds to `math/universe-morphism.md`.

A **morphism** R → S in the category RU of relational universes is a pair (φ, α) where:
- `φ : R.T → S.T` is a history-category morphism (preserving ≤ and concatenation)
- `α_t : S.FiberCarrier(φ(t)) → R.FiberCarrier(t)` is a natural transformation of
  HA-presheaves (contravariant in the fiber, hence the pullback direction)

The `fiberMap` goes S.FiberCarrier(φ(t)) → R.FiberCarrier(t), matching the
**geometric morphism** convention: a morphism R → S in RU induces a geometric morphism
of the associated toposes whose inverse image functor pulls back from S to R.

## Main definitions
- `RelationalUniverseMor R S` : a morphism R → S in RU

## Main results
- `RelationalUniverseMor.id` : the identity morphism
- `RelationalUniverseMor.comp` : composition of morphisms
- `fiberMap_pi` : fiberMap commutes with the joint projection π
- `fiberMap_fixedFiber` : fiberMap maps fixed fibers to fixed fibers
-/

/-- A morphism of RelationalUniverses (R → S in the category RU).

    Corresponds to `math/universe-morphism.md`: a pair (φ, α) where φ is a
    history category morphism and α is a natural transformation of HA-presheaves.

    The `fiberMap` goes S.FiberCarrier(traceMap t) → R.FiberCarrier(t),
    i.e., it is contravariant in the fiber (geometric morphism convention). -/
structure RelationalUniverseMor (R S : RelationalUniverse) where
  /-- The map on history types: a morphism of HistorySystem structures. -/
  traceMap     : R.T → S.T
  traceMap_le  : ∀ {t t' : R.T}, t ≤ t' → traceMap t ≤ traceMap t'
  traceMap_mul : ∀ (t u : R.T), traceMap (t * u) = traceMap t * traceMap u

  /-- The map on fiber carriers (contravariant: pulls back along traceMap). -/
  fiberMap : ∀ (t : R.T), S.FiberCarrier (traceMap t) → R.FiberCarrier t

  /-- fiberMap is a lattice morphism. -/
  fiberMap_inf : ∀ (t : R.T) (a b : S.FiberCarrier (traceMap t)),
    fiberMap t (a ⊓ b) = fiberMap t a ⊓ fiberMap t b
  fiberMap_sup : ∀ (t : R.T) (a b : S.FiberCarrier (traceMap t)),
    fiberMap t (a ⊔ b) = fiberMap t a ⊔ fiberMap t b

  /-- fiberMap commutes with σ. -/
  fiberMap_σ : ∀ (t : R.T) (a : S.FiberCarrier (traceMap t)),
    fiberMap t ((S.fiberAlg (traceMap t)).σ.toFun a) =
      (R.fiberAlg t).σ.toFun (fiberMap t a)

  /-- fiberMap commutes with Δ. -/
  fiberMap_Δ : ∀ (t : R.T) (a : S.FiberCarrier (traceMap t)),
    fiberMap t ((S.fiberAlg (traceMap t)).Δ.toFun a) =
      (R.fiberAlg t).Δ.toFun (fiberMap t a)

  /-- Naturality: fiberMap commutes with restriction maps. -/
  fiberMap_nat : ∀ {t t' : R.T} (h : t ≤ t') (a : S.FiberCarrier (traceMap t')),
    fiberMap t (S.restrict (traceMap_le h) a) = R.restrict h (fiberMap t' a)

  /-- fiberMap preserves Heyting implication. -/
  fiberMap_himp : ∀ (t : R.T) (a b : S.FiberCarrier (traceMap t)),
    fiberMap t (a ⇨ b) = fiberMap t a ⇨ fiberMap t b

  /-- fiberMap preserves ⊥. -/
  fiberMap_bot : ∀ (t : R.T),
    fiberMap t (⊥ : S.FiberCarrier (traceMap t)) = ⊥

  /-- fiberMap preserves ⊤. -/
  fiberMap_top : ∀ (t : R.T),
    fiberMap t (⊤ : S.FiberCarrier (traceMap t)) = ⊤


namespace RelationalUniverseMor

variable {R S U : RelationalUniverse}

-- ── Identity morphism ────────────────────────────────────────────────────────

/-- The identity morphism on any RelationalUniverse. -/
def id (R : RelationalUniverse) : RelationalUniverseMor R R where
  traceMap     := _root_.id
  traceMap_le  := _root_.id
  traceMap_mul := fun _ _ => rfl
  fiberMap     := fun _ b => b
  fiberMap_inf := fun _ _ _ => rfl
  fiberMap_sup := fun _ _ _ => rfl
  fiberMap_σ   := fun _ _ => rfl
  fiberMap_Δ   := fun _ _ => rfl
  fiberMap_nat := fun _ _ => rfl
  fiberMap_himp := fun _ _ _ => rfl
  fiberMap_bot := fun _ => rfl
  fiberMap_top := fun _ => rfl

-- ── fiberMap commutes with π ─────────────────────────────────────────────────

/-- fiberMap commutes with π = σ∘Δ. -/
theorem fiberMap_pi (f : RelationalUniverseMor R S) (t : R.T)
    (a : S.FiberCarrier (f.traceMap t)) :
    f.fiberMap t ((S.fiberAlg (f.traceMap t)).pi a) =
      (R.fiberAlg t).pi (f.fiberMap t a) := by
  simp only [BiNucleus.pi, f.fiberMap_σ, f.fiberMap_Δ]

/-- fiberMap maps fixed fibers to fixed fibers. -/
theorem fiberMap_fixedFiber (f : RelationalUniverseMor R S) (t : R.T)
    {a : S.FiberCarrier (f.traceMap t)}
    (ha : a ∈ (S.fiberAlg (f.traceMap t)).fixedFiber) :
    f.fiberMap t a ∈ (R.fiberAlg t).fixedFiber := by
  rw [(R.fiberAlg t).mem_fixedFiber_iff]
  calc (R.fiberAlg t).pi (f.fiberMap t a)
      = f.fiberMap t ((S.fiberAlg (f.traceMap t)).pi a) := (f.fiberMap_pi t a).symm
    _ = f.fiberMap t a := by rw [(S.fiberAlg _).mem_fixedFiber_iff.mp ha]

-- ── Composition ──────────────────────────────────────────────────────────────

/-- Composition of universe morphisms. -/
def comp (g : RelationalUniverseMor S U) (f : RelationalUniverseMor R S) :
    RelationalUniverseMor R U where
  traceMap     := g.traceMap ∘ f.traceMap
  traceMap_le  := fun h => g.traceMap_le (f.traceMap_le h)
  traceMap_mul := fun t u => by
    simp only [Function.comp, f.traceMap_mul, g.traceMap_mul]
  fiberMap     := fun t a => f.fiberMap t (g.fiberMap (f.traceMap t) a)
  fiberMap_inf := fun t a b => by
    simp only [g.fiberMap_inf, f.fiberMap_inf]
  fiberMap_sup := fun t a b => by
    simp only [g.fiberMap_sup, f.fiberMap_sup]
  fiberMap_σ   := fun t a =>
    (congrArg (f.fiberMap t) (g.fiberMap_σ (f.traceMap t) a)).trans
      (f.fiberMap_σ t (g.fiberMap (f.traceMap t) a))
  fiberMap_Δ   := fun t a =>
    (congrArg (f.fiberMap t) (g.fiberMap_Δ (f.traceMap t) a)).trans
      (f.fiberMap_Δ t (g.fiberMap (f.traceMap t) a))
  fiberMap_nat := fun {t t'} h a => by
    simp only [Function.comp]
    rw [← f.fiberMap_nat h (g.fiberMap (f.traceMap t') a)]
    congr 1
    exact g.fiberMap_nat (f.traceMap_le h) a
  fiberMap_himp := fun t a b =>
    (congrArg (f.fiberMap t) (g.fiberMap_himp (f.traceMap t) a b)).trans
      (f.fiberMap_himp t _ _)
  fiberMap_bot := fun t =>
    (congrArg (f.fiberMap t) (g.fiberMap_bot (f.traceMap t))).trans (f.fiberMap_bot t)
  fiberMap_top := fun t =>
    (congrArg (f.fiberMap t) (g.fiberMap_top (f.traceMap t))).trans (f.fiberMap_top t)

end RelationalUniverseMor
