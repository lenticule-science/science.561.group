# RelCrypt-Σ2-SIV-24 Specification

**Status:** experimental research cipher. Do **not** use for production secrecy.  
**Primitive:** AEAD-like nonce-misuse-resistant encryption construction over a 512-bit RelMath-derived permutation.  
**Main interface:** `encrypt(key, nonce, associated_data, plaintext) -> ciphertext, tag`.

This specification freezes the current RelCrypt-Σ2-SIV-24 branch enough to discuss, reimplement, test, and attack it.

---

## 1. Design thesis

RelCrypt-Σ2-SIV-24 is built around this discipline:

```text
𝔽₂:
  bit algebra, recurrence, diffusion, stream XOR

FOUR:
  positive/negative evidence geometry over bit planes

Gauge₂ = {id, neg}:
  internal polarity masking inside knowledge-compatible closure

full K₄:
  semantic boundary whitening and rail permutation

settling/cohomology observers:
  nonlinear truth/false/inconsistency fingerprints

SIV mode:
  nonce-misuse-resistant encryption interface
```

The construction is not trying to replace Boolean cryptography with FOUR-valued logic. Instead:

```text
Bits move.
FOUR interprets.
Gauge masks.
Settling observes.
The SIV wrapper encrypts.
```

---

## 2. Parameters

```text
Permutation state:      512 bits = 8 × 64-bit words
Word order:             little-endian
Default rounds:         24
Rate:                   32 bytes
Capacity:               32 bytes
Recommended key size:   32 bytes
Recommended nonce size: 16 bytes
Default tag size:       16 bytes
```

Other key/nonce lengths are accepted by the reference code because initialization hashes length-delimited byte strings. The research profile uses 256-bit keys and 128-bit nonces.

---

## 3. Constants

Constants are derived, not handwritten.

```text
RC = BLAKE2s-expanded words from label:
  "RelCrypt-Sigma2-512/rc-v1"

IV = BLAKE2s-expanded words from label:
  "RelCrypt-Sigma2-512/iv-v1"
```

Expansion method:

```text
out = b""
counter = 0
while len(out) < 8*n:
    out += BLAKE2s(label || counter_le32, digest_size=32)
    counter += 1
return out interpreted as n little-endian 64-bit words
```

The current reference uses:

```text
RC: 80 × 64-bit words
IV: 8 × 64-bit words
```

---

## 4. Basic word operations

```text
MASK = 2^64 - 1

rotl(x,r) = 64-bit rotate left
rotr(x,r) = 64-bit rotate right
xor       = bitwise XOR over 𝔽₂
and       = bitwise AND over 𝔽₂
or        = bitwise OR
not       = bitwise complement masked to 64 bits
```

`mix64(x)` is a SplitMix64-style nonlinear finalizer:

```text
x ^= x >> 30
x *= 0xBF58476D1CE4E5B9
x ^= x >> 27
x *= 0x94D049BB133111EB
x ^= x >> 31
```

all modulo `2^64`.

---

## 5. FOUR planes

A vector of FOUR charges is represented by two 64-bit planes:

```text
P = positive evidence plane
N = negative evidence plane
```

For each bit lane:

```text
(P,N) = 00 => ⊥ / no evidence
(P,N) = 10 => t / true-side evidence
(P,N) = 01 => f / false-side evidence
(P,N) = 11 => ⊤ / inconsistent evidence
```

Derived row masks:

```text
T   =  P & ~N
F   = ~P &  N
TOP =  P &  N
BOT = ~P & ~N
```

---

## 6. Gauge₂ internal mask

`Gauge₂ = {id, neg}` is represented by a bit-lane mask `G`.

```text
id:  (P,N) -> (P,N)
neg: (P,N) -> (N,P)
```

Branchless lane-wise implementation:

```text
t = (P xor N) & G
P = P xor t
N = N xor t
```

This mask is used inside monotone closure because `neg` is the knowledge-order-compatible generator.

---

## 7. Full K₄ boundary action

At semantic boundaries, use full K₄ with two lane masks:

```text
swapmask
compmask
```

Operation:

```text
if swapmask bit = 1:
    swap P and N in that lane

if compmask bit = 1:
    complement both P and N in that lane
```

This realizes the four K₄ elements:

```text
swap=0 comp=0: id       (P,N)
swap=1 comp=0: neg      (N,P)
swap=0 comp=1: negConf  (~P,~N)
swap=1 comp=1: conf     (~N,~P)
```

Full K₄ is not used as the internal closure mask. It is used for boundary whitening and rail permutation.

---

## 8. Balanced FOUR rail representation

Raw two-bit FOUR leaks through Hamming weight:

```text
⊥ = 00, weight 0
t = 10, weight 1
f = 01, weight 1
⊤ = 11, weight 2
```

Σ2 uses a balanced four-rail code after a K₄ representation mask:

```text
(RP,RN) = K4_boundary(P,N, rail_swapmask, rail_compmask)

B0 = RN
B1 = RP
B2 = ~RP
B3 = ~RN
```

Each lane has exactly two active rails.

```text
weight(B0,B1,B2,B3) = 2
```

The K₄ rail permutation avoids fixed-rail leakage of the unmasked representative in a first-order toy leakage model.

The balanced mix folded into the oracle is:

```text
balanced_mix = B0 xor rotl(B1,13) xor rotl(B2,29) xor rotl(B3,47)
```

---

## 9. Adjoint-neighborhood operators

The oracle uses local possibility/necessity neighborhood operators:

```text
exists_nb(X,a,b) = X | rotl(X,a) | rotr(X,b)
forall_nb(X,a,b) = X & rotl(X,a) & rotr(X,b)
```

The adjoint gap is:

```text
adj(X,a,b) = exists_nb(X,a,b) xor forall_nb(X,a,b)
```

This is a cipher primitive inspired by quantifier/adjoint structure, not a direct implementation of the Lean hyperdoctrine.

---

## 10. Semantic oracle

The permutation is generalized Feistel. Its round function is a many-to-one semantic oracle:

```text
semantic_oracle_sigma(words7, rc, r) -> 64-bit word
```

Input:

```text
words7 = [a,b,c,d,e,f,g]
rc     = round constant word
r      = round index
```

High-level oracle stages:

```text
1. 𝔽₂/ARX flow bridge
2. lift to FOUR planes P,N
3. Gauge₂ internal mask
4. two scratch monotone closure pulses
5. compute T,F,TOP,BOT rows
6. K₄ rail-masked balanced FOUR representation
7. adjoint-neighborhood fingerprints
8. Chu/FCA-style observer fingerprint
9. full K₄ boundary whitening
10. fold all signals back to one 64-bit Feistel word
```

### 10.1 Mandatory flow bridge

The flow bridge preserves raw bit dependency paths:

```text
flow = mix64(a + rotl(b,7) + rc)
flow ^= rotl(c xor (d + C), 17)
flow = mix64(flow xor rotr(e,11) xor rotl(f,31) xor g)
```

where:

```text
C = 0x9E3779B97F4A7C15
```

This stage is mandatory. Earlier experiments showed that pure semantic closure can saturate and erase dependency paths.

### 10.2 FOUR lift

```text
P = mix64(a xor rotl(b,5) xor rotr(c,13) xor rc)
N = mix64(d xor rotl(e,11) xor rotr(f,19) xor (g + rc))
```

### 10.3 Internal Gauge₂ mask

```text
G = mix64(b xor d xor rotl(f,r+3) xor rc)
(P,N) = Gauge2(P,N,G)
```

### 10.4 Scratch monotone closure pulse

Use scratch planes `PP, NN`.

For `j = 0,1`:

```text
T   =  PP & ~NN
F   = ~PP &  NN
TOP =  PP &  NN

pos_fire =
    rotl(T,1+j)
  | (rotl(PP,5+j) & rotr(NN,7+j))
  | (flow & exists_nb(TOP,3+j,9+j))

neg_fire =
    rotr(F,1+j)
  | (rotr(NN,4+j) & rotl(PP,6+j))
  | (rotl(flow,11+j) & exists_nb(TOP,4+j,8+j))

top_fire =
    (pos_fire & neg_fire)
  | rotl(TOP,9+j)
  | (exists_nb(T,2+j,5+j) & exists_nb(F,3+j,7+j))

PP = PP | pos_fire | top_fire
NN = NN | neg_fire | top_fire
```

The closure is monotone/inflationary on scratch state and is not required to be invertible.

### 10.5 Row observers

After closure:

```text
T   =  PP & ~NN
F   = ~PP &  NN
TOP =  PP &  NN
BOT = ~PP & ~NN
```

### 10.6 Balanced K₄ rail code

```text
rail_swapmask = mix64(flow xor PP xor rotl(NN,11) xor a xor rc)
rail_compmask = mix64(rotl(flow,23) xor NN xor rotr(PP,17) xor c xor g)

(RP,RN) = K4_boundary(PP,NN,rail_swapmask,rail_compmask)

B0 = RN
B1 = RP
B2 = ~RP
B3 = ~RN

balanced_mix = B0 xor rotl(B1,13) xor rotl(B2,29) xor rotl(B3,47)
```

### 10.7 Observer fingerprint

Use an observer mask:

```text
O = mix64(flow xor balanced_mix xor rotl(rc,r))
```

Counts:

```text
hT   = popcount(T   & O)
hF   = popcount(F   & rotl(O,17))
hTop = popcount(TOP & rotr(O,23))
hBot = popcount(BOT & (O xor rotl(O,31)))
```

Small relational fingerprint:

```text
rel bit 0 = hT > hF
rel bit 1 = hTop > hBot
rel bit 2 = hT + hTop > hF + hBot
rel bit 3 = parity(hTop xor hBot)
rel bit 4 = hT + 2*hTop > 48
```

Expand:

```text
fp =
    expand_count(hT,0)
  xor expand_count(hF,1)
  xor expand_count(hTop,2)
  xor expand_count(hBot,3)
  xor expand_count(rel,4)
```

### 10.8 Full K₄ boundary whitening

```text
swapmask = mix64(fp xor RP xor a xor e xor rc)
compmask = mix64(rotl(fp,19) xor RN xor b xor g xor flow)

(WP,WN) = K4_boundary(PP,NN,swapmask,compmask)
```

### 10.9 Final fold

```text
bridge = mix64(flow xor (a + rotl(d,23) + rc) xor (c & rotl(g,7)))

z =
    bridge
  xor mix64(WP xor rotl(WN,7) xor balanced_mix)
  xor mix64(adjT xor rotl(adjTop,17) xor fp)
  xor mix64(T xor rotl(F,9) xor rotl(TOP,21) xor rotr(BOT,5))
```

Return `z`.

---

## 11. Permutation

State:

```text
st = [w0,w1,w2,w3,w4,w5,w6,w7]
```

Round `r`:

```text
rc = RC[r mod len(RC)] xor ((r+1) * 0x9E3779B97F4A7C15 mod 2^64)

F  = semantic_oracle_sigma(st[1..7], rc, r)

st = [w1,w2,w3,w4,w5,w6,w7,w0 xor F]
```

This is an 8-branch generalized Feistel permutation.

Inverse round:

```text
old_tail = st[0..6]
F        = semantic_oracle_sigma(old_tail, rc, r)
old0     = st[7] xor F
st       = [old0] + old_tail
```

---

## 12. Initialization

```text
seed = BLAKE2s(
    "RelCrypt-Sigma2-512 init"
    || len(key)_le16 || key
    || len(nonce)_le16 || nonce,
    digest_size=32
)

ext = BLAKE2s(seed || key || nonce || "ext", digest_size=32)

material = seed || ext
state = IV xor little_endian_words(material)
```

Then apply four initialization permutations:

```text
for i in 0..3:
    state[0] ^= 0x5349474D415F494E xor i
    state = sigma_perm(state, rounds)
```

---

## 13. Σ2-SIV mode

Σ2-SIV is the recommended encryption mode for this branch.

### 13.1 MAC / synthetic IV

```text
tag = sigma2_mac(key, nonce, AD, plaintext)
```

MAC state initialization:

```text
state = init_state(key, "Sigma2-SIV-MAC|" || nonce)
state[0] ^= 0x5349564D41430001
state[1] ^= len(AD)
state[2] ^= len(plaintext)
```

Absorb AD with domains:

```text
0xB0 = full AD block
0xB1 = final/padded AD block
```

Absorb plaintext with domains:

```text
0xB2 = full plaintext block
0xB3 = final/padded plaintext block
```

Finalize:

```text
state[0] ^= 0xF5
state[1] ^= len(nonce)
state[2] ^= len(AD)
state[3] ^= len(plaintext)
state = sigma_perm(state)
tag = first tag_len bytes of state
```

### 13.2 Stream encryption using synthetic IV

```text
ciphertext = plaintext xor stream(key, synthetic_iv=tag, AD)
```

Stream state:

```text
state = init_state(key, "Sigma2-SIV-STREAM|" || tag)
state[0] ^= 0x53545245414D0002
state[1] ^= len(AD)
```

Absorb AD with domains:

```text
0xD0 = full AD block
0xD1 = final/padded AD block
```

For block counter `i`:

```text
state[0] ^= 0xE0
state[1] ^= i
state = sigma_perm(state)
keystream = first rate bytes of state
cipher_block = plaintext_block xor keystream
```

### 13.3 Encryption

```text
tag = MAC(key, nonce, AD, plaintext)
ciphertext = stream_xor(key, tag, AD, plaintext)
return ciphertext, tag
```

### 13.4 Decryption

```text
plaintext = stream_xor(key, tag, AD, ciphertext)
candidate_tag = MAC(key, nonce, AD, plaintext)

if candidate_tag != tag:
    reject

return plaintext
```

Tag comparison must be constant-time in implementations.

---

## 14. Security posture

RelCrypt-Σ2-SIV-24 is not production cryptography.

The current intended claims are limited:

```text
- permutation invertibility follows from generalized Feistel structure
- decryption correctness follows from XOR stream symmetry and tag verification
- SIV shape avoids the ordinary catastrophic stream XOR leak under nonce reuse
- balanced FOUR + K₄ rail permutation fixes obvious first-order representation leakage in toy models
```

Explicitly not claimed:

```text
- indistinguishability from random permutation
- PRF/PRP security
- AEAD security proof
- resistance to all differential/linear/algebraic attacks
- side-channel security
- misuse resistance beyond the SIV-style construction shape
```

---

## 15. Implementation notes

Reference implementation files generated in this workbench:

```text
relcrypt_sigma2_512_lab.py
relcrypt_sigma2_siv_lab.py
```

The reference is intentionally readable, not optimized. It is pure Python and slow.

---

## 16. Test vectors

See:

```text
relcrypt-sigma2-siv-24-test-vectors.json
```

The JSON file contains deterministic vectors for edge cases and a nonce-reuse demonstration.
