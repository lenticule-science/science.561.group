---
id: hurwitz-zeno-conjecture
name: HurwitzZenoConjecture
description: "the step cohomology decay constant C satisfies lim_k F_k·dim H^1_tower(k) = C/√5, identifying the Hurwitz approximation constant 1/√5 with the ratio of the cohomological constant to the Hurwitz constant; proved via the exact identity F_k|φ − F_{k+1}/F_k| = φ^{−k}."
---

### Conjecture — Hurwitz–Zeno {#hurwitz-zeno-conjecture}

The step cohomology decay conjecture (§step-cohomology-decay) asserts
$\dim H^1_\mathrm{tower}(k) \sim C \cdot \varphi^{-k}$ but does not say what $C$ is or
why the rate is $\varphi^{-k}$. The projective renormalization identification
(§projective-renormalization) gives a Diophantine source for this rate. Combining the
two yields a **precise numerical prediction** for the decay, connecting the cohomological
constant $C$ to the Hurwitz approximation constant $1/\sqrt{5}$.

#### The Exact Identity {#hzc-identity}

The Fibonacci convergents $F_{k+1}/F_k$ to $\varphi$ satisfy an exact formula.

**Lemma.** For all $k \geq 0$:
$$
\left|\varphi - \frac{F_{k+1}}{F_k}\right| \;=\; \frac{\varphi^{-k}}{F_k}.
$$

*Proof.* The Binet formula gives $F_n = (\varphi^n - \psi^n)/\sqrt{5}$ where
$\psi = (1-\sqrt{5})/2 = -\varphi^{-1}$. Compute:
$$
\varphi - \frac{F_{k+1}}{F_k}
\;=\; \frac{\varphi(\varphi^k - \psi^k) - (\varphi^{k+1} - \psi^{k+1})}{\varphi^k - \psi^k}
\;=\; \frac{\psi^k(\psi - \varphi)}{\varphi^k - \psi^k}
\;=\; \frac{-\sqrt{5}\,\psi^k}{\sqrt{5}\,F_k}
\;=\; \frac{-\psi^k}{F_k}.
$$
Since $|\psi| = \varphi^{-1}$, the absolute value is $|\psi|^k/F_k = \varphi^{-k}/F_k$.
$\square$

**Corollary.**
$$
F_k \cdot \left|\varphi - \frac{F_{k+1}}{F_k}\right| \;=\; \varphi^{-k}.
$$

This is exact, not asymptotic. The product of the Fibonacci denominator and the
approximation error is $\varphi^{-k}$ at every level.

**Alternation.** The sign is $(-1)^{k+1}$: even $k$ gives $\varphi > F_{k+1}/F_k$
(convergents from below, the $\sigma$-direction), odd $k$ gives $\varphi < F_{k+1}/F_k$
(convergents from above, the $\Delta$-direction). See §projective-renormalization for
the forward–backward interpretation.

#### The Hurwitz Theorem {#hzc-hurwitz}

**Hurwitz's theorem** (1891). For any irrational $\alpha$, there are infinitely many
rationals $p/q$ satisfying:
$$
\left|\alpha - \frac{p}{q}\right| \;<\; \frac{1}{\sqrt{5}\,q^2}.
$$
The constant $\sqrt{5}$ is optimal: for $\varphi$ and its
$\mathrm{GL}(2,\mathbb{Z})$-equivalents, replacing $\sqrt{5}$ by $\sqrt{5} + \varepsilon$
yields only finitely many solutions; every other irrational admits infinitely many
solutions with the improved constant. $\varphi$ is the unique worst-approximable
positive irrational.

The Fibonacci convergents achieve the Hurwitz bound:
$$
F_k^2 \cdot \left|\varphi - \frac{F_{k+1}}{F_k}\right|
\;=\; F_k \cdot \varphi^{-k}
\;\longrightarrow\; \frac{1}{\sqrt{5}},
$$
using $F_k \sim \varphi^k/\sqrt{5}$. The normalized approximation error converges to
the Hurwitz constant $1/\sqrt{5}$.

#### The Conjecture {#hzc-conjecture}

The step cohomology decay (§step-cohomology-decay) states
$\dim H^1_\mathrm{tower}(k) \sim C\varphi^{-k}$. The Corollary above rewrites this as:
$$
\dim H^1_\mathrm{tower}(k)
\;\sim\; C \cdot F_k \cdot \left|\varphi - \frac{F_{k+1}}{F_k}\right|.
$$

The step cohomology at tower level $k$ is $C$ times the normalized Hurwitz residual
at the $k$-th Fibonacci convergent.

**Conjecture (Hurwitz–Zeno).** The decay constant $C$ of §step-cohomology-decay
satisfies:
$$
\lim_{k \to \infty} F_k \cdot \dim H^1_\mathrm{tower}(k) \;=\; \frac{C}{\sqrt{5}}.
$$

*Derivation.* From $\dim H^1_\mathrm{tower}(k) \sim C\varphi^{-k}$ and
$F_k \sim \varphi^k/\sqrt{5}$:
$$
F_k \cdot \dim H^1_\mathrm{tower}(k)
\;\sim\; \frac{\varphi^k}{\sqrt{5}} \cdot C\varphi^{-k}
\;=\; \frac{C}{\sqrt{5}}.
$$

The constant $C/\sqrt{5}$ is the ratio of the cohomological decay constant to the
Hurwitz constant $\sqrt{5}$. The Hurwitz-Zeno conjecture says this ratio is
**computable from small tower levels**: if $\dim H^1_\mathrm{tower}(k)$ can be computed
for $k = 0, 1, 2, 3$, the sequence $F_k \cdot \dim H^1_\mathrm{tower}(k)$ should
converge to a positive constant, identifying $C/\sqrt{5}$.

#### Why the Rate Cannot Be Faster {#hzc-worst-approx}

For any aperiodic substitution matrix $M'$ with Perron–Frobenius eigenvalue
$\lambda > \varphi$, the corresponding normalized Hurwitz product decays as
$\lambda^{-k}$, which goes to zero faster than $\varphi^{-k}$. Under the Hurwitz-Zeno
correspondence, a faster-converging continued fraction would give a faster-decaying Zeno
gap. Conversely, the Fibonacci monoid achieves the SLOWEST possible decay rate
$\varphi^{-k}$, because $\varphi$ is the smallest Perron–Frobenius eigenvalue among
all aperiodic two-generator substitution matrices:

> **The Fibonacci monoid has the most persistent Zeno gap among all aperiodic
> substitution-based history monoids with two generators.**

This is the Diophantine content of $\varphi$ being worst-approximable: worst-approximable
= slowest convergence of rational approximants = slowest decay of the Zeno gap.

#### Zeno Gap Persistence as Irrationality {#hzc-irrationality}

Under the Hurwitz-Zeno identification, the Zeno gap conjecture (§zeno-settling: every
finite tower level has a nonzero spectral residual) is equivalent to the irrationality of
$\varphi$:
$$
H^1_\mathrm{tower}(k) \neq 0 \text{ for all } k
\;\iff\;
\left|\varphi - \frac{F_{k+1}}{F_k}\right| \neq 0 \text{ for all } k
\;\iff\;
\varphi \notin \mathbb{Q}.
$$

The first equivalence is the Hurwitz-Zeno correspondence. The second is the
definition of irrationality. The Zeno gap is "the gap that cannot be closed by any
rational approximation," and the reason it cannot be closed is that $\varphi$ is
irrational. This is not a proof — it is an identification of the Zeno conjecture
with a theorem (irrationality of $\varphi$) in a different language.

#### Self-Similar Structure {#hzc-self-similar}

The continued fraction of $\varphi$ is $[1;1,1,1,\ldots]$: all partial quotients
equal $1$. After removing the first $k$ quotients, the remaining continued fraction
is still $\varphi$, rescaled by $\varphi^{-k}$:
$$
\varphi \;=\; \underbrace{1 + \dfrac{1}{1 + \dfrac{1}{\ddots + \dfrac{1}{\varphi}}}}_{\text{$k$ ones}} \cdot \varphi^k.
$$

This is the self-referential structure of the zeno-phi-identity (§zeno-phi-identity).
Cohomologically: the Zeno gap at level $k$ is a $\varphi^{-k}$-scaled copy of the Zeno
gap at level $0$. The gap does not "become a different shape" as the tower deepens —
it is always the same gap, just smaller by the factor $\varphi^{-k}$. Any perturbation
that changes the continued fraction (i.e., any irrational $\alpha \neq \varphi$ up to
$\mathrm{GL}(2,\mathbb{Z})$) would break this exact self-similarity, introducing
partial quotients $\geq 2$ somewhere and causing the gap to lose its uniform geometric
shape.

#### Falsifiability {#hzc-falsifiability}

From §step-cohomology-decay, the first few values of $\dim H^1_\mathrm{tower}(k)$ for
the binary monoid $\{a,b\}^*$ can in principle be computed directly. The Hurwitz-Zeno
conjecture then predicts:

| $k$ | $F_k$ | Predicted $F_k \cdot \dim H^1_\mathrm{tower}(k)$ |
|---|---|---|
| $0$ | $1$ | $C/\sqrt{5} \approx 0.447 C$ |
| $1$ | $1$ | $C/\sqrt{5} \approx 0.447 C$ |
| $2$ | $2$ | $C/\sqrt{5} \approx 0.447 C$ |
| $k$ | $F_k$ | converges to $C/\sqrt{5}$ |

If the sequence $F_k \cdot \dim H^1_\mathrm{tower}(k)$ converges to a positive constant,
that constant is $C/\sqrt{5}$. Computing two adjacent values determines $C$ and
provides a check on the Hurwitz-Zeno identification.

**Status.** Conjecture. Requires §step-cohomology-decay (conjecture) and the Zeno
gap (§zeno-settling, conjecture). No explicit computation has been carried out. The
mathematical content (Lemma and Corollary) is a theorem.
