import Obsmetrologia.ReactionNetworks.Network
import Obsmetrologia.ReactionNetworks.SupportProjection

/-! # Reachability — settling-as-reachability for the linear regime

In the monotone closure, the "output of the soup" is a *least fixed point*. In the
linear (counting) regime it is a **reachability predicate**: which states the soup can
become by firing reactions, each spending its inputs. This is the vector-addition-system
reading the routing memo names.

The reflexive–transitive closure `Reach` of `Step` is the settled-reachability relation.
Mass is a reachability invariant (`reach_conserves_mass`), and every step's support sits
below the monotone Datalog step (`step_support_le_datalog`) — so the Datalog closure of
§`SupportProjection` is a sound over-approximation of what can ever appear.

## Main definitions

* `Reach` — reflexive–transitive closure of `Step`.
* `Coverable` — a target multiset is coverable from `s` if some reachable state dominates
  it (the tractable projection of full reachability).

## Main results

* `reach_refl`, `reach_trans`, `reach_one` — `Reach` is the rtc of `Step`.
* `reach_conserves_mass` — total count is invariant along reachability (balanced network).
* `step_support_le_datalog` — one step's support is below a Datalog step.
* `reach_imp_coverable` — reaching a state covers every target it dominates.

## Tags

reaction network, reachability, vector addition system, coverability, settling
-/

namespace Obsmetrologia
namespace ReactionNetworks

variable {Species : Type}

/-- **Reachability**: the reflexive–transitive closure of one-step firing. `Reach N s s'`
means the soup can evolve from `s` to `s'` by a finite sequence of enabled reactions. -/
inductive Reach (N : Network Species) : State Species → State Species → Prop where
  /-- A state reaches itself in zero steps. -/
  | refl (s : State Species) : Reach N s s
  /-- Prepend one enabled firing to a reachability witness. -/
  | head {s s' s'' : State Species} : Step N s s' → Reach N s' s'' → Reach N s s''

/-- A single step is a reachability. -/
theorem reach_one {N : Network Species} {s s' : State Species} (h : Step N s s') :
    Reach N s s' := Reach.head h (Reach.refl s')

/-- **Transitivity** of reachability — concatenation of firing sequences. -/
theorem reach_trans {N : Network Species} {s s' s'' : State Species}
    (h1 : Reach N s s') (h2 : Reach N s' s'') : Reach N s s'' := by
  induction h1 with
  | refl _ => exact h2
  | head hstep _ ih => exact Reach.head hstep (ih h2)

/-- **Mass is a reachability invariant.** If every reaction is mass-balanced, the total
particle count is the same at every reachable state — conservation lifts from one step
(`step_conserves_mass`) along the whole trajectory. -/
theorem reach_conserves_mass {N : Network Species}
    (hbal : ∀ r ∈ N.reactions, Balanced N.univ r) {s s' : State Species}
    (h : Reach N s s') : total N.univ s' = total N.univ s := by
  induction h with
  | refl _ => rfl
  | head hstep _ ih => rw [ih, step_conserves_mass N hbal hstep]

/-- **The Datalog closure over-approximates one reaction step.** Whatever a single step
produces, its support sits below the monotone Datalog step of the reaction that fired —
the §`SupportProjection` containment, lifted to network `Step`. -/
theorem step_support_le_datalog {N : Network Species} {s s' : State Species}
    (h : Step N s s') :
    ∃ r ∈ N.reactions, ble (supp s') (datalogStep N.univ r (supp s)) := by
  obtain ⟨r, hr, hen, rfl⟩ := h
  exact ⟨r, hr, support_fire_le_datalog N.univ r hen⟩

/-! ## Coverability — the tractable projection -/

/-- A target multiset is **coverable** from `s` when some reachable state dominates it
pointwise. Coverability is the decidable/tractable projection of full (VAS-undecidable in
general) reachability the routing memo flags as the red frontier. -/
def Coverable (N : Network Species) (s target : State Species) : Prop :=
  ∃ s', Reach N s s' ∧ ∀ x, target x ≤ s' x

/-- Reaching a state covers every target that state dominates — in particular a state
covers itself. The easy direction tying reachability to coverability. -/
theorem reach_imp_coverable {N : Network Species} {s s' target : State Species}
    (h : Reach N s s') (hdom : ∀ x, target x ≤ s' x) : Coverable N s target :=
  ⟨s', h, hdom⟩

/-- Coverability is reflexive (a state covers itself in zero steps). -/
theorem coverable_self (N : Network Species) (s : State Species) : Coverable N s s :=
  ⟨s, Reach.refl s, fun _ => Nat.le_refl _⟩

end ReactionNetworks
end Obsmetrologia
