---
type: theorem
class: engineering-claim
status: proved
depends-on: [agent-self-queueing-bounded-by-modal-restriction, interfacer-counit-law-uniformity, modal-restriction-as-substrate-authorization-primitive, modal-necessity-operator, modal-necessity-basic-properties, signature-binds-witness-to-identity, governance-decision-modal-decidability, federation-trust-bilattice-graded]
see-also: [authentication-as-modal-restriction, capability-non-amplification]
---

# SDK import composition is non-amplifying via modal-restriction composition

**Claim.** Let an SDK consumer-app $C$ import an SDK library-app $L$ at substrate-import-time. Let $u_C$ be $C$'s capability and $u_L$ be $L$'s capability, and let $R_{\mathrm{SDK}}$ be the SDK's accessibility relation — the substrate-admitted import-time restriction declared by the SDK manifest. Then the effective capability of $C$ when invoking $L$ is

$$u_{C \cdot L} \;=\; \Box_{R_{\mathrm{SDK}}} u_L \;\leq_k\; u_L$$

and, when $C$ further imports another SDK $L'$ with restriction $R'$,

$$\Box_{R'} \Box_{R_{\mathrm{SDK}}} u \;\leq_k\; \Box_{R_{\mathrm{SDK}}} u \;\leq_k\; u.$$

The SDK import chain is structurally non-amplifying — composing SDK boundaries cannot grant the importer more authority than any link in the chain.

## Why this holds

Per [agent-self-queueing-bounded-by-modal-restriction](agent-self-queueing-bounded-by-modal-restriction.md), an agent's session capability is the modal restriction $\Box_R u_a$ along the session's accessibility cell. Per [interfacer-counit-law-uniformity](interfacer-counit-law-uniformity.md), every substrate boundary — frontend, federation envelope, encryption, SDK import — implements the same counit law: a transformation $\eta : F \dashv G$ whose counit collapses any boundary-side enrichment back to the substrate-admitted core.

The SDK import boundary is one such boundary, with accessibility relation $R_{\mathrm{SDK}}$ recorded in the SDK manifest as substrate content (per the substrate's manifest-as-cell discipline). Per [modal-restriction-as-substrate-authorization-primitive](modal-restriction-as-substrate-authorization-primitive.md), every authorization boundary the substrate admits is a modal restriction; SDK import is no exception.

The proof composes three established results:

1. **Single-boundary non-amplification.** Per [modal-necessity-basic-properties](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/modal-necessity-basic-properties.md), $\Box_R$ preserves the truth-meet $\wedge_t$, preserves $\mathbf{t}$, and is monotone in its input. On a non-trivial accessibility, $\Box_R u$ is at most $u$ in the knowledge-order $\leq_k$ — the modal restriction never amplifies.
2. **Boundary-uniform counit.** Per [interfacer-counit-law-uniformity](interfacer-counit-law-uniformity.md), the counit law applied at the SDK boundary is structurally identical to the counit law applied at any other boundary. The check the substrate runs at SDK import is the same check it runs at frontend session establishment, federation envelope reception, and encryption-layer decryption — only the accessibility relation changes.
3. **Composition of modal necessities.** For any pair of accessibility relations $R_1, R_2$, the composition $\Box_{R_2} \Box_{R_1}$ is a modal necessity for the relation $R_2 \circ R_1$ (the relational composition restricting accessibility through both boundaries). Per (1) applied to $\Box_{R_2 \circ R_1}$, the composition is also non-amplifying.

When SDK $C$ imports SDK $L$, the importer-of-importer chain $C \to L \to L'$ produces effective capability $\Box_{R_2} \Box_{R_1} u$, which is at most $\Box_{R_1} u$, which is at most $u$. The chain is structurally non-amplifying at every depth.

Per [governance-decision-modal-decidability](governance-decision-modal-decidability.md), the bound is computable in PSPACE — the substrate can perform the check at every SDK import without unbounded delay.

## Engineering consequence

- **No SDK-specific capability theorem needed.** The v0.6 SDK boundary's non-amplification is the existing modal-restriction discipline applied with the SDK manifest's accessibility relation. No new substrate verb, no new authorization check, no new audit-chain entry kind.
- **Manifest is authoritative.** Per [signature-binds-witness-to-identity](signature-binds-witness-to-identity.md), the SDK manifest is signed by the SDK author. The manifest's declared accessibility relation determines $R_{\mathrm{SDK}}$; the substrate's bound applies regardless of the SDK code's internal logic.
- **Multi-SDK composition is bounded.** A consumer importing SDK $A$ which itself imports SDK $B$ has effective capability $\Box_{R_A} \Box_{R_B} u_C \leq_k \min(u_C, u_A, u_B)$ in $\leq_k$. Deep import chains cannot escalate; the substrate's bound applies at every link.
- **Capability auditing is per-link.** The audit chain records the modal restriction at each import boundary; an auditor can replay any chain and verify the bound at every step.
- **SDK boundary is not a special case.** Per the boundary-uniform counit, the substrate's existing checks for authentication, federation, and frontend session apply unchanged at the SDK boundary. The substrate's runtime does not need a separate SDK-import code path.

## Federation consequence

Per [federation-trust-bilattice-graded](federation-trust-bilattice-graded.md), cross-substrate capability composes via the federation graph's quantale. When an SDK is imported by a consumer in a federated peer's substrate, the effective capability is $\Box_{R_{\mathrm{federation}}} \Box_{R_{\mathrm{SDK}}} u$, with the federation accessibility further restricting per the trust grade. Per the same composition argument, the chain is non-amplifying across federation; cross-substrate SDK import cannot escalate.

## What the theorem rules out

- **SDK that grants its consumer more authority than the consumer holds.** Per the theorem, $\Box_R u_C \leq_k u_C$. An SDK whose import allegedly amplifies the consumer's capability is non-conformant — either the manifest's $R_{\mathrm{SDK}}$ is mis-declared, or the substrate's modal-necessity implementation is broken.
- **Transitive SDK chains escaping their root's capability.** Per the recursive composition, every link in an SDK chain is non-amplifying. A consumer cannot import a chain of SDKs to escalate beyond the chain's most-restrictive link.
- **SDK boundary that bypasses the bounded-autonomy check.** Per [signature-binds-witness-to-identity](signature-binds-witness-to-identity.md), unsigned SDK imports are rejected; per the theorem, signed imports are checked against the manifest's accessibility relation. There is no admissible bypass.
- **Special-case SDK authorization logic in the substrate.** Per [interfacer-counit-law-uniformity](interfacer-counit-law-uniformity.md), the SDK boundary uses the same boundary-counit law as every other substrate boundary. A substrate that adds SDK-specific authorization code is implementing a special case the theorem says is unnecessary.

## What the theorem requires

- The SDK's accessibility relation $R_{\mathrm{SDK}}$ is declared in a substrate-content manifest (signed per [signature-binds-witness-to-identity](signature-binds-witness-to-identity.md)).
- The substrate implements modal necessity per [modal-necessity-operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md).
- The substrate's boundary checks satisfy the counit law uniformly per [interfacer-counit-law-uniformity](interfacer-counit-law-uniformity.md).
- Modal-necessity composition $\Box_{R_2} \Box_{R_1} = \Box_{R_2 \circ R_1}$ holds — guaranteed structurally in the bilattice modal calculus.

## Position

This theorem extends [agent-self-queueing-bounded-by-modal-restriction](agent-self-queueing-bounded-by-modal-restriction.md) from the agent surface to the SDK import surface, by composition with [interfacer-counit-law-uniformity](interfacer-counit-law-uniformity.md). It discharges the v0.6 SDK platform's deep-horizon question (round-6 §3.4 of the dev docs): the SDK boundary needs no new theorem, only the existing modal-restriction discipline applied with the SDK manifest's accessibility relation.

Together with [authentication-as-modal-restriction](theories/interactive-application-platform/theorems/authentication-as-modal-restriction.md) (user-session capability), [agent-self-queueing-bounded-by-modal-restriction](agent-self-queueing-bounded-by-modal-restriction.md) (agent-session capability), and [federation-trust-bilattice-graded](federation-trust-bilattice-graded.md) (cross-substrate capability), this theorem completes the substrate's authorization-discipline coverage: every boundary the substrate admits is a modal restriction; every chain of boundaries is non-amplifying; the bound is structural and decidable.
