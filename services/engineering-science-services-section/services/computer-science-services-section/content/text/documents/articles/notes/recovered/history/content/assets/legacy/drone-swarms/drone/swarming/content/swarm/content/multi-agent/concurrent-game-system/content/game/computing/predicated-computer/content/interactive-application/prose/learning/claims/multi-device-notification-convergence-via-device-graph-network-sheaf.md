---
type: theorem
class: engineering-claim
status: proved
depends-on:
  - notification
  - notification-record
  - send-notification
  - federation-convergence
  - bilattice-network-sheaf-consensus
  - multi-observer-system
  - collaborative-edit-convergence
see-also:
  - notification-as-modal-possibility-claim
  - account-uniqueness-and-attribution
  - authentication-as-modal-restriction
---

# A user's notification state across multiple devices converges as the bilattice network-sheaf consensus on the user's device-graph

**Claim.** Let $a$ be an [account](teaching/explanations/account.md) with active sessions on devices $D_a = \{d_1, \ldots, d_n\}$ (per [authentication-as-modal-restriction](authentication-as-modal-restriction.md), each device-session is a $\Box_R$ restriction of $a$'s capability fiber). Let $\nu$ be a [notification-record](../objects/notification-record.md) with `recipient = a`. The per-device read/dismissed state of $\nu$ across $D_a$ converges to a single bilattice value at each lifecycle cell exactly as the [bilattice network-sheaf consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md) on the user's device-graph $G_{D_a}$.

Equivalently: the substrate's correct multi-device notification discipline is to treat $D_a$ as a [multi-observer system](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/multi-observer-system.md), where each device is one observer of $\nu$'s lifecycle cells (`delivered`, `read`, `acted-upon`, `dismissed`), and convergence is the d-frame consensus on $G_{D_a}$. Per-notification dismiss-policy then selects which restrictions of that consensus the device displays, but the consensus itself is structural.

This resolves [multi-device-notification-convergence](questions/multi-device-notification-convergence.md): the four behaviors enumerated there are not four independent disciplines but four projections of a single underlying network-sheaf consensus, distinguished only by the per-notification policy field selecting which projection a given device reads.

## Why this holds

**Setup.** Each device $d_i \in D_a$ runs a substrate-replica per [federation-convergence](../../../theorems/federation-convergence.md). The user-account $a$'s notification state is one fiber over the device-graph $G_{D_a} = (D_a, E_{D_a})$, with vertices the potential devices and edges the substrate-mediated channels between them (typically all-to-all via the user's home-substrate but in general any connected federation graph).

For each notification $\nu$, each device $d_i$ holds a settling $V_{d_i}(\nu)$ — the device-local state of $\nu$'s lifecycle cells. This makes $V_{G_{D_a}}(\nu) : \hat G_{D_a} \to \mathrm{Settlings}_B$ a multi-observer system in the sense of the [multi-observer system object](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/multi-observer-system.md): one observer per device, with channel-restrictions the federation morphisms between device-replicas.

**The lifecycle cells are bilattice-valued.** Per [notification-record](../objects/notification-record.md), each lifecycle cell (`delivered`, `read`, `dismissed`, `acted-upon`) is a substrate predication. Different devices may hold these at different bilattice values: e.g., device $d_1$ has just read $\nu$ ($\mathrm{read} = \mathbf{t}$) while $d_2$ has not yet received the read-event ($\mathrm{read} = \bot$). The d-frame at each device's stalk is the d-frame of that device's local notification-fiber.

**Direct application.** [Bilattice network-sheaf consensus on agent graphs](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md) applies verbatim: the device graph $G_{D_a}$ is the agent graph $G$, the per-device notification settlings are the multi-observer system, the d-frame-valued network sheaf $\mathbb F_{V_{G_{D_a}}}$ on $\hat G_{D_a}$ has stalks the per-device d-frames and restrictions the federation morphisms.

The theorem then gives:

1. **Consensus exists.** The d-frame consensus $\mathbb F_{V_{G_{D_a}}}^{\mathrm{cons}} = \lim_{\sigma \in \hat G_{D_a}} \mathbb F_{V_{G_{D_a}}}(\sigma)$ is the merged notification state — what every device agrees $\nu$'s lifecycle is.
2. **Disagreement is recorded.** When $d_1$ has read $\nu$ ($\mathrm{read} = \mathbf{t}$) and $d_2$ has dismissed it without reading ($\mathrm{read} = \mathbf{f}$ at the same cell), the cellwise $\vee_k$ produces a $\top$-valued cell; per [bilattice network-sheaf consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md) claim 2, the disagreement is preserved as substrate content at the contested cell, not silently chosen.
3. **Mayer–Vietoris vanishes (CALM).** Per claim 4, the d-frame Mayer–Vietoris $\delta^n_\pm = 0$ for all $n \geq 0$ on the device-graph cover. Notification convergence is therefore *coordination-free*: each device's lifecycle update needs no global agreement, only federation propagation.
4. **Per-channel delivery is per-device-stalk witness.** The `delivery-witnesses` field of [notification-record](../objects/notification-record.md) corresponds, per device, to the d-frame's $\mathrm{tot}$ relation: a delivery-witness on device $d_i$ contributes to the `tot` cover at $d_i$'s stalk.

The argument is the device-graph specialization of [collaborative-edit-convergence](collaborative-edit-convergence.md): where that theorem treats users as observers of a document, this theorem treats devices as observers of a notification.

## The four enumerated behaviors as policy projections

The [open question](questions/multi-device-notification-convergence.md) listed four candidate behaviors. Each is a **projection of the consensus**, not an alternative to it:

- **Dismiss-everywhere.** The device displays $\nu$ iff $\mathrm{dismissed}_{\mathrm{cons}} = \bot$ — i.e., the *consensus* dismissed-cell is unset. Once any device dismisses, the consensus advances and all devices stop displaying. This is the projection $\pi_{\mathrm{cons}} : \mathbb F_{V_{G_{D_a}}}^{\mathrm{cons}} \to \mathbf{Bool}$ at the dismissed cell.

- **Active-device-only.** The device displays $\nu$ iff (consensus says undelivered or unread) **and** (the device's `device-presence` cell is currently active). This is the projection of the consensus restricted by per-device presence — equivalently, the modal restriction $\Box_{R_{\text{presence}}} \nu_{\mathrm{cons}}$ where $R_{\text{presence}}$ is the potential-device accessibility relation. See [authentication-as-modal-restriction](authentication-as-modal-restriction.md) for the same modal-restriction shape.

- **Independent-per-device.** The device displays $\nu$ iff its own *stalk* state has unset dismissed — the device reads $\mathbb F_{V_{G_{D_a}}}(d_i)$ rather than the limit. The per-device read/dismissed cells are not lifted to the consensus; only the `delivered` cell converges. This is the partial-consensus projection that drops the read/dismissed cells from the limit's defining diagram.

- **Configurable-per-notification.** The notification's `dismiss-policy` field selects which projection above each device computes. The underlying d-frame network-sheaf is the same in all cases; only the readout differs.

The substrate's notification discipline is therefore: **federate the d-frame network-sheaf; let `dismiss-policy` choose the projection.** Implementations may default to dismiss-everywhere (the limit projection) but the policy field is structurally a projection-selector, not a federation-discipline switch.

## Engineering consequence

- **No ad-hoc multi-device logic.** A predicated-computing realization implements one mechanism (the device-graph network-sheaf) and one parameter (dismiss-policy). The four production behaviors users see fall out of the parameter's value, not out of separate code paths.
- **Policy is substrate content.** Per [self-representation](../../teaching/explanations/self-representation.md), `dismiss-policy` is a notification field — federation-portable, queryable, auditable. Two substrates federating notifications agree on the policy by exchanging the notification record, not by negotiating multi-device discipline at the bridge.
- **Disagreement surfaces as $\top$.** A device that read $\nu$ and a device that dismissed-without-reading contribute a $(\mathbf{t}, \mathbf{f})$-pair at the read-cell. Per [audit-content-via-inconsistency-sheaf-cohomology](../../../theorems/audit-content-via-inconsistency-sheaf-cohomology.md), the substrate records this as inconsistency-sheaf content. The platform may surface it ("this notification was read on phone but dismissed on laptop without being opened") or smooth it (consensus collapses to dismissed); either choice is downstream of the consensus, not a substitute for it.
- **CALM-coordination-free notifications.** Per claim 4 of the parent theorem, no central coordinator is needed for notification convergence. A user who reads on a phone offline, then comes online, sees the read-state propagate to all devices via federation alone.
- **Cross-account device sharing.** A device $d$ logged into accounts $a_1$ and $a_2$ participates in *two* device-graphs ($G_{D_{a_1}}$ and $G_{D_{a_2}}$); its notification state for each account is its stalk in the corresponding network sheaf. The two are independent per [authentication-as-modal-restriction](authentication-as-modal-restriction.md): the modal restrictions $\Box_{R_{a_1}}$ and $\Box_{R_{a_2}}$ at $d$ are computed from disjoint accessibility cells.

## What the theorem rules out

- **Per-device notification logic without a common consensus.** A platform whose phone-app and laptop-app each implement their own dismiss policy, with no shared substrate consensus, loses convergence: the user can see contradictory states with no audit. Per the theorem, the consensus is *structural*; bypassing it is non-conformant.
- **Coordinator-based dismiss propagation.** A platform that requires every device to ack every dismiss before any device acts on it serializes what the bilattice network-sheaf makes commutative. Per claim 4 (CALM), the substrate doesn't need such coordination; using one is correctness-preserving but cost-amplifying.
- **Silent last-writer-wins on read-state across devices.** A platform that resolves read/dismissed disagreement by timestamp (most-recent device wins) loses the bilattice's $\top$-witness for genuine disagreement. Per [bilattice network-sheaf consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md) claim 2, disagreement is content; silencing it is information loss.
- **Notifications addressed to a device rather than an account.** A "notification for the phone" is not a notification per the subtheory — the recipient is an account, not a device, and per-device routing is downstream of the consensus, not a different addressing scheme. A platform that addresses devices directly has not specialized [send-notification](../morphisms/send-notification.md); it has implemented a different morphism (send-message-to-device) that bypasses the network-sheaf.

## What the theorem requires

- The substrate's federation discipline propagates per-device lifecycle updates per [federation-convergence](../../../theorems/federation-convergence.md).
- Each device's session is established per [authentication-as-modal-restriction](authentication-as-modal-restriction.md) — the device-graph $G_{D_a}$ is the set of accessibility cells with $R(w_a, w_{d_i}) > \bot$.
- The substrate's [notification-record](../objects/notification-record.md) carries `dismiss-policy` (or defaults to dismiss-everywhere = consensus-projection).
- Per [bilattice network-sheaf consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md), the device graph $G_{D_a}$ is finite (the user has finitely many active sessions at any moment).

## Position

This theorem is the device-graph instance of [bilattice network-sheaf consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md), exactly as [collaborative-edit-convergence](collaborative-edit-convergence.md) is the user-graph instance of the same parent theorem. The two theorems together exhaust the subtheory's "multi-replica state convergence" content: documents converge across users editing them; notifications converge across devices receiving them; the underlying mathematics is one theorem applied to two graphs.

Together with [notification-as-modal-possibility-claim](notification-as-modal-possibility-claim.md) (the notification's *content* is a $\Diamond_R$ assertion) and [authentication-as-modal-restriction](authentication-as-modal-restriction.md) (the device's *capability* is a $\Box_R$ restriction), the substrate's notification discipline is now grounded end-to-end in the predication-categories' modal and network-sheaf apparatus. The interactive layer adds no new mathematics; it specializes existing math to the user-experience surface.
