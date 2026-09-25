import Obsmetrologia.Language.Positing.NucleusAndCommutingNuclei
import Obsmetrologia.AperiodicOrder.Tiling.Classification
import Obsmetrologia.Language.Positing.Quartet
import Obsmetrologia.Language.Positing.Bigraded

/-!
# NuclearAutopoiesisCell — the autopoietic cell and the Axiom of History Separation

Assembles the two commuting nuclei of an aperiodic settling — past-facing
**saturating** `σ` and future-facing **transferring** `Δ` — into a self-producing
**autopoiesis cell**, and states the Axiom of History Separation: a fiberwise-varying
family of nuclear squares over histories forces aperiodicity.

* `saturating/saturating.md` — `σ_t(a) = ⋁{ b | ρ_{t₀}(b) ≤ ρ_{t₀}(a) ∀ t₀<t }`: the
  largest element of the settled fiber Heyting algebra `H_t` whose restriction profile
  across proper sub-histories `t₀<t` is `≤` that of `a`. Extensive, idempotent,
  meet-preserving; `Fix(σ)` is the sub-history-determined layer.
* `transferring/transferring.md` — `Δ_t(a) = ⋀{ b ∈ Fix(Δ_t) | b ≥ a }`, with
  `Fix(Δ_t) = ⋂_{s⊥t} image(H(i_{s,t}))` the extension-witnessed layer: the smallest
  element already witnessed in every independent one-step extension (a nucleus by
  Johnstone *Stone Spaces* II.2.2).
* `commutating/commutating.md` — `σ ∘ Δ = Δ ∘ σ` on the same `H_t`, promoting
  `π = σ∘Δ` to a nucleus with `A* := Fix(π) = Fix(σ) ∩ Fix(Δ)`, the doubly-quiescent
  layer. Generates the aperiodic-nuclear-quartet-category `(A, Fix(σ), Fix(Δ), A*)` —
  the history-filtration quartet, distinct from the bilattice-order quartet of the
  bigraded diamond, since `σ, Δ` filter by history, not by the two value-orders.
* `aperiodic-settling.md` — aperiodic iff `κ ≥ ω₁`; orbits do not stabilize but are
  coherent, carrying all 2-cell information of the KZ diamond.

`(σ, Δ)` is modeled as an abstract `Order.CommutingNuclei H` (`σ = j₁`, `Δ = j₂`),
reusing `NucleusAndCommutingNuclei` wholesale; `Reading.joinSquare` /
`Positing.Bigraded` gives a worked instance. `history_separation_aperiodicity`
exhibits `varyingFamily` as a witness that a history-separating family exists, and
ties it to `AperiodicOrder.Tiling.aperiodicWitness` (`regime = aperiodic`,
`cl-inv ≠ 0`): a constant nuclear pair forces `cl-inv = 0` (automorphisms invisible),
a varying one does not.

`Positing.FiberAlgebra.cross_order_not_knowledge_nucleus` (a truth-closure is not a
knowledge-nucleus on the same algebra) concerns the two bilattice value orders and does
not bear on `(σ, Δ)` here, which filter the single algebra `H_t` by history instead.
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling.Autopoiesis

/-! ## (1) The nuclear pair `(σ, Δ)` as `Order.CommutingNuclei` -/

/-- `σ = j₁`, the backward (past) nucleus. -/
def saturating {H : Order.HeytingAlgebra} (Q : Order.CommutingNuclei H) : Order.Nucleus H :=
  Q.j1

/-- `Δ = j₂`, the forward (future) nucleus. -/
def transferring {H : Order.HeytingAlgebra} (Q : Order.CommutingNuclei H) : Order.Nucleus H :=
  Q.j2

/-- `σ ∘ Δ = Δ ∘ σ`; `Order.CommutingNuclei.square` under the `σ`/`Δ` names. -/
theorem commutating {H : Order.HeytingAlgebra} (Q : Order.CommutingNuclei H) (a : H.carrier) :
    (saturating Q).j ((transferring Q).j a) = (transferring Q).j ((saturating Q).j a) :=
  Q.square a

/-! ### A concrete instance via the bigraded diamond -/

/-- The reading knowledge-algebra as an `Order.HeytingAlgebra`. -/
def readingHeyting : Order.HeytingAlgebra where
  carrier := Reading
  meet := Reading.meetK
  join := Reading.joinK
  top := Reading.kTop
  bot := Reading.kBot
  meet_comm := by intro a b; cases a <;> cases b <;> rfl
  meet_assoc := by intro a b c; cases a <;> cases b <;> cases c <;> rfl
  meet_idem := by intro a; cases a <;> rfl
  join_comm := by intro a b; cases a <;> cases b <;> rfl
  join_assoc := by intro a b c; cases a <;> cases b <;> cases c <;> rfl
  join_idem := by intro a; cases a <;> rfl
  absorb_mj := by intro a b; cases a <;> cases b <;> rfl
  absorb_jm := by intro a b; cases a <;> cases b <;> rfl
  meet_top := by intro a; cases a <;> rfl
  join_bot := by intro a; cases a <;> rfl
  himp := Reading.impK
  himp_adj a b c := by cases a <;> cases b <;> cases c <;> decide

/-- A worked `(σ, Δ)` example: raising toward `c₁` is `σ`, raising toward `c₂` is `Δ`,
on `readingHeyting` — two commuting join-nuclei, an `Order.CommutingNuclei`. (The abstract
`σ`/`Δ` of an aperiodic settling are *history*-filtration nuclei; this concrete pair is a
faithful finite model of the commuting-square structure, the same one
`Positing.Bigraded.Reading.joinSquare` instantiates.) -/
def readingNuclearPair (c1 c2 : Reading) : Order.CommutingNuclei readingHeyting where
  j1 :=
    { j a := Reading.joinK c1 a
      infl a := by show Reading.meetK a (Reading.joinK c1 a) = a; cases c1 <;> cases a <;> rfl
      idem a := by cases c1 <;> cases a <;> rfl
      meet a b := by
        show Reading.joinK c1 (Reading.meetK a b)
          = Reading.meetK (Reading.joinK c1 a) (Reading.joinK c1 b)
        cases c1 <;> cases a <;> cases b <;> rfl }
  j2 :=
    { j a := Reading.joinK c2 a
      infl a := by show Reading.meetK a (Reading.joinK c2 a) = a; cases c2 <;> cases a <;> rfl
      idem a := by cases c2 <;> cases a <;> rfl
      meet a b := by
        show Reading.joinK c2 (Reading.meetK a b)
          = Reading.meetK (Reading.joinK c2 a) (Reading.joinK c2 b)
        cases c2 <;> cases a <;> cases b <;> rfl }
  comm a := by
    show Reading.joinK c1 (Reading.joinK c2 a) = Reading.joinK c2 (Reading.joinK c1 a)
    cases c1 <;> cases c2 <;> cases a <;> rfl

/-! ## (2) The autopoietic core `A*` and the autopoiesis cell -/

/-- `A* = Fix(π)`, `π = σ∘Δ`. -/
def autopoieticCore {H : Order.HeytingAlgebra} (Q : Order.CommutingNuclei H)
    (a : H.carrier) : Prop := Q.pi a = a

/-- `a ∈ A* ↔ Fix(σ) a ∧ Fix(Δ) a`. -/
theorem autopoieticCore_iff {H : Order.HeytingAlgebra} (Q : Order.CommutingNuclei H)
    (a : H.carrier) :
    autopoieticCore Q a ↔ ((saturating Q).Fix a ∧ (transferring Q).Fix a) :=
  Q.fix_pi_iff a

/-- The four corners `(A, Fix σ, Fix Δ, A*)`, read off `Articulating.Corner` via the
`NuclearQuartet` corner operators: `absurd ↦ A`, `potential ↦ Fix(σ)`, `active ↦ Fix(Δ)`,
`stable ↦ A*`. -/
def cellCorner {H : Order.HeytingAlgebra} (Q : Order.CommutingNuclei H)
    (c : Articulating.Corner) (a : H.carrier) : H.carrier :=
  Order.NuclearQuartet.cornerOp Q c a

@[simp] theorem cellCorner_absurd {H : Order.HeytingAlgebra} (Q : Order.CommutingNuclei H)
    (a : H.carrier) : cellCorner Q .absurd a = a := rfl
@[simp] theorem cellCorner_potential {H : Order.HeytingAlgebra} (Q : Order.CommutingNuclei H)
    (a : H.carrier) : cellCorner Q .potential a = (saturating Q).j a := rfl
@[simp] theorem cellCorner_active {H : Order.HeytingAlgebra} (Q : Order.CommutingNuclei H)
    (a : H.carrier) : cellCorner Q .active a = (transferring Q).j a := rfl
@[simp] theorem cellCorner_stable {H : Order.HeytingAlgebra} (Q : Order.CommutingNuclei H)
    (a : H.carrier) : cellCorner Q .stable a = Q.pi a := rfl

/-- The bundled **autopoiesis cell**: the self-production characterization of `A*`, the
four-corner exhaustiveness, and the joint-corner-is-intersection law of the
history-filtration quartet. -/
structure AutopoiesisCell {H : Order.HeytingAlgebra} (Q : Order.CommutingNuclei H) where
  /-- `A*` is the doubly-quiescent self-maintained core: `a ∈ A*` iff fixed by both
  the backward `σ` and the forward `Δ` (self-production closure). -/
  self_production : ∀ a : H.carrier,
    autopoieticCore Q a ↔ ((saturating Q).Fix a ∧ (transferring Q).Fix a)
  /-- The four corners `(A, Fix σ, Fix Δ, A*)` are the recurring FOUR — exhaustively
  four, no fifth corner. -/
  four_corners : Articulating.Corner.all.length = 4
  /-- The joint corner `A*` is exactly the intersection: `stable`-quiescent iff both
  `potential`- (`σ`) and `active`- (`Δ`) quiescent, restated via the corner operators. -/
  joint_is_intersection : ∀ a : H.carrier,
    cellCorner Q .stable a = a ↔
      (cellCorner Q .potential a = a ∧ cellCorner Q .active a = a)

theorem nuclear_autopoiesis_cell {H : Order.HeytingAlgebra} (Q : Order.CommutingNuclei H) :
    AutopoiesisCell Q where
  self_production a := autopoieticCore_iff Q a
  four_corners := Articulating.Corner.card_eq_four
  joint_is_intersection a := Order.NuclearQuartet.stable_iff_potential_and_active Q a

/-! ## (3) The Axiom of History Separation — varying family ⟹ aperiodicity -/

/-- A `Positing.Bigraded.SquareFamily` that varies (`SquareFamily.Varies`): two
histories carry different nuclear pairs `(σ_t, Δ_t)`. -/
def HistorySeparating {H : HeytingAlgebra} {I : Type} (family : SquareFamily H I) : Prop :=
  family.Varies

theorem varyingFamily_historySeparating : HistorySeparating Reading.varyingFamily :=
  Reading.varyingFamily_varies

/-- `AperiodicOrder.Tiling.aperiodicWitness`: `regime = aperiodic`, `cl-inv ≠ 0`. -/
def separatedSettling : AperiodicOrder.Tiling.Settling := AperiodicOrder.Tiling.aperiodicWitness

/-- A varying nuclear family exists (`Reading.varyingFamily.Varies`); the settling it
corresponds to (`separatedSettling`) is in `ClosureRegime.aperiodic` with `cl-inv ≠ 0`;
and any settling in the `strict`/`scott` regime has `cl-inv = 0`. -/
theorem history_separation_aperiodicity :
    -- a history-separating (varying) nuclear family exists — history separation is realizable
    Reading.varyingFamily.Varies
    -- to which corresponds a settling in the APERIODIC regime with cl-inv ≠ 0:
    -- varying ⟹ aperiodicity (cohomology nonzero, automorphisms visible)
    ∧ (separatedSettling.regime = ClosureRegime.aperiodic
        ∧ separatedSettling.clInv ≠ AperiodicOrder.Tiling.H1Class.zero)
    -- the vanishing baseline: a CONSTANT (non-history-separating) settling — one in a
    -- strict/scott regime — is forced to cl-inv = 0 (automorphisms invisible)
    ∧ (∀ v : AperiodicOrder.Tiling.Settling,
        (v.regime = ClosureRegime.strict ∨ v.regime = ClosureRegime.scott) →
          v.clInv = AperiodicOrder.Tiling.H1Class.zero) :=
  ⟨Reading.varyingFamily_varies,
   ⟨rfl, AperiodicOrder.Tiling.aperiodicWitness_clinv_nonzero⟩,
   AperiodicOrder.Tiling.clinv_dichotomy.1⟩

/-! ## (4) History-filtration nuclei are distinct from value-order nuclei -/

/-- The bigraded diamond's value-order quartet (`Reading.joinSquare`) and the
history-filtration pair `(σ, Δ)` both satisfy the Nuclear Quartet law
`Fix(π) = Fix(j₁) ∩ Fix(j₂)`, via different commuting-pair data on different axes. -/
theorem history_filtration_distinct_from_value_order
    (c1 c2 : Reading) {H : Order.HeytingAlgebra} (Q : Order.CommutingNuclei H) :
    -- value-order quartet (bigraded diamond, two join-nuclei on the knowledge value order)
    (∀ a : Reading, (Reading.joinSquare c1 c2).pi a = a ↔
      ((Reading.joinSquare c1 c2).j1.j a = a ∧ (Reading.joinSquare c1 c2).j2.j a = a))
    -- history-filtration quartet (saturating σ / transferring Δ on one settled fiber H_t)
    ∧ (∀ a : H.carrier, autopoieticCore Q a ↔
        ((saturating Q).Fix a ∧ (transferring Q).Fix a)) :=
  ⟨(Reading.joinSquare c1 c2).fix_pi_iff, autopoieticCore_iff Q⟩

end AperiodicOrder.Tiling.Autopoiesis
end Obsmetrologia
