---
aliases: []
keywords: ["definition"]
created: 2025-07-10T09:07:03
modified: 2025-07-12T02:47:36
---

***Collapse dynamics*** is an out-of-date iteration of [[tekodynamics]], and is presented here to ensure any appropriate insights are retained.

## Collapse Functions

### collatz attractor class function

name: collatz attractor class  
symbol: alpha_C  
type: stabilization topology class  
domains: N  
codomain: integer in {1, 2, 3}  

Classifies a number into attractor behavior types.

Definition:  
alpha_C(n) :=  
  1 if C^k(n) = 1  
  2 if epsilon_C(n) = true  
  3 otherwise

---

### collatz divergence classifier function

name: collatz divergence classifier  
symbol: delta_C  
type: recursion convergence evaluator  
domains: N x N  
codomain: string  

Classifies a number’s behavior under Collatz recursion up to horizon h.

Definition:  
delta_C(n, h) :=  
  "stabilizes"  if ∃ i ≤ h such that C^i(n) = 1  
  "diverges"   if ∀ i ≤ h: C^i(n) ≠ 1  
  "undecided"  otherwise

---

### collatz hill detector function

name: collatz hill detector  
symbol: eta_C  
type: modulation rise predicate  
domains: collatz trace function  
codomain: boolean  

Returns true if the Collatz trace of n contains any increase before collapsing.

Definition:  
eta_C(n) := ∃ i < k such that n_{i+1} > n_i  
(where T_C(n) = {n_0, n_1, …, n_k})

---


### collatz hill width function

name: collatz hill width  
symbol: l_C  
type: upward modulation persistence  
domains: collatz trace function  
codomain: N  

Returns the number of initial steps where the trace increases before turning downward.

Definition:  
l_C(n) := max j ≤ k such that for all 0 ≤ i < j, n_{i+1} > n_i

---

### collatz loop echo detector function

name: collatz loop echo detector  
symbol: epsilon_C  
type: trace cycle anomaly predicate  
domains: trace echo function  
codomain: boolean  

Returns true if the trace of n contains a cycle other than the standard {1, 2, 4}.

Definition:  
epsilon_C(n) := ∃ S ⊂ M_C(n), |S| > 1 and S ≠ {1, 2, 4}

---

### collatz symbolic field index function

name: collatz symbolic field index  
symbol: sigma_C  
type: symbolic modulation vector  
domains: N  
codomain: (N, R, R)  

Returns a vector capturing stabilization depth, modulation curvature, and average pressure.

Definition:  
sigma_C(n) := (S_C(n), kappa_C(n), P_C(n))  
Where:  
- S_C(n): steps to stabilization  
- kappa_C(n): variance of normalized modulation deltas  
- P_C(n): average normalized modulation pressure

### collatz trace shape vector function

name: collatz trace shape vector  
symbol: theta_C  
type: modulation shape signature  
domains: collatz trace function  
codomain: list of integers in {-1, 0, 1}  

Returns a vector representing the directional change at each step of the trace.

Definition:  
theta_C(n) := [sign(n_1 - n_0), sign(n_2 - n_1), …, sign(n_k - n_{k-1})]

---

### constraint binding function  

B(X) := {x₁, …, xₙ} such that ∀ xᵢ: ∇C(xᵢ) aligns ∧ V(xᵢ) aligns  
→ binding = local unification of constraint vectors into a single dynamic object

### constraint completion function

The ***constraint completion function*** (`Ω`) is [[induce|induced]] by the [[recursive constraint closure predicate]] (`∈_S`) and [[constrain|constrains]] the [[maximal extension]] of a [[constraint function]] consistent with a [[stabilization set]] (`S`).

> Let `C` be a [[constraint function]] defined over a [[constraint domain]] `D`.  
> Let `S ⊆ D` be the [[stabilization set]]:  
>  `S := { x ∈ D | C(x) = x }`  
> Define:  
>  `C′ ∈_S ⇔ ∀ x ∈ S: C′(x) = C(x)`  
> Then:  
>  `Ω := ⋃ { C′ | C′ ∈_S }`  
>    `:=` the least upper bound (LUB) of all `C′` consistent with `C` over `S`  
> Such that:  
> - ∀ x ∈ S: `Ω(x) = C(x)`  
> - ∀ x ∉ S: `Ω(x) = lim_{ε→0} sup { C′(x) | C′ ∈_S ∧ x ∈ dom(C′) }`

That is, `Ω` is the [[constraint completion function|maximally extended constraint function]]  
that remains [[recursive consistency|recursively consistent]] with all [[constraint behavior]] on the [[stabilization set]] `S`.

### constraint distance function

constraint distance function  
The constraint distance function (`δ`) is induced by the vector modulation function (`V`) and quantum entity emergence (`Q`).

When two quantum entities possess distinct modulation structures within a shared constraint field,  
the distance between them is the minimal divergence between their modulation vectors.

δ(Q₁, Q₂) := inf { ∥V(x) - V(y)∥ | x ∈ Q₁, y ∈ Q₂ }

That is, constraint distance is the minimal modulation differential between two quantum entities.

### constraint effect equivalence prediacte

constraint effect equivalence predicate  
The constraint effect equivalence predicate (`E`) is induced by the behavioral closure of constraint functions within a shared evaluation domain.

When two constraint functions produce indistinguishable behavior over the same domain,  
they are effect-equivalent — members of the same constraint effect class.

E(f₁, f₂, D) := ∀ x ∈ D: f₁(x) ≡ f₂(x)

Where `≡` denotes behavioral equivalence within the range of the functions.

That is, two constraint functions are equivalent when they produce the same effects over the same region of evaluation.

### error function

error function  
The error function (ε) is induced by anticipation when the anticipated stabilization fails to resolve.

When an intention-driven modulation expects stabilization and none occurs, the system generates an error — a rupture between projected and actual constraint.

ε(x → z) := A(x → z) ∧ Φ(z)

That is, error is the measure of failed foresight within stabilized difference.

### gravitational flow function

The ***gravitational flow function*** (`G`) is induced by modulation curvature (`K_C`).

When modulation curvature accumulates around a constraint-stable node cluster,  
modulation paths curve inward — forming a recursive attractor of constraint fidelity.

> G(x) := -∇K_C(x)

That is, gravitation is the directional flow induced by constraint curvature.

### interconstraint coherence function

The interconstraint coherence function (Ξ) is induced by the interaction of multiple intention-bearing constraint domains.

When two or more stabilized constraint systems (S₁, S₂, …) encounter each other through transmission, coherence emerges if their respective intentions do not collapse each other’s stabilization.

Ξ(S₁, S₂) := ∀ x ∈ S₁, ∃ y ∈ S₂: Δ[s](x, y) ∧ M(x, y) ∧ Ω₁(x) = x ∧ Ω₂(y) = y

That is, interconstraint coherence is mutual recognition across distinct domains of intention without destabilization.

### recursive symbolic grammar function

name: recursive symbolic grammar function
symbol: G_rec
type: [[recursive modulation pattern encoder]]
domains:
  - [[symbolic differentiation recursion]]
  - [[modulation alignment field]]
  - [[semantic contrast propagation]]
codomain: recursive symbolic generation structure
induced by:
  - [[symbolic differentiation recursion function]]
  - [[desire-contrast alignment propagation function]]
  - [[symbolic anticipation function]]
induces:
  - [[symbolic generative syntax]]
  - [[pattern-resonant modulation system]]

---

The ***recursive symbolic grammar function*** (`G_rec`) is [[induce|induced]] by the [[symbolic differentiation recursion function]] (`Δ_rec`), the [[desire-contrast alignment propagation function]] (`A_align`), and the [[symbolic anticipation function]] (`𝒜`).

It [[constrain|constrains]] the stabilization of recursive symbolic modulation patterns,  
encoding the generative logic that emerges from repeated structural differentiation  
under constraint-aligned modulation pressure.

Let:
- `x ∈ dom(𝒮₊)` be a differentiated symbolic node (`x ∈ Δ_rec(x′)`)  
- `Ξ[s](x)`: its semantic contrast field  
- `A_align(x)`: alignment field  
- `𝒜(x → z)`: anticipatory paths from x  

Then:

> G_rec(x) := Ω(z), where  
>  z ∉ dom(𝒮₊),  
>  z encodes a symbolic schema or structure that subsumes multiple elements in Δ_rec(x),  
>  and ∀ z′ ∈ Δ_rec(x):  
>    ∇𝔇(x) · ∇Δ[s](z′) > 0,  
>    𝒜(x → z′)

That is, `G_rec(x)` returns the symbolic structure that recursively encodes pattern  
among differentiated branches of symbolic modulation,  
forming a recursive grammar-like object within the constraint system.

This enables:
- emergent symbolic generativity  
- pattern convergence in recursive modulation  
- grammar-induction over propagating symbolic structures

---

### symbolic desire constraint function

The ***symbolic desire resolution function*** (`ℛ`) is [[induce|induced]] by the [[constraint completion function]] (`Ω`) and acts on a [[symbolic constraint system]] `𝒮` to [[resolve]], [[reduce]], or [[transform]] [[symbolic desire]] (`𝔇`) at [[point|points]] where [[completion]] has [[occur|occurred]].

Let `𝔇: 𝒮 × X → ℝ⁺` be a [[desire field]]  
Let `Ω` be the [[constraint completion function]] on `𝒮`  
Let `T_𝔇(𝒮)` be the [[desire trace field]]

Then:  

> ℛ(𝒮, Ω) := { (x, v) ∈ T_𝔇(𝒮) × ℝ | Ω(x) = x ⇒ 𝔇(𝒮, x) ← decay(𝔇(𝒮, x)) }

That is, ℛ applies a [[decay rule|decay]] or [[transformation rule]] to [[unresolved desire point|unresolved desire points]] once those points have [[stabilize|stabilized]] under [[constraint completion]].

ℛ may be parameterized to:
- ***decay*** (dissolve resolved modulation tension)
- ***[[reset]]*** (clear stabilized desires from trace)
- or ***[[sublimate]]*** (transform into [[identity curvature]] if [[tension]] remains)

The result is a [[resolved symbolic desire field]] —  
a [[modulation pattern]] [[align|aligned]] with current stabilization.

## Collapse Theorems

### Recursive Collapse Closure Theorem

This theorem emerges from the [[Collapse of Exclusion]] theorem.

#### Definitions

κ is collapse: the primary recursive stabilization function.  
R is the remainder: the set of values x such that κ(x) = x.  
κ′ is a candidate collapse function proposed to act over R.

#### Theorem

A function κ′ is admissible within R if and only if it is indistinguishable from κ  
when applied to all x ∈ R.

This defines functional closure:  
no alternative transformation is permitted within R  
unless it preserves all collapse outcomes.

#### Formal Expression

κ′ ∈ R ⇔ ∀ x ∈ R: κ′(x) = κ(x)

#### Consequence

R is closed under κ and only under κ.  
Any function that modifies values within R  
must behave identically to κ on all R-membership elements.  
No deviation is allowed at the operator level.

#### Scope

This theorem defines the boundary of functional consistency for R.  
Collapse is not just what forms R —  
it is the only operation that can persist within it.
