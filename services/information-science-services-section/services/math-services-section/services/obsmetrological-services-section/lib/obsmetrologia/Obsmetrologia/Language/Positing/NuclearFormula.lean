import Obsmetrologia.Language.Positing.NucleusAndCommutingNuclei

/-!
# NuclearFormula

Dependency-free syntax and rewrite measures for the fiber nuclear propositional
language recovered from the relational-hyperverse archive.

The syntax has Heyting connectives and two modal operators, interpreted by a
pair of commuting nuclei. The rewrite relation records the archive's oriented
root rules and congruence closure. This file proves the numeric measure lemmas
that are independent of the unported confluence argument.
-/

namespace Obsmetrologia
namespace Positing

universe u

/-- Nuclear Heyting-modal propositional formulas over variables `V`. -/
inductive NuclearFormula (V : Type u) : Type u where
  /-- A variable occurrence supplied by the ambient variable type. -/
  | var : V → NuclearFormula V
  /-- The Heyting top formula. -/
  | top : NuclearFormula V
  /-- The Heyting bottom formula. -/
  | bot : NuclearFormula V
  /-- Binary conjunction. -/
  | conj : NuclearFormula V → NuclearFormula V → NuclearFormula V
  /-- Binary disjunction. -/
  | disj : NuclearFormula V → NuclearFormula V → NuclearFormula V
  /-- Heyting implication. -/
  | impl : NuclearFormula V → NuclearFormula V → NuclearFormula V
  /-- The first nuclear modality, interpreted by the saturation nucleus. -/
  | Saturate : NuclearFormula V → NuclearFormula V
  /-- The second nuclear modality, interpreted by the transfer nucleus. -/
  | Transfer : NuclearFormula V → NuclearFormula V

namespace NuclearFormula

open Order

/-- Interpret nuclear formulas in any Heyting algebra with two commuting nuclei. -/
def interp {V : Type u} {H : Order.HeytingAlgebra}
    (Q : Order.CommutingNuclei H) (rho : V → H.carrier) : NuclearFormula V → H.carrier
  | var x => rho x
  | top => H.top
  | bot => H.bot
  | conj M N => H.meet (interp Q rho M) (interp Q rho N)
  | disj M N => H.join (interp Q rho M) (interp Q rho N)
  | impl M N => H.himp (interp Q rho M) (interp Q rho N)
  | Saturate M => Q.j1.j (interp Q rho M)
  | Transfer M => Q.j2.j (interp Q rho M)

/-- One oriented reduction step for nuclear formulas. -/
inductive Step {V : Type u} : NuclearFormula V → NuclearFormula V → Prop where
  /-- Idempotence of nested saturation. -/
  | R1 (M : NuclearFormula V) : Step (Saturate (Saturate M)) (Saturate M)
  /-- Idempotence of nested transfer. -/
  | R2 (M : NuclearFormula V) : Step (Transfer (Transfer M)) (Transfer M)
  /-- Saturation distributes across conjunction. -/
  | R3 (M N : NuclearFormula V) :
      Step (Saturate (conj M N)) (conj (Saturate M) (Saturate N))
  /-- Transfer distributes across conjunction. -/
  | R4 (M N : NuclearFormula V) :
      Step (Transfer (conj M N)) (conj (Transfer M) (Transfer N))
  /-- Saturation fixes top. -/
  | R5 : Step (Saturate top) top
  /-- Transfer fixes top. -/
  | R6 : Step (Transfer top) top
  /-- Commutation rule moving saturation inside transfer. -/
  | R7 (M : NuclearFormula V) : Step (Saturate (Transfer M)) (Transfer (Saturate M))
  /-- Absorb a saturated left disjunct under outer saturation. -/
  | R8 (M N : NuclearFormula V) :
      Step (Saturate (disj (Saturate M) N)) (Saturate (disj M N))
  /-- Absorb a saturated right disjunct under outer saturation. -/
  | R9 (M N : NuclearFormula V) :
      Step (Saturate (disj M (Saturate N))) (Saturate (disj M N))
  /-- Absorb a transferred left disjunct under outer transfer. -/
  | R10 (M N : NuclearFormula V) :
      Step (Transfer (disj (Transfer M) N)) (Transfer (disj M N))
  /-- Absorb a transferred right disjunct under outer transfer. -/
  | R11 (M N : NuclearFormula V) :
      Step (Transfer (disj M (Transfer N))) (Transfer (disj M N))
  /-- Remove an inner saturation below transfer on the left disjunct under saturation. -/
  | R12 (M N : NuclearFormula V) :
      Step (Saturate (disj (Transfer (Saturate M)) N))
        (Saturate (disj (Transfer M) N))
  /-- Remove an inner saturation below transfer on the right disjunct under saturation. -/
  | R13 (M N : NuclearFormula V) :
      Step (Saturate (disj M (Transfer (Saturate N))))
        (Saturate (disj M (Transfer N)))
  /-- Remove an inner transfer below saturation on the left disjunct under transfer. -/
  | R12s (M N : NuclearFormula V) :
      Step (Transfer (disj (Saturate (Transfer M)) N))
        (Transfer (disj (Saturate M) N))
  /-- Remove an inner transfer below saturation on the right disjunct under transfer. -/
  | R13s (M N : NuclearFormula V) :
      Step (Transfer (disj M (Saturate (Transfer N))))
        (Transfer (disj M (Saturate N)))
  /-- Absorb saturated conjuncts in a left disjunct under saturation. -/
  | R14 (M N P : NuclearFormula V) :
      Step (Saturate (disj (conj (Saturate M) (Saturate N)) P))
        (Saturate (disj (conj M N) P))
  /-- Absorb saturated conjuncts in a right disjunct under saturation. -/
  | R15 (M N P : NuclearFormula V) :
      Step (Saturate (disj P (conj (Saturate M) (Saturate N))))
        (Saturate (disj P (conj M N)))
  /-- Absorb transferred conjuncts in a left disjunct under transfer. -/
  | R16 (M N P : NuclearFormula V) :
      Step (Transfer (disj (conj (Transfer M) (Transfer N)) P))
        (Transfer (disj (conj M N) P))
  /-- Absorb transferred conjuncts in a right disjunct under transfer. -/
  | R17 (M N P : NuclearFormula V) :
      Step (Transfer (disj P (conj (Transfer M) (Transfer N))))
        (Transfer (disj P (conj M N)))
  /-- Remove inner saturation below transferred conjuncts in a left disjunct under saturation. -/
  | R18 (M N P : NuclearFormula V) :
      Step (Saturate (disj (conj (Transfer (Saturate M)) (Transfer (Saturate N))) P))
        (Saturate (disj (conj (Transfer M) (Transfer N)) P))
  /-- Remove inner saturation below transferred conjuncts in a right disjunct under saturation. -/
  | R18' (M N P : NuclearFormula V) :
      Step (Saturate (disj P (conj (Transfer (Saturate M)) (Transfer (Saturate N)))))
        (Saturate (disj P (conj (Transfer M) (Transfer N))))
  /-- Remove inner transfer below saturated conjuncts in a left disjunct under transfer. -/
  | R19 (M N P : NuclearFormula V) :
      Step (Transfer (disj (conj (Saturate (Transfer M)) (Saturate (Transfer N))) P))
        (Transfer (disj (conj (Saturate M) (Saturate N)) P))
  /-- Remove inner transfer below saturated conjuncts in a right disjunct under transfer. -/
  | R19' (M N P : NuclearFormula V) :
      Step (Transfer (disj P (conj (Saturate (Transfer M)) (Saturate (Transfer N)))))
        (Transfer (disj P (conj (Saturate M) (Saturate N))))
  /-- Remove a transferred left disjunct under nested transfer and saturation. -/
  | R20 (M N : NuclearFormula V) :
      Step (Transfer (Saturate (disj (Transfer M) N)))
        (Transfer (Saturate (disj M N)))
  /-- Remove a transferred right disjunct under nested transfer and saturation. -/
  | R21 (M N : NuclearFormula V) :
      Step (Transfer (Saturate (disj M (Transfer N))))
        (Transfer (Saturate (disj M N)))
  /-- Remove transferred conjuncts in a left disjunct under nested transfer and saturation. -/
  | R22 (M N P : NuclearFormula V) :
      Step (Transfer (Saturate (disj (conj (Transfer M) (Transfer N)) P)))
        (Transfer (Saturate (disj (conj M N) P)))
  /-- Remove transferred conjuncts in a right disjunct under nested transfer and saturation. -/
  | R23 (M N P : NuclearFormula V) :
      Step (Transfer (Saturate (disj P (conj (Transfer M) (Transfer N)))))
        (Transfer (Saturate (disj P (conj M N))))
  /-- Lift a step through saturation. -/
  | saturate_step {M N : NuclearFormula V} : Step M N → Step (Saturate M) (Saturate N)
  /-- Lift a step through transfer. -/
  | transfer_step {M N : NuclearFormula V} : Step M N → Step (Transfer M) (Transfer N)
  /-- Lift a step through the left side of a conjunction. -/
  | conj_left {M M' N : NuclearFormula V} : Step M M' → Step (conj M N) (conj M' N)
  /-- Lift a step through the right side of a conjunction. -/
  | conj_right {M N N' : NuclearFormula V} : Step N N' → Step (conj M N) (conj M N')
  /-- Lift a step through the left side of a disjunction. -/
  | disj_left {M M' N : NuclearFormula V} : Step M M' → Step (disj M N) (disj M' N)
  /-- Lift a step through the right side of a disjunction. -/
  | disj_right {M N N' : NuclearFormula V} : Step N N' → Step (disj M N) (disj M N')
  /-- Lift a step through the antecedent of an implication. -/
  | impl_left {M M' N : NuclearFormula V} : Step M M' → Step (impl M N) (impl M' N)
  /-- Lift a step through the consequent of an implication. -/
  | impl_right {M N N' : NuclearFormula V} : Step N N' → Step (impl M N) (impl M N')

/-- A formula is normal for the active step relation when it has no reduct. -/
def NormalForm {V : Type u} (M : NuclearFormula V) : Prop := ∀ N, ¬ Step M N

/-- Total number of nuclear operators. -/
def modalCount {V : Type u} : NuclearFormula V → Nat
  | var _ | top | bot => 0
  | conj M N | disj M N | impl M N => modalCount M + modalCount N
  | Saturate M | Transfer M => modalCount M + 1

/-- Number of `Transfer` operators. -/
def transferCount {V : Type u} : NuclearFormula V → Nat
  | var _ | top | bot => 0
  | conj M N | disj M N | impl M N => transferCount M + transferCount N
  | Saturate M => transferCount M
  | Transfer M => transferCount M + 1

/-- Transfer-depth weighted by ambient `Saturate` depth. -/
def entanglementAux {V : Type u} : NuclearFormula V → Nat → Nat
  | var _, _ | top, _ | bot, _ => 0
  | conj M N, sd | disj M N, sd | impl M N, sd =>
      entanglementAux M sd + entanglementAux N sd
  | Saturate M, sd => entanglementAux M (sd + 1)
  | Transfer M, sd => sd + entanglementAux M sd

/-- Saturate-inside-Transfer nesting degree. -/
def entanglement {V : Type u} (M : NuclearFormula V) : Nat := entanglementAux M 0

@[simp] theorem entanglementAux_saturate {V : Type u} (M : NuclearFormula V) (sd : Nat) :
    entanglementAux (Saturate M) sd = entanglementAux M (sd + 1) := rfl

@[simp] theorem entanglementAux_transfer {V : Type u} (M : NuclearFormula V) (sd : Nat) :
    entanglementAux (Transfer M) sd = sd + entanglementAux M sd := rfl

/-- Extra Saturate-depth adds once for each Transfer in the term. -/
theorem entanglementAux_add_sd {V : Type u} (M : NuclearFormula V) (sd k : Nat) :
    entanglementAux M (sd + k) = entanglementAux M sd + transferCount M * k := by
  induction M generalizing sd with
  | var _ | top | bot => simp [entanglementAux, transferCount]
  | conj M N ihM ihN =>
      simp only [entanglementAux, transferCount]
      rw [ihM sd, ihN sd, Nat.add_mul]
      omega
  | disj M N ihM ihN =>
      simp only [entanglementAux, transferCount]
      rw [ihM sd, ihN sd, Nat.add_mul]
      omega
  | impl M N ihM ihN =>
      simp only [entanglementAux, transferCount]
      rw [ihM sd, ihN sd, Nat.add_mul]
      omega
  | Saturate M ih =>
      simp only [entanglementAux, transferCount]
      have heq : sd + k + 1 = sd + 1 + k := by omega
      rw [heq, ih (sd + 1)]
  | Transfer M ih =>
      simp only [entanglementAux, transferCount]
      rw [ih sd, Nat.add_mul, Nat.one_mul]
      omega

/-- Incrementing Saturate-depth increases entanglement by `transferCount`. -/
theorem entanglementAux_succ_sd {V : Type u} (M : NuclearFormula V) (sd : Nat) :
    entanglementAux M (sd + 1) = entanglementAux M sd + transferCount M := by
  have h := entanglementAux_add_sd M sd 1
  simp only [Nat.mul_one] at h
  exact h

/-- R7 decreases entanglement by exactly one at every ambient Saturate-depth. -/
theorem entanglementAux_R7_root {V : Type u} (M : NuclearFormula V) (sd : Nat) :
    entanglementAux (Saturate (Transfer M)) sd =
      entanglementAux (Transfer (Saturate M)) sd + 1 := by
  simp [entanglementAux]
  omega

/-- R7 strictly decreases the entanglement component. -/
theorem entanglement_R7 {V : Type u} (M : NuclearFormula V) :
    entanglement (Transfer (Saturate M)) < entanglement (Saturate (Transfer M)) := by
  unfold entanglement
  rw [entanglementAux_R7_root]
  omega

/-- Polynomial weight for the modal rewrite system. -/
def nuclearW {V : Type u} : NuclearFormula V → Nat
  | var _ | top | bot => 1
  | conj M N | disj M N | impl M N => nuclearW M + nuclearW N + 1
  | Saturate M | Transfer M => 2 * nuclearW M

@[simp] theorem nuclearW_var {V : Type u} (x : V) : nuclearW (var x) = 1 := rfl
@[simp] theorem nuclearW_top {V : Type u} : nuclearW (top (V := V)) = 1 := rfl
@[simp] theorem nuclearW_bot {V : Type u} : nuclearW (bot (V := V)) = 1 := rfl
@[simp] theorem nuclearW_conj {V : Type u} (M N : NuclearFormula V) :
    nuclearW (conj M N) = nuclearW M + nuclearW N + 1 := rfl
@[simp] theorem nuclearW_disj {V : Type u} (M N : NuclearFormula V) :
    nuclearW (disj M N) = nuclearW M + nuclearW N + 1 := rfl
@[simp] theorem nuclearW_impl {V : Type u} (M N : NuclearFormula V) :
    nuclearW (impl M N) = nuclearW M + nuclearW N + 1 := rfl
@[simp] theorem nuclearW_sat {V : Type u} (M : NuclearFormula V) :
    nuclearW (Saturate M) = 2 * nuclearW M := rfl
@[simp] theorem nuclearW_transfer {V : Type u} (M : NuclearFormula V) :
    nuclearW (Transfer M) = 2 * nuclearW M := rfl

/-- Nuclear weight is always positive. -/
theorem nuclearW_pos {V : Type u} (M : NuclearFormula V) : 1 ≤ nuclearW M := by
  induction M with
  | var _ | top | bot => simp [nuclearW]
  | conj M N ihM ihN | disj M N ihM ihN | impl M N ihM ihN =>
      simp only [nuclearW_conj, nuclearW_disj, nuclearW_impl]
      omega
  | Saturate M ih | Transfer M ih =>
      simp only [nuclearW_sat, nuclearW_transfer]
      omega

/-- R3 strictly decreases the polynomial weight. -/
theorem nuclearW_R3_decreases {V : Type u} (M N : NuclearFormula V) :
    nuclearW (conj (Saturate M) (Saturate N)) <
      nuclearW (Saturate (conj M N)) := by
  simp [nuclearW]
  omega

/-- R4 strictly decreases the polynomial weight. -/
theorem nuclearW_R4_decreases {V : Type u} (M N : NuclearFormula V) :
    nuclearW (conj (Transfer M) (Transfer N)) <
      nuclearW (Transfer (conj M N)) := by
  simp [nuclearW]
  omega

/-- R7 preserves the polynomial weight, so entanglement is its tiebreaker. -/
theorem nuclearW_R7_preserved {V : Type u} (M : NuclearFormula V) :
    nuclearW (Transfer (Saturate M)) = nuclearW (Saturate (Transfer M)) := by
  simp [nuclearW]

/-- Idempotency soundness for the saturating modality. -/
theorem interp_R1 {V : Type u} {H : Order.HeytingAlgebra}
    (Q : Order.CommutingNuclei H) (rho : V → H.carrier) (M : NuclearFormula V) :
    interp Q rho (Saturate (Saturate M)) = interp Q rho (Saturate M) :=
  Q.j1.idem _

/-- Idempotency soundness for the transferring modality. -/
theorem interp_R2 {V : Type u} {H : Order.HeytingAlgebra}
    (Q : Order.CommutingNuclei H) (rho : V → H.carrier) (M : NuclearFormula V) :
    interp Q rho (Transfer (Transfer M)) = interp Q rho (Transfer M) :=
  Q.j2.idem _

/-- Meet-preservation soundness for saturation. -/
theorem interp_R3 {V : Type u} {H : Order.HeytingAlgebra}
    (Q : Order.CommutingNuclei H) (rho : V → H.carrier) (M N : NuclearFormula V) :
    interp Q rho (Saturate (conj M N)) =
      interp Q rho (conj (Saturate M) (Saturate N)) :=
  Q.j1.meet _ _

/-- Meet-preservation soundness for transfer. -/
theorem interp_R4 {V : Type u} {H : Order.HeytingAlgebra}
    (Q : Order.CommutingNuclei H) (rho : V → H.carrier) (M N : NuclearFormula V) :
    interp Q rho (Transfer (conj M N)) =
      interp Q rho (conj (Transfer M) (Transfer N)) :=
  Q.j2.meet _ _

/-- Commutation soundness for the two nuclear modalities. -/
theorem interp_R7 {V : Type u} {H : Order.HeytingAlgebra}
    (Q : Order.CommutingNuclei H) (rho : V → H.carrier) (M : NuclearFormula V) :
    interp Q rho (Saturate (Transfer M)) = interp Q rho (Transfer (Saturate M)) :=
  Q.comm _

end NuclearFormula
end Positing
end Obsmetrologia
