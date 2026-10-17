/-
# ValuationQuartetDischarge — discharging the abstract nuclear quartet at the genuine Valuation fiber

`ValuationFiberAlgebra` built the settling nuclear quartet **concretely and directly on
the valuation fiber** `A_p = Valuation = PredicationCell → Charge`: its own
`FiberHeyting`, its own `FiberNuclearSquare`, its own `FiberTruthQuartet` — with every
order law, Heyting adjunction, and nucleus law PROVEN by pointwise reduction to the
finite `Charge` facts. But it deliberately did *not* import the reusable abstract
`RelMath.Order.*` hierarchy; it **deferred** discharging the abstract bundle at that
fiber. `NuclearAutopoiesisCell` discharged the abstract `Order.HeytingAlgebra` /
`Order.CommutingNuclei` only at the in-situ **charge** level.

This module cashes out the deferred bridge: it gives the abstract
`Order.HeytingAlgebra`, `Order.CommutingNuclei`, and `Order.NuclearQuartet` a **real
inhabitant** built from the spine's settled valuation fiber, with every abstract field
filled by REUSING `ValuationFiberAlgebra`'s already-proven pointwise lemmas — no law is
re-derived, none is hypothesized.

  content/.../settling/content/bigraded-diamond/content/nuclear-quartet/nuclear-quartet.md
  content/.../settling/content/aperiodic-settling/commutating/commutating.md

Concretely:

* `valuationOrderHeyting : Order.HeytingAlgebra` — carrier `Valuation`, meet `fMeetT`,
  join `fJoinT`, top `fun _ => tTop`, bot `fun _ => tBot`, himp `fImpT`; every lattice
  law + `le_top`/`bot_le` + the Heyting adjunction `himp_adj` filled by `funext` + the
  finite `Charge` exhaustions. This is the abstract Heyting algebra of the **genuine
  settled fiber** `A_p`.
* `valuationSettlingQuartet : Order.CommutingNuclei valuationOrderHeyting` — `j1` is the
  `Order.Nucleus` repackaging of the saturating `sigma`, `j2` of the transferring
  `delta`; their `infl`/`idem`/`meet` come *directly* from `FiberNuclearSquare`'s proven
  `j1_infl`/`j1_idem`/`j1_meet` (resp. `j2_*`), and `comm` from `sigma_delta_comm`. The
  abstract `Order.Nucleus.infl` is w.r.t. `valuationOrderHeyting.le` (= the truth order
  `fLeT`) and `Order.Nucleus.meet` is w.r.t. `fMeetT`, so the concrete truth-order proofs
  transport with no re-derivation.

The two theorems are the abstract `fix_pi_iff` and the discharge bundle, now theorems
about the REAL fiber via the abstract machinery — upgrading the no-free-data invariant
from "no axioms" to "no un-discharged abstract hypothesis over the fiber": the abstract
quartet theory the keystone uses now has a spine-generated inhabitant.
-/
import RelMath.ValuationFiberAlgebra
import RelMath.NucleusAndCommutingNuclei

namespace RelMath
namespace FiberDischarge

open RelMath.FiberAlgebra

/-! ## 1. The abstract Heyting algebra on the genuine fiber

We discharge `Order.HeytingAlgebra` at `A_p = Valuation`. The lattice laws are pointwise
lifts of finite `Charge` facts; the Heyting adjunction reuses the Charge-level
`Charge.heyting_adj`. Each law is `funext φ` then a concrete `Charge` exhaustion. -/

/-- The abstract `Order.HeytingAlgebra` discharged at the settled valuation fiber. Its
carrier is `Valuation`, meet/join are the pointwise truth meet/join, top/bot are the
constant `tTop`/`tBot` valuations, and `himp` is the pointwise truth implication `fImpT`.
Every lattice law, `le_top`, `bot_le`, and the Heyting adjunction `himp_adj` is proven
concretely — this is the abstract Heyting algebra of the genuine settled fiber `A_p`. -/
def valuationOrderHeyting : Order.HeytingAlgebra where
  carrier := Valuation
  meet := fMeetT
  join := fJoinT
  top := fun _ => RelMath.Charge.tTop
  bot := fun _ => RelMath.Charge.tBot
  meet_comm a b := by
    funext φ; show RelMath.Charge.meetT (a φ) (b φ) = RelMath.Charge.meetT (b φ) (a φ)
    exact Charge.meetT_comm' (a φ) (b φ)
  meet_assoc a b c := by
    funext φ
    show RelMath.Charge.meetT (RelMath.Charge.meetT (a φ) (b φ)) (c φ)
        = RelMath.Charge.meetT (a φ) (RelMath.Charge.meetT (b φ) (c φ))
    exact Charge.meetT_assoc' (a φ) (b φ) (c φ)
  meet_idem a := by
    funext φ; show RelMath.Charge.meetT (a φ) (a φ) = a φ
    exact Charge.meetT_idem (a φ)
  join_comm a b := by
    funext φ; show RelMath.Charge.joinT (a φ) (b φ) = RelMath.Charge.joinT (b φ) (a φ)
    cases (a φ) <;> cases (b φ) <;> rfl
  join_assoc a b c := by
    funext φ
    show RelMath.Charge.joinT (RelMath.Charge.joinT (a φ) (b φ)) (c φ)
        = RelMath.Charge.joinT (a φ) (RelMath.Charge.joinT (b φ) (c φ))
    cases (a φ) <;> cases (b φ) <;> cases (c φ) <;> rfl
  join_idem a := by
    funext φ; show RelMath.Charge.joinT (a φ) (a φ) = a φ
    cases (a φ) <;> rfl
  absorb_mj a b := by
    funext φ
    show RelMath.Charge.meetT (a φ) (RelMath.Charge.joinT (a φ) (b φ)) = a φ
    cases (a φ) <;> cases (b φ) <;> rfl
  absorb_jm a b := by
    funext φ
    show RelMath.Charge.joinT (a φ) (RelMath.Charge.meetT (a φ) (b φ)) = a φ
    cases (a φ) <;> cases (b φ) <;> rfl
  meet_top a := by
    funext φ; show RelMath.Charge.meetT (a φ) RelMath.Charge.tTop = a φ
    cases (a φ) <;> rfl
  join_bot a := by
    funext φ; show RelMath.Charge.joinT (a φ) RelMath.Charge.tBot = a φ
    cases (a φ) <;> rfl
  himp := fImpT
  himp_adj a b c := by
    -- abstract: meet (meet a b) c = meet a b ↔ meet b (himp a c) = b
    -- pointwise via the verified Charge `impT` adjunction (per-charge `decide`).
    constructor
    · intro h
      funext φ
      show RelMath.Charge.meetT (b φ) (Charge.impT (a φ) (c φ)) = b φ
      have hφ : RelMath.Charge.meetT
          (RelMath.Charge.meetT (a φ) (b φ)) (c φ)
          = RelMath.Charge.meetT (a φ) (b φ) := congrFun h φ
      -- reduce to the charge adjunction (slot order normalised by `decide`)
      revert hφ
      cases (a φ) <;> cases (b φ) <;> cases (c φ) <;> decide
    · intro h
      funext φ
      show RelMath.Charge.meetT (RelMath.Charge.meetT (a φ) (b φ)) (c φ)
          = RelMath.Charge.meetT (a φ) (b φ)
      have hφ : RelMath.Charge.meetT (b φ) (Charge.impT (a φ) (c φ)) = b φ :=
        congrFun h φ
      revert hφ
      cases (a φ) <;> cases (b φ) <;> cases (c φ) <;> decide

/-! ### Order/`himp` agreement notes

`valuationOrderHeyting.le` unfolds to `fun a b => fMeetT a b = a` — definitionally the
fiber truth order `fLeT`. `valuationOrderHeyting.meet = fMeetT` and
`valuationOrderHeyting.himp = fImpT`. So the abstract nucleus laws (`infl` over
`.le = fLeT`, `meet` over `fMeetT`) match the concrete truth-order nuclei exactly, and
the `FiberNuclearSquare` proofs transport with no re-derivation. -/

/-- The abstract order on the discharged fiber is the concrete fiber truth order. -/
theorem valuationOrderHeyting_le (a b : Valuation) :
    valuationOrderHeyting.le a b ↔ fLeT a b := Iff.rfl

/-! ## 2. The two abstract nuclei — repackaging σ and Δ

We wrap the saturating `sigma` and transferring `delta` as `Order.Nucleus`
`valuationOrderHeyting`, filling `infl`/`idem`/`meet` from `settlingSquare`'s proven
fields. The abstract `infl` is w.r.t. `valuationOrderHeyting.le = fLeT`, and `meet` is
w.r.t. `fMeetT`, so each field is *literally* a `settlingSquare` projection. -/

/-- The saturating nucleus `σ`, as an abstract `Order.Nucleus` of the discharged fiber. -/
def sigmaNucleus : Order.Nucleus valuationOrderHeyting where
  j := sigma
  infl := settlingSquare.j1_infl
  idem := settlingSquare.j1_idem
  meet := settlingSquare.j1_meet

/-- The transferring nucleus `Δ`, as an abstract `Order.Nucleus` of the discharged fiber. -/
def deltaNucleus : Order.Nucleus valuationOrderHeyting where
  j := delta
  infl := settlingSquare.j2_infl
  idem := settlingSquare.j2_idem
  meet := settlingSquare.j2_meet

/-- The commuting nuclear square `(σ, Δ)` discharged abstractly on the genuine fiber:
`j1` is the saturating nucleus, `j2` the transferring nucleus, and `comm` is the proven
fiber commutation `sigma_delta_comm`. This is the abstract `Order.CommutingNuclei`
(= `Order.NuclearQuartet`) inhabited by the settled valuation fiber. -/
def valuationSettlingQuartet : Order.CommutingNuclei valuationOrderHeyting where
  j1 := sigmaNucleus
  j2 := deltaNucleus
  comm := sigma_delta_comm

/-! ## 3. `fix_pi_iff` at the genuine fiber

The abstract `Order.CommutingNuclei.fix_pi_iff`, instantiated at the discharged fiber:
the doubly-quiescent fiber layer `A* = Fix(σ) ∩ Fix(Δ)`, now proven via the *abstract*
machinery about the *real* fiber. -/

/-- The abstract `fix_pi_iff` at the genuine valuation fiber: a fiber
valuation is `π = σ∘Δ`-quiescent iff it is fixed by *both* the saturating `σ` and the
transferring `Δ`. This is `A* = Fix(σ) ∩ Fix(Δ)` — the doubly-quiescent fiber layer —
obtained from the abstract `Order.CommutingNuclei.fix_pi_iff` discharged at the real
spine-generated fiber, not from the bespoke concrete `FiberNuclearSquare.fix_pi_iff`. -/
theorem valuation_quartet_fix_pi_iff (v : Valuation) :
    valuationSettlingQuartet.pi v = v
      ↔ (valuationSettlingQuartet.j1.j v = v ∧ valuationSettlingQuartet.j2.j v = v) :=
  valuationSettlingQuartet.fix_pi_iff v

/-! ## 4. The discharge bundle

The cash-out: the abstract `Order.NuclearQuartet` theory the keystone uses is now
INHABITED by the settled valuation fiber. We bundle the genuine Heyting algebra, the
genuine commuting nuclei (with commutation proven), the exhaustive four corners, and the
agreement of the abstract σ/Δ with `ValuationFiberAlgebra`'s concrete
`FiberNuclearSquare`. -/

/-- The discharge bundle proving the abstract `Order.NuclearQuartet` is inhabited by the
genuine settled valuation fiber. The Heyting algebra and commuting nuclei are pinned to
the discharged fiber instances `valuationOrderHeyting` / `valuationSettlingQuartet`, so
the agreement fields with `ValuationFiberAlgebra`'s concrete `settlingSquare` typecheck
(the carrier is genuinely `Valuation`). -/
structure QuartetDischarge where
  /-- The discharged Heyting algebra's `himp_adj` (the Heyting adjunction) holds — proven. -/
  himp_adj : ∀ a b c,
      (valuationOrderHeyting.meet (valuationOrderHeyting.meet a b) c
        = valuationOrderHeyting.meet a b)
      ↔ (valuationOrderHeyting.meet b (valuationOrderHeyting.himp a c) = b)
  /-- Commutation of the two abstract nuclei is proven. -/
  comm : ∀ a, valuationSettlingQuartet.j1.j (valuationSettlingQuartet.j2.j a)
      = valuationSettlingQuartet.j2.j (valuationSettlingQuartet.j1.j a)
  /-- The four corner operators are exhaustive (`Corner` has exactly four). -/
  corners_card : Corner.all.length = 4
  /-- The absurd corner is exactly the intersection of the active and stable corners. -/
  absurd_is_intersection : ∀ a,
    (Order.NuclearQuartet.cornerOp valuationSettlingQuartet .absurd a = a)
      ↔ (Order.NuclearQuartet.cornerOp valuationSettlingQuartet .active a = a
          ∧ Order.NuclearQuartet.cornerOp valuationSettlingQuartet .stable a = a)
  /-- The abstract `j1` (= `σ`) IS `ValuationFiberAlgebra`'s concrete saturating nucleus. -/
  j1_agrees : valuationSettlingQuartet.j1.j = settlingSquare.j1
  /-- The abstract `j2` (= `Δ`) IS `ValuationFiberAlgebra`'s concrete transferring nucleus. -/
  j2_agrees : valuationSettlingQuartet.j2.j = settlingSquare.j2
  /-- The abstract joint closure `π` IS the concrete `FiberNuclearSquare.pi`. -/
  pi_agrees : valuationSettlingQuartet.pi = settlingSquare.pi

/-- The abstract `Order.NuclearQuartet` is INHABITED by the settled
valuation fiber `A_p`. This is the cash-out of the deferred bridge: the abstract Heyting
algebra `valuationOrderHeyting` is genuine (its `himp_adj` holds), the abstract commuting
nuclei `valuationSettlingQuartet` are genuine (commutation proven), the four corners over
`Corner` are exhaustive with the absurd corner = `Fix(σ)∩Fix(Δ)`, AND the abstract σ/Δ/π
agree definitionally with `ValuationFiberAlgebra`'s concrete `settlingSquare`. So nothing
the keystone's abstract quartet theory relies on is merely hypothesized over the fiber —
it has a spine-generated inhabitant with every law proven. -/
def valuation_discharges_abstract_quartet : QuartetDischarge where
  himp_adj := valuationOrderHeyting.himp_adj
  comm := valuationSettlingQuartet.comm
  corners_card := Corner.card_eq_four
  absurd_is_intersection :=
    Order.NuclearQuartet.absurd_iff_active_and_stable valuationSettlingQuartet
  j1_agrees := rfl
  j2_agrees := rfl
  pi_agrees := rfl

end FiberDischarge
end RelMath
