---

name: defect-construction
description: "an explicit formula for the defect operator δ_t from the joint-projection gap — vanishing and nuclear-dependence are verified; naturality requires the open Interval-Faithfulness Condition (IFC)."
---

### Construction — Defect Operator from Algebraic Data {#defect-construction}

The defect operator $\delta_t$ is defined by the three conditions of §spectral-decomposition.
This unit gives an explicit formula for $\delta_t$ from the fiber algebra data
$(H_t, \sigma_t, \Delta_t)$ and records exactly which conditions are verified and which
remain open.

#### The Explicit Formula {#defect-formula}

The nuclei $\sigma_t$ and $\Delta_t$ commute (§fiber-doctrine), so their composite
$\pi_t := \sigma_t \circ \Delta_t$ is a nucleus on $H_t$ with $\mathrm{Fix}(\pi_t) = H_t^\ast$
(§joint-projection). For each $a \in H_t$, define the **projection gap**

$$
\lambda_a \;:=\; \bigl|\{a' \in H_t \mid a \leq a' \leq \pi_t(a)\}\bigr| - 1 \;\geq\; 0.
$$

The quantity $\lambda_a$ counts the elements strictly between $a$ and its jointly-stable
projection $\pi_t(a)$; it is the lattice-theoretic size of the gap that the joint reflection
must bridge.

**Define** $\delta_t : \widetilde{V}_t \to \widetilde{V}_t$ as the diagonal $K$-linear map
on the free module $\widetilde{V}_t = K^{H_t}$:

$$
\delta_t(e_a) \;:=\; \lambda_a \cdot e_a.
$$

This is well-defined as a $K$-linear map because it is defined on a basis.

#### What Is Proved {#defect-proved}

**Proposition — Vanishing on the stable fiber.** $\delta_t(e_a) = 0$ for all $a \in H_t^\ast$.

*Proof.* If $a \in H_t^\ast = \mathrm{Fix}(\pi_t)$, then $\pi_t(a) = a$, so the interval
$[a, \pi_t(a)]$ contains exactly one element. Thus $\lambda_a = 0$. $\square$

**Proposition — Nuclear dependence.** Each $\delta_t$ is determined entirely by $\pi_t =
\sigma_t \circ \Delta_t$: the eigenvalue $\lambda_a$ depends only on the position of $a$
relative to its projection $\pi_t(a)$ in $H_t$.

*Proof.* Immediate from the definition. $\square$

**Proposition — Diagonalizability.** $\delta_t$ is diagonalizable over any commutative ring
$K$.

*Proof.* By construction $\delta_t$ is diagonal on the basis $\{e_a : a \in H_t\}$, so
$\{e_a\}$ is already a basis of eigenvectors. The standing diagonalizability assumption of
§spectral-decomposition is discharged. $\square$

#### The Naturality Gap {#defect-naturality-gap}

**What naturality requires.** For a prefix morphism $f : t \to t'$, the naturality
condition $\widetilde{V}(f) \circ \delta_{t'} = \delta_t \circ \widetilde{V}(f)$ reduces —
since $\widetilde{V}(f)(e_a) = e_{H(f)(a)}$ — to

$$
\lambda_a \;=\; \lambda_{H(f)(a)} \quad\text{for all } a \in H_{t'},
$$

i.e., that $|[a, \pi_{t'}(a)]|$ equals $|[H(f)(a), \pi_t(H(f)(a))]|$.

**What is known unconditionally.** By nucleus preservation (§reindexing),
$H(f)(\pi_{t'}(a)) = \pi_t(H(f)(a))$. Since $H(f)$ is order-preserving, it maps
$[a, \pi_{t'}(a)]$ into $[H(f)(a), \pi_t(H(f)(a))]$, giving $\lambda_a \geq \lambda_{H(f)(a)}$.
Naturality requires equality, i.e., that $H(f)$ is a **bijection** on these intervals.

**Why this can fail.** Restriction to a shorter history $t_0 \leq t$ can collapse
elements: distinct $a < b \leq \pi_{t'}(a)$ in $H_{t'}$ can satisfy $H(f)(a) = H(f)(b)$,
making the interval strictly smaller after restriction. In that case $\lambda_a >
\lambda_{H(f)(a)}$ and naturality fails.

**Open condition — Interval-Faithfulness (IFC).** Say $H$ satisfies the
**Interval-Faithfulness Condition** if for every prefix morphism $f : t \to t'$ and every
$a \in H_{t'}$, the restriction

$$
H(f)\big|_{[a,\,\pi_{t'}(a)]} \;:\; [a, \pi_{t'}(a)] \;\xrightarrow{\;\sim\;}\; [H(f)(a), \pi_t(H(f)(a))]
$$

is a bijection. Under IFC, $\lambda_a = \lambda_{H(f)(a)}$ for all $a$, so naturality holds.

IFC is **not derivable from the eight axioms as currently stated**. It is strictly stronger than
nucleus preservation (§reindexing) and closely related to the Axiom of History Separation
(§history-separation) — which asserts that $H$ is automorphism-reflecting on $H^\ast$ — but
the precise implication "History Separation ⟹ IFC" has not been established.

**Until IFC is resolved, the defect operator $\delta$ is not natural, and the mode
sheaf of §spectral-decomposition does not assemble into an internal sheaf in $R$.**

#### The Derivation Gap {#defect-derivation-gap}

For the graded algebra structure of §spectral-decomposition (Proposition — Graded Mode Algebra),
$\delta_t$ must satisfy the Leibniz rule:
$\delta_t(e_a \cdot e_b) = \delta_t(e_a) \cdot e_b + e_a \cdot \delta_t(e_b)$, where
$e_a \cdot e_b = e_{a \wedge b}$. This reduces to

$$
\lambda_{a \wedge b} \;=\; \lambda_a + \lambda_b.
$$

Since $\pi_t$ is meet-preserving, $\pi_t(a \wedge b) = \pi_t(a) \wedge \pi_t(b)$, so the
projection-gap formula gives $\lambda_{a \wedge b} = |[a \wedge b, \pi_t(a) \wedge \pi_t(b)]| - 1$.
The Leibniz rule holds when the intervals $[a, \pi_t(a)]$ and $[b, \pi_t(b)]$ are
**independent** in the sense that

$$
|[a \wedge b,\, \pi_t(a) \wedge \pi_t(b)]| \;=\; |[a, \pi_t(a)]| + |[b, \pi_t(b)]| - 1.
$$

This interval-additivity condition does **not hold in general**. It holds in the aperiodic
case (§aperiodicity), where unsettled elements decompose into independent contributions from
distinct history generators, but the precise connection has not been written out.

**Until interval-additivity is established, the graded algebra structure of §spectral-decomposition
is conditional.**

#### Structural Clarification via Fiber Products {#defect-fiber-product}

The Fiber Product Decomposition (§locality) clarifies both open conditions.

**At single-Foata-block histories.** By [commutative-nuclear-square](commutative-nuclear-square.md) (fiber product decomposition),
if the steps of $t$ are mutually commuting, then $\sigma_t = \mathrm{id}$ and
$\pi_t = \Delta_t$. The projection gap $\lambda_a = |[a, \Delta_t(a)]| - 1$ is
purely a **transfer gap**: it measures how far $a$ is from being transfer-active,
with no saturation component. At such histories the IFC reduces to injectivity of
$\Delta_t$ on projection-gap intervals, and the Leibniz rule reduces to
interval-additivity for $\Delta_t$ alone. These are cleaner targets and may be
approachable directly from the fiber product structure of $H_t$.

**Recursive structure of the IFC.** For a commutation-cover morphism
$f : t \star s \star s' \to t \star s$ (extension of $t$ by two independent steps
$s, s' \perp t$), the fiber product decomposition gives
$H_{t \star s \star s'} = H_{t \star s} \times_{H_t} H_{t \star s'}$ and the
restriction $H(f)$ is the projection $(b, c) \mapsto b$. The IFC for $f$ —
injectivity of $(b, c) \mapsto b$ on projection-gap intervals — holds iff for each
$b$ in its projection gap, the compatible $c \in H_{t \star s'}$ with
$\rho_{s'}(c) = \rho_s(b)$ is unique within $c$'s projection gap. This is exactly
the IFC condition for the morphism $H_{t \star s'} \to H_t$ one level down.

**Consequence:** The IFC at any commutation-cover morphism (multi-step to single-step
via commuting steps) reduces to the IFC at the constituent single-step extension
morphisms. The genuinely independent IFC conditions are only at single-step extensions
$t \to t \star s$ — not at multi-step commutation-cover morphisms. This does not
close the IFC, but it reduces the proof target to single-step restriction maps.

#### Summary of Status {#defect-status}

| Condition | Status |
|-----------|--------|
| $\delta_t$ is well-defined ($K$-linear) | ✓ unconditional |
| Vanishing on $H_t^\ast$ | ✓ unconditional |
| Nuclear dependence (depends only on $\pi_t$) | ✓ unconditional |
| Diagonalizability | ✓ unconditional (diagonal on basis) |
| Naturality | **open** — requires IFC; IFC not derived from 8 axioms |
| Leibniz rule (for graded algebra) | **open** — requires interval-additivity; holds in aperiodic case |

The two open conditions are conjectured to follow from the Axiom of History Separation
(§history-separation), but neither implication has been established.
