---
type: question
status: resolved
resolved-by: [multi-device-notification-convergence-via-device-graph-network-sheaf]
explores: [notification, notification-record, send-notification, federation-convergence]
---

# How does notification delivery converge when one user has multiple devices?

> **Resolved** by [multi-device-notification-convergence-via-device-graph-network-sheaf](../theorems/multi-device-notification-convergence-via-device-graph-network-sheaf.md): the four enumerated behaviors are not alternatives but projections of one underlying d-frame consensus on the user's device-graph (a direct application of [bilattice network-sheaf consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md) with the agent-graph specialized to the device-graph). The substrate federates the network sheaf; the per-notification `dismiss-policy` field selects which projection a given device displays. See also [notification-as-modal-possibility-claim](../theorems/notification-as-modal-possibility-claim.md) for the notification's *content* semantics ($\Diamond_R$ projection of source-events onto the recipient's world). The original framing is preserved below for reference.

---

The subtheory's [notification](teaching/explanations/notification.md) concept and [send-notification](../morphisms/send-notification.md) morphism characterize substrate-driven outbound messages to a user. In the single-device case the discipline is straightforward: the substrate produces a notification, the user's device receives it, the user reads or dismisses it, the substrate records the read/dismissed state. The state is one cell per user per notification.

The multi-device case is where it breaks. A user with a phone, a laptop, and a tablet has three substrate-replicas — the device-side cache of substrate state — each of which receives the notification via federation. The user reads the notification on the phone; what should happen on the laptop and tablet? Three behaviors are commonly seen in production systems:

- *Show on all devices, dismiss everywhere when dismissed on one.* The notification is one logical entity; the read/dismissed state is a per-notification cell that converges across devices.
- *Show only on the potential device, suppress on idle devices.* The notification is logically singular but presence-aware; the substrate routes based on which device is currently in use.
- *Show on all devices, dismiss independently per device.* The notification is replicated per device; each device has its own read/dismissed state.

Each behavior corresponds to a different commitment about what a notification *is* and how it interacts with [federation-convergence](../../../theorems/federation-convergence.md). The subtheory currently does not declare which.

## Concrete cases that would resolve the question

1. **Notification is a single substrate cell with a CRDT read-state.** [notification-record](../objects/notification-record.md) is one cell per user per notification; the read/dismissed state is an observed-remove set of device IDs (each device that dismisses adds its ID to the dismissed set; the notification is fully dismissed when the set covers all currently-known devices, or when an explicit "dismiss everywhere" predicate is set). Federation-convergence applies directly; the dismiss-everywhere semantics is realized.

2. **Notification is per-user with per-device delivery records.** [notification-record](../objects/notification-record.md) is per-user (one cell), and a separate `notification-delivery-record` per (notification, device) pair tracks delivery and read state. The substrate computes "should this device show the notification" by joining the user's notification with the device's delivery record. Independent dismissal is possible; cross-device dismiss requires an explicit operation that updates all delivery records.

3. **Notification with presence-aware routing.** [notification-record](../objects/notification-record.md) is per-user; an additional `device-presence` substrate cell records which device is currently active for each user. The substrate's [send-notification](../morphisms/send-notification.md) consults presence and routes only to the potential device; the notification still federates to all device-replicas (so it's available if presence changes), but only the potential device displays it.

4. **A configurable per-notification policy.** Each notification declares its multi-device discipline as a field: `dismiss-policy: {everywhere, per-device, active-device-only}`. The substrate's federation-convergence applies uniformly; the *interpretation* of dismiss state on a given device depends on the policy field. The discipline is in the per-notification declaration rather than in a global rule.

## Why the question matters

The current notes characterize a notification at the substrate level (a record with a target user, a payload, a creation time) without committing to its replication-and-presence behavior. Real interactive applications have to make this commitment — Slack, Discord, iOS Notifications, Android Notifications, email clients all have explicit policies, and they differ. Without an answer, a predicated-computing realization of this subtheory would invent its own ad-hoc policy at the application level, undermining the subtheory's claim to characterize interactive applications structurally.

The question also bears on [account-uniqueness-and-attribution](../theorems/account-uniqueness-and-attribution.md): a user is one account but multiple device-presences; the discipline for relating account, device, and substrate-replica is currently implicit. A clean answer here would also clarify the cross-device cursor / selection / draft-state question (currently absent from the subtheory entirely) — the same multi-device convergence machinery applies.

The question is decidable by analysis of what each behavior costs in substrate operations and what each application use case requires; it is not decidable without that analysis being done. The subtheory's coherence at the user-experience boundary requires the analysis.
