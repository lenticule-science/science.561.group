# RelCrypt Algorithm Sketches

**Status:** research-cipher / mathematics-lab specification, not production cryptography.  
**Source mathematics:** `emsenn/relational-math`, especially the formalized Boolean field `𝔽₂`, FOUR-valued charges, Klein-four gauge `K₄`, dihedral FOUR gauge `D₄`, closure/settling, truth/inconsistency row separation, and cohomological observables.  
**Generated:** 2026-06-23

This document records the encryption-algorithm designs developed in the RelCrypt Python experiments, but omits Python source code. It is meant as a working cryptographic design note: enough structure to discuss, reimplement, formalize, attack, mutate, or hand to another agent.

None of these algorithms should be used to protect real secrets. They are candidate constructions for research, mathematical exploration, and adversarial testing.

---

## 0. Mathematical primitives

### 0.1 Boolean field `𝔽₂`

The bit-level substrate is the Boolean field:

- carrier: `{0, 1}`
- addition: XOR
- multiplication: AND
- additive inverse: identity
- multiplicative identity: `1`

This is the correct layer for:

- LFSR-style recurrence
- nonlinear feedback
- affine diffusion
- bitwise masking
- stream-cipher keystream generation
- Feistel/SPN block-cipher plumbing

The core rule we adopted:

> Let `𝔽₂` do bit algebra. Do not force FOUR/K₄ to pretend it is a bit field.

### 0.2 FOUR charges as bit-pairs

A FOUR charge is represented by a pair of evidence bits:

```text
charge = (pos, neg)
```

with the usual four states:

```text
00 = kBot / ⊥ₖ / no evidence
10 = tTop / true-side evidence
01 = tBot / false-side evidence
11 = kTop / ⊤ₖ / inconsistent / both evidence
```

This representation makes FOUR sit naturally above `𝔽₂²`.

### 0.3 K₄ gauge actions

The Klein-four group `K₄ = {id, neg, conf, negConf}` acts on a FOUR charge.

Given a charge `(p, n)`:

```text
id      (p, n) = ( p,  n)
neg     (p, n) = ( n,  p)        -- bilattice negation / slot swap
conf    (p, n) = (!n, !p)        -- conflation / complemented swap
negConf (p, n) = (!p, !n)        -- coordinatewise complement
```

Each element is self-inverse:

```text
g(g(x)) = x
```

This is useful for masking because the same action masks and unmasks.

### 0.4 D₄ extension

The D₄/dihedral extension adds order-swapping transformations. In the current research ciphers, D₄ is treated as an optional richer semantic mask layer, while K₄ remains the cleaner side-channel-style involutive masking layer.

D₄ is more useful for:

- semantic role obfuscation
- truth/knowledge order exchange
- adversarial observer experiments
- block-cipher round-function gremlins

K₄ is more useful for:

- involutive masking
- masking/unmasking symmetry
- compact 2-bit mask schedules
- stream cipher state dressing

### 0.5 Settling / closure observables

The algorithms use small toy versions of closure/settling:

- local evidence-neighbor propagation
- truth-row count
- inconsistency-row count
- top-boundary count
- fixed finite iteration to a local stable state

These are not direct Lean extractions. They are Python toys inspired by the formal shape of closure and sheaf/cohomology layers.

The important design choice is:

> Closure/settling is not used as the whole cipher, because closure is many-to-one. It is used inside keystream generation or round functions, where non-invertibility is allowed.

---

## 1. Design failure: direct K₄ plaintext masking

The first naive construction was:

```text
plaintext bits
→ pair into FOUR cells
→ generate K₄ masks
→ apply K₄ masks directly
→ serialize resulting FOUR cells as ciphertext
```

This is mathematically elegant but cryptographically bad.

### Failure mode

For zero plaintext, each plaintext charge is `00 = kBot`.

Under K₄:

```text
id(kBot)      = kBot
neg(kBot)     = kBot
conf(kBot)    = kTop
negConf(kBot) = kTop
```

So a zero plaintext only emits `{kBot, kTop}` and never emits the classical middle states `{t, f}`.

That leaks structure immediately.

### Conclusion

K₄ should not be the sole ciphertext transformation.

Instead:

```text
K₄ masks internal semantic state.
𝔽₂ keystream handles ciphertext XOR.
```

---

## 2. RelMask-LFSR

RelMask-LFSR is the simplest corrected architecture.

### Purpose

A pedagogical stream-cipher toy showing how a Boolean-field keystream and K₄ semantic masking can coexist.

### State

```text
LFSR state: n bits over 𝔽₂
K₄ mask state: derived from pairs of LFSR output bits
FOUR internal state: plaintext/ciphertext bits paired into charges
```

### Keystream generation

An LFSR produces a bitstream:

```text
s_0, s_1, s_2, ...
```

Every two bits form a K₄ mask selector:

```text
00 → id
01 → neg
10 → conf
11 → negConf
```

### Encryption

```text
plaintext bits P
keystream bits K
ciphertext C = P xor K
```

The K₄ layer is applied internally to semantic state derived from the same stream, but the final encryption operation is ordinary XOR.

### Decryption

```text
P = C xor K
```

### Status

Pedagogical only.

Pure LFSRs are linear and breakable. The point of this construction is architectural separation:

```text
𝔽₂ recurrence outside
K₄ semantic mask outside/around it
```

---

## 3. RelStream-v4

RelStream-v4 was the first statistically decent corrected stream cipher toy.

### Purpose

Use K₄ and FOUR not as direct ciphertext operators, but as nonlinear semantic state dressing for a Boolean keystream generator.

### State

```text
core state: several 64-bit words over 𝔽₂
semantic state: 32 FOUR cells represented by two bit-planes
gauge schedule: K₄ masks derived from state words
nonce/key material: absorbed into the initial state
```

### High-level keystream step

Each step:

```text
1. update Boolean-field recurrence
2. derive K₄ mask selectors from state bits
3. interpret selected state bits as FOUR cells
4. apply K₄ masks to FOUR state
5. compute local truth/inconsistency observables
6. fold observables back into Boolean state
7. emit keystream word
```

### Encryption

```text
C_i = P_i xor stream_i
```

### Decryption

```text
P_i = C_i xor stream_i
```

### Smoke-test results

On a 256 KiB sample:

```text
roundtrip: passed
monobit z:        roughly -0.55
byte chi-square:  roughly 246.5 for 255 df
entropy:          roughly 7.9993 bits/byte
key avalanche:    roughly 50.03%
```

### Interpretation

RelStream-v4 demonstrated that the corrected architecture can produce AES-CTR-like first-pass statistical smoke-test results, though very slowly in pure Python.

---

## 4. RelStreamV5

RelStreamV5 is the current preferred stream-cipher candidate from the bitsliced workbench.

### Purpose

A faster bitsliced RelCrypt stream cipher using:

- Boolean-field core recurrence
- K₄ involutive semantic masking outside the `𝔽₂` core
- FOUR bit-plane interpretation
- local closure/cohomology observables
- XOR stream encryption

### State layout

A suggested abstract state:

```text
A, B, C, D : 64-bit words
E, F       : 64-bit semantic/gauge words
counter    : 64-bit block counter
nonce      : 64-bit or 96-bit nonce material
```

The Python toy used word-parallel operations over machine words rather than object-level FOUR cells.

### Bit-plane representation of FOUR

A vector of FOUR cells is represented by two bit planes:

```text
P = positive evidence plane
N = negative evidence plane
```

For cell index `i`:

```text
charge_i = (bit(P, i), bit(N, i))
```

### K₄ bitsliced action

Given mask selector planes `M0, M1`, choose per-lane K₄ actions:

```text
00 → id
01 → neg
10 → conf
11 → negConf
```

Bitsliced action on evidence planes:

```text
id:      (P, N) → ( P,  N)
neg:     (P, N) → ( N,  P)
conf:    (P, N) → (~N, ~P)
negConf: (P, N) → (~P, ~N)
```

The implementation can realize this branchlessly with bitwise select masks.

### Local settling toy

Compute local semantic observables from the FOUR bit-planes:

```text
truth plane          T  =  P & ~N
false plane          F  = ~P &  N
inconsistency plane  TOP = P & N
bottom plane         BOT = ~P & ~N
```

A small local closure step may include neighbor mixing, e.g.:

```text
neighbor_TOP = rotl(TOP, a) xor rotr(TOP, b)
neighbor_T   = rotl(T, c)   xor rotr(T, d)
P' = P xor nonlinear_mix(neighbor_T, TOP, key_word)
N' = N xor nonlinear_mix(neighbor_TOP, F, key_word)
```

The exact Python toy used local closure-inspired bitwise mixing, not a canonical Lean-derived closure operator.

### H⁰-style observables

Use population counts of semantic rows:

```text
h0_truth = popcount(T)
h0_top   = popcount(TOP)
boundary_top = popcount(TOP xor rotl(TOP, 1))
```

These are folded into the Boolean-field state.

### Keystream step sketch

One step of RelStreamV5:

```text
input: state S, counter ctr

1. advance Boolean recurrence over 64-bit words
2. derive FOUR planes P,N from mixed state words
3. derive K₄ selector planes M0,M1
4. apply bitsliced K₄ action to P,N
5. compute T, F, TOP, BOT planes
6. compute h0_truth, h0_top, boundary_top
7. fold these observables into state words
8. run final affine/nonlinear diffusion
9. emit 64-bit keystream word
10. increment counter
```

### Encryption

For byte string `P`:

```text
K = generated keystream of len(P)
C = P xor K
```

### Decryption

Same operation:

```text
P = C xor K
```

### Backend smoke-test results

On 512 KiB sample:

```text
entropy:          7.9996846 bits/byte
monobit z:        0.6533
byte chi-square:  229.46
serial corr:     -0.000351
key avalanche:    49.992%
nonce avalanche:  49.978%
pure Python speed: 0.858 MB/s
```

Extra probes:

```text
linear complexity over 8192 bits: 4098
matrix-rank distribution:
  rank30 = 20
  rank31 = 70
  rank32 = 38
runs-test p approx: 0.645
```

### Interpretation

RelStreamV5 is the current best branch.

It is not secure, but it has the best balance so far:

```text
simple enough to reason about
bitsliced enough to optimize
weird enough to preserve RelMath structure
statistically clean enough to continue
```

---

## 5. RelStreamV6

RelStreamV6 was a heavier variant.

### Purpose

Test whether more intense internal semantic closure and re-gauging improves the stream.

### Difference from V5

Compared to V5, V6 adds:

```text
- extra truth/inconsistency closure passes
- internal re-gauging after closure
- heavier fold-back of semantic observables
- more dependence between neighboring FOUR lanes
```

### Backend smoke-test results

On 512 KiB sample:

```text
entropy:          7.9996823 bits/byte
monobit z:        1.5547
byte chi-square:  230.997
serial corr:      0.000452
key avalanche:    50.014%
nonce avalanche:  49.970%
pure Python speed: 0.491 MB/s
```

Extra probes:

```text
linear complexity over 8192 bits: 4097
matrix-rank distribution:
  rank29 = 1
  rank30 = 15
  rank31 = 75
  rank32 = 37
runs-test p approx: 0.916
```

### Interpretation

V6 did not clearly improve statistical probes over V5 and was meaningfully slower.

Current conclusion:

```text
Prefer V5.
Keep V6 as a mutation source, not the main candidate.
```

---

## 6. RelFeistel-32

RelFeistel-32 is the block-cipher toy branch.

### Purpose

Use lossy RelMath-inspired settling inside a reversible Feistel shell.

This is important because closure/settling is many-to-one, but Feistel round functions do not need to be invertible.

### Block size

```text
block = 32 bits
left  = 16 bits
right = 16 bits
```

### Round structure

For round `r`:

```text
L, R = R, L xor F(R, round_key_r)
```

### Round function `F`

The experimental round function used:

```text
1. interpret R as 8 FOUR cells
2. apply keyed D₄/K₄ actions
3. run local closure/settling toy
4. compute truth/inconsistency observables
5. diffuse back to 16 Boolean bits
```

### Decryption

Feistel decryption runs the same rounds in reverse key order.

### Backend results

Invertibility:

```text
10,000 random encrypt/decrypt trials: passed
```

Avalanche:

```text
rounds | avg flipped output bits / 32
2      | 12.47
4      | 16.01
6      | 16.01
8      | 16.00
12     | 16.01
16     | 16.01
```

### Interpretation

This construction is mathematically promising, because it lets closure/settling remain non-invertible while the whole block cipher remains invertible.

But 32-bit block size is much too small for practical use.

Next block-cipher step:

```text
RelFeistel-128
```

with four 32-bit or two 64-bit branches.

---

## 7. RelCrypt-Flow-32

RelCrypt-Flow-32 is the heavier block-cipher toy using closure/cohomology/regime-like observables.

### Purpose

Move beyond tiny FOUR S-boxes and use heavier RelMath structure as the round oracle.

### Round oracle uses

```text
- D₄ gauge action on FOUR cells
- local closure-rule firing to fixed point
- truth-row observable
- inconsistency-row observable
- H⁰-style counts
- aperiodic-ish local perturbation
- F₂ diffusion
```

### Structure

```text
32-bit Feistel
round oracle = closure/cohomology/regime flavored function
```

### Backend results

Avalanche:

```text
rounds | invertible | avg avalanche
4      | yes        | 11.86 / 32
6      | yes        | 14.22 / 32
8      | yes        | 14.72 / 32
10     | yes        | 15.56 / 32
12     | yes        | 15.64 / 32
16     | yes        | 16.06 / 32
```

Sampled differential probe:

```text
6 rounds   worst sampled differential ≈ 0.205
8 rounds   worst sampled differential ≈ 0.059
10 rounds  worst sampled differential ≈ 0.019
12 rounds  worst sampled differential ≈ 0.010
16 rounds  worst sampled differential ≈ 0.00125
```

### Interpretation

RelCrypt-Flow-32 was the first construction that felt truly native to the heavier math.

However, it remains a toy because of block size and loose specification.

---

## 8. Candidate family summary

### Stream candidates

```text
RelMask-LFSR:
  pedagogical; structurally clear; cryptographically weak

RelStream-v4:
  first corrected decent stream toy

RelStreamV5:
  current preferred stream-cipher candidate

RelStreamV6:
  heavier semantic variant; slower; not clearly better
```

### Block candidates

```text
RelFeistel-32:
  simple FOUR/K₄/D₄ Feistel; invertible; good avalanche after 4+ rounds

RelCrypt-Flow-32:
  heavier closure/cohomology Feistel; better native RelMath flavor
```

---

## 9. Current best design

The current best candidate is:

```text
RelStreamV5
```

Reason:

```text
- keeps 𝔽₂ as the fundamental algebra
- puts K₄ outside as a semantic/gauge masking discipline
- uses FOUR bit-planes efficiently
- folds settling/cohomology-style observables into the keystream
- has clean first-pass statistical results
- is simpler and faster than V6
```

The current best block-cipher research direction is:

```text
RelCrypt-Flow-128
```

not yet implemented in this document, but naturally extending `RelCrypt-Flow-32`.

---

## 10. Next algorithmic mutations

### 10.1 Bitsliced K₄ with masked implementation discipline

Because every K₄ element is self-inverse, implement K₄ masking as a first-class masking discipline:

```text
state' = act(mask, state)
state  = act(mask, state')
```

Research question:

```text
Can K₄ masks reduce side-channel leakage of FOUR-state intermediate values?
```

### 10.2 RelStreamV5-ARX

Add ARX-like operations:

```text
add mod 2^64
rotate
xor
```

while preserving the `𝔽₂` interpretation for the semantic layer.

### 10.3 RelCrypt-Flow-128

Upgrade block toy:

```text
block size: 128 bits
rounds: 16+
round oracle:
  D₄/K₄ action
  local settling
  truth/inconsistency H⁰ observables
  F₂ diffusion
```

### 10.4 Cohomological key schedule

Instead of ordinary key expansion, treat the key schedule as a settling process:

```text
master key
→ seed valuation
→ closure/settling
→ cohomological observables
→ round keys
```

### 10.5 Aperiodic round constants

Generate round constants from aperiodic/MLD-inspired recurrence rather than simple counters.

Goal:

```text
Avoid overly regular round structure.
Encode non-periodic settling fingerprints into round constants.
```

---

## 11. Security caveats

These are not production ciphers.

The current tests are smoke tests only:

```text
- monobit balance
- byte chi-square
- entropy
- serial correlation
- avalanche
- small linear complexity probe
- matrix-rank distribution
- runs test
- sampled differential probe for block toys
```

Missing:

```text
- full differential cryptanalysis
- linear cryptanalysis
- algebraic attacks
- correlation attacks
- state recovery attacks
- nonce misuse analysis
- related-key analysis
- rotational attacks
- SAT/SMT attacks
- side-channel analysis
- formal proof of security
```

The purpose of the current family is not to claim security.

The purpose is to find algorithmic shapes where RelMath contributes nontrivially to cipher design.

---

## 12. One-line design thesis

```text
RelCrypt keeps 𝔽₂ as the bit engine, uses FOUR as the evidence geometry,
uses K₄/D₄ as semantic gauge masking, and uses settling/cohomology observables
as nonlinear state-shaping structure.
```

The promising shape is not:

```text
FOUR replaces bits.
```

It is:

```text
FOUR organizes what the bit engine is allowed to mean.
```
