---
type: definition
class: incumbency-cycling
status: draft
depends-on: [office-as-double-settlement, incumbent, recurrent-practice, succession]
realizes: [rotational-authority, andean-ayllu]
aliases:
  - Rotational authority
---

# Rotational authority

The mathematical realization of *rotational authority* — the governance pattern by which authority over a domain cycles through population members rather than residing in any individual indefinitely. Drawn from the Andean ayllu tradition per the [indigenous-governance-traditions survey](../../../../../../governance-services-section/content/text/documents/notes/2026-04-03-note-on-indigenous-governance-traditions-survey.md), with structurally analogous patterns in Aboriginal Australian age-grade authority, ayllu's rotational leadership of *minka* (collective work), and Haudenosaunee chief-rotation through clan-mother-driven removal-and-replacement.

## Data

A rotational authority $\mathrm{Rot}$ for [office](office-as-double-settlement.md) $O$ within [polity](../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/polity.md) $\mathcal{P}$ is a tuple

$$\mathrm{Rot} \;=\; (O,\; \mathrm{Pop}_O,\; \pi,\; \delta)$$

where:

- $O$ — the office whose authority rotates.
- $\mathrm{Pop}_O \subseteq \mathrm{Pop}_\mathcal{P}$ — the *eligible population*: members of $\mathcal{P}$'s populace eligible to bear $O$'s incumbency. Eligibility may depend on age-grade (Aboriginal), clan membership (Haudenosaunee), able-bodied participation in *minka* (ayllu), or other substrate-cell conditions.
- $\pi$ — the *rotation period*: a duration (in stages or in cycles of a [recurrent practice](../../../../../content/glossary/terms/recurrent-practice.md)) after which the current incumbent's term ends and the next rotation begins.
- $\delta$ — the *rotation discipline*: the rule for selecting the next incumbent from $\mathrm{Pop}_O$. Common forms: random selection, lot-casting, age-cohort progression, prior-rotation-completion ordering, kinship-ordering.

## Realization as periodic [succession](./succession.md)

Rotational authority is implemented as a [recurrent practice](../../../../../content/glossary/terms/recurrent-practice.md) whose closure rules drive periodic [succession](./succession.md). At each rotation boundary $\tau \in T_\mathrm{Rot}$:

1. *Term-end trigger.* Closure rule fires when the current incumbent's term-clock reaches $\pi$: $\langle \iota_i, \texttt{term-elapsed-at-stage}, \tau\rangle = \mathbf{t}$.
2. *Relief.* The closure rule retires the current incumbency by asserting $\langle \iota_i, \texttt{relieved-by-rotation}, \tau\rangle = \mathbf{t}$. The cells of $\iota_i$'s incumbency proposition (institution, induction) move toward retirement.
3. *Selection.* The discipline $\delta$ identifies the next incumbent $a' \in \mathrm{Pop}_O$ — substrate-algebraic content depends on the discipline (a closure rule encoding the lot-casting, or age-progression, or other selection logic).
4. *Installation.* A new [incumbency](../../objects/incumbent.md) proposition $\iota_{i+1}$ for $a'$ is installed — the [installation](../../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/installation.md) increment fires, settling the institution and induction predicates jointly. The substrate's [succession morphism](./succession.md) handles this in a single increment.

By [settling-monotonicity](../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), the prior incumbent's *historical* cells (`institution`, `induction` settled at $\mathbf{t}$ during their term) persist as substrate record; only the `potential` cells move. Each rotation extends the substrate's audit history; no past incumbency is erased.

## Distinguishing properties

**No accumulation of personal authority.** No single agent holds $O$'s deontic profile across multiple rotation periods. Substrate-algebraic content: the cell $\langle a, \texttt{has-held}, O, \texttt{at-stage}, \tau\rangle$ may settle at $\mathbf{t}$ for a stage during $a$'s term, but the *current* incumbency cells $\langle \iota_a, \texttt{instituted-into}, O\rangle$ retire at $\tau + \pi$. Past tenure is recorded; current authority does not extend beyond the term.

**Distributed experience of authority.** Over time, every member of $\mathrm{Pop}_O$ has at-some-stage held $O$'s incumbency. This produces a *substrate-recordable* distribution: the cells $\langle a, \texttt{has-held-at-some-stage}, O\rangle$ for $a \in \mathrm{Pop}_O$ all eventually settle at $\mathbf{t}$. The polity's history is one in which authority-experience is broadly distributed.

**Constraints on durable change.** Each incumbent has a bounded period in which to enact their authority. Multi-year initiatives extending beyond $\pi$ require either (a) cross-rotation continuity (the next incumbent continues the prior's project — substrate-algebraic content: cells $\langle \iota_{i+1}, \texttt{continues-project-of}, \iota_i\rangle = \mathbf{t}$), or (b) institutional embedding (the project becomes a charter rule, persisting independently of any single incumbent).

This is a structural property: rotational authority makes incumbent-specific durable initiatives *harder* to enact, and institution-embedded initiatives *more attractive*. Substrate-algebraic content: the operations settling preferentially settles cells associated with charter rules over cells associated with single-incumbent decisions.

## Comparison with permanent appointment

| | Rotational authority | Permanent appointment |
|---|---|---|
| Period $\pi$ | Bounded | Indefinite (until removal/death) |
| Same agent recurrence | Possible (re-rotation) | Continuous |
| Cells per incumbency | Single $\iota$, retired at $\tau + \pi$ | Single $\iota$, retired only by external event |
| Substrate-recorded distribution | Wide | Narrow |
| Robustness to incumbent failure | High (next rotation imminent) | Low (depends on removal mechanism) |
| Continuity for projects | Lower (cross-rotation handoff required) | Higher |

Both are valid governance patterns with different structural properties. The substrate carries either, depending on the polity's closure-rule subsystem.

## Cycling vs. recurrent practice

Rotational authority is structurally a [recurrent practice](../../../../../content/glossary/terms/recurrent-practice.md) whose cycle-content is *the office's incumbency cells*. The practice's $\mathcal{S}_R$ comprises the term-end-trigger, relief, selection, and installation rules. Its $T_R$ is the rotation-boundary ordinals. Its $\alpha_R$ is typically *Markov* (each rotation depends only on the prior rotation's incumbent for selection-ordering purposes), placing the practice in the [Scott-continuous regime](../../../../../content/glossary/concepts/regime-of-recurrent-practice.md). $H^1 = 0$ on the rotational settling itself.

Higher-regime structures arise when the rotation discipline has limit-aggregation: a discipline that cycles through *all* members of $\mathrm{Pop}_O$ before any can be re-selected requires reading the full set of past incumbencies. For finite $\mathrm{Pop}_O$, this is finite-history. For arbitrarily-growing populace (new members added over generations), it can be limit-aggregating, lifting to transfinite-bounded.

## Connection to the ayllu's *ayni* and *minka*

Per the survey, ayllu governance is structured by:

- *Ayni* — reciprocal exchange: each household provides labor when others need it, with reciprocal obligation to receive when they need.
- *Minka* — collective labor with rotational leadership.
- *Rotational authority* — the structural organization of who-leads-when.

Substrate-algebraic content of ayni:

$$\langle h_1, \texttt{provided-labor-to}, h_2\rangle = \mathbf{t} \;\Longrightarrow\; \langle h_2, \texttt{owes-reciprocal-labor-to}, h_1\rangle = \mathbf{t}$$

A closure rule paired with [correlate-of](./correlate-of.md): provision of labor creates a reciprocal-debt jural relation. The substrate maintains a *reciprocal-debt graph* across the populace.

Minka rotation cycles leadership of collective tasks through eligible members: each *minka* event has its own incumbency, drawn from $\mathrm{Pop}_{\text{minka}}$ by the rotation discipline, retired at task completion.

The combination — ayni reciprocal-debt graph plus minka rotational leadership — is the ayllu's governance substrate. Authority is not concentrated; it cycles. Reciprocity is not transactional; it accumulates as a graph. Both are substrate-readable, both are non-Hohfeldian (no central sovereign, no individual rights as primary), both are structurally well-defined.

## What this object imports from the tradition

The Andean ayllu provides a substrate-algebraic alternative to the Hohfeldian-power model: authority that cycles rather than accumulates, structured by population-eligibility and rotation-discipline. Predicated-governance's structural commitment is that *both* permanent-appointment and rotational-authority are admissible patterns; the math doesn't privilege either; the polity's choice is a structural choice with substrate-algebraic consequences.

This is the substrate-algebraic content of "the ayllu is essentially egalitarian" from the survey: not a normative claim about equality, but a *structural fact* about how the ayllu's closure rules distribute authority across the populace. The math can verify this distribution by reading the substrate's incumbency-history cells.

## Earlier material

The current incumbent's incumbency cells — $\langle \iota_i, \texttt{instituted-into}, O\rangle$ and $\langle \iota_i, \texttt{inducted-into}, O\rangle$ — are $\leq_k$-monotone during the term (they accumulate at $\mathbf{t}$ from the installation increment).
By the [predication-settling CALM corollary](../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/formalization/infomaterial/lib/infomaterial/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/settling-calm-corollary.md):

- Confirming "is $a$ the current incumbent of $O$?" is coordination-free during the term: any replica can locally confirm the incumbency cells.
- Confirming "has $a$ *ceased* to be incumbent?"
  (the rotation-completion check) requires coordination: the term-elapsed cell must be settled and the relief increment settled across all replicas.

For distributed polities where replicas may not have received the rotation's relief increment: there is a window after rotation-boundary $\tau + \pi$ where some replicas still report $a$ as incumbent.
This is the CALM-characteristic eventual-consistency window.
The positive "is incumbent?" query converges to the new incumbent once the installation increment propagates; the negative "is not incumbent?" requires that propagation to have fully settled.

In the [temporal 2-category](../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/temporal-2-category/temporal-2-category.md) $\mathbf{T}(\mathcal{C}_\mathcal{P}, \lambda)$, each rotation cycle is a 1-cell:

$$\Sigma_{\mathrm{rot}}^{(i)} : (\tau_i, \mathcal{C}_\mathcal{P}) \to (\tau_{i+1}, \mathcal{C}_\mathcal{P})$$

carrying the incumbency fiber change: at $\tau_i$, incumbent $a_i$ holds $O$; at $\tau_{i+1}$, incumbent $a_{i+1}$ holds $O$.
The rotation practice's full execution is the composite 1-cell $\Sigma_{\mathrm{rot}}^{(N)} \circ \cdots \circ \Sigma_{\mathrm{rot}}^{(0)}$.

For a *Markov* rotation discipline (discipline reads only the prior incumbent): the KZ-lax-idempotent diamond collapses and the temporal 2-category restricts to a 1-category on the rotation's 0-cells.
Each cycle's settling is strictly determined by the prior, and no transfinite limit behavior arises.

For a *limit-aggregating* discipline (must cycle through *all* members of $\mathrm{Pop}_O$ before repeating): the discipline's antecedent reads the full prior-incumbency history at each rotation boundary.
At the $\omega$-th rotation (after cycling through a countably-infinite population once), the limit 0-cell $(\omega, \mathcal{C}_\mathcal{P})$ has a non-trivial KZ 2-cell — the limit rotation is genuinely richer than any finite prefix.
This lifts the rotation practice to the transfinite-bounded regime and gives $H^1 \neq 0$ at the limit, as noted in the [cycling vs. recurrent practice](#cycling-vs-recurrent-practice) section.

The current incumbent's incumbency cells — $\langle \iota_i, \texttt{instituted-into}, O\rangle$ and $\langle \iota_i, \texttt{inducted-into}, O\rangle$ — are $\leq_k$-monotone during the term (they accumulate at $\mathbf{t}$ from the installation increment). By the [predication-settling CALM corollary](../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/formalization/infomaterial/lib/infomaterial/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/settling-calm-corollary.md):

- Confirming "is $a$ the current incumbent of $O$?" is coordination-free during the term: any replica can locally confirm the incumbency cells.
- Confirming "has $a$ *ceased* to be incumbent?" (the rotation-completion check) requires coordination: the term-elapsed cell must be settled and the relief increment settled across all replicas.

For distributed polities where replicas may not have received the rotation's relief increment: there is a window after rotation-boundary $\tau + \pi$ where some replicas still report $a$ as incumbent. This is the CALM-characteristic eventual-consistency window. The positive "is incumbent?" query converges to the new incumbent once the installation increment propagates; the negative "is not incumbent?" requires that propagation to have fully settled.

In the [temporal 2-category](../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/temporal-2-category/temporal-2-category.md) $\mathbf{T}(\mathcal{C}_\mathcal{P}, \lambda)$, each rotation cycle is a 1-cell:

carrying the incumbency fiber change: at $\tau_i$, incumbent $a_i$ holds $O$; at $\tau_{i+1}$, incumbent $a_{i+1}$ holds $O$. The rotation practice's full execution is the composite 1-cell $\Sigma_{\mathrm{rot}}^{(N)} \circ \cdots \circ \Sigma_{\mathrm{rot}}^{(0)}$.

For a *Markov* rotation discipline (discipline reads only the prior incumbent): the KZ-lax-idempotent diamond collapses and the temporal 2-category restricts to a 1-category on the rotation's 0-cells. Each cycle's settling is strictly determined by the prior, and no transfinite limit behavior arises.

For a *limit-aggregating* discipline (must cycle through *all* members of $\mathrm{Pop}_O$ before repeating): the discipline's antecedent reads the full prior-incumbency history at each rotation boundary. At the $\omega$-th rotation (after cycling through a countably-infinite population once), the limit 0-cell $(\omega, \mathcal{C}_\mathcal{P})$ has a non-trivial KZ 2-cell — the limit rotation is genuinely richer than any finite prefix. This lifts the rotation practice to the transfinite-bounded regime and gives $H^1 \neq 0$ at the limit, as noted in the [cycling vs. recurrent practice](#cycling-vs-recurrent-practice) section.

In the [temporal 2-category](../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/temporal-2-category/temporal-2-category.md) $\mathbf{T}(\mathcal{C}_\mathcal{P}, \lambda)$, each rotation cycle is a 1-cell:
