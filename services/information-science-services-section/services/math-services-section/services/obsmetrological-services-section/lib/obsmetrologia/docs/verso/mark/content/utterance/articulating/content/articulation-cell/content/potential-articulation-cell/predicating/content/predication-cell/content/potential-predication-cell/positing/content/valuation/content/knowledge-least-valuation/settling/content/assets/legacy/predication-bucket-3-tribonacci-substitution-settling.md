---
kind: example
status: draft
depends-on: [step-n-substitution-rule, padovan-substitution-settling, fibonacci-substitution-settling]
instantiates: [step-n-substitution-rule, aperiodic-settling]
lineage: 5
---

# Tribonacci substitution settling

Anchor of **sub-lineage 5e** — the Tribonacci substitution $\sigma : a \mapsto ab, b \mapsto ac, c \mapsto a$. A step-3 substitution distinct from Padovan, testing whether different step-3 substitutions are MLD-distinct or MLD-equivalent.

## The Tribonacci recurrence

The Tribonacci sequence: $T_n = T_{n-1} + T_{n-2} + T_{n-3}$ with $T_0 = T_1 = T_2 = 1$. So $1, 1, 1, 3, 5, 9, 17, 31, \ldots$ — faster-growing than Padovan.

The substitution $\sigma : a \mapsto ab, b \mapsto ac, c \mapsto a$ has matrix:

$$M_{\text{Tribonacci}} \;=\; \begin{pmatrix} 1 & 1 & 1 \\ 1 & 0 & 0 \\ 0 & 1 & 0 \end{pmatrix}.$$

Characteristic polynomial: $x^3 - x^2 - x - 1 = 0$. Dominant eigenvalue: tribonacci constant $\tau \approx 1.8393$ — also Pisot, but distinct from Padovan's plastic number.

## Distinction from Padovan

Both Tribonacci and Padovan are step-3 substitutions on a 3-letter alphabet. They differ in:

- **Substitution matrix** (different entries).
- **Growth rate** (Padovan's $\rho \approx 1.3247$ vs Tribonacci's $\tau \approx 1.8393$).
- **Recurrence pattern** (Padovan: $P_n = P_{n-2} + P_{n-3}$; Tribonacci: $T_n = T_{n-1} + T_{n-2} + T_{n-3}$).

Both have rank-3 classifying invariants by the [step-n cohomological rank theorem](../theorems/step-n-cohomological-rank-theorem.md), but the matrices are *not* conjugate, so the invariants are MLD-distinct.

## Position in Lineage 5e

Demonstrates that **the rank-$n$ characterization isn't the *complete* classification** — same rank, different rules. The corpus's framework needs additional invariants (substitution-matrix conjugacy class, Bratteli-Vershik invariants, etc.) to fully classify step-$n$ rules within rank-$n$.

This is the L5e role: exhibiting *intra-rank* distinctions that the rank theorem alone doesn't make.
