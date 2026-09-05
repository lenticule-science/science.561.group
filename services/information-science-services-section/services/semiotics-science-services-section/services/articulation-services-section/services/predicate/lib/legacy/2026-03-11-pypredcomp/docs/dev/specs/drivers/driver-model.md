---
title: "Driver model"
description: "How drivers (interfacers) work in the OS. Drivers are substrate cells with capability declarations, attach/detach lifecycle, and audit trails. The substrate's driver framework."
kind: spec
status: normative
version: "0.2"
---


A **driver** translates between the substrate and an external system: a network protocol server, a database, a hardware device, a Linux kernel facility, an agent runtime, a git repository.
Per [decisions/drivers-are-substrate-entities.md](../../decisions/drivers-are-substrate-entities.md), drivers are substrate cells with capability declarations and a defined lifecycle.

## Grounded in

- [`predicated-computing/theorems/doctrine-fidelity-via-faithful-interfacer-functor`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/doctrine-fidelity-via-faithful-interfacer-functor.md) — the three driver operations (§2 — `extract`, `apply`, `compose`) are exactly the operations of a faithful interfacer functor between the substrate's predication category and the external system's category.
  The framework-enforced requirement that drivers MUST implement all three is the operational form of the functor's faithfulness; the conformance round-trip (§12 step 5) is the counit-law fidelity test.
- [`predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md) — the per-driver capability discipline (§5 — `capabilities-required` checked at attach, calls bounded by capability fiber via $\Rightarrow$) is $\Box_R$ at the driver's capability fiber sub-region.
  Per [decisions/authorization-is-modal-restriction.md](../../decisions/authorization-is-modal-restriction.md).
- [`predicated-computing/theorems/cost-composition-via-lawvere-quantale`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-composition-via-lawvere-quantale.md) — per-driver call budgets (cited in [security/sandbox-and-fuel.md](../security/sandbox-and-fuel.md) §8) are quantale terms in the chosen cost quantale; nested driver budgets compose via the quantale's $\otimes$.
  Per [decisions/cost-is-lawvere-quantale.md](../../decisions/cost-is-lawvere-quantale.md).
- See [_patterns/predicated-computing-grounding.md](../_patterns/predicated-computing-grounding.md) for the engineering-layer index.

## 1. Driver records

```json
{
  "kind": "driver",
  "id": "<sha256>",
  "slug": "driver:smtp-imap",
  "name": "SMTP/IMAP email driver",
  "version": "0.3.0",
  "capabilities-required": [
    {"predicate": "respond", "target-pattern": "message:*"},
    {"predicate": "set", "target-pattern": "message:*"},
    {"predicate": "network-tcp-connect", "target-pattern": "*:587 | *:993"}
  ],
  "capabilities-grants": [
    {"predicate": "send-email", "target-pattern": "message:outbound:*"},
    {"predicate": "fetch-email", "target-pattern": "message:inbox:*"}
  ],
  "implementation-language": "python",
  "implementation-package": "substrate-driver-smtp-imap",
  "implementation-version": ">=0.3.0",
  "extracts": ["network-bytes-from-imap-server"],
  "applies": ["substrate-cell-from-message"],
  "composes": ["incoming-and-stored-mailboxes"],
  "active": "True"
}
```

Fields:

| Field | Type | Meaning |
|---|---|---|
| `slug` | string | Driver identifier; lowercase-kebab-case with `driver:` prefix. |
| `version` | semver | Driver version. |
| `capabilities-required` | array | What capabilities the driver needs to operate. |
| `capabilities-grants` | array | What capabilities the driver provides to sessions using it. |
| `implementation-language` | string | `python`, `rust`. |
| `implementation-package` | string | Package name in the language ecosystem. |
| `implementation-version` | semver constraint | Required version range. |
| `extracts` | array | The `interfacer.extract` operations this driver provides (per `predicated-computing/concepts/interfacer`). |
| `applies` | array | The `interfacer.apply` operations. |
| `composes` | array | The `interfacer.compose` operations. |
| `active` | bilattice value | Whether this driver is currently attached. |

## 2. Three operations (per interfacer theory)

Per `predicated-computing/concepts/interfacer.md`, every driver implements three operations:

1. **Extract** — read external state, produce substrate cells.
  (e.g., IMAP fetch → cells `(message:..., body, ...)
  `.)
2. **Apply** — given substrate cell update, produce external operation.
  (e.g., `(message:outbound:..., send, t)` → SMTP message send.)
3. **Compose** — given two substrate views (local and external), produce the merged substrate view.
  (e.g., merge inbox cells with already-known local cells.)

Drivers MUST implement all three; the framework enforces.

## 3. Driver lifecycle

```
unloaded → loaded → attached → operating → detaching → detached → unloaded
                ↓                   ↓
             failed             draining
```

### `loaded`

The driver's implementation package is loaded into the runtime; it's not yet operating against substrate state.

### `attached`

The driver record is registered with the runtime.
It's allocated capability fibers, and its `extract` cycle is scheduled.
Bidirectional sync begins.

### `operating`

The driver's `extract` is running periodically; `apply` fires on closure-rule firings; `compose` runs on merge.

### `detaching`

The driver is winding down.
New respond requests routing through the driver are rejected.
In-flight calls drain.

### `detached`

The driver is no longer operating.
Its substrate cells are quiesced (marked stale via a `(driver:..., stale-since-ord, ...)
` predicate).

### `failed`

A driver in `failed` state has crashed or exceeded its budget.
The runtime's supervisor handles per the `restart-policy` predicate (next section).

## 4. Restart policies

```json
{
  "subject": "driver:smtp-imap",
  "predicate": "restart-policy",
  "object": "always-with-backoff",
  "value": "True"
}
```

Standard policies:

- `never` — failed driver stays failed; ops handles manually.
- `once` — restart once; subsequent failure → `failed`.
- `always` — always restart on failure; immediate.
- `always-with-backoff` — restart with exponential backoff (1s, 2s, 4s, 8s, ...); reset to 1s after 5 minutes of stable operation.
- `bounded-with-backoff` — like always-with-backoff but caps total restart count.

Restart events are logged: `(driver:..., restarted-at-ord, ..., t)`.

## 5. Driver capability discipline

When a driver attaches:

1. The driver's `capabilities-required` are checked against the system's authority.
  If insufficient, attachment fails with `PCA_SCOPE_INSUFFICIENT`.
2. The driver receives the granted capability fiber as its operating authority.
3. The driver's calls into the substrate are bounded by this fiber via $\Rightarrow$.
4. Sessions using the driver inherit `capabilities-grants` from the driver, composed with their own session capability.

This means: a malicious or buggy driver cannot exceed its declared authority.
The driver framework enforces.

## 6. Driver-to-substrate calls

Drivers call into the substrate via:

```
respond(target, payload, sender=driver:<slug>)
```

The driver acts as the sender; its capability fiber bounds effect.
Drivers do NOT directly modify substrate state; they go through respond.

## 7. Substrate-to-driver calls

The substrate calls drivers via closure-rule firings:

```
(driver:smtp-imap, on-firing, "message-outbound-pending", t)
↓
The driver subscribes to firings matching this predicate; when a closure rule produces a `(message:outbound:X, send, t)` cell, the driver's listener fires.
```

The driver's listener is registered at attach-time; deregistered at detach.

## 8. Failure semantics

A driver may fail in several modes:

- **Crash** — the driver process/task panics.
  Supervisor restarts per policy.
- **Budget exceeded** — driver exceeds its session budget.
  Driver enters `failed`; supervisor restarts.
- **External system unavailable** — driver retries with backoff; cells touched by the driver are marked stale; substrate continues.
- **Capability rejected** — driver attempts an operation outside its capability fiber.
  Driver's call is rejected; driver transitions to `degraded`; admin attention.

Failures are auditable via the witness chain.

## 9. Driver isolation

In Python (v0.x): drivers run in the same asyncio event loop as the substrate.
Failure isolation is per-task; a driver crash doesn't kill the substrate.

In Rust (v0.x+): drivers run in dedicated tokio tasks; failure isolation is per-task; panic-handler cleanly transitions to `failed`.

In v0.6+: drivers can run in separate processes (sandboxed) for stronger isolation.
The framework supports both in-process and out-of-process drivers via the same record format.

## 10. Errors

| Code | Meaning |
|---|---|
| `PCD_DRIVER_NOT_FOUND` | Referenced driver-slug doesn't exist. |
| `PCD_DRIVER_FAILED` | Driver in `failed` state; operation rejected. |
| `PCD_DRIVER_CAPABILITY_INSUFFICIENT` | Driver's required capability not available. |
| `PCD_DRIVER_VERSION_INCOMPATIBLE` | Required version range not satisfied by installed package. |
| `PCD_DRIVER_PACKAGE_MISSING` | Implementation package not installed. |
| `PCD_DRIVER_INTERFACE_INVALID` | Driver doesn't implement required extract/apply/compose. |

## 11. Implementation

### Python (v0.2+)

- Drivers are registered as Python classes inheriting `substrate.drivers.
  Driver`.
- Each driver class implements `async extract()`, `async apply(cell)`, `async compose(local_fiber, remote_fiber)`.
- The driver framework loads driver records, dynamically imports the implementation package, instantiates the driver, registers callbacks.
- Driver isolation via `asyncio.
  Task`; restart via supervisor task watching task completion.

### Rust (v0.2+)

- Drivers are crates implementing the `Driver` trait.
- Loaded dynamically via `libloading` for shared-object drivers, or statically linked at OS-image build time.
- Driver isolation via `tokio::spawn`; restart via supervisor task.

## 12. Conformance

The driver framework passes:

1. **Lifecycle.** A driver loads, attaches, operates, detaches, unloads in correct order; events recorded for each transition.
2. **Capability check.** A driver requiring an unavailable capability fails attachment with `PCA_SCOPE_INSUFFICIENT`.
3. **Failure recovery.** A driver crashing under `always-with-backoff` policy restarts with backoff; events logged.
4. **Substrate isolation.** A driver crash does not crash the substrate.
5. **Cross-language equivalence.** Same driver record + same external system interaction → same substrate cell state in Python and Rust.

## 13. Driver discovery

The runtime discovers drivers via:

1. **Static** — drivers shipped in the OS base image are listed in the package manifest.
2. **Substrate** — `respond` queries `(*, kind, "driver")` to enumerate all known drivers.
3. **Federation** — peers may publish driver records; the local node may install (with capability check).

## 14. Plan 9 / Unix analogue

| Unix concept | Driver analogue |
|---|---|
| Device file (`/dev/...`) | Substrate cells written by a driver |
| Kernel module | Driver record (substrate entity) |
| `insmod` / `rmmod` | attach / detach |
| udev | Closure rules firing on attach events |
| systemd service file | Driver record with restart policy |
| FUSE | A driver implementing the fs-driver interface for an external store |
| Plan 9 file servers | Drivers exposing substrate cells via 9P (eventual; v0.6+) |
