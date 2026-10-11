# RelCrypt Mini-Ω/Ξ Attack-Driven Pass
**Status:** reduced-model cryptanalysis / design feedback, not a security proof.
This pass miniaturizes the Ω/Ξ family to a 12-bit generalized-Feistel model so that exact algebraic-normal-form degree and exact small invariant checks are cheap enough to run. The point is not to claim the 12-bit toy is secure; the point is to see which RelMath-inspired operators survive adversarial reduction.
---
## 1. Reduced model
The reduced model uses four 3-bit Feistel branches. The round oracle keeps the RelCrypt operator vocabulary:
```text
FOUR evidence planes
Gauge₂ = {id, neg} internal swap mask
adjoint sandwich
knowledge-like closure pulse
nuclear commutator K∘T xor T∘K
Chu/FCA observer fingerprint
full K₄ boundary whitening
𝔽₂/ARX flow bridge
```
Variants tested:
```text
mini_omega_full          all operators
mini_xi_no_commutator    Ω without nuclear commutator
mini_phi_baseline        stripped Φ-like baseline
mini_no_flow_bridge      Ω without explicit 𝔽₂ dependency bridge
mini_no_gauge2           Ω without internal Gauge₂ refresh
mini_no_k4_boundary      Ω without full K₄ boundary whitening
mini_gf2_only            heavily stripped Boolean core
```
---
## 2. Exact ANF degree + sampled differential probe
| variant | rounds | max ANF degree | avg ANF degree | worst sampled differential | coord-zero invariants | linear invariants |
|---|---:|---:|---:|---:|---:|---:|
| `mini_omega_full` | 2 | 10 | 4.75 | 0.199219 | — | — |
| `mini_omega_full` | 4 | 11 | 9.75 | 0.007324 | 0 | 0 |
| `mini_omega_full` | 6 | 11 | 11.00 | 0.003418 | 0 | 0 |
| `mini_xi_no_commutator` | 2 | 10 | 4.83 | 0.179688 | — | — |
| `mini_xi_no_commutator` | 4 | 11 | 9.83 | 0.007812 | 0 | 0 |
| `mini_xi_no_commutator` | 6 | 11 | 11.00 | 0.002441 | 0 | 0 |
| `mini_phi_baseline` | 2 | 10 | 4.92 | 0.210938 | — | — |
| `mini_phi_baseline` | 4 | 11 | 9.83 | 0.008789 | 0 | 0 |
| `mini_phi_baseline` | 6 | 11 | 10.92 | 0.002930 | 0 | 0 |
| `mini_no_flow_bridge` | 2 | 10 | 4.67 | 0.203125 | — | — |
| `mini_no_flow_bridge` | 4 | 10 | 9.17 | 0.008789 | 0 | 0 |
| `mini_no_flow_bridge` | 6 | 10 | 10.00 | 0.003906 | 0 | 0 |
| `mini_no_gauge2` | 2 | 10 | 4.83 | 0.164062 | — | — |
| `mini_no_gauge2` | 4 | 11 | 9.75 | 0.007324 | 0 | 0 |
| `mini_no_gauge2` | 6 | 11 | 10.92 | 0.002930 | 0 | 0 |
| `mini_no_k4_boundary` | 2 | 10 | 4.75 | 0.199219 | — | — |
| `mini_no_k4_boundary` | 4 | 11 | 9.75 | 0.007324 | 0 | 0 |
| `mini_no_k4_boundary` | 6 | 11 | 11.00 | 0.002441 | 0 | 0 |
| `mini_gf2_only` | 2 | 10 | 4.75 | 0.191406 | — | — |
| `mini_gf2_only` | 4 | 11 | 9.75 | 0.008789 | 0 | 0 |
| `mini_gf2_only` | 6 | 11 | 11.00 | 0.002930 | 0 | 0 |

Notes:
- For a 12-bit permutation component, degree 11 is the expected practical ceiling; the best branches hit it quickly.
- `mini_no_flow_bridge` is the important warning: without the explicit `𝔽₂` flow bridge, degree growth lags and tops out at 10 in this reduced model. This confirms the lesson from Ψ: semantic closure must not be allowed to saturate dependency paths.
- No coordinate-zero invariant subspaces and no linear invariants were found in the exact 12-bit checks at rounds 4 and 6 for the tested variants.
- `mini_xi_no_commutator` again looks viable: it is simpler, and in this reduced model its sampled differential score is sometimes slightly better than full Ω. The nuclear commutator remains a mutation, not yet a mandatory feature.
---
## 3. Side-channel result: Gauge₂ is not a full leakage mask
The side-channel simulation used the two-bit FOUR charge representation `(P,N)` and compared no mask, uniform Gauge₂, and uniform full K₄. The leakage model was first-order Hamming weight plus second-order centered Hamming-weight leakage.
| scheme | corr(HW, top) | corr(HW, bottom) | corr(abs(HW-1), pole orbit) | corr(abs(HW-1), classical orbit) |
|---|---:|---:|---:|---:|
| `none` | 0.8173 | -0.8172 | 1.0000 | -1.0000 |
| `gauge2_uniform` | 0.8167 | -0.8172 | 1.0000 | -1.0000 |
| `k4_uniform` | -0.0025 | 0.0020 | 1.0000 | -1.0000 |

Interpretation:
- Gauge₂ is excellent for hiding **truth vs false polarity** of the classical middle orbit, because it swaps `(1,0)` and `(0,1)`.
- Gauge₂ does **not** hide Hamming weight. It preserves `P+N`, so bottom/classical/top weight class is visible.
- Uniform full K₄ flattens first-order mean Hamming-weight correlations with top/bottom, but second-order leakage `abs(HW-1)` still perfectly separates the classical orbit `{t,f}` from the pole orbit `{⊥,⊤}`.
- Therefore: **Gauge₂ is a polarity mask, not a complete side-channel masking scheme.** Full K₄ is a boundary whitening mask, but even it needs Boolean sharing or dummy balancing if the leakage model sees centered Hamming weight.
---
## 4. Design consequences
### Keep
```text
flow bridge: mandatory
Gauge₂ inside monotone closure: still mathematically correct
full K₄ at boundaries: still useful for representative scrambling
```
### Demote / ablate further
```text
nuclear commutator: promising but not mandatory
Chu/FCA observer: needs direct leakage/distinguisher tests
D₄ boundary: should be tested as role/order whitening, not assumed
```
### Add
```text
dual masking discipline:
  Gauge₂ for internal order-compatible polarity masking
  Boolean sharing / balanced encoding for Hamming-weight hiding
  full K₄ only at boundaries or in masked storage
```
The side-channel lesson is the biggest new result in this pass. The previous phrasing “K₄ self-inverse masks protect side channels” was too broad. The precise statement is:
```text
Gauge₂ protects representative polarity, not weight class.
Full K₄ reduces first-order top/bottom mean leakage, but not second-order orbit leakage.
Real side-channel masking needs Gauge₂ plus Boolean sharing/balancing.
```
---
## 5. Next branch proposal: RelCrypt-Ω2
The next branch should not add more symbolic structure. It should fix the leakage discipline.
```text
RelCrypt-Ω2:
  Ω/Ξ core
  mandatory 𝔽₂ flow bridge
  optional nuclear commutator
  Gauge₂ internal polarity masking
  balanced FOUR encoding for exposed/stored semantic planes
  full K₄ boundary whitening only after balancing
```
Two implementation options:
```text
1. Boolean sharing:
   represent P,N as P=P0 xor P1, N=N0 xor N1, refresh shares around semantic pulses.

2. Balanced FOUR encoding:
   encode each charge into a constant-weight codeword before boundary storage/output.
   Gauge/K₄ acts on encoded representatives rather than raw two-bit cells.
```
Option 2 is more RelMath-goblin: it turns FOUR charges into orbits of balanced codewords, making the gauge action a permutation on a constant-weight fiber.
---
## 6. Files
```text
relcrypt_mini12_cryptanalysis.py          reduced-model workbench
relcrypt_mini12_fast_results.json         main reduced-model results
relcrypt_mini12_more_results.json         extra ablations
relcrypt_sidechannel_second_order.json    side-channel second-order leakage check
```
