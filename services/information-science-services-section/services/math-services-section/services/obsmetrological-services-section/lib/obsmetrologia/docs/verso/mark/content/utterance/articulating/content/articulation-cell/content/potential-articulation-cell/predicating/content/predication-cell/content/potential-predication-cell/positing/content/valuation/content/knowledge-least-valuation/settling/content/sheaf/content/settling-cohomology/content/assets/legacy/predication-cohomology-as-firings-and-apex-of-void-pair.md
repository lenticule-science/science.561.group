---
type: question
class: internal
status: open
explores: [settling-cohomology, void-cone-cohomology, four-regime-dichotomy, settling-associated-sheaf]
---

# Should the cohomological description be a (firings, $V_\infty$) pair?

The corpus's cohomological invariants for settlings have been presented as a single object — the firing-counting cohomology $H^1(\mathcal{F}_v) \cong \bigoplus_{\mu \in L_{\mathrm{ns}}} \mathbb{Z}$ (or its Verdier-dual $\mathrm{gr}(\mathrm{Void}_v)$). The [Scott-continuous-with-nontrivial-apex example](../examples/scott-continuous-with-nontrivial-apex-of-void.md) shows this presentation is incomplete: the firing-counting cohomology and the **apex of void** $V_\infty$ are structurally orthogonal invariants.

Open question: should predication categories' cohomological description be reorganized as a **pair**

$$\bigl(\mathrm{firings}(v), V_\infty(v)\bigr) \;\in\; \bigoplus_{L_{\mathrm{ns}}} \mathbb{Z} \;\times\; \mathbb{Z}^{V_\infty},$$

with regime classification controlling only the first component?

## What the example shows

[Scott-continuous-with-nontrivial-apex-of-void](../examples/scott-continuous-with-nontrivial-apex-of-void.md) constructs a Scott-continuous closure with $V_\infty = \bigoplus_\mathbb{N} \mathbb{Z}$ generators. In this example:

- $H^1(\mathcal{F}_v) = 0$ (Scott-continuous regime, no NSC firings).
- $\mathrm{gr}(\mathrm{Void}_v) = 0$ (same firing data, dually).
- $H_0^{\mathrm{apex of Void}}(v) = \mathbb{Z}^{V_\infty}$ — countably infinite generators.

The two invariants vanish at different rates: firing-counting cohomology is sensitive to closure dynamics; apex-of-void is sensitive to structural decoupling. **Neither contains the other.**

## Reframing the regime classification

Currently the [four-regime dichotomy](../../../../../../../references/four-regime-dichotomy.md) and downstream cohomology theorems describe regimes by their firing-counting cohomology:

| Regime | $H^1$ |
|---|---|
| Strict | $0$ |
| Scott-continuous | $0$ |
| Transfinite-bounded | $\bigoplus_{L_{\mathrm{ns}}} \mathbb{Z}$, finite |
| Aperiodic | $\bigoplus_{L_{\mathrm{ns}}(\omega_1)} \mathbb{Z}$, $\omega_1$-many |

This says nothing about $V_\infty$. The full picture would be a 2-axis classification:

| Regime | $H^1$ | $V_\infty$ |
|---|---|---|
| Strict | $0$ | discrete, finite |
| Scott-continuous | $0$ | discrete, possibly countably infinite |
| Transfinite-bounded | $\bigoplus_{L_{\mathrm{ns}}} \mathbb{Z}$ | discrete, possibly $\omega_1$-cofinal |
| Aperiodic | $\bigoplus_{L_{\mathrm{ns}}(\omega_1)} \mathbb{Z}$ | typically empty (substitution fills) |

The aperiodic regime canonically has $V_\infty = \emptyset$ (substitution dynamics), but the other three regimes can have $V_\infty$ arbitrarily structured.

## Sub-questions

1. **Aperiodic-with-non-empty-$V_\infty$ exception.** Is there an aperiodic regime settling with $V_\infty \neq \emptyset$? The standard substitution examples don't have this, but a non-substitution aperiodic system could — e.g., aperiodic dynamics on a sub-region with a structurally-decoupled remainder. If yes, the "aperiodic ⇒ $V_\infty = \emptyset$" reading needs qualifying.

2. **MLD with respect to the pair.** Currently MLD-equivalence is defined via $H^1$. Should it be refined: $v \sim_{\mathrm{pair-MLD}} w$ iff $(\mathrm{firings}(v), V_\infty(v)) = (\mathrm{firings}(w), V_\infty(w))$? This would give a finer equivalence than ordinary MLD, distinguishing settlings with the same firing pattern but different decoupling structure.

3. **Cohomology of $V_\infty$ as a sheaf.** $V_\infty$ is a sub-presheaf of the underlying predication settling, with restriction maps inherited from the predicate / settling structure. Its own sheaf cohomology might detect "the shape of structural decoupling" — connected components of $V_\infty$, cycles in the never-fired region, etc.

4. **The void cone has more structure than its apex.** Beyond $V_\infty$, the *rate* at which $V_\tau$ shrinks toward $V_\infty$ — the descending profile $|V_\tau|$ as a function of $\tau$ — is a refined invariant. For Scott-continuous regimes, this is a sequence of integers; for transfinite, an ordinal-indexed family. Whether this gives a *third* axis of cohomological data (descent profile) is open.

5. **Verdier-dual of $V_\infty$.** What is the cosheaf-side analog of "cells permanently void"? Under the duality, eventually-void corresponds to *eventually-non-supported* on the cosheaf side — cells whose stalk content is trivially zero in the limit. Whether this gives a "cosheaf $V_\infty$" with its own cohomology is open.

## Why it matters

Three structural payoffs if the pair reframing works:

- **Sharper regime classification.** Adds $V_\infty$ as a structural axis the regime classification doesn't currently see.
- **Structural-decoupling detection.** The corpus's cohomology currently can't distinguish "single coupled system" from "multiple decoupled systems running in parallel." With $V_\infty$ tracked, decoupling has cohomological signature.
- **Cleaner correspondence with applied settings.** Application areas (knowledge bases with unreachable assertions, CRDT systems with isolated replicas, causal sets with spacelike-separated regions) typically have non-trivial $V_\infty$. The corpus's main framework currently doesn't surface this.

## Connection to existing structure

- [Scott-continuous-with-nontrivial-apex-of-void example](../examples/scott-continuous-with-nontrivial-apex-of-void.md) — the witness motivating the reframing.
- [Void-cone (co)homology theorem](../../../../../../lorentzian-causal-settling/references/void-cone-cohomology.md) — defines $H_0^{\mathrm{apex of Void}}$ as a separate invariant (currently noted but not foregrounded).
- [Four-regime dichotomy](../../../../../../../references/four-regime-dichotomy.md) — currently single-axis; would become two-axis under reframing.
- [Lorentzian apex/void as timelike/spacelike](../theorems/lorentzian-apex-void-as-timelike-spacelike.md) — already uses the (firings, apex-of-void) pair structure for causal-set physics; suggests the pair framing is natural in applied contexts.
- [Unified void dynamics](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/learning-articles/questions/unified-void-dynamics.md) — broader question about $\bot$-void vs. $\top$-void; the present reframing would naturally extend to that 4-fold pairing.
