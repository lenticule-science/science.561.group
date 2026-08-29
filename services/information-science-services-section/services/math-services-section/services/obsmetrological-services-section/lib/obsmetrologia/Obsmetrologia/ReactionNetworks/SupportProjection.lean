import Obsmetrologia.ReactionNetworks.Network

/-! # The Datalog support projection — forgetting counts collapses a CRN to its monotone closure

The headline conflation of the relational-chemistry routing memo
(`dev/content/dreaming/reflecting/2026/06/28/relational_chemistry_routing_memo.md`):
a reaction network read on **supports** (present / absent, the `{can/can't}` lattice)
is projected to a **monotone Datalog step**, over `Bool`, comparable to the corpus's
immediate-consequence operator `Closure.RuleSystem.Tstep`.

The statement is a **containment, not an equality**. `Tstep`-style Datalog is
*inflationary*: it only ever adds. Reaction firing can *remove* a species when a
reactant is fully consumed. So:

> `supp (fire r s) ≤ datalogStep r (supp s)`   (under `enabled`)

and the **gap between the two is exactly the consumption** (`consumption_is_the_gap`).
When nothing is fully consumed (catalytic firing), the two coincide
(`support_fire_eq_datalog_of_no_consumption`). This is the linear regime (counted,
consumable) sitting above its affine support projection (monotone Datalog): forgetting *how many*
keeps only *whether*, and once you forget counts you can no longer spend them.

## Main definitions

* `supp` — the support (present/absent) reading of a count state.
* `datalogStep` — the monotone Datalog immediate-consequence step on supports.
* `ble` — the pointwise `Bool` (`{can/can't}`) order on supports.

## Main results

* `datalogStep_infl`, `datalogStep_mono` — the Datalog step is a monotone inflationary
  closure step (the two corpus closure axioms, on the support lattice).
* `support_fire_le_datalog` — the conflation: firing's support is below the Datalog step.
* `consumption_is_the_gap` — where they differ is exactly a fully-consumed reactant.
* `support_fire_eq_datalog_of_no_consumption` — equality for catalytic (no-consumption)
  firing.

## Tags

reaction network, Datalog, immediate consequence, support, linear logic, settling
-/

namespace Obsmetrologia
namespace ReactionNetworks

variable {Species : Type}

/-- The **support** of a count state: which species are present. The `{can/can't}`
(`Bool`) reading that the monotone Datalog closure operates on. -/
def supp (s : State Species) : Species → Bool := fun x => decide (0 < s x)

@[simp] theorem supp_pos {s : State Species} {x : Species} :
    supp s x = true ↔ 0 < s x := by simp [supp]

/-- Pointwise `Bool` order on supports — the `{can/can't}` knowledge order: `a ≤ b`
when everything present in `a` is present in `b`. -/
def ble (a b : Species → Bool) : Prop := ∀ x, a x = true → b x = true

theorem ble_refl (a : Species → Bool) : ble a a := fun _ h => h

theorem ble_trans {a b c : Species → Bool} (h1 : ble a b) (h2 : ble b c) : ble a c :=
  fun x h => h2 x (h1 x h)

/-- The Datalog **antecedent** of a reaction at a support `b`: every reactant species
in the roster is present. A `Bool` test, exactly like `ClosureRule.antecedent`. -/
def rAnt (univ : List Species) (r : Reaction Species) (b : Species → Bool) : Bool :=
  univ.all (fun y => !(decide (0 < r.reactant y)) || b y)

/-- The monotone **Datalog immediate-consequence step** on supports: keep everything
present, and turn on every product whose reaction's reactants are all present. This is
`Tstep` read over the `Bool` support lattice — it can only ever add. -/
def datalogStep (univ : List Species) (r : Reaction Species) (b : Species → Bool) :
    Species → Bool :=
  fun x => b x || (rAnt univ r b && decide (0 < r.product x))

/-! ## The Datalog step is a monotone inflationary closure step -/

/-- **Inflationary** — `b ≤ datalogStep b` — it joins onto `b`. Corpus closure axiom (i). -/
theorem datalogStep_infl (univ : List Species) (r : Reaction Species)
    (b : Species → Bool) : ble b (datalogStep univ r b) := by
  intro x hx; simp [datalogStep, hx]

/-- `rAnt` is monotone in the support: more present can only keep the antecedent firing. -/
theorem rAnt_mono (univ : List Species) (r : Reaction Species) {b b' : Species → Bool}
    (h : ble b b') (hb : rAnt univ r b = true) : rAnt univ r b' = true := by
  rw [rAnt, List.all_eq_true] at hb ⊢
  intro y hy
  have hyb := hb y hy
  simp only [Bool.or_eq_true] at hyb ⊢
  rcases hyb with hr | hpres
  · exact Or.inl hr
  · exact Or.inr (h y hpres)

/-- **Monotone** — the corpus closure axiom (ii) (positivity): `b ≤ b'` lifts through
the Datalog step. -/
theorem datalogStep_mono (univ : List Species) (r : Reaction Species)
    {b b' : Species → Bool} (h : ble b b') :
    ble (datalogStep univ r b) (datalogStep univ r b') := by
  intro x hx
  rw [datalogStep] at hx ⊢
  simp only [Bool.or_eq_true, Bool.and_eq_true] at hx ⊢
  rcases hx with hb | ⟨hant, hprod⟩
  · exact Or.inl (h x hb)
  · exact Or.inr ⟨rAnt_mono univ r h hant, hprod⟩

/-! ## The conflation: firing's support is below the Datalog step -/

/-- Under `enabled`, every reactant present in the roster is present in the support:
the Datalog antecedent fires. -/
theorem rAnt_of_enabled (univ : List Species) (r : Reaction Species) {s : State Species}
    (hen : enabled r s) : rAnt univ r (supp s) = true := by
  rw [rAnt, List.all_eq_true]
  intro y _
  rcases Nat.eq_zero_or_pos (r.reactant y) with h0 | hpos
  · simp [h0]
  · have : 0 < s y := Nat.lt_of_lt_of_le hpos (hen y)
    simp [supp, this]

/-- **The headline conflation.** Forgetting counts, a reaction step lands *below* the
monotone Datalog step: `supp (fire r s) ≤ datalogStep r (supp s)`. The reaction can
only ever do *less* than the inflationary Datalog closure permits — the missing part is
the consumption the support reading cannot see. -/
theorem support_fire_le_datalog (univ : List Species) (r : Reaction Species)
    {s : State Species} (hen : enabled r s) :
    ble (supp (fire r s)) (datalogStep univ r (supp s)) := by
  intro x hx
  have hpos : 0 < s x - r.reactant x + r.product x := by
    have := (supp_pos (s := fire r s) (x := x)).1 hx; simpa [fire] using this
  have hre : r.reactant x ≤ s x := hen x
  rw [datalogStep]
  simp only [Bool.or_eq_true, Bool.and_eq_true]
  rcases Nat.eq_zero_or_pos (r.product x) with hp0 | hppos
  · -- no product at x: then x was present before firing
    have : 0 < s x := by omega
    exact Or.inl ((supp_pos).2 this)
  · -- x is a product: the Datalog consequent turns it on
    exact Or.inr ⟨rAnt_of_enabled univ r hen, by simp [hppos]⟩

/-! ## The gap is exactly the consumption -/

/-- **The gap is consumption.** Wherever the monotone Datalog step is on but the actual
firing is off, the species is a fully-consumed reactant: present before, demanded in
full, and not replenished. This is precisely what the affine support projection forgets. -/
theorem consumption_is_the_gap (univ : List Species) (r : Reaction Species)
    {s : State Species} (hen : enabled r s) {x : Species}
    (hd : datalogStep univ r (supp s) x = true) (hf : supp (fire r s) x = false) :
    0 < s x ∧ s x = r.reactant x ∧ r.product x = 0 := by
  have hre : r.reactant x ≤ s x := hen x
  have hf' : s x - r.reactant x + r.product x = 0 := by
    simp only [supp, fire, decide_eq_false_iff_not, Nat.not_lt, Nat.le_zero] at hf
    exact hf
  have hprod0 : r.product x = 0 := by omega
  have hsxeq : s x = r.reactant x := by omega
  have hpf : decide (0 < r.product x) = false := by rw [hprod0]; rfl
  have hs_true : supp s x = true := by
    simp only [datalogStep, hpf, Bool.and_false, Bool.or_false] at hd
    exact hd
  exact ⟨(supp_pos).1 hs_true, hsxeq, hprod0⟩

/-- **Catalytic equality.** When the firing fully consumes nothing — every reactant
either is left with a surplus or is regenerated as a product — the support reading
*coincides* with the monotone Datalog step. Catalysis is where the linear regime and
its affine support projection agree. -/
theorem support_fire_eq_datalog_of_no_consumption (univ : List Species)
    (r : Reaction Species) {s : State Species} (hen : enabled r s)
    (hnc : ∀ x, 0 < r.reactant x → r.reactant x < s x ∨ 0 < r.product x) :
    ∀ x, supp (fire r s) x = datalogStep univ r (supp s) x := by
  intro x
  apply Bool.eq_iff_iff.2
  constructor
  · intro hx; exact support_fire_le_datalog univ r hen x hx
  · intro hx
    -- Datalog on ⟹ firing on, since nothing at x is fully consumed
    have hre : r.reactant x ≤ s x := hen x
    rw [datalogStep] at hx
    simp only [Bool.or_eq_true, Bool.and_eq_true] at hx
    rcases hx with hb | ⟨_, hprod⟩
    · -- x present before: surplus or regenerated, so still present after
      have hsx : 0 < s x := (supp_pos).1 hb
      rcases Nat.eq_zero_or_pos (r.reactant x) with h0 | hpos
      · refine (supp_pos).2 ?_; simp only [fire, h0]; omega
      · rcases hnc x hpos with hlt | hprodpos
        · refine (supp_pos).2 ?_; simp only [fire]; omega
        · refine (supp_pos).2 ?_; simp only [fire]; omega
    · -- x is a product
      have hpp : 0 < r.product x := by simpa using hprod
      refine (supp_pos).2 ?_; simp only [fire]; omega

end ReactionNetworks
end Obsmetrologia
