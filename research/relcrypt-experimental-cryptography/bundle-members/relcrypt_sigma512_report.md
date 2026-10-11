# RelCrypt-Σ-512: Encryption-Focused RelMath Cipher Candidate

**Status:** experimental AEAD / stream-encryption candidate, not production cryptography.  
**Branch goal:** move from “cipher-design workbench” toward an actual encryption algorithm using RelMath structure.  
**Default:** 24-round `RelPerm-Σ-512` with a duplex AEAD mode.

---

## 1. Why this branch exists

The previous passes taught three hard lessons:

1. **FOUR/K₄ should not directly encrypt bits.** Direct K₄ plaintext masking leaks structure.
2. **Closure/settling can saturate.** Semantic closure can erase dependency paths unless an explicit `𝔽₂` flow bridge keeps bit dependencies alive.
3. **Gauge₂ is not a complete side-channel mask.** It hides truth-vs-false polarity, but raw two-bit FOUR representation leaks top/bottom Hamming weight.

`RelCrypt-Σ-512` is the encryption-focused correction:

```text
𝔽₂/ARX flow bridge:
  mandatory dependency propagation

FOUR:
  semantic/evidence geometry

Gauge₂ = {id, neg}:
  internal order-compatible polarity mask

balanced FOUR code:
  constant-weight representation of semantic cells

full K₄:
  boundary whitening, not internal closure

duplex sponge mode:
  real encryption + authentication interface
```

---

## 2. Primitive

### 2.1 Permutation

```text
RelPerm-Σ-512
state: 8 × 64-bit words = 512 bits
rounds: default 24
structure: 8-branch generalized Feistel
```

Round:

```text
F = semantic_oracle_sigma(state[1..7], round_constant, round_index)
state = state[1..7] || (state[0] xor F)
```

The permutation is invertible for arbitrary `F`, because it is a generalized Feistel shell.

### 2.2 Semantic oracle

The round oracle uses:

```text
1. raw 𝔽₂/ARX flow bridge
2. lift selected state words into FOUR evidence planes P,N
3. apply Gauge₂={id,neg} internal polarity mask
4. run a scratch monotone closure pulse
5. compute truth/false/top/bottom rows
6. encode FOUR as balanced code planes (N, P, ~P, ~N)
7. compute adjoint-neighborhood gap
8. compute Chu/FCA-style observer fingerprint
9. apply full K₄ boundary whitening
10. fold back into a 64-bit Feistel output
```

The important architectural split is:

```text
inside monotone closure:
  Gauge₂ only

at round boundary:
  full K₄ allowed
```

---

## 3. Balanced FOUR representation

Raw FOUR as two bits:

```text
charge = (P,N)
```

has Hamming weights:

```text
⊥ = 00 weight 0
t = 10 weight 1
f = 01 weight 1
⊤ = 11 weight 2
```

That leaks top/bottom class under first-order Hamming-weight leakage.

Σ uses the constant-weight semantic code:

```text
code(P,N) = (N, P, ~P, ~N)
```

So each FOUR charge has weight exactly 2:

```text
⊥: P=0,N=0 → (0,0,1,1)
t: P=1,N=0 → (0,1,0,1)
f: P=0,N=1 → (1,0,1,0)
⊤: P=1,N=1 → (1,1,0,0)
```

This does **not** solve all side-channel leakage, but it fixes the raw first-order Hamming-weight row leak identified in the mini attack pass.

Simulation:

```text
raw two-bit HW corr(top):     0.8160
raw two-bit HW corr(bottom):  -0.8171

balanced code weight min:     2
balanced code weight max:     2
balanced code weight variance:0
```

The balanced code’s total Hamming weight has zero variance, so simple first-order total-HW correlation is undefined rather than leaking top/bottom class.

---

## 4. Encryption mode

`RelCrypt-Σ-512-AEAD` is a duplex construction over `RelPerm-Σ-512`.

Recommended interface:

```text
key:   32 bytes
nonce: 16 bytes
AD:    arbitrary bytes
PT:    arbitrary bytes
tag:   16 bytes default
rate:  32 bytes
cap:   32 bytes
```

Encryption:

```text
state = init(key, nonce)
absorb associated data
for each plaintext block:
  permute state
  keystream = state[0:rate]
  ciphertext = plaintext xor keystream
  absorb ciphertext
finalize lengths/domains
tag = state[0:tag_len]
```

Decryption mirrors encryption and rejects on tag mismatch.

This is now encryption itself: ciphertext + tag, tamper rejection, wrong-AD rejection, nonce-dependent keystream, and associated-data binding.

---

## 5. Backend results

### 5.1 Quick 8 KiB sweep

| rounds | inverse | AEAD roundtrip | entropy | chi² | monobit z | key avalanche | nonce avalanche | AD avalanche | perm avalanche avg/min/max | speed |
|---:|:---:|:---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 12 | true | true | 7.979203 | 233.64 | -0.531 | 49.960% | 50.347% | 49.956% | 255.20/231/276 | 0.083 MB/s |
| 16 | true | true | 7.975720 | 269.44 | -1.389 | 49.960% | 49.593% | 50.122% | 254.20/226/273 | 0.072 MB/s |
| 20 | true | true | 7.979511 | 231.33 | -0.281 | 50.137% | 50.216% | 50.174% | 253.72/228/279 | 0.060 MB/s |
| 24 | true | true | 7.978689 | 239.94 | 0.640 | 49.866% | 49.944% | 50.256% | 256.42/225/281 | 0.045 MB/s |

### 5.2 Chosen 24-round 64 KiB run

```json
{
  "rounds": 24,
  "size": 65536,
  "perm_inverse": true,
  "aead_roundtrip": true,
  "tamper_reject": true,
  "wrong_ad_reject": true,
  "entropy": 7.997314670561237,
  "chi_square": 242.96802538442762,
  "monobit_z": 0.07733036502653991,
  "serial_corr": -0.003530541697049083,
  "key_avalanche": 0.499710153771052,
  "nonce_avalanche": 0.5008638180375885,
  "ad_avalanche": 0.5010125549182328,
  "perm_avalanche_avg": 256.234375,
  "perm_avalanche_min": 229,
  "perm_avalanche_max": 279,
  "speed_MB_s": 0.04758064276600003,
  "ct_tag_len": 65552
}
```

### 5.3 Reduced-round permutation diffusion

| rounds | average flipped bits / 512 | min | max |
|---:|---:|---:|---:|
| 1 | 28.50 | 1 | 44 |
| 2 | 59.26 | 27 | 78 |
| 3 | 92.09 | 56 | 112 |
| 4 | 124.38 | 85 | 145 |
| 5 | 156.36 | 115 | 184 |
| 6 | 188.45 | 146 | 211 |
| 8 | 251.71 | 205 | 279 |
| 10 | 256.69 | 225 | 281 |
| 12 | 255.29 | 226 | 276 |

Diffusion reaches the 256/512-bit ideal neighborhood around 8–10 rounds in this sampled probe. The chosen encryption branch uses 24 rounds.

---

## 6. Expert read

Σ is a better encryption branch than Ω/Ψ for three reasons:

```text
1. It has a direct AEAD encryption interface.
2. It includes the balanced FOUR representation correction.
3. It keeps the mandatory 𝔽₂ flow bridge while pruning some heavier semantic ornament.
```

It is still not a secure cipher. It is a stronger research candidate.

The algorithmic claim is only:

```text
RelMath structure can be incorporated into a functioning encryption construction
without making the earlier direct-K₄ or closure-saturation mistakes.
```

---

## 7. What should happen next

### 7.1 Cryptanalysis

```text
- reduced-round differential trail search
- algebraic-degree growth on mini-Σ
- invariant-subspace search
- rotational distinguishers
- state-recovery probes from known keystream
- nonce-misuse behavior
- related-key probes
```

### 7.2 Representation masking

```text
- implement constant-weight code at every semantic boundary
- add Boolean sharing for individual code wires
- simulate Hamming-weight and Hamming-distance leakage
- prove which K₄/Gauge₂ actions are permutations of the code fiber
```

### 7.3 Lean formalization

```text
RelMath/Crypto/BalancedFourCode.lean
RelMath/Crypto/SigmaFeistel.lean
RelMath/Crypto/DuplexToy.lean
```

Prove:

```text
- balanced FOUR code has constant weight
- Gauge₂/K₄ actions permute encoded FOUR states
- generalized Feistel is invertible for arbitrary oracle
- simplified duplex absorbs domains/lengths consistently
```

---

## 8. Bottom line

`RelCrypt-Σ-512` is the first branch in this line that is clearly aimed at encryption rather than pure cipher sculpture.

The design thesis is:

```text
Use RelMath to shape the internal observer geometry,
but let ordinary cryptographic architecture enforce encryption discipline.
```

That means:

```text
𝔽₂/ARX keeps dependency alive.
FOUR supplies evidence geometry.
Gauge₂ masks polarity internally.
Balanced code fixes first-order row-weight leakage.
K₄ whitens semantic representatives at boundaries.
Duplex mode gives encryption and authentication.
```
