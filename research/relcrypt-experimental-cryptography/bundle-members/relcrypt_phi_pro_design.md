
# RelCrypt-Φ: Pro Design Brief

**Status:** serious research-cipher design, not production cryptography.  
**Goal:** build new encryption algorithms from the relational-math spine without forcing the math to conform to existing crypto categories.  
**Core thesis:** keep `𝔽₂` as the bit engine; place FOUR/K₄/D₄ as semantic/gauge geometry around it; use settling/cohomology as nonlinear observable structure.

---

## 1. The correction

Earlier toy designs got one thing right and one thing wrong.

They got right:

```text
𝔽₂ should do the bit algebra.
K₄ should do gauge/masking.
FOUR should supply semantic state geometry.
Settling/cohomology should supply nonlinear observers.
```

They got wrong:

```text
full K₄ should not be treated as if it preserves every semantic operation.
```

For knowledge-order closure, the clean internal side-channel mask is not all of K₄. It is the subgroup:

```text
Gauge₂ = {id, neg}
```

because `neg` preserves the knowledge order. By contrast:

```text
conf    reverses knowledge order
negConf reverses knowledge order
```

So the correct layering is:

```text
inside monotone knowledge closure:
  use Gauge₂ = {id, neg}

between rounds / domains / observers:
  use full K₄ or D₄ as semantic whitening

inside the raw bit engine:
  use 𝔽₂ recurrence, nonlinear Boolean filtering, affine diffusion
```

That is the architectural unlock.

---

## 2. RelCrypt object hierarchy

```text
Layer 0: 𝔽₂ bit engine
  - LFSR/NLFSR recurrence
  - Boolean nonlinear filter
  - affine diffusion
  - keystream generation
  - Feistel/SPN plumbing

Layer 1: FOUR bit-plane geometry
  - positive evidence plane P
  - negative evidence plane N
  - truth row      T   =  P & ~N
  - false row      F   = ~P &  N
  - top row        TOP =  P &  N
  - bottom row     BOT = ~P & ~N

Layer 2: Gauge₂ masking
  - id:  (P,N) ↦ (P,N)
  - neg: (P,N) ↦ (N,P)
  - self-inverse
  - knowledge-order compatible

Layer 3: Full K₄ / D₄ whitening
  - K₄: id, neg, conf, negConf
  - D₄: add order-swap symmetries
  - used at round boundaries and observer boundaries

Layer 4: settling / cohomology observables
  - local monotone closure pulse
  - truth H⁰ count
  - inconsistency H⁰ count
  - top-boundary count
  - row-separation fingerprint
  - optional regime fingerprint
```

---

## 3. Design family

RelCrypt should not be one algorithm at first. It should be a family of three linked algorithms.

```text
RelStream-Φ:
  stream cipher / keystream generator

RelPerm-Φ:
  512-bit permutation / sponge core

RelFeistel-Φ:
  block-cipher workbench using non-invertible settling round functions
```

The common primitive is the **semantic pulse**.

---

## 4. The semantic pulse

A semantic pulse is a nonlinear function from bit state to bit state that passes through FOUR geometry.

### Inputs

```text
x0, x1, x2, x3 : 64-bit Boolean-field words
k              : 64-bit round/key/tweak word
r              : round counter
```

### Step 1: derive FOUR planes

```text
P = x0 xor rotl(x1, a_r) xor k
N = x2 xor rotl(x3, b_r) xor rotr(k, c_r)
```

### Step 2: Gauge₂ mask before closure

Derive a one-bit-per-lane mask:

```text
G = x1 xor rotl(x2, d_r) xor round_constant_r
```

Apply:

```text
(P,N) = select(G, (N,P), (P,N))
```

This is `{id, neg}` only.

### Step 3: local monotone closure pulse

Compute rows:

```text
T   =  P & ~N
F   = ~P &  N
TOP =  P &  N
BOT = ~P & ~N
```

Fire local positive/negative/top evidence:

```text
pos_fire =
    rotl(T, α)
  | (rotl(P, β) & rotr(N, γ))
  | keyed_positive_boundary

neg_fire =
    rotr(F, δ)
  | (rotr(P, ε) & rotl(N, ζ))
  | keyed_negative_boundary

top_fire =
    (pos_fire & neg_fire)
  | rotl(TOP, η)
  | boundary_coupling
```

Then close inflationarily:

```text
P' = P | pos_fire | top_fire
N' = N | neg_fire | top_fire
```

Important: this closure is applied to scratch planes, not permanent state. It may saturate locally, which is fine because it is an oracle/observer, not the whole cipher.

### Step 4: cohomological observables

```text
T'   =  P' & ~N'
F'   = ~P' &  N'
TOP' =  P' &  N'

h_truth = popcount(T')
h_false = popcount(F')
h_top   = popcount(TOP')
h_edge  = popcount(TOP' xor rotl(TOP', 1))
```

Compress:

```text
H =
    expand(h_truth, domain=0)
  xor expand(h_false, domain=1)
  xor expand(h_top,   domain=2)
  xor expand(h_edge,  domain=3)
```

### Step 5: full K₄ boundary whitening

Now full K₄ is allowed, because this is a boundary transform.

Derive two mask planes:

```text
M0 = x0 xor x2 xor rotl(H, μ)
M1 = x1 xor x3 xor rotr(H, ν)
```

Apply K₄ action:

```text
id      if (M0,M1)=(0,0)
neg     if (M0,M1)=(1,0)
conf    if (M0,M1)=(0,1)
negConf if (M0,M1)=(1,1)
```

### Step 6: fold back into 𝔽₂ state

```text
y0 = x0 xor P' xor rotl(H, 11)
y1 = x1 xor N' xor rotl(P' & N', 23)
y2 = x2 xor rotl(T' xor F', 37)
y3 = x3 xor nonlinear_mix(P', N', H, k)
```

The pulse output is:

```text
(y0,y1,y2,y3)
```

---

## 5. RelStream-Φ

RelStream-Φ is the stream-cipher candidate.

### State

```text
S = eight 64-bit words:
  a,b,c,d,e,f,g,h

counter = 64-bit
```

### Key/nonce initialization

Absorb:

```text
key
nonce
domain separator
algorithm version
```

into the state, then run many blank rounds:

```text
for i in 0..31:
  S = RelPermRound(S, init_constant_i)
```

### Round

Each keystream word generation:

```text
1. advance 𝔽₂/NLFSR core
2. run semantic pulse on selected words
3. run affine diffusion over all eight words
4. emit filtered word
5. feed output back into hidden state
6. increment counter
```

### Output filter

Do not emit raw state.

Emit:

```text
z =
    nonlinear_filter(a,b,c,d)
  xor semantic_observable(e,f,g,h)
  xor counter_mixed
```

Then apply final whitening:

```text
z = finalizer(z)
```

### Encryption

```text
C = P xor keystream(key, nonce)
```

### Decryption

```text
P = C xor keystream(key, nonce)
```

### Notes

RelStream-Φ is the successor to V5, not V6:

```text
V5 insight:
  simple bitsliced semantic pulse is better than over-heavy closure

Φ correction:
  Gauge₂ inside closure; full K₄ only at semantic boundaries
```

---

## 6. RelPerm-Φ

RelPerm-Φ is the more important long-term object: a 512-bit permutation.

### State

```text
S = 8 × 64-bit words
```

### Round structure

A round is:

```text
1. column Boolean nonlinear layer
2. semantic pulse on word quartets
3. K₄/D₄ boundary whitening
4. row affine diffusion
5. round constant injection
```

### Why permutation?

A permutation gives:

```text
stream cipher
sponge hash
MAC
AEAD
KDF
PRNG
commitment toy
```

from one object.

This is probably the right foundation for serious RelCrypt.

### Sponge mode

```text
absorb associated data
absorb plaintext/ciphertext
squeeze keystream or tag
```

This gives an AEAD-like construction without bolting on an unrelated MAC.

---

## 7. RelFeistel-Φ

RelFeistel-Φ is the block-cipher workbench.

### Key insight

Closure is many-to-one. That is bad for a standalone block permutation.

But Feistel round functions may be many-to-one.

So:

```text
non-invertible settling oracle inside
invertible Feistel outside
```

### Block size

Research target:

```text
128-bit block
4 × 32-bit or 2 × 64-bit branches
```

### Round

```text
L, R = R, L xor FΦ(R, round_key, round_index)
```

where `FΦ` is:

```text
𝔽₂ diffusion
→ FOUR lift
→ Gauge₂ masked closure pulse
→ truth/inconsistency observables
→ K₄/D₄ boundary whitening
→ Boolean compression
```

### Why keep this branch?

Feistel lets us use the weirdest RelMath machinery without making every subpiece invertible.

---

## 8. Side-channel masking direction

K₄ is not just a cipher feature. It gives a masking calculus.

### Mask

```text
masked_charge = Gauge₂.act(g, charge)
```

where:

```text
g ∈ {id, neg}
```

### Unmask

```text
charge = Gauge₂.act(g, masked_charge)
```

because every gauge element is self-inverse.

### Research question

Can we implement FOUR computations such that intermediate leakage sees only the gauge orbit, not the representative?

This is the side-channel program:

```text
- represent intermediate semantic values as gauge-masked FOUR states
- perform gauge-covariant operations when possible
- refresh masks between operations
- track which operations preserve or reverse knowledge/truth order
```

The key discipline:

```text
Use Gauge₂ for KLE-preserving masked closure.
Use full K₄ only where order-reversal is explicitly tolerated.
```

---

## 9. What to test next

### Statistical tests

Continue:

```text
- monobit
- byte chi-square
- entropy
- serial correlation
- runs
- matrix rank
- linear complexity
- avalanche
- sampled differential probes
```

Add:

```text
- large-sample PractRand-style streaming tests
- TestU01-style batteries
- NIST STS-style batteries
```

### Cryptanalytic tests

For stream candidates:

```text
- state recovery with known keystream
- correlation attacks against the F₂ core
- algebraic degree growth
- Berlekamp-Massey on larger windows
- low-weight differential probes
- nonce/key relatedness
```

For block candidates:

```text
- differential distribution
- linear approximation table sampling
- impossible differentials
- rotational symmetries
- invariant subspace search
- meet-in-the-middle on reduced rounds
- SAT/SMT distinguishers
```

### Side-channel tests

```text
- Hamming-weight leakage model
- correlation power analysis toy model
- masked vs unmasked FOUR intermediates
- gauge refresh effectiveness
```

---

## 10. What to formalize in Lean

### First Lean module

```text
RelMath/Crypto/GaugeMask.lean
```

Prove:

```text
Gauge₂ = {id, neg}
Gauge₂ closed under K₄.mul
Gauge₂ elements self-inverse
Gauge₂ action preserves KLE
Gauge₂ masks/unmasks charges
Gauge₂ masks/unmasks valuations
inconsistency content is Gauge₂-invariant
truth side flips under neg
```

### Second Lean module

```text
RelMath/Crypto/SemanticPulse.lean
```

Formalize a tiny version of:

```text
FOUR planes
Gauge₂ masked closure pulse
truth/top observables
boundary observables
```

Do not try to prove cipher security yet. Prove structural properties:

```text
- closure pulse is inflationary in KLE
- closure pulse is monotone
- Gauge₂ masking commutes with allowed closure fragments, or record exactly where it does not
- observables invariant/equivariant under Gauge₂
```

### Third Lean module

```text
RelMath/Crypto/Feistel.lean
```

Prove the generic theorem:

```text
Feistel is invertible for arbitrary round function F.
```

Then instantiate `F` with semantic pulse.

That gives immediate formal value even before cryptanalysis.

---

## 11. The actual RelCrypt research program

The real object is not “a cute stream cipher.”

It is this:

```text
A family of ciphers whose nonlinear layer is an observer of FOUR-valued settling,
with gauge-masked representatives and Boolean-field recurrence.
```

This gives four research axes:

```text
1. Cryptographic strength:
   can the resulting streams/permutations resist standard attacks?

2. Semantic novelty:
   what does FOUR/K₄/cohomology contribute that ordinary Boolean designs do not?

3. Masking discipline:
   can Gauge₂ provide a natural side-channel masking model?

4. Formal bridge:
   can Lean prove the algebraic invariants and invertibility scaffolding?
```

---

## 12. Current best next build

Build:

```text
RelPerm-Φ-512
```

not another stream-only toy.

### Why

A permutation can become everything else.

### Minimum viable permutation

```text
state: 512 bits
rounds: 12, 16, 20 variants
round:
  Boolean nonlinear layer
  semantic pulse on two quartets
  cross-lane affine diffusion
  K₄ boundary whitening
  constants
```

Then derive:

```text
RelStream-Φ = counter-mode squeeze of RelPerm-Φ
RelMAC-Φ    = sponge tag
RelAEAD-Φ   = duplex encrypt+tag
```

---

## 13. Short version

The thing we actually want is:

```text
RelPerm-Φ:
  a 512-bit permutation whose nonlinearity is partly generated by
  Gauge₂-masked FOUR settling observables,
  with full K₄/D₄ used as round-boundary semantic whitening,
  and 𝔽₂ used as the recurrence/diffusion substrate.
```

That is the serious version.

Not:

```text
K₄ encrypts bits.
```

But:

```text
K₄ controls which semantic representative the bit engine sees.
Settling produces nonlinear semantic observables.
Cohomology tells us what survives observation.
𝔽₂ does the actual cryptographic plumbing.
```
