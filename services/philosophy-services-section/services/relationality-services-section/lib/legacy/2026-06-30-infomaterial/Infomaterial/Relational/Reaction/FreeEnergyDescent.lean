import Infomaterial.Relational.Reaction.Network
import Infomaterial.Relational.Reaction.Reachability

/-! # Free-energy descent — the reaction-regime Lyapunov / H-theorem

The corpus proves settling is a **gradient flow of a `Nat`-valued free energy**: the
deficit strictly drops at each firing and the orbit converges in bounded steps
(`Flow.FreeEnergyLyapunov`: `free_energy_is_lyapunov`, `converges_in_bounded_steps`).
This module is that same Lyapunov phenomenon in the **reaction regime**: for a
**catabolic** network — every reaction produces strictly fewer particles than it
consumes — the *total particle count* is a `Nat`-valued Lyapunov potential. It strictly
decreases at each firing, so every firing sequence has length bounded by the initial
total and the soup terminates. This discharges the survey's "thermodynamic cost of
reaction" line in the discrete, count-only regime (no rates yet — those are
`MassActionRate`).

The carrier differs from `FreeEnergyLyapunov` (count states, not the `Charge` settling
orbit), so this is the *reaction-regime instance* of the H-theorem, proved directly, not
an import of its theorems.

## Main definitions

* `total_fire_add` — the exact additive bookkeeping of one firing.
* `Catabolic` — every reaction strictly decreases the total count.
* `ReachIn` — step-counted reachability (carries the Lyapunov bound).

## Main results

* `step_strict_decrease` — a catabolic firing strictly lowers the total (the H-theorem).
* `catabolic_descent` — `n + total s' ≤ total s` along an `n`-step trajectory.
* `catabolic_steps_bounded` — every firing sequence is no longer than the initial total.
* `terminal_of_total_zero` — an empty soup is terminal: no catabolic reaction is enabled.

## Tags

reaction network, Lyapunov, H-theorem, free energy, termination, settling
-/

namespace Infomaterial
namespace Relational.Reaction

variable {Species : Type}

/-! ## Bookkeeping helpers on the total-count functional -/

/-- A species in the roster contributes at most the total. -/
theorem le_total_of_mem (univ : List Species) (s : State Species) {x : Species}
    (hx : x ∈ univ) : s x ≤ total univ s := by
  unfold total
  induction univ with
  | nil => cases hx
  | cons a rest ih =>
    simp only [List.map_cons, List.sum_cons]
    rcases List.mem_cons.1 hx with h | h
    · subst h; omega
    · have := ih h; omega

/-- A positive total is witnessed by a present species in the roster. -/
theorem exists_pos_of_total_pos (univ : List Species) (f : State Species) :
    0 < total univ f → ∃ x ∈ univ, 0 < f x := by
  unfold total
  induction univ with
  | nil => intro h; simp at h
  | cons a rest ih =>
    intro h
    simp only [List.map_cons, List.sum_cons] at h
    rcases Nat.eq_zero_or_pos (f a) with h0 | hpos
    · rw [h0, Nat.zero_add] at h
      obtain ⟨x, hx, hfx⟩ := ih h
      exact ⟨x, List.mem_cons.2 (Or.inr hx), hfx⟩
    · exact ⟨a, List.mem_cons.2 (Or.inl rfl), hpos⟩

/-- **The firing balance identity.** For any enabled reaction,
`total(fire) + total(reactant) = total(s) + total(product)` — no truncation, since
`enabled` rules out underflow. Mass conservation is the balanced special case; strict
descent is the catabolic one. -/
theorem total_fire_add (univ : List Species) (r : Reaction Species) (s : State Species)
    (hen : enabled r s) :
    total univ (fire r s) + total univ r.reactant
      = total univ s + total univ r.product := by
  have hpt : (fun x => fire r s x + r.reactant x) = (fun x => s x + r.product x) := by
    funext x; have := hen x; simp only [fire]; omega
  have e := congrArg (total univ) hpt
  rw [total_add, total_add] at e
  exact e

/-! ## Catabolic networks and the Lyapunov descent -/

/-- A network is **catabolic** when every reaction strictly destroys mass: it produces
fewer particles than it consumes. The total count is then a Lyapunov potential. -/
def Catabolic (N : Network Species) : Prop :=
  ∀ r ∈ N.reactions, total N.univ r.product < total N.univ r.reactant

/-- **The reaction H-theorem.** A catabolic firing strictly lowers the total particle
count — the discrete free-energy drop at each reaction event. -/
theorem step_strict_decrease (N : Network Species) (hcat : Catabolic N)
    {s s' : State Species} (h : Step N s s') : total N.univ s' < total N.univ s := by
  obtain ⟨r, hr, hen, rfl⟩ := h
  have hbal := total_fire_add N.univ r s hen
  have hcatr := hcat r hr
  omega

/-- **Step-counted reachability** — reachability decorated with its length, so the
Lyapunov bound can be read off. -/
inductive ReachIn (N : Network Species) : Nat → State Species → State Species → Prop where
  /-- Zero steps. -/
  | refl (s : State Species) : ReachIn N 0 s s
  /-- One firing then `n` more. -/
  | head {n : Nat} {s s' s'' : State Species} :
      Step N s s' → ReachIn N n s' s'' → ReachIn N (n + 1) s s''

/-- **Lyapunov descent.** Along any `n`-step catabolic trajectory the total drops by at
least `n`: `n + total s' ≤ total s`. The exact analogue of the bounded free-energy
descent in `FreeEnergyLyapunov`. -/
theorem catabolic_descent (N : Network Species) (hcat : Catabolic N)
    {n : Nat} {s s' : State Species} (h : ReachIn N n s s') :
    n + total N.univ s' ≤ total N.univ s := by
  induction h with
  | refl s => simp
  | @head n s smid s'' hstep _ ih =>
    have hdec : total N.univ smid < total N.univ s := step_strict_decrease N hcat hstep
    omega

/-- **The soup terminates.** Every catabolic firing sequence has length at most the
initial total particle count — no perpetual reaction. -/
theorem catabolic_steps_bounded (N : Network Species) (hcat : Catabolic N)
    {n : Nat} {s s' : State Species} (h : ReachIn N n s s') : n ≤ total N.univ s := by
  have := catabolic_descent N hcat h; omega

/-- **The empty soup is terminal.** When the total count is zero, no catabolic reaction
is enabled: a catabolic reaction demands at least one reactant particle, which an empty
state cannot supply. The Lyapunov potential's floor is a genuine equilibrium. -/
theorem terminal_of_total_zero (N : Network Species) (hcat : Catabolic N)
    {s : State Species} (h0 : total N.univ s = 0) : ¬ ∃ s', Step N s s' := by
  rintro ⟨s', r, hr, hen, rfl⟩
  have hcatr := hcat r hr
  have hrpos : 0 < total N.univ r.reactant := by omega
  obtain ⟨x, hx, hxpos⟩ := exists_pos_of_total_pos N.univ r.reactant hrpos
  have hsx : 0 < s x := Nat.lt_of_lt_of_le hxpos (hen x)
  have hle : s x ≤ total N.univ s := le_total_of_mem N.univ s hx
  omega

end Relational.Reaction
end Infomaterial
