# RelCrypt-Ψ-1024x Hardcore Weird Report

**Status:** research cipher / gremlin cryptography workbench, not production cryptography.  
**Artifact:** `RelPerm-Ψ-1024x` + `RelDuplex-Ψ`  
**Backend run:** Python, pure interpreter, no external crypto backend.

## What got built

This iteration builds a new branch beyond Φ-512:

```text
RelPerm-Ψ-1024x
  1024-bit generalized-Feistel permutation
  state = 16 × 64-bit words
  round oracle = RelMath semantic observer

RelDuplex-Ψ
  AEAD-like duplex mode over RelPerm-Ψ-1024x
  associated data acts as an observer/domain label
  ciphertext is absorbed back into state
  tag = semantic squeeze of final state
```

The guiding discipline remains:

```text
𝔽₂ does bit recurrence/diffusion.
FOUR supplies evidence-plane geometry.
Gauge₂ = {id, neg} masks inside monotone closure.
Full K₄/D₄ act at semantic boundaries.
Settling/cohomology/FCA/flow observables shape the round oracle.
```

## The round oracle

A Ψ round oracle takes the right half of a Feistel state:

```text
R : 8 × 64-bit words
```

and emits:

```text
F(R) : 8 × 64-bit words
```

Internally it does:

```text
1. Lift selected R-word mixtures into FOUR evidence planes:
     P = positive evidence plane
     N = negative evidence plane

2. Apply Gauge₂ internal masking:
     id  : (P,N) ↦ (P,N)
     neg : (P,N) ↦ (N,P)

3. Run three lossy local closure pulses:
     T   =  P & ~N
     F   = ~P &  N
     TOP =  P &  N
     BOT = ~P & ~N

4. Extract cohomological/observer fingerprints:
     truth count
     false count
     top/inconsistency count
     top boundary
     concept/FCA-style row intersections
     flow-gradient / curvature-ish boundary energy

5. Apply full K₄ boundary whitening.

6. Apply D₄-ish order-swap boundary action.

7. Fold back into 𝔽₂ words.

8. Ψ-1024x patch:
     add a flow bridge from raw R words into all F outputs.
```

This makes closure/settling an internal nonlinear observer, not the whole cipher.

    ## The useful failure: raw Ψ was too semantic

    The first Ψ-1024 build was more RelMath-pure, but it had a nasty corner: closure saturation could erase dependency on some right-half input bits, so several permutation avalanche samples had a **minimum of 1 changed bit** even after many rounds.

    Example from the initial Ψ-1024 4 KiB probe:

    | rounds | old avg/min/max changed bits |
    |---:|---:|
    | 6 | 430.3/1/539 |
    | 10 | 464.2/1/526 |
    | 14 | 388.2/1/546 |
    | 18 | 467.2/1/535 |

    That is not acceptable even for a toy. The `x` patch adds a **flow bridge**: an explicit 𝔽₂/ARX-ish dependency bridge from the raw right-half words into every semantic oracle output. The weird FOUR/settling observer still supplies nonlinearity, but the bit engine now guarantees dependency cannot vanish just because a closure pulse saturated.

    After the patch, the 4 KiB probe became:

    | rounds | entropy | chi² | monobit z | key av. | nonce av. | perm av. avg/min/max | speed MB/s |
|---:|---:|---:|---:|---:|---:|---:|---:|
| 6 | 7.956834 | 243.75 | -1.028 | 49.964% | 50.491% | 519.6/483/563 | 0.0144 |
| 10 | 7.947596 | 296.38 | -0.707 | 49.824% | 49.970% | 514.2/488/551 | 0.0089 |
| 14 | 7.948730 | 290.50 | -0.696 | 49.749% | 50.194% | 512.7/482/538 | 0.0066 |
| 18 | 7.954710 | 251.25 | -0.365 | 49.752% | 49.985% | 511.4/476/531 | 0.0052 |


## Chosen branch probe: Ψ-1024x/18 at 16 KiB

The larger single-branch check used 16 KiB of zero plaintext as a keystream/statistical sample.

| rounds | entropy | chi² | monobit z | key av. | nonce av. | perm av. avg/min/max | speed MB/s |
|---:|---:|---:|---:|---:|---:|---:|---:|
| 18 | 7.989682 | 234.69 | -0.144 | 49.919% | 50.049% | 513.0/482/544 | 0.0064 |

Other checks on the same branch:

```text
permutation inverse: passed
AEAD roundtrip: passed
ciphertext tamper rejection: passed
wrong observer/AD rejection: passed
linear complexity over 4096 sampled bits: 2049
runs-test p approx over 4096 bits: 0.8061
observer/AD tag avalanche: 51.953%
```

## Reduced-round diffusion after the x patch

| rounds | avg changed bits / 1024 | min | max |
|---:|---:|---:|---:|
| 1 | 118.08 | 1 | 289 |
| 2 | 363.38 | 238 | 542 |
| 3 | 512.54 | 485 | 546 |
| 4 | 509.67 | 461 | 539 |
| 6 | 513.46 | 485 | 539 |
| 8 | 506.25 | 479 | 535 |

This is the key sanity result. The unpatched Ψ had one-bit avalanche corners. The x patch still has a one-bit corner at exactly one round, which is expected for a Feistel-like shell, but by two rounds the minimum sampled avalanche is already >200 bits, and by three rounds it is near the 512-bit ideal for a 1024-bit permutation.

## Current call

```text
Main weird branch:
  RelPerm-Ψ-1024x/18

Conservative weird branch:
  RelPerm-Ψ-1024x/22, not fully profiled yet

Previous stable branch:
  RelPerm-Φ-512/20
```

Ψ is much slower than Φ because it is doing a lot more semantic machinery:

```text
Gauge₂ closure pulses
FCA-style observer fingerprints
flow/curvature boundary fingerprints
D₄ boundary actions
1024-bit Feistel state
```

This is not optimized. It is a math-lab object.

## Why this is “next-gen weird”

Most cipher design asks:

```text
How do we create fast confusion and diffusion over bits?
```

Ψ asks:

```text
How do we make a bit permutation whose nonlinear layer is an observer of
FOUR-valued settling, contradiction boundaries, gauge representatives,
concept-lattice fingerprints, and flow-like semantic gradients?
```

So the cipher is not just moving bits. It is moving **semantic representatives** through a typed observer stack.

## What failed / what improved

Failed:

```text
Pure semantic closure can saturate and erase dependency.
```

Improved:

```text
The flow bridge keeps raw 𝔽₂ dependency alive while preserving the weird semantic observer.
```

This is the important design lesson:

```text
RelMath observers should shape nonlinearity.
They should not be allowed to destroy dependency paths.
```

## Next hardcore step

The next serious step is not another ornament. It is attack tooling:

```text
1. Invariant-subspace search on reduced Ψ rounds.
2. Differential trail sampler for 2–6 rounds.
3. Rotational/word-symmetry distinguisher search.
4. Mini-Ψ algebraic-degree estimator.
5. SAT/SMT model for tiny Ψ instances.
6. Side-channel leakage simulator for Gauge₂ masked FOUR planes.
7. Observer leakage: mutual information between h_truth/h_top/fingerprint and key bits.
```

And the next design mutation should be:

```text
RelPerm-Ω
  a smaller/faster 768-bit or 512-bit version
  keeping the Ψ flow bridge and observer fingerprints
  but pruning the slowest closure passes.
```

## Security warning

This is not production cryptography. It has not survived cryptanalysis. These are design-lab smoke tests, not security proofs.

The value of Ψ-1024x is that it revealed a real design failure, then produced a structurally better patched primitive while preserving the RelMath-native weirdness.
