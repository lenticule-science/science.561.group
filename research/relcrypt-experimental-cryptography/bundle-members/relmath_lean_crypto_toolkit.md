# RelMath Lean Toolkit for RelCrypt

**Purpose:** extract more Lean-side mathematical tools from `emsenn/relational-math` for the next RelCrypt design cycle.  
**Status:** design/research toolkit, not a security claim.  
**Generated:** 2026-06-24

This document is not Python source. It is a working map from the Lean repository’s formal structures to cryptographic construction ideas.

---

## 0. Core correction

The most important architectural correction is:

```text
𝔽₂ is the bit engine.
FOUR is the semantic/evidence geometry.
Gauge₂ = {id, neg} is the order-compatible internal mask.
Full K₄ is a semantic boundary-whitening layer.
D₄ is a role/order-swapping boundary layer.
Settling/cohomology provide nonlinear observer structure.
```

The mistake to avoid:

```text
Do not treat all of K₄ as if it belongs inside every monotone knowledge-closure step.
```

Inside knowledge-order closure, `neg` is compatible because it preserves the knowledge order, but `conf` and `negConf` reverse knowledge order. Full K₄ belongs at boundary/whitening stages where order reversal is intentional.

---

## 1. Toolkit overview

The useful Lean-side objects divide into several cryptographic roles:

| Lean region | RelCrypt use |
|---|---|
| `AlgebraHierarchy`, `LinearAlgebra.Basic` | `𝔽₂`, vector spaces, affine/linear diffusion |
| `Four`, `KleinFourGauge`, `D4Gauge` | FOUR states, K₄ masks, D₄ boundary symmetries |
| `ClosureRuleSystem`, `ClosureMonad`, `Closure2MonadKZ` | monotone closure pulses, one-way settlement, Feistel round oracles |
| `InconsistencySheaf`, `BigradedSettlingCohomology` | truth/inconsistency row separation, leakage channels, observer fingerprints |
| `CohomologicalEquivalence`, `Aperiodic.*` | indistinguishability classes, non-flat regimes, representative hiding |
| `Flow.*`, `LawvereLaplacianSpectralGap`, `FreeEnergyLyapunov` | diffusion/energy/spectral heuristics for stronger permutation rounds |
| `FormalConceptAnalysis`, `LambekCalculus`, `FCALambekCircle` | concept-lattice and residuation tools for typed constraints and round algebra |
| `TemporalTwoCategory`, `YonedaArrowsFirst` | protocol-trace/category-level observers |
| `Collatz.*`, `TransfiniteClosureFlow`, `Ordinal` | nonlinear recurrence and regime/settling-depth heuristics |

Some of these were already directly inspected in the thread; others are identified from the top-level Lean spine and should be fetched/read next before coding against them.

---

## 2. Boolean-field tool: the bit engine

Use `boolField = 𝔽₂` for all actual bit-level cipher machinery:

```text
addition       = xor
multiplication = and
vectors        = Fin n → Bool
linear maps    = Boolean affine/linear diffusion
```

Cryptographic uses:

```text
- LFSR/NLFSR cores
- linear diffusion layers
- key schedules
- affine round constants
- matrix-rank probes
- algebraic degree tracking
- bitsliced implementation
```

Lean target:

```text
RelMath/Crypto/F2Affine.lean
```

Prove or package:

```text
- Boolean vectors as `Vec boolField n`
- xor-linear maps
- affine maps
- matrix-like bit diffusion
- invertibility criterion for small finite maps
```

---

## 3. FOUR tool: evidence-plane geometry

Represent every FOUR cell as:

```text
charge = (positive evidence, negative evidence)
```

Rows:

```text
T   =  P & ~N     truth row
F   = ~P &  N     false row
TOP =  P &  N     inconsistency row
BOT = ~P & ~N     absence/bottom row
```

Cryptographic uses:

```text
- nonlinear state interpretation
- row-separated leakage models
- evidence-preserving masks
- contradiction steganography
- semantic pulse layer
```

Design rule:

```text
FOUR should not replace bits.
FOUR should organize what bit-planes mean.
```

---

## 4. Gauge₂ tool: order-compatible masking

Define:

```text
Gauge₂ = {id, neg} ⊂ K₄
```

Actions:

```text
id(P,N)  = (P,N)
neg(P,N) = (N,P)
```

Properties:

```text
- closed subgroup
- every element self-inverse
- masking and unmasking use same operation
- preserves knowledge order
- flips truth polarity
- leaves paraconsistent inconsistency structure stable
```

Cryptographic uses:

```text
- side-channel masking of FOUR intermediates
- representative hiding inside gauge orbit
- internal mask layer for monotone closure
- semantic masking of intermediate state
```

Lean target:

```text
RelMath/Crypto/Gauge2Mask.lean
```

Prove:

```text
Gauge₂_closed
Gauge₂_self_inverse
Gauge₂_preserves_KLE
Gauge₂_mask_unmask_charge
Gauge₂_mask_unmask_valuation
inconsistencyContent_invariant_under_Gauge₂
truthContent_equivariant_under_neg
```

---

## 5. Full K₄ tool: semantic boundary whitening

Full K₄:

```text
{id, neg, conf, negConf}
```

should be used at boundary stages:

```text
- before/after semantic pulse
- between sponge domains
- between permutation rounds
- as key-dependent whitening
```

because it includes order-reversing actions.

Cryptographic uses:

```text
- semantic whitening
- quotient/representative scrambling
- involutive round-boundary masks
- key schedule disturbance
```

Design rule:

```text
Use full K₄ only when order reversal is intentional.
Use Gauge₂ inside monotone closure.
```

---

## 6. D₄ tool: role/order swapping

D₄ extends K₄ by adding the order-swap involution.

Cryptographic uses:

```text
- domain separation
- protocol role scrambling
- truth/knowledge order exchange
- permutation-round boundary transformations
- adversarial observer simulation
```

Candidate use in `RelPerm-Φ-512`:

```text
Round type r mod 4:
  0: K₄ boundary only
  1: K₄ + swap-coset whitening
  2: K₄ boundary with truth/knowledge observer swap
  3: D₄ full semantic boundary pulse
```

Lean target:

```text
RelMath/Crypto/D4Boundary.lean
```

Prove:

```text
D4 boundary action is a permutation of FOUR
K₄ is the preserve-order-index-2 subgroup
D₄ action preserves unordered pair {KLE,TLE}
boundary whitening is self-inverse for reflection elements
```

---

## 7. Closure-rule tool: semantic round oracle

Closure-rule systems give a monotone immediate-consequence operator:

```text
Tstep(S,v) = v ∨ₖ fire(S,v)
```

Use closure as a lossy nonlinear oracle inside places where non-invertibility is allowed:

```text
- Feistel round function
- stream-cipher state update
- permutation semantic pulse, if folded rather than directly replacing state
- key schedule settling
```

Do **not** use closure itself as the whole cipher, because it is many-to-one.

Cryptographic uses:

```text
- one-way settlement
- derivation-history hiding
- rule-system trapdoors
- key schedule expansion by finite settling
- lossy nonlinear round oracle
```

Lean target:

```text
RelMath/Crypto/ClosureOracle.lean
```

Prove:

```text
semantic_pulse_inflationary
semantic_pulse_monotone
fixed_iteration_reaches_stable_for_finite_FOUR
closure_oracle_well_typed
Gauge₂-compatible fragments commute/equivary with closure
```

---

## 8. Inconsistency-sheaf tool: contradiction channel

The inconsistency sheaf isolates `⊤`-supported content from truth-only content.

Cryptographic uses:

```text
- contradiction-only steganography
- leakage models where truth and inconsistency leak separately
- top-row fingerprints
- row-separated MAC/tag components
- semantic side-channel observables
```

Useful observables:

```text
h0_truth = count(T)
h0_top   = count(TOP)
top_edge = count(TOP xor rotate(TOP))
top_clusters = local cluster statistics of TOP
```

Design role in RelPerm:

```text
fold h0_truth/h0_top/top_edge into round state as low-bandwidth nonlinear observables
```

Do not overuse raw popcount alone; combine with local boundary and rotated masks to avoid simple global-count leakage.

---

## 9. Bigraded cohomology tool: row-separated leakage

The two live rows are:

```text
m=0: truth sheaf
m=1: inconsistency sheaf
m>=2: zero
```

The vertical truth-to-inconsistency differential is zero in the strict model.

Cryptographic interpretation:

```text
truth leakage and inconsistency leakage are orthogonal channels
```

Design use:

```text
RelCrypt should track which row an observable comes from.
```

Candidate domain-separated fold:

```text
H = expand(h_truth, domain=0)
  xor expand(h_false, domain=1)
  xor expand(h_top,   domain=2)
  xor expand(h_edge,  domain=3)
```

Lean target:

```text
RelMath/Crypto/LeakageRows.lean
```

Prove:

```text
truth_row_and_top_row_disjoint
row_observers_have_domain_tags
dv_zero_interpretation_for_crypto_observers
```

---

## 10. Cohomological equivalence tool: indistinguishability classes

The cohomological invariant is:

```text
cohInv(v) = (H⁰, clInv, regime)
```

Crypto reinterpretation:

```text
Two states are observer-indistinguishable if the observer's invariant agrees.
```

This gives nonstandard security notions:

```text
Gauge indistinguishability:
  same Gauge₂ orbit

Row indistinguishability:
  same truth-row observable but different top-row observable

Cohomological indistinguishability:
  same cohInv

Regime indistinguishability:
  same closure regime but different representatives
```

Use this for:

```text
- formal toy secrecy notions
- semantic leakage definitions
- representative-hiding commitments
- dead-drop constructions inside equivalence classes
```

Lean target:

```text
RelMath/Crypto/Observers.lean
```

Define:

```text
Observer α β := α → β
Indist O x y := O x = O y
```

Then instantiate:

```text
GaugeObserver
TruthRowObserver
TopRowObserver
CohInvObserver
RegimeObserver
```

---

## 11. Flow/spectral tools to fetch next

The import spine includes a strong flow/spectral region:

```text
ClosureFlowDynamics
ClosureFlowCurvatureRegime
BlowupClassification
FreeEnergyLyapunov
LawvereLaplacianSpectralGap
Laplacianizability
TransfiniteClosureFlow
```

Crypto hypothesis:

```text
These modules may give better criteria for diffusion, expansion, or bad-round detection.
```

Potential uses:

```text
- define a round-state energy
- detect low-diffusion basins
- tune round constants away from flat regimes
- define spectral-gap-like diffusion score
- classify bad reduced-round dynamics
```

Concrete next read:

```text
RelMath/Flow/LawvereLaplacianSpectralGap.lean
RelMath/Flow/FreeEnergyLyapunov.lean
RelMath/Flow/Laplacianizability.lean
RelMath/Flow/ClosureFlowCurvatureRegime.lean
```

Desired extraction:

```text
- any finite graph/laplacian definitions
- any spectral gap theorem shape
- any Lyapunov decrease/increase law
- any curvature/blowup classification predicate
```

---

## 12. FCA/Lambek tools to fetch next

The import spine includes:

```text
FormalConceptAnalysis
LambekCalculus
FCALambekCircle
```

Crypto hypothesis:

```text
These may give a typed algebra for constraints, contexts, and residuated round logic.
```

Potential uses:

```text
- concept lattice of observables
- classify which state features imply which leakage features
- Lambek-style typed composition of round transformations
- residuated implication as attack/constraint propagation
```

Concrete next read:

```text
RelMath/Order/FormalConceptAnalysis.lean
RelMath/Order/LambekCalculus.lean
RelMath/Order/FCALambekCircle.lean
```

Possible RelCrypt use:

```text
build an attack lattice:
  objects = observables
  attributes = distinguishers
  concepts = stable leakage classes
```

---

## 13. Aperiodic/MLD tools to fetch next

The import spine contains a rich aperiodic region:

```text
Aperiodic.Classification
AndersonPutnam
Witness.JeandelRao
Autopoiesis
Moduli
SynonymyAntonymy
Universality
CoClassifying
CohomologicalEquivalence
```

Crypto hypothesis:

```text
Aperiodic modules can help generate nonrepeating round constants and classify representative hiding.
```

Potential uses:

```text
- aperiodic round constants
- MLD-style equivalence of internal state histories
- representative hiding in large equivalence classes
- nonperiodic key schedules
- reduced-round nonrepetition checks
```

Concrete next read:

```text
RelMath/Aperiodic/Moduli.lean
RelMath/Aperiodic/Autopoiesis.lean
RelMath/Aperiodic/Universality.lean
RelMath/Aperiodic/CohomologicalEquivalence.lean
```

---

## 14. TQFT/value tools to fetch next

The import spine includes:

```text
Value.SettlingOverValueCategory
Value.SettlingFrobeniusTQFT
Value.Optimization
CurryHowardLambekQuartet
```

Crypto hypothesis:

```text
These may help define compositional round traces, duality, Frobenius copy/delete structures, and proof/circuit correspondences.
```

Potential uses:

```text
- round composition as value-category morphisms
- Frobenius-style split/merge layers
- typed encryption/decryption duality
- circuit semantics for RelPerm
```

Concrete next read:

```text
RelMath/Value/SettlingFrobeniusTQFT.lean
RelMath/CurryHowardLambekQuartet.lean
RelMath/Value/Optimization.lean
```

---

## 15. Immediate Lean work package

The next Lean additions should not try to prove security. They should prove structural scaffolding.

### Package A: `Crypto/Gauge2Mask.lean`

```text
Define Gauge₂
Prove subgroup closure
Prove self-inverse masks
Prove KLE preservation
Prove valuation masking/unmasking
Prove inconsistency invariant/equivariant lemmas
```

### Package B: `Crypto/Feistel.lean`

Generic theorem:

```text
For any F : R → K → L,
FeistelRound is invertible.
```

Then:

```text
n-round Feistel is invertible by reverse rounds
```

This lets lossy settling oracles live inside reversible shells.

### Package C: `Crypto/Observer.lean`

```text
Observer α β := α → β
Indist O x y := O x = O y
```

Prove:

```text
Indist is an equivalence relation
observer refinement
product observers
quotient observers
```

Instantiate with:

```text
Gauge₂ orbit observer
truth-row observer
top-row observer
cohomological observer
```

### Package D: `Crypto/SemanticPulseToy.lean`

A tiny finite version:

```text
state = fixed small vector of Charges
pulse = Gauge₂ mask → monotone closure → observer extraction
```

Prove:

```text
pulse is inflationary
pulse is monotone
observer rows are disjoint
Gauge₂-compatible fragment is equivariant
```

---

## 16. Immediate Python work package

Next Python should not just add rounds. It should add attack tooling.

### For `RelPerm-Φ-512`

```text
- reduced-round invariant-subspace search
- differential trail sampler
- rotational symmetry probe
- algebraic normal form degree estimator on mini versions
- SAT/SMT reduced-round distinguisher
- state-recovery attempt from keystream
```

### For side-channel masking

```text
- Hamming-weight leakage simulator
- masked vs unmasked FOUR intermediate correlation
- Gauge₂ mask-refresh experiment
- compare raw P/N leakage vs orbit leakage
```

### For cohomological observers

```text
- train distinguishers given only h_truth/h_top/h_edge
- test whether row-observables leak key/nonce structure
- measure mutual information between observables and state bits
```

---

## 17. Updated RelCrypt design thesis

The stronger thesis is:

```text
RelCrypt should be a typed observer calculus for cryptographic state.
```

At the algorithm level:

```text
RelPerm-Φ is a permutation whose nonlinear layer is partly generated by
Gauge₂-masked FOUR settling observables.
```

At the formal level:

```text
Lean proves which transformations preserve which orders, rows, and observers.
```

At the cryptanalytic level:

```text
Python searches for distinguishers, bad orbits, weak regimes, and leakage.
```

At the gremlin level:

```text
Secrets are not only bitstrings.
Secrets are representative choices inside gauge/cohomology/settling equivalence classes.
```

---

## 18. Practical next move

The best next move is:

```text
Read Flow + FCA/Lambek + Aperiodic/Moduli modules.
Extract one new concrete primitive from each.
Then implement RelPerm-Φ-512b with:
  - spectral/energy diffusion score from Flow
  - concept-lattice leakage classifier from FCA
  - aperiodic round constants from Aperiodic
```

This is the path from “weird stream toy” to an actual RelMath-native cryptographic research program.
