---
title: "Collatz Barrier / Surplus Scratchpad Progress Note"
description: "A scratchpad research note on the Collatz attack surface in RelMath: parity prefixes, residue cylinders, affine traces (B·Tᵏ(n) = A·n + C), coefficient barriers, and surplus/failure measurements, with Python computations."
date-created: 2026-06-22
keywords: ["affine-trace", "Collatz", "parity-word", "relmath", "research-note", "residue-class", "surplus"]
---


_Date: 2026-06-22_

This note records the current state of the Collatz rabbit before pushing further. It is deliberately a **scratchpad research note**, not a proof claim.

The Python file generated alongside this note is:

```text
collatz_barrier_scratchpad.py
```

It reproduces the computations summarized below using only the Python standard library.

---

## 1. Guiding reframing

The working thesis after folding in the RelMath notes is:

> Collatz is not itself a closure operator.  
> Collatz induces lawful finite probes: parity prefixes, residue cylinders, affine traces, coefficient barriers, and surplus/failure measurements.

The useful split is:

```text
value dynamics:
  n ↦ T(n)

information dynamics:
  n ↦ parityWord(n,k) ↔ residue class mod 2^k

affine trace:
  B_w * T^|w|(n) = A_w*n + C_w

failure / surplus:
  S_w(n) = A_w*n + C_w - B_w*n
```

For the accelerated/shortcut map

```text
T(n) = n/2              if n is even
T(n) = (3*n + 1)/2      if n is odd
```

we define, for a finite parity word `w`:

```text
A_w = 3^(number of O symbols in w)
B_w = 2^(length w)
C_w = affine offset
```

with recurrence:

```text
empty:
  A = 1, B = 1, C = 0

append E:
  A' = A
  B' = 2B
  C' = C

append O:
  A' = 3A
  B' = 2B
  C' = 3C + B
```

The affine trace is:

```text
B_w * T^|w|(n) = A_w*n + C_w
```

whenever `n` lies in the parity cylinder for `w`.

---

## 2. Surplus as failure mass

Define:

```text
Surplus_w(n) := A_w*n + C_w - B_w*n
```

By affine trace:

```text
Surplus_w(n) = B_w * (T^|w|(n) - n)
```

So:

```text
Surplus_w(n) < 0   iff   T^|w|(n) < n
Surplus_w(n) = 0   iff   T^|w|(n) = n
Surplus_w(n) > 0   iff   T^|w|(n) > n
```

The surplus recurrence is especially clean:

```text
append E:
  S ↦ S - B*n

append O:
  S ↦ 3S + B*(n+1)
```

Interpretation:

```text
E drains surplus.
O pumps surplus.
A bad pre-descent branch is a legal pump/drain schedule whose surplus has not gone negative.
```

This is the Collatz-specific finite failure-energy accounting law I would try to preserve in Lean.

---

## 3. Coefficient barrier

The coefficient crossing condition is:

```text
A_w < B_w
```

or equivalently:

```text
3^(oddCount w) < 2^(length w)
```

The critical slope is:

```text
oddCount(w) / length(w) < log_3(2)
```

The experimental observation so far is:

> For every tested `n > 2`, first descent time equals first coefficient-crossing time.

That is exactly the Terras-shaped surface. It is not proved here.

---

## 4. Computational checks performed

The generated Python script was run with:

```text
--scan-limit 2000000
--random-samples 50000
--random-max-n 1000000000000000000
--seed 561
--first-passage-max-len 24
```

### 4.1 Affine trace verification

Checked:

```text
1 ≤ n < 500
0 ≤ k ≤ 30
```

Result:

```text
affine trace failures: 0
```

### 4.2 First descent time vs first coefficient crossing time

Scanned every integer:

```text
3 ≤ n ≤ 2,000,000
```

Result:

```text
mismatches: 0
```

Record holders for first coefficient crossing time in this range:

| n | first coefficient-crossing time |
|---:|---:|
| 3 | 4 |
| 7 | 7 |
| 27 | 59 |
| 703 | 81 |
| 10087 | 105 |
| 35655 | 135 |
| 270271 | 164 |
| 362343 | 165 |
| 381727 | 173 |
| 626331 | 176 |
| 1027431 | 183 |
| 1126015 | 224 |

### 4.3 Random large scan

Sampled:

```text
50,000 random n in [3, 10^18]
seed = 561
```

Result:

```text
mismatches: 0
```

Largest coefficient-crossing time encountered in this random sample:

```text
n = 942862410378974535
coefficient-crossing time = 202
stopping time = 202
```

### 4.4 First-passage word enumeration

A **first-passage word** is a finite parity word `w` such that:

```text
A_w < B_w
```

but every proper prefix `v` satisfies:

```text
A_v ≥ B_v
```

Enumerated all first-passage words through length `24`.

Result:

```text
first-passage words enumerated: 81,119
threshold failures at least positive n > 2 in cylinder: 0
```

Counts by length:

| length | count |
|---:|---:|
| 1 | 1 |
| 2 | 1 |
| 4 | 1 |
| 5 | 2 |
| 7 | 3 |
| 8 | 7 |
| 10 | 12 |
| 12 | 30 |
| 13 | 85 |
| 15 | 173 |
| 16 | 476 |
| 18 | 961 |
| 20 | 2652 |
| 21 | 8045 |
| 23 | 17637 |
| 24 | 51033 |

Smallest margins found, where

```text
margin = (B_w - A_w)*n - C_w
```

for the least positive `n > 2` in the cylinder:

| word | length | n | A | B | C | margin |
|---|---:|---:|---:|---:|---:|---:|
| E | 1 | 4 | 1 | 2 | 0 | 4 |
| OE | 2 | 5 | 3 | 4 | 1 | 4 |
| OOEE | 4 | 3 | 9 | 16 | 5 | 16 |
| OOEOE | 5 | 11 | 27 | 32 | 23 | 32 |
| OOOEE | 5 | 23 | 27 | 32 | 19 | 96 |

No first-passage cylinder through length `24` had the least positive `n > 2` fail to descend.

---

## 5. Barrier-prefix ecology

A **barrier prefix** is a coefficient-noncontracting prefix:

```text
A_w ≥ B_w
```

The active barrier-prefix tree grows quickly. Counts by depth through `24`:

| depth | active barrier prefixes |
|---:|---:|
| 0 | 1 |
| 1 | 1 |
| 2 | 1 |
| 3 | 2 |
| 4 | 3 |
| 5 | 4 |
| 6 | 8 |
| 7 | 13 |
| 8 | 19 |
| 9 | 38 |
| 10 | 64 |
| 11 | 128 |
| 12 | 226 |
| 13 | 367 |
| 14 | 734 |
| 15 | 1295 |
| 16 | 2114 |
| 17 | 4228 |
| 18 | 7495 |
| 19 | 14990 |
| 20 | 27328 |
| 21 | 46611 |
| 22 | 93222 |
| 23 | 168807 |
| 24 | 286581 |

The least positive integer `> 2` still represented in a barrier prefix stabilizes at `27` from depth `7` through depth `24` in this enumeration:

```text
depths 0-3: min n = 3
depths 4-6: min n = 7
depths 7-24: min n = 27
```

This matches the known intuition that `27` is an early long-delay extremal seed. In this scratchpad’s terms, `27` sits on a deep initial coefficient-barrier branch before first crossing/descent.

---

## 6. Current conjectural theorem targets

### 6.1 Affine trace theorem

```text
If parityWord(n,k) = w, then

  B_w * T^k(n) = A_w*n + C_w.
```

This is basic and should be Lean-feasible.

### 6.2 Surplus descent theorem

```text
If parityWord(n, |w|) = w, then

  A_w*n + C_w < B_w*n
    iff
  T^|w|(n) < n.
```

Use inequality form over `Nat`; avoid signed subtraction in the first Lean version.

### 6.3 Noncontracting prefix cannot descend

```text
If B_w ≤ A_w and parityWord(n, |w|) = w, then

  n ≤ T^|w|(n).
```

Reason: `C_w ≥ 0`.

### 6.4 First-passage descent conjecture

```text
If w is a first-passage word,
parityWord(n, |w|) = w,
and n > 2,
then

  T^|w|(n) < n.
```

This is the computationally supported but nontrivial theorem.

Equivalent word/residue form:

```text
For every first-passage word w, except terminal edge cases,
let r_w be the least positive n > 2 in its residue cylinder.
Then

  C_w < (B_w - A_w) * r_w.
```

If true, the inequality then holds for every larger positive representative in the same cylinder.

### 6.5 Counterexample dichotomy

A clean obstruction theorem should be:

```text
If Collatz fails, then either:

  1. there is a finite nonterminal cycle word w, or
  2. there is a positive-integer infinite barrier stream whose every finite prefix has A_w ≥ B_w.
```

The finite cycle case is exactly Diophantine:

```text
T^|w|(n) = n
⇒
(B_w - A_w)*n = C_w.
```

So cycle words must satisfy:

```text
B_w > A_w
(B_w - A_w) divides C_w
n = C_w / (B_w - A_w)
parityWord(n, |w|) = w
```

The infinite case becomes the critical symbolic object:

```text
for every k:
  oddCount(prefix_k) / k ≥ log_3(2)
```

---

## 7. What I would chase next

The next Python target is not more random scanning. It is the finite-word inequality:

```text
For first-passage words w:

  C_w < (B_w - A_w) * r_w
```

where `r_w` is the least positive representative `> 2` of the parity cylinder.

The next structural target is:

```text
Every infinite coefficient-noncontracting residue path has unbounded ordinary representatives.
```

If that were true, it would kill the infinite positive-natural barrier-stream obstruction.

In RelMath terms:

```text
Collatz counterexample = coherent positive-integer section avoiding the coefficient-descent cover.
```

The obstruction site is the parity-cylinder / residue-refinement tree.  
The finite failure mass is affine surplus.  
The critical boundary is the irrational slope `log_3(2)`.  
The likely hard corridor is Sturmian / continued-fraction / Stern-Brocot flavored.

---

## 8. Important caution

Nothing here proves Collatz.

The computations support a precise formal attack surface:

```text
first descent appears governed by first coefficient crossing
```

but this is known-adjacent terrain, close to Terras-style coefficient stopping time ideas. The value of this scratchpad is that it identifies exactly what should be stated, tested, and eventually formalized.
