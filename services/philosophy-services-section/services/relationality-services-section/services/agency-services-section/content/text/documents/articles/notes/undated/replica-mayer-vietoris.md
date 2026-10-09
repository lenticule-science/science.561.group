---
kind: theorem
status: proved
depends-on: [replica-cover, settling-cohomology, kz-coherent-sheaf, sheaf-functoriality-on-bitopological-site]
title: Replica Mayer–Vietoris sequence
description: Let $(q, \tau, U)$ with $U = U1 \cup U2$ be a replica cover and $F \in \mathrm{Sh}^{\mathrm{KZ}}(\mathbf{T}^, J)$ any KZ-coherent sheaf.
---

# Replica Mayer–Vietoris sequence

Let $(q, \tau, U)$ with $U = U_1 \cup U_2$ be a [replica cover](../../../../../../../../../logic-services-section/content/text/glossary/concepts/replica-cover.md) and $F \in \mathrm{Sh}^{\mathrm{KZ}}(\mathbf{T}^*, J)$ any [KZ-coherent sheaf](../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/kz-coherent-sheaf/kz-coherent-sheaf.md).
There is a long exact sequence

$$\cdots \to H^{n-1}(U_1 \cap U_2, F) \xrightarrow{\delta^{n-1}} H^n(U, F) \xrightarrow{\mathrm{res}} H^n(U_1, F) \oplus H^n(U_2, F) \xrightarrow{\mathrm{diff}} H^n(U_1 \cap U_2, F) \xrightarrow{\delta^n} \cdots$$

where $H^n(U_i, F)$ abbreviates the [settling cohomology](../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/settling-cohomology.md) restricted to the sub-site $\mathbf{T}^*_{\mathrm{site}} / (q, \tau, U_i)$, $\mathrm{res}$ is the pair of restrictions, $\mathrm{diff}(s_1, s_2) := s_1|_{U_1 \cap U_2} - s_2|_{U_1 \cap U_2}$, and $\delta^n$ is the connecting homomorphism.

## Proof

The short exact sequence of presheaves

$$0 \to F|_U \to F|_{U_1} \oplus F|_{U_2} \to F|_{U_1 \cap U_2} \to 0$$

sheafifies to a short exact sequence of sheaves: the sheafification functor is exact on abelian presheaves.
Applying the derived global-sections functor and using its long-exact-sequence property yields the Mayer–Vietoris sequence.
KZ-coherence passes through because all three sheaves are KZ-coherent. $\square$

## The first connecting homomorphism

The map $\delta^0 : H^0(U_1 \cap U_2, F) \to H^1(U, F)$ sends a section $s \in F(U_1 \cap U_2)$ to the Čech 1-cocycle $\{s$ on $U_1 \cap U_2$, $0$ on $U_1, U_2\}$.
Vanishing of $\delta^0(s)$ means $s$ extends to a global section on $U = U_1 \cup U_2$.

## Two readings

- *As an obstruction sequence.* $H^1(U, F)$ contains obstructions to gluing local sections.
  A non-zero $\delta^0(s) \neq 0$ says that $s$ — viewed as data on the overlap of two replicas — cannot be extended to a coherent global section on their merge.
- *As a coordination cost.* $H^1(U, F)$ measures the coordination needed to synthesize a global section.
  Zero $H^1$ means coordination-free merge; non-zero $H^1$ means some form of consensus is required.

The next theorem shows $\delta^0 = 0$ for the [settling-associated sheaf](../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agent-organization-engine/lib/relating/docs/settling-associated-sheaf.md) — the [CRDT convergence via Mayer–Vietoris](../../../../../../../../../logic-services-section/content/text/glossary/concepts/crdt-convergence-via-mayer-vietoris.md).
