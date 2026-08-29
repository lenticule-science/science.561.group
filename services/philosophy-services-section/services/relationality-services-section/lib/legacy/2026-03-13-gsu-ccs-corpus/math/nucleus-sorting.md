---
id: nucleus-sorting
name: NucleusSorting
description: "the nucleus pair (σ_t, Δ_t) is a Maxwell-demon sorter at each fiber, but with a structural difference — the history t is not the demon's memory register but its position, so erasure is not costly but impossible."
---

### Conjecture — Nucleus Sorting {#nucleus-sorting}

*Found by holding Maxwell's demon in one hand and the Relational Hyperverse in the other.*

#### The Classical Picture {#nucleus-sorting-classical}

Maxwell's demon (1867) proposes to reduce the entropy of a gas by sorting molecules
into fast and slow, using a frictionless gate and a memory register recording each
observation. Bennett's resolution (1982) shows the demon cannot win: erasing the memory
register at the end of each sorting cycle costs at least $k_B T \ln 2$ per bit by
Landauer's principle, precisely canceling the entropy reduction.

The resolution rests on a separation: the demon's memory register is a *separate* tape
from the system being sorted. The tape can be erased — at a cost — and the demon resets
for a new cycle. Memory and position are distinct resources.

#### The Relational Analog {#nucleus-sorting-analog}

The Relational Universe $R$ has a sorting mechanism at each fiber $H_t$. The
**nucleus sorter** is the pair $(\sigma_t, \Delta_t)$: $\sigma_t$ tests backward
stability (§fiber-doctrine, §fixed-fiber), $\Delta_t$ tests forward stability
(§delta-linking). Together they sort propositions in $H_t$ into three classes:

- **Both stable** ($a = \sigma_t(a)$ and $a = \Delta_t(a)$): $a \in H_t^*$ — settled.
- **Backward-stable only** ($a = \sigma_t(a)$, $a \neq \Delta_t(a)$): sub-history-determined,
  not extension-witnessed.
- **Neither**: unsettled.

The sorted output is $H_t^* = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$
(§fixed-fiber).

#### The Difference: No Separation {#nucleus-sorting-difference}

In the classical picture, the demon's memory is a tape it carries alongside the system.
In $R$, the history $t$ plays the role of the memory register — but it is not *alongside*
the fiber $H_t$. It *indexes* $H_t$. To be at $H_t$ is to carry $t$.

**Conjecture (Address Bound).** The nucleus sorter $(\sigma_t, \Delta_t)$ is
*address-bound*: applying $\sigma_t$ or $\Delta_t$ requires being at $H_t$, which
requires carrying the history $t$. Erasing $t$ is not thermodynamically costly — it
is logically excluded. There is no operation in $R$ that both applies
$(\sigma_t, \Delta_t)$ and discards $t$, because $t$ is the address of the fiber
the sorter is standing in, not a record it has accumulated.

This is strictly stronger than Bennett. Bennett: memory erasure is possible but costs
energy. Address Bound: history erasure is not possible at any cost.

The formal content — including the quantitative cost $S_{\mathrm{addr}}(n) \sim n\log\phi$
that follows from the impossibility of erasure, and its dominance over sorting benefit —
is in §address-entropy.

#### Unfinished Work and the Spectral Picture {#nucleus-sorting-spectral}

The defect operator $\delta_t$ and spectral mass $M_t(\delta) = \mathrm{Tr}(\delta_t)$
(§spectral-decomposition, §spectral-thermodynamics) measure the sorter's unfinished work:
the total weight of propositions in $H_t$ not yet settled. As $M_t(\delta) \to 0$, the
Hawking temperature $T_H = 1/(2 M_t(\delta))$ (§spectral-hawking) rises — the fiber
approaches the critical point where nearly everything is settled.

Modes with eigenvalue $\lambda > M_t(\delta)$ are trapped inside the Spectral Schwarzschild
radius $r_s(\delta_t) = 2 M_t(\delta)$ (§spectral-schwarzschild): they cannot escape to
$H_t^*$ by local dynamics. These are the modes the nucleus sorter cannot resolve at $t$
alone — they require global information ($H^1 \neq 0$) to resolve (§cohomological-tunneling).
The local sorter exhausts its capacity; the global sorter takes over.

#### The Universe-Level Analog {#nucleus-sorting-universal}

The nucleus sorter works at a single fiber and is address-bound by a single history $t$.
The Universe Closure operator $U_G$ faces the same constraint one level up, with a
sharper form: at the fixed point, the sorter *is* the universe it sorts. See §closure-sorting.

**Status.** The Address Bound should follow from the axioms: $\sigma_t$ and $\Delta_t$
are indexed by $t$, and History Separation (§history-separation) makes distinct
histories non-isomorphic. The formal proof is in §address-entropy, which also handles the
quantitative estimate and its sheaf-theoretic interpretation.
