import Infomaterial.Language.Positing.TruthOrder
import Infomaterial.Language.Positing.Four

/-!
# Positing.FiberAlgebra — the settling nuclear quartet on the truth-order fiber

This module formalizes, *directly on the concrete valuation fiber*, the **settling
nuclear quartet** of the corpus's bigraded diamond:

  content/.../settling/content/bigraded-diamond/content/nuclear-quartet/nuclear-quartet.md
  content/.../settling/content/aperiodic-settling/commutating/commutating.md

The bigraded-diamond node says the single diamond at each grade is the four canonical
sub-algebras `(A, Fix j₁, Fix j₂, A*)` determined by **two commuting nuclei** `j₁, j₂`
on a Heyting algebra `A`; when `j₁∘j₂ = j₂∘j₁`, the composite `π := j₁∘j₂` is again a
nucleus and `A* = Fix π = Fix j₁ ∩ Fix j₂`. The commutating node names the two nuclei
on the settled fiber algebra `A = H_t` — the past-facing **saturating** `σ` and the
future-facing **transferring** `Δ` — and asserts `σ∘Δ = Δ∘σ`, the aperiodic-regime
coherence 2-cell (the KZ-diamond hinge).

Here the carrier `A` is taken **concretely** as the truth-order fiber algebra: the
valuation fiber `Valuation = PredicationCell → Charge` ordered pointwise by the
**truth** order `≤ₜ`. We build that fiber's own order, its own Heyting structure, and
its two commuting nuclei `σ`, `Δ` (as truth-closures `a ↦ joinT s a` toward two fixed
poles), entirely on this fiber — *without* importing the abstract `Infomaterial.Order.*`
infrastructure. Every nucleus law is proven by reducing pointwise to the finite
`Charge`-level facts (each a `cases <;> decide` exhaustion).

We also prove **the finding** (`cross_order_not_knowledge_nucleus`): a *truth*-closure
is **not** a *knowledge* nucleus — it is not even knowledge-inflationary. Concretely,
on the fiber there is a valuation `v` with `¬ fLeK v (Δ-style truth-closure of v)`,
witnessed by the sharp charge fact `meetK kTop (joinT kBot kTop) ≠ kTop`. This is why
the two bilattice orders enter the corpus's bigraded diamond as the **bigrading** — two
*separate* Heyting structures, one per order — rather than as two nuclei inhabiting one
Heyting square. The nuclear quartet lives **within** the truth order; the knowledge
order is the orthogonal grade, not a second nucleus on the same algebra.
-/

namespace Infomaterial
namespace Positing.FiberAlgebra

/-! ## 0. Charge-level lemmas (finite exhaustion)

We first prove the handful of `Charge` facts we will lift pointwise. Each is a finite
exhaustion over the four-point `Charge`. (`Charge.meetT`, `Charge.joinT`, `Charge.impT`
poles, adjunction, closure laws and commutation.) -/

namespace Charge
open Infomaterial.Charge

/-- The **truth-order Heyting implication** on charges:
`impT a c = ofSlots ((¬a.pos)∨c.pos) ((¬a.neg)∧c.neg)`. -/
def impT (a c : Infomaterial.Charge) : Infomaterial.Charge :=
  Infomaterial.Charge.ofSlots ((!a.pos) || c.pos) ((!a.neg) && c.neg)

/-- `meetT` is idempotent — the diagonal of the truth meet. -/
theorem meetT_idem (a : Infomaterial.Charge) : meetT a a = a := by cases a <;> rfl

/-- `meetT` is commutative (restated locally for the order proofs). -/
theorem meetT_comm' (a b : Infomaterial.Charge) : meetT a b = meetT b a := by
  cases a <;> cases b <;> rfl

/-- `meetT` is associative (restated locally). -/
theorem meetT_assoc' (a b c : Infomaterial.Charge) :
    meetT (meetT a b) c = meetT a (meetT b c) := by
  cases a <;> cases b <;> cases c <;> rfl

/-- **Truth-meet antisymmetry data.** If `meetT a b = a` and `meetT b a = b` then
`a = b`. -/
theorem meetT_antisymm (a b : Infomaterial.Charge) :
    meetT a b = a → meetT b a = b → a = b := by
  intro h1 h2; revert h1 h2; cases a <;> cases b <;> decide

/-- **The truth Heyting adjunction at charge level** (the verified `impT` adjunction):
`meetT (meetT b a) c = meetT b a ↔ meetT b (impT a c) = b`. -/
theorem heyting_adj (a b c : Infomaterial.Charge) :
    meetT (meetT b a) c = meetT b a ↔ meetT b (impT a c) = b := by
  cases a <;> cases b <;> cases c <;> decide

/-- A truth-closure `fun a => joinT s a` is **truth-inflationary**:
`meetT a (joinT s a) = a`. -/
theorem joinT_infl (s a : Infomaterial.Charge) : meetT a (joinT s a) = a := by
  cases s <;> cases a <;> rfl

/-- A truth-closure is **idempotent**: `joinT s (joinT s a) = joinT s a`. -/
theorem joinT_clo_idem (s a : Infomaterial.Charge) : joinT s (joinT s a) = joinT s a := by
  cases s <;> cases a <;> rfl

/-- A truth-closure **preserves `meetT`**:
`joinT s (meetT a b) = meetT (joinT s a) (joinT s b)`. -/
theorem joinT_meetT (s a b : Infomaterial.Charge) :
    joinT s (meetT a b) = meetT (joinT s a) (joinT s b) := by
  cases s <;> cases a <;> cases b <;> rfl

/-- **Any two truth-closures commute**:
`joinT s (joinT d a) = joinT d (joinT s a)`. -/
theorem joinT_clo_comm (s d a : Infomaterial.Charge) :
    joinT s (joinT d a) = joinT d (joinT s a) := by
  cases s <;> cases d <;> cases a <;> rfl

/-- **The finding (sharp charge witness).** A truth-closure is **not**
knowledge-inflationary: `meetK kTop (joinT kBot kTop) ≠ kTop`. (`decide` proved that
`∀ a, meetK a (joinT kBot a) = a` is *false*; this is the explicit counterexample.) -/
theorem not_knowledge_infl_witness :
    meetK kTop (joinT kBot kTop) ≠ kTop := by decide

end Charge

/-! ## 1. Pointwise fiber operations

The fiber `Valuation = PredicationCell → Charge` carries the pointwise lift of each
truth-order operation. -/

open Infomaterial.Charge in
/-- Pointwise truth-meet of valuations. -/
def fMeetT (v w : Valuation) : Valuation := fun φ => meetT (v φ) (w φ)

open Infomaterial.Charge in
/-- Pointwise truth-join of valuations. -/
def fJoinT (v w : Valuation) : Valuation := fun φ => joinT (v φ) (w φ)

open Infomaterial.Charge in
/-- Pointwise truth-meet of valuations — the *knowledge* meet, used only to state the
finding's pointwise knowledge order. -/
def fMeetK (v w : Valuation) : Valuation := fun φ => meetK (v φ) (w φ)

/-- Pointwise truth Heyting implication of valuations. -/
def fImpT (v w : Valuation) : Valuation := fun φ => Charge.impT (v φ) (w φ)

/-- The fiber's truth-top: `tTop` everywhere. -/
def fTop : Valuation := fun _ => Infomaterial.Charge.tTop

/-- The fiber's truth-bottom: `tBot` everywhere. -/
def fBot : Valuation := fun _ => Infomaterial.Charge.tBot

/-! ## 2. The fiber's own truth order — a partial order

`fLeT v w := fMeetT v w = v`: `v` is truth-below `w` iff the truth-meet absorbs `v`.
We prove reflexivity, transitivity, antisymmetry by `funext` + the Charge truth-lattice
lemmas. -/

/-- The fiber truth order: `v ≤ₜ w` iff `fMeetT v w = v` (pointwise truth meet). -/
def fLeT (v w : Valuation) : Prop := fMeetT v w = v

/-- **Reflexivity** of the fiber truth order. -/
theorem fLeT_refl (v : Valuation) : fLeT v v := by
  funext φ; exact Charge.meetT_idem (v φ)

/-- **Transitivity** of the fiber truth order. -/
theorem fLeT_trans (u v w : Valuation) : fLeT u v → fLeT v w → fLeT u w := by
  intro huv hvw
  funext φ
  have hu : Infomaterial.Charge.meetT (u φ) (v φ) = u φ := congrFun huv φ
  have hv : Infomaterial.Charge.meetT (v φ) (w φ) = v φ := congrFun hvw φ
  -- meetT (u φ) (w φ) = meetT (meetT (u φ) (v φ)) (w φ) = meetT (u φ) (meetT (v φ) (w φ))
  --                   = meetT (u φ) (v φ) = u φ
  calc Infomaterial.Charge.meetT (u φ) (w φ)
      = Infomaterial.Charge.meetT (Infomaterial.Charge.meetT (u φ) (v φ)) (w φ) := by rw [hu]
    _ = Infomaterial.Charge.meetT (u φ) (Infomaterial.Charge.meetT (v φ) (w φ)) :=
          Charge.meetT_assoc' (u φ) (v φ) (w φ)
    _ = Infomaterial.Charge.meetT (u φ) (v φ) := by rw [hv]
    _ = u φ := hu

/-- **Antisymmetry** of the fiber truth order. -/
theorem fLeT_antisymm (v w : Valuation) : fLeT v w → fLeT w v → v = w := by
  intro hvw hwv
  funext φ
  exact Charge.meetT_antisymm (v φ) (w φ) (congrFun hvw φ) (congrFun hwv φ)

/-! ## 3. The fiber as its own Heyting algebra

We prove the Heyting adjunction `fLeT (fMeetT b a) c ↔ fLeT b (fImpT a c)` pointwise,
reducing to the verified Charge `impT` adjunction, and bundle the fiber data into a
concrete `FiberHeyting` value (whose laws are all *proven*, not postulated). -/

/-- **The fiber Heyting adjunction**: `(b ∧ₜ a) ≤ₜ c ↔ b ≤ₜ (a ⇒ₜ c)`, pointwise. -/
theorem fHeyting_adj (a b c : Valuation) :
    fLeT (fMeetT b a) c ↔ fLeT b (fImpT a c) := by
  constructor
  · intro h
    funext φ
    have hφ : Infomaterial.Charge.meetT (Infomaterial.Charge.meetT (b φ) (a φ)) (c φ)
        = Infomaterial.Charge.meetT (b φ) (a φ) := congrFun h φ
    exact (Charge.heyting_adj (a φ) (b φ) (c φ)).1 hφ
  · intro h
    funext φ
    have hφ : Infomaterial.Charge.meetT (b φ) (Charge.impT (a φ) (c φ)) = b φ := congrFun h φ
    exact (Charge.heyting_adj (a φ) (b φ) (c φ)).2 hφ

/-- A **concrete Heyting-algebra bundle on a carrier** — our own small structure,
laws-as-fields in house style; *not* `Infomaterial.Order.HeytingAlgebra`. Every instance
must PROVE each field. -/
structure FiberHeyting (Carrier : Type) where
  /-- The order relation. -/
  le : Carrier → Carrier → Prop
  /-- The meet. -/
  meet : Carrier → Carrier → Carrier
  /-- The Heyting implication. -/
  imp : Carrier → Carrier → Carrier
  /-- The top. -/
  top : Carrier
  /-- The bottom. -/
  bot : Carrier
  /-- Reflexivity. -/
  le_refl : ∀ a, le a a
  /-- Transitivity. -/
  le_trans : ∀ a b c, le a b → le b c → le a c
  /-- Antisymmetry. -/
  le_antisymm : ∀ a b, le a b → le b a → a = b
  /-- The Heyting adjunction. -/
  adj : ∀ a b c, le (meet b a) c ↔ le b (imp a c)

/-- **The valuation fiber as a Heyting algebra** — every field proven concretely on the
truth order. This *is* the carrier `A = H_t` of the corpus's bigraded diamond, built
directly. -/
def fiberHeyting : FiberHeyting Valuation where
  le := fLeT
  meet := fMeetT
  imp := fImpT
  top := fTop
  bot := fBot
  le_refl := fLeT_refl
  le_trans := fLeT_trans
  le_antisymm := fLeT_antisymm
  adj := fHeyting_adj

/-! ## 4. The two concrete nuclei — saturating σ and transferring Δ

Each nucleus is a pointwise truth-closure toward a fixed pole. We document:

* **σ (saturating, past-facing)** raises toward the **active** pole `tTop`
  (`σ v = fun φ => joinT tTop (v φ)`): the past saturates evidence-for.
* **Δ (transferring, future-facing)** raises toward the **absurd** pole `kTop`
  (`Δ v = fun φ => joinT kTop (v φ)`): the future transfers held information back.

Both are instances of one schema `nucleusToward s`. We prove each is
truth-inflationary, idempotent, `fMeetT`-preserving, and that any two commute. -/

/-- The pointwise truth-closure toward a fixed charge pole `s`. -/
def nucleusToward (s : Infomaterial.Charge) (v : Valuation) : Valuation :=
  fun φ => Infomaterial.Charge.joinT s (v φ)

/-- **σ — the saturating nucleus** (past-facing), raising toward the active pole. -/
def sigma (v : Valuation) : Valuation := nucleusToward Infomaterial.Charge.tTop v

/-- **Δ — the transferring nucleus** (future-facing), raising toward the absurd pole. -/
def delta (v : Valuation) : Valuation := nucleusToward Infomaterial.Charge.kTop v

/-- `nucleusToward s` is **truth-inflationary**: `fLeT v (nucleusToward s v)`. -/
theorem nucleusToward_infl (s : Infomaterial.Charge) (v : Valuation) :
    fLeT v (nucleusToward s v) := by
  funext φ; exact Charge.joinT_infl s (v φ)

/-- `nucleusToward s` is **idempotent**. -/
theorem nucleusToward_idem (s : Infomaterial.Charge) (v : Valuation) :
    nucleusToward s (nucleusToward s v) = nucleusToward s v := by
  funext φ; exact Charge.joinT_clo_idem s (v φ)

/-- `nucleusToward s` **preserves the fiber meet**. -/
theorem nucleusToward_meet (s : Infomaterial.Charge) (v w : Valuation) :
    nucleusToward s (fMeetT v w) = fMeetT (nucleusToward s v) (nucleusToward s w) := by
  funext φ; exact Charge.joinT_meetT s (v φ) (w φ)

/-- **Any two `nucleusToward` closures commute** on the fiber. -/
theorem nucleusToward_comm (s d : Infomaterial.Charge) (v : Valuation) :
    nucleusToward s (nucleusToward d v) = nucleusToward d (nucleusToward s v) := by
  funext φ; exact Charge.joinT_clo_comm s d (v φ)

/-- **σ and Δ commute** on the fiber — the `commutating` coherence 2-cell, concretely. -/
theorem sigma_delta_comm (v : Valuation) : sigma (delta v) = delta (sigma v) :=
  nucleusToward_comm Infomaterial.Charge.tTop Infomaterial.Charge.kTop v

/-! ## 5. The nuclear quartet — concrete `FiberNuclearSquare`

We package two commuting nuclei into our own `FiberNuclearSquare` (infl/idem/meet/comm
fields, all proven), instantiate it with σ,Δ, then build the composite `π := j₁∘j₂`,
prove it a nucleus, prove `fix_pi_iff`, and index the four corner operators by
`Articulating.Corner`, exhaustively. -/

/-- A **concrete nuclear square** on `Valuation`: two endo-maps `j₁ j₂` each a truth
nucleus (inflationary, idempotent, fiber-meet-preserving), commuting. Our own bundle;
*not* `Infomaterial.Order.NucleusAndCommutingNuclei`. -/
structure FiberNuclearSquare where
  /-- The first (e.g. saturating) nucleus. -/
  j1 : Valuation → Valuation
  /-- The second (e.g. transferring) nucleus. -/
  j2 : Valuation → Valuation
  /-- `j₁` truth-inflationary. -/
  j1_infl : ∀ v, fLeT v (j1 v)
  /-- `j₁` idempotent. -/
  j1_idem : ∀ v, j1 (j1 v) = j1 v
  /-- `j₁` fiber-meet-preserving. -/
  j1_meet : ∀ v w, j1 (fMeetT v w) = fMeetT (j1 v) (j1 w)
  /-- `j₂` truth-inflationary. -/
  j2_infl : ∀ v, fLeT v (j2 v)
  /-- `j₂` idempotent. -/
  j2_idem : ∀ v, j2 (j2 v) = j2 v
  /-- `j₂` fiber-meet-preserving. -/
  j2_meet : ∀ v w, j2 (fMeetT v w) = fMeetT (j2 v) (j2 w)
  /-- The two nuclei commute. -/
  comm : ∀ v, j1 (j2 v) = j2 (j1 v)

/-- **The settling nuclear square** `(A, σ, Δ)` on the fiber, all fields proven. -/
def settlingSquare : FiberNuclearSquare where
  j1 := sigma
  j2 := delta
  j1_infl := nucleusToward_infl Infomaterial.Charge.tTop
  j1_idem := nucleusToward_idem Infomaterial.Charge.tTop
  j1_meet := nucleusToward_meet Infomaterial.Charge.tTop
  j2_infl := nucleusToward_infl Infomaterial.Charge.kTop
  j2_idem := nucleusToward_idem Infomaterial.Charge.kTop
  j2_meet := nucleusToward_meet Infomaterial.Charge.kTop
  comm := sigma_delta_comm

namespace FiberNuclearSquare

/-- The **composite nucleus** `π := j₁ ∘ j₂`. -/
def pi (S : FiberNuclearSquare) (v : Valuation) : Valuation := S.j1 (S.j2 v)

/-- `π` is **truth-inflationary**: `v ≤ₜ j₂ v ≤ₜ j₁ (j₂ v) = π v`. -/
theorem pi_infl (S : FiberNuclearSquare) (v : Valuation) : fLeT v (S.pi v) :=
  fLeT_trans v (S.j2 v) (S.pi v) (S.j2_infl v) (S.j1_infl (S.j2 v))

/-- `π` is **idempotent**. The commuting/idempotence/meet laws give:
`π(π v) = j₁ j₂ j₁ j₂ v = j₁ j₁ j₂ j₂ v = j₁ j₂ v = π v`. -/
theorem pi_idem (S : FiberNuclearSquare) (v : Valuation) : S.pi (S.pi v) = S.pi v := by
  show S.j1 (S.j2 (S.j1 (S.j2 v))) = S.j1 (S.j2 v)
  -- swap inner j₂∘j₁ to j₁∘j₂ using comm (at argument `S.j2 v`)
  rw [← S.comm (S.j2 v)]
  -- now: j₁ (j₁ (j₂ (j₂ v))) = j₁ (j₂ v)
  rw [S.j1_idem (S.j2 (S.j2 v)), S.j2_idem v]

/-- `π` **preserves the fiber meet**. -/
theorem pi_meet (S : FiberNuclearSquare) (v w : Valuation) :
    S.pi (fMeetT v w) = fMeetT (S.pi v) (S.pi w) := by
  show S.j1 (S.j2 (fMeetT v w)) = fMeetT (S.j1 (S.j2 v)) (S.j1 (S.j2 w))
  rw [S.j2_meet v w, S.j1_meet (S.j2 v) (S.j2 w)]

/-- **`fix_pi_iff`**: `v` is `π`-fixed iff it is fixed by *both* nuclei.
The forward direction uses commutativity and idempotence; the reverse is immediate. -/
theorem fix_pi_iff (S : FiberNuclearSquare) (v : Valuation) :
    S.pi v = v ↔ (S.j1 v = v ∧ S.j2 v = v) := by
  constructor
  · intro h
    -- h : π v = j₁ (j₂ v) = v.
    have hpi : S.j1 (S.j2 v) = v := h
    -- j₂ v = j₂ (j₁ (j₂ v))    [rewrite v by hpi backwards]
    --      = j₁ (j₂ (j₂ v))    [comm]
    --      = j₁ (j₂ v) = v      [j₂ idem, hpi]
    have hj2 : S.j2 v = v := by
      have e1 : S.j2 v = S.j2 (S.j1 (S.j2 v)) := by rw [hpi]
      -- ← comm: j₂(j₁(j₂ v)) → j₁(j₂(j₂ v)); idem j₂; then hpi
      rw [← S.comm (S.j2 v), S.j2_idem v, hpi] at e1
      exact e1
    have hj1 : S.j1 v = v := by
      -- j₁ v = j₁ (j₂ v)  [hj2 backwards] = v  [hpi]
      calc S.j1 v = S.j1 (S.j2 v) := by rw [hj2]
        _ = v := hpi
    exact ⟨hj1, hj2⟩
  · intro ⟨h1, h2⟩
    show S.j1 (S.j2 v) = v
    rw [h2, h1]

/-! ### The four corner operators indexed by `Articulating.Corner` -/

/-- The corner operator: `{potential ↦ id, active ↦ j₁, stable ↦ j₂, absurd ↦ π}`.
Reuses `Articulating.Corner` (= `Charge`): the four-corner shape the spine meets everywhere, here as
*sub-algebras under closure* (apply neither / j₁ alone / j₂ alone / both). -/
def cornerOp (S : FiberNuclearSquare) : Articulating.Corner → (Valuation → Valuation)
  | Articulating.Corner.potential => id
  | Articulating.Corner.active    => S.j1
  | Articulating.Corner.stable    => S.j2
  | Articulating.Corner.absurd    => S.pi

/-- **The corners are exhaustive**: every corner operator is one of `{id, j₁, j₂, π}`,
and there are exactly four corners (`Articulating.Corner.card_eq_four`). -/
theorem cornerOp_exhaustive (S : FiberNuclearSquare) (c : Articulating.Corner) :
    S.cornerOp c = id ∨ S.cornerOp c = S.j1 ∨ S.cornerOp c = S.j2 ∨ S.cornerOp c = S.pi := by
  cases c
  · exact Or.inl rfl
  · exact Or.inr (Or.inl rfl)
  · exact Or.inr (Or.inr (Or.inr rfl))
  · exact Or.inr (Or.inr (Or.inl rfl))

/-- There are exactly four corner operators — the quartet's cardinality, from
`Articulating.Corner.card_eq_four`. -/
theorem corners_card_eq_four : Articulating.Corner.all.length = 4 := Articulating.Corner.card_eq_four

end FiberNuclearSquare

/-! ## 6. The concrete fiber truth nuclear quartet

A proof-carrying bundle of the four quartet facts on OUR fiber:
σ,Δ commute; π is a nucleus (infl/idem/meet); `fix_pi_iff`; corners exhaustive. -/

/-- A proof-carrying **fiber nuclear quartet** record. -/
structure FiberTruthQuartet where
  /-- σ and Δ commute on the fiber. -/
  comm : ∀ v, sigma (delta v) = delta (sigma v)
  /-- π = σ∘Δ is truth-inflationary. -/
  pi_infl : ∀ v, fLeT v (settlingSquare.pi v)
  /-- π is idempotent. -/
  pi_idem : ∀ v, settlingSquare.pi (settlingSquare.pi v) = settlingSquare.pi v
  /-- π preserves the fiber meet. -/
  pi_meet : ∀ v w, settlingSquare.pi (fMeetT v w)
      = fMeetT (settlingSquare.pi v) (settlingSquare.pi w)
  /-- A valuation is π-fixed iff fixed by both σ and Δ. -/
  fix_pi_iff : ∀ v, settlingSquare.pi v = v ↔ (sigma v = v ∧ delta v = v)
  /-- The four corner operators are exhaustive. -/
  corners : ∀ c : Articulating.Corner,
      settlingSquare.cornerOp c = id ∨ settlingSquare.cornerOp c = sigma
        ∨ settlingSquare.cornerOp c = delta ∨ settlingSquare.cornerOp c = settlingSquare.pi
  /-- There are exactly four corners. -/
  card : Articulating.Corner.all.length = 4

/-- **The concrete settling nuclear quartet on the truth-order valuation fiber.**
All four corpus facts, proven directly on `Valuation = PredicationCell → Charge`. -/
def fiber_truth_nuclear_quartet : FiberTruthQuartet where
  comm := sigma_delta_comm
  pi_infl := settlingSquare.pi_infl
  pi_idem := settlingSquare.pi_idem
  pi_meet := settlingSquare.pi_meet
  fix_pi_iff := settlingSquare.fix_pi_iff
  corners := settlingSquare.cornerOp_exhaustive
  card := FiberNuclearSquare.corners_card_eq_four

/-! ## 7. The cross-order finding

A *truth*-closure is **not** a *knowledge* nucleus: it is not even
knowledge-inflationary. We define the pointwise **knowledge** order `fLeK` (via the
knowledge meet `fMeetK`) and exhibit a valuation `v` and a truth-closure of it that
*fails* `fLeK`. This is why the two bilattice orders form the bigraded diamond's
**bigrading** (two separate Heyting structures), not two nuclei in one square. -/

/-- The fiber **knowledge** order: `v ≤ₖ w` iff `fMeetK v w = v` (pointwise knowledge
meet). -/
def fLeK (v w : Valuation) : Prop := fMeetK v w = v

/-- **The finding.** There is a valuation `v` whose truth-closure toward `kBot`
(`fun φ => joinT kBot (v φ)`) is **not** knowledge-above `v` — a truth-closure fails to
be a knowledge nucleus, since it is not knowledge-inflationary. Witnessed by the
all-`kTop` valuation and the sharp charge fact `meetK kTop (joinT kBot kTop) ≠ kTop`.

This is the structural reason the knowledge and truth orders cannot co-inhabit one
Heyting algebra as the two commuting nuclei `σ, Δ`: the quartet's nuclei both live in
the *truth* order, and the knowledge order is the orthogonal **grade** of the bigraded
diamond, not a second nucleus on the same algebra. -/
theorem cross_order_not_knowledge_nucleus :
    ∃ v : Valuation, ¬ fLeK v (fun φ => Infomaterial.Charge.joinT Infomaterial.Charge.kBot (v φ)) := by
  refine ⟨fun _ => Infomaterial.Charge.kTop, ?_⟩
  intro h
  -- fLeK says fMeetK v (clo v) = v, i.e. pointwise meetK kTop (joinT kBot kTop) = kTop
  have hφ : Infomaterial.Charge.meetK Infomaterial.Charge.kTop
      (Infomaterial.Charge.joinT Infomaterial.Charge.kBot Infomaterial.Charge.kTop)
      = Infomaterial.Charge.kTop := congrFun h Inhabited.default
  exact Charge.not_knowledge_infl_witness hφ

end Positing.FiberAlgebra
end Infomaterial
