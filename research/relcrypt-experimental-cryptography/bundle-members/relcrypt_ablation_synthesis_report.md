# RelCrypt Ablation + Reduced-Round Attack Report

**Status:** research diagnostics, not a security claim.  
**Scope:** Φ/Ω-family 512-bit generalized-Feistel permutations and derived stream mode.

This is the first deliberately adversarial step after the weird-construction phase. Instead of adding more RelMath ornament, the harness removes one operator at a time and asks whether reduced-round behavior gets worse.

The standing architecture is unchanged:

```text
𝔽₂: bit recurrence / diffusion / stream plumbing
FOUR: evidence-plane geometry
Gauge₂ = {id, neg}: internal order-compatible masking
full K₄ / D₄: semantic boundary whitening
settling/cohomology observers: nonlinear state-shaping signals
```

## Files generated

- `relcrypt_ablation_harness.py`: ablation and attack-probe harness.
- `relcrypt_ablation_results_r6.json`: JSON result file.
- `relcrypt_ablation_results_r10.json`: JSON result file.
- `relcrypt_ablation_results_r12.json`: JSON result file.
- `relcrypt_ablation_results_r16.json`: JSON result file.

## Aggregate ranking across r=6,10,12,16

| avg rank | variant | avg red-flag score | worst perm min | worst low-weight min | worst rotational min | avg speed MB/s |
|---:|---|---:|---:|---:|---:|---:|
| 2.25 | `omega_full` | 0.600 | 229 | 221 | 231 | 0.017 |
| 5.00 | `phi_baseline` | 0.806 | 225 | 223 | 222 | 0.131 |
| 5.25 | `no_commutator` | 0.863 | 227 | 222 | 223 | 0.028 |
| 5.50 | `no_flow_observer` | 0.849 | 228 | 223 | 227 | 0.015 |
| 5.50 | `no_chu_fca` | 0.937 | 223 | 228 | 228 | 0.018 |
| 6.50 | `no_k4_boundary` | 0.868 | 231 | 229 | 230 | 0.017 |
| 6.75 | `no_gauge2` | 0.995 | 229 | 224 | 233 | 0.017 |
| 7.00 | `no_d4_boundary` | 0.928 | 227 | 211 | 224 | 0.017 |
| 8.00 | `no_adjoint` | 0.953 | 220 | 226 | 223 | 0.019 |
| 8.25 | `flow_bridge_only` | 1.057 | 226 | 224 | 227 | 0.050 |
| 8.25 | `no_flow_bridge` | 1.227 | 222 | 216 | 222 | 0.017 |
| 9.75 | `gf2_only_core` | 1.144 | 228 | 231 | 221 | 0.017 |

Lower score is better; the score penalizes distance from ideal avalanche, weak minima, rotational symmetry, and key-avalanche drift. It is a triage score, not a security metric.

## Per-round rankings

### 6 rounds

| rank | variant | score | perm avg/min | low-weight avg/min | rotational avg/min | key avalanche | speed MB/s |
|---:|---|---:|---:|---:|---:|---:|---:|
| 1 | `no_chu_fca` | 0.258 | 254.9/225 | 255.6/228 | 256.5/237 | 49.99% | 0.030 |
| 2 | `no_d4_boundary` | 0.360 | 258.0/237 | 255.8/236 | 256.7/224 | 50.01% | 0.028 |
| 3 | `no_gauge2` | 0.420 | 256.6/229 | 257.1/231 | 256.9/235 | 50.10% | 0.029 |
| 4 | `omega_full` | 0.651 | 255.0/229 | 257.2/231 | 255.1/231 | 49.73% | 0.028 |
| 5 | `flow_bridge_only` | 0.723 | 252.6/226 | 254.3/229 | 255.7/230 | 50.04% | 0.084 |
| 6 | `phi_baseline` | 0.806 | 251.8/225 | 256.2/226 | 256.8/229 | 49.84% | 0.215 |
| 7 | `no_flow_observer` | 0.892 | 256.5/238 | 257.3/236 | 254.3/234 | 49.55% | 0.028 |
| 8 | `no_adjoint` | 0.960 | 258.0/237 | 256.1/235 | 250.8/234 | 50.05% | 0.030 |
| 9 | `no_k4_boundary` | 0.967 | 257.6/233 | 253.7/231 | 255.3/232 | 49.62% | 0.027 |
| 10 | `gf2_only_core` | 1.051 | 254.7/239 | 256.3/233 | 255.8/221 | 49.17% | 0.026 |
| 11 | `no_flow_bridge` | 1.451 | 253.0/227 | 259.0/238 | 261.3/242 | 49.97% | 0.028 |
| 12 | `no_commutator` | 1.482 | 253.9/236 | 255.1/227 | 253.5/223 | 49.20% | 0.042 |

### 10 rounds

| rank | variant | score | perm avg/min | low-weight avg/min | rotational avg/min | key avalanche | speed MB/s |
|---:|---|---:|---:|---:|---:|---:|---:|
| 1 | `no_k4_boundary` | 0.310 | 256.8/234 | 256.3/229 | 256.9/233 | 49.94% | 0.017 |
| 2 | `omega_full` | 0.521 | 254.8/238 | 255.4/229 | 254.4/241 | 50.09% | 0.016 |
| 3 | `no_flow_bridge` | 0.640 | 255.5/238 | 255.9/231 | 257.5/224 | 50.38% | 0.017 |
| 4 | `no_commutator` | 0.656 | 251.3/227 | 255.5/222 | 256.0/239 | 49.99% | 0.028 |
| 5 | `no_chu_fca` | 0.747 | 257.0/232 | 256.9/235 | 255.8/239 | 50.49% | 0.018 |
| 6 | `phi_baseline` | 0.917 | 257.2/228 | 256.7/232 | 250.7/235 | 50.01% | 0.128 |
| 7 | `no_flow_observer` | 0.970 | 254.7/228 | 256.5/230 | 258.5/227 | 49.57% | 0.017 |
| 8 | `no_d4_boundary` | 0.995 | 251.6/227 | 256.5/232 | 257.3/238 | 49.79% | 0.017 |
| 9 | `no_adjoint` | 1.045 | 256.7/220 | 255.1/236 | 259.2/237 | 50.45% | 0.019 |
| 10 | `flow_bridge_only` | 1.223 | 254.6/231 | 256.5/225 | 257.1/227 | 50.84% | 0.051 |
| 11 | `gf2_only_core` | 1.273 | 257.7/236 | 253.3/234 | 258.3/232 | 50.43% | 0.017 |
| 12 | `no_gauge2` | 1.459 | 261.4/247 | 258.0/237 | 253.8/235 | 50.25% | 0.017 |

### 12 rounds

| rank | variant | score | perm avg/min | low-weight avg/min | rotational avg/min | key avalanche | speed MB/s |
|---:|---|---:|---:|---:|---:|---:|---:|
| 1 | `omega_full` | 0.523 | 255.6/236 | 256.1/238 | 256.3/231 | 50.42% | 0.014 |
| 2 | `phi_baseline` | 0.587 | 257.4/236 | 255.5/223 | 256.9/234 | 50.24% | 0.111 |
| 3 | `no_flow_observer` | 0.636 | 255.2/232 | 256.5/234 | 255.5/234 | 50.41% | 0.005 |
| 4 | `no_commutator` | 0.690 | 256.4/234 | 252.7/229 | 256.1/240 | 49.78% | 0.024 |
| 5 | `no_k4_boundary` | 0.712 | 257.3/232 | 255.7/241 | 257.6/232 | 50.32% | 0.014 |
| 6 | `no_adjoint` | 0.753 | 257.2/240 | 256.3/226 | 256.3/223 | 50.52% | 0.015 |
| 7 | `no_flow_bridge` | 0.842 | 256.6/232 | 256.5/230 | 252.0/222 | 50.20% | 0.014 |
| 8 | `gf2_only_core` | 1.088 | 253.0/229 | 255.3/233 | 260.3/238 | 49.91% | 0.014 |
| 9 | `no_gauge2` | 1.295 | 252.5/232 | 256.8/229 | 253.2/233 | 50.42% | 0.014 |
| 10 | `flow_bridge_only` | 1.323 | 250.9/228 | 257.3/231 | 258.7/239 | 50.19% | 0.040 |
| 11 | `no_d4_boundary` | 1.441 | 257.7/237 | 253.5/228 | 260.3/244 | 49.62% | 0.013 |
| 12 | `no_chu_fca` | 1.871 | 251.5/223 | 259.3/236 | 258.0/228 | 49.36% | 0.015 |

### 16 rounds

| rank | variant | score | perm avg/min | low-weight avg/min | rotational avg/min | key avalanche | speed MB/s |
|---:|---|---:|---:|---:|---:|---:|---:|
| 1 | `no_commutator` | 0.622 | 254.2/230 | 256.4/229 | 255.6/236 | 50.29% | 0.016 |
| 2 | `omega_full` | 0.703 | 257.2/240 | 255.4/221 | 254.8/236 | 50.32% | 0.010 |
| 3 | `no_gauge2` | 0.804 | 255.3/234 | 255.9/224 | 254.8/236 | 50.56% | 0.010 |
| 4 | `no_chu_fca` | 0.871 | 253.1/226 | 256.1/233 | 259.0/232 | 50.12% | 0.010 |
| 5 | `no_flow_observer` | 0.900 | 255.6/234 | 255.5/223 | 250.4/227 | 50.09% | 0.008 |
| 6 | `phi_baseline` | 0.915 | 254.4/233 | 256.0/227 | 256.1/222 | 49.30% | 0.068 |
| 7 | `no_d4_boundary` | 0.917 | 253.6/234 | 257.5/211 | 256.5/233 | 50.35% | 0.010 |
| 8 | `flow_bridge_only` | 0.958 | 257.1/241 | 256.0/224 | 255.0/237 | 49.32% | 0.025 |
| 9 | `no_adjoint` | 1.055 | 254.7/236 | 258.4/231 | 255.2/236 | 50.49% | 0.010 |
| 10 | `gf2_only_core` | 1.163 | 254.2/228 | 257.8/231 | 255.0/233 | 49.40% | 0.010 |
| 11 | `no_k4_boundary` | 1.484 | 256.8/231 | 256.2/237 | 252.2/230 | 50.88% | 0.010 |
| 12 | `no_flow_bridge` | 1.975 | 259.6/222 | 256.9/216 | 258.7/238 | 48.91% | 0.010 |

## Cryptographic reading

### 1. Full Ω is a robust branch, but not automatically the champion

`omega_full` is consistently near the top and wins the 12-round run. That means the full RelMath stack is not obviously self-sabotaging. However, the 16-round run places `no_commutator` first, so the nuclear-commutator layer is not yet justified as mandatory.

### 2. The flow bridge should stay

The no-flow-bridge branch is weak at 16 rounds and mediocre elsewhere. This supports the earlier Ψ lesson: semantic closure can saturate or erase dependency paths, so a raw `𝔽₂/ARX` dependency bridge should remain.

### 3. K₄ boundary whitening looks useful at higher rounds

`no_k4_boundary` wins at 10 rounds but falls near the bottom at 16 rounds. This is a warning against reading single reduced-round tests too literally. Current call: keep K₄ boundary whitening, but continue testing it with larger samples and fixed-delta probes.

### 4. Chu/FCA observer is probably doing real work, but the evidence is mixed

Removing Chu/FCA is excellent at 6 rounds, terrible at 12 rounds, and middle at 16 rounds. This may mean the observer helps only after enough diffusion, or it may be noise from small samples. Do not remove it yet; run larger targeted probes.

### 5. Gauge₂ is not just decoration

`no_gauge2` is not catastrophic, but it is not consistently better either. Since Gauge₂ is also the Lean-clean side-channel/order-compatible masking discipline, keep it unless attack probes show a clear weakness.

## New candidate branch: RelPerm-Ξ-512

The ablation suggests a candidate mutation:

```text
RelPerm-Ξ-512 = Ω-512 minus the nuclear commutator,
                 keeping Gauge₂, adjoint sandwich, Chu/FCA observer,
                 flow bridge, K₄ boundary, and D₄ boundary.
```

Rationale: `no_commutator` is best at 16 rounds and remains competitive at 10/12 rounds. It is also simpler and faster than full Ω. But this is only a candidate, not a replacement; it needs larger-sample testing.

## Next attack step

Run targeted larger probes on these four branches:

```text
omega_full
no_commutator   # Ξ candidate
phi_baseline
no_k4_boundary
```

Probe list:

```text
1. larger fixed-delta trails
2. invariant-subspace search
3. algebraic-degree growth on miniaturized Ξ/Ω
4. key/nonce relatedness
5. observer-leakage mutual information
6. Hamming-weight side-channel simulation for Gauge₂ vs no-Gauge₂
```


## Targeted r=16 larger probe

After the broad ablation pass, I ran a stronger 16-round probe on four branches: `omega_full`, `xi_no_commutator`, `phi_baseline`, and `no_k4_boundary`. This used larger stream samples and more permutation avalanche/rotational samples than the broad pass.

| rank | variant | score | perm avg/min | low-weight avg/min | rotational avg/min | branch-zero avg/min | key avalanche | entropy | speed MB/s |
|---:|---|---:|---:|---:|---:|---:|---:|---:|---:|
| 1 | `omega_full` | 0.506 | 255.5/231 | 257.2/221 | 257.6/230 | 254.7/228 | 50.08% | 7.9555 | 0.011 |
| 2 | `no_k4_boundary` | 0.850 | 254.9/221 | 256.6/231 | 256.3/226 | 255.9/237 | 49.40% | 7.9525 | 0.011 |
| 3 | `xi_no_commutator` | 1.173 | 258.1/239 | 257.4/229 | 258.5/239 | 257.5/234 | 50.43% | 7.9512 | 0.018 |
| 4 | `phi_baseline` | 1.189 | 258.7/232 | 255.8/227 | 258.0/234 | 256.2/238 | 50.58% | 7.9525 | 0.081 |

Targeted read: the `no_commutator` / Ξ idea is still viable as a simplification branch, but it did **not** beat full Ω in the stronger r=16 probe. The main branch should remain `omega_full`; Ξ should be treated as a pruned branch for speed/simplicity, not as a replacement yet.

## Security caveat

These are reduced-round toy probes with small samples. They are useful for pruning design branches, not for claiming security. The correct conclusion is: we now have an attack-driven workbench and one plausible pruned candidate, not a finished cipher.
