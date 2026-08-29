import RelationalHyperverse.HyperverseTower
import RelationalHyperverse.Reindexing

-- Establishes: relational-hyperverse

/-!
# RelationalHyperverse: the initial self-universal RelationalUniverse

Corresponds to `math/relational-hyperverse.md`.

The **Relational Hyperverse** H is the least fixed point of the meta-level Universe
Closure operator U_H, defined as the initial object in the category of self-universal
relational universes.

H satisfies the fixed-point equation `U_H(H) ≅ H`, and every self-universal universe
S admits a unique morphism H → S (initiality / least fixed point).

Existence follows from Adámek's fixed-point theorem: the ω-tower R^(0) ↪ R^(1) ↪ ⋯
has a colimit in RU (under appropriate completeness conditions), and that colimit is
the least fixed point of U_H.

## Main definitions
- `RelationalHyperverse` : the initial self-universal RelationalUniverse

## Open items
- **Existence**: requires colimits in RU (Adámek's theorem) — see `HyperverseTower`
- **Uniqueness** of the `initial` morphism: requires morphism equality in RU
- **Coherence** of `self_universal`: embed ∘ retract = id — see `HyperverseTower`
-/

/-- The Relational Hyperverse: the initial self-universal RelationalUniverse.

    H satisfies U_H(H) ≅ H and is initial among self-universal universes.

    OPEN: Existence (requires colimits in RU — see §hyperverse-tower).
    OPEN: Uniqueness of `initial` (requires morphism equality in RU). -/
structure RelationalHyperverse extends RelationalUniverse where
  /-- H is a fixed point of U_H. -/
  self_universal : IsSelfUniversal toRelationalUniverse
  /-- H is initial: there is a morphism to every self-universal universe. -/
  initial : ∀ (S : RelationalUniverse), IsSelfUniversal S →
      RelationalUniverseMor toRelationalUniverse S


-- ── Consequences of the Hyperverse structure ──────────────────────────────────

namespace RelationalHyperverse

variable (H : RelationalHyperverse)

-- Make the instances available
instance : PartialOrder H.T := H.T_order
instance : Monoid H.T := H.T_monoid
instance (t : H.T) : HeytingAlgebra (H.FiberCarrier t) := H.FiberHA t

-- π is idempotent at every fiber (holds for any RU).
example (t : H.T) (a : H.FiberCarrier t) :
    (H.fiberAlg t).pi ((H.fiberAlg t).pi a) = (H.fiberAlg t).pi a :=
  (H.fiberAlg t).pi_idempotent a

/-- Fixed fibers are preserved under restriction (holds for any RU). -/
theorem hyperverse_restrict_fixedFiber {t t' : H.T} (h : t ≤ t')
    {a : H.FiberCarrier t'} (ha : a ∈ (H.fiberAlg t').fixedFiber) :
    H.restrict h a ∈ (H.fiberAlg t).fixedFiber := by
  rw [(H.fiberAlg t).mem_fixedFiber_iff]
  calc (H.fiberAlg t).pi (H.restrict h a)
      = H.restrict h ((H.fiberAlg t').pi a) := by
          simp only [BiNucleus.pi, H.restrict_σ, H.restrict_Δ]
    _ = H.restrict h a := by
          rw [(H.fiberAlg t').mem_fixedFiber_iff.mp ha]

/-- The initial morphism's fiberMap pulls S*_{φ(t)} back into H*_t. -/
theorem initial_pullback_fixedFiber
    {S : RelationalUniverse} (hS : IsSelfUniversal S)
    (t : H.T) {a : S.FiberCarrier ((H.initial S hS).traceMap t)}
    (ha : a ∈ (S.fiberAlg ((H.initial S hS).traceMap t)).fixedFiber) :
    (H.initial S hS).fiberMap t a ∈ (H.fiberAlg t).fixedFiber :=
  (H.initial S hS).fiberMap_fixedFiber t ha

/-- The self-universal retract maps fixed fibers of H at retract.traceMap(t)
    back into fixed fibers of U_H(H) at t. -/
theorem self_universal_retract_fixedFiber
    (t : (UniverseClosure H.toRelationalUniverse).T)
    {a : H.FiberCarrier (H.self_universal.retract.traceMap t)}
    (ha : a ∈ (H.fiberAlg (H.self_universal.retract.traceMap t)).fixedFiber) :
    H.self_universal.retract.fiberMap t a ∈
      ((UniverseClosure H.toRelationalUniverse).fiberAlg t).fixedFiber :=
  H.self_universal.retract.fiberMap_fixedFiber t ha

end RelationalHyperverse
