# RelCrypt-Σ2 Lean Roadmap

**Goal:** formalize the structural scaffolding of RelCrypt inside `emsenn/relational-math`.

This roadmap does not attempt to prove cryptographic security. It targets the algebraic and order-theoretic pieces that the repo is already good at proving.

---

## 1. Guiding principle

Lean should prove:

```text
- the masks are lawful
- the representation is balanced
- the observer notions are equivalence relations
- the Feistel/permutation scaffolding is invertible
- the toy closure pulse is monotone/inflationary
```

Lean should not initially try to prove:

```text
- PRP security
- AEAD security
- pseudorandomness
- side-channel security
```

Those belong to a much larger theory.

---

## 2. Proposed module layout

```text
RelMath/Crypto/Gauge2Mask.lean
RelMath/Crypto/BalancedFour.lean
RelMath/Crypto/Observer.lean
RelMath/Crypto/Feistel.lean
RelMath/Crypto/SemanticPulseToy.lean
RelMath/Crypto/Sigma2Toy.lean
```

---

## 3. `Gauge2Mask.lean`

Define:

```lean
Gauge₂ := {g : K4 // g = K4.id ∨ g = K4.neg}
```

or an inductive two-element type with embedding into K₄.

Prove:

```text
Gauge₂ closed under K₄ multiplication
identity in Gauge₂
neg in Gauge₂
every Gauge₂ element is self-inverse
Gauge₂ action on Charge
mask/unmask theorem: act g (act g x) = x
Gauge₂ action on Valuation
valuation mask/unmask theorem
Gauge₂ preserves KLE
Gauge₂ flips/dualizes truth polarity as expected
```

Useful theorem names:

```text
gauge2_closed
gauge2_self_inverse
gauge2_act_involutive
gauge2_preserves_kle
gauge2_mask_unmask_charge
gauge2_mask_unmask_valuation
```

---

## 4. `BalancedFour.lean`

Define a four-rail representation of `Charge`.

Mathematical representation:

```text
code(P,N) = (N, P, ¬P, ¬N)
```

At the Lean level, avoid machine words at first. Work lane-wise:

```lean
structure FourRail where
  b0 : Bool
  b1 : Bool
  b2 : Bool
  b3 : Bool
```

Define:

```text
encode : Charge → FourRail
decode? : FourRail → Option Charge
weight : FourRail → Nat
```

Prove:

```text
weight (encode c) = 2
decode? (encode c) = some c
encoded rails are complementary in pairs
```

Then define K₄ rail-masked encoding:

```text
encodeK4(g,c) = encode(K4.act g c)
```

Prove:

```text
weight (encodeK4 g c) = 2
decode? (encodeK4 g c) = some (K4.act g c)
act g is recoverable by applying g again
```

Potential theorem names:

```text
balanced_weight_eq_two
decode_encode
k4_balanced_weight_eq_two
k4_encode_decode
```

---

## 5. `Observer.lean`

Define a generic observer and indistinguishability relation:

```lean
def Observer (α β : Type) := α → β
def Indist (O : Observer α β) (x y : α) : Prop := O x = O y
```

Prove:

```text
Indist is reflexive
Indist is symmetric
Indist is transitive
product observers refine component observers
observer postcomposition preserves indistinguishability
```

Instantiate observers:

```text
truth-row observer
inconsistency-row observer
Gauge₂ orbit observer
cohomological invariant observer
balanced-code weight observer
```

Potential theorem names:

```text
indist_refl
indist_symm
indist_trans
indist_equivalence
product_observer_left
product_observer_right
postcompose_indist
```

---

## 6. `Feistel.lean`

Formalize generic Feistel invertibility.

Start with a two-branch Feistel:

```lean
def round (F : R → K → L) (k : K) : L × R → L × R
def invRound ...
```

Prove:

```text
invRound F k (round F k x) = x
round F k (invRound F k x) = x
```

Then extend to:

```text
n-round Feistel with key schedule
generalized cyclic Feistel over a list/vector of branches
```

Important theorem:

```text
Feistel is invertible for arbitrary round function F.
```

This is what lets non-invertible settling oracles live inside an invertible shell.

Potential theorem names:

```text
feistel_round_left_inverse
feistel_round_right_inverse
feistel_round_bijective
feistel_network_invertible
```

---

## 7. `SemanticPulseToy.lean`

Define a tiny finite semantic pulse over a small vector/list of Charges.

Use existing `Charge`, `KLE`, `joinK`, and valuation machinery.

Toy pulse shape:

```text
input valuation
Gauge₂ mask
monotone closure step
truth/top observer extraction
```

Prove:

```text
pulse is inflationary in KLE
pulse is monotone in KLE
truth/top masks are disjoint where applicable
Gauge₂-compatible fragment is equivariant
```

Potential theorem names:

```text
semantic_pulse_inflationary
semantic_pulse_monotone
truth_top_disjoint
gauge2_pulse_equivariant_fragment
```

---

## 8. `Sigma2Toy.lean`

Do not try to formalize the 64-bit Python cipher directly.

Instead, formalize a toy structural analogue:

```text
small finite state
toy semantic oracle
toy generalized Feistel
toy balanced representation
toy observer
```

Prove:

```text
toy permutation invertible
toy balanced representation constant weight
toy internal Gauge₂ mask/unmask
toy closure pulse monotone
```

This becomes the Lean-certified skeleton of the Python cipher.

---

## 9. Relationship to existing repo modules

This roadmap should reuse existing modules rather than re-postulate:

```text
RelMath.Positing.Four
RelMath.Positing.KleinFourGauge
RelMath.Positing.D4Gauge
RelMath.Order.AlgebraHierarchy
RelMath.LinearAlgebra.Basic
RelMath.Closure.ClosureRuleSystem
RelMath.Cohomology.InconsistencySheaf
RelMath.Cohomology.BigradedSettlingCohomology
RelMath.Aperiodic.CohomologicalEquivalence
```

---

## 10. Success criteria

The Lean layer succeeds when it can honestly say:

```text
The RelCrypt scaffolding is algebraically lawful.
The Gauge₂ internal mask is order-compatible.
The balanced FOUR representation has constant weight.
The toy Feistel/permutation shell is invertible.
The toy semantic pulse is monotone/inflationary.
Observer indistinguishability is formally an equivalence.
```

That is enough to make the Python cryptanalysis more meaningful without pretending Lean has proved security.
