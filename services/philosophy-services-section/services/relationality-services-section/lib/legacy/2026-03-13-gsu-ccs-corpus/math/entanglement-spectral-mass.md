---
id: entanglement-spectral-mass
name: EntanglementSpectralMass
description: "the entanglement measure is the microscopic version of spectral mass — summing ent over formulas at depth n is proportional to the spectral mass at that depth."
---

### Conjecture — Entanglement Spectral Mass {#entanglement-spectral-mass}

**Statement.** Let $\mathsf{ent}(M)$ be the entanglement measure from the strong normalization proof (§strong-normalization), and let $M_t(\delta)$ be the spectral mass at history $t$ and depth $\delta$ (§spectral-decomposition). Then:
$$
M_t(\delta) \;\propto\; \sum_{\substack{M \in \mathrm{NF}_t \\ \mathrm{depth}(M) = \delta}} \mathsf{ent}(M)
$$
where $\mathrm{NF}_t$ denotes the set of normal forms at $t$.

**Motivation.** The entanglement measure $\mathsf{ent}(M)$ counts $\Delta$-inside-$\sigma$ nesting depth — the number of times a transfer operator is wrapped inside a saturation operator. This is precisely the structure that fails to restrict cleanly across histories; high-entanglement formulas are the ones that carry information from deeper histories.

The spectral mass $M_t(\delta)$ measures how much of the fiber algebra at history $t$ lives at depth $\delta$ — how much information at that history originates from depth-$\delta$ generating events. The conjecture identifies these two measures: the spectral mass is the aggregate entanglement of all normal forms at that depth.

**Consequence.** The decrease of $\mathsf{ent}$ under R7 (exactly 1 per application, §strong-normalization) is then the microscopic Landauer erasure event: each R7 application is one bit of irreversible settling (§landauer-limit). The cosmological constant, if it exists in this framework, would be the cumulative sum of all R7 steps that have ever fired — the total irreversible information cost of the universe reaching its current state.

**What a proof requires.**

1. An explicit formula for $M_t(\delta)$ in terms of the fiber algebra $H_t$ and the depth filtration.

2. Verification in the base case: compute $\mathsf{ent}$ for all normal forms at depth 1 and 2, compute $M_t(\delta)$ for the diamond monoid, and check proportionality.

3. A general proof by induction on depth, using the recurrence structure of the entanglement bound in the normalization proof.

**Depends on:** §strong-normalization, §landauer-limit, §spectral-decomposition.
