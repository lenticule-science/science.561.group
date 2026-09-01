---
id: stabilization-envelope-dyad
name: StabilizationEnvelopeDyad
description: "Phenomenon: The Stabilization-Envelope Dyad — the pair (π_t, Env_t) that bounds a proposition from above and below relative to the fixed fiber H_t*; the upward pole π_t is the joint projection (§joint-projection), the downward pole Env_t is the stable envelope, and the instability interval measures distance from H_t*"
---

### Theorem — The Stabilization–Envelope Dyad {#stabilization-envelope-dyad}

The **stabilization–envelope dyad** measures the instability of a proposition:
how far it lies from the fixed fiber. It does so by bounding the proposition from
two sides simultaneously — from above by the least stable proposition above it,
and from below by the greatest stable proposition below it.

#### The Poles {#stabilization-envelope-dyad-poles}

| Pole | Name | Map | Direction | Result |
|------|------|-----|-----------|--------|
| Upward | **Stabilization** | $\pi_t(a)$ (§joint-projection) | Inflationary ($a \leq \pi_t(a)$) | Least stable upper bound |
| Downward | **Stable Envelope** | $\mathrm{Env}_t(a)$ | Deflationary ($\mathrm{Env}_t(a) \leq a$) | Greatest stable lower bound |

Stabilization inflates $a$ to the smallest element of $H_t^*$ lying above $a$
(§stable-envelope). The stable envelope deflates $a$ to the largest element
of $H_t^*$ lying below $a$.

The stabilization pole expands; the envelope pole contracts. They approach the
fixed fiber from opposite sides of the ordering.

#### The Convergence {#stabilization-envelope-dyad-convergence}

The **instability interval** of $a$ is:
$$
[\mathrm{Env}_t(a),\; \pi_t(a)] \;\subseteq\; H_t
$$

This interval measures how far $a$ is from the fixed fiber. The convergence
condition is:
$$
a \in H_t^* \iff \mathrm{Env}_t(a) = a = \pi_t(a)
$$

At the convergence, the interval collapses to a single point: $a$ is both
its own least stable upper bound and its own greatest stable lower bound. The
instability gap is zero.

#### The Stabilization–Envelope Dyad and the Saturation–Transfer Dyad {#stabilization-envelope-dyad-relation}

The stabilization–envelope dyad and the saturation–transfer dyad are complementary
views of the same phenomenon:

- The **saturation–transfer dyad** ($\sigma$, $\Delta$) characterizes stability by the
  operators that produce it: a proposition is stable when both nuclei have
  already done their work.

- The **stabilization–envelope dyad** ($\pi_t$, $\mathrm{Env}_t$) characterizes
  stability by the bounds that constrain it: a proposition is stable when it is
  simultaneously its own inflationary and deflationary bound.

The saturation–transfer dyad describes stability in terms of *action*; the
stabilization–envelope dyad describes it in terms of *position*. A proposition
is in $H_t^*$ if and only if both characterizations hold simultaneously.

#### What the Gap Measures {#stabilization-envelope-dyad-gap}

The width $\pi_t(a) \ominus \mathrm{Env}_t(a)$ (in a residuated sense)
is the **instability measure** of $a$ at history $t$. Units with the most work
remaining — those furthest from the fixed fiber — are the ones where the gap is
largest.

This is not merely descriptive. At the spectral level, the restriction velocity
(§restriction-velocity) and the Fischer-Rao metric (§fischer-rao-metric) both measure
versions of this gap across the fiber family $\{H_t\}_{t \in T}$.
