---
kind: theorem
status: proved
depends-on: [crdt-convergence-via-mayer-vietoris, replica-mayer-vietoris, settling-cohomology-vanishes-above-degree-1, settling-calm-corollary]
---

# Cohomological CALM for knowledge presheaves

For a [settling-associated sheaf](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agent-organization-engine/lib/relating/docs/settling-associated-sheaf.md) $\mathcal{F}_U$:

1. **Coordination-freeness.** For every pairwise-Stone cover $\{U_i \to U\}$ in the [bitopological settling site](../../../../bitopological-settling-site/bitopological-settling-site.md), all [Mayer–Vietoris](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/replica-mayer-vietoris.md) connecting homomorphisms $\delta^n : H^n(\cap_j U_j, \mathcal{F}_U) \to H^{n+1}(U, \mathcal{F}_U)$ vanish for $n = 0$.
  Higher-degree vanishing follows from [settling cohomology vanishes above degree 1](settling-cohomology-vanishes-above-degree-1.md).

2. **Vanishing characterizes CALM.** A sheaf $F$ on $\mathbf{T}^*$ represents a *CALM-compatible* knowledge presheaf computation iff all its Mayer–Vietoris $\delta^n$ vanish for $n \geq 0$.

## Proof

(1) is [CRDT convergence via Mayer–Vietoris](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/crdt-convergence-via-mayer-vietoris.md) at $n = 0$; higher-$n$ vanishing is the universal $H^{\geq 2}(\mathbf{T}^*, \mathcal{F}_U) = 0$ applied fiberwise.

(2) is the cohomological content of CALM: [@hellerstein-alvaro2020]'s theorem says coordination-freeness is equivalent to monotonicity, which on the cohomological side is equivalent to all gluing obstructions vanishing — i.e., all $\delta^n$ vanish.
The [settling-as-CRDT corollary](../../../../../../../../../../../../../../../../../../../../../../../../../../../formalization/infomaterial/lib/infomaterial/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/settling-calm-corollary.md) instantiates CALM for knowledge presheaves at the primal level; the present theorem reformulates it at the cohomological level. $\square$

## Reading

CALM-failure for settling-associated sheaves on knowledge presheaves *can only* occur at $\delta^0$ — higher degrees automatically vanish ([settling cohomology vanishes above degree 1](settling-cohomology-vanishes-above-degree-1.md)).
[CRDT convergence via Mayer–Vietoris](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/crdt-convergence-via-mayer-vietoris.md) shows $\delta^0 = 0$ also vanishes for settling-associated sheaves.
Together: settling-associated sheaves on knowledge presheaves are fully CALM-compatible.
The cohomological apparatus identifies the unique degree where CALM-failure could in principle occur, and shows it does not.
