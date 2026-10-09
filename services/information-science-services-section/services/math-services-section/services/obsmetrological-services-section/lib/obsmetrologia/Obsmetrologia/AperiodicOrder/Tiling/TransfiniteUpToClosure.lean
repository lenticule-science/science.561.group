import Obsmetrologia.AperiodicOrder.Tiling.UpToClosureCoinduction

/-!
# Transfinite up-to-closure — climbing the `coalgebraOrbitLimit` ladder

`UpToClosureCoinduction` discharged the cross-base MLD converse on the settling coalgebra by
up-to-closure coinduction (`bisimUTC_sound`), but only over the **successor** orbit (`orbit M E n`).
The residue of `thm:aperiodic-mld-classification` named two obstacles: (i) the stage induction must be
carried up the **`coalgebraOrbitLimit` ladder** — the limit-stage join `v_μ = ⋁ₖ{v_σ : σ < μ}` of
`SettlingCoalgebra` — through `ω₁`, and (ii) a transfinite carrier (non-idempotent
stage-closure) must be realized. This module discharges (i) for the carrier Obsmetrologia actually realizes.

The limit stage is the `≤ₖ`-join `coalgebraOrbitLimit` (a least upper bound, by
`coalgebraOrbitLimit_ge`/`_least`). Because the in-tree closure is idempotent (the strict-finite
regime, `closureOp_idem`), the limit join is squeezed between the seed and its settled value —
`E ≤ₖ v_μ ≤ₖ Cl E` for `μ ≥ 1` — so settling collapses it to the settled value:
`settle (coalgebraOrbitLimit E μ) = settle E` (`settle_coalgebraOrbitLimit`). The limit stage is
therefore **settled-value-invariant exactly like the successor orbit** (`settle_orbit`), and the
up-to-closure coinduction climbs through it: a bisimulation up to closure agrees on the settled value
at every limit stage too (`bisimUTC_settle_limit`).

So the `coalgebraOrbitLimit` ladder-climb — obstacle (i) — is discharged in-tree; what remains red in
`thm:aperiodic-mld-classification` is precisely obstacle (ii), a transfinite carrier on which the
stage-closure is **not** idempotent and the squeeze argument no longer collapses the limit. That is a
carrier-realization problem, not a defect of the coinduction or the ladder.

## Main results

* `orbit_le_closure` — every successor orbit stage sits below the settled value `Cl E`.
* `settle_coalgebraOrbitLimit` — the limit-stage join settles to the seed's settled value (`μ ≥ 1`).
* `bisimUTC_settle_limit` — up-to-closure coinduction climbs the limit: a bisimulation up to closure
  agrees on the settled value at every limit stage.
* `transfinite_ladder_climb` — the bundled headline.

## References

`content/.../aperiodic-regime-classification` (Step 4, the limit-stage ladder). Built on
`Obsmetrologia.AperiodicOrder.Tiling.UpToClosureCoinduction` and `Obsmetrologia.Closure.Coalgebra`.

## Tags

up-to-closure, coinduction, limit stage, transfinite, settling coalgebra, MLD classification
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling
namespace UpTo

open Valuation Valuation.ModalFrame
open Obsmetrologia.Coalgebra

variable (M : ModalFrame)

/-! ## (A) Successor orbit stages sit below the settled value -/

/-- **Every successor orbit stage is below the settled value** `Cl E`: the seed by inflation, each
later stage by monotonicity and idempotence. The upper bound the limit join inherits. -/
theorem orbit_le_closure (E : Valuation) : ∀ n, leK (orbit M E n) (M.closureOp E) := by
  intro n
  induction n with
  | zero => exact M.closureOp_infl E
  | succ k ih =>
    rw [orbit_succ]
    have h := M.closureOp_mono ih
    rwa [M.closureOp_idem] at h

/-! ## (B) The limit-stage join settles to the seed's settled value -/

/-- **The limit stage settles to the seed's settled value.** For `μ ≥ 1` the limit join
`coalgebraOrbitLimit E μ` is squeezed `E ≤ₖ v_μ ≤ₖ Cl E` (it dominates the seed `v₀ = E` and is the
least bound of stages all below `Cl E`), so the idempotent closure collapses it:
`settle (coalgebraOrbitLimit E μ) = settle E`. The limit stage is settled-value-invariant exactly as
the successor orbit is (`settle_orbit`) — the `coalgebraOrbitLimit` ladder carries the settled value. -/
theorem settle_coalgebraOrbitLimit (E : Valuation) (μ : Nat) (hμ : 1 ≤ μ) :
    M.settle (coalgebraOrbitLimit M E μ) = M.settle E := by
  have h1 : leK E (coalgebraOrbitLimit M E μ) := coalgebraOrbitLimit_ge M E μ 0 hμ
  have h2 : leK (coalgebraOrbitLimit M E μ) (M.closureOp E) :=
    coalgebraOrbitLimit_least M E μ (M.closureOp E) (fun σ _ => orbit_le_closure M E σ)
  show M.closureOp (coalgebraOrbitLimit M E μ) = M.closureOp E
  apply leK_antisymm
  · have h := M.closureOp_mono h2
    rwa [M.closureOp_idem] at h
  · exact M.closureOp_mono h1

/-! ## (C) The coinduction climbs the limit stage -/

/-- **Up-to-closure coinduction climbs the limit.** A settling bisimulation up to closure relating
`E` and `E'` agrees on the settled value at every limit stage `μ ≥ 1`, not only at successor stages:
`settle (coalgebraOrbitLimit E μ) = settle (coalgebraOrbitLimit E' μ)`. Both limits settle to their
seed's settled value (`settle_coalgebraOrbitLimit`), which agree by `bisimUTC_sound`. So the ladder
through the limit is sound for the realized (idempotent) carrier. -/
theorem bisimUTC_settle_limit {R : Valuation → Valuation → Prop} (hR : BisimUTC M R)
    {E E' : Valuation} (h : R E E') (μ : Nat) (hμ : 1 ≤ μ) :
    M.settle (coalgebraOrbitLimit M E μ) = M.settle (coalgebraOrbitLimit M E' μ) := by
  rw [settle_coalgebraOrbitLimit M E μ hμ, settle_coalgebraOrbitLimit M E' μ hμ]
  exact (bisim_iff_settleEq M E E').1 (bisimUTC_sound M hR h)

/-! ## (D) The bundled headline -/

/-- **The transfinite ladder-climb, discharged for the realized carrier.** On the settling coalgebra:

* **the limit stage carries the settled value** (`settle_coalgebraOrbitLimit`) — `settle (v_μ) =
  settle E` for `μ ≥ 1`, the `coalgebraOrbitLimit` join collapsing under the idempotent closure;
* **the coinduction climbs the limit** (`bisimUTC_settle_limit`) — a bisimulation up to closure agrees
  on the settled value at every limit stage, not just at successors.

This discharges the `coalgebraOrbitLimit` ladder-climb obstacle of `thm:aperiodic-mld-classification`
for the carrier Obsmetrologia realizes (the strict-finite, idempotent-closure regime). The remaining red
residue is precisely the other obstacle: a transfinite carrier whose stage-closure is **not**
idempotent, where the seed-to-`Cl E` squeeze no longer collapses the limit — a carrier-realization
problem, not a defect of the coinduction principle or the ladder. -/
theorem transfinite_ladder_climb :
    (∀ (E : Valuation) (μ : Nat), 1 ≤ μ →
        M.settle (coalgebraOrbitLimit M E μ) = M.settle E)
    ∧ (∀ (R : Valuation → Valuation → Prop), BisimUTC M R →
        ∀ (E E' : Valuation), R E E' → ∀ μ, 1 ≤ μ →
          M.settle (coalgebraOrbitLimit M E μ) = M.settle (coalgebraOrbitLimit M E' μ)) :=
  ⟨fun E μ hμ => settle_coalgebraOrbitLimit M E μ hμ,
   fun _ hR _ _ h μ hμ => bisimUTC_settle_limit M hR h μ hμ⟩

end UpTo
end AperiodicOrder.Tiling
end Obsmetrologia
