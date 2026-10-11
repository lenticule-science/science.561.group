# RelCrypt-Φ-512b Flow/FCA/Aperiodic Workbench Results
**Status:** research cipher / mathematics-lab output; not production cryptography.

## Design implemented
```text
RelPerm-Φ-512b:
  512-bit generalized-Feistel permutation
  round function = semantic pulse

RelStream-Φ-512b:
  counter-mode stream cipher derived from RelPerm-Φ-512
```
The semantic pulse uses `𝔽₂` Boolean recurrence/diffusion, FOUR positive/negative evidence planes, `Gauge₂={id,neg}` masking inside the local closure pulse, row observables for truth/false/inconsistency, and full `K₄` boundary whitening.

## Results summary
| rounds | invertible | roundtrip | entropy | monobit z | chi² | serial corr | key avalanche | nonce avalanche | speed MB/s | perm avalanche |
|---:|:---:|:---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 8 | True | True | 7.993895 | -0.871 | 276.72 | 0.001958 | 50.138% | 50.132% | 0.189 | 256.78/512 |
| 12 | True | True | 7.995065 | -0.156 | 224.02 | 0.005201 | 49.923% | 50.014% | 0.131 | 255.73/512 |
| 16 | True | True | 7.993550 | 1.566 | 292.38 | 0.006401 | 49.931% | 50.016% | 0.099 | 256.26/512 |
| 20 | True | True | 7.995151 | -0.984 | 218.77 | -0.001050 | 49.868% | 50.034% | 0.081 | 256.02/512 |

## AES-CTR baseline from local compiled backend
| entropy | monobit z | chi² | serial corr | speed MB/s |
|---:|---:|---:|---:|---:|
| 7.994922 | 0.184 | 229.88 | 0.003447 | 1937.984 |

## Interpretation
The 512-bit permutation inverse tests passed for all tested round counts, confirming the generalized-Feistel shell is doing its job: the semantic pulse may be non-invertible, but the whole permutation remains invertible.

The stream-mode smoke tests are statistically clean at this scale. The important question is no longer basic byte balance; the next attacks should be reduced-round distinguishers, state recovery, algebraic-degree growth, differential/linear sampling, and invariant-subspace search.

The pure-Python implementation is slow by construction. The next implementation step is a C/Rust/bitsliced version or vectorized Python prototype.

## Next cryptanalytic probes
```text
- reduced-round state recovery
- correlation attacks against the Boolean core
- algebraic normal form degree growth
- low-weight differential search
- invariant subspace search
- SAT/SMT distinguishers for tiny reduced versions
- side-channel toy leakage: Gauge₂-masked vs unmasked FOUR intermediates
```
