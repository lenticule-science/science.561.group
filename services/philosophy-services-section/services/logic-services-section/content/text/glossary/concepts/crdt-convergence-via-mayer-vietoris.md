---
kind: theorem
status: proved
depends-on: [replica-mayer-vietoris, replica-cover, settling-associated-sheaf, crdt-convergence]
title: CRDT convergence via Mayer–Vietoris
description: Let $\mathcal{F}U$ be the settling-associated sheaf of an knowledge presheaf.
---

# CRDT convergence via Mayer–Vietoris

Let $\mathcal{F}_U$ be the [settling-associated sheaf](../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agent-organization-engine/lib/relating/docs/settling-associated-sheaf.md) of an [knowledge presheaf](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/spatiotemporal-knowledge-presheaf.md). For every [replica cover](replica-cover.md) $(q, \tau, U = U_1 \cup U_2)$, the [Mayer–Vietoris](../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/replica-mayer-vietoris.md) connecting homomorphism

$$\delta^0 \,:\, H^0(U_1 \cap U_2, \mathcal{F}_U) \,\to\, H^1(U, \mathcal{F}_U)$$

is identically zero.

## Proof

By construction, $\mathcal{F}_U(q, \tau, U)$ is the free abelian group on the set $\Delta^{+, *}_\tau(q) \cap U$ of newly-designated points of the dual spectrum within $U$. The decomposition

$$\Delta^{+, *}_\tau(q) \cap (U_1 \cup U_2) \;=\; \bigl(\Delta^{+, *}_\tau(q) \cap U_1\bigr) \cup \bigl(\Delta^{+, *}_\tau(q) \cap U_2\bigr)$$

shows every section on $U_1 \cap U_2$ — supported on points in $\Delta^{+, *}_\tau(q) \cap U_1 \cap U_2$ — extends canonically to $U$ by the "extension by zero" on $\Delta^{+, *}_\tau(q) \cap (U_1 \triangle U_2)$ (symmetric difference). The extension is compatible with restriction to $U_1$ and $U_2$ separately.

Formally: the exact sequence at degree 0 reads

$$0 \to \mathcal{F}_U(U) \xrightarrow{\mathrm{res}} \mathcal{F}_U(U_1) \oplus \mathcal{F}_U(U_2) \xrightarrow{\mathrm{diff}} \mathcal{F}_U(U_1 \cap U_2) \xrightarrow{\delta^0} H^1(U, \mathcal{F}_U).$$

The map $\mathrm{diff}$ is *surjective* on sections of $\mathcal{F}_U$: for every $s \in \mathcal{F}_U(U_1 \cap U_2)$ the preimage under $\mathrm{diff}$ is non-empty (e.g., $s_1 = $ extension by zero outside $U_1 \cap U_2$ to $U_1$, $s_2 = 0$). By exactness, $\delta^0 = 0$. $\square$

## Alternative path via cohomological CALM

[CRDT convergence via cohomological CALM](../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/crdt-convergence-via-cohomological-calm.md) gives a different proof in the strict and Scott-continuous regimes: $\delta^0 = 0$ follows abstractly from $H^1 = 0$ in those regimes, without needing the explicit section-extension construction of this theorem. That path is more conceptual but more limited in scope; this path covers all four regimes via the explicit construction.

## Cohomological restatement of CRDT convergence

For $\mathcal{F}_U$ the settling-associated sheaf of a [distributed settling system](../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/distributed-settling-system.md), every finite family of replicas admits a coordination-free merge: all finite Mayer–Vietoris gluing obstructions vanish. This recovers the [CRDT convergence theorem](crdt-convergence.md) at the cohomological level.

*Proof.* Induction on the number of replicas, using the two-replica vanishing for the base case and standard iterated-cover arguments for larger families. $\square$

## Larger class

The converse — that vanishing Mayer–Vietoris obstructions imply CRDT-style convergence — holds for a slightly larger class of sheaves than just $\mathcal{F}_U$. Any sheaf on $\mathbf{T}^*$ such that $F(q, \tau, U)$ is free on a subset of points of the pairwise-Stone clopen structure of $X_q^\tau$ satisfies the same vanishing — this includes $\mathcal{F}_U$, constant sheaves $\underline{A}$, and finite-coefficient variants.
