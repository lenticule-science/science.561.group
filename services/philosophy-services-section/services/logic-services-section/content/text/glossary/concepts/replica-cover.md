---
type: concept
class: cover-pattern
depends-on: [bitopological-settling-site, distributed-settling-system, paired-priestley-space]
title: Replica cover
description: A two-element pairwise-Stone cover on the bitopological settling site corresponding to two replicas in a distributed settling system.
kind: concept
---

# Replica cover

A two-element pairwise-Stone cover on the [bitopological settling site](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/bitopological-settling-site/bitopological-settling-site.md) corresponding to two replicas in a [distributed settling system](../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/distributed-settling-system.md).

Fix $(q, \tau, U) \in \mathbf{T}^*_{\mathrm{site}}$ with $U = U_1 \cup U_2$ a union of two pairwise-Stone clopens. The pair

$$\{(q, \tau, U_i) \to (q, \tau, U)\}_{i \in \{1, 2\}}$$

is a **replica cover** of $(q, \tau, U)$. Its Čech nerve is the simplicial object $U_1 \sqcup U_2 \leftleftarrows U_1 \cap U_2$, truncated at simplicial degree 1 since two-element covers contribute only $U_1, U_2, U_1 \cap U_2$.

## Why "replica"

Under [Jung–Rivieccio duality](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/references/jung-rivieccio-duality.md), a settling state $v_i$ on the primal side corresponds to a clopen up-set $U_i = \phi(v_i)$ on the [paired Priestley dual](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/paired-priestley-space.md) — and the [knowledge order](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/replica-cover/docs/dev/concepts/knowledge-order.md) merge $v_1 \vee_k v_2$ corresponds to the union $U_1 \cup U_2$. Each $U_i$ is therefore the spectral image of a *replica*, a single distributed node's accumulated evidence; the replica cover assembles the two replicas as a cover of their merge.

Local sections of a sheaf on $(q, \tau, U_i)$ represent replica $i$'s view of the data; gluing two such sections to a section on $(q, \tau, U)$ is the cohomological face of the [CRDT convergence](crdt-convergence.md) merge, formalized through the [replica Mayer–Vietoris sequence](../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/replica-mayer-vietoris.md).
