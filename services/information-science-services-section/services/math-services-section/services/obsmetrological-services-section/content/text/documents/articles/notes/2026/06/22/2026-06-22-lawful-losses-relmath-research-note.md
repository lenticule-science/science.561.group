---
title: "Lawful Losses: Descent from Predication to Causality, Contextuality, and Free-Energy Settling in RelMath"
description: "A research note reframing RelMath’s descent as settling systems observed through lawful probes — causal Boolean projection, contextual/quantum obstruction, Lyapunov free-energy analogue — with the slogan ‘the descent is a sequence of lawful losses, not a sequence of substances.’"
date-created: 2026-06-22
keywords: [ "bilattice", "causal-set", "closure-operator", "contextuality", four, "free-energy", lyapunov, "predication", "relmath", "research-note", "settling" ]
---

# Lawful Losses: A Research Note on RelMath’s Descent from Predication to Causality, Contextuality, and Free-Energy-Like Settling

## Abstract

The strongest way to understand `emsenn/relational-math` is not as a linear metaphysical procession in which “information becomes quantum becomes causal becomes thermal,” but as a theory of **settling systems observed through lawful probes**. The existing Lean already proves a serious finite order-theoretic spine: primitive marks generate utterances and predication cells; predication cells receive FOUR-valued bilattice charges; those charges carry a knowledge order; closure operators settle valuations to fixed points; finite closure orbits admit Lyapunov-style deficits. The next mathematical step is to define when one layer is a **projection** of another: a monotone observation or embedding/projection pair that preserves enough closure structure that fixed points, least fixed points, and descent measures pass through it.

The resulting research program is not one staircase but a fork. One branch sends FOUR-valued predicative settling through its **positive Boolean projection**, yielding causal transitive closure and causal-set order. Another branch sends local Boolean projections through failed gluing, yielding contextual/quantum-like obstruction. A third branch reads finite deficit-to-fixed-point as a Lyapunov/free-energy analogue. The key slogan becomes:

> The descent is not a sequence of substances.  
> It is a sequence of lawful losses.  
> Each “lower” structure is what remains when richer predicative settling is observed through a probe that preserves fixed-point behavior.

---

## 1. Current formal ground

RelMath’s base is genuinely small. `Mark` is the atomic primitive, and the source comments explicitly identify it as one of the only free-data sites; `Articulating` is the other free site, an inductive recursive structure over utterances. fileciteturn29file0L4-L11 fileciteturn31file0L4-L27 `Utterance` then carries only an ordered token/claim pair, with no further primitive data. fileciteturn30file0L21-L28

From there, the first important finite object is the articulation cell. An `ArticulationCell` is an utterance plus two Boolean articulation-status fields, and `Corner` has exactly four constructors: `potential`, `active`, `absurd`, and `stable`. The theorem `Corner.card_eq_four` states that the list of all corners has length four. fileciteturn28file0L29-L44 fileciteturn28file0L78-L81

`Predicating` turns this into oriented assertion structure: a `PredicationCell` is a triple `(subject, predicate, object)`, and the file defines converse, subject/object projections, and predicate specialization. The orientation is real: if subject and object differ, the converse cell is provably different. fileciteturn27file0L40-L58 fileciteturn27file0L65-L77 fileciteturn27file0L87-L105

`Positing` then makes the crucial move: `Charge := Corner`. The same FOUR object is reused as a bilattice value object, with positive and negative Boolean evidence slots, knowledge/truth joins and meets, negation, and comparisons. A valuation is then `PredicationCell → Charge`. fileciteturn3file0L33-L44 fileciteturn3file0L53-L79 fileciteturn3file0L146-L164

This matches the broad Belnap/FOUR tradition: Belnap’s four-valued logic uses values corresponding to true, false, both, and neither; bilattices model truth and knowledge simultaneously through two lattice orders. ([arxiv.org](https://arxiv.org/abs/1808.09636?utm_source=chatgpt.com))

`Settling` proves that the knowledge comparison is a genuine partial order and that the knowledge join/meet have lub/glb behavior. It defines closure operators as inflationary, monotone, idempotent maps, and proves fixed-point and least-fixed-point facts. fileciteturn4file0L36-L43 fileciteturn4file0L45-L57 fileciteturn4file0L64-L85

`ClosureOrdinal` and `ClosureMonad` deepen this into finite dynamics: inflationary endomaps on `Charge` settle by step 3; KZ-style lax idempotence collapses to strict idempotence in the antisymmetric order; nontrivial periodic orbits are excluded; and `F_U(v) = Cl(v) ∨ₖ u` reaches the same finite-settling regime. fileciteturn5file0L68-L99 fileciteturn6file0L39-L48 fileciteturn6file0L56-L83

This is the formal core. It already supports:

```text id="nexkig"
marks → utterances → predication cells → FOUR-valued valuations
      → knowledge order → monotone closure → finite fixed-point settling
```

What it does **not** yet support is the stronger claim that this has already become quantum structure, Lorentzian spacetime, or thermodynamics in the usual external senses. Those require bridge theorems.

---

## 2. The better thesis: descent as lawful loss

The new organizing idea is:

> A layer is not a later substance.  
> A layer is a projection of a richer settling system.

A “projection” is not arbitrary forgetting. It must preserve enough structure that settled states remain meaningful after forgetting. That means we should define, explicitly, what a settling system is and what a lawful probe or descent bridge must preserve.

### Definition: settling system

A **settling system** is a state space with an order, a seed, and an inflationary monotone step:

```lean id="fkh539"
structure SettlingSystem where
  State : Type
  le : State → State → Prop
  seed : State
  step : State → State
  le_refl : ∀ x, le x x
  le_trans : ∀ {x y z}, le x y → le y z → le x z
  le_antisymm : ∀ {x y}, le x y → le y x → x = y
  step_infl : ∀ x, le x (step x)
  step_mono : ∀ {x y}, le x y → le (step x) (step y)
```

Then define:

```lean id="ap0k1b"
IsFixed S x := S.step x = x

AboveSeed S x := S.le S.seed x

IsLeastFixedAboveSeed S x :=
  IsFixed S x
  ∧ AboveSeed S x
  ∧ ∀ y, IsFixed S y → AboveSeed S y → S.le x y
```

The first theorem is deliberately boring:

```lean id="9k2d6u"
theorem lfp_unique
  (hx : IsLeastFixedAboveSeed S x)
  (hy : IsLeastFixedAboveSeed S y) :
  x = y
```

This gives the phrase “the settled result” a precise meaning.

### Definition: probe

A **probe** observes a settling system:

```lean id="c6tghg"
structure Probe (S : SettlingSystem) where
  Observation : Type
  observe : S.State → Observation
```

A probe by itself is weak. It can forget anything. The real object is a lawful projection.

### Definition: monotone projection

A **monotone projection** sends one settling system into another:

```lean id="9j0htf"
structure SettlingProjection (A B : SettlingSystem) where
  map : A.State → B.State
  map_mono : A.le x y → B.le (map x) (map y)
  seed_ok : B.le B.seed (map A.seed)
  step_ok : B.le (B.step (map x)) (map (A.step x))
```

If `step_ok` is equality,

```lean id="5z61o8"
B.step (map x) = map (A.step x)
```

then the projection is a **semiconjugacy** of settling systems.

The core theorem:

```lean id="ab404v"
theorem semiconjugacy_sends_fixed_to_fixed
  (hstep : ∀ x, B.step (map x) = map (A.step x))
  (hfix : A.step x = x) :
  B.step (map x) = map x
```

The stronger theorem:

```lean id="wszkkf"
theorem semiconjugacy_preserves_lfp
  ...
  (hlfp : IsLeastFixedAboveSeed A a∞) :
  IsLeastFixedAboveSeed B (map a∞)
```

This theorem will need suitable seed and order-reflection hypotheses. But this is exactly the shape of “descent” that RelMath needs.

---

## 3. The first hinge: Boolean causality as the positive projection of FOUR

The smallest nontrivial bridge is from `Charge` to `Bool`.

Define:

```lean id="42ot50"
def boolToCharge : Bool → Charge
  | false => Charge.kBot
  | true  => Charge.tTop

def chargeToBool : Charge → Bool :=
  Charge.pos
```

The core theorem should be a Galois connection:

```lean id="h941g5"
theorem bool_charge_galois :
  Charge.KLE (boolToCharge b) c ↔ BoolLE b (chargeToBool c)
```

where `BoolLE false _` always holds, and `BoolLE true x` means `x = true`.

This says:

> Boolean truth is the positive-evidence projection of FOUR-valued charge.

That is stronger than “Bool is a simplified charge.” It says the embedding and projection are adjoint. The Boolean causal layer can then be recovered as a lawful projection of the richer FOUR-valued evidence layer.

Useful helper theorems:

```lean id="kv5es8"
theorem boolToCharge_or :
  boolToCharge (a || b)
    = Charge.joinK (boolToCharge a) (boolToCharge b)

theorem boolToCharge_and :
  boolToCharge (a && b)
    = Charge.meetK (boolToCharge a) (boolToCharge b)

theorem boolToCharge_mono :
  BoolLE a b → Charge.KLE (boolToCharge a) (boolToCharge b)

theorem chargeToBool_mono :
  Charge.KLE a b → BoolLE (chargeToBool a) (chargeToBool b)
```

This is the first theorem cluster I would ask for. It makes “causal Boolean truth” a lawful extraction from FOUR-valued predication.

---

## 4. The causal step as a projection of charge-valued relational closure

The existing causal module defines a Boolean transitive closure step:

```text id="g0ypj8"
T_caus(v)(e₁,e₃) =
  v(e₁,e₃) ∨ ∃ e₂, v(e₁,e₂) ∧ v(e₂,e₃)
```

The file implements this as `causalStep` with `List.any` over the finite event list. fileciteturn12file0L147-L181

Now define the charge-valued version:

```lean id="ckeax3"
def chargeCausalStep
  (es : List E)
  (v : E → E → Charge) :
  E → E → Charge :=
fun a c =>
  Charge.joinK (v a c)
    (joinK over b ∈ es of Charge.meetK (v a b) (v b c))
```

Then define relation embedding:

```lean id="na7qby"
def embedBoolRel (r : E → E → Bool) : E → E → Charge :=
fun a b => boolToCharge (r a b)
```

The key theorem:

```lean id="gjtsm6"
theorem bool_causalStep_commutes_with_charge_projection :
  embedBoolRel (causalStep es r)
    = chargeCausalStep es (embedBoolRel r)
```

or, if exact equality is too strong because of list-fold presentation:

```lean id="ykzvzd"
theorem positive_projection_chargeCausalStep :
  projectChargeRel (chargeCausalStep es (embedBoolRel r))
    = causalStep es r
```

where:

```lean id="eenxgq"
def projectChargeRel (v : E → E → Charge) : E → E → Bool :=
fun a b => chargeToBool (v a b)
```

This theorem is the first real descent theorem:

> Boolean causal closure is the positive projection of charge-valued relational closure.

It converts the “information → causal” slogan into a commuting square.

---

## 5. The causal least fixed point theorem

The existing `LorentzianCausalSettling` module is close. It defines `CausalSet`, directed reachability, and proves transitivity, irreflexivity, asymmetry, and containment in the strict order. fileciteturn12file0L80-L91 fileciteturn12file0L116-L145 The headline theorem bundles seed inclusion, transitivity, fixedness of transitive relations, strict-order containment, irreflexivity, and asymmetry. fileciteturn13file0L34-L55

But the next theorem should prove leastness.

Define relation order:

```lean id="0hbwbp"
def RelLE (r s : E → E → Bool) : Prop :=
  ∀ a b, r a b = true → s a b = true
```

Define, assuming decidability:

```lean id="z721r7"
def reachBool (C : CausalSet E) : E → E → Bool :=
fun a b => decide (C.reaches a b)
```

Then prove:

```lean id="lbhwjz"
theorem reaches_least_seed_transitive
  (events_complete : ∀ e : E, e ∈ C.events)
  (r : E → E → Bool)
  (hseed : ∀ a b, C.prec0 a b = true → r a b = true)
  (htrans : ∀ a b c, b ∈ C.events →
    r a b = true → r b c = true → r a c = true) :
  ∀ a b, C.reaches a b → r a b = true
```

This is an induction on `C.reaches`.

Then:

```lean id="92h6cg"
theorem reachBool_is_lfp_causalStep
  (events_complete : ∀ e : E, e ∈ C.events) :
  IsLeastFixedAboveSeed
    (BooleanRelationSettlingSystem C.events C.prec0)
    (reachBool C)
```

This is the theorem that makes causal settling real. It proves that the settled causal relation is not just any transitive relation; it is the **least fixed point** of the causal closure step above the direct-link seed.

This matches the causal-set idea that spacetime can be modeled by a discrete set of events equipped with causal order, usually a locally finite partial order. ([en.wikipedia.org](https://en.wikipedia.org/wiki/Causal_sets?utm_source=chatgpt.com)) The RelMath version uses the irreflexive/asymmetric convention rather than the reflexive one, which the causal-set literature also allows as an equivalent presentation. ([en.wikipedia.org](https://en.wikipedia.org/wiki/Causal_sets?utm_source=chatgpt.com))

---

## 6. The diamond as the minimal spacetime witness

The current Myrheim–Meyer file already proves that a supplied `diamondPrec` on `Fin 4` has apex count `5` and ordering fraction `5/6`. fileciteturn15file0L64-L82

But the better theorem is to begin with the **cover relation**, not the already-transitively-closed relation:

```text id="lexq00"
0 → 1
0 → 2
1 → 3
2 → 3
```

Then closure adds:

```text id="mieor1"
0 → 3
```

Define:

```lean id="6ynbmi"
def diamondCoverPrec : Fin 4 → Fin 4 → Bool :=
  -- 0<1, 0<2, 1<3, 2<3 only

def diamondPrec : Fin 4 → Fin 4 → Bool :=
  -- 0<1, 0<2, 0<3, 1<3, 2<3
```

Then prove:

```lean id="to185x"
theorem diamondCover_not_transitive :
  causalStep fourEvents diamondCoverPrec ≠ diamondCoverPrec

theorem diamondCover_one_step_closes :
  causalStep fourEvents diamondCoverPrec = diamondPrec

theorem diamondPrec_fixed :
  causalStep fourEvents diamondPrec = diamondPrec

theorem diamondCover_settles_to_five_sixths :
  orderingFraction fourEvents
    (causalClosure fourEvents diamondCoverPrec)
    = fiveSixths
```

This is conceptually huge despite being small. It proves:

> local causal links settle into a causal diamond; the Myrheim–Meyer input is read from the settled relation, not assumed.

Myrheim–Meyer dimension estimators are based on order-theoretic counts in causal sets; the external causal-set literature treats such dimension estimators as ways to infer manifold dimension from causal order combinatorics. ([en.wikipedia.org](https://en.wikipedia.org/wiki/Causal_sets?utm_source=chatgpt.com))

---

## 7. Free energy as missing consequences

The current `FreeEnergyLyapunov` file defines a `Nat`-valued knowledge-height deficit from a valuation to its settled target and proves it is antitone along the closure orbit, strictly decreases when a cell fires, reaches zero at the fixed point, and reaches a fixed point in bounded finite time. fileciteturn16file0L94-L118 fileciteturn16file0L128-L163 fileciteturn17file0L101-L116 fileciteturn18file0L47-L76

The important generalization is to index the deficit by an arbitrary finite support:

```lean id="eukxaz"
def deficitIndexed
  (xs : List I)
  (v w : I → Charge) : Nat :=
  xs.foldr
    (fun x acc => (kHeight (w x) - kHeight (v x)) + acc)
    0
```

Then specialize to causal pair indices:

```lean id="n6opbr"
I = E × E
```

For Boolean causal relations embedded into `Charge`, the free-energy deficit should equal the number of missing causal consequences:

```lean id="uq9kcs"
def causalEnergy
  (pairs : List (E × E))
  (r settled : E → E → Bool) : Nat :=
  count pairs where settled a b = true and r a b = false
```

The bridge theorem:

```lean id="mymq80"
theorem causalEnergy_eq_chargeDeficit :
  causalEnergy pairs r settled
    =
  deficitIndexed pairs
    (embedBoolRel r)
    (embedBoolRel settled)
```

Then the H-theorem:

```lean id="uthksc"
theorem causalEnergy_antitone_along_orbit :
  causalEnergy pairs (causalOrbit n+1) settled
    ≤
  causalEnergy pairs (causalOrbit n) settled

theorem causalEnergy_strict_of_new_pair :
  newlyAddedPair n →
  causalEnergy pairs (causalOrbit n+1) settled
    <
  causalEnergy pairs (causalOrbit n)
```

This gives a precise finite thermodynamic analogue:

> Free energy is the count of still-unrealized consequences.  
> Firing dissipates missing consequence.  
> Equilibrium is closure.

This is not yet real-valued physical thermodynamics. It is a finite Lyapunov theorem. Standard thermodynamic/free-energy formulations usually involve real-valued entropy, relative entropy, or divergence on probability distributions; Markov-category work gives one categorical path toward entropy, mutual information, and data-processing inequalities using enriched morphism spaces with divergence or metrics. ([arxiv.org](https://arxiv.org/abs/2212.11719?utm_source=chatgpt.com))

So the honest claim is:

> RelMath currently supports an order-valued, finite H-theorem.  
> A physical/statistical H-theorem would require a real/rational stochastic enrichment and a divergence.

---

## 8. Quantum-like structure as contextual obstruction, not FOUR alone

The phrase “quantum-like” should be used carefully. FOUR is a bilattice. It is not, by itself, quantum logic. Quantum logic is usually associated with weakening Boolean distributivity into orthocomplemented or orthomodular lattice structure. ([en.wikipedia.org](https://en.wikipedia.org/wiki/Quantum_logic?utm_source=chatgpt.com)) Effect algebras and effectus theory are also major categorical frameworks for quantum/probabilistic predicates; effectus theory treats predicates as characteristic maps forming effect algebras, with Boolean and probabilistic cases appearing as special cases. ([arxiv.org](https://arxiv.org/abs/1512.05813?utm_source=chatgpt.com))

The better RelMath route is:

> FOUR is the evidence substrate.  
> Quantum-like structure begins when local Boolean projections cannot be glued into a global Boolean valuation.

This connects directly to sheaf-theoretic contextuality. Abramsky and Brandenburger’s framework treats contextuality and nonlocality as obstructions to global sections over locally consistent measurement contexts. ([arxiv.org](https://arxiv.org/abs/1102.0264?utm_source=chatgpt.com)) Recent categorical quantum-logic work goes even closer to this project: one 2026 paper presents contextuality as a left-adjoint generation of orthomodular structure from Boolean contexts, with non-distributivity arising through a categorical pushout/gluing construction and connected to absence of global sections. ([arxiv.org](https://arxiv.org/abs/2603.22353?utm_source=chatgpt.com)) Another 2026 paper gives a categorical equivalence between finitary orthomodular dynamic algebras and orthomodular lattices. ([arxiv.org](https://arxiv.org/abs/2604.17004?utm_source=chatgpt.com))

So define:

```lean id="8ps7jp"
structure BooleanContextFamily where
  Context : Type
  local : Context → LocalBoolValuation
  overlap_agree : ...
```

Then:

```lean id="vllnov"
def HasGlobalSection (F : BooleanContextFamily) : Prop :=
  ∃ global, ∀ C, restrict global C = F.local C

def IsContextual (F : BooleanContextFamily) : Prop :=
  ¬ HasGlobalSection F
```

The first theorem target:

```lean id="alxjx4"
theorem incompatible_boolean_contexts_no_global_section :
  IncompatibleOnOverlap F →
  IsContextual F
```

Later theorem target:

```lean id="reep85"
theorem contextual_projection_generates_non_distributive_gluing :
  IsContextual F → NonDistributive (ContextGluing F)
```

This makes the “quantum” branch a theorem about gluing failure, not a vague claim about alternatives.

---

## 9. The forked descent diagram

The improved conceptual diagram is not linear:

```text id="swe3te"
                          local Boolean projections
                         /        |
                        /         v
FOUR-valued predicative settling   contextual obstruction
                        \         |
                         \        v
                          \   quantum-like / orthomodular candidate
                           \
                            v
                      positive Boolean projection
                            |
                            v
                    causal transitive closure
                            |
                            v
                       causal-set order
                            |
                            v
              apex count / ordering fraction / diamond
                            |
                            v
              missing-consequence Lyapunov descent
```

This is stronger than the original linear claim because it explains why “quantum” and “causal” should not necessarily be consecutive layers. They are different projections of the same predicative settling system:

- **Quantum-like projection**: local Boolean consistency without global Boolean gluing.
- **Causal projection**: positive-evidence Boolean transitive closure on event pairs.
- **Thermal/free-energy projection**: finite deficit from current valuation to settled fixed point.

---

## 10. Theorems that would make the descent real

Here is the coherent theorem ladder.

### A. FOUR → Bool

```lean id="nk3kev"
boolToCharge : Bool → Charge
chargeToBool : Charge → Bool

bool_charge_galois :
  Charge.KLE (boolToCharge b) c ↔ BoolLE b (chargeToBool c)

boolToCharge_or :
  boolToCharge (a || b)
    = Charge.joinK (boolToCharge a) (boolToCharge b)

boolToCharge_and :
  boolToCharge (a && b)
    = Charge.meetK (boolToCharge a) (boolToCharge b)
```

Mathematical meaning:

> Boolean truth is the positive-evidence Galois projection of FOUR.

### B. Boolean causal closure as charge projection

```lean id="2807kf"
chargeCausalStep :
  List E → (E → E → Charge) → E → E → Charge

bool_causalStep_commutes_with_charge_projection :
  embedBoolRel (causalStep es r)
    = chargeCausalStep es (embedBoolRel r)
```

Mathematical meaning:

> causal transitive closure is the Boolean positive-face projection of charge-valued relational closure.

### C. Reachability as least fixed point

```lean id="cbc2sc"
reachBool_is_lfp_causalStep :
  IsLeastFixedAboveSeed
    (BooleanRelationSettlingSystem C.events C.prec0)
    (reachBool C)
```

Mathematical meaning:

> the causal order is not merely transitive; it is the settled least fixed point of direct causal links.

### D. Diamond from cover links

```lean id="amph18"
diamondCover_one_step_closes :
  causalStep fourEvents diamondCoverPrec = diamondPrec

diamondCover_settles_to_five_sixths :
  orderingFraction fourEvents
    (causalClosure fourEvents diamondCoverPrec)
    = fiveSixths
```

Mathematical meaning:

> a local cover relation settles into the causal diamond whose ordering fraction is `5/6`.

### E. Causal H-theorem

```lean id="nv78mm"
causalEnergy_eq_chargeDeficit :
  causalEnergy pairs r settled
    =
  deficitIndexed pairs
    (embedBoolRel r)
    (embedBoolRel settled)

causalEnergy_antitone_along_orbit :
  causalEnergy pairs (causalOrbit (n+1)) settled
    ≤
  causalEnergy pairs (causalOrbit n) settled

causalEnergy_strict_of_new_pair :
  newlyAddedPair n →
  causalEnergy pairs (causalOrbit (n+1)) settled
    <
  causalEnergy pairs (causalOrbit n) settled
```

Mathematical meaning:

> free-energy-like descent is missing-consequence elimination along causal settling.

### F. Contextual quantum-like branch

```lean id="jl44h4"
IsContextual F := ¬ HasGlobalSection F

incompatible_boolean_contexts_no_global_section :
  IncompatibleOnOverlap F → IsContextual F

contextual_projection_generates_non_distributive_gluing :
  IsContextual F → NonDistributive (ContextGluing F)
```

Mathematical meaning:

> quantum-like structure appears when Boolean projections are locally valid but globally ungluable.

---

## 11. What this would let the project honestly claim

After the theorem ladder above, the strongest honest statement would be:

> RelMath formalizes predicative settling as finite FOUR-valued closure dynamics. Boolean causal order is obtained as the positive-evidence projection of this richer charge-valued dynamics. The causal order is the least fixed point of a transitive-closure step, and finite causal diamonds arise by settling local cover links. The free-energy analogue is the finite deficit of unrealized causal consequences, strictly decreasing when new causal consequences fire. Separately, quantum-like structure is approached not by identifying FOUR with quantum logic, but by studying contextual obstruction: local Boolean projections that fail to glue globally, potentially generating non-distributive or orthomodular structure.

That is a good claim. It is strong, mathematical, and does not overstate the Lean.

---

## 12. The note’s core slogan

The project should stop saying only:

```text id="cotwys"
information → quantum → causal → thermal
```

and start saying:

```text id="gqq61o"
predicative settling
  ↘ positive projection → causal order → geometric count → Lyapunov descent
  ↘ contextual projection → no global section → quantum-like non-distributivity
```

Or, more compactly:

> RelMath studies how predicative information settles, and how lawful losses of that settling appear as causality, contextuality, geometry, and energy descent.

That is the coherent research program.
