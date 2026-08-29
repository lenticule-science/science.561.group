/-!
# Reaction networks — the ℕ-counting (linear) regime of settling

This module formalizes the corpus reading of the 2026-06-28 mathematical-chemistry
frontier survey routed in
`dev/content/dreaming/reflecting/2026/06/28/relational_chemistry_routing_memo.md`.

A **chemical reaction network** is settling with *counted, consumable resources*.
Where the monotone closure (`Closure.RuleSystem`) lets facts only accumulate,
a reaction `A + B → C` *spends* an `A` and a `B`. That single move — non-monotone
consumption with mass conservation — is the linear regime the corpus already homes in
its Lambek/quantale projection; the monotone Datalog closure is its affine support projection
(`Reaction.SupportProjection`).

## Main definitions

* `State` — a species count vector `Species → Nat`.
* `Reaction` — a `(reactant, product)` pair of count vectors.
* `enabled` / `fire` — a reaction fires when its reactants are present, spending them.
* `Network` — a finite roster of species plus a list of reactions; `step` fires one.
* `total` — the total particle count over the species roster.

## Main results

* `mass_conserved` — a mass-balanced reaction preserves the total count.
* `fire_not_monotone` — an explicit witness that `fire` *decreases* a coordinate; this
  is the content (chemistry is non-monotone, unlike the Datalog closure).
* `catalyst_is_fixed` — a species consumed and regenerated in equal number is fixed by
  `fire`: catalysis is a fixed point of the resource map.

## References

`dev/content/researching/surveying/2026/06/28/mathematical_chemistry_frontier_memo.md`
(survey); the routing memo above (Infomaterial map). The Datalog conflation that this
module's `fire` projections lives in `Closure.RuleSystem`.

## Tags

reaction network, CRN, multiset, mass conservation, catalysis, linear regime, settling
-/

namespace Infomaterial
namespace Relational.Reaction

/-! ## States and the total-count functional -/

/-- A **state** of a reaction soup: how many copies of each species are present. -/
abbrev State (Species : Type) : Type := Species → Nat

/-- The **total particle count** over a finite species roster `univ`. The summation
witness of "mass"; conservation is a statement about this functional. -/
def total {Species : Type} (univ : List Species) (s : State Species) : Nat :=
  (univ.map s).sum

/-- Sum of a pointwise `+` of two count vectors splits over the roster. The one
list-sum fact the conservation proof needs; proved by induction, core only. -/
theorem total_add {Species : Type} (univ : List Species) (f g : State Species) :
    total univ (fun x => f x + g x) = total univ f + total univ g := by
  unfold total
  induction univ with
  | nil => rfl
  | cons a rest ih =>
    simp only [List.map_cons, List.sum_cons, ih]
    omega

/-! ## Reactions and firing -/

/-- A **reaction**: how many copies of each species it consumes (`reactant`) and
produces (`product`). A bare count-vector pair — no rates here (those are the real
`MassActionRate` regime). -/
structure Reaction (Species : Type) where
  /-- Copies of each species consumed. -/
  reactant : State Species
  /-- Copies of each species produced. -/
  product : State Species

/-- A reaction is **enabled** in a state when every reactant is present in at least the
required number — the only firing precondition. -/
def enabled {Species : Type} (r : Reaction Species) (s : State Species) : Prop :=
  ∀ x, r.reactant x ≤ s x

/-- **Firing** a reaction: spend the reactants, add the products. The truncated `Nat`
subtraction is harmless on enabled states (no underflow, by `enabled`). -/
def fire {Species : Type} (r : Reaction Species) (s : State Species) : State Species :=
  fun x => s x - r.reactant x + r.product x

/-- A reaction is **mass-balanced** over a roster when it produces as many particles as
it consumes. Conservation is a *hypothesis on the reaction*, never free data:
unbalanced reactions remain expressible and simply fail it. -/
def Balanced {Species : Type} (univ : List Species) (r : Reaction Species) : Prop :=
  total univ r.reactant = total univ r.product

/-- **Mass conservation.** A balanced reaction, fired on a state where it is enabled,
preserves the total particle count. The proof is the additive identity
`(s − rr + rp) + rr = s + rp` summed over the roster, then `Nat` cancellation. -/
theorem mass_conserved {Species : Type} (univ : List Species) (r : Reaction Species)
    (s : State Species) (hen : enabled r s) (hbal : Balanced univ r) :
    total univ (fire r s) = total univ s := by
  have key : total univ (fun x => fire r s x + r.reactant x)
           = total univ (fun x => s x + r.product x) := by
    have hpt : (fun x => fire r s x + r.reactant x) = (fun x => s x + r.product x) := by
      funext x
      have hx : r.reactant x ≤ s x := hen x
      simp only [fire]
      omega
    rw [hpt]
  rw [total_add, total_add] at key
  -- key : total (fire r s) + total r.reactant = total s + total r.product
  unfold Balanced at hbal
  omega

/-! ## The content: firing is *not* monotone

The defining difference from the monotone Datalog closure: `fire` can *lower* a count.
We exhibit it concretely on the two-species reaction `A → ∅` (decay) — the cleanest
witness that consumption is real. -/

/-- The two-species universe `Bool` (`true = A`, `false = B`), used only to host the
non-monotonicity witness. -/
private def aState (n : Nat) : State Bool := fun b => if b then n else 0

/-- The pure-decay reaction `A → ∅`: consumes one `A`, produces nothing. -/
private def decayA : Reaction Bool := ⟨fun b => if b then 1 else 0, fun _ => 0⟩

/-- **Firing is not monotone.** There is a reaction and a state on which `fire`
strictly *decreases* a coordinate — impossible for the inflationary `Tstep` of the
Datalog closure. This is the linear regime's signature. -/
theorem fire_not_monotone :
    ∃ (Species : Type) (r : Reaction Species) (s : State Species) (x : Species),
      fire r s x < s x := by
  refine ⟨Bool, decayA, aState 1, true, ?_⟩
  simp [fire, decayA, aState]

/-! ## Catalysis as a fixed point of the resource map -/

/-- A species is a **catalyst** of a reaction when the reaction consumes and produces
it in equal number: it enables the transformation while being preserved. -/
def Catalyst {Species : Type} (r : Reaction Species) (x : Species) : Prop :=
  r.reactant x = r.product x

/-- **Catalysis is a fixed point of firing.** A catalytic species' count is unchanged
by `fire`, provided the reaction is enabled (so its consumption does not underflow).
Catalysis = invariance of a species under the resource map. -/
theorem catalyst_is_fixed {Species : Type} (r : Reaction Species) (s : State Species)
    (x : Species) (hcat : Catalyst r x) (hen : r.reactant x ≤ s x) :
    fire r s x = s x := by
  simp only [fire, Catalyst] at *
  omega

/-! ## Networks and one nondeterministic step -/

/-- A **reaction network**: a finite species roster and a finite list of reactions.
The roster carries the "mass" that `total`/`mass_conserved` speak about. -/
structure Network (Species : Type) where
  /-- The finite roster of species in play. -/
  univ : List Species
  /-- The reactions of the network. -/
  reactions : List (Reaction Species)

/-- One **step** of the network: some enabled reaction fires. Nondeterministic — there
is no privileged control thread, exactly the Chemical-Abstract-Machine reading. -/
def Step {Species : Type} (N : Network Species) (s s' : State Species) : Prop :=
  ∃ r ∈ N.reactions, enabled r s ∧ s' = fire r s

/-- Every step of a network all of whose reactions are mass-balanced conserves mass. -/
theorem step_conserves_mass {Species : Type} (N : Network Species)
    (hbal : ∀ r ∈ N.reactions, Balanced N.univ r) {s s' : State Species}
    (hstep : Step N s s') : total N.univ s' = total N.univ s := by
  obtain ⟨r, hr, hen, rfl⟩ := hstep
  exact mass_conserved N.univ r s hen (hbal r hr)

end Relational.Reaction
end Infomaterial
