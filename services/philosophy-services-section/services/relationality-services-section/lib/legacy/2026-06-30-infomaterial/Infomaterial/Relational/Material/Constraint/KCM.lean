import Infomaterial.Calculus.Order.SetNumberGraphTheory

/-!
# Kinetically constrained models: deterministic facilitation closure

A **kinetically constrained model** (KCM) of glassy dynamics has a trivial equilibrium but
*constrained* transitions: a site may change only when a facilitation constraint from its neighbours
is met. Stripping the stochastic rates to their deterministic monotone skeleton leaves a **facilitation
closure**: from a seed of active sites, a site becomes (and stays) active once an active site
facilitates it. That skeleton is exactly the 1-place analogue of the Boolean transitive-closure step
`Spacetime.Causal.Order.causalStep` — over the same `Discrete.Graph` machinery — with the facilitation graph
in place of the causal links.

`activateStep sites fac a x = a x ∨ ∃ y ∈ sites. a y ∧ fac y x`. It is inflationary and monotone (a
closure step), and any seed-extending, facilitation-closed Boolean field is a fixed point — so the
deterministic activation reaches precisely the **facilitation closure** of the seed (`ActiveClosure`),
the dynamic-facilitation reachable set. The stochastic KCM (Fredrickson–Andersen, East) and its glassy
relaxation need probability and are out of this dependency-free core; the deterministic facilitation
skeleton is in it.

## Main definitions
* `activateStep` — the deterministic facilitation step; `ActiveClosure` — facilitation reachability.

## Main results
* `activateStep_infl`, `activateStep_mono` — the step is inflationary and monotone (a closure step).
* `activateStep_fixed` — a seed-extending, facilitation-closed field is a fixed point.
* `activation_is_facilitation_closure` — the activation settling is the facilitation closure of the seed.

## References
Corpus glass line; the glass frontier memo (kinetically constrained models, dynamic facilitation —
the analytic theory; here the deterministic projection). Mirrors `Spacetime.Causal.Order.causalStep`.

## Tags
glass, kinetically constrained model, facilitation, closure, reachability
-/

namespace Infomaterial
namespace Relational.Material.Glass

open Infomaterial.Discrete

/-- The **deterministic facilitation step**: a site `x` is active after the step if it was already
active, or some listed site `y` is active and facilitates `x` (`fac y x`). The 1-place analogue of the
Boolean transitive-closure step `causalStep`, with the `∃ y` realized as a `List.any`. -/
def activateStep {V : Type} (sites : List V) (fac : Graph V) (a : V → Bool) : V → Bool :=
  fun x => a x || sites.any (fun y => a y && fac y x)

/-- **Inflationary.** An already-active site stays active — the activation field only grows. -/
theorem activateStep_infl {V : Type} (sites : List V) (fac : Graph V) (a : V → Bool)
    (x : V) (hx : a x = true) : activateStep sites fac a x = true := by
  unfold activateStep; rw [hx]; rfl

/-- **Monotone.** If `a` is below `b` (every `a`-active site is `b`-active), the step preserves the
order — more initial activity yields more activity after a step. -/
theorem activateStep_mono {V : Type} (sites : List V) (fac : Graph V) {a b : V → Bool}
    (hab : ∀ x, a x = true → b x = true) :
    ∀ x, activateStep sites fac a x = true → activateStep sites fac b x = true := by
  intro x hx
  unfold activateStep at hx ⊢
  rw [Bool.or_eq_true] at hx ⊢
  cases hx with
  | inl h => exact Or.inl (hab x h)
  | inr h =>
      rw [List.any_eq_true] at h
      obtain ⟨y, hymem, hy⟩ := h
      rw [Bool.and_eq_true] at hy
      refine Or.inr ?_
      rw [List.any_eq_true]
      exact ⟨y, hymem, by rw [Bool.and_eq_true]; exact ⟨hab y hy.1, hy.2⟩⟩

/-- **A facilitation-closed, seed-extending field is a fixed point.** If `r` is closed under
facilitation from listed sites (`y ∈ sites`, `r y`, `fac y x` ⟹ `r x`), then `activateStep` leaves it
unchanged: once the facilitation closure is reached, the step adds nothing. The 1-place analogue of
`causalStep_fixed`. -/
theorem activateStep_fixed {V : Type} (sites : List V) (fac : Graph V) (r : V → Bool)
    (hclosed : ∀ y x, y ∈ sites → r y = true → fac y x = true → r x = true) :
    activateStep sites fac r = r := by
  funext x
  unfold activateStep
  cases hr : r x
  · cases hany : sites.any (fun y => r y && fac y x)
    · rfl
    · rw [List.any_eq_true] at hany
      obtain ⟨y, hymem, hy⟩ := hany
      rw [Bool.and_eq_true] at hy
      have := hclosed y x hymem hy.1 hy.2
      rw [hr] at this; exact absurd this (by intro h; exact Bool.noConfusion h)
  · rw [Bool.true_or]

/-- **Facilitation reachability** as an inductive: a site is in the closure of `seed` if it is
seed-active, or it is facilitated by a site already in the closure. The deterministic
dynamic-facilitation reachable set — the *value* of the activation settling. -/
inductive ActiveClosure {V : Type} (sites : List V) (fac : Graph V) (seed : V → Bool) : V → Prop
  | seed {x : V} : seed x = true → ActiveClosure sites fac seed x
  | step {y x : V} : ActiveClosure sites fac seed y → fac y x = true → ActiveClosure sites fac seed x

/-- **The activation settling is the facilitation closure of the seed.** The deterministic KCM
activation:

* **(seed)** contains every seed-active site (`ActiveClosure.seed`);
* **(facilitation-closed)** is closed under facilitation (`ActiveClosure.step`);
* **(fixed point)** so any seed-extending, facilitation-closed Boolean field is `activateStep`-fixed
  (`activateStep_fixed`) — `ActiveClosure` is the least such, i.e. the facilitation closure.

The 1-place analogue of `causal_settling_is_transitive_closure`. -/
theorem activation_is_facilitation_closure {V : Type} (sites : List V) (fac : Graph V)
    (seed : V → Bool) :
    (∀ x, seed x = true → ActiveClosure sites fac seed x)
    ∧ (∀ y x, ActiveClosure sites fac seed y → fac y x = true → ActiveClosure sites fac seed x)
    ∧ (∀ (r : V → Bool),
        (∀ y x, y ∈ sites → r y = true → fac y x = true → r x = true) →
        activateStep sites fac r = r) :=
  ⟨fun _ h => ActiveClosure.seed h,
   fun _ _ hy hf => ActiveClosure.step hy hf,
   fun r hclosed => activateStep_fixed sites fac r hclosed⟩

end Relational.Material.Glass
end Infomaterial
