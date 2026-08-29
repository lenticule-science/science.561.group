---
id: trivial-saturation-theorem
name: TrivialSaturationTheorem
description: "when the history monoid is fully commutative (I = Sigma x Sigma), the saturation nucleus is trivial — sigma_t = id for all t. The fiber doctrine's non-trivial nuclear structure requires a non-full commutation relation."
---

### Theorem — Trivial Saturation at Full Commutativity {#trivial-saturation-theorem}

#### Statement {#tst-statement}

**Theorem.** Let $H : T^\mathrm{op} \to \mathbf{HA_{nucl}}$ satisfy the fiber doctrine
(§fiber-doctrine) over a history category $T = \mathbb{M}(\Sigma, I)$ with the **full
commutation relation** $I = \Sigma \times \Sigma$ — that is, every pair of steps commutes.
Then $\sigma_t = \mathrm{id}_{H_t}$ for every $t \in T$.

#### Proof {#tst-proof}

The saturation nucleus $\sigma_t$ (§saturation-nucleus) is defined as: the largest element
of $H_t$ that restricts to the same profile as $a$ on all sub-histories of $t$. Equivalently,
$\sigma_t(a)$ is the join of all $b \in H_t$ with $\rho_{t' \leq t}(b) = \rho_{t' \leq t}(a)$
for every $t' \leq t$.

When $I = \Sigma \times \Sigma$, every pair of steps commutes, so every pair of histories
$s, s' \leq t$ (with $s \not\leq s'$ and $s' \not\leq s$) are **independent** in the sense
of the independence partition (§history-separation). The Axiom of Locality
(§locality) then forces the fiber product
$$
H_t \;\cong\; H_{s} \times_{H_{s \wedge s'}} H_{s'}
$$
for every such pair. This means $H_t$ is completely determined by its restrictions to
sub-histories: an element $b \in H_t$ is uniquely specified by the tuple
$(\rho_{s}(b))_{s \leq t}$. There is therefore no room for a distinct larger element
$\sigma_t(a) > a$ with the same restriction profile — any element with the same
restrictions IS $a$. Hence $\sigma_t(a) = a$. $\square$

#### Corollary — One-Nucleus Fiber Doctrine {#tst-corollary}

In a relational universe whose history category is $\mathbb{N}^d$ (the free commutative
monoid on $d$ generators, with $I = $ full), the fiber doctrine reduces to a
**one-nucleus doctrine**: only $\Delta_t$ is non-trivial, encoding the transfer from
all one-step extensions of $t$.

The fiber nuclear square (§fiber-nuclear-quartet) collapses: since $\sigma_t = \mathrm{id}$,
$\mathrm{Fix}(\sigma_t) = H_t$, and the quartet
$(H_t,\; \mathrm{Fix}(\sigma_t),\; \mathrm{Fix}(\Delta_t),\; H_t^*)$
becomes $(H_t,\; H_t,\; \mathrm{Fix}(\Delta_t),\; \mathrm{Fix}(\Delta_t))$ — a dyad
rather than a quartet.

#### Consequence for the Hull Construction {#tst-hull}

The hull topos $\mathbf{Sh}(\Omega(Q^\mathcal{H}))$ (§hyperversal-hull-topos) has history
category $T^{\text{hull}} = \mathbb{N}^d$ (§hull-nucleus-pair), which is fully commutative.
By this theorem, the independence-based saturation nucleus is trivial at the hull level.

The **non-trivial two-nucleus structure** of the hull topos therefore cannot arise from
the independence relation $I$. It must arise from a different source — specifically, the
substitution structure of the Fibonacci quasicrystal (§hull-nucleus-pair). The hull is the
first level at which the nuclear structure is **substitution-based** rather than
**commutation-based**.

This marks a qualitative transition in the recursive spiral: the ground universe $R$ and
each finite level $R^{(n)}$ have commutation-based nuclei (arising from the partial
commutativity of $\mathbb{M}(\Sigma, I)$ with $I \subsetneq \Sigma \times \Sigma$). The
hull level requires substitution-based nuclei. The spiral's next turn operates by a
genuinely different mechanism.
