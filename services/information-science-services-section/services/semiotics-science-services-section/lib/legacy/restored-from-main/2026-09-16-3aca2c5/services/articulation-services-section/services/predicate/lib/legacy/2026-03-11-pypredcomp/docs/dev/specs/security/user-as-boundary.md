---
title: "User as boundary entity"
description: "A user is a boundary entity that holographically projects four fibers — auth, authz, attention, history. Personnel, office, and persona-agent are projections of the boundary, not independent records."
kind: spec
status: normative
version: "0.2"
---


A **user** is the OS's primitive identity.
It is not a record kind; it is a *boundary entity* — the projection of an indefinitely-rich bulk (a real person, a federated peer, an automated operator) onto the surface where the substrate can recognise it, authorise it, attribute its attention, and audit its history.

This spec is load-bearing for [persona-and-personnel.md](persona-and-personnel.md), [capability-model.md](capability-model.md), [signing-and-witnessing.md](signing-and-witnessing.md), [federation-trust.md](federation-trust.md), and [process/session-as-process.md](../process/session-as-process.md).
It rebases the older "personnel / office / persona-agent are three flat record kinds" framing onto a single boundary model from which those classes are derived as projections.

Per [decisions/identity-is-boundary-projection.md](../../decisions/identity-is-boundary-projection.md), per the captain's source idea at `operations/engineering/triage/operations/command/ideas/triage/user-as-boundary.md` (2026-04-04).

## 1. The bulk/boundary framing

A real human (the "bulk") has indefinite complexity — relations, histories, capacities, intentions.
The substrate cannot and should not model the bulk.
What the substrate needs is the **boundary**: the projection of the bulk onto the surface where it relates to the system.

The holographic principle (per `voidmath/IDEAS.md`, "Holographic Boundary Identity"): everything the substrate needs to know about the bulk is already encoded in how the bulk relates to the system through the boundary.
Conversely, the bulk's properties that do not project through the boundary are not part of the substrate at all — and that is structural privacy, not omission.

A boundary entity is a substrate cell with `kind = "boundary"`:

```json
{
  "kind": "boundary",
  "id": "<sha256>",
  "slug": "boundary:emsenn",
  "introduced-at-ord": 0,
  "active": "True"
}
```

The boundary record carries no personal data.
Its content is exhausted by its four fiber projections (§2).
The bulk relates to the system *through* the boundary; the boundary's fibers describe that relation.

## 2. The four fiber projections

A boundary projects four canonical fibers.
Each fiber is itself a substrate fiber over the boundary's slug; every fiber is reconstructible from substrate cells; together the four fully encode what the substrate knows about the user.

### 2.1 Auth fiber — *who is this key*

The auth fiber is the projection that answers "is this signed event from this boundary?".
It indexes the boundary's recognised credentials.

```json
{"subject": "boundary:emsenn", "predicate": "auth-method", "object": "ed25519:<base64-pubkey>", "value": "True"}
{"subject": "boundary:emsenn", "predicate": "auth-method", "object": "ssh-key:<fingerprint>",     "value": "True"}
{"subject": "boundary:emsenn", "predicate": "auth-method", "object": "git-author:<email>",        "value": "True"}
```

A signature verifies against the boundary iff some `(boundary:X, auth-method, <key>) = t` cell is current and the signature matches that key.
Per [signing-and-witnessing.md](signing-and-witnessing.md).

The auth fiber is the projection consulted at session-open and at federation receive.

### 2.2 Authz fiber — *what can they do*

The authz fiber is the projection that answers "what authority does this boundary carry at this respond?".
It composes the boundary's capability cells.

```json
{"subject": "boundary:emsenn", "predicate": "holds-capability", "object": "capability:<sha256>", "value": "True"}
{"subject": "boundary:emsenn", "predicate": "holds-office",     "object": "office:planner",       "value": "True"}
{"subject": "boundary:emsenn", "predicate": "operates-persona", "object": "persona:cassia-lorne", "value": "True"}
```

The authz fiber is the $\odot$-composition of every capability cell whose `holder` resolves (transitively, through office and persona projections — §3) to the boundary.
Per [capability-model.md](capability-model.md).

The authz fiber is consulted at every $\Rightarrow$ check.

### 2.3 Attention fiber — *what are they looking at*

The attention fiber is the projection that answers "which channels and cells is this boundary currently observing?".
It is the substrate's analogue of focus.

```json
{"subject": "boundary:emsenn", "predicate": "subscribed-to",     "object": "channel:bridge",       "value": "True"}
{"subject": "boundary:emsenn", "predicate": "current-session",   "object": "session:<id>",         "value": "True"}
{"subject": "boundary:emsenn", "predicate": "viewing-cell",      "object": "cell:<id>",            "value": "True"}
```

The attention fiber is volatile-tier or implicit-tier (per [process/session-as-process.md](../process/session-as-process.md) §2); it changes on every shell focus, every channel-join, every cell-open.
It is the projection that drives notification routing and dispatch fairness.

### 2.4 History fiber — *what have they done*

The history fiber is the projection that answers "what events has this boundary authored?".
It is a derived projection over the event log.

```json
{"subject": "boundary:emsenn", "predicate": "authored-event", "object": "event:<sha256>", "value": "True"}
```

The history fiber is materialised lazily from the event log by filtering events whose signature-resolved boundary equals the queried boundary.
It is the projection consulted by `witness` and `audit` (per [stdlib/](../stdlib/)).

History is append-only; retraction of an event is itself an authored event.

## 3. The projection operators

Personnel, office, and persona-agent are not independent record kinds.
Each is a **projection operator** that selects a sub-fiber of the boundary at a particular surface.

### 3.1 `personnel` — the legal/social surface

```
personnel(boundary:B) ≔ project(B, surface = "personnel")
```

The personnel projection exposes the boundary's auth fiber under the bulk's legal name and the authz fiber bound to the boundary directly (no acting-as composition).
It is the projection used for personal work and for legal/social accountability.

Personnel projection cells:

```json
{"subject": "boundary:emsenn", "predicate": "personnel-name",  "object": "Morgan Sennhauser",       "value": "True"}
{"subject": "boundary:emsenn", "predicate": "personnel-email", "object": "morgan@example.com",      "value": "True"}
{"subject": "boundary:emsenn", "predicate": "personnel-key",   "object": "ed25519:<base64-pubkey>", "value": "True"}
```

The personnel projection is structurally the auth+authz fiber under the personnel surface.
The slug `personnel:emsenn` resolves to `boundary:emsenn` under the personnel projection.

### 3.2 `office` — the functional surface

```
office(boundary:B, role:R) ≔ project(B, surface = ("office", R))
```

Offices are not properties of the boundary; they are projections that compose with the boundary's authz fiber to produce the office-incumbent's effective authority.
An office is itself a substrate entity (a fuzzy cell with members; per [persona-and-personnel.md](persona-and-personnel.md) §2).
The boundary occupies the office iff `(boundary:B, holds-office, office:R) = t`.

When a boundary acts under an office, the session's authz fiber is the $\odot$-composition `boundary-authz-fiber ⊙ office-authz-fiber`.
The boundary's other projections (personnel, persona) are not loaded.

The slug `office:planner` resolves through the office's `members` predicate to the boundaries currently occupying it.

### 3.3 `persona-agent` — the publication surface

```
persona(boundary:B, name:P) ≔ project(B, surface = ("persona", P))
```

A persona-agent is a projection whose auth fiber is the persona's own keypair, whose authz fiber is the persona's bounded capability set, and whose history fiber records events under the persona's signature only — never under the operating boundary's signature.

The persona-agent is itself a substrate entity (a content commitment by the captain — Cassia, Calder, Josh — distinct from any personnel).
The operating boundary is connected via `(boundary:B, operates-persona, persona:P) = t`.
That cell is the *only* link between the persona's surface and the operating boundary, and it is gated by the privacy projection (§5).

The slug `persona:cassia-lorne` resolves to its own auth/authz/history fibers; the operating boundary is reachable only by privileged projection.

### 3.4 Composition

```
project(B, surface₁ ∘ surface₂) = project(project(B, surface₁), surface₂)
```

Projections compose.
Personnel-acting-as-office is a two-step projection: first to the personnel surface (auth bound to personnel keypair), then to the office surface (authz extended by office grants).
Personnel-operating-persona is a two-step projection: first to the personnel surface (boundary recognised), then to the persona surface (auth and authz rebased to the persona).

Composition is not commutative: `personnel ∘ persona` ≠ `persona ∘ personnel`.
The session-open spec (§4) fixes the order.

## 4. Composition when sessions cross boundaries

A session is opened by a boundary acting through some projection.
The session-record names:

| Field | Meaning |
|---|---|
| `boundary` | The opening boundary slug. |
| `acting-as` | The projection surface (`personnel`, `office:R`, `persona:P`). Empty acting-as ≡ personnel projection. |
| `capability-fiber-hash` | Hash of the projected authz fiber after composition. |
| `at-stratum` | Optional stratum projection (`asserted` / `saturated` / `settled`); per [capability-model.md](capability-model.md) §3a. ``null`` ≡ stratum-agnostic — the legacy v0.2-pre default; payload writes are treated as `asserted`. |

**The at-stratum projection.** A session may open with an `at-stratum` declaration to scope the session's authz fiber onto the corresponding per-stratum capability sub-fiber.
The canonical case is a retraction session: a sender opening at `at-stratum: "saturated"` is declaring their respond will act on the saturated sub-fiber (typically retracting a derived cell).
The substrate's $\Box_R$ gate projects onto the matching sub-fiber per [capability-model.md](capability-model.md) §3a; denial at the projected stratum is `PCC_AUTHZ_DENIED`.

The at-stratum projection composes with the other projections after acting-as: `project(B, acting-as ∘ at-stratum)`.
A boundary's saturated authority through one office is independent of its asserted authority through another; the substrate does not unify them.
This preserves the non-amplification discipline of §3.4 across the per-stratum projection.

Cross-boundary composition rules:

1. **Single-boundary session.** A session opened by one boundary projects exactly one acting-as.
  The session's authz fiber is `boundary-authz ⊙ acting-as-authz`, bounded by $\Rightarrow$ against the opening sender's authority.

2. **Boundary-crossing dispatch.** When a respond from session A targets session B, the dispatched payload is bounded by A's authz fiber via $\Rightarrow$ before reaching B.
  B's session never sees A's raw payload, only the projection of A's payload through A's authority.
  This is the substrate's analogue of `setuid` being forbidden: A cannot escalate B beyond A's own authority.

3. **Federation receive.** When a peer boundary's signed event arrives, the local substrate projects the peer boundary through the federation-trust scope (per [federation-trust.md](federation-trust.md)).
  The peer's effective authz fiber on the local substrate is `peer-boundary-authz ⊙ federation-trust-fiber`, bounded by $\Rightarrow$.
  Cross-peer impersonation is structurally impossible: the peer boundary cannot project through any local-personnel surface.

4. **Operator switching.** A boundary may close one session under acting-as `office:planner` and open another under acting-as `persona:cassia-lorne`.
  The two sessions share the same boundary but project different fibers; the substrate composes nothing across them at session-open.
  Cross-session composition only occurs via explicit dispatch.

## 5. The privacy projection

Personnel attribution does not leak from the persona surface.
This is structural, not enforced:

- The persona projection's auth fiber publishes the persona's public key, not the operating boundary's.
- The persona projection's history fiber records events signed by the persona key only.
- The `(boundary:B, operates-persona, persona:P)` cell is in the substrate (the operating-boundary's sub-fiber), but it is not reachable from the persona's projection without a `privileged-cross-projection` capability.
- A federation peer with `scope:public` receives only persona-projection cells when fetching `(persona:P, *, *)`; the operating-boundary cells are not in the projection's image.

Formally: the persona projection is a quotient — multiple boundaries operating the same persona project to identical persona-cells, indistinguishable to a downstream consumer without the privileged cross-projection capability.
This is the substrate's analogue of pseudonymity by construction.

The same discipline applies in the other direction: a boundary's office projection does not leak the boundary's other office memberships unless explicitly composed.
An audit of `office:planner` returns only office-incumbents and office-authored events; it does not enumerate the incumbents' personal lives.

## 6. The boundary lifecycle

A boundary is created when a bulk first relates to the substrate.
Onboarding is the establishment of fibers: minimal auth (one credential), minimal authz (no capabilities yet), empty attention, empty history.
As the bulk relates more — gains delegated capability, joins channels, authors events — the boundary's fibers grow.

A boundary is never deleted; retiring a bulk's relation to the substrate is a `(boundary:B, active, False)` cell.
The boundary's history fiber remains; the auth fiber is rejected at session-open after retirement.

A boundary may *develop* new projections over time: a personnel-only boundary may begin operating a persona; an office-incumbent boundary may add another office.
Projection development is a substrate edit, not a structural change to the boundary.

### 6.1. v0.1 personnel → v0.2 boundary migration

Substrates that began life under v0.1 emitted `personnel:<slug>` records as the legal/social surface directly. v0.2 promotes those records to boundary entities under this spec; the natural transformation is implemented as a Phase 3 boot routine — see [boot-sequence.md §4.0](../init-boot/boot-sequence.md) and [pt-08](../../tasks/engineering/pt-08-personnel-to-boundary-migration.md).
The migration is one-shot, idempotent, and pins a `migrated-with-scheme:<version>` predicate so a later boot under an incompatible scheme version raises `PCB_BOUNDARY_SCHEME_DIVERGED` (per §7) rather than silently re-deriving.
The read-side companion `personnel_migration.legacy_view(boundary_slug=...)
` reconstructs the pre-migration personnel-record shape from a migrated boundary for v0.1-vocabulary call sites.

## 7. Errors

| Code | Meaning |
|---|---|
| `PCB_BOUNDARY_NOT_FOUND` | Referenced boundary slug isn't a substrate entity. |
| `PCB_BOUNDARY_INACTIVE` | Boundary's `active` predicate is `False`; auth rejected. |
| `PCB_PROJECTION_UNKNOWN` | Requested projection surface isn't a known operator. |
| `PCB_PROJECTION_NOT_AUTHORISED` | Boundary doesn't carry the projection-cell for the requested surface (e.g., requested `acting-as: office:planner` but `holds-office` is false). |
| `PCB_PRIVACY_PROJECTION_VIOLATION` | An attempt to read the operating-boundary from a persona projection without the privileged cross-projection capability. |
| `PCB_BOUNDARY_COMPOSITION_AMPLIFIES` | A composition step would extend authority beyond the boundary's authz fiber; rejected by $\Rightarrow$. |
| `PCB_BOUNDARY_SCHEME_DIVERGED` | A re-boot found a migrated personnel record whose recorded `migrated-with-scheme:<version>` disagrees with the current code's `BOUNDARY_SCHEME_VERSION`; the migration cannot be replayed bit-identically and boot transitions to `degraded`. See §6.1. |

## 8. Implementation

### Python (v0.2+)

- `Boundary` is a pydantic model: `slug`, `introduced_at_ord`, `active`.
- The four projections are functions in `substrate/boundary.py`: `project_auth(boundary)`, `project_authz(boundary)`, `project_attention(boundary)`, `project_history(boundary)`.
  Each returns a fiber.
- The projection operators (`personnel`, `office`, `persona`) are functions that accept a boundary and a surface argument; they compose sub-fibers per §3.
- Session-open consults the projection operator named in `acting-as` and composes per §4.
- The privacy projection is enforced by the substrate's $\Rightarrow$ at projection-read time — no separate "privacy filter" layer.

### Rust (v0.2+)

- `Boundary` is a serde-derived struct with the same shape.
- Projection operators are trait implementations on `Boundary`: `Personnel`, `Office`, `Persona`.
- Composition uses the same $\odot$ / $\Rightarrow$ algebra ports from `mash-engine`.

## 9. Conformance

Boundary discipline passes:

1. **Boundary recognition.** A signed event from a boundary's `auth-method` key resolves to that boundary; the same event signed by an unknown key fails with `PCB_BOUNDARY_NOT_FOUND`.
2. **Projection composition.** A session opened by `boundary:emsenn` acting-as `office:planner` has authz fiber = `boundary-authz ⊙ office-authz`; assert known cells reachable / not reachable.
3. **Persona privacy.** `(persona:cassia-lorne, *, *)` projection contains no `operates-persona` reverse-link cells.
  Reading the operating boundary requires the `privileged-cross-projection` capability or returns `PCB_PRIVACY_PROJECTION_VIOLATION`.
4. **Cross-boundary dispatch.** Session A's payload to session B is bounded by A's authz fiber via $\Rightarrow$; assert B receives the projected payload, not the raw one.
5. **Boundary composition.** Two boundaries' independently-authored events on the same target compose via $\odot$ per the substrate algebra; mutual disagreement produces $\top$ at the cell level (boundaries do not vote — they assert).
6. **Cross-language equivalence.** Same boundary state + same session-open + same payload → same effective authz fiber and same dispatch outcome in Python and Rust.

## 10. Plan 9 / Unix analogue

| Unix concept | Boundary analogue |
|---|---|
| `/etc/passwd` entry | Boundary record (`kind: boundary`) |
| UID | Boundary slug |
| Real UID vs effective UID | Boundary vs acting-as projection |
| `getuid()` | `session.boundary` |
| `geteuid()` | `session.acting-as` resolved to the projected authz fiber |
| `setuid` | Forbidden — would amplify across projection composition; substrate forbids by $\Rightarrow$ |
| `sudo` | Office projection composition |
| Anonymous user | A persona projection with empty operating-boundary or `nobody`-equivalent boundary |
| Service account | A boundary whose only operating mechanism is automation |
| `/etc/group` | Office records (the office's `members` predicate) |
| `whoami` | The session's boundary slug |
| `id` | The full projection: boundary + acting-as + composed authz fiber |

The boundary model is structurally stronger than `/etc/passwd`: the bulk is never modelled, only the boundary; identity is what the bulk *does* through the boundary, not what the substrate *records about* the bulk.
This is the substrate's privacy and accountability discipline at the algebra layer.
