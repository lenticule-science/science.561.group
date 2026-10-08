---
type: example
depends-on: [replica-cover, replica-mayer-vietoris, crdt-convergence-via-mayer-vietoris, settling-associated-sheaf, multi-agent-epistemic-settling, four-bilattice]
instantiates: [crdt-convergence-via-mayer-vietoris, replica-mayer-vietoris]
lineage: 2
title: Three-replica Mayer–Vietoris
description: The cohomological face of the multi-agent epistemic settling — three sources reporting on a single L2 social-network claim, with their disagreement aggregated as $\top$.
---

# Three-replica Mayer–Vietoris

The cohomological face of the [multi-agent epistemic settling](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/examples/multi-agent-epistemic-settling.md) — three sources reporting on a single L2 social-network claim, with their disagreement aggregated as $\top$. **Lineage 2** instance for Mayer-Vietoris on the social-network base.

## Setup

[Entity set](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/objects/entity-set.md) $E = \{\text{Alice}, \text{Bob}\}$, [predicate set](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/objects/predicate-set.md) $\Pi = \{\text{Likes}\}$, $q = \text{Likes}$ (single predicate). After three report-rounds, three replicas with local states:

- **Replica 1.** $v_1(\text{Likes})(\text{Alice}, \text{Bob}) = \mathbf{t}$.
- **Replica 2.** $v_2(\text{Likes})(\text{Alice}, \text{Bob}) = \mathbf{t}$.
- **Replica 3.** $v_3(\text{Likes})(\text{Alice}, \text{Bob}) = \mathbf{f}$.

Each replica's local state corresponds via [Jung–Rivieccio duality](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/references/jung-rivieccio-duality.md) to a pairwise-Stone clopen $U_i \subseteq X_q^\tau$. The [replica covers](../../../../glossary/concepts/replica-cover.md) $U_1, U_2, U_3$ jointly cover $U = U_1 \cup U_2 \cup U_3 \subseteq X_q^\tau$.

## Mayer–Vietoris sequence

Apply the three-replica generalization of the [replica Mayer–Vietoris](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/replica-mayer-vietoris.md) sequence (iterated two-replica):

$$\cdots \to H^{n-1}\Bigl(\bigcap_i U_i, \mathcal{F}_U\Bigr) \to H^n\Bigl(\bigcup_i U_i, \mathcal{F}_U\Bigr) \to \bigoplus_i H^n(U_i, \mathcal{F}_U) \to \bigoplus_{i < j} H^n(U_i \cap U_j, \mathcal{F}_U) \to \cdots$$

## Connecting homomorphism vanishes

By [CRDT convergence via Mayer–Vietoris](../../../../glossary/concepts/crdt-convergence-via-mayer-vietoris.md), $\delta^0 : H^0\bigl(\bigcap_i U_i, \mathcal{F}_U\bigr) \to H^1\bigl(\bigcup_i U_i, \mathcal{F}_U\bigr)$ is identically zero on the [settling-associated sheaf](../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agent-organization-engine/lib/relating/docs/settling-associated-sheaf.md).

Concretely: the section at the triple intersection — "Alice either likes Bob (per replicas 1, 2) or does not (per replica 3)" — merges into a global section on $U$ via the [knowledge-order](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/concepts/knowledge-order.md) merge:

$$v_1 \vee_k v_2 \vee_k v_3 \;=\; \mathbf{t} \vee_k \mathbf{t} \vee_k \mathbf{f} \;=\; \top$$

at the disputed cell $(\text{Alice}, \text{Bob})$.

## Cohomological reading of convergence

The vanishing of $\delta^0$ confirms the merged state is a well-defined global section: the $\top$-valued cell is a legitimate, cohomologically-coherent aggregate of all three inputs. No coordination is required for the merge; convergence happens automatically via $\vee_k$. This is the [CRDT convergence theorem](../../../../glossary/concepts/crdt-convergence.md) applied cohomologically to three replicas.

The "inconsistency via $\top$" behavior (Belnap's original motivation) appears as a global section of the merged system — cohomologically coherent despite being semantically contradictory. This is exactly the paraconsistency the bilattice framework provides, now visible at the cohomological level.

## Role

Exhibits the Mayer–Vietoris machinery on an explicit three-replica instance. The same example that motivates Belnap's [four-element bilattice](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/objects/four-bilattice.md) at the level of value-aggregation appears here as a cohomological verification: the disagreement among replicas is recorded by $\top$ in $H^0$, and the absence of $H^1$-obstruction confirms that the disagreement does not produce coordination-failure.

## Position in Lineage 2

Pairs with [multi-agent-epistemic-settling](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/examples/multi-agent-epistemic-settling.md) — that example shows the bilattice aggregation; this one shows the cohomological coherence. Together they exhibit the Belnap-motivation / Mayer-Vietoris correspondence on the L2 social-network base.
