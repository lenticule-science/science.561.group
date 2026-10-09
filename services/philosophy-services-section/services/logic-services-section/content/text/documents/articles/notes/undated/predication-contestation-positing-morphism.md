---
type: morphism
class: operator
symbol: "\\mathrm{contest}_{\\phi}"
status: draft
depends-on: [positing-morphism, knowledge-order, truth-order, four-bilattice, predication-settling-category, adjudication]
see-also: [assertive-positing-morphism, denial-positing-morphism, belnap-speech-act-partition, channel-theoretic-speech-acts, inconsistency-sheaf]
title: Contestation positing morphism
description: "The contestation positing morphism at cell $\\phi = (s, p, o)$ is the positing morphism $\\mathrm{posit}{(\\phi, q)}$ with datum $q$ knowledge-maximal: $q \\geqk \\mathbf{t} \\wedgek \\mathbf{f}$, i.e., $q = \\top$ on $\\mathbf{FOUR}$."
---

# Contestation positing morphism

The **contestation positing morphism** at cell $\phi = (s, p, o)$ is the [positing morphism](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/positing-morphism/positing-morphism.md) $\mathrm{posit}_{(\phi, q)}$ with datum $q$ **knowledge-maximal**: $q \geq_k \mathbf{t} \wedge_k \mathbf{f}$, i.e., $q = \top$ on $\mathbf{FOUR}$. Denoted $\mathrm{contest}_\phi := \mathrm{posit}_{(\phi, \top)}$.

For a general bilattice $\mathbf{L}^\bowtie$, the contestation class is all positing morphisms with datum $q = \langle 1_\mathbf{L}, 1_\mathbf{L} \rangle = \top$ (both positive and negative evidence at maximum simultaneously).

## Characterization

A contestation positing morphism:
1. **Injects both positive and negative evidence simultaneously.** The datum $\top = \langle 1, 1 \rangle$ carries maximum evidence on both sides.
2. **Is $\leq_k$-absorbing.** Since $\top$ is the $\leq_k$-maximum, $v(\phi) \vee_k \top = \top$ for any current value $v(\phi)$. Once a cell is contested, no further positing morphism can raise it in $\leq_k$ — it is already maximally informed.
3. **Is $\leq_t$-neutral.** On $\mathbf{FOUR}$, $\top$ satisfies $\mathbf{f} <_t \top <_t \mathbf{t}$ strictly — it is truth-neutral, between denial and assertion on the truth axis.
4. **Is closed under closure.** $\mathrm{cl}_p(\top) = \top$ for any closure operator (by $\leq_k$-maximality). Contesting is the only speech-act class stable under closure.

## How a cell becomes contested

A cell $\phi$ reaches value $\top$ via two routes:

**Route 1: Explicit contestation positing.** A single positing morphism $\mathrm{contest}_\phi$ injects $\top$ directly. This corresponds to a speech act that simultaneously holds both sides — a speaker in full knowledge of a contradiction, holding it as such.

**Route 2: Composition of asserting and denying.** By the [Belnap speech-act partition theorem](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/belnap-speech-act-partition.md): $\mathbf{t} \vee_k \mathbf{f} = \top$. An assertive positing followed by a denial positing (or vice versa, or from two different agents) produces contestation. This is the operationally typical route: two agents with opposing evidence posit independently, and the $\vee_k$-merge of their settlings produces $\top$ at the contested cell.

## Paraconsistent content

The $\top$ value is held by the [four-bilattice](../../research/2026/07/31/lenticule-import/objects/four-bilattice.md) without trivializing inference: $\top$ is a designated value (it is above both $\mathbf{t}$ and $\mathbf{f}$ in the knowledge order), so conclusions can still be drawn from a $\top$-valued cell. The bilattice's paraconsistency means that the existence of a contested cell does not cause every cell to become contested (no ex falso propagation). The [inconsistency sheaf](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/inconsistency-sheaf/inconsistency-sheaf.md) tracks the distribution of contested cells across the predication settling.

## Under the Klein-four symmetry

By the [Belnap speech-act partition theorem](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/belnap-speech-act-partition.md): conflation $-$ swaps abstaining $\leftrightarrow$ contesting ($-(\bot) = \top$, $-(\top) = \bot$). The contestation class is the conflation-image of the abstaining class. Negation $\sim$ fixes $\top$ ($\sim(\top) = \top$), so contestation is also fixed by negation — contested cells are neither asserting nor denying, so negation does not reclassify them.

## Speech-act reading

The contestation positing morphism has no clean parallel in the Austin-Searle taxonomy, which was developed for unparaconsistent natural language. The closest analog is **contesting** as a pragmatic act — the simultaneous holding of conflicting evidence without resolution — which Searle's framework cannot represent because classical logic treats contradictions as trivializing. The bilattice setting is precisely what makes contestation a proper, non-trivializing class: $\top$ is a stable and meaningful value, not a signal of system failure.

In the multi-observer setting ([multi-observer-system](../../../../glossary/terms/multi-observer-system.md)), contestation positing morphisms arise naturally at cells where two agents have submitted incompatible evidence — one asserting, one denying. The merged settling holds $\top$ at that cell, and the [bilattice network sheaf consensus theorem](../../research/2026/07/31/lenticule-import/theorems/bilattice-network-sheaf-consensus.md) ensures this is a stable equilibrium (if neither agent retracts, the $\top$ persists).
