/-!
# DiscreteVelocityCollision — the gas regime: Boltzmann collision invariants (DERIVED)

The kinetic-gas frontier (`…/obsmetrologia_gases_liquids_plasmas_proof_frontier.md`, Batch A / Red node 1)
asks for a finite discrete-velocity collision theory: the order-theoretic spine already has the
closure/fixed-point/H-theorem skeleton (`Closure.RuleSystem`, `Flow.FreeEnergyLyapunov`,
`Probability.Stochastic`), so what is missing is the **collision algebra** itself.

This module supplies the foundational structure of kinetic theory: a binary collision `(a,b) ↦ (a',b')`
over a velocity alphabet, a particle population as a **multiset of velocities**, and the **collision
invariants** — a weight `w : V → Int` that balances across a collision (`w a + w b = w a' + w b'`) has
a conserved total `Σ_v w(v)`. The three classical Boltzmann invariants are instances: number (`w = 1`),
momentum (`w = vel`), kinetic energy (`w = vel²`). Conservation holds at one collision and along an
entire collision evolution. Collisions act on the population **up to reordering** (`List.Perm`), so a
collision may fire on any two present particles — the population is a multiset.

This module proves the **conservation** (collision-invariant) side. The **H-theorem** (`S = log W`
increasing) is the companion and is *also* proved — with Bishop-real logarithms — in
`Thermodynamics.BoltzmannEntropy`. Obsmetrologia has reals (`Obsmetrologia.Real`), so real entropy is in scope, not
frontier.

## Main definitions
* `Collision`, `Collision.Conserves` — a binary collision and a weight it balances.
* `Population`, `total` — a multiset of velocities and a weighted total `Σ_v w(v)`.
* `Step`, `Evolves` — one collision (up to reordering) and the multi-collision evolution.
* `Physical` — a collision conserving momentum and kinetic energy for a velocity map `vel`.

## Main results
* `total_perm`, `step_conserves` — weighted totals are reorder-invariant and collision-invariant.
* `physical_conserves_number/_momentum/_energy` — the three Boltzmann collision invariants.
* `evolution_conserves` — invariants are preserved along an entire collision evolution.

## References
`content/.../obsmetrologia_gases_liquids_plasmas_proof_frontier.md` §3.1.1, Red node 1. The closure/H-theorem
side lives in `Closure.RuleSystem` and `Flow.FreeEnergyLyapunov`.

## Tags
kinetic theory, Boltzmann, discrete velocity, collision invariant, conservation, multiset
-/

namespace Obsmetrologia
namespace KineticTheory.Gas

/-- A binary **collision** `(inL, inR) ↦ (outL, outR)` over a velocity alphabet `V`. -/
structure Collision (V : Type) where
  inL : V
  inR : V
  outL : V
  outR : V

/-- A weight `w` is a **collision invariant** of `c` when it balances across the collision:
`w(inL) + w(inR) = w(outL) + w(outR)`. The conserved labels of kinetic theory (number, momentum,
energy) are exactly such balanced weights. -/
def Collision.Conserves {V : Type} (c : Collision V) (w : V → Int) : Prop :=
  w c.inL + w c.inR = w c.outL + w c.outR

/-- A **population**: a multiset of particle velocities, presented as a list. -/
abbrev Population (V : Type) : Type := List V

/-- The **weighted total** `Σ_v w(v)` over a population — mass for `w = 1`, momentum for `w = vel`,
kinetic energy for `w = vel²`. -/
def total {V : Type} (w : V → Int) (p : Population V) : Int := (p.map w).sum

/-- Cons law for the weighted total (definitional). -/
theorem total_cons {V : Type} (w : V → Int) (x : V) (p : Population V) :
    total w (x :: p) = w x + total w p := rfl

/-- **The weighted total is reorder-invariant.** A population is a multiset: permuting the
particle list does not change any weighted total. -/
theorem total_perm {V : Type} (w : V → Int) {p q : Population V}
    (h : List.Perm p q) : total w p = total w q := by
  induction h with
  | nil => rfl
  | cons x _ ih => rw [total_cons, total_cons, ih]
  | swap x y l => simp only [total_cons]; omega
  | trans _ _ ih1 ih2 => rw [ih1, ih2]

/-- A **collision step**: from population `p`, two present particles `inL, inR` are replaced by the
outgoing pair `outL, outR`. The `Perm` framing lets the collision fire on any two particles. -/
def Step {V : Type} (c : Collision V) (p q : Population V) : Prop :=
  ∃ rest : Population V,
    List.Perm p (c.inL :: c.inR :: rest) ∧ List.Perm q (c.outL :: c.outR :: rest)

/-- **A collision conserves every collision-invariant weight.** If `w` balances across `c`, its
weighted total is unchanged by a collision step — the master conservation law. -/
theorem step_conserves {V : Type} {c : Collision V} {w : V → Int}
    (hc : c.Conserves w) {p q : Population V} (h : Step c p q) :
    total w p = total w q := by
  obtain ⟨rest, hp, hq⟩ := h
  rw [total_perm w hp, total_perm w hq]
  unfold Collision.Conserves at hc
  simp only [total_cons]
  omega

/-! ## The three Boltzmann collision invariants -/

/-- A **physical collision** conserves momentum and kinetic energy for a velocity-value map `vel`
(number is conserved unconditionally — two particles in, two out). -/
structure Physical {V : Type} (vel : V → Int) (c : Collision V) : Prop where
  momentum : c.Conserves vel
  energy : c.Conserves (fun v => vel v * vel v)

/-- **Number is conserved.** The unit weight `1` balances trivially, so the particle count
(its total) is invariant under any collision. -/
theorem physical_conserves_number {V : Type} {c : Collision V} {p q : Population V}
    (h : Step c p q) : total (fun _ => 1) p = total (fun _ => 1) q :=
  step_conserves (by unfold Collision.Conserves; rfl) h

/-- **Momentum is conserved** by a physical collision. -/
theorem physical_conserves_momentum {V : Type} {vel : V → Int} {c : Collision V}
    (hphys : Physical vel c) {p q : Population V} (h : Step c p q) :
    total vel p = total vel q :=
  step_conserves hphys.momentum h

/-- **Kinetic energy is conserved** by a physical collision. -/
theorem physical_conserves_energy {V : Type} {vel : V → Int} {c : Collision V}
    (hphys : Physical vel c) {p q : Population V} (h : Step c p q) :
    total (fun v => vel v * vel v) p = total (fun v => vel v * vel v) q :=
  step_conserves hphys.energy h

/-! ## Conservation along a collision evolution -/

/-- A **collision evolution** under a system of collisions `cs`: the reflexive–transitive closure of
firing one system collision at a time. -/
inductive Evolves {V : Type} (cs : List (Collision V)) : Population V → Population V → Prop
  | refl (p : Population V) : Evolves cs p p
  | step {p q r : Population V} :
      (∃ c, c ∈ cs ∧ Step c p q) → Evolves cs q r → Evolves cs p r

/-- **A shared collision invariant is conserved along the whole evolution.** If every collision in the
system balances `w`, then `w`'s total is invariant under any number of collisions — the conservation
law of the kinetic dynamics, not just one collision. -/
theorem evolution_conserves {V : Type} {cs : List (Collision V)} {w : V → Int}
    (hcs : ∀ c ∈ cs, c.Conserves w) {p q : Population V} (h : Evolves cs p q) :
    total w p = total w q := by
  induction h with
  | refl _ => rfl
  | step hstep _ ih =>
      obtain ⟨c, hmem, hpq⟩ := hstep
      exact (step_conserves (hcs c hmem) hpq).trans ih

end KineticTheory.Gas
end Obsmetrologia
