---
type: theorem
class: engineering-claim
status: sketch
depends-on: [federation, federation-handshake, federation-bridge, federation-graph, outpost, inbox, replica-cover, replica-mayer-vietoris, settling-associated-sheaf, q-fuzzy-equivalence, quantale-enriched-sheaf]
see-also: [federation-convergence, federation-trust-bilattice-graded, cycle-holonomy-as-federation-disagreement, agent-community-consensus, heartbeat-quiescence-as-cohomological-calm]
title: Federation handshake is a Mayer–Vietoris gluing on a replica cover
description: Claim.
---

# Federation handshake is a Mayer–Vietoris gluing on a replica cover

**Claim.** A [federation-handshake](../federation-handshake.md) between an [outpost](teaching/explanations/outpost.md) on platform $A$ and an [inbox](teaching/explanations/inbox.md) on platform $B$ is structurally a [replica-cover](../../../../../../../../../../../../../logic-services-section/content/text/glossary/concepts/replica-cover.md) $U = U_A \cup U_B$ on the [federation-graph](../../federation-graph/federation-graph.md)'s underlying multi-observer site, where the overlap $U_A \cap U_B$ is the bridge-translation sub-region declared by the [federation-bridge](../../federation-bridge/federation-bridge.md).
The handshake **succeeds** — produces a coherent routing predication admissible to both sides — iff the [Mayer–Vietoris connecting homomorphism](../../../../../../notes/undated/replica-mayer-vietoris.md)

$$\delta^0 : H^0(U_A \cap U_B, \mathcal{F}_U) \to H^1(U, \mathcal{F}_U)$$

vanishes on the candidate-routing section $s_{\mathrm{route}} \in H^0(U_A \cap U_B, \mathcal{F}_U)$.
When $\delta^0(s_{\mathrm{route}}) \neq 0$, the cocycle is the substrate-canonical, federation-portable witness of bridge-translation incompatibility: it identifies precisely which routing predication the two sides cannot reconcile.

## Why this holds

The argument identifies the three handshake stages with the three components of the Mayer–Vietoris construction.

**Part 1: The handshake site is a replica cover.** Per [federation-graph](../../federation-graph/federation-graph.md), the federation graph is a [quantale-enriched sheaf](../../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/bitopological-settling-site/content/quantale-enriched-sheaf/quantale-enriched-sheaf.md) on the federation's underlying multi-observer site.
The handshake instantiates a two-element cover: $U_A$ is the local platform's sub-region exposed by the outpost's routing-predication scope, $U_B$ is the remote platform's sub-region admitted by the inbox's acceptance-predication scope, and $U = U_A \cup U_B$ is the federated sub-region the handshake creates.

The overlap $U_A \cap U_B$ is exactly the [federation-bridge](../../federation-bridge/federation-bridge.md) entity's translation sub-region: the canonical-form translations admissible at the boundary, signed by an authority both platforms recognize.
By construction, $U_A \cap U_B$ is non-empty iff a bridge entity exists; it equals the strict equivalence sub-region when both platforms run the same closure-rule-system version, and it equals a [q-fuzzy-equivalence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/q-fuzzy-equivalence.md) sub-region when the bridge is admissible-but-lossy.

**Part 2: The candidate routing predication is an overlap section.** During handshake stage 1 (identity exchange) and stage 2 (version agreement), the two sides accumulate a section $s_{\mathrm{route}} \in H^0(U_A \cap U_B, \mathcal{F}_U)$ on the bridge sub-region — the joint declaration of "this outpost routes to this inbox under these bridge-translated predications."
Per [federation-trust-bilattice-graded](../../../theorems/federation-trust-bilattice-graded.md), this section is bilattice-valued, not Boolean: partial-trust handshakes produce $\mathbf{t}$- or $\bot$-valued sections, fully-mutually-distrusted handshakes produce $\mathbf{f}$-valued sections that the inbox refuses to admit before $\delta^0$ is even computed.

**Part 3: Handshake success is exactly $\delta^0(s_{\mathrm{route}}) = 0$.** By the construction of the [Mayer–Vietoris sequence](../../../../../../notes/undated/replica-mayer-vietoris.md), $\delta^0(s_{\mathrm{route}}) = 0$ iff $s_{\mathrm{route}}$ extends to a global section $\tilde s \in H^0(U, \mathcal{F}_U)$ — equivalently, iff there exist routing predications $r_A$ on $U_A$ and $r_B$ on $U_B$ that restrict to $s_{\mathrm{route}}$ on the bridge overlap.
Stage 3 of the handshake (routing-predication emission) is exactly the instantiation of $r_A, r_B$.

When $\delta^0(s_{\mathrm{route}}) \neq 0$, no such $r_A, r_B$ exist as a coherent pair: any local extension on $U_A$ produces a translated form on the overlap that the remote-side extension on $U_B$ contradicts.
The handshake stage-3 emission fails on at least one side, and the failure is replayable: the same bridge, same outpost-inbox pair, same closure-rule-system versions, will always produce the same non-vanishing $\delta^0$. $\square$

## Engineering consequence

The platform's role in federation establishment is **substrate-cohomological, not protocol-engineering**.
Several engineering consequences:

- **Handshake failure is a cohomology class, not a network exception.** A failed handshake produces a cocycle $\delta^0(s_{\mathrm{route}})$ in $H^1(U, \mathcal{F}_U)$ — a substrate-recorded, federation-portable, byte-identifiable obstruction.
  Two diagnostic operators sitting on opposite sides of the federation see the *same* cocycle.
  The traditional "handshake failed: timeout / version mismatch / signature invalid" error-string is replaced by a structural witness the audit can act on.

- **Bridge admissibility is decidable from bridge content alone.** Given a [federation-bridge](../../federation-bridge/federation-bridge.md) entity and a candidate routing predication, the platform can compute $\delta^0(s_{\mathrm{route}})$ from the bridge's translation predications and the outpost-inbox sub-region restrictions — no live network round-trip is required for the cohomological pre-check.
  A platform can offer "dry-run handshake" as a cost-discipline-reads-free operation per [cost-discipline-reads-free](../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/cost-discipline-reads-free.md).

- **q-fuzzy bridges expose graded handshake.** When the bridge is a q-fuzzy-equivalence (admissible but lossy), $H^0(U_A \cap U_B, \mathcal{F}_U)$ is q-graded.
  The handshake's success is graded by the same quantale: per [federation-path-metrics-multiplicative](../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-path-metrics-multiplicative.md), the handshake's grade is the bridge-translation grade, which composes multiplicatively with downstream multi-hop edges.
  Lossy handshakes are first-class, not exceptions.

- **Cycle-holonomy disagreement is the long-exact-sequence shadow.** Per [cycle-holonomy-as-federation-disagreement](../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/cycle-holonomy-as-federation-disagreement.md), traversing a cycle in the federation graph and finding non-identity round-trip composition is a structural disagreement.
  The present theorem identifies this as the $H^1$-content of the federation-graph's settling-associated sheaf as built from successive Mayer–Vietoris gluings: each handshake contributes its $\delta^0$-image, and a cycle's holonomy is the alternating sum of the glued $\delta^0$-images along the cycle.

## What the theorem rules out

- A handshake protocol that treats version mismatch as a generic "incompatible" error, without producing the cocycle, is forfeiting the substrate's audit content.
  Such a protocol cannot tell two distinct incompatibilities apart; cohomologically distinct $\delta^0$-classes are collapsed to a single error string.

- A federation-bridge entity that is not signed by an authority both platforms recognize produces an *unauthorized* overlap, and the handshake cannot read $s_{\mathrm{route}}$ as a section on $U_A \cap U_B$ — the bridge fails before the cohomological computation begins.
  Per [trust-boundary-modal-validity](../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/trust-boundary-modal-validity.md), bridge admissibility is a prerequisite, not a consequence, of the cohomological gluing.

- A handshake that produces $r_A, r_B$ that don't restrict to the same $s_{\mathrm{route}}$ on the bridge overlap (e.g., the two sides emitted independently without bridge-mediated agreement) does not satisfy the theorem's hypotheses.
  Such "implicit" federation is not a Mayer–Vietoris gluing; the federation it constructs is not [federation-convergence](../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md)-guaranteed.

## What the theorem requires

- The federation site is the multi-observer-system / quantale-enriched-sheaf site of [federation-graph](../../federation-graph/federation-graph.md).
- The federation-bridge entity is signed by an authority both platforms recognize and declares the canonical-form translation between the two version-vocabularies.
- The settling-associated sheaf $\mathcal{F}_U$ on the federation site is [KZ-coherent](../../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/kz-coherent-sheaf/kz-coherent-sheaf.md) — the structural hypothesis of the [Mayer–Vietoris theorem](../../../../../../notes/undated/replica-mayer-vietoris.md).
- For non-strict bridge translations, the substrate exposes the quantale grading; the handshake's success grade is the q-grade of $s_{\mathrm{route}}$.
