import Mathlib.Order.Heyting.Basic
import RelationalHyperverse.Soundness
import RelationalHyperverse.Proposition

-- Establishes: syntactic-relational-universe

/-!
# SyntacticRelationalUniverse: the Lindenbaum–Tarski fiber algebra of Proposition₀

Corresponds to `math/syntactic-relational-universe.md §syntactic-fibers`.

`H_syn V` is the syntactic fiber algebra: Proposition₀ terms over variables `V` quotiented
by semantic equivalence (equal denotations in every Heyting algebra with BiNucleus).

The nucleus operations σ = [Saturate] and Δ = [Transfer] make `H_syn V` a BiNucleus. All
BiNucleus axioms follow directly from `Soundness.lean` (R1–R7). The Lattice instance
is constructed via a pointwise semantic ordering; all laws are routine consequences of
the corresponding HA laws in the target.

## Main definitions
- `Proposition.synEquiv`        : M ~ N iff equal denotations in all BiNuclei
- `Proposition.synSetoid`       : induced Setoid on `Proposition V`
- `H_syn V`             : `Quotient (Proposition.synSetoid V)` — the Lindenbaum–Tarski algebra
- `H_syn.satFun`        : [M] ↦ [Saturate M]
- `H_syn.ktrFun`        : [M] ↦ [Transfer M]
- `H_syn.instBiNucleus` : BiNucleus on `H_syn V`

## Main results (all sorry-free)
- `satFun` / `ktrFun` well-definedness
- Lattice instance on `H_syn V` (≤ = semantic pointwise ≤, ⊓ = [conj], ⊔ = [disj])
- `synSat.extensive`   : from `bn.σ.extensive`
- `synSat.monotone`    : from `bn.σ.monotone`
- `synSat.idempotent`  : from `sound_saturate_idempotent` (R1)
- `synSat.meet_pres`   : from `sound_saturate_conj` (R3)
- `synKtr.*`           : symmetric (R2, R4)
- `instBiNucleus.commute` : from `sound_saturate_ktr_comm` (R7)

## Open items
- `HeytingAlgebra (H_syn V)` : OPEN — himp = [impl]; all HA laws hold semantically.
  Proof pattern: same as Lattice laws below. Needed for StableEnvelope results.
- `RelationalUniverse` structure : OPEN — presheaf + sheaf condition.
-/

namespace Proposition

universe u

-- ── §1: Semantic equivalence ──────────────────────────────────────────────────

/-- Semantic equivalence: M ~ N when they denote equal elements in every BiNucleus. -/
def synEquiv {V : Type u} (M N : Proposition V) : Prop :=
  ∀ {H : Type u} [HeytingAlgebra H] (bn : BiNucleus H) (ρ : V → H),
    interp bn ρ M = interp bn ρ N

/-- `synEquiv` is an equivalence relation. -/
def synSetoid (V : Type u) : Setoid (Proposition V) where
  r     := synEquiv
  iseqv := {
    refl  := fun _M {_H} [HeytingAlgebra _H] _bn _ρ => rfl
    symm  := fun {_M _N} h {_H} [HeytingAlgebra _H] bn ρ => (h bn ρ).symm
    trans := fun {_M _N _P} h1 h2 {_H} [HeytingAlgebra _H] bn ρ =>
               (h1 bn ρ).trans (h2 bn ρ)
  }

end Proposition

/-- The syntactic Lindenbaum–Tarski algebra of Proposition₀.
    Proposition₀ terms over `V`, quotiented by semantic equivalence. -/
def H_syn (V : Type u) : Type u := Quotient (Proposition.synSetoid V)

namespace H_syn

variable {V : Type u}

private abbrev mk (M : Proposition V) : H_syn V := Quotient.mk (Proposition.synSetoid V) M

-- ── §2: Semantic ordering and operations ──────────────────────────────────────

/-- The pointwise semantic order: [M] ≤ [N] iff interp M ≤ interp N in every BiNucleus. -/
private def synLE : H_syn V → H_syn V → Prop :=
  Quotient.lift₂
    (fun M N => ∀ {H : Type u} [HeytingAlgebra H] (bn : BiNucleus H) (ρ : V → H),
                  Proposition.interp bn ρ M ≤ Proposition.interp bn ρ N)
    (fun _M1 _N1 _M2 _N2 hM hN => propext ⟨
      fun h {_H} [HeytingAlgebra _H] bn ρ => (hM bn ρ) ▸ (hN bn ρ) ▸ h bn ρ,
      fun h {_H} [HeytingAlgebra _H] bn ρ => (hM bn ρ).symm ▸ (hN bn ρ).symm ▸ h bn ρ⟩)

-- Reduction lemma: simplify synLE at representors.
private theorem synLE_mk (M N : Proposition V) :
    synLE (mk M) (mk N) ↔
      ∀ {H : Type u} [HeytingAlgebra H] (bn : BiNucleus H) (ρ : V → H),
        Proposition.interp bn ρ M ≤ Proposition.interp bn ρ N :=
  ⟨id, id⟩

/-- Meet: [M] ⊓ [N] = [conj M N]. -/
private def infFun : H_syn V → H_syn V → H_syn V :=
  Quotient.lift₂ (fun M N => mk (Proposition.conj M N))
    (fun _M1 _N1 _M2 _N2 hM hN => Quotient.sound
      (show Proposition.synEquiv (Proposition.conj _M1 _N1) (Proposition.conj _M2 _N2) from
       fun {_H} [HeytingAlgebra _H] bn ρ => by
         simp only [Proposition.interp]; rw [hM bn ρ, hN bn ρ]))

-- Reduction lemma for infFun.
private theorem infFun_mk (M N : Proposition V) : infFun (mk M) (mk N) = mk (Proposition.conj M N) := rfl

/-- Join: [M] ⊔ [N] = [disj M N]. -/
private def supFun : H_syn V → H_syn V → H_syn V :=
  Quotient.lift₂ (fun M N => mk (Proposition.disj M N))
    (fun _M1 _N1 _M2 _N2 hM hN => Quotient.sound
      (show Proposition.synEquiv (Proposition.disj _M1 _N1) (Proposition.disj _M2 _N2) from
       fun {_H} [HeytingAlgebra _H] bn ρ => by
         simp only [Proposition.interp]; rw [hM bn ρ, hN bn ρ]))

private theorem supFun_mk (M N : Proposition V) : supFun (mk M) (mk N) = mk (Proposition.disj M N) := rfl

-- ── §3: σ and Δ actions ───────────────────────────────────────────────────────

/-- σ-action: [M] ↦ [Saturate M]. -/
def satFun : H_syn V → H_syn V :=
  Quotient.lift (fun M => mk (Proposition.Saturate M))
    (fun M N h => Quotient.sound
      (show Proposition.synEquiv (Proposition.Saturate M) (Proposition.Saturate N) from
       fun {_H} [HeytingAlgebra _H] bn ρ => by simp only [Proposition.interp]; rw [h bn ρ]))

private theorem satFun_mk (M : Proposition V) : satFun (mk M) = mk (Proposition.Saturate M) := rfl

/-- Δ-action: [M] ↦ [Transfer M]. -/
def ktrFun : H_syn V → H_syn V :=
  Quotient.lift (fun M => mk (Proposition.Transfer M))
    (fun M N h => Quotient.sound
      (show Proposition.synEquiv (Proposition.Transfer M) (Proposition.Transfer N) from
       fun {_H} [HeytingAlgebra _H] bn ρ => by simp only [Proposition.interp]; rw [h bn ρ]))

private theorem ktrFun_mk (M : Proposition V) : ktrFun (mk M) = mk (Proposition.Transfer M) := rfl

/-- Heyting implication: [M] ⇨ [N] = [impl M N]. -/
private def himpFun : H_syn V → H_syn V → H_syn V :=
  Quotient.lift₂ (fun M N => mk (Proposition.impl M N))
    (fun _M1 _N1 _M2 _N2 hM hN => Quotient.sound
      (show Proposition.synEquiv (Proposition.impl _M1 _N1) (Proposition.impl _M2 _N2) from
       fun {_H} [HeytingAlgebra _H] bn ρ => by simp only [Proposition.interp]; rw [hM bn ρ, hN bn ρ]))

private theorem himpFun_mk (M N : Proposition V) : himpFun (mk M) (mk N) = mk (Proposition.impl M N) := rfl

-- ── §4: HeytingAlgebra instance ───────────────────────────────────────────────

/-- The HeytingAlgebra on `H_syn V`.
    Single consolidated instance: Lattice + OrderTop + OrderBot + himp + compl.
    All operations are the concrete quotient lifts; all laws follow semantically.
    (A standalone Lattice instance is omitted to avoid instance diamonds.) -/
noncomputable instance instHeytingAlgebra : HeytingAlgebra (H_syn V) where
  le          := synLE
  le_refl     := by
    intro a; induction a using Quotient.inductionOn with | h M => ?_
    exact (synLE_mk M M).mpr (fun bn ρ => le_refl _)
  le_trans    := by
    intro a b c hab hbc
    induction a using Quotient.inductionOn with | h M => ?_
    induction b using Quotient.inductionOn with | h N => ?_
    induction c using Quotient.inductionOn with | h P => ?_
    exact (synLE_mk M P).mpr (fun bn ρ =>
      le_trans ((synLE_mk M N).mp hab bn ρ) ((synLE_mk N P).mp hbc bn ρ))
  le_antisymm := by
    intro a b hab hba
    induction a using Quotient.inductionOn with | h M => ?_
    induction b using Quotient.inductionOn with | h N => ?_
    exact Quotient.sound (fun {_H} [HeytingAlgebra _H] bn ρ =>
      le_antisymm ((synLE_mk M N).mp hab bn ρ) ((synLE_mk N M).mp hba bn ρ))
  inf         := infFun
  inf_le_left := by
    intro a b
    induction a using Quotient.inductionOn with | h M => ?_
    induction b using Quotient.inductionOn with | h N => ?_
    rw [infFun_mk]; exact (synLE_mk (Proposition.conj M N) M).mpr
      (fun bn ρ => by simp only [Proposition.interp]; exact inf_le_left)
  inf_le_right := by
    intro a b
    induction a using Quotient.inductionOn with | h M => ?_
    induction b using Quotient.inductionOn with | h N => ?_
    rw [infFun_mk]; exact (synLE_mk (Proposition.conj M N) N).mpr
      (fun bn ρ => by simp only [Proposition.interp]; exact inf_le_right)
  le_inf := by
    intro c a b hca hcb
    induction a using Quotient.inductionOn with | h M => ?_
    induction b using Quotient.inductionOn with | h N => ?_
    induction c using Quotient.inductionOn with | h P => ?_
    rw [infFun_mk]; exact (synLE_mk P (Proposition.conj M N)).mpr
      (fun bn ρ => by
        simp only [Proposition.interp]
        exact le_inf ((synLE_mk P M).mp hca bn ρ) ((synLE_mk P N).mp hcb bn ρ))
  sup         := supFun
  le_sup_left := by
    intro a b
    induction a using Quotient.inductionOn with | h M => ?_
    induction b using Quotient.inductionOn with | h N => ?_
    rw [supFun_mk]; exact (synLE_mk M (Proposition.disj M N)).mpr
      (fun bn ρ => by simp only [Proposition.interp]; exact le_sup_left)
  le_sup_right := by
    intro a b
    induction a using Quotient.inductionOn with | h M => ?_
    induction b using Quotient.inductionOn with | h N => ?_
    rw [supFun_mk]; exact (synLE_mk N (Proposition.disj M N)).mpr
      (fun bn ρ => by simp only [Proposition.interp]; exact le_sup_right)
  sup_le := by
    intro a b c hac hbc
    induction a using Quotient.inductionOn with | h M => ?_
    induction b using Quotient.inductionOn with | h N => ?_
    induction c using Quotient.inductionOn with | h P => ?_
    rw [supFun_mk]; exact (synLE_mk (Proposition.disj M N) P).mpr
      (fun bn ρ => by
        simp only [Proposition.interp]
        exact sup_le ((synLE_mk M P).mp hac bn ρ) ((synLE_mk N P).mp hbc bn ρ))
  -- HeytingAlgebra fields:
  top     := mk Proposition.top
  le_top  := by
    intro a; induction a using Quotient.inductionOn with | h M => ?_
    exact (synLE_mk M Proposition.top).mpr
      (fun {_H} [HeytingAlgebra _H] _bn _ρ => by simp only [Proposition.interp]; exact le_top)
  himp    := himpFun
  le_himp_iff := by
    intro a b c
    induction a using Quotient.inductionOn with | h M => ?_
    induction b using Quotient.inductionOn with | h N => ?_
    induction c using Quotient.inductionOn with | h P => ?_
    change synLE (mk M) (himpFun (mk N) (mk P)) ↔ synLE (infFun (mk M) (mk N)) (mk P)
    rw [himpFun_mk, infFun_mk]
    simp only [synLE_mk, Proposition.interp]
    exact ⟨fun h {_H} [HeytingAlgebra _H] bn ρ => le_himp_iff.mp (h bn ρ),
           fun h {_H} [HeytingAlgebra _H] bn ρ => le_himp_iff.mpr (h bn ρ)⟩
  bot     := mk Proposition.bot
  bot_le  := by
    intro a; induction a using Quotient.inductionOn with | h M => ?_
    exact (synLE_mk Proposition.bot M).mpr
      (fun {_H} [HeytingAlgebra _H] _bn _ρ => by simp only [Proposition.interp]; exact bot_le)
  compl a := himpFun a (mk Proposition.bot)
  himp_bot := fun _ => rfl

-- ── §5: The σ and Δ nuclei ────────────────────────────────────────────────────

/-- σ nucleus on `H_syn V`. All axioms sorry-free. -/
private noncomputable def synSat : Nucleus (H_syn V) where
  toFun     := satFun
  monotone  := by
    intro a b hab
    induction a using Quotient.inductionOn with | h M => ?_
    induction b using Quotient.inductionOn with | h N => ?_
    rw [satFun_mk, satFun_mk]
    exact (synLE_mk (Proposition.Saturate M) (Proposition.Saturate N)).mpr (fun bn ρ => by
      simp only [Proposition.interp]
      exact bn.σ.monotone ((synLE_mk M N).mp hab bn ρ))
  extensive := by
    intro a
    induction a using Quotient.inductionOn with | h M => ?_
    rw [satFun_mk]
    exact (synLE_mk M (Proposition.Saturate M)).mpr (fun bn ρ => by
      simp only [Proposition.interp]; exact bn.σ.extensive _)
  idempotent := by
    intro a
    induction a using Quotient.inductionOn with | h M => ?_
    rw [satFun_mk, satFun_mk]
    exact Quotient.sound
      (fun {_H} [HeytingAlgebra _H] bn ρ => Proposition.sound_saturate_idempotent bn ρ M)
  meet_pres := by
    intro a b
    induction a using Quotient.inductionOn with | h M => ?_
    induction b using Quotient.inductionOn with | h N => ?_
    -- LHS: satFun (a ⊓ b) = satFun (infFun (mk M) (mk N)) = satFun (mk (conj M N))
    --    = mk (Saturate (conj M N))
    -- RHS: satFun (mk M) ⊓ satFun (mk N) = infFun (mk (Saturate M)) (mk (Saturate N))
    --    = mk (conj (Saturate M) (Saturate N))
    -- Equal by sound_saturate_conj (R3). ✓
    change satFun (infFun (mk M) (mk N)) = infFun (satFun (mk M)) (satFun (mk N))
    rw [infFun_mk, satFun_mk, satFun_mk, satFun_mk, infFun_mk]
    exact Quotient.sound
      (fun {_H} [HeytingAlgebra _H] bn ρ => Proposition.sound_saturate_conj bn ρ M N)

/-- Δ nucleus on `H_syn V`. All axioms sorry-free. -/
private noncomputable def synKtr : Nucleus (H_syn V) where
  toFun     := ktrFun
  monotone  := by
    intro a b hab
    induction a using Quotient.inductionOn with | h M => ?_
    induction b using Quotient.inductionOn with | h N => ?_
    rw [ktrFun_mk, ktrFun_mk]
    exact (synLE_mk (Proposition.Transfer M) (Proposition.Transfer N)).mpr (fun bn ρ => by
      simp only [Proposition.interp]
      exact bn.Δ.monotone ((synLE_mk M N).mp hab bn ρ))
  extensive := by
    intro a
    induction a using Quotient.inductionOn with | h M => ?_
    rw [ktrFun_mk]
    exact (synLE_mk M (Proposition.Transfer M)).mpr (fun bn ρ => by
      simp only [Proposition.interp]; exact bn.Δ.extensive _)
  idempotent := by
    intro a
    induction a using Quotient.inductionOn with | h M => ?_
    rw [ktrFun_mk, ktrFun_mk]
    exact Quotient.sound
      (fun {_H} [HeytingAlgebra _H] bn ρ => Proposition.sound_transfer_idempotent bn ρ M)
  meet_pres := by
    intro a b
    induction a using Quotient.inductionOn with | h M => ?_
    induction b using Quotient.inductionOn with | h N => ?_
    change ktrFun (infFun (mk M) (mk N)) = infFun (ktrFun (mk M)) (ktrFun (mk N))
    rw [infFun_mk, ktrFun_mk, ktrFun_mk, ktrFun_mk, infFun_mk]
    exact Quotient.sound
      (fun {_H} [HeytingAlgebra _H] bn ρ => Proposition.sound_transfer_conj bn ρ M N)

-- ── §6: The BiNucleus ─────────────────────────────────────────────────────────

/-- The canonical BiNucleus on `H_syn V`: σ = [Saturate], Δ = [Transfer], commute from R7. -/
noncomputable instance instBiNucleus : BiNucleus (H_syn V) where
  σ       := synSat
  Δ       := synKtr
  commute := by
    intro a
    induction a using Quotient.inductionOn with | h M => ?_
    -- [Saturate (Transfer M)] = [Transfer (Saturate M)] by R7 (sound_saturate_ktr_comm). ✓
    change satFun (ktrFun (mk M)) = ktrFun (satFun (mk M))
    rw [ktrFun_mk, satFun_mk, satFun_mk, ktrFun_mk]
    exact Quotient.sound
      (fun {_H} [HeytingAlgebra _H] bn ρ => Proposition.sound_saturate_ktr_comm bn ρ M)

-- ── §7: Universal evaluation morphism (fiber-level initiality) ────────────────

/-- The universal evaluation map `H_syn V → H`.
    Given any BiNucleus `(H, bn)` and valuation `ρ : V → H`, this is the
    unique HA + BiNucleus morphism extending ρ. -/
def eval {H : Type u} [HeytingAlgebra H] (bn : BiNucleus H) (ρ : V → H) : H_syn V → H :=
  Quotient.lift (Proposition.interp bn ρ) (fun _M _N h => h bn ρ)

@[simp] theorem eval_mk {H : Type u} [HeytingAlgebra H]
    (bn : BiNucleus H) (ρ : V → H) (M : Proposition V) :
    eval bn ρ (mk M) = Proposition.interp bn ρ M := rfl

-- In the consolidated instHeytingAlgebra, ⊤ = mk Proposition.top, ⊥ = mk Proposition.bot,
-- ⊓ = infFun, ⊔ = supFun, ⇨ = himpFun — all by kernel reduction.

theorem eval_top {H : Type u} [HeytingAlgebra H] (bn : BiNucleus H) (ρ : V → H) :
    eval bn ρ ⊤ = ⊤ := by
  change eval bn ρ (mk Proposition.top) = ⊤; simp [Proposition.interp]

theorem eval_bot {H : Type u} [HeytingAlgebra H] (bn : BiNucleus H) (ρ : V → H) :
    eval bn ρ ⊥ = ⊥ := by
  change eval bn ρ (mk Proposition.bot) = ⊥; simp [Proposition.interp]

theorem eval_inf {H : Type u} [HeytingAlgebra H] (bn : BiNucleus H) (ρ : V → H)
    (a b : H_syn V) :
    eval bn ρ (a ⊓ b) = eval bn ρ a ⊓ eval bn ρ b := by
  induction a using Quotient.inductionOn with | h M => ?_
  induction b using Quotient.inductionOn with | h N => ?_
  change eval bn ρ (mk (Proposition.conj M N)) = eval bn ρ (mk M) ⊓ eval bn ρ (mk N)
  simp [Proposition.interp]

theorem eval_sup {H : Type u} [HeytingAlgebra H] (bn : BiNucleus H) (ρ : V → H)
    (a b : H_syn V) :
    eval bn ρ (a ⊔ b) = eval bn ρ a ⊔ eval bn ρ b := by
  induction a using Quotient.inductionOn with | h M => ?_
  induction b using Quotient.inductionOn with | h N => ?_
  change eval bn ρ (mk (Proposition.disj M N)) = eval bn ρ (mk M) ⊔ eval bn ρ (mk N)
  simp [Proposition.interp]

theorem eval_himp {H : Type u} [HeytingAlgebra H] (bn : BiNucleus H) (ρ : V → H)
    (a b : H_syn V) :
    eval bn ρ (a ⇨ b) = eval bn ρ a ⇨ eval bn ρ b := by
  induction a using Quotient.inductionOn with | h M => ?_
  induction b using Quotient.inductionOn with | h N => ?_
  change eval bn ρ (mk (Proposition.impl M N)) = eval bn ρ (mk M) ⇨ eval bn ρ (mk N)
  simp [Proposition.interp]

theorem eval_sat {H : Type u} [HeytingAlgebra H] (bn : BiNucleus H) (ρ : V → H)
    (a : H_syn V) :
    eval bn ρ (satFun a) = bn.σ.toFun (eval bn ρ a) := by
  induction a using Quotient.inductionOn with | h M => ?_
  simp only [satFun_mk, eval_mk, Proposition.interp]

theorem eval_ktr {H : Type u} [HeytingAlgebra H] (bn : BiNucleus H) (ρ : V → H)
    (a : H_syn V) :
    eval bn ρ (ktrFun a) = bn.Δ.toFun (eval bn ρ a) := by
  induction a using Quotient.inductionOn with | h M => ?_
  simp only [ktrFun_mk, eval_mk, Proposition.interp]

/-- Fiber-level initiality: eval is the UNIQUE map `H_syn V → H` that is
    an HA + BiNucleus morphism extending ρ.
    Proof: structural induction on Proposition terms; each case is forced by the morphism laws. -/
theorem eval_unique {H : Type u} [HeytingAlgebra H] (bn : BiNucleus H) (ρ : V → H)
    (f : H_syn V → H)
    (hvar  : ∀ x, f (mk (Proposition.var x)) = ρ x)
    (htop  : f ⊤ = ⊤)
    (hbot  : f ⊥ = ⊥)
    (hinf  : ∀ a b, f (a ⊓ b) = f a ⊓ f b)
    (hsup  : ∀ a b, f (a ⊔ b) = f a ⊔ f b)
    (hhimp : ∀ a b, f (a ⇨ b) = f a ⇨ f b)
    (hsat  : ∀ a, f (satFun a) = bn.σ.toFun (f a))
    (hktr  : ∀ a, f (ktrFun a) = bn.Δ.toFun (f a)) :
    ∀ a, f a = eval bn ρ a := by
  suffices h : ∀ M : Proposition V, f (mk M) = Proposition.interp bn ρ M from
    fun a => Quotient.inductionOn a (fun M => (h M).trans (eval_mk bn ρ M).symm)
  intro M
  induction M with
  | var x  => exact hvar x
  | top    =>
    -- f ⊤ = f (mk Proposition.top) = ⊤ = Proposition.interp bn ρ Proposition.top
    have := htop; change f (mk Proposition.top) = _ at this; simpa [Proposition.interp] using this
  | bot    =>
    have := hbot; change f (mk Proposition.bot) = _ at this; simpa [Proposition.interp] using this
  | conj M N ihM ihN =>
    -- hinf at (mk M ⊓ mk N) = mk (conj M N) by kernel reduction
    have h := hinf (mk M) (mk N); change f (mk (Proposition.conj M N)) = _ at h
    simp only [Proposition.interp, ← ihM, ← ihN] at h ⊢; exact h
  | disj M N ihM ihN =>
    have h := hsup (mk M) (mk N); change f (mk (Proposition.disj M N)) = _ at h
    simp only [Proposition.interp, ← ihM, ← ihN] at h ⊢; exact h
  | impl M N ihM ihN =>
    have h := hhimp (mk M) (mk N); change f (mk (Proposition.impl M N)) = _ at h
    simp only [Proposition.interp, ← ihM, ← ihN] at h ⊢; exact h
  | Saturate M ihM =>
    have h := hsat (mk M); change f (mk (Proposition.Saturate M)) = _ at h
    simp only [Proposition.interp, ← ihM] at h ⊢; exact h
  | Transfer M ihM =>
    have h := hktr (mk M); change f (mk (Proposition.Transfer M)) = _ at h
    simp only [Proposition.interp, ← ihM] at h ⊢; exact h

-- OPEN: RelationalUniverse structure.
-- T = HistoryMonoid, FiberCarrier = fun _ => H_syn V (constant presheaf),
-- fiberAlg = fun _ => instBiNucleus, restrict = fun _ => id.
-- Sheaf condition and full initiality deferred to math/initiality.md.

end H_syn
