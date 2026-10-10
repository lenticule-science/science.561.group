---
title: "Should respond grow a binary-cell mode?"
description: "v0.2 admits binary-cell emission as a sibling primitive (per specs/kernel/binary-cell-emission.md) reconciled with single-respond-primitive. v0.3+ could absorb binary-cell emission into respond's payload schema. Should it?"
kind: question
date: "2026-05-02"
status: resolved-by-default
disposition-default: defer-to-v0.3
resolved: 2026-05-03
resolved-as: "Ratify default — defer to v0.3 unification."
resolved-by: "agent (captain directive 2026-05-03 to accept defer-defaults rather than re-litigate)"
---

> **Resolved 2026-05-03 (default ratified).** The defer-to-v0.3 > disposition stands. v0.2 keeps the binary-cell sibling primitive; > the v0.3 plan absorbs it into a unified `respond` payload schema > (predicates: + binary-edges:) at the time the unification is > needed by app work.
Single-mutation-primitive doctrine is the > right north star (cf. Redux dispatch, git plumbing).
Captain > may overrule before v0.3. ---


## Question

[decisions/single-respond-primitive.md](../decisions/single-respond-primitive.md) commits the substrate to one mutation entry point: `respond(target, payload, sender?)
`. v0.2's binary-cell-emission path (`send_message`, `mark_read`, etc.) is a **sibling primitive** — it shares `StorageLayout` and `EventLog` but does not go through `respond`'s Phase 2 payload-to-fiber translation, because that translation is unary-only.
See [specs/kernel/binary-cell-emission.md](../specs/kernel/binary-cell-emission.md) for the v0.2 reconciliation.

For v0.3, should `respond`'s payload schema be extended to absorb binary-cell emission, eliminating the sibling primitive?

```
# Today (v0.2):
respond(target, payload={pred: value, ...})         # unary
send_message(from, to, type, content)               # binary, sibling

# Proposed (v0.3?):
respond(target, payload={
  predicates: {pred: value, ...},                   # unary
  binary_cells: [{p, o, v}, ...]                    # binary (new)
})
```

## Why this is a real question, not a foregone conclusion

Three pulls in different directions:

**Pull toward absorption (one primitive):**

- Honours [decisions/single-respond-primitive.md](../decisions/single-respond-primitive.md) more literally — *every* mutation goes through `respond`.
- Simplifies surface auditability — one entry point is one $\Box_R$ surface, not two.
- Federation receive can use one wire shape for unary and binary cells.
- Closure rules that produce binary outputs (a future capability) can fire through `respond` rather than needing a special path.

**Pull toward keeping the sibling (status quo):**

- Avoids destabilising every higher-level surface.
  MCP `set`, HTTP `POST /respond`, federation `merge_peer_fiber`, dispatch — all currently understand a unary payload schema.
  Extending the schema requires updating every surface, every test, every fixture.
- Binary-cell emission semantically *is* different — it has no σ/Δ closure passes, no fiber settling, no repair-log accretion.
  Forcing it through `respond` either (a) makes `respond` Phase 3 conditional on payload shape (if binary, skip closure), losing the "respond is one thing" simplicity, or (b) runs no-op closure passes against binary cells, wasting fuel.
- The sibling primitive *already* honours the audit and storage discipline (per [specs/kernel/binary-cell-emission.md](../specs/kernel/binary-cell-emission.md) §6 conformance gates), so the audit-uniformity argument is weaker than it appears.

**Pull toward a third path:**

- Refactor `respond`'s payload schema to be *value-typed* — unary cells are values of type `UnaryPredicate`, binary cells of type `BinaryCell`, and `respond` dispatches by type.
  Avoids both the schema-extension cost and the sibling-primitive split.
- This is conceptually cleaner but requires the most surface work and risks under-specifying the type discipline.

## What would resolve it

A captain decision after at least one of:

1. v0.3 introduces a closure rule that produces binary outputs (forces the issue).
2. A federation use case requires sending binary cells across a peer with a uniform wire shape (forces uniformity).
3. A surface audit reveals the sibling primitive bypasses some discipline that `respond` enforces (forces consolidation).

If none of (1)–(3) materialise by v0.4, default disposition: keep the sibling, amend [decisions/single-respond-primitive.md](../decisions/single-respond-primitive.md) to explicitly name binary-cell emission as the bounded exception.

## Stakes

**Low** if the v0.2 sibling-primitive discipline holds (per [specs/kernel/binary-cell-emission.md](../specs/kernel/binary-cell-emission.md) §6) — the discipline already covers storage, capability gating, event-log, replay determinism.
The "exception" is well-bounded.

**Medium** if a future closure rule needs to produce binary outputs — at that point the sibling primitive becomes a real bottleneck and consolidation is forced.

**Low** if v0.3 federation receives binary cells — the receive path already calls `send_message`-shaped logic; uniformity at the wire is a v0.4 federation-protocol-stub concern.

## Cross-references

- [decisions/single-respond-primitive.md](../decisions/single-respond-primitive.md) — the decision this question explores the boundary of.
- [specs/kernel/binary-cell-emission.md](../specs/kernel/binary-cell-emission.md) — the v0.2 sibling-primitive spec.
- [specs/process/inter-session-messaging.md](../specs/process/inter-session-messaging.md) — the canonical binary-cell-authoring use case.
- [decisions/decision-precedence.md](../decisions/decision-precedence.md) — the resolution would be settled-content class (it constrains what `respond`'s payload accepts).
