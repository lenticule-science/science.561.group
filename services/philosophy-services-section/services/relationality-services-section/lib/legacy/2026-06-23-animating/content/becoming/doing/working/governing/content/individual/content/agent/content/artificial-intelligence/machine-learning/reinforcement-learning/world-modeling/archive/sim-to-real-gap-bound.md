---
type: theorem
class: classical
status: proved
depends-on:
  - ../morphisms/sim-to-real-transfer.md
  - ../objects/model-error.md
see-also:
  - model-error-compounds.md
references:
  - references/kakade-langford2002.md
---

# Sim-to-real gap bound

## Statement

Let $T_{\mathrm{sim}}$ be a simulator's transition function and
$T_{\mathrm{real}}$ the true real-world dynamics, both with the
same state and action spaces. Suppose for all $(s, a)$,

$$
d_{\mathrm{TV}}(T_{\mathrm{sim}}(\cdot\mid s,a),\, T_{\mathrm{real}}(\cdot\mid s,a)) \le \epsilon_{\mathrm{sim}}.
$$

Let $\pi$ be a policy with $V^{\pi}_{\mathrm{sim}}$ its value in
simulation and $V^{\pi}_{\mathrm{real}}$ its value in reality, both
under bounded rewards $r \in [0, R_{\max}]$ and discount $\gamma$.
Then

$$
\bigl|V^{\pi}_{\mathrm{sim}}(s_0) - V^{\pi}_{\mathrm{real}}(s_0)\bigr|
\;\le\;
\frac{2 R_{\max} \gamma}{(1-\gamma)^2} \cdot \epsilon_{\mathrm{sim}}.
$$

Equivalently in finite-horizon $H$:

$$
\bigl|V^{\pi}_{\mathrm{sim}} - V^{\pi}_{\mathrm{real}}\bigr|
\;\le\;
R_{\max} \cdot H^2 \cdot \epsilon_{\mathrm{sim}}.
$$

## Proof sketch

This is the simulation lemma applied to two MDPs that differ only
in their transition functions. The $H^2$ (equivalently
$1/(1-\gamma)^2$) factor decomposes:

- One factor of $H$ from the
  [model-error-compounds](model-error-compounds.md) bound on
  trajectory-distribution discrepancy.
- A second factor of $H$ from the integrated reward over the
  trajectory.

Together they give the quadratic-in-horizon performance loss.
A formal statement of the simulation lemma is given by
[kakade-langford2002](references/kakade-langford2002.md);
the specialization to sim-to-real appears in numerous robotics
references.

## Why it matters

The bound is the formal version of the engineering intuition
that **small simulator inaccuracies become large performance
losses over long horizons**. It implies:

- **Short-horizon tasks are forgiving.** Manipulation primitives
  (grasp, place) of horizon 50 can tolerate substantial simulator
  inaccuracy. Long-horizon planning (multi-hour autonomous
  driving) cannot.
- **Reducing $\epsilon_{\mathrm{sim}}$ has linear payoff in the
  bound.** A 10× more accurate simulator gives 10× tighter
  performance gap. Investment in simulator fidelity is
  essentially always justified.
- **Re-planning narrows the effective horizon.** If the policy
  re-plans every $K$ steps using fresh real-world state, the
  effective horizon for sim-to-real degradation per plan is $K$,
  not the full task horizon.

## Lipschitz refinement

A tighter bound replaces the worst-case $\epsilon_{\mathrm{sim}}$
with a *policy-weighted* discrepancy: the model only needs to be
accurate on the on-policy distribution. For policies that visit a
small region of the state space, this can be substantially
tighter than the uniform bound. This is the formal basis for
**domain randomization** working: it constrains the policy to
be robust enough that on-policy real-world states are within the
simulator's accuracy region, even when the global simulator
inaccuracy is large.

## Relation to learned models

This theorem is mathematically identical to
[model-error-compounds](model-error-compounds.md). The substantive
difference is the *source* of the error: a simulator's error
comes from modeling decisions and engineering compromises, while
a learned model's error comes from limited data and approximation
class capacity. The bound applies in either case.
