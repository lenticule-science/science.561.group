---
type: theorem
status: proven
depends-on: [positing-morphism, assertive-positing-morphism, denial-positing-morphism, predication-settling, settling-bound, settling-continuity, non-scott-continuous-firing-ordinal, knowledge-order, truth-order, four-bilattice]
see-also: [positing-realizable-factorization, belnap-speech-act-partition, four-regime-dichotomy, locution-illocution-perlocution-factorization]
title: Temporally-bounded positing and assertion time
description: Johnston's tritemporal database model () attaches an assertion time interval $[\tau0, \tau1) \subseteq \lambda$ to each speech act — the period during which the speaker holds that act in force.
---

# Temporally-bounded positing and assertion time

Johnston's tritemporal database model ([@johnston2014]) attaches an **assertion time** interval $[\tau_0, \tau_1) \subseteq \lambda$ to each speech act — the period during which the speaker holds that act in force. This is structurally distinct from valid time (when the described fact obtains) and transaction time (when the record was written). The theorem below establishes that PredCat's settling-bound structure supports assertion time, with the bilattice structure providing a refinement: retraction is not erasure but contestation.

## The truth-window of a cell in a settling

Let $v = (v_\tau)_{\tau < \lambda}$ be a [predication settling](../../research/2026/07/31/lenticule-import/objects/predication-settling.md) and $\phi \in \Phi$ a predication cell. The **truth-window** of $v$ at $\phi$ is the maximal sub-interval $[\tau_0, \tau_1) \subseteq \lambda$ such that $v_\tau(\phi) \geq_t \mathbf{t}$ for all $\tau \in [\tau_0, \tau_1)$.

The truth-window is the settling-index interval during which the cell is truth-designated; it is the PredCat realization of Johnston's assertion time.

## Theorem (assertion time, retraction, and Scott continuity)

Let $v$ be a predication settling, $\phi \in \Phi$, and $[\tau_0, \tau_1)$ the truth-window of $v$ at $\phi$.

**Part 1 (initiation by assertive positing).** The initiation stage $\tau_0$ is the stage at which an [assertive positing morphism](../../research/2026/07/31/lenticule-import/morphisms/assertive-positing-morphism.md) $\mathrm{posit}_{(\phi, \mathbf{t})}$ first fires: $v_{\tau_0}(\phi) \geq_t \mathbf{t}$ while $v_\sigma(\phi) <_t \mathbf{t}$ for all $\sigma < \tau_0$.

**Part 2 (retraction as denial positing).** The truth-window closes at $\tau_1$ upon a [denial positing morphism](../../research/2026/07/31/lenticule-import/morphisms/denial-positing-morphism.md) $\mathrm{posit}_{(\phi, \mathbf{f})}$ firing at $\tau_1$:

$$v_{\tau_1}(\phi) = v_{\tau_1 - 1}(\phi) \vee_k \mathbf{f} = \mathbf{t} \vee_k \mathbf{f} = \top.$$

After $\tau_1$, the cell is contested ($v_\tau(\phi) = \top$ for all $\tau \geq \tau_1$) and no further positing can lower it. The positive evidence from $\tau_0$ is not erased: the bilattice's paraconsistent $\top$ holds both the original assertion evidence and the denial evidence simultaneously.

**Part 3 (limit-ordinal retraction is non-Scott-continuous).** If $\tau_1$ is a limit ordinal at which the denial positing fires — i.e., $v_\sigma(\phi) = \mathbf{t}$ for all $\sigma \in [\tau_0, \tau_1)$ and $v_{\tau_1}(\phi) = \top$ — then $\tau_1$ is a [non-Scott-continuous firing ordinal](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/settling-continuity/content/non-scott-continuous-firing-ordinal/non-scott-continuous-firing-ordinal.md):

$$\bigvee_k \{v_\sigma(\phi) : \sigma < \tau_1\} = \mathbf{t} \quad \text{but} \quad v_{\tau_1}(\phi) = \top \neq \mathbf{t}.$$

The denial positing introduces evidence at a limit ordinal that is not approached from below by the prior settling stages — it is an infinitary jump, not a colimit.

**Part 4 (successor-ordinal retraction is Scott-continuous).** If $\tau_1 = \tau_1' + 1$ is a successor ordinal, the denial positing is a standard single-step firing; Scott continuity at all limit ordinals below $\tau_1$ is unaffected.

## Proof

*Part 1.* By definition of the truth-window and the [assertive positing morphism](../../research/2026/07/31/lenticule-import/morphisms/assertive-positing-morphism.md), which is the unique positing morphism with datum $\geq_t \mathbf{t}$ that raises the cell from below $\mathbf{t}$ to $\geq_t \mathbf{t}$.

*Part 2.* The bilattice join table on $\mathbf{FOUR}$ gives $\mathbf{t} \vee_k \mathbf{f} = \top$. Since $\top$ is the $\leq_k$-maximum, all subsequent $\leq_k$-joins with any datum $q$ give $\top \vee_k q = \top$.

*Part 3.* For all $\sigma \in [\tau_0, \tau_1)$: $v_\sigma(\phi) = \mathbf{t}$, so $\bigvee_k \{v_\sigma(\phi) : \sigma < \tau_1\} = \mathbf{t}$. But $v_{\tau_1}(\phi) = \top \neq \mathbf{t}$, violating [settling continuity](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/settling-continuity/settling-continuity.md) at $\tau_1$.

*Part 4.* No limit ordinal is involved; Scott continuity is not a condition on successor steps. $\square$

## Johnston's three temporal dimensions in PredCat

| Johnston dimension | PredCat realization |
|---|---|
| **Valid time** | The period during which $\phi$ is true in reality — the closed settling's truth-designation |
| **Transaction time** | The settling stage $\tau_0$ at which the assertive positing morphism is recorded |
| **Assertion time** | The truth-window $[\tau_0, \tau_1)$ — the settling-index interval during which the cell is truth-designated |

The three are structurally distinct: a cell may be posited (transaction time $\tau_0$) before it becomes truth-designated in the closure (valid time), and the assertion-time window may close (via retraction at $\tau_1$) while the positing record remains.

## Bilattice refinement over Johnston

Johnston models retraction as erasure: the retracted assertion ceases to be held, with no residue in the model. PredCat refines this in two ways:

1. **Retraction as contestation.** Retraction is not erasure but the application of a denial positing morphism, escalating the cell to $\top$. The original assertion evidence is preserved in $\top$'s positive coordinate; the retraction evidence occupies $\top$'s negative coordinate. The contested cell records the epistemic history: both assertion and denial are present.

2. **Retraction as potential non-Scott-continuity.** Limit-ordinal retractions are non-Scott-continuous firings, which contribute generators to the settling cohomology ([transfinite-bounded regime H¹ generators](../../research/2026/07/31/lenticule-import/theorems/transfinite-bounded-regime-h1-generators.md)). Assertion-time windows that close at limit ordinals leave cohomological traces in the settling — a structural record of when infinitary retractions occur.

## Assertion-time stability by regime

| Regime | Retraction type | Scott continuity |
|---|---|---|
| Strict ($\kappa < \omega$) | Successor only | Preserved; truth-window closes at finite stage |
| Scott-continuous ($\kappa = \omega$) | Successor or limit | Limit retraction is non-Scott-continuous |
| Transfinite-bounded ($\omega < \kappa < \omega_1$) | Limit or transfinite | Non-Scott-continuous firings counted by $L_{\mathrm{ns}}(\kappa)$ |
| Aperiodic ($\kappa \geq \omega_1$) | May recur | Non-Scott-continuous firings may accumulate |
