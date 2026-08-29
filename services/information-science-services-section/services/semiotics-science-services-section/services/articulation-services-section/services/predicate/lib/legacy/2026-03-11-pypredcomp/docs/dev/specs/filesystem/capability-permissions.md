---
title: "Capability permissions"
description: "Per-cell capability cells. Who can read/write/retract a cell. Enforced via $\\Rightarrow$."
kind: spec
status: normative
version: "0.2"
---

# Capability permissions

The OS doesn't have rwx permissions; it has capability cells.
Per [security/capability-model.md](../security/capability-model.md), every operation goes through capability fiber composition via $\Rightarrow$.

## 1. Per-cell scope

A cell's effective capability scope is computed from:

- The capability cells naming the cell's subject.
- The capability cells naming the cell's predicate.
- The capability cells naming the cell's object.

Composition: the most restrictive of the three.

## 2. Default permissions

By default, a cell:

- Authoring personnel: full read/write/retract.
- Office members (when the cell touches an office's predicate): read/write per office grants.
- Persona-agents (when the cell touches a persona's predicate): read/write per persona's authority.
- Other personnel: read-only by default.

## 3. Restricting access

Captain may restrict:

```json
{
  "subject": "capability:read-restricted-cell:<id>",
  "predicate": "grants",
  "object": "{\"predicate\": \"read\", \"target-pattern\": \"cell:<id>\"}",
  "value": "True"
}
{
  "subject": "capability:read-restricted-cell:<id>",
  "predicate": "holder",
  "object": "personnel:emsenn",
  "value": "True"
}
```

Now only personnel:emsenn can read that cell.

## 4. Encryption

For cells that should be read-only-by-holder even at the substrate level, use encryption-region cells per `predicated-computing/concepts/encryption`.

## 5. Conformance

Capability permissions pass:

1. Default access works (authoring personnel can read/write own cells).
2. Restrictions enforced; unauthorized access rejected.
3. Encryption-region cells require decryption capability.

## 6. v0.2a action-capability vocabulary

Per-cell capability fibers (§1) are the v0.4 federation slice's target.
Until the full $\Rightarrow$ machinery from [security/capability-model.md](../security/capability-model.md) §3 is wired against per-cell capability cells, the v0.2a slice ships a narrower discipline: every binary-cell-emission site that authors substrate state on behalf of a session checks the sender's capability list against an **action-capability slug** drawn from the following vocabulary, raising [security/capability-model.md](../security/capability-model.md) §8's `PCA_SCOPE_INSUFFICIENT` when the sender's grants do not cover the needed slug.

### 6.1 Vocabulary

The v0.2a action capabilities all share the prefix `signal:` — matching the existing `signal:session-message:<msg-type>` discipline in [process/session-messaging.md](../process/session-messaging.md):

| Slug | Gates | Spec callsite |
|---|---|---|
| `signal:session-message:<msg-type>` | `send_message(...)` | `process/session-messaging.md` §3 |
| `signal:session-scope:set` | `set_current_scope(...)` | `paths-and-resolution.md` §3 |
| `signal:mount:attach` | `attach_mount(...)` | `mount-points.md` §1 |
| `signal:mount:detach` | `detach_mount(...)` | `mount-points.md` §1 |
| `signal:snapshot:record` | `record_snapshot(...)` | `snapshots.md` §6 |

Per [security/capability-model.md](../security/capability-model.md) §6 ("Common capability vocabularies"), additional substrate, driver, and federation surfaces extend this table as their slices land.
The single shared check function is `security.capabilities.require_capability(session, needed)` — every gate calls it with the slug from this table.

### 6.2 Wildcard discipline

The `signal:*` super-grant from [security/capability-model.md](../security/capability-model.md) §3 is the trailing-token wildcard case of a uniform rule: a held grant matches a needed slug iff it is exactly equal OR its trailing token is `*` and its preceding `:`-separated tokens are a prefix of the needed slug's tokens.
Equivalently:

- `signal:mount:attach` is matched by `signal:mount:attach`, `signal:mount:*`, and `signal:*`.
- `signal:mount:*` is **not** matched by `signal:mount-x:attach` — the wildcard is token-aligned, not character-prefix.
- An interior `*` (e.g. `signal:*:attach`) is treated as the literal token `*`, not a glob — operators write the explicit suffix.

This is the same algebra `_capability_check` in `process/session_messaging.py` originally inlined; v0.2a hoists it into `security.capabilities.grants(...)
` so every gate composes against one canonical wildcard semantics.

### 6.3 Gate ordering invariant

The capability check is gate 4 of [binary-cell-emission.md](../kernel/binary-cell-emission.md) §2 and runs **after** session-open (gate 1: `require_open`) and **before** ord-stamp (gate 5).
A denied call therefore advances neither the event log nor any fiber — the partial repair log records the denied capability, the holder's owner, and the session slug for audit, with no on-disk side-effect to undo.

### 6.4 Default capability fibers

Per [security/capability-model.md](../security/capability-model.md) §7, default fibers per role (in `init_boot/bootstrap_users.py`'s `ROLE_CAPABILITIES`):

- `admin` carries `signal:*` (every action capability defined now or later).
- `member` carries `signal:session-scope:set` and `signal:session-message:*` — enough to drive their own session via the REPL and message other sessions.
- `observer` carries no `signal:*` capabilities — read-only sessions cannot author substrate state.

Deployments override per user via the manifest entry's `capabilities` field, which is unioned with the role default.

### 6.5 Namespace-participation surfaces

Some surfaces are gated by *participation in a namespace* rather than by a specific needed slug — concretely, reading one's own inbox and marking a message read in `process/session-messaging.md` (the call carries no msg-type, so "do you hold THIS cap?" is the wrong question).
The participation check asks: does the session hold any grant under `signal:session-message:` (a specific cap, the action-wildcard `signal:session-message:*`, or the super-grant `signal:*`)?

The shared helper is `security.capabilities.has_any_in_namespace(holder_caps, namespace)`.
It uses the same token-aligned wildcard algebra as `grants(...)
` in §6.2; only the question changes — `grants` checks "does any held cap COVER the needed slug?", `has_any_in_namespace` checks "does any held cap LIE WITHIN OR ABOVE the namespace?".
A held wildcard `signal:*` qualifies (it covers the namespace from above); a held specific `signal:session-message:cmd` qualifies (it lies beneath); a held `shell:*` does not.

The participation-failure code is the same `PCA_SCOPE_INSUFFICIENT` as the per-cap check, with `session` and `action` (rather than `needed` / `sender` / `owner`) on the partial repair log to distinguish the surface.

### 6.6 Conformance gates

In addition to §5 above:

4. A session whose capability list does not cover the needed slug raises `PCA_SCOPE_INSUFFICIENT` at every gated callsite, with `needed`, `sender`, and `owner` populated on the partial repair log.
5. The wildcard discipline in §6.2 is enforced by `security.capabilities.grants(...)
  `: token-aligned, trailing-`*` only, no character-prefix matching.
6. A denied call advances neither the event log nor any fiber (gate-ordering invariant: the cap-check runs before ord-stamp).
7. The five `signal:` slugs in §6.1 are the **only** v0.2a action capabilities; new substrate surfaces add a row to the table when their slice lands.
  The default capability fibers in §6.4 reflect the full table.
8. Namespace-participation surfaces (§6.5) admit a session iff `has_any_in_namespace(...)
  ` returns `True` — and the same token-aligned wildcard algebra governs admission as governs the per-cap `grants(...)
  ` check, so there is one canonical capability semantics across every gated surface.
