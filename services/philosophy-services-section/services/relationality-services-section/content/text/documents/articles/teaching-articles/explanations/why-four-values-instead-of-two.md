---

title: "Why Four Values Instead of Two?"
description: "Classical logic has true and false. Belnap's bilattice adds 'unknown' and 'contradictory.' This text explains why the four-valued system is the right one for knowledge that comes from multiple sources."
date-created: 2026-03-31
requires: []
teaches:
  - epistemic-state
  - bilattice
---

Classical logic has two values: true and false. Every proposition is one or the other. This works when you have a single, reliable source of information — a mathematical proof, a direct observation, a trusted oracle.

It breaks down when you have multiple sources that can disagree.

Suppose two databases report on whether a patient is allergic to penicillin. Database A says yes. Database B says no. What is the truth value of "the patient is allergic to penicillin"?

In classical logic, you are stuck. The proposition must be true or false, but your sources disagree. You could pick one source and trust it, but that discards information. You could throw up your hands, but that is not a logic — it is giving up.

Belnap (1977) proposed a different answer. Instead of two values, use four:

- **⊥ (unknown)**: no source has said anything. You have no information.
- **t (affirmed)**: at least one source says yes, and no source says no.
- **f (denied)**: at least one source says no, and no source says yes.
- **⊤ (contested)**: at least one source says yes AND at least one says no.

The allergic-to-penicillin question has value ⊤: both affirmation and denial are present. This is not an error. It is a state of knowledge — the state where you know there is a disagreement.

These four values carry two independent pieces of information. The first is whether there is evidence FOR the proposition (the positive component). The second is whether there is evidence AGAINST it (the negative component). Each component is binary (present or absent), so there are $2 \times 2 = 4$ combinations:

| Positive evidence | Negative evidence | Value |
|---|---|---|
| absent | absent | ⊥ (unknown) |
| present | absent | t (affirmed) |
| absent | present | f (denied) |
| present | present | ⊤ (contested) |

This is why the four-valued [bilattice](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/bilattice.md) is the [twist product](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/residuated-lattice/content/twist-product/twist-product.md) $\mathbf{2} \otimes \mathbf{2}$: it is two independent binary channels (positive and negative evidence) combined into a single structure.

The four values have two natural orderings. The **truth ordering** ranks by how much truth is asserted: denied ($f$) is at the bottom, affirmed ($t$) is at the top, and unknown ($\bot$) and contested ($\top$) are in between, incomparable to each other. The **knowledge ordering** ranks by how much information is present: unknown ($\bot$) is at the bottom (no information at all), contested ($\top$) is at the top (maximum information, even if contradictory), and affirmed ($t$) and denied ($f$) are in between.

The knowledge ordering captures something classical logic cannot express: $\top$ (contested) has MORE information than $t$ (affirmed), not less. A contradiction is not an absence of knowledge — it is a surplus. The system knows too much, not too little. Resolving a contradiction requires discarding information (deciding which source to trust), not acquiring it.

Fitting (2002) proved $\{\bot, t, f, \top\}$ is the [free](../../../../../../../../../information-science-services-section/services/math-services-section/services/algebra-services-section/content/text/glossary/terms/free-algebra.md) bounded [distributive](../../../../../../../../../information-science-services-section/services/math-services-section/services/algebra-services-section/content/text/glossary/terms/distributivity.md) bilattice on one generator. It is the simplest bilattice, the most general, and the universal one. Any system that tracks positive and negative evidence independently, with no additional constraints, arrives at these four values. There is no fifth value to add and no way to reduce to three without losing information.

This is why two values are not enough: they collapse the distinction between "no information" and "negative information," and between "positive information" and "contradictory information." Four values preserve these distinctions. They are the minimum needed for multi-source knowledge.
