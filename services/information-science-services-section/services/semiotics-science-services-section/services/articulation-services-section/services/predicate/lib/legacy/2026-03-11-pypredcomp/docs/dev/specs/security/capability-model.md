---
title: "Capability model"
description: "How authorization works on the OS. Capabilities are substrate cells composed via $\\Rightarrow$. The algebra IS the capability check. Non-amplification is a theorem."
kind: spec
status: normative
version: "0.2"
---

# Capability model

The OS uses **capability discipline**, not access-control lists.
Every authorization decision is a capability fiber composition; the substrate's $\Rightarrow$ operator IS the capability check.

This spec is load-bearing for security/, process/, ipc/, network/, drivers/, and any subsystem touching authorization.
Per [decisions/capability-not-acl.md](../../decisions/capability-not-acl.md) and [decisions/authorization-is-modal-restriction.md](../../decisions/authorization-is-modal-restriction.md).

## Grounded in

- [`predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md) — the capability-fiber $\Rightarrow$ used in §3 is the call-graph surface of $\Box_R$ acting on the substrate's accessibility relation.
  Non-amplification (§4) is the per-surface theorem; the unification result lifts it to all six authorization surfaces uniformly.
- See [_patterns/predicated-computing-grounding.md](../_patterns/predicated-computing-grounding.md) for the engineering-layer index.

## 1. Capability records

A **capability** is a substrate cell with `kind = "capability"`:

```json
{
  "id": "<sha256>",
  "kind": "capability",
  "holder": "<entity-slug>",
  "grants": [
    {"predicate": "set", "target-pattern": "task:*", "value-pattern": "True|False|None|Both"},
    {"predicate": "respond", "target-pattern": "session:agent:*"}
  ],
  "delegated-by": "<entity-slug>",
  "expires-at-ord": 12345,
  "scope": "<scope-slug>"
}
```

Fields:

| Field | Type | Meaning |
|---|---|---|
| `holder` | entity-slug | Who has this capability. Personnel, persona-agent, session, peer node. |
| `grants` | array | What the capability authorizes. Each grant has a `predicate` (the operation), a `target-pattern` (which entities the operation applies to), optionally a `value-pattern` (which bilattice values the operation is permitted to set). |
| `delegated-by` | entity-slug | Who granted this capability. Used for non-amplification check (§4). |
| `expires-at-ord` | integer | Optional event-ordinal beyond which the capability is invalid. |
| `scope` | string | Optional scope-slug bounding which substrate region the capability applies in. |

Capabilities are content-addressed cells like every other substrate entity.
They are signed by `delegated-by` (Ed25519, per [federation-signatures-ed25519.md](../../decisions/federation-signatures-ed25519.md)).

## 2. The capability fiber

A holder's **capability fiber** is the composition of all their unexpired capability cells via $\odot$ (extending).
Multiple capabilities accumulate; what one denies, another can affirm; mutual disagreement produces $\top$ (paraconsistent — both grants stand).

The capability fiber is reconstructed at session-open time from the holder's substrate cells; it is cached for the session's lifetime; capability-add or capability-revoke events invalidate the cache and trigger re-derivation.

## 3. The capability check via $\Rightarrow$

When a sender $s$ issues `respond(target, payload, sender=s)`:

1. The substrate looks up $s$'s capability fiber $C_s$.
2. The payload is converted to a fiber $P$ over the target's index.
3. The substrate computes the **bounded payload**: $P' = C_s \Rightarrow P$.
4. $P'$ is what the substrate processes; $P$ never reaches the closure-rule engine unbounded.

Per [respond.md](../kernel/respond.md) §4: $\Rightarrow$ acts as: a sender whose authority is $\bot$ at a predicate produces a $t$-implication (vacuous, no effect); a sender with affirmative authority passes through; a sender with denying authority converts to $f$.

This is structural.
There is no separate authorization layer to bypass.

## 3a. Per-stratum capability fiber

> Status: v0.2a, ships under pt-02 / t02-126.

The capability fiber stratifies along the same three-tag tower as every other substrate cell (`asserted`, `saturated`, `settled`; per [stratified-facts.md](../kernel/stratified-facts.md) §1).
A holder may carry capabilities scoped to a particular stratum: a saturated-scoped grant authorizes responses that act on the saturated sub-fiber (the canonical case is **retraction of a derived cell**); a settled-scoped grant authorizes action on the Δ-pass surface; an unscoped grant (`at-stratum: null`) applies at every stratum and is the legacy v0.2-pre default.

**Projection:** the substrate's $\Box_R$ evaluator (per [modal-restriction-as-substrate-authorization-primitive](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md)) takes an optional `stratum` parameter.
The $R$ relation is projected onto the sub-relation whose participating cells either carry `at-stratum = null` (apply everywhere) or `at-stratum = <requested>`.
Cells whose `at-stratum` is some other stratum drop out of the truth-meet for that request.

**Default callsite:** payload writes always land at the `asserted` stratum (per [respond.md](../kernel/respond.md) Phase 2), so a caller that omits `at-stratum` is treated as projecting onto the asserted sub-fiber.
Explicit `at-stratum: "saturated" | "settled"` declares a non-default action — typically a retraction of a higher-stratum cell.

**Audit-log emission:** every non-default-stratum respond emits an `audit-log` cell (per [tool-risk-scoring.md](tool-risk-scoring.md) §3) recording the stratum at which authority was exercised AND the licensing capability id(s) drawn from the gate's matched-cell projection.
This is the load-bearing answer to "by what authority was this saturated cell retracted?"; without it, retraction is uninspectable.

**Failure modes:**

| Code | Trigger |
|---|---|
| `PCC_AUTHZ_DENIED` | The per-stratum projection of $R$ produces a non-`TRUE` $\Box_R$ value at the requested stratum — typically: holder's grants are all scoped to a different stratum. |

Unknown stratum strings fail closed: a request at `at-stratum: "<typo>"` produces an empty match set and denies via the default-deny truth-meet against `NONE`.

## 4. Non-amplification (theorem)

Per `functional-runtime-platform/theorems/capability-non-amplification`:

> A capability cannot grant authority beyond the delegator's authority.

Proof sketch: when capability $C_2$ is delegated by holder of $C_1$, the substrate enforces $C_2 \le_t C_1$ at delegation-time via $\Rightarrow$.
If $C_2$ asserts authority $C_1$ doesn't have, the assertion at the relevant predicate becomes vacuous (the delegation is a no-op for predicates outside $C_1$).

This means: I cannot delegate to you authority I don't have.
Capability-passing is structurally bounded.

Operationally:

- A capability-add event with a `delegated-by` field triggers a $\Rightarrow$-bounded write of the new capability cell against the delegator's capability fiber.
- A capability cell asserting grants outside the delegator's authority is rejected with `PCA_DELEGATION_AMPLIFIES`.

## 5. Capability discipline for federation

Federation peers exchange signed events; capability cells from peers are local-substrate cells with `peer = "<peer-id>"` on the event envelope.
A peer's capability cell is admitted only if:

1. The signature verifies against the peer's known public key.
2. The capability's `delegated-by` is within the peer's own substrate authority.
3. The capability's `holder` is a valid entity in the receiving substrate.

Cross-federation capability flow respects sovereignty: peer A cannot grant capabilities for peer B's local entities.
See [federation-trust.md](federation-trust.md).

## 6. Common capability vocabularies

The substrate ships standard capability vocabularies for common operations:

### Cell operations

- `read` — read a cell's value at a predicate.
- `set` — assert a cell value (subject to $\le_k$-monotonicity).
- `retract` — assert a denying value.
- `witness` — query the cell's audit history.

### Session operations

- `respond` — invoke `respond` on a target.
- `await` — wait on a fiber update.
- `fork` — clone a session.
- `terminate` — terminate a session.

### Substrate operations

- `add-rule` — append a closure-rule.
- `retire-rule` — retire a closure-rule.
- `set-alias` — update an alias.
- `snapshot` — record a snapshot event.

### Driver operations

- `driver-attach` — attach a driver.
- `driver-detach` — detach a driver.
- `driver-respond` — invoke a driver's protocol-specific operation.

Per-driver capabilities are defined in the driver's spec (e.g., the SMTP driver requires `smtp-send` for outbound mail).

## 7. Default capability fibers

Every personnel and persona-agent has a default capability fiber:

- **System** (`system:`) — unrestricted; the kernel itself when no sender is specified.
  Should not be assigned to a session unless the session is the substrate's own boot sequence.
- **Personnel** (`personnel:emsenn`) — full authority over their own substrate region; constrained by office assignments for cross-region work.
- **Office incumbents** — when personnel acts in an office, the session's capability fiber is `personnel-fiber ⊙ office-fiber`.
  The office may grant additional authority within its scope.
- **Persona-agents** (`persona:cassia-lorne`) — authority bounded by their persona; cannot impersonate personnel.
- **Peer nodes** (`peer:rsc-quiescent.
  561.local`) — authority bounded by federation trust graph; cannot affect non-peer-scoped predicates.

## 8. Errors

| Code | Meaning |
|---|---|
| `PCA_SCOPE_INSUFFICIENT` | Sender's capability fiber denies the message at every requested predicate. |
| `PCA_DELEGATION_AMPLIFIES` | A delegated capability asserts authority the delegator doesn't have. |
| `PCA_CAPABILITY_EXPIRED` | The capability's `expires-at-ord` has passed. |
| `PCA_HOLDER_UNKNOWN` | The capability's holder isn't a valid entity. |
| `PCA_DELEGATOR_UNKNOWN` | The capability's delegator isn't a valid entity. |
| `PCA_SIGNATURE_INVALID` | The capability cell's signature didn't verify. |

All errors carry the partial repair log so callers can audit how far the authorization check got before failure.

## 9. Implementation

### Python (v0.1+)

- Capabilities are pydantic `Capability` BaseModels; `grants` is a list of typed `Grant` models.
- The capability fiber composition is a recursive $\odot$-merge over capability cells.
- $\Rightarrow$ is implemented in `substrate/algebra.py` and applied at the start of `respond.py`'s payload composition (Phase 2).
- Federation receive validates capability provenance via `cryptography.hazmat.primitives.asymmetric.ed25519`.

### Rust (v0.2+)

- Capabilities are serde-derived structs; grants are typed enums.
- The composition uses the same algebra ports from `mash-engine`.
- Federation receive uses `ed25519-dalek` for verification.

## 10. Conformance

Capability discipline passes:

1. **Authorization rejection.** A respond from a sender lacking authority for the relevant predicate is rejected with `PCA_SCOPE_INSUFFICIENT`; partial repair log is preserved.
2. **Non-amplification.** A delegated capability asserting unauthorized grants is rejected with `PCA_DELEGATION_AMPLIFIES`.
  Property test: hypothesize random grant graphs; assert no path produces unauthorized authority.
3. **Federation trust.** A peer's capability cell admitted only after signature + provenance + holder validation.
  Test: simulated peer with valid keys; reject mismatched-provenance cells.
4. **Cache invalidation.** A capability-add event triggers re-derivation of the holder's capability fiber within one heartbeat tick.
5. **Determinism.** Same capability state + same payload + same target → same authorization outcome in both Python and Rust.

## 11. Plan 9 / Unix analogue

| Unix concept | Capability analogue |
|---|---|
| User/group permissions | Capability fiber via $\Rightarrow$ |
| `chmod` | Update a capability cell |
| `chown` | Update an `owner` cell (a specific predicate) |
| `setuid` | Forbidden — would amplify; substrate forbids |
| `sudo` | Capability escalation via signed delegation |
| Linux capabilities (CAP_*) | Per-grant entries in capability cells |
| factotum (Plan 9) | Personnel capability authority cells |
| Kerberos tickets | Capability cells with `expires-at-ord` |
