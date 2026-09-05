---
type: concept
class: security-discipline
depends-on: [identity-key, signature, encryption, federation-bridge, modal-necessity-operator, bilattice-accessibility-relation, world-set, predication-fiber-algebra]
see-also: [attack-surface, threat-model, trust-boundary-modal-validity, federation-trust-bilattice-graded, governance-as-modal-restriction]
---

# Trust boundary

A *substrate-recorded demarcation* between regions of differing trust. In the substrate's hyperdoctrine setting, a trust boundary is not a fence around opaque "trusted code" — it is the *cut in the [bilattice accessibility relation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md)* between two sub-regions of the [world set](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/world-set.md). What admits a content-cell across the cut is exactly the substrate's [modal necessity operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md) $\Box_R$ evaluating to a non-$\bot$ value at the destination world.

## Hyperdoctrinal structure

A trust boundary has the structure:

- **A world set $W$ partitioned into interior $W_\mathrm{in}$ and exterior $W_\mathrm{ex}$.** Each world is a (substrate-instance, scope, governance-context) triple per [governance-as-modal-restriction](theories/agential-orchestration-platform/theorems/governance-as-modal-restriction.md).
- **A bilattice accessibility relation $R: W \times W \to \mathbf{L}^\bowtie$** valued in the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md). $R(w_\mathrm{ex}, w_\mathrm{in})$ records the bilattice-graded admissibility of crossing into $w_\mathrm{in}$ from $w_\mathrm{ex}$.
- **A crossing rule.** A content-cell $u$ originating at $w_\mathrm{ex}$ contributes to the interior valuation only as $(\Box_R u)_{w_\mathrm{in}} = \bigwedge_t \{R(w_\mathrm{ex}, w_\mathrm{in}) \to u_{w_\mathrm{ex}}\}$. The substrate admits the cell exactly when the $\Box_R$ value is non-$\bot$ in the cells the interior reads.

Per [trust-boundary-modal-validity](../theorems/trust-boundary-modal-validity.md), this $\Box_R$-mediated crossing is the substrate's structural enforcement: a cell can only enter the interior at the bilattice-grade the accessibility relation admits, and *no enforcement layer can be spoofed* without forging the underlying accessibility predications themselves.

## Why bilattice-graded, not Boolean

A Boolean trust boundary admits two states: in or out, allowed or denied. A real federated substrate's trust state has at least four distinguishable values per (source, target, predicate) triple:

- $\mathbf{t}$ — *told true*: source is verified-admissible for this predicate (signature-verified peer with explicit grant)
- $\mathbf{f}$ — *told false*: source is verified-inadmissible (e.g., explicitly revoked peer)
- $\bot$ — *uninformed*: source is unknown; no admission decision has been recorded
- $\top$ — *told both*: source has conflicting admission records (e.g., one operator granted, another revoked, governance hasn't reconciled)

Per [governance-as-modal-restriction](theories/agential-orchestration-platform/theorems/governance-as-modal-restriction.md), governance graphs record authority as bilattice predications; trust boundaries inherit the same value-domain. A Boolean boundary collapses $\bot$ into $\mathbf{f}$ (closed-world: anyone unknown is denied) or into $\mathbf{t}$ (open-world: anyone unknown is allowed) — both lose information the substrate had.

## Common trust boundaries the substrate manages

Each is a particular accessibility-relation shape on the substrate's world set:

- **Substrate-instance boundary.** $W_\mathrm{in}$ = worlds inside this deployment; $R$ is $\mathbf{t}$ on within-deployment edges, $\bot$ on cross-deployment edges before federation handshake, evolves to $\mathbf{t}$ on edges after a verified handshake. Per [signature-binds-witness-to-identity](../theorems/signature-binds-witness-to-identity.md), the handshake is what advances $R$ from $\bot$ to $\mathbf{t}$.
- **Federation-trust boundary.** $W_\mathrm{in}$ = worlds whose governance contexts are admitted by this substrate; $R$'s shape is exactly the [federation-graph](theories/agential-orchestration-platform/concepts/federation-graph.md). Per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md), the federation's trust admits values across the full bilattice.
- **Agent-authorization boundary.** $W_\mathrm{in}$ = governance contexts in which this agent's capability is non-$\bot$; $R$ is the agent's modal-restriction graph per [governance-as-modal-restriction](theories/agential-orchestration-platform/theorems/governance-as-modal-restriction.md). Crossing is exactly the modal validity check.
- **Encryption-recipient boundary.** $W_\mathrm{in}$ = worlds whose substrate-instance holds a recipient identity-key for the cell's encryption; $R(w_\mathrm{ex}, w_\mathrm{in}) = \mathbf{t}$ exactly when $w_\mathrm{in}$'s identity-key is in the cell's recipient list. Decryption is admission via $\Box_R$.

## Engineering consequence

- **Boundary checks are substrate computations, not external middleware.** Per [self-representation](self-representation.md), $R$ is substrate content; per [trust-boundary-modal-validity](../theorems/trust-boundary-modal-validity.md), each crossing is a $\Box_R$ traversal — no separate "auth service" is needed.
- **Auditable.** Per [witness](../objects/witness.md), each $\Box_R$ evaluation produces a witness recording which accessibility cells were consulted and what value they yielded.
- **Federation-stable.** Per [governance-decision-modal-decidability](../theorems/governance-decision-modal-decidability.md), the modal calculus has the finite model property and is decidable — federation operators can run the same boundary check at any peer and reach the same result.
- **Bilattice-graded means contestable.** A $\top$ accessibility cell — two operators recorded conflicting admission decisions — is not a crash. It is a substrate signal that governance must reconcile, surfaced (per [repair](repair.md)) as a contradiction needing resolution.

## What the discipline rules out

- **Ambient trust.** A trust boundary that is "implicit" — code on the inside is trusted because it's on the inside — is not substrate-recorded. The substrate refuses to enforce a boundary whose accessibility relation is not represented as content. (Compare [capability-passing](theories/functional-runtime-platform/concepts/capability-passing.md): no ambient capability either.)
- **Boolean-only boundaries on federated substrates.** Per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md), federations whose trust state is Boolean cannot represent the partial-trust states that arise during peer admission, peer dispute, or split-brain governance.
- **Non-decidable boundary checks.** Per [governance-decision-modal-decidability](../theorems/governance-decision-modal-decidability.md), every boundary check terminates. A boundary whose admission rule does not terminate (ambient evaluation that may loop) is not admissible; it must be lifted into the modal calculus.
