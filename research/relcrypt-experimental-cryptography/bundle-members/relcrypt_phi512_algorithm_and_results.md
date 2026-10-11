# RelCrypt-Φ-512 Algorithm + Backend Run

**Status:** research cipher / mathematics lab artifact. Not production cryptography.  
**Primitive built:** `RelPerm-Φ-512`, a 512-bit generalized-Feistel permutation with a RelMath semantic pulse as round oracle.  
**Derived mode:** `RelStream-Φ`, a counter-mode stream cipher using the permutation as a keystream block function.

## 1. Design actually implemented

```text
RelPerm-Φ-512 state: 8 × 64-bit words
Round shell: generalized Feistel, so the whole 512-bit map is invertible
Round oracle: semantic pulse, allowed to be non-invertible

RelStream-Φ:
  key:   32 bytes
  nonce: 16 bytes
  mode:  counter-mode squeeze from RelPerm-Φ-512
  enc:   ciphertext = plaintext xor keystream
  dec:   same operation
```

The semantic pulse follows the corrected RelMath layering:

```text
𝔽₂ Boolean recurrence/diffusion
→ FOUR evidence planes P,N
→ Gauge₂={id,neg} masking inside monotone closure
→ local closure/settling pulse
→ truth / false / inconsistency row observables
→ full K₄ boundary whitening
→ fold back into 𝔽₂ words
```

The important architectural correction is that full K₄ is **not** used inside monotone knowledge closure. Inside the closure pulse the implementation uses only `Gauge₂={id,neg}`. Full K₄ is used at the semantic boundary after the closure/observer stage.

## 2. Primary backend results

| rounds | permutation inverse | stream roundtrip | entropy | monobit z | byte chi² | serial corr | key avalanche | nonce avalanche | speed MB/s | permutation avalanche |
|---:|:---:|:---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 8 | True | True | 7.998613 | -0.447 | 251.76 | 0.004980 | 50.011% | 49.971% | 0.359 | 256.27/512 |
| 12 | True | True | 7.998632 | -0.598 | 248.36 | 0.002446 | 49.802% | 50.147% | 0.241 | 256.05/512 |
| 16 | True | True | 7.998704 | -0.535 | 234.67 | -0.000642 | 50.116% | 50.031% | 0.186 | 256.50/512 |
| 20 | True | True | 7.998963 | -0.641 | 188.54 | -0.001524 | 49.987% | 49.982% | 0.135 | 255.78/512 |

### AES-CTR local baseline

| backend | entropy | monobit z | byte chi² | serial corr | speed MB/s |
|---|---:|---:|---:|---:|---:|
| AES-256-CTR via local `cryptography` backend | 7.998774 | 0.105 | 223.20 | -0.000697 | 1695.490 |

Interpretation: on first-pass byte/bit statistics, RelStream-Φ behaves like a plausible random-looking stream. It does **not** beat AES in speed, security maturity, or trust; the compiled AES backend is thousands of times faster. The useful result is structural: the RelMath-native permutation is invertible and its derived stream passes the smoke tests.

## 3. Reduced-round behavior

| rounds | perm avalanche avg | min | max | inverse | stream entropy | stream chi² | stream speed MB/s |
|---:|---:|---:|---:|:---:|---:|---:|---:|
| 1 | 65.12/512 | 1 | 155 | True | 7.993317 | 305.22 | 2.031 |
| 2 | 193.02/512 | 102 | 283 | True | 7.995125 | 223.33 | 1.274 |
| 4 | 256.16/512 | 213 | 289 | True | 7.995032 | 225.17 | 0.594 |
| 6 | 255.99/512 | 219 | 297 | True | 7.993656 | 287.17 | 0.411 |

Reduced-round result: the Feistel shell is invertible even at 1 round, but diffusion is weak at 1–2 rounds. By 4 rounds, single-bit permutation avalanche is already near the 256/512 ideal in this sample. That does **not** imply 4 rounds is secure; it only tells us the semantic pulse diffuses quickly.

## 4. Bit-position bias probe

| rounds | max absolute byte-bit-position bias over 128 KiB | fractions by bit position |
|---:|---:|---|
| 16 | 0.004471 | `0.499504, 0.499367, 0.499069, 0.499702, 0.501114, 0.502502, 0.495529, 0.500389` |
| 20 | 0.002769 | `0.502007, 0.502769, 0.499435, 0.501610, 0.499039, 0.499428, 0.502380, 0.499016` |

20 rounds looked cleaner than 16 rounds on this small bias probe, while 16 rounds is faster. Current practical branch: keep both `RelPerm-Φ-512/16` and `RelPerm-Φ-512/20` as variants.

## 5. Current call

```text
Main research candidate: RelPerm-Φ-512/20
Fast research candidate: RelPerm-Φ-512/16
Derived stream mode: RelStream-Φ
Next workbench: side-channel toy comparing Gauge₂-masked vs unmasked FOUR intermediates
```

Why `/20` as the main branch: it costs speed, but it had the cleanest byte chi-square and bit-position bias in this run while keeping ideal permutation avalanche and near-50% key/nonce avalanche.

## 6. What this still does not prove

Passing these tests does not establish cryptographic security. Missing work includes:

```text
- state-recovery attacks
- reduced-round distinguishers
- algebraic-degree growth
- differential and linear cryptanalysis
- correlation attacks against the Boolean core
- invariant-subspace searches
- nonce misuse analysis
- related-key analysis
- side-channel leakage simulation
- independent implementation review
```

The result here is that the RelMath architecture has crossed from “cute toy” to “coherent primitive family worth attacking.”
