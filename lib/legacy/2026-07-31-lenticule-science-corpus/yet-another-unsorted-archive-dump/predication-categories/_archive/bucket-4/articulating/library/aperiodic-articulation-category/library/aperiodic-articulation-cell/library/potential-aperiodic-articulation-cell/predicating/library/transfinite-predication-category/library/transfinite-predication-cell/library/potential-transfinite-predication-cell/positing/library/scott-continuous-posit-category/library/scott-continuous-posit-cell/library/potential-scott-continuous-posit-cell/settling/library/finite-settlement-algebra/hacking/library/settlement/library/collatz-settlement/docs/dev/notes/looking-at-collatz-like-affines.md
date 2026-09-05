---
title: "Looking at Collatz-like affines"
type: doc
status: draft
author: emsenn
date: 2025-10-17
keywords:
  - collatz
  - ritm
  - dynamics
publish_to:
  - emsenn-net
---

Over the years I've found looking at the Collatz conjecture as a fun way to explore relationality, and now that I've got Relational Infinity-Topos Modality and a RITM Python Simulator, I could test whether its ideas of comonadic stabilization and modal commution can be observed in a discrete arithmetic system.

In our simulator, RITM's operators were implemented as boolean matrix transforms:

- Relations $R$ on a finite set $X$ encode transitions $x_i \to x_j$.
- The comonad $C = □◇$ (box-diamond) represents reflexive-transitive closure.
- Defect $ρ = C(R) - R$ measures deviation from modal equilibrium.

I set up the Collatz function:

$$
f(n)=
\begin{cases}
n/2, & n \text{ even},\\
3n+1, & n \text{ odd.}
\end{cases}
$$

To represent the dynamics relationally:

- Construct a boolean relation $R_0$ encoding pairs $(i,f(i))$ for $i<n$.
- Apply stepwise comonadic closure $C_k$ iteratively.
- Track key quantities:
  - **Residual Defect** $ρ_t = C(R_t) - R_t$
  - **Action Functional** $S_t = \|ρ_t\|$
  - **Coherence** $σ_t$: normalized idempotence, $σ_t=1$ when $C(R_t)=R_t$.

Observations:

1. With **full transitive closure**, the system saturates instantly: all points become mutually connected, producing trivial equilibrium. (Physically meaningless: total thermalization.)
2. With **stepwise closure**, $S_t$ decreases gradually, showing smooth energy descent.
3. By step 2, $S→0$ and $σ→1$: complete stabilization.

Interpretation:

- Comonadic stabilization corresponds to a physical equilibrium: $C(R)=R$ ⇒ no residual energy export.
- The Collatz relation is self-cohesive: it becomes its own topology in finite steps.
- $S_t$ and $σ_t$ serve as discrete analogues of energy and order parameters.

I then look at residue classes modulo small integers $m$, partitioning the domain and comparing stabilization behavior per class. This residue-class analysis reveals hidden symmetries and rate differences that could be used to probe the arithmetic structure of Collatz-like affines via RITM’s operators.

