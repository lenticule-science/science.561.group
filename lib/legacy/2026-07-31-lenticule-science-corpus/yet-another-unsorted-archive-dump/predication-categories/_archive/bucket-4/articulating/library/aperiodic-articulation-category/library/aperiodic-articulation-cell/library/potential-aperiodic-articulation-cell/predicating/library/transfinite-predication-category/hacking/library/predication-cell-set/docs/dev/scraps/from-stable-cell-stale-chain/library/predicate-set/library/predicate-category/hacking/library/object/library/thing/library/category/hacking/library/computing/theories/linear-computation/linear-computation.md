---
name: linear-computation
description: The sub-*-autonomous fragments of CGS strictly below ILL — MLL (multiplicative linear logic, bare resource-sensitive computation) and MALL (multiplicative-additive, adding deterministic choice). Every resource is used exactly once; no copying (contraction) or discarding (weakening).
component-of: computing
---

# Linear Computation

The resource-sensitive fragments of the theory of computing, sitting strictly below ILL in the linear logic fragment lattice of $\mathbf{CGS}$. Two levels:

- **MLL** (multiplicative linear logic): tensor product $\otimes$ and par $\invamp$; computation that uses each input exactly once. The bare resource-tracking layer.
- **MALL** (multiplicative-additive): adds $\oplus$ (additive disjunction, deterministic choice) and $\&$ (additive conjunction, internal choice). MALL is MLL with the ability to branch.

Neither fragment has the $!$ comonad that allows copying; ILL adds $!$ (the "of course" modality) and recovers a Cartesian closed structure via the Kleisli construction $\mathcal{Kl}(!) \simeq \mathbf{Eff}$. Linear computation is therefore the theory of programs that cannot reuse or discard their inputs — the discipline Girard introduced to give a resource-sensitive foundation for classical logic.
