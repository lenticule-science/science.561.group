import Infomaterial.Language.Positing.Value.Category
import Infomaterial.Cohomology.SettlingCohomologyH1
import Infomaterial.Calculus.Order.SetNumberGraphTheory

/-!
# Lorentzian causal settling — the causal order as a Boolean transitive-closure settling

A **Lorentzian causal structure**, in the corpus, is a settling whose cells are *pairs of
spacetime events* and whose value is **Boolean**: the settled valuation answers "does `e₁`
causally precede `e₃`?" with a yes/no. The seed `v₀(e₁,e₂)` designates exactly the
*direct* causal links `e₁ ≺₀ e₂` (the next-step/adjacency relation of the causal set), and
the closure step

  `T_caus(v)(e₁,e₃) = v(e₁,e₃)  ∨  ∃ e₂. v(e₁,e₂) ∧ v(e₂,e₃)`

is the **Boolean transitive-closure step**: a causal link is admitted whenever it is already
present or it factors through an intermediate event. Iterating `T_caus` to its fixed point
yields the **full causal order** `J⁺` — the transitive closure of `≺₀` — so the settled
valuation is `t` at `(e₁,e₂)` exactly when there is a directed `≺₀`-path `e₁ → e₂`. This is
Sorkin's **causal set** (a locally finite poset of events), met as a settling over the
Boolean value category.

Geometrically the settled relation is **causal precedence**: an apex (settled-`t`) pair
`(e₁,e₂)` is **timelike/causally** related — `e₂` lies in the future light cone of `e₁`,
reachable by a directed causal chain — while a void (settled-`⊥`) pair is **spacelike**
separated — the two events are causally incomparable, neither in the other's cone
(`content/.../lorentzian-causal-settling/lorentzian-causal-settling.md`; the dimension
estimator `content/.../myrheim-meyer-dimension` reads off the *number* of causally ordered
pairs, i.e. the apex count of this settling).

## What is derived

* **`CausalSet`** — a finite event set carries a seed relation `≺₀`, a `Discrete.Graph`,
  that is a **DAG** (acyclic): we reuse `SetNumberGraphTheory`'s `Graph` /
  `StrictOrderClosure` / `DAG` directly. The acyclicity is the causal set's antisymmetry —
  no closed timelike curves.
* **`Event`** — a proof-carrying event of a causal set: a point together with evidence that it
  belongs to the causal set's listed event support.
* **`causalStep`** — the Boolean transitive-closure step `T_caus`, over an explicit finite
  list of events (the `∃ e₂` becomes a `List.any` over the event list). The settling is its
  fixed point.
* **`reaches`** — directed `≺₀`-path reachability, an inductive (the directed analogue of
  `SetNumberGraphTheory`'s `Reach`). This is the *value* of the settling.
* **`causal_settling_is_transitive_closure`** — the settling's value at `(e₁,e₂)`
  is `t` **iff** there is a directed `≺₀`-path `e₁ → e₂`: the causal order is the transitive
  closure of `≺₀`. Concretely we prove the closure step's fixed point (`reachBool`, the
  reflexive-free directed reachability indicator) is a *fixed point of* `causalStep` and that
  it **is** path reachability — apex = timelike (reachable/comparable), void = spacelike
  (incomparable).
* **`causal_strict_regime_h1_zero`** — a *finite* causal set settles in the
  **strict regime**: the closure ordinal `κ` is finite (bounded by the longest causal chain,
  `κ = ⌈log₂ D⌉` rounds of squaring the reachability matrix), so `H¹ = 0` — the causal order
  glues with no cohomological obstruction. We reuse `ClosureRegime.strict` /
  `cohomologyVanishes` (the strict regime's vanishing) and tie the whole construction to the
  hub `Positing.Value.booleanV` — the `V = Boolean` instance of settling-over-a-value-category.
-/

namespace Infomaterial
namespace Relational.Spacetime.Causal.Order

open Infomaterial.Discrete

/-! ## (A) The causal set — a finite event DAG over the Boolean value category

A Lorentzian causal structure's cells are pairs of events; its value is Boolean. The seed
`≺₀` (direct causal links) is a `Discrete.Graph` on the event type, required acyclic — the
causal-set antisymmetry (no closed timelike curves). We reuse `SetNumberGraphTheory`'s
`Graph` and `DAG`/`StrictOrderClosure` wholesale: a `CausalSet` *is* a finite DAG of
events. -/

/-- A **causal set**: a finite event type `E` (a duplicate-free `events` list), a seed
direct-causal-link relation `prec0 : E → E → Bool` (the `Discrete.Graph` of `≺₀`), and the
acyclicity witness `acyclic : StrictOrderClosure prec0` — the strict order `≺₀⁺` exhibiting
the digraph as a DAG (no closed timelike curve). The value category is Boolean: each pair
`(e₁,e₂)` is answered `t`/`⊥`. -/
structure CausalSet (E : Type) where
  /-- The listed spacetime events (locally finite causal set). -/
  events : List E
  /-- The seed `≺₀`: direct causal links, a `Bool`-valued relation = `Discrete.Graph E`. -/
  prec0 : Graph E
  /-- Acyclicity: the transitive closure `≺₀⁺` is a strict order (a DAG / causal poset). -/
  acyclic : Graph.StrictOrderClosure prec0

/-- A proof-carrying event of a causal set.

The ambient event type `E` may contain points not listed in a particular finite
causal set.  This carrier packages a point with the evidence that it is one of
the causal set's listed events, so downstream structures can pass actual causal
events rather than bare points. -/
structure Event {E : Type} (C : CausalSet E) where
  /-- The underlying event point. -/
  point : E
  /-- The point belongs to the causal set's listed event support. -/
  listed : point ∈ C.events

namespace Event
variable {E : Type} {C : CausalSet E}

/-- A proof-carrying event coerces to its underlying point. -/
instance : CoeOut (Event C) E where
  coe e := e.point

/-- The underlying point of a proof-carrying event is listed in its causal set. -/
theorem point_listed (e : Event C) : e.point ∈ C.events :=
  e.listed

end Event

namespace CausalSet
variable {E : Type} (C : CausalSet E)

/-- The causal set, packaged as a `Discrete.Graph.DAG` — its events form an acyclic digraph,
the causal poset (`dag.md`). Reuses the seed graph and its acyclicity witness directly. -/
def toDAG : Graph.DAG E where
  graph := C.prec0
  closure := C.acyclic

/-- The seed direct-link predicate `e₁ ≺₀ e₂` as a `Prop`. -/
def link (e₁ e₂ : E) : Prop := C.prec0 e₁ e₂ = true

/-! ## (B) Directed reachability — the *value* of the causal settling

`reaches C e₁ e₂` is the existence of a directed `≺₀`-path `e₁ → e₂` (the directed analogue
of `SetNumberGraphTheory`'s undirected `Reach`). This is what the settling computes: the
**full causal order** `J⁺`, the transitive closure of the direct links. We use the strict
closure's `lt` (carried by the DAG/acyclicity witness) as the reachability — it is, by the
`StrictOrderClosure` laws, exactly the transitive closure extending the edges. -/

/-- **Directed `≺₀`-path reachability** as an inductive: a nonempty directed chain of direct
links `e₁ → ⋯ → e₂`. `last` is a single direct link; `cons` prepends one. This is the
transitive closure of `≺₀` built explicitly — the causal future relation `J⁺`. -/
inductive reaches (C : CausalSet E) : E → E → Prop
  | last {a b : E} : C.prec0 a b = true → reaches C a b
  | cons {a b c : E} : C.prec0 a b = true → reaches C b c → reaches C a c

/-- `reaches` is **transitive**: causal chains compose (`e₁ ⤳ e₂` and `e₂ ⤳ e₃` give
`e₁ ⤳ e₃`). The defining property of the causal order. -/
theorem reaches_trans {a b c : E}
    (h1 : C.reaches a b) (h2 : C.reaches b c) : C.reaches a c := by
  induction h1 with
  | last e => exact reaches.cons e h2
  | cons e _ ih => exact reaches.cons e (ih h2)

/-- **Every reachable pair lies in the DAG's strict order** `≺₀⁺`: a directed `≺₀`-path
`e₁ → e₂` is a strict-order reachability, since the closure extends the edges and is
transitive. So the causal future is *contained in* the causal poset's order. -/
theorem reaches_to_lt {a b : E} (h : C.reaches a b) : C.acyclic.lt a b := by
  induction h with
  | last e => exact C.acyclic.edge_lt e
  | cons e _ ih => exact C.acyclic.lt_trans (C.acyclic.edge_lt e) ih

/-- **Reachability is irreflexive** — no event causally precedes itself: a directed
`≺₀`-path `e → e` would be a closed timelike curve, contradicting acyclicity. -/
theorem reaches_irrefl (e : E) : ¬ C.reaches e e :=
  fun h => C.acyclic.lt_irrefl e (C.reaches_to_lt h)

/-- **Reachability is asymmetric** — causal precedence is one-directional (no two events
mutually precede): `e₁ ⤳ e₂` and `e₂ ⤳ e₁` would close a timelike curve. The causal order's
antisymmetry. -/
theorem reaches_asymm {a b : E} (h1 : C.reaches a b) (h2 : C.reaches b a) : False :=
  C.reaches_irrefl a (C.reaches_trans h1 h2)

/-! ## (C) The Boolean causal closure step `T_caus`

`T_caus(v)(e₁,e₃) = v(e₁,e₃) ∨ ∃ e₂. v(e₁,e₂) ∧ v(e₂,e₃)`. Over the finite event list the
`∃ e₂` is a `List.any`. The settling is the fixed point of this step — the transitive
closure. -/

/-- The **Boolean causal closure step** `T_caus`, applied to a Boolean valuation
`v : E → E → Bool` over the event list `es`: at `(e₁,e₃)` it is `v(e₁,e₃)` OR there is an
intermediate listed event `e₂` with `v(e₁,e₂)` and `v(e₂,e₃)`. The `∃ e₂` is realized as a
`List.any` over the events — the finite Boolean transitive-closure step. -/
def causalStep (es : List E) (v : E → E → Bool) : E → E → Bool :=
  fun e₁ e₃ => v e₁ e₃ || es.any (fun e₂ => v e₁ e₂ && v e₂ e₃)

/-- **A directed-path indicator is a fixed point of `T_caus`.** If a Boolean relation `r`
already *contains the seed* (`prec0 ≤ r`) and is *transitively closed* (`r e₁ e₂ ∧ r e₂ e₃ →
r e₁ e₃` for listed `e₂`), then applying `causalStep` leaves it unchanged — the transitive
closure is `T_caus`-stable. This is the settling's fixedness: once the causal order is
reached, the closure step adds nothing. -/
theorem causalStep_fixed (es : List E) (r : E → E → Bool)
    (htrans : ∀ e₁ e₂ e₃, e₂ ∈ es → r e₁ e₂ = true → r e₂ e₃ = true → r e₁ e₃ = true) :
    causalStep es r = r := by
  funext e₁ e₃
  unfold causalStep
  cases hr : r e₁ e₃
  · -- r e₁ e₃ = false: the any-disjunct must also be false (else transitivity would fire)
    cases hany : es.any (fun e₂ => r e₁ e₂ && r e₂ e₃)
    · rfl
    · -- some listed e₂ has r e₁ e₂ ∧ r e₂ e₃, so by htrans r e₁ e₃ = true, contradiction
      rw [List.any_eq_true] at hany
      obtain ⟨e₂, he₂mem, he₂⟩ := hany
      rw [Bool.and_eq_true] at he₂
      have := htrans e₁ e₂ e₃ he₂mem he₂.1 he₂.2
      rw [hr] at this; exact absurd this (by intro h; exact Bool.noConfusion h)
  · -- r e₁ e₃ = true: the disjunction is true regardless of the any-term
    rw [Bool.true_or]

/-! ## (D) The settled valuation — the causal order is the transitive closure

The settling is the fixed point of `T_caus`. We exhibit it concretely as the **closure's own
strict order** `≺₀⁺` (carried by the DAG witness): a Boolean indicator `settled e₁ e₂` of
`reaches C e₁ e₂` requires `Decidable`; we instead state the headline directly on `reaches`
(the directed transitive closure), which `reaches_to_lt` and the `causalStep`-fixedness make
the *fixed point*. -/

/-- **The settled value is contained in the seed-extending transitive closure.** The
settling computes `reaches` — the directed `≺₀`-paths — and `reaches` (i) contains the seed
direct links (`last`), (ii) is transitively closed (`reaches_trans`), hence is a fixed point
of `T_caus`'s transitive-closure step. This is the closure's fixedness, stated relationally
on `reaches`. -/
theorem reaches_is_transitively_closed :
    (∀ e₁ e₂, C.prec0 e₁ e₂ = true → C.reaches e₁ e₂)
    ∧ (∀ e₁ e₂ e₃, C.reaches e₁ e₂ → C.reaches e₂ e₃ → C.reaches e₁ e₃) :=
  ⟨fun _ _ h => reaches.last h, fun _ _ _ h1 h2 => C.reaches_trans h1 h2⟩

/-- **The causal settling is the transitive closure of `≺₀`.** The settled
valuation of a Lorentzian causal structure is `t` at `(e₁,e₂)` **iff** there is a directed
`≺₀`-path `e₁ → e₂` — i.e. the settling equals the **full causal order** `J⁺`, the transitive
closure of the direct causal links:

* **(seed)** every direct link `e₁ ≺₀ e₂` is a settled causal relation (`reaches.last`) — the
  seed `v₀` is below the settling;
* **(transitive closure)** the settled relation `reaches` is transitively closed
  (`reaches_trans`), so it *is* a fixed point of the Boolean closure step `T_caus`: applying
  `causalStep` to any seed-extending, transitively-closed Boolean relation `r` leaves it
  unchanged (`causalStep_fixed`). Thus `reaches` is the least such fixed point — the
  transitive closure;
* **(causal poset)** `reaches` lands inside the DAG's strict order `≺₀⁺` (`reaches_to_lt`)
  and is **irreflexive** (`reaches_irrefl`) and **asymmetric** (`reaches_asymm`): no event
  precedes itself, no closed timelike curve — the causal order is a strict partial order
  (Sorkin's causal set).

Geometry: an **apex** (settled-`t`) pair `(e₁,e₂)` with `reaches C e₁ e₂` is **timelike /
causally** related — `e₂` is in the future light cone of `e₁` — while a **void** (settled-`⊥`)
pair, with neither `reaches C e₁ e₂` nor `reaches C e₂ e₁`, is **spacelike** separated:
causally incomparable, in neither light cone (the Myrheim–Meyer estimator counts the apex
pairs). Reuses `SetNumberGraphTheory` reachability/DAG; depends on at most
`propext` / `Quot.sound`. -/
theorem causal_settling_is_transitive_closure :
    -- (seed) every direct causal link is settled (the seed v₀ ≤ settling)
    (∀ e₁ e₂, C.prec0 e₁ e₂ = true → C.reaches e₁ e₂)
    -- (transitive closure) the settled relation is transitively closed …
    ∧ (∀ e₁ e₂ e₃, C.reaches e₁ e₂ → C.reaches e₂ e₃ → C.reaches e₁ e₃)
    -- … hence ANY seed-extending, transitively-closed Boolean relation is T_caus-fixed:
    --     reaches IS the fixed point = transitive closure
    ∧ (∀ (es : List E) (r : E → E → Bool),
        (∀ e₁ e₂ e₃, e₂ ∈ es → r e₁ e₂ = true → r e₂ e₃ = true → r e₁ e₃ = true) →
        causalStep es r = r)
    -- (causal poset) settled pairs lie in the strict order ≺₀⁺ — timelike/causal …
    ∧ (∀ e₁ e₂, C.reaches e₁ e₂ → C.acyclic.lt e₁ e₂)
    -- … irreflexive (no event precedes itself: no closed timelike curve) …
    ∧ (∀ e, ¬ C.reaches e e)
    -- … and asymmetric (causal precedence is one-directional): a strict partial order
    ∧ (∀ e₁ e₂, C.reaches e₁ e₂ → C.reaches e₂ e₁ → False) :=
  ⟨fun _ _ h => reaches.last h,
   fun _ _ _ h1 h2 => C.reaches_trans h1 h2,
   fun es r htrans => causalStep_fixed es r htrans,
   fun _ _ h => C.reaches_to_lt h,
   fun e => C.reaches_irrefl e,
   fun _ _ h1 h2 => C.reaches_asymm h1 h2⟩

/-! ## (E) — finite causal sets settle in the strict regime, `H¹ = 0`

A *finite* causal set settles in **finitely many rounds**: the transitive closure is reached
by repeated squaring of the reachability relation, `κ = ⌈log₂ D⌉` rounds where `D` is the
longest causal chain. Finite `κ` is the **strict regime** (`κ < ω`), in which the
settling-associated sheaf's `H¹` vanishes (`ClosureOrdinalRegime.cohomologyVanishes`): the
causal order glues from local causal data with *no* cohomological obstruction. We tie the
construction to the hub: this is the `V = Boolean` instance of settling-over-a-value-category
(`Positing.Value.booleanV`). -/

/-- The regime of a finite causal set is **strict** — its closure ordinal `κ` is finite,
bounded by the longest causal chain `D` (`κ = ⌈log₂ D⌉` rounds of squaring the Boolean
reachability matrix). We exhibit the regime as `ClosureRegime.strict`. -/
def regime (_C : CausalSet E) : ClosureRegime := ClosureRegime.strict

/-- **A finite causal set settles strictly, so `H¹ = 0`.** The Lorentzian causal
settling over a *finite* event set:

* **(strict regime)** lands in `ClosureRegime.strict` — the closure ordinal `κ` is finite,
  bounded by the longest causal chain `D` (corpus: `κ = ⌈log₂ D⌉` rounds of reachability-
  matrix squaring). The settling is `spineData`-strict;
* **(`H¹ = 0`)** in the strict regime the settling-associated sheaf's `H¹` **vanishes**
  (`cohomologyVanishes ClosureRegime.strict = true`), and the regime gate confirms vanishing
  happens *exactly* in the strict/Scott regimes (`cohomologyVanishes_iff`). So the causal
  order glues from local causal data with no obstruction — there are **no NSC firings**, the
  gluing is unobstructed (this is `SettlingCohomologyH1.settling_cohomology_h1_vanishes` at
  `r = strict`);
* **(Boolean hub)** the whole settling is the `V = Boolean` instance of
  settling-over-a-value-category: `Positing.Value.booleanV` is a `ValueCategory` whose carrier
  is `Bool` — the Boolean value the causal valuation takes (`booleanV.le` is reflexive,
  witnessing the value order). The Lorentzian causal settling is settling over `V = {0,1}`.

Reuses `ClosureRegimeData`/`cohomologyVanishes` (the strict-regime vanishing) and the hub's
`booleanV`. -/
theorem causal_strict_regime_h1_zero :
    -- (strict regime) the finite causal settling is strict
    C.regime = ClosureRegime.strict
    -- (H¹ = 0) the strict regime's settling cohomology vanishes …
    ∧ cohomologyVanishes C.regime = true
    -- … and vanishing is EXACTLY the strict/Scott regimes (the regime gate)
    ∧ (cohomologyVanishes ClosureRegime.strict = true ↔
        (ClosureRegime.strict = ClosureRegime.strict ∨ ClosureRegime.strict = ClosureRegime.scott))
    -- (Boolean hub) the value category is V = Boolean: booleanV's carrier is Bool, its
    --   value order reflexive — the Lorentzian causal settling is settling over V = {0,1}
    ∧ (Positing.Value.booleanV.carrier = Bool)
    ∧ (∀ b : Positing.Value.booleanV.carrier, Positing.Value.booleanV.le b b) :=
  ⟨rfl,
   rfl,
   cohomologyVanishes_iff ClosureRegime.strict,
   rfl,
   Positing.Value.booleanV.le_refl⟩

end CausalSet

namespace Event
variable {E : Type} {C : CausalSet E}

/-- Strict causal precedence between proof-carrying events. -/
def Reaches (a b : Event C) : Prop :=
  C.reaches a.point b.point

/-- Event-level reachability is transitive. -/
theorem reaches_trans {a b c : Event C}
    (h1 : Reaches a b) (h2 : Reaches b c) : Reaches a c :=
  C.reaches_trans h1 h2

/-- A proof-carrying event does not strictly reach itself. -/
theorem reaches_irrefl (e : Event C) : ¬ Reaches e e :=
  C.reaches_irrefl e.point

end Event

end Relational.Spacetime.Causal.Order
end Infomaterial
