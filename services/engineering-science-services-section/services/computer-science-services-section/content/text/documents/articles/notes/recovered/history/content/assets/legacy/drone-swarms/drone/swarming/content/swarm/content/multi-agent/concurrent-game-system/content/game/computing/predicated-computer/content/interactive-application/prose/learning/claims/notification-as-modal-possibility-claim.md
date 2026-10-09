---
type: theorem
class: engineering-claim
status: proved
depends-on:
  - notification
  - notification-record
  - send-notification
  - modal-possibility-operator
  - bilattice-accessibility-relation
  - modal-non-normality
  - authentication-as-modal-restriction
  - signature-binds-witness-to-identity
see-also:
  - multi-device-notification-convergence-via-device-graph-network-sheaf
  - trust-boundary-modal-validity
  - federation-trust-bilattice-graded
---

# A notification is the modal-possibility projection of a source-event onto the recipient's world

**Claim.** For any notification $\nu$ produced by [send-notification](../morphisms/send-notification.md) with source-event $\sigma$ and recipient account $a$, $\nu$'s substrate semantics is

$$\nu_{w_a} \;=\; (\Diamond_R \sigma)_{w_a} \;=\; \bigvee_t \{\, R(w_a, w') \odot \sigma_{w'} : w' \in W \,\},$$

where $R$ is the substrate's [bilattice accessibility relation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md), $w_a$ is the recipient's world, $w'$ ranges over worlds where $\sigma$ has substrate-content, $\bigvee_t$ is the [truth-order](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/truth-order.md) join, and $\odot$ is [twist-product fusion](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md).

Equivalently: a notification *asserts to* $a$ *that* $\sigma$ *is possibly the case at some world* $a$ *can reach*. The notification's severity, deliverability, and trust grade are the bilattice-grades of $R(w_a, w')$ at the source-worlds; the notification's *content* is the $\Diamond_R$ image of $\sigma$ in $a$'s fiber.

This is the dual of [authentication-as-modal-restriction](authentication-as-modal-restriction.md): authentication is the $\Box_R$ restriction of $a$'s capability *outward* to a session-device; notification is the $\Diamond_R$ projection of substrate events *inward* to $a$. Together $\Box_R$ and $\Diamond_R$ on the same accessibility relation cover the two substrate-to-user information flows.

## Why this holds

**Notifications are claims, not facts.** A notification doesn't tell $a$ that $\sigma$ has happened in $a$'s own world; it tells $a$ that $\sigma$ has happened *at some world the substrate can attest to*, with strength graded by how far that world is from $a$'s. This is exactly the structure of $\Diamond_R$: the value at $w_a$ is the $\bigvee_t$ over reachable worlds of "$R$-grade fused with the source value."

**Source-worlds are the substrate events.** Per [send-notification](../morphisms/send-notification.md)'s `source-event`, every notification cites a substrate event $\sigma$ at some world $w_\sigma$. The set $W$ in the modal sum is the worlds where $\sigma$ has substrate-content — typically the singleton $\{w_\sigma\}$ for one-source notifications, but any set of co-witnessing source-events for aggregated notifications (e.g., "5 new comments" aggregates 5 source-events).

**Accessibility-grade is severity-and-trust.** The bilattice cell $R(w_a, w_\sigma)$ records two pieces of grade-content per [federation-trust-bilattice-graded](../../../theorems/federation-trust-bilattice-graded.md):

- *Truth-order grade $\geq_t$*: how strongly the substrate vouches that $\sigma$ is real for $a$. A first-party event ($w_\sigma$ on the same substrate as $w_a$) gets $\mathbf{t}$; a federated peer event gets a graded $\mathbf{t}$ scaled by the federation-trust bilattice; a webhook ingested from an untrusted external source gets $\bot$ on the $L_+$ side.
- *Knowledge-order grade $\geq_k$*: how much information about $\sigma$ the substrate has propagated to $a$. Before the notification is delivered: $\bot$ (uninformed). After delivery to one device: a partial $\geq_k$ value. After delivery to all devices and read: full $\mathbf{t}$ on the read-witness cell.

The notification's `severity` field is a coarse projection of the truth-grade; `delivery-witnesses` are projections of the knowledge-grade.

**Twist-product fusion is the substrate-to-recipient combine.** The cellwise $\odot$ combines the accessibility-grade with the source-event's value per the [twist-product fusion](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md) discipline: high-grade access to a strong source produces a strong notification; low-grade access to a strong source attenuates; high-grade access to a weak source produces only what the source itself supports.

**Top-of-fiber join.** The $\bigvee_t$ aggregates over all source-worlds: a single source produces a single contribution; multi-source notifications aggregate contributions disjunctively. This is exactly the bilattice $\vee_t$ semantics — "at least one source attests" — appropriate for "you have new activity" style notifications that aggregate.

## Engineering consequence

- **Notification trust is structural, not policy.** A notification ingested from a low-trust source produces a low-grade $R$ cell; the substrate's user-experience layer can refuse to display, mark as suspicious, or downrank such notifications using the structural grade rather than running a separate trust scoring service.
- **Severity composes correctly across federation.** A federated peer notifying about a federated event applies *two* accessibility hops: the original event's $R$-grade at the producing substrate, fused with the federation-trust $R$-grade between substrates. The notification arrives at $a$ with the composite grade; per [federation-trust-bilattice-graded](../../../theorems/federation-trust-bilattice-graded.md), the bilattice composes graded accessibility correctly.
- **Notification spoofing fails the modal evaluation.** A notification claiming severity `urgent` whose underlying $\sigma$'s accessibility-grade is $\bot$ produces a $\Diamond_R$ value of $\bot$ — the substrate's modal evaluation refuses to admit the urgent claim. Per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md), claimed-severity must be witnessed by source-event provenance; the modal evaluation checks this structurally.
- **Read-witnesses strengthen the modal cell.** Per [multi-device-notification-convergence-via-device-graph-network-sheaf](multi-device-notification-convergence-via-device-graph-network-sheaf.md), a device's read-witness on $\nu$ contributes to $a$'s knowledge-grade at the cell. The notification's cell value monotonically increases in $\geq_k$ as devices read; this is the substrate's "you've seen this" semantics.
- **$\Diamond_R$ and $\Box_R$ on one $R$ unify the user's information flows.** Authentication establishes $a$'s outward capability via $\Box_R$ on $R$; notification establishes the substrate's inward claim to $a$ via $\Diamond_R$ on the same $R$. A platform that uses different accessibility relations for the two has not exploited the substrate's unified modal structure; it has split a single phenomenon into two.

## What the theorem rules out

- **Notifications independent of source-event provenance.** A "notification" produced without a cited substrate event has no source-world — $W$ is empty — and the $\Diamond_R$ join is $\bot$. Per the theorem, such "notifications" are inadmissible: they have no substrate semantics. Per [notification-record](../objects/notification-record.md)'s `source-event` invariant, the substrate refuses them at insertion.
- **Severity claimed independently of the source's accessibility grade.** A notification asserting `urgent` while its source-event has $R$-grade $\bot$ is structurally inconsistent: $\Diamond_R$ at the recipient is $\bot$, contradicting the urgent claim. The substrate's modal evaluation surfaces the inconsistency as a $\top$-cell per [audit-content-via-inconsistency-sheaf-cohomology](../../../theorems/audit-content-via-inconsistency-sheaf-cohomology.md).
- **Notification non-normality matters.** Per [modal-non-normality](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/modal-non-normality.md), the classical normality axiom $\Box(\phi \to \psi) \to (\Box\phi \to \Box\psi)$ fails on bilattice modal logic; the dual fails for $\Diamond_R$ as well. A platform that *assumes* notification semantics distributes over implication ("if I'd be notified of $\phi$ and $\phi$ implies $\psi$, I'd be notified of $\psi$") is making a classical-Kripke assumption the substrate's bilattice modality does not satisfy. Notification chains that rely on such distribution are unsound.
- **Aggregated notifications without a $\vee_t$ semantics.** "5 new comments" computed by counting events without joining them in the bilattice loses the substrate's grade composition: 5 low-trust events should not aggregate into one high-trust notification. Per the $\bigvee_t$ in the theorem, aggregation is the truth-order join of contributions, which preserves grade.

## What the theorem requires

- The substrate's bilattice accessibility relation $R$ is recorded as substrate content per [self-representation](../../teaching/explanations/self-representation.md).
- Every notification cites a `source-event` per [notification-record](../objects/notification-record.md).
- The substrate implements $\Diamond_R$ per [modal-possibility-operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-possibility-operator.md).
- Per [federation-trust-bilattice-graded](../../../theorems/federation-trust-bilattice-graded.md), federated source-events carry the federation-trust grade composed with the source's local grade.

## Position

This theorem is the substrate's *content semantics* for notifications. It pairs with:

- [multi-device-notification-convergence-via-device-graph-network-sheaf](multi-device-notification-convergence-via-device-graph-network-sheaf.md) — convergence of the notification's *delivery state* across devices.
- [authentication-as-modal-restriction](authentication-as-modal-restriction.md) — the dual $\Box_R$ structure for capability rather than information flow.
- [trust-boundary-modal-validity](../../../theorems/trust-boundary-modal-validity.md) — the substrate's trust-boundary discipline is also a modal evaluation on $R$.

The four theorems share one accessibility relation. The substrate's user-account discipline is therefore one bilattice-modal phenomenon at four engineering surfaces: outward capability ($\Box_R$ session), inward claims ($\Diamond_R$ notification), boundary admission (trust-boundary $\Box_R$ at admit-time), and multi-device convergence (network-sheaf consensus over the $R$-determined device-graph). The platform's structural coherence reduces to having one relation $R$ on which all four are evaluated.
