# RelCrypt-Σ2-SIV-24 Design Rationale

**Status:** research design note.  
**Subject:** why Σ2-SIV looks the way it does.

---

## 1. Why Σ2 is the consolidation branch

Earlier branches explored many RelMath-flavored ideas:

```text
Φ:
  first coherent 512-bit permutation/stream branch

Ψ:
  large-state, hardcore semantic branch

Ω:
  adjoint sandwich, nuclear commutator, Chu/FCA observer experiments

Σ:
  encryption-focused branch with balanced FOUR

Σ2:
  balanced FOUR + K₄ rail permutation + SIV mode
```

The current recommendation is to consolidate around:

```text
RelCrypt-Σ2-SIV-24
```

because it has the cleanest encryption shape:

```text
- 512-bit generalized-Feistel permutation
- mandatory 𝔽₂ / ARX flow bridge
- FOUR evidence geometry
- Gauge₂ internal mask
- full K₄ boundary/rail mask
- balanced FOUR representation
- SIV-style encryption interface
```

It is less ornamental than Ψ and Ω, but more suitable as an encryption candidate.

---

## 2. Why not direct K₄ encryption?

The earliest naive idea was:

```text
plaintext bits
→ pair into FOUR
→ apply K₄ masks
→ serialize as ciphertext
```

That fails.

For zero plaintext, all FOUR cells start as `⊥ = 00`. Under K₄, `⊥` can only move to `⊥` or `⊤`, never to the classical middle states. The ciphertext alphabet collapses and leaks structure.

Conclusion:

```text
K₄ is not the whole cipher.
K₄ is a masking/whitening geometry around a 𝔽₂ cipher core.
```

---

## 3. Why 𝔽₂ remains central

The Boolean field is the right substrate for:

```text
- XOR stream encryption
- Feistel plumbing
- recurrence
- bitwise diffusion
- algebraic-degree analysis
- bitslicing
- linear and affine layers
```

RelCrypt does not replace Boolean cryptography with FOUR-valued logic. It augments Boolean cryptography with semantic structure.

---

## 4. Why Gauge₂ inside closure

Inside monotone knowledge-style closure, use:

```text
Gauge₂ = {id, neg}
```

not full K₄.

Reason:

```text
neg preserves the knowledge order
conf reverses the knowledge order
negConf reverses both orders
```

So full K₄ is too broad for internal monotone closure unless order reversal is explicitly intended.

Design law:

```text
Gauge₂ inside closure.
Full K₄ at boundaries.
D₄ only for explicit order/role swapping.
```

---

## 5. Why balanced FOUR

Raw two-bit FOUR leaks through Hamming weight:

```text
⊥ = 00, weight 0
t = 10, weight 1
f = 01, weight 1
⊤ = 11, weight 2
```

Gauge₂ hides truth-vs-false polarity but does not hide top/bottom class.

Balanced FOUR code:

```text
code(P,N) = (N, P, ~P, ~N)
```

has constant lane weight 2.

Σ2 further applies a K₄ representation mask before coding, so fixed rails do not directly reveal the unmasked representative in a first-order toy leakage model.

---

## 6. Why the flow bridge is mandatory

Closure/settling is many-to-one and can saturate. Earlier Ψ experiments showed that if the semantic layer is too dominant, dependency paths can die and avalanche can collapse.

So every serious branch now includes an explicit raw bit-dependency bridge:

```text
𝔽₂ / ARX flow bridge
```

This is not “ugly conventional plumbing.” It is the dependency skeleton that keeps the exotic semantic layer from collapsing the cipher.

---

## 7. Why SIV mode

A plain stream cipher has a catastrophic failure under nonce reuse:

```text
ct1 xor ct2 = pt1 xor pt2
```

Σ2-SIV instead computes:

```text
tag = MAC(key, nonce, AD, plaintext)
ciphertext = plaintext xor stream(key, synthetic_iv=tag, AD)
```

For distinct plaintexts under the same nonce, the synthetic IV changes, so the ordinary XOR-of-plaintexts leak does not occur.

Tradeoff:

```text
Same key/nonce/AD/plaintext gives same ciphertext and tag.
```

That is expected SIV determinism.

---

## 8. What is RelMath-native here?

The RelMath-native part is not merely the presence of K₄.

It is the combination:

```text
FOUR evidence rows:
  truth / false / top / bottom

Gauge discipline:
  representative masking

Settling pulse:
  nonlinear monotone evidence closure on scratch planes

Observer fingerprint:
  row-count and row-relation observables

Balanced representation:
  side-channel representation theory for FOUR/K₄
```

This is a cipher where internal state carries semantic geometry, but encryption remains disciplined by conventional permutation/SIV structure.

---

## 9. Current research thesis

```text
RelCrypt studies encryption where internal cipher state is not merely Boolean,
but carries FOUR-valued evidence geometry, gauge representative structure,
and observer-relative invariants, while the actual cryptographic plumbing remains over 𝔽₂.
```

Short version:

```text
Bits move.
FOUR interprets.
Gauge masks.
Settling observes.
SIV encrypts.
```
