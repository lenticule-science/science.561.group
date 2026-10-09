---
type: example
status: draft
depends-on: [step-n-substitution-rule, step-n-and-bilattice-correspondence, padovan-substitution-settling, four-bilattice]
instantiates: [step-n-substitution-rule, aperiodic-settling]
lineage: 5
---

# Tetranacci substitution settling

Anchor of **sub-lineage 5f** — a step-4 substitution exhibiting the bilattice correspondence at $n = 4$. The substitution alphabet of size 4 aligns with the full bilattice $\{\bot, \mathbf{t}, \mathbf{f}, \top\}$ per the [step-n / bilattice correspondence theorem](../../aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/step-n-and-bilattice-correspondence.md).

## The Tetranacci substitution

A step-4 substitution can take many specific forms. A canonical choice:

$$\sigma : a \mapsto ab, \quad b \mapsto ac, \quad c \mapsto ad, \quad d \mapsto a.$$

Substitution matrix:

$$M_{\text{Tetranacci}} \;=\; \begin{pmatrix} 1 & 1 & 1 & 1 \\ 1 & 0 & 0 & 0 \\ 0 & 1 & 0 & 0 \\ 0 & 0 & 1 & 0 \end{pmatrix}.$$

Tetranacci recurrence: $T_n = T_{n-1} + T_{n-2} + T_{n-3} + T_{n-4}$. Growth rate is the *tetranacci constant* $\approx 1.9276$ — also Pisot, degree-4 algebraic.

## Bilattice correspondence at $n = 4$

By the bilattice correspondence theorem, the alphabet $\{a, b, c, d\}$ aligns with the full bilattice $\{\bot, \mathbf{t}, \mathbf{f}, \top\}$:

- $a$ ↔ $\bot$ (uninstantiated).
- $b$ ↔ $\mathbf{t}$ (truth-positive).
- $c$ ↔ $\mathbf{f}$ (falsity-positive).
- $d$ ↔ $\top$ (paraconsistent).

The substitution dynamics, under this correspondence, traces out trajectories through the bilattice's value space — making the bilattice's full structure visible at the substitution-rule level.

## Position in Lineage 5f

The L5f anchor — predication categories' first step-4 substitution example, exhibiting the full bilattice-correspondence at $n = 4$. The structurally most-aligned step-$n$ instance with predication categories' bilattice flavor.
