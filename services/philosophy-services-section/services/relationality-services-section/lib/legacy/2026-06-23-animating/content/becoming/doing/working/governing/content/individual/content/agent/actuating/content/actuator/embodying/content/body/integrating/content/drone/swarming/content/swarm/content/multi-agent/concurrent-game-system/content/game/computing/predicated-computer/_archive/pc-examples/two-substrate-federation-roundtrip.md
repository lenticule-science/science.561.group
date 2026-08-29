---
type: example
class: federation-walkthrough
depends-on: [federation-convergence, crdt-convergence, signature-binds-witness-to-identity, transport-tolerance-of-federation]
instantiates: [federation-convergence, federation-bridge]
---

# Two-substrate federation roundtrip

A concrete walkthrough of two predicated-computing substrates $S_1$ and $S_2$ federating: each admits writes locally, exchanges them via transport, and converges to byte-identical state per [federation-convergence](../theorems/federation-convergence.md).

## Setup

- $S_1$ deployed on cloud-A, identity-record `s1-prod-east`.
- $S_2$ deployed on cloud-B, identity-record `s2-prod-west`.
- Both run rule-system version `v3.2` (canonical hash `0xabc...def`).
- Both share value-domain $\mathbf{L}^\bowtie = \mathbf{FOUR}$, predicate-category $\mathcal{C}$, entity set $E$.
- Federation graph: bidirectional channel between $S_1$'s outpost and $S_2$'s inbox, and vice versa, over HTTPS transport.

## Trace

**Substrate ordinal $\tau=100$ at $S_1$:** A user admits a new predication $\langle$alice, knows, bob$\rangle = \mathbf{t}$. Per [admit](../morphisms/admit.md), the increment $u_{100}$ is added to $S_1$'s [increment sequence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/increment-sequence.md). Per [step](../morphisms/step.md), $S_1$'s settling advances to $v_{101}$. The witness, signed by `s1-prod-east`, is appended to $S_1$'s event log.

**Substrate ordinal $\tau=42$ at $S_2$ (concurrent):** A user admits $\langle$bob, knows, alice$\rangle = \mathbf{t}$. Same admit/step/witness sequence at $S_2$ produces $v_{43}$.

**Federation transmission $S_1 \to S_2$:** Per [send-message](../morphisms/send-message.md), $S_1$ sends the witness for the admit-at-$\tau=100$ over the federation transport. The bytes are canonical-form-encoded.

**Federation reception at $S_2$:** Per [receive-message](../morphisms/receive-message.md), $S_2$:
1. Verifies the signature against `s1-prod-east`'s identity-record (per [signature-binds-witness-to-identity](../theorems/signature-binds-witness-to-identity.md)).
2. Deduplicates by canonical hash — the witness is new at $S_2$.
3. Admits the witness through $S_2$'s normal admission discipline. The increment from $S_1$ becomes part of $S_2$'s increment sequence at $S_2$'s next ordinal $\tau=44$.

**$S_2$ settles:** Per [settle](../morphisms/settle.md), $S_2$ applies $\mathrm{cl}^{\mathcal{S}}$ to $v_{43} \vee_k u_{S_1}$. Result: $v_{44}$ at $S_2$ now contains both alice→bob and bob→alice predications.

**Symmetric transmission $S_2 \to S_1$:** $S_2$ sends its admit-at-$\tau=42$ witness. $S_1$ verifies, deduplicates, admits. After settle, $S_1$'s $v_{102}$ contains both predications.

## Verification of convergence

Per [crdt-convergence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence.md), the converged state at each substrate is

$$v^\infty(p) = \mathrm{cl}^{\mathcal{S}}_p(\bigvee_k U)$$

where $U = \{u_{S_1}, u_{S_2}\}$. At $S_1$ ordinal $\tau=102$, at $S_2$ ordinal $\tau=44$, both substrates' valuations are byte-identical on the federated content. The canonical-form hash of the relevant region is the same on both sides; per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), this means content equality.

## What's notable

- **No coordinator was involved.** Per [federation-convergence](../theorems/federation-convergence.md), the substrate's algebra (closure-merge commutation) is the protocol.
- **Order didn't matter.** $S_1$ could have received $S_2$'s message before sending its own; the converged state is the same.
- **Per [transport-tolerance-of-federation](../theorems/transport-tolerance-of-federation.md), the HTTPS transport could have been replaced** by NATS, WebSocket, or any conforming transport without affecting convergence.
- **The witness chain is non-repudiable.** Per [signature-binds-witness-to-identity](../theorems/signature-binds-witness-to-identity.md), $S_2$'s audit can attribute the alice→bob assertion to `s1-prod-east`; $S_1$'s audit can attribute the bob→alice assertion to `s2-prod-west`.

## Federation-bridge case

Suppose $S_1$ and $S_2$ ran *different* rule-system versions ($v3.2$ vs $v3.3$). The federation would require a [federation-bridge](../objects/federation-bridge.md) translating between $v3.2$-vocabulary and $v3.3$-vocabulary predications. Per [doctrine-fidelity-compositionality](../theorems/doctrine-fidelity-compositionality.md), the bridge composes with normal federation as long as it's doctrine-fidel on the predications it carries; the converged content reflects the bridge's translation.
