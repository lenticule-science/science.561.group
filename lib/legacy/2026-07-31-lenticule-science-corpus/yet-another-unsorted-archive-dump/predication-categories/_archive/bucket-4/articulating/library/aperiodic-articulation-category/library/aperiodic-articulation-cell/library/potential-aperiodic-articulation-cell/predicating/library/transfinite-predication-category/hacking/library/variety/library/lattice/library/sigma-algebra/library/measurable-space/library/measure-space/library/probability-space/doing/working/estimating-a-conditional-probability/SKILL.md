---
name: estimating-a-conditional-probability
description: Estimates P(A|B) from counted outcomes by defining the sample space, counting co-occurrences of A and B, and dividing by the count of B. Use when computing a conditional probability from data.
---

## Requirements

- A clearly defined sample space.
- A count of outcomes where both A and B occur.
- A count of outcomes where B occurs (the conditioning event).

## Steps

1. State the sample space explicitly.
2. Count outcomes where B occurs: `n(B)`.
3. Count outcomes where both A and B occur: `n(A ∩ B)`.
4. Compute `P(A|B) = n(A ∩ B) / n(B)`.
5. Report the result with the counts used.

## Outcomes

- The estimated conditional probability `P(A|B)` as a fraction and decimal.
- The counts `n(B)` and `n(A ∩ B)` used in the computation.
