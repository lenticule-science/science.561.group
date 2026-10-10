---
type: concept
class: security-discipline
depends-on: [trust-boundary, predicated-arena, federation-bridge, transport, bilattice-accessibility-relation, modal-necessity-operator, world-set]
see-also: [threat-model, audit-content-via-inconsistency-sheaf-cohomology]
---

# Attack surface

The *substrate's externally-reachable inputs*: every place where adversarial content can enter the substrate. In the substrate's hyperdoctrine setting, the attack surface is not just a list of endpoints — it is *the boundary edges of the substrate's [bilattice accessibility relation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md)* $R$, the cells $R(w_\mathrm{ex}, w_\mathrm{in})$ where adversarial worlds $w_\mathrm{ex}$ can attempt to influence the substrate's interior $w_\mathrm{in}$. Per [trust-boundary-modal-validity](../theorems/trust-boundary-modal-validity.md), each such cell is structurally enforced: an adversarial input crosses only when the [modal necessity operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md) $\Box_R$ admits it. The attack surface is the set of accessibility cells the adversary can target.

The attack surface is the set of substrate operations that admit content from outside a [trust boundary](trust-boundary.md), and it is what the substrate's security discipline must protect.

## Hyperdoctrinal framing

Per [trust-boundary](trust-boundary.md), a trust boundary is a cut in the bilattice accessibility relation $R: W \times W \to \mathbf{L}^\bowtie$ between interior $W_\mathrm{in}$ and exterior $W_\mathrm{ex}$ worlds. The attack surface is then:

$$\mathrm{AttackSurface} \;=\; \{R(w_\mathrm{ex}, w_\mathrm{in}) : w_\mathrm{ex} \in W_\mathrm{ex}, w_\mathrm{in} \in W_\mathrm{in}, R(w_\mathrm{ex}, w_\mathrm{in}) \neq \mathbf{f}\}$$

— the accessibility cells where the substrate has *not* explicitly denied admission ($\mathbf{f}$ would mean "told-not-admitted"). Per [trust-boundary-modal-validity](../theorems/trust-boundary-modal-validity.md), an adversary attempting to inject content via $w_\mathrm{ex}$ produces a $\Box_R$ value at the destination; the substrate admits only when the value is non-$\bot$ (truth-positive).

Per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md), the accessibility relation is bilattice-graded — the substrate distinguishes:

- $\mathbf{t}$-trust accessibility cells (admitted peers): well-defended attack surface, but still a surface.
- $\bot$-trust cells (uninformed): the *largest* attack surface, since the substrate has no admission decision recorded.
- $\top$-trust cells (contested): governance-attention attack surface — adversaries can exploit the unreconciled state.

The substrate's defensive discipline reduces to constraining and monitoring these accessibility cells.

## A substrate's attack surface includes

- **The predicated-arena's input ports.** Per [predicated-arena](../objects/predicated-arena.md), the substrate's input vocabulary is its public contract. Every port-typed message kind is a potential attack vector; the substrate's [admit](../morphisms/admit.md) discipline must verify and validate each incoming message. Each port is an accessibility cell from "external sender" to "interior queue."
- **Federation peer connections.** Per [transport-record](../objects/transport-record.md), each transport from which incoming messages arrive is part of the attack surface. Compromised peers, network MITM attacks, replay attacks all target the federation transport layer. Per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md), each peer corresponds to an accessibility cell whose grade reflects the substrate's trust level.
- **Identity-key custody endpoints.** Per [identity-record](../objects/identity-record.md), the substrate's signing keys live at the host. Compromise of the host's identity-key custody (cloud KMS leak, hardware-token theft) is a substrate-level attack: the attacker can sign forged witnesses, effectively *creating* new accessibility cells the substrate would treat as $\mathbf{t}$-trust.
- **Backup and snapshot transport.** Per [backup-discipline](backup-discipline.md), backup bytes are stored off-site. The off-site storage location is part of the attack surface; an adversary controlling backup storage can tamper with backup contents, deny restoration, or perform replay attacks with old backups. Per [backup-as-cohomology-preservation](../theorems/backup-as-cohomology-preservation.md), tampering would be detectable by cohomology comparison — but only if the substrate runs the comparison.
- **Deployment-target host environment.** Per [deployment-record](../objects/deployment-record.md), the substrate runs on a host. The host's OS, container runtime, network stack are part of the attack surface; compromise at the host level is substrate-affecting — the host can manipulate the substrate's read-side accessibility, even if cryptographic content discipline holds.

## Attack surface is enumerable

The attack surface is *enumerable*: the substrate's [self-representation](self-representation.md) discipline means every input port, every transport, every identity-record is substrate content. An auditor can query the substrate to enumerate its attack surface. Per [observability-as-reads](../theorems/observability-as-reads.md), the enumeration is a free read.

Per [audit-content-via-inconsistency-sheaf-cohomology](../theorems/audit-content-via-inconsistency-sheaf-cohomology.md), the substrate's audit discipline can detect attack-surface exploitation cohomologically: $\top$-cells in the [inconsistency sheaf](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/inconsistency-sheaf.md) reveal where adversarial inputs have introduced contradictions; the cohomology classes record the structural footprint of attempted attacks.

## The substrate's defensive discipline

- **Signature-verify everything crossing trust boundaries.** Per [signature-binds-witness-to-identity](../theorems/signature-binds-witness-to-identity.md), federated content without valid signature is rejected at the boundary — the accessibility cell is forced to $\mathbf{f}$ for unsigned content.
- **Encrypt content from untrusted intermediaries.** Per [encryption](encryption.md), content sent through brokers, proxies, or untrusted networks is encrypted at the substrate layer. Per [encryption-as-visibility-restriction-via-invisible-automorphism](../theorems/encryption-as-visibility-restriction-via-invisible-automorphism.md), encrypted content is in the invisible part of the substrate's structure for non-recipient intermediaries — they can route but not exploit it.
- **Admit identity-records and federation-bridges only via governance.** Per [governance-decision-modal-decidability](../theorems/governance-decision-modal-decidability.md), admitting a new federation peer or a new identity-record is a decidable modal operation — not an automatic admission. The substrate refuses to widen its attack surface without explicit governance authorization.
- **Audit suspicious witnesses.** Per [trace-causality-via-mayer-vietoris-spans](../theorems/trace-causality-via-mayer-vietoris-spans.md), the substrate's observability surface enables anomaly detection — repeated signature failures, unusual federation traffic patterns, attempts to read encrypted content without recipient access. Per [audit-content-via-inconsistency-sheaf-cohomology](../theorems/audit-content-via-inconsistency-sheaf-cohomology.md), cohomological audit detects structural anomalies missed by per-event inspection.

## Position

The attack surface composes with [trust-boundary](trust-boundary.md) (the boundaries the surface defends — accessibility cuts the surface widens or narrows), with [threat-model](../objects/threat-model.md) (the documented adversaries the surface is protected against — which $w_\mathrm{ex}$ worlds the substrate considers hostile), and with [conformance](conformance.md) (security-property conformance tests that exercise the surface's defenses — verifying the substrate's $\Box_R$ enforcement on test inputs).

Per the modal-validity grounding, the substrate's attack-surface management is structurally *bounded by the size of $R$ that the substrate's interior accepts as $\bot$-or-better*. A substrate that exposes a small $R$-surface (few external worlds with non-$\mathbf{f}$ accessibility) has a small attack surface; one that broadly accepts external connections has a correspondingly larger surface. Reducing attack surface is structurally narrowing the accessibility relation.
