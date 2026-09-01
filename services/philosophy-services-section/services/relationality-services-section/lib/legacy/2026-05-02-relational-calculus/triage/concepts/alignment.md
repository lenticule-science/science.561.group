---
name: alignment
type: concept
status: sketch
---

The act of deepening shallower relational structures to match the reflexive depth of deeper ones. When structures at different reflexive levels must relate, the shallower must be *lifted* to the depth of the deeper. This lifting is alignment.

## What it is

The *AlignmentOperator* takes a structure at depth $n$ and maps it to a corresponding structure at depth $m > n$, preserving its relational content while embedding it in the deeper reflexive context.

The problem alignment solves: when two structures exist at different reflexive depths, they cannot meaningfully relate without losing information. Alignment deepens the shallower so both operate at the same level. Two related conditions: *type-homogeneity* (no type escalation across depths) and *depth-coherence* (internal stability across reflexive levels).

## Where the structure appears

- **In the act-algebra**: alignment is explicit. $\text{Align}(n) = \text{Relate}(\text{Relate}(\text{Project}(n), \text{Project}(n)), \text{Project}(n-1))$ relates a projection to itself and then to its prior projection — bringing two levels of projective structure into correspondence.
- **In the order-theoretic treatment**: the transfinite closure tower formalizes alignment as an ordinal-indexed sequence where each level includes the previous. The embedding maps between levels *are* alignment operators — monotone maps between successive stages of the closure tower.

## Where alignment lives in the mature framework

Alignment does not correspond to a single named operator in the mature articulation. It is implicit in several constructions:

- **[Iterate](iterate.md)**: $\text{Iterate}^n(a)$ produces a chain $a \leq S(a) \leq S^2(a) \leq \ldots$ — each step "aligns" $a$ to a deeper level of self-application.
- **[Close](close.md)**: $\text{Close}(a) = \bigvee_n \text{Iterate}^n(a)$ — alignment completed to its limit.
- **[Cohesive Chain](cohesive-chain.md)**: each adjunction translates between levels. These are sophisticated alignment operators connecting different perspectives.
