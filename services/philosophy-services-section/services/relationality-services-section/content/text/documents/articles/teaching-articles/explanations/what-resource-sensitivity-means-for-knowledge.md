---

title: "What Resource Sensitivity Means for Knowledge"
description: "Linear logic treats premises as resources consumed by use. Applied to knowledge systems, this means assertions have epistemic weight that gets used up when you reason with them."
date-created: 2026-03-31
requires: []
teaches:
  - linear-logic
  - epistemic-state
---

In classical logic, knowing something is free. If you know $A$, you can use $A$ as many times as you want, in as many arguments as you like, and $A$ is still there when you are done. Knowledge is unlimited and indestructible.

This is a useful fiction, but it is a fiction.

In practice, using a piece of evidence changes your relationship to it. Citing a source as support for a claim puts weight on that source. If the source turns out to be unreliable, every argument that cited it is weakened. If two sources contradict, using both does not give you twice as much knowledge — it gives you a contradiction.

[Linear logic](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/linear-logic.md) formalizes this. In linear logic, using a premise **consumes** it. If you know $A$, you can use $A$ once. Using it a second time requires a second copy. The logic tracks what resources you have and what you spend.

Applied to a knowledge system valued in the four-valued [bilattice](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/bilattice.md):

**Extending combines epistemic content.** When you assert "source 1 says $P$" ($t$ for $P$) and "source 2 says $P$" (another $t$ for $P$), combining them via tensor/fusion ($\odot$) gives $t \odot t = t$: the affirmation is confirmed. But combining "source 1 says $P$" ($t$) with "source 2 says not-$P$" ($f$) gives $t \odot f = f$: extending an affirmation by a denial collapses to denial. The affirmation was consumed — it did not survive the combination.

**Restricting tests against epistemic conditions.** Asking "does the evidence for $P$ survive the constraint of $Q$?" uses both the evidence and the constraint. The result depends on the [epistemic states](../../../../../../../../../information-science-services-section/content/text/glossary/terms/epistemic-state.md) of both.

**Contradiction consumes evidence.** The state $\top$ (contested) means both affirmation and denial are present. Arriving at $\top$ consumes the individual affirmation and denial — they are no longer separable. The system knows there is a conflict, but the individual pieces of evidence that produced the conflict have been fused into the contestation.

This is what linear logic's resource sensitivity means for knowledge: reasoning with evidence uses the evidence. Affirming something and then denying it does not leave you where you started — it leaves you in a state of contestation ($\top$) that is qualitatively different from ignorance ($\bot$). The four values track this: $\bot$ is having nothing, $t$ and $f$ are having something, $\top$ is having too much. Each state is a different kind of epistemic resource, and the [residuation](../../../../../../../../../information-science-services-section/services/math-services-section/services/algebra-services-section/content/text/glossary/terms/residuated-lattice.md) tracks how they combine and constrain each other.

## Earlier material

Applied to a knowledge system valued in the four-valued [bilattice](../../../../../../services/agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/archive/prose/math/theories/algebra/terms/bilattice.md):
