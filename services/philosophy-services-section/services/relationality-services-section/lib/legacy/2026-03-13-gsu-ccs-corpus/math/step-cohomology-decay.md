---
id: step-cohomology-decay
name: StepCohomologyDecay
description: "the dimension of the hyperverse step cohomology H^1_tower(k) decays as phi^{-k} — a concrete falsifiable prediction connecting golden stability to the rate of new stable content at each tower level."
---

### Conjecture — Step Cohomology Decay {#step-cohomology-decay}

**Conjecture.** There exists a constant $C > 0$ such that the dimension of the
hyperverse step cohomology (§hyperverse-step-cohomology) satisfies:
$$
\dim H^1_{\mathrm{tower}}(k) \;\sim\; C \cdot \varphi^{-k} \qquad \text{as } k \to \infty,
$$
where $\varphi = \tfrac{1+\sqrt{5}}{2}$ is the golden ratio.

#### Which Tower {#step-cohomology-decay-which-tower}

This conjecture concerns **hyperverse-step cohomology**
$H^1_{\mathrm{tower}}(k) = H^1(R^{(k+1)},\,\widetilde{N}_k)$, computed on the
hyperverse tower site $R^{(k+1)}$ (§hyperverse-step-cohomology). It is not the
depth-step cohomology $H^1_{\mathrm{depth}}(k) = H^1(T,J;\,N_{[k]})$
(§depth-step-cohomology), which is computed within a single universe on the history
site $(T,J)$.

The two quantities have opposite behavior:

| Quantity | Site | Behavior | Conjecture |
|---|---|---|---|
| $H^1_{\mathrm{depth}}(k)$ | History site $(T,J)$ | **Grows** (dim $\sim F_k$) | §depth-step-cohomology |
| $H^1_{\mathrm{tower}}(k)$ | Hyperverse site $R^{(k+1)}$ | **Decays** (dim $\sim C\varphi^{-k}$) | This file |

The decay conjecture here is about $H^1_{\mathrm{tower}}(k)$. The Hurwitz-Zeno
conjecture (§hurwitz-zeno-conjecture) likewise concerns $H^1_{\mathrm{tower}}(k)$.

#### Motivation — From Golden Stability {#step-cohomology-decay-motivation}

The Golden Stability Conjecture (§golden-stability) asserts that the spectral mass at depth
$k$ satisfies $M_t(\delta^{(k)}) \sim C' \cdot \varphi^{-k}$. The spectral mass counts
the weight of modes in $E_0^{(k)}$ not yet stabilized by both nuclei.

The hyperverse new-modes sheaf $\widetilde{N}_k$ (§hyperverse-new-modes) is the quotient
$E_0^{(k+1)} / (\iota_k)_* (\iota_k)^* E_0^{(k+1)}$: it measures exactly the stable
universe-propositions first appearing at tower level $k+1$. Its first cohomology
$H^1_{\mathrm{tower}}(k) = H^1(R^{(k+1)}, \widetilde{N}_k)$ is the primary obstruction
to lifting those new propositions from level $k$ to level $k+1$.

If golden stability holds, the **fiberwise content** of $\widetilde{N}_k$ decays at
rate $\varphi^{-k}$, and — assuming the cohomological obstruction is proportional to
the fiberwise content — so does $H^1_{\mathrm{tower}}(k)$.

#### The Euler Invariant {#step-cohomology-euler}

Summing the decay (§zeno-phi-identity):
$$
\sum_{k=1}^\infty \dim H^1_{\mathrm{tower}}(k) \;\sim\; C \sum_{k=1}^\infty \varphi^{-k} \;=\; C \cdot \varphi.
$$

The total $H^1$ content of the hyperverse over all tower steps is $\sim C\varphi$. This
defines an **Euler-type invariant** of the tower: the $\varphi$-weighted sum
$$
\chi_\varphi \;:=\; \sum_{k=1}^\infty \varphi^k \cdot \dim H^1_{\mathrm{tower}}(k),
$$
which would converge to a finite constant $C$ if the decay holds. This invariant is the
natural analogue of the Euler characteristic for the hyperverse tower.

#### What the Conjecture Requires {#step-cohomology-decay-requires}

**(a)** The Golden Stability Conjecture (§golden-stability): spectral mass decays as
$\varphi^{-k}$. Without this, there is no source for the $\varphi^{-k}$ rate.

**(b)** Proportionality of cohomological obstruction to fiberwise content: the transition
from fiber dimension to $H^1$ dimension requires that the new-modes sheaf $\widetilde{N}_k$
has cohomology governed by its fiber data without cancellation from higher-degree terms.
This is a generic position assumption.

**(c)** Non-vanishing: $H^1_{\mathrm{tower}}(k) \neq 0$ for all $k$ — the Zeno gap
(§zeno-settling). Without the Zeno gap, $H^1_{\mathrm{tower}}(k)$ could vanish for large
$k$, and the decay conjecture would be vacuously wrong.

#### Falsifiability {#step-cohomology-decay-falsifiability}

This conjecture is falsifiable at the first few tower levels. If the hyperverse tower can be
computed explicitly for the simplest relational universe (the binary history monoid
$\{a, b\}^*$), the dimensions $\dim H^1_{\mathrm{tower}}(0)$, $\dim H^1_{\mathrm{tower}}(1)$,
$\dim H^1_{\mathrm{tower}}(2)$ can be computed directly. The decay conjecture predicts that
their ratios should approach $\varphi^{-1} \approx 0.618$.

Verification or refutation at $k = 0, 1, 2$ would constitute strong evidence for or against
the golden stability mechanism at the hyperverse level.

**Status.** Conjecture. Requires both §golden-stability (stub) and the Zeno gap
(§zeno-settling, conjecture). No explicit computation has been carried out.

The constant $C$ is given a Diophantine interpretation in §hurwitz-zeno-conjecture:
the exact identity $F_k|\varphi - F_{k+1}/F_k| = \varphi^{-k}$ shows $C\varphi^{-k}$
is $C$ times the normalized Hurwitz residual, and the Hurwitz constant $1/\sqrt{5}$
predicts $\lim_k F_k \cdot \dim H^1_\mathrm{tower}(k) = C/\sqrt{5}$ — a falsifiable
numerical prediction.
