# RelCrypt-Ω-512: Post Repo-Study Branch
**Status:** research cipher / mathematical experiment, not production cryptography.  
**Artifacts:** `relcrypt_omega512_lab.py`, `relcrypt_omega512_quick_results.json`, `relcrypt_omega512_r16_results.json`.
## Why Ω exists
After re-reading the RelMath spine and the already fetched Lean nodes, the next useful move was not “more K₄” or “bigger state.” It was to pull in more of the repo’s *structural* ideas as cipher-design operators:
- hyperdoctrine / quantifier adjoints → local `∃/∀` observer sandwich;
- commuting nuclei / bigraded diamond → a nuclear commutator / curvature signal;
- FCA / Chu duality → state-vs-observer fingerprint;
- flow / curvature → boundary-energy fold;
- aperiodic / Collatz / paperfolding constants → nonperiodic round constants.

The core discipline remains: `𝔽₂` does bit recurrence/diffusion, FOUR supplies evidence geometry, `Gauge₂={id,neg}` masks inside monotone closure, and full K₄/D₄ stays at semantic boundaries.

## New round ingredients
### 1. Adjoint sandwich
A local support observer approximates a hyperdoctrine-style `∃ ⊣ f* ⊣ ∀` move:
```text
exists_nb(X) = X | rotl(X,a) | rotr(X,b)
forall_nb(X) = X & rotl(X,a) & rotr(X,b)
boundary = exists_nb(X) xor forall_nb(X)
```
This is not claiming a formal adjunction in Python; it is a cipher operator inspired by the repo’s adjoint/quantifier layer.

### 2. Nuclear commutator
Ω defines two closure-like scratch nuclei, `K` and `T`, then folds the mismatch:
```text
curvature = K(T(P,N)) xor T(K(P,N))
```
If the nuclei commute perfectly, this signal dies. For cryptographic weirdness, the controlled noncommutation becomes a curvature-like nonlinear fingerprint.

### 3. Chu/FCA observer fingerprint
A derived observer mask `O` tests the truth, false, top, and bottom rows. The result is compressed as a small concept fingerprint and then expanded through `mix64`.

### 4. Flow bridge
Ω keeps the key lesson from Ψ-1024x: semantic closure must not erase raw dependency paths. Every oracle output contains an explicit `𝔽₂/ARX` bridge from the raw right-half input.

## Implementation
```text
RelPerm-Ω-512:
  state = 8 × 64-bit words
  generalized Feistel permutation

RelStream-Ω:
  counter-mode stream derived from RelPerm-Ω-512
```

## Preliminary backend results
Small 2 KiB smoke run. These samples are too small for strong statistical claims; they are fast sanity checks.

| rounds | inv | roundtrip | entropy | chi² | monobit z | key av. | nonce av. | perm av. avg/min/max | rot-sym avg | speed MB/s |
|---:|:---:|:---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 8 | yes | yes | 7.906936 | 257.75 | 0.906 | 49.921% | 50.134% | 256.21/211/296 | 257.00 | 0.0232 |
| 12 | yes | yes | 7.910030 | 252.50 | 1.312 | 50.885% | 49.866% | 256.32/219/297 | 258.94 | 0.0157 |
| 16 | yes | yes | 7.903477 | 271.75 | 0.703 | 49.139% | 49.811% | 255.56/222/292 | 257.62 | 0.0108 |

## Read of the result
Ω is not currently a replacement for Φ-512 or Ψχ-512. It is slower and the stream sample is tiny. But it passes the structural checks that matter for this stage:
```text
permutation inverse: yes
stream roundtrip: yes
avalanche near 256/512: yes
rotational symmetry distance near random baseline: yes
low-weight input probes near 256/512: yes
```

The interesting result is conceptual: the additional RelMath operators can be made into a functioning Feistel oracle without reintroducing the Ψ saturation bug.

## Current branch roles
```text
Φ-512/20:
  stable branch, simpler and faster

Ψχ-512:
  observer-mutates-law branch with good rotational/low-weight probes

Ψ-1024x/18:
  hardcore large-state branch, proved the flow-bridge lesson

Ω-512:
  repo-study branch: adjoint sandwich + nuclear commutator + Chu/FCA observer
```

## Next step
Do not add more ornaments. Build an ablation harness:
```text
Base Φ-512
+ adjoint sandwich only
+ nuclear commutator only
+ Chu/FCA observer only
+ flow bridge only
+ aperiodic constants only
+ selected combinations
```
Then keep only mutations that improve reduced-round avalanche, rotational probes, low-weight probes, and observer leakage without killing speed.
