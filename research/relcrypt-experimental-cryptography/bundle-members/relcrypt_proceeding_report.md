# RelCrypt Proceeding Report: Φ-512b + Lean Scaffold
**Status:** research-cipher workbench update, not production cryptography.

This pass did three things:

1. Made a concrete `RelPerm-Φ-512b` / `RelStream-Φ-512b` mutation.
2. Re-ran comparable 32 KiB smoke tests against the previous `RelPerm-Φ-512`.
3. Packaged draft Lean scaffolding modules for `Gauge₂`, observer indistinguishability, generic Feistel invertibility, and a tiny semantic-pulse target.

The fresh GitHub connector was not available in this turn, so this pass uses the repo material already fetched earlier in-thread plus the top-level import spine and previous workbench artifacts.

---

## 1. What changed in Φ-512b

`Φ-512b` keeps the core RelCrypt discipline:

```text
𝔽₂ bit engine
FOUR evidence-plane lift
Gauge₂ = {id, neg} inside monotone closure
full K₄ only at semantic boundary whitening
settling/cohomology-style row observables folded back into Boolean state
```

New additions:

```text
aperiodic constants:
  deterministic Thue-Morse / paperfolding / Collatz-ish constant generator

flow/curvature masks:
  local gradients of P/N, truth edges, top-boundaries, interface energy

FCA-style observer fingerprint:
  finite semantic predicates over truth/top/bottom/edge counts compressed into a round word

extra Gauge₂ refresh:
  representative swap after each local closure pulse, still avoiding full K₄ inside monotone closure
```

Design intent:

```text
Use more of the repo’s later mathematical vocabulary:
  aperiodic/moduli → constants
  flow/curvature → diffusion heuristics
  FCA/observer concepts → leakage/attribute fingerprint
```

---

## 2. Comparable smoke-test results

Sample size here is 32 KiB for both old and new variants. These are smoke tests only.

| rounds | old entropy | b entropy | old chi² | b chi² | old speed MB/s | b speed MB/s | old perm avalanche | b perm avalanche |
|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 8 | 7.994277 | 7.993895 | 258.81 | 276.72 | 0.345 | 0.189 | 256.27/512 | 256.78/512 |
| 12 | 7.993832 | 7.995065 | 280.11 | 224.02 | 0.222 | 0.131 | 256.05/512 | 255.73/512 |
| 16 | 7.994033 | 7.993550 | 269.75 | 292.38 | 0.185 | 0.099 | 256.50/512 | 256.26/512 |
| 20 | 7.994241 | 7.995151 | 260.67 | 218.77 | 0.148 | 0.081 | 255.78/512 | 256.02/512 |

### Φ-512b detailed run

| rounds | invertible | roundtrip | entropy | monobit z | chi² | serial corr | key avalanche | nonce avalanche | speed MB/s | perm avalanche |
|---:|:---:|:---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 8 | True | True | 7.993895 | -0.871 | 276.72 | 0.001958 | 50.138% | 50.132% | 0.189 | 256.78/512 |
| 12 | True | True | 7.995065 | -0.156 | 224.02 | 0.005201 | 49.923% | 50.014% | 0.131 | 255.73/512 |
| 16 | True | True | 7.993550 | 1.566 | 292.38 | 0.006401 | 49.931% | 50.016% | 0.099 | 256.26/512 |
| 20 | True | True | 7.995151 | -0.984 | 218.77 | -0.001050 | 49.868% | 50.034% | 0.081 | 256.02/512 |

---

## 3. Interpretation

`Φ-512b` is **not an obvious replacement** for `Φ-512`.

Good:

```text
- permutation inverse tests passed
- stream roundtrip passed
- avalanche remains near ideal
- 12- and 20-round chi-square improved in this 32 KiB comparison
- 20-round serial correlation was very small
```

Bad / mixed:

```text
- substantially slower than Φ-512
- 16-round chi-square worsened
- entropy differences are within small-sample noise
- complexity increased
```

Current branch status:

```text
main branch:
  RelPerm-Φ-512/20

mutation branch:
  RelPerm-Φ-512b/20

do not merge b wholesale yet
```

The useful thing in `b` is probably not the whole design. The useful pieces are:

```text
1. aperiodic/domain constants
2. flow/edge/top-boundary masks
3. FCA-style observer fingerprint
4. post-pulse Gauge₂ refresh
```

These should be ablated individually.

---

## 4. Lean scaffold packaged

The scaffold ZIP contains:

```text
README.md
RelMath/Crypto/Gauge2Mask.lean
RelMath/Crypto/Observer.lean
RelMath/Crypto/Feistel.lean
RelMath/Crypto/SemanticPulseToy.lean
```

### Intended proof targets

`Gauge2Mask.lean`

```text
Gauge₂ = {id, neg}
closed under K₄ multiplication
self-inverse masks
mask/unmask charge
mask/unmask valuation
KLE preservation
truth-order reversal by neg
```

`Observer.lean`

```text
Observer α β := α → β
Indist O x y := O x = O y
Indist is an equivalence relation
observer refinement / factorization
product observers
```

`Feistel.lean`

```text
generic Feistel round
generic inverse round
proof: inverse(round(x)) = x
proof: round(inverse(x)) = x
```

`SemanticPulseToy.lean`

```text
Pulse := Valuation → Valuation
Inflationary and monotone definitions
truth/top row observers
maskedPulse using Gauge₂
well-typedness scaffold
```

These are scaffolds, not a claim that they compile unchanged in the private repo. They are meant to be the next Lean edit pass.

---

## 5. Next move

Do not add more complexity to Φ-512b yet.

Run ablations:

```text
A: Φ-512 + aperiodic constants only
B: Φ-512 + flow/edge masks only
C: Φ-512 + FCA fingerprint only
D: Φ-512 + Gauge₂ refresh only
E: combine the winners
```

Then attack:

```text
- reduced-round distinguisher search
- invariant-subspace search
- algebraic-degree growth on mini variants
- state-recovery attempts from keystream
- row-observer leakage/mutual-information probes
- Gauge₂ side-channel toy leakage simulation
```

The next best artifact is an **ablation harness**, not another monolithic cipher variant.
