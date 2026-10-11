# RelCrypt-Σ2-512: Encryption-Focused Update

**Status:** experimental AEAD / stream-encryption candidate, not production cryptography.  
**Branch goal:** improve `RelCrypt-Σ-512` as an encryption algorithm by fixing representation-level leakage in the FOUR semantic layer.

---

## 1. Why Σ2 exists

The previous Σ branch corrected the obvious raw-FOUR Hamming-weight leak by replacing two-bit FOUR with a constant-weight code:

```text
code(P,N) = (N, P, ~P, ~N)
```

That makes every FOUR charge have Hamming weight 2:

```text
⊥ → 0011
 t → 0101
 f → 1010
⊤ → 1100
```

But the mini side-channel model showed that this is only a **total-Hamming-weight** fix. A fixed single rail still leaks the underlying representative.

So Σ2 adds a full K₄ representation mask before forming the balanced code.

---

## 2. The new representation rule

Σ1 used:

```text
B0, B1, B2, B3 = N, P, ~P, ~N
```

Σ2 uses:

```text
(Pm, Nm) = K4.act(mask, P, N)
B0, B1, B2, B3 = Nm, Pm, ~Pm, ~Nm
```

So the balanced representation is not just constant-weight; it is a lane-wise K₄ rail permutation of the underlying FOUR charge.

This preserves the RelMath split:

```text
inside monotone closure:
  Gauge₂ = {id, neg}

representation / boundary layer:
  full K₄

bit recurrence / diffusion:
  𝔽₂ / ARX flow bridge
```

---

## 3. Representation-leakage microscope

The mini representation simulation compared raw two-bit encoding, Gauge₂ masking, full K₄ masking, balanced four-rail encoding, and balanced K₄ rail-permuted encoding.

Key results:

| scheme | total-HW variance | corr(total HW, top) | max single-rail corr(top) | max single-rail corr(pos) |
|---|---:|---:|---:|---:|
| raw 2-bit, no mask | 0.5014 | 0.8164 | 0.5788 | 1.0000 |
| raw 2-bit + Gauge₂ | 0.4996 | 0.8161 | 0.5772 | 0.5001 |
| raw 2-bit + full K₄ | 0.5024 | -0.0013 | 0.0012 | 0.0031 |
| balanced 4-rail, no mask | 0.0000 | undefined | 0.5780 | 1.0000 |
| balanced 4-rail + K₄ rail permutation | 0.0000 | undefined | 0.0045 | 0.0029 |

Interpretation:

```text
Gauge₂ hides polarity but not top/bottom Hamming weight.
Balanced FOUR hides total Hamming weight but not a fixed rail.
Balanced FOUR + K₄ rail permutation hides both in this first-order toy model.
```

This is the main reason Σ2 exists.

---

## 4. Mini-Σ reduced-model cryptanalysis

A tiny 8-bit exact model was attempted first. It collapsed into low-degree/invariant behavior after enough rounds, so it is useful mainly as a warning:

```text
very tiny reductions can create artifacts that are not representative of the 512-bit construction.
```

A targeted 12-bit model was then run on the most important branches:

```text
sigma_full
sigma_no_flow_bridge
sigma_no_balanced_code
```

### 12-bit targeted result

| variant | rounds | max degree | avg degree | worst low-weight differential | sampled avalanche avg |
|---|---:|---:|---:|---:|---:|
| sigma_full | 2 | 11 | 2.25 | 0.5547 | 1.61 / 12 |
| sigma_full | 4 | 11 | 3.92 | 0.2046 | 2.46 / 12 |
| sigma_full | 6 | 11 | 4.33 | 0.1431 | 2.50 / 12 |
| no flow bridge | 2 | 9 | 2.08 | 0.8750 | 1.48 / 12 |
| no flow bridge | 4 | 11 | 3.67 | 0.4385 | 2.05 / 12 |
| no flow bridge | 6 | 11 | 4.08 | 0.4116 | 2.24 / 12 |
| no balanced code | 2 | 11 | 2.25 | 0.5547 | 1.61 / 12 |
| no balanced code | 4 | 11 | 3.92 | 0.2046 | 2.46 / 12 |
| no balanced code | 6 | 11 | 4.33 | 0.1431 | 2.50 / 12 |

Interpretation:

```text
The F₂ flow bridge remains mandatory.
Balanced representation is a side-channel/representation improvement, not a strong reduced-model differential improvement.
```

That is exactly what we should expect: balanced encoding changes leakage and representation discipline, not necessarily permutation diffusion by itself.

---

## 5. Full Σ2-512 backend results

### 5.1 Σ2 sweep, 8 KiB encryption samples

| rounds | entropy | chi² | monobit z | key avalanche | nonce avalanche | AD avalanche | perm avalanche avg/min/max | speed |
|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 16 | 7.975818 | 275.44 | -0.305 | 50.017% | 49.968% | 49.794% | 257.92 / 237 / 281 | 0.036 MB/s |
| 20 | 7.978543 | 243.00 | -0.062 | 50.097% | 50.084% | 49.567% | 256.33 / 231 / 276 | 0.028 MB/s |
| 24 | 7.977976 | 251.00 | 0.367 | 50.097% | 49.807% | 49.896% | 255.06 / 235 / 280 | 0.024 MB/s |
| 28 | 7.978196 | 246.12 | -0.023 | 50.091% | 49.825% | 49.733% | 254.34 / 226 / 287 | 0.019 MB/s |

### 5.2 Σ1 vs Σ2, same 32 KiB sample at 24 rounds

| branch | entropy | chi² | monobit z | serial corr | key avalanche | nonce avalanche | AD avalanche | perm avalanche avg/min | speed |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Σ1 | 7.993917 | 278.81 | 0.074 | 0.00191 | 49.889% | 49.944% | 49.931% | 256.41 / 233 | 0.026 MB/s |
| Σ2 | 7.994697 | 240.77 | 0.023 | -0.01126 | 49.936% | 50.027% | 49.962% | 254.77 / 227 | 0.025 MB/s |

Interpretation:

```text
Σ2 does not hurt the basic encryption smoke tests.
Σ2 gives a representation-level leakage improvement.
Σ2 is now the better encryption branch.
```

---

## 6. Reduced-round permutation diffusion for Σ2

| rounds | avg flipped bits / 512 | min | max |
|---:|---:|---:|---:|
| 1 | 29.55 | 1 | 43 |
| 2 | 61.77 | 26 | 76 |
| 3 | 92.29 | 54 | 112 |
| 4 | 124.11 | 91 | 146 |
| 5 | 157.10 | 121 | 184 |
| 6 | 187.86 | 147 | 216 |
| 8 | 253.00 | 215 | 290 |
| 10 | 256.09 | 227 | 290 |
| 12 | 255.51 | 228 | 279 |

Diffusion reaches the 256/512 ideal neighborhood around 8-10 rounds. The candidate AEAD branch keeps 24 rounds.

---

## 7. Current encryption branch recommendation

```text
Main encryption branch:
  RelCrypt-Σ2-512 / 24 rounds

Conservative branch:
  RelCrypt-Σ2-512 / 28 rounds

Older baseline:
  RelCrypt-Σ-512 / 24 rounds
```

The reason to prefer Σ2 over Σ1 is not because it radically improves monobit/entropy/avalanche. It does not. The reason is that it fixes a representation-level side-channel mistake while preserving the same cipher behavior.

---

## 8. Expert read

Σ2 is a better encryption algorithm because it moves the RelMath structure into a cleaner cryptographic form:

```text
𝔽₂ supplies dependency propagation and diffusion.
Gauge₂ supplies internal order-compatible polarity masking.
Full K₄ supplies rail-level representation masking and boundary whitening.
FOUR supplies evidence geometry.
Balanced rail code reduces first-order total-HW leakage.
K₄ rail permutation reduces fixed-rail leakage in the toy leakage model.
```

This is the right direction: not more ornamental math, but better representation theory for encryption state.

---

## 9. Next work

The next work should be:

```text
1. Turn Σ2 into a cleaner spec.
2. Add a nonce-misuse-resistant SIV-style mode over the same permutation.
3. Run reduced-round trail search against Σ2 specifically.
4. Run probing-model leakage simulation beyond first order.
5. Prototype bitsliced / vectorized implementation; current Python is too slow.
```

The next algorithmic candidate should be:

```text
RelCrypt-Σ2-SIV
```

That would move from "works as AEAD when nonces are unique" toward "more robust encryption interface."

---

## 10. RelCrypt-Σ2-SIV: encryption-mode upgrade

After Σ2, the next encryption-focused improvement is a nonce-misuse-resistant SIV-style mode.

### 10.1 Why SIV

The ordinary Σ2 duplex AEAD assumes nonce uniqueness. That is normal for many AEADs, but brittle. A better experimental encryption interface is:

```text
tag = MAC(key, nonce, AD, plaintext)
ciphertext = plaintext xor stream(key, synthetic_iv = tag, AD)
```

Decryption regenerates the stream from the received tag, decrypts, recomputes the MAC over the plaintext, and rejects unless the tag matches.

This gives deterministic equality leakage for identical `(key, nonce, AD, plaintext)` tuples, but avoids the catastrophic stream-cipher failure:

```text
same nonce used twice => ciphertext xor ciphertext = plaintext xor plaintext
```

for distinct plaintexts.

### 10.2 Backend SIV results

Chosen branch:

```text
RelCrypt-Σ2-SIV / 24 rounds
16 KiB plaintext sample
```

Result:

```text
roundtrip: passed
tamper rejection: passed
wrong AD rejection: passed
wrong nonce rejection: passed
nonce-reuse XOR-of-plaintext leak: false
deterministic same-message same-nonce equality: true
```

Statistical smoke:

| metric | value |
|---|---:|
| entropy | 7.9891917 bits/byte |
| byte chi² | 245.09 |
| monobit z | -0.657 |
| serial corr | 0.00084 |
| key avalanche | 49.947% |
| nonce avalanche | 49.867% |
| AD avalanche | 49.985% |
| plaintext avalanche | 49.868% |
| pure Python speed | 0.0122 MB/s |

Small sweep:

| rounds | entropy | chi² | monobit z | key avalanche | nonce avalanche | AD avalanche | plaintext avalanche | nonce-reuse XOR leak | same tuple deterministic | speed |
|---:|---:|---:|---:|---:|---:|---:|---:|:---:|:---:|---:|
| 16 | 7.978116 | 245.56 | 0.516 | 49.740% | 50.254% | 49.578% | 49.931% | false | true | 0.0186 MB/s |
| 24 | 7.975325 | 274.06 | -1.625 | 50.238% | 50.257% | 49.994% | 50.018% | false | true | 0.0108 MB/s |

### 10.3 Current encryption recommendation

```text
Main encryption construction:
  RelCrypt-Σ2-SIV / 24 rounds

Lower-level primitive:
  RelPerm-Σ2-512 / 24 rounds

Ordinary unique-nonce AEAD:
  RelCrypt-Σ2-AEAD / 24 rounds
```

The SIV branch is slower because encryption is effectively two-pass:

```text
pass 1: MAC plaintext to produce synthetic IV
pass 2: encrypt under synthetic IV
```

But it is a better encryption interface.

---

## 11. Updated expert conclusion

The RelMath contribution is now more precise:

```text
Gauge₂ gives internal polarity masking.
Full K₄ gives boundary and rail-representation masking.
Balanced FOUR gives constant-weight semantic representation.
𝔽₂ flow bridge keeps dependency propagation alive.
SIV mode improves encryption misuse behavior.
```

So the current best direction is not “more exotic round functions.” It is:

```text
better encryption interfaces + better representation theory + attack-driven pruning.
```

The next concrete target is a cleaned formal spec for:

```text
RelCrypt-Σ2-SIV-24
```

with separated sections for:

```text
permutation
balanced K₄ rail representation
duplex MAC
synthetic-IV encryption
security caveats
required cryptanalysis
```
