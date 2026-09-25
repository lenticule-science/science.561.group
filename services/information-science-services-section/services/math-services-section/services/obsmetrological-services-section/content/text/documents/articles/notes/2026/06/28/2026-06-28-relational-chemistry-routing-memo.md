---
title: "Relational Chemistry: reaction as the linear regime of settling"
subtitle: "A proof-agent routing memo over the 2026-06-28 mathematical-chemistry frontier survey"
date: "2026-06-28"
author: "emsenn / RelMath notes"
status: "routing memo"
keywords:
  - relational-math
  - chemistry
  - reaction-networks
  - settling
  - linear-logic
  - resources
  - closure-rule-system
source-survey: "dev/content/researching/surveying/2026/06/28/mathematical_chemistry_frontier_memo.md"
date-created: 2026-06-28
description: This memo routes the 2026-06-28 mathematical-chemistry frontier survey onto RelMath.
---


## 0. Purpose

This memo routes the 2026-06-28 *mathematical-chemistry frontier* survey onto RelMath.
It is not a survey and not a Lean module; it is the map a proof agent should hold while deciding what is **already proved**, what is a **blueprint-red** open claim near the frontier, and what is **blocked** and on exactly what.

It is the chemistry analogue of the gases/liquids/plasmas routing doc (`…/2026/06/27/relmath_gases_liquids_plasmas_proof_frontier.md`) and the phases memo (`…/2026/06/28/relational_phases_memo.md`).
Where the phases memo treats *matter* as a regime of local-to-global survival, this memo treats **reaction** as a regime of settling.
Chemistry is not a new phase in that grammar; it is a different axis — the dynamics by which the soup *transforms itself*, not the carrier in which order survives.

## 1. The reframe (the one move)

The survey's bottom line (its §14) is the thesis that one should *"make **reaction** a foundational mathematical operation … study populations of objects whose local interactions transform the population."* That is the settling spine restated.
RelMath already takes interaction as primitive (the four base verbs, the four-corner coherence cell), and **settling already is a reaction dynamics**: a soup of cells, local rules that fire when enabled, no privileged control thread, convergence to an equilibrium.

So the survey's named models are **degenerate projections of settling**, not imports:

| Survey model | Settling projection already in RelMath |
|---|---|
| Chemical Abstract Machine (no instruction pointer; any enabled reaction fires) | `Closure/ClosureRuleSystem` — van Emden–Kowalski immediate-consequence operator |
| CRN computability / universality | `SubstitutionUniversalityClass`; firing dynamics in `NonScottContinuousFiring`, `FiringBlowup`, `ClosureFlowDynamics` |
| "what did the soup compute?" (output semantics) | `LawvereLaplacianSpectralGap` (harmonic = H⁰); `energy_gives_unique_equilibrium` (unique equilibrium ⟺ confluence ⟺ H¹=0) |
| thermodynamic cost of reaction; H-theorem | `FreeEnergyLyapunov` (Φ = deficit; weak H-theorem; strict drop per firing; finite convergence) **+** `Thermo/BoltzmannEntropy` (real `S = k log W`) |
| autocatalysis / self-maintaining organization | `SettlingCoalgebra` + the fixed-point / recurrence machinery |
| category theory: "many models, needs **maps between models**" (survey §9) | the conflation program itself — `QuartetRecurrence`; CRN/Petri/λ-soup/DPO are one structure at different depths |

The reader should resist re-deriving any of the right-hand column.
It is built and axiom-clean.
The work is on the **one thing the chain does not yet have**.

## 2. The genuine frontier: consumption (the linear regime)

`ClosureRuleSystem` is **monotone**: facts accumulate (inflationary, idempotent, lfp).
Nothing is ever consumed.
But the defining act of chemistry is **consumption with mass conservation**:

\[ A + B \rightarrow C \qquad\text{destroys an } A \text{ and a } B,\ \text{makes a } C,\ \text{conserves atoms.} \]

That is non-monotone, resource-sensitive, *counting* dynamics.
The corpus already names the home for "resources are consumed exactly once": the **linear / Lambek / quantale-enriched** projection (`ResiduatedLatticeStandalone`, `LambekCalculus`, `QuantaleEnrichedSheaf`).
Hence the single corpus-native claim this memo routes:

> **A chemical reaction network is the ℕ-counting (linear, resource) regime of settling.
> The monotone Datalog closure (`ClosureRuleSystem`) is its idempotent / affine projection** — the same firing operator read once over a counting comonoid (multiset / Petri net / vector-addition system) and once over a `{can / can't}` lattice.

This places chemistry exactly where the keystone predicts: a regime change along the strict→linear axis, not a new primitive.
Reachability (VAS-style) replaces least-fixed point as the "settling" notion — which is the honest reason this is a *new regime* rather than a relabeling of the monotone closure.

The four-corner cell reads on reaction roles: `{potential, active, stable, absurd}` ≅ a species present-but-not-yet-reacting / in a firing / a product-or-catalyst at rest / over-saturated-or-inhibited (`⊤`, the absurd charge).
This conflation is a *target to prove*, not a comment — same discipline as `articulation_phase_is_charge`.

## 3. Lean routing — `RelMath/Relational/Reaction/`

New top-level regime, sibling to `Kinetic/`, `Thermo/`, `Plasma/`.
Build order:

### Module 1 — `Reaction/Network` (the first, buildable now; GREEN target)

Carrier: a species count `Species → Nat` (or `Multiset Species`; decide at build from which gives the cleaner conservation algebra without `Classical`).
A `Reaction` is a pair of count vectors `(reactants, products)`; `enabled s r := reactants ≤ s` pointwise; `fire s r := s - reactants + products` (truncated/guarded subtraction on `Nat`).
A `ReactionNetwork` is a finite list of reactions; `step` nondeterministically fires one enabled reaction.

Provable, axiom-clean (Lean core `Nat`/`List` only):

- `mass_conserved` — for a reaction with `Σ reactants = Σ products` (mass-balanced), the total count is invariant under `fire`.
  (Conservation is a *hypothesis on the reaction*, not free data — unbalanced reactions are allowed and simply fail it.)
- `fire_not_monotone` — an explicit witness that `fire` decreases some coordinate (this is the content: chemistry is non-monotone; states this honestly).
- **Headline conflation** `support_step_eq_datalog` — the support reading `supp : (Species → Nat) → (Species → Bool)` (`> 0`) intertwines `step` with a `ClosureRuleSystem.
  Tstep` whose rules are the reactions' support: *forgetting counts collapses the reaction network to its monotone Datalog closure.* This is the §1 "linear regime → affine projection" claim as a theorem.
- `catalyst_is_fixed` — a species that occurs equally in `reactants` and `products` of a reaction is fixed by that reaction's `fire`; catalysis = a fixed point of the resource map.
  (Clean special case, cheap, conceptually load-bearing.)

### Module 2 — `Reaction/Reachability` (settling-as-reachability; mixed GREEN/RED)

`Reach s s'` = reflexive-transitive closure of `step`.
The "output of the soup" is a reachability predicate, not an lfp.
GREEN: `reach_refl`, `reach_trans`, conservation lifts along `Reach` (mass is a reachability invariant).
RED (blueprint, near frontier): decidability/boundedness of reachability is the VAS reachability question — state it, do **not** fake it; coverability is the tractable projection to aim a later green node at.

### Module 3 — `Reaction/FreeEnergyDescent` (bridge to the proved H-theorem; GREEN)

Tie reaction `step` to `FreeEnergyLyapunov`: exhibit a `Nat`-valued potential that is non-increasing along mass-action-free (untimed) firing toward a terminal multiset, so that the existing weak H-theorem / finite-convergence results apply to the reaction regime.
This is the corpus's already-proved thermodynamic content *reused*, not re-proved — the memo's §10/§12 "thermodynamic cost" line, discharged.

### Modules 4–6 — the reals pass (`MassActionRate`, `EulerFlow`, `DetailedBalance`)

Reals are present (`RelMath/Calculus/Real/`: ring/order/Archimedean `RReal`, `Logarithm`, `ExpSeries`, `ConvergesTo` sequence convergence).
The boundary is precise: there is no derivative or continuous-function limit in the chain, so a *continuous-time ODE solution operator* is genuinely absent — but **discrete-time mass action is fully in reach**.
So these are GREEN-partial, not RED:

- `Reaction/MassActionRate` (GREEN) — the real rate field `rate r s = k_r · ∏ᵢ sᵢ^{reactantᵢ}` over `RReal` (`npow` from `RealMultiplication`), propensity positivity / scaling laws, and `rateVector s = Σ rate·(products−reactants)`.
  Definitions and algebraic laws are provable now.
- `Reaction/EulerFlow` (GREEN/partial) — discrete-time `eulerStep dt s = s + dt • rateVector s`; equilibrium `rateVector s = 0` characterized as a fixed point; iterate convergence *stated* via `ConvergesTo`.
  The map and its fixed-point characterization are GREEN; general convergence is RED (proved only for contractive / specific networks).
- `Reaction/DetailedBalance` (GREEN/partial) — real chemical free energy `G(s) = Σ sᵢ(μᵢ + log sᵢ)` via `Logarithm`; the detailed-balance equilibrium condition; the Lyapunov *statement* tying `G` to `Thermo/BoltzmannEntropy`.
  `G` and the condition are GREEN; the full "G descends along `eulerStep`" proof is the hard step — stated at full strength with that one step left a `sorry`.

## 4. What stays RED (and on exactly what — name these, not "reals")

Per the reals banner: **do not** scope these out as "needs reals."
Reals exist in `RelMath/Calculus/Real/`.
After the reals pass above, the genuine blocks are narrower than first routed:

- **Continuous-time ODE solution.** Discrete-time mass action is green (Modules 4–6).
  The *solution operator* of `ds/dt = rateVector s` — a flow semigroup — needs an integration / derivative layer that the chain does not yet have.
  `ConvergesTo` gives sequences, not a continuous flow.
  This, not "reals," is the real block.
  RED node: `Reaction/ContinuousFlow` (`notready`).
- **Stochastic CRN / Gillespie.** Real-valued propensities are green; the full trajectory *distribution* needs the measure layer (`RelMath/Calculus/Probability/` has interval-valued stochastics → interval propensities are partial; full sampling is RED, flagged absent in the roadmap).
- **Graph/hypergraph (DPO) rewriting over structured molecules.** The survey §6 many-to-many structural rewrite.
  `Reaction/Network` above is species-as-labels (the CRN abstraction); structured-molecule DPO is the thicker node, and it connects to the phases memo's `DecoratedCellComplex` skeleton — a *reaction* there rewrites the base complex, not just the stalk.
  RED, and a genuine join point between this memo and the phases memo.
- **Autocatalytic-set existence theorems** (survey §10).
  Enumerating self-maintaining subnetworks is a real combinatorial frontier; the *definition* (a subnetwork closed and self-regenerating under `fire`) is buildable now as a predicate, the existence/ enumeration results are RED.

## 5. Naming discipline (cardinal-sin guard)

- A monotone lattice closure is **not** a reaction network — the whole point of Module 1 is that `fire` is *not* monotone; do not quietly reuse `ClosureRuleSystem` and call it chemistry.
- "Reaction" in `Kinetic/DiscreteVelocityCollision` and `Plasma/` means a *physical collision/scattering term*, not a CRN rule.
  Different node; do not collide names.
  Use `RelMath.
  Reaction` namespace cleanly.
- Mass conservation is a **hypothesis on a reaction**, asserted and used, never an axiom.
  Unbalanced reactions must remain expressible.
- The `support_step_eq_datalog` conflation must prove an *intertwining* (`supp ∘ step = Tstep ∘ supp` on enabled firings), not a definitional `rfl` of a target rigged to match.
  If the genuine statement needs a side condition, state the side condition.

## 6. Working thesis

Relational chemistry is settling with **counted resources**.
Where the monotone closure asks "what becomes derivable," the reaction regime asks "what becomes reachable when each derivation *spends* its inputs."
The proved spine already supplies the equilibrium (harmonic = H⁰), the confluence criterion (H¹ = 0), and the thermodynamic descent (the H-theorem).
The new work is the narrow, honest one: give the firing a body that conserves mass and can be consumed, and prove that forgetting the body recovers the closure we already have.
