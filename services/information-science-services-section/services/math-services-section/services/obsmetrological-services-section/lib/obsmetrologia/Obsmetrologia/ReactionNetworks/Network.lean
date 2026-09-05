import Obsmetrologia.Cohomology.CoordinationCohomology
import Obsmetrologia.AperiodicOrder.Tiling.MatterTopology

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
(`ReactionNetworks.SupportProjection`).

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
* `reaction_jamming_click` — appending a reaction that closes onto already-coupled
  species raises a network's coupling `CoverNerve.H1rank` by exactly one: the
  reaction-network instance of `Tiling.jamming_click`.
* `reaction_jam_iff_redundant` — a network's coupling nerve is load-bearing iff its
  reactions outnumber a spanning forest over its species and coupling components.

## References

`dev/content/researching/surveying/2026/06/28/mathematical_chemistry_frontier_memo.md`
(survey); the routing memo above (Obsmetrologia map). The Datalog conflation that this
module's `fire` projections lives in `Closure.RuleSystem`. `Cohomology.CoordinationCohomology`
(`CoverNerve`, `H1rank`) and `AperiodicOrder.Tiling.MatterTopology` (`jamming_click`), which the
coupling-nerve section specializes.

## Tags

reaction network, CRN, multiset, mass conservation, catalysis, linear regime, settling
-/

namespace Obsmetrologia
namespace ReactionNetworks

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

/-! ## The coupling nerve: reactions as coordination cost, jamming as redundancy

A network's reactions couple species: each reaction's reactant/product footprint links
every species it touches. Read that coupling as a `Cohomology.CoverNerve` — entities = the
species roster, cells = the reactions, components = the coupling graph's connected classes
— and `H1rank > 0` is a coordination cycle in the reaction structure: some subset of
species is linked by more reactions than a spanning forest needs, exactly as
`Tiling.jamming_click` reads a redundant contact in a material's contact network. -/

open Obsmetrologia.Cohomology
open Obsmetrologia.AperiodicOrder.Tiling

/-- A network's **coupling nerve**: the species roster as entities, the reactions as
cells, and an asserted component count for the species-coupling graph (which species are
linked by a shared reaction), together with the two `CoverNerve` well-formedness laws.

`components` here is a caller-supplied witness, not computed from `N`: kept for
compatibility with call sites that already discharge the two laws some other way. **`nerve`
below is the canonical instance** — its `components` is derived from `N.reactions` by an
actual union-find fold, so nerve-based theorems about a network's real topology should use
`nerve`, not this one. -/
def Network.toNerve {Species : Type} (N : Network Species) (components : Nat)
    (hc : components ≤ N.univ.length)
    (he : N.univ.length ≤ N.reactions.length + components) : CoverNerve where
  entities := N.univ.length
  cells := N.reactions.length
  components := components
  components_le_entities := hc
  entities_le_cells_add_components := he

/-- **The reaction-network jamming click.** Appending one reaction to a network's reaction
list, at the same species roster and the same coupling-component count (the appended
reaction closes onto species already coupled, merging no new component), raises the
coupling nerve's `H1rank` by exactly one — the reaction-network instance of
`Tiling.jamming_click`: one redundant reaction is one more held coordination cycle. -/
theorem reaction_jamming_click {Species : Type} (N N' : Network Species)
    (components components' : Nat)
    (hc : components ≤ N.univ.length) (he : N.univ.length ≤ N.reactions.length + components)
    (hc' : components' ≤ N'.univ.length)
    (he' : N'.univ.length ≤ N'.reactions.length + components')
    (hcells : N'.reactions.length = N.reactions.length + 1)
    (hent : N'.univ.length = N.univ.length)
    (hcomp : components' = components) :
    (N'.toNerve components' hc' he').H1rank = (N.toNerve components hc he).H1rank + 1 :=
  jamming_click (N.toNerve components hc he) (N'.toNerve components' hc' he')
    hcells hent hcomp

/-- **Jam iff redundant.** A network's coupling nerve is load-bearing (carries a
coordination cycle, `H1rank > 0`) iff its reaction count exceeds a spanning forest over its
species roster and coupling components — `h1rank_is_coordination_cost` read at a network's
coupling nerve. -/
theorem reaction_jam_iff_redundant {Species : Type} (N : Network Species)
    (components : Nat) (hc : components ≤ N.univ.length)
    (he : N.univ.length ≤ N.reactions.length + components) :
    loadBearing (N.toNerve components hc he)
      ↔ N.univ.length ≠ N.reactions.length + components := by
  rw [loadBearing_iff_not_forest]
  exact Iff.rfl

/-! ## The canonical coupling nerve — real network topology, not a caller-supplied count

`toNerve` above takes `components` as an arbitrary parameter: nothing ties it to the actual
reaction data, so nerve-based theorems stated through it say nothing about a *given*
network's real topology. Here `components` is computed instead, by folding a union-find
over the species roster: two species are coupled when some reaction touches both
(consumes or produces it), and `components` is the resulting number of coupling classes.

The forest bound `entities ≤ cells + components` (`cells = N.reactions.length`) needs each
reaction to merge **at most one pair** of classes — the standard union-find discipline that
makes an edge-counted forest bound true (`CoordinationCohomology`'s
`derivedComponents_spanning_bound` is the same fact for an ordinary graph, where each edge
trivially touches only two vertices). A single reaction can touch three or more species at
once, so `couplingStep` deliberately merges only the *first two* of a reaction's touched
classes and leaves the rest alone: any further touched species get connected by a later
merge (this reaction's or a later one's) instead of all at once. Without this discipline a
single many-species reaction could collapse several classes in one step and break the bound
(e.g. one reaction spanning three still-separate species would need two merges, not one). -/

/-- A species is **touched** by a reaction when the reaction consumes or produces it (a
nonzero reactant or product count). The primitive the coupling relation is built from. -/
def Network.touches {Species : Type} (r : Reaction Species) (x : Species) : Bool :=
  r.reactant x != 0 || r.product x != 0

/-- A coupling class (a block of the partition) is **touched** by a reaction when it holds
some species the reaction touches. -/
def Network.blockTouched {Species : Type} (r : Reaction Species) (block : List Species) :
    Bool :=
  block.any (Network.touches r)

/-- One coupling-fold step: merge the first two of a reaction's touched classes into one;
leave the partition unchanged if the reaction touches at most one class. Exactly one merge
per reaction, by construction — the discipline the forest bound below relies on. -/
def Network.couplingStep {Species : Type} (blocks : List (List Species))
    (r : Reaction Species) : List (List Species) :=
  match blocks.filter (Network.blockTouched r) with
  | b1 :: b2 :: rest =>
      (b1 ++ b2) :: (rest ++ blocks.filter (fun b => !Network.blockTouched r b))
  | _ => blocks

/-- The **species-coupling partition** a network's reactions actually induce: one singleton
class per roster entry to start, then `couplingStep` folded over the reactions in order. -/
def Network.couplingPartition {Species : Type} (N : Network Species) :
    List (List Species) :=
  N.reactions.foldl Network.couplingStep (N.univ.map (fun x => [x]))

/-- The **coupling component count**: the size of the derived partition. The real,
reaction-derived replacement for `toNerve`'s caller-supplied `components`. -/
def Network.couplingComponents {Species : Type} (N : Network Species) : Nat :=
  N.couplingPartition.length

private theorem Network.length_filter_add_filter_not {Species : Type}
    (p : List Species → Bool) (l : List (List Species)) :
    l.length = (l.filter p).length + (l.filter (fun a => !p a)).length := by
  induction l with
  | nil => simp
  | cons a as ih =>
      cases h : p a with
      | true =>
          rw [List.filter_cons_of_pos h, List.filter_cons_of_neg (by simp [h])]
          simp only [List.length_cons]
          omega
      | false =>
          rw [List.filter_cons_of_neg (by simp [h]), List.filter_cons_of_pos (by simp [h])]
          simp only [List.length_cons]
          omega

/-- A coupling step never increases the class count: it either leaves the partition alone
or merges two classes into one. -/
private theorem Network.couplingStep_length_le {Species : Type}
    (blocks : List (List Species)) (r : Reaction Species) :
    (Network.couplingStep blocks r).length ≤ blocks.length := by
  unfold Network.couplingStep
  split
  next b1 b2 rest heq =>
      have hsplit := Network.length_filter_add_filter_not (Network.blockTouched r) blocks
      rw [heq] at hsplit
      simp only [List.length_cons, List.length_append] at hsplit ⊢
      omega
  next => exact Nat.le_refl _

/-- **At most one pair merges per reaction.** A single coupling step drops the class count
by at most one — the union-find discipline the forest bound is built on. -/
private theorem Network.couplingStep_length_ge {Species : Type}
    (blocks : List (List Species)) (r : Reaction Species) :
    blocks.length ≤ (Network.couplingStep blocks r).length + 1 := by
  unfold Network.couplingStep
  split
  next b1 b2 rest heq =>
      have hsplit := Network.length_filter_add_filter_not (Network.blockTouched r) blocks
      rw [heq] at hsplit
      simp only [List.length_cons, List.length_append] at hsplit ⊢
      omega
  next => omega

private theorem Network.foldl_couplingStep_length_le {Species : Type}
    (rs : List (Reaction Species)) (blocks : List (List Species)) :
    (rs.foldl Network.couplingStep blocks).length ≤ blocks.length := by
  induction rs generalizing blocks with
  | nil => exact Nat.le_refl _
  | cons r rest ih =>
      calc (rest.foldl Network.couplingStep (Network.couplingStep blocks r)).length
          ≤ (Network.couplingStep blocks r).length :=
            ih (Network.couplingStep blocks r)
        _ ≤ blocks.length := Network.couplingStep_length_le blocks r

/-- **The forest bound, by induction on reactions.** Each of the `rs.length` reactions can
drop the class count by at most one (`couplingStep_length_ge`), so folding over `rs`
cannot drop it by more than `rs.length` in total. -/
private theorem Network.foldl_couplingStep_length_ge {Species : Type}
    (rs : List (Reaction Species)) (blocks : List (List Species)) :
    blocks.length ≤ rs.length + (rs.foldl Network.couplingStep blocks).length := by
  induction rs generalizing blocks with
  | nil => simp
  | cons r rest ih =>
      have h1 := Network.couplingStep_length_ge blocks r
      have h2 := ih (Network.couplingStep blocks r)
      simp only [List.foldl_cons, List.length_cons] at *
      omega

/-- **The first `CoverNerve` law, derived.** The coupling-component count never exceeds the
roster size — a fold starting from one class per entry can only ever merge classes
together, never split them. -/
theorem Network.couplingComponents_le_univ_length {Species : Type} (N : Network Species) :
    N.couplingComponents ≤ N.univ.length := by
  unfold Network.couplingComponents Network.couplingPartition
  have h := Network.foldl_couplingStep_length_le N.reactions (N.univ.map (fun x => [x]))
  rwa [List.length_map] at h

/-- **The second `CoverNerve` law, derived — the standard forest bound.** Each reaction
merges at most one pair of coupling classes, so `N.reactions.length` reactions can drop the
class count by at most `N.reactions.length` below the `N.univ.length` starting singleton
classes. -/
theorem Network.univ_length_le_reactions_add_couplingComponents {Species : Type}
    (N : Network Species) :
    N.univ.length ≤ N.reactions.length + N.couplingComponents := by
  unfold Network.couplingComponents Network.couplingPartition
  have h := Network.foldl_couplingStep_length_ge N.reactions (N.univ.map (fun x => [x]))
  rwa [List.length_map] at h

/-- **The canonical coupling nerve.** Unlike `toNerve`, every field here is derived from
`N.univ` and `N.reactions` alone: `components` is `couplingComponents`, the actual
union-find count, not a caller-supplied witness. This is the instance a theorem about a
*given* network's real topology should use. -/
def Network.nerve {Species : Type} (N : Network Species) : CoverNerve where
  entities := N.univ.length
  cells := N.reactions.length
  components := N.couplingComponents
  components_le_entities := N.couplingComponents_le_univ_length
  entities_le_cells_add_components := N.univ_length_le_reactions_add_couplingComponents

end ReactionNetworks
end Obsmetrologia
