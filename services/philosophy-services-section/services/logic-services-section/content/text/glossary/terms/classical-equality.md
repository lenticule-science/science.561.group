---
type: definition
class: predicate-section
symbol: "=_E"
depends-on: [predication-hyperdoctrine, predicate-specialization, equality-via-equalizer, truth-order, specialization-hyperdoctrinal-adjoints, entity-set]
title: Classical equality (derived)
description: "Fix a predicate specialization $g : q \\to p$ with $\\mathrm{dom}(q) = \\DeltaE := \\{(s, s) : s \\in E\\}$ — the diagonal sub-support of the entity set $E$."
kind: definition
---

# Classical equality (derived)

Fix a [predicate specialization](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-specialization.md) $g : q \to p$ with $\mathrm{dom}(q) = \Delta_E := \{(s, s) : s \in E\}$ — the diagonal sub-support of the [entity set](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-hyperdoctrine/library/classical-equality/docs/dev/scraps/entity-set.md) $E$. The **classical equality** on an [predication hyperdoctrine](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-hyperdoctrine/library/classical-equality/docs/dev/scraps/predication-hyperdoctrine.md) is the $\leq_t$-Lawvere image

$$=_E \;:=\; \exists_g^t(\mathbf{1}_q^t) \in \mathcal{E}_p,$$

where $\mathbf{1}_q^t$ is the $\leq_t$-terminal of $\mathcal{E}_q$ — the constant-$\mathbf{t}$ valuation on $\Delta_E$.

By the [specialization hyperdoctrinal adjoints](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-hyperdoctrine/library/classical-equality/docs/dev/theorems/specialization-hyperdoctrinal-adjoints.md) extension formulas (the $\leq_t$-system extends by $\mathbf{f}$),

$$=_E(s, o) = \begin{cases} \mathbf{t} & s = o, \\ \mathbf{f} & s \neq o. \end{cases}$$

This is classical two-valued equality, *derived* from the [truth-order](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/truth-order/truth-order.md) adjoint system via Lawvere's diagonal-$\Sigma$ construction — not postulated. Bilattice first-order logics in the literature (BD∆, Kamide–Zohar, Běhounek–Daňková–Dvořák) postulate classical equality as a primitive; the construction here shows the postulate is unnecessary, falling out of the dual adjoint triple.
