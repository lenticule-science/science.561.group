# RelCrypt-Σ2-SIV-24 Attack and Evaluation Plan

**Status:** research plan.  
**Goal:** attack the frozen Σ2-SIV branch before adding more ornament.

---

## 1. Principle

Do not add more RelMath machinery until the current branch has survived basic attacks.

Current target:

```text
RelCrypt-Σ2-SIV-24
```

The central question:

```text
What hidden structure did the RelMath layer introduce?
```

Novel algebra is dangerous because it can create:

```text
- invariant subspaces
- low algebraic degree
- exploitable symmetries
- differential clusters
- linear approximations
- representation leakage
- related-key or related-nonce patterns
```

---

## 2. Reduced models

Create mini versions:

```text
Σ2-mini-8
Σ2-mini-12
Σ2-mini-16
Σ2-mini-24
Σ2-mini-32
```

Each should preserve the same conceptual layers:

```text
𝔽₂ flow bridge
FOUR planes
Gauge₂ mask
scratch closure pulse
balanced K₄ rail code
observer fingerprint
generalized Feistel shell
```

but shrink word size and branch count enough for exact analysis.

---

## 3. Algebraic normal form analysis

For each mini model:

```text
- compute coordinate ANFs
- measure algebraic degree per round
- measure monomial counts
- detect coordinates with anomalously low degree
- compare Ω/Σ/Σ2 variants
```

Target behavior:

```text
degree grows quickly and reaches the model ceiling
no coordinate remains unexpectedly low-degree
```

Specific tests:

```text
round 1..8 exact ANF for mini-8 and mini-12
sampled/partial ANF for mini-16+
```

---

## 4. Differential analysis

For reduced models:

```text
- exact DDT where feasible
- sampled DDT for larger minis
- fixed low-weight input differences
- branch-local differences
- FOUR-row-specific differences
- Gauge₂ orbit differences
- top-row differences
```

Track:

```text
max differential probability
number of high-probability trails
whether semantic rows create clusters
whether balanced representation changes trails
```

Special deltas:

```text
single-bit
single-branch
single-FOUR-cell polarity
top-vs-bottom class
truth-vs-false class
Gauge₂ representative flip
K₄ boundary flip
```

---

## 5. Linear analysis

For mini models:

```text
- exact LAT where feasible
- sampled input/output masks
- low-Hamming-weight masks
- row-aligned masks
- rail-aligned masks
```

Track:

```text
maximum absolute correlation
persistence across rounds
whether observer fingerprints leak linear combinations
```

---

## 6. Invariant subspace search

Search for affine or structured subspaces preserved by the permutation.

Candidate subspaces:

```text
all branches equal
one branch zero
top row empty
truth row empty
P=N
P=~N
balanced rails symmetric
Gauge₂-fixed representatives
K₄ orbit classes
rotationally symmetric states
```

Methods:

```text
- random subspace sampling
- exact small-model enumeration
- Gröbner/SAT/SMT encoding for reduced rounds
- closure under permutation testing
```

---

## 7. Rotational and slide probes

Because the permutation uses rotates and round constants:

```text
- test rotational pairs
- test shifted branch states
- test round-constant slide relations
- test counter/nonce domain separation
```

Measure:

```text
output rotational correlation
round-to-round structural similarity
whether constants break symmetry sufficiently
```

---

## 8. State-recovery attempts

For stream/SIV components:

```text
- known keystream recovery in non-SIV stream mode
- reduced-round state recovery
- guess-and-determine branch recovery
- SAT attacks on mini states
- meet-in-the-middle on reduced rounds
```

Even though SIV mode uses MAC-derived synthetic IVs, the underlying permutation/stream primitive should still be attacked independently.

---

## 9. SIV-mode tests

Mode-level tests:

```text
- tamper rejection
- wrong AD rejection
- wrong nonce rejection
- tag truncation behavior
- nonce reuse with distinct plaintexts
- deterministic equality under same key/nonce/AD/plaintext
- empty plaintext
- empty AD
- partial final blocks
```

Nonce-reuse expectation:

```text
Distinct messages under the same nonce should not satisfy:
  ct1 xor ct2 = pt1 xor pt2
```

Determinism expectation:

```text
Same key, nonce, AD, plaintext gives same ciphertext and tag.
```

---

## 10. Side-channel representation tests

Balanced FOUR + K₄ rail permutation was introduced because raw FOUR leaks.

Continue testing:

```text
- first-order Hamming-weight leakage
- fixed-rail leakage
- second-order leakage
- Hamming-distance leakage
- transition leakage between rounds
- mask-refresh effectiveness
```

Compare:

```text
raw two-bit FOUR
raw + Gauge₂
raw + full K₄
balanced FOUR
balanced FOUR + K₄ rail permutation
Boolean sharing of balanced rails
```

Critical warning:

```text
Constant weight does not imply side-channel security.
```

It only fixes a first-order representation defect.

---

## 11. Ablation gates

For every proposed mutation:

```text
keep it only if it improves at least one attack metric
without making another major metric worse.
```

Core ablations:

```text
no Gauge₂
no K₄ rail permutation
no balanced FOUR
no observer fingerprint
no closure pulse
no flow bridge
no adjoint gap
reduced closure rounds
different Feistel branch count
different rate/capacity
```

Current expectation:

```text
flow bridge is mandatory
balanced FOUR + K₄ rail permutation is representation-positive
nuclear commutator is not currently core
Chu/FCA-style observer needs more evidence
```

---

## 12. External test batteries

Eventually run:

```text
PractRand-style streaming tests
NIST STS-style tests
TestU01-style batteries
dieharder-style batteries
```

These do not prove security, but they catch embarrassing statistical failures.

---

## 13. Success criteria for next phase

Σ2-SIV moves from “toy branch” to “serious experimental candidate” only after:

```text
1. frozen spec and vectors exist
2. independent reimplementation matches vectors
3. reduced models show healthy algebraic degree growth
4. no simple invariant subspaces are found
5. reduced differential/linear probes are not embarrassing
6. side-channel representation story is honestly documented
7. Lean scaffolding proves the structural invariants
```

Until then:

```text
Do not use for production cryptography.
Do not claim security.
Do attack it hard.
```
