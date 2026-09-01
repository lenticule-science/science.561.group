---
type: theorem
class: engineering-claim
status: sketch
depends-on: [settlement-determinism, independence-implies-confluence, closure-rule-wire-format-canonicalization, hash-injectivity-under-canonical-form, witness-chain-as-proof-object, closure-rule-system, closure-rule-record]
math-depends-on: [canonical-firing-trajectory-via-lex-order]
see-also: [cross-peer-trajectory-ordering-is-content-addressed, witness-lifecycle-trajectory-is-regime-conditional-federation-content, determinism-via-fiber-functoriality]
---

# Repair-log byte-canonicality via lexicographic firing order

**Claim.** A predication substrate that processes a `respond` invocation under the lex-canonical firing discipline — worklist sorted by `(closure-rule-record.priority, closure-rule-record.id)`, bind-assignments enumerated in lexicographic order on the canonicalised bind-variable tuple, firing-cache keyed by the SHA-256 of the canonical $(rule, assignment)$ pair — produces a *byte-identical* repair log on every replay against byte-identical inputs and substrate state. The repair log's entries, their order, their per-entry pre/post canonical hashes, and the per-entry fuel counts are all functions of `(event log, closure-rule system, input payload)` alone.

This is the trajectory-side strengthening of [settlement-determinism](settlement-determinism.md) (which gives endpoint-equality of settled state) into endpoint-and-path-equality of the substrate's audit record.

## Why this holds

**Part 1 — the math gives a canonical trajectory.** Per [canonical-firing-trajectory-via-lex-order](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/canonical-firing-trajectory-via-lex-order.md), the lex order on $(\mathrm{priority}, \mathrm{id}, \mathrm{lex}(\vec{y}))$ selects a unique sequence of $(r, \vec{y})$ firing-pairs whose composite reaches the closure fixed point. Two substrates with the same `(event log, closure-rule system)` execute the same firing sequence in the same order.

**Part 2 — each firing produces a unique repair-log entry.** A repair-log entry records `(rule.id, bind-assignment, pre-hash, post-hash, fuel-decrement)`. Per [closure-rule-wire-format-canonicalization](closure-rule-wire-format-canonicalization.md), the rule's canonical bytes are deterministic; the bind-assignment is canonicalised under the same slug-tuple discipline used for the lex key; and per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md) the pre/post hashes are deterministic functions of the canonical fiber slice content. Fuel decrement is a pure integer subtraction. Each field is therefore byte-determined.

**Part 3 — entry ordering is the firing-trajectory ordering.** The repair log's append-only discipline (per [`closure-engine-internals`](../../../../../../../../operations/engineering/tools/predication-computer/pypredcomp/docs/dev/specs/kernel/closure-engine-internals.md) §3.2 step 4) records each firing in execution order. Combined with Part 1, this means the log's entry sequence is the lex-canonical firing trajectory.

**Part 4 — invariant-evaluation entries are similarly canonical.** Per the dev spec's §3.6, the substrate's invariant catalogue is evaluated per layer in a fixed order (kebab-case `id` ascending). Repair-recipe applications append further entries in that same fixed order. The invariant pass therefore extends the lex-canonical sequence with a deterministic suffix per layer.

**Part 5 — the hash chain through the log is determined by Parts 2 and 3.** Each repair-log entry's `after_hash` becomes the next entry's `before_hash` (the per-cell merge target). Since the entry sequence is canonical (Part 3) and each entry's content is canonical (Part 2), the hash chain is byte-determined.

The conjunction of Parts 1–5 establishes the claim: the repair log is a deterministic function of `(event log, closure-rule system, input payload)`.

## Engineering consequence

- **Replay-equivalence as bit-equality.** An auditor replaying a `respond` invocation on a duplicate substrate reads back the same bytes in the same positions in the repair log. Trace divergence at any byte is a determinism violation — either the substrate's lex discipline is broken, the canonicalisation is non-deterministic, or the firing-cache is mis-populated.
- **Federation receivers can verify trajectory locally.** Per [witness-lifecycle-trajectory-is-regime-conditional-federation-content](witness-lifecycle-trajectory-is-regime-conditional-federation-content.md), in the transfinite-bounded and aperiodic regimes the trajectory is shipped as substrate content. A receiver re-runs the lex-canonical trajectory on the received increment-sequence and verifies the resulting repair log matches the sender's byte-for-byte. Disagreement is a federation-conformance fault, not a transport fault.
- **Cache key structure is forced.** The firing-cache key is the SHA-256 of the canonical $(rule, assignment)$ pair, not of the post-merge fiber. This is because the cache must reject re-firing the same conclusion-derivation regardless of whether the conclusion's value happens to be reached by another route; the canonical-trajectory theorem requires per-firing skip-stability, not per-conclusion skip-stability.
- **Out-of-band trajectory hints are forbidden.** A substrate that consults a "hint cache" or "JIT firing reorder" at runtime and uses the result to advance the worklist non-lexicographically has departed from the lex-canonical trajectory and produces a different repair log byte-for-byte. The substrate is non-conformant; a "hint-aware" substrate must be specified as a different rule-system entirely.

## What the theorem rules out

- **Repair-log entry ordering by host-thread arrival.** A multi-threaded substrate that appends repair-log entries in worker-thread-completion order produces a non-deterministic log even if the firing set is correct.
- **Bind-assignment iteration in hash-key order.** A naive implementation that iterates bind-assignments using a hash-keyed dict's enumeration order observes the dict's iteration order, which is implementation-defined. The discipline is lex over the canonicalised slug-tuple, evaluated per assignment, then admitted to the worklist in lex order.
- **Per-rule fuel decrement out of step with the firing.** A substrate that batches fuel decrements (decrement once per layer per rule) and emits a single fuel-tracking entry per layer breaks Part 2: the per-firing entries no longer record the firing's actual fuel cost. The discipline is per-firing fuel decrement, recorded in the entry that emitted the firing.
- **Cache eviction during a single `respond`.** The firing-cache is local to the invocation per the dev spec's §3.1. Evicting from the cache mid-invocation can re-admit a previously-fired pair, breaking Part 1's skip-stability. Eviction is permitted only across invocations.

## What the theorem requires

- The substrate honours [canonical-firing-trajectory-via-lex-order](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/canonical-firing-trajectory-via-lex-order.md) — that is, the lex-canonical firing discipline at the worklist level.
- Each [closure-rule-record](../objects/closure-rule-record.md) carries a stable `priority` integer and a unique kebab-case `id`.
- The substrate's bind-assignment canonicalisation is the same function across calls (typically: sort variable names ascending, list bound values in that variable order, encode each value in canonical JSON).
- Per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), pre/post hashes are SHA-256 of canonical-form bytes.
- The firing-cache is invocation-local and content-keyed, evicted only at invocation boundaries.

## Position

This theorem completes the substrate's *trajectory determinism contract*. The existing chain — [settlement-determinism](settlement-determinism.md) (endpoint determinism), [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md) (content-as-identity), [witness-chain-as-proof-object](witness-chain-as-proof-object.md) (chain encodes the derivation) — guaranteed that two substrates produce the same settled fiber and the same hash for it. This theorem adds: they also produce the same *path* to it, byte-for-byte.

The trajectory-determinism contract is what makes the dev spec's §4 ("byte-identical repair log") a structural property of the substrate rather than a coincidence of implementation. It is the engineering surface a conformance auditor cites when checking that two `respond` runs on the same input produce indistinguishable audit records, and it is the property federation peers verify when shipping trajectory across a transfinite-bounded boundary per [witness-lifecycle-trajectory-is-regime-conditional-federation-content](witness-lifecycle-trajectory-is-regime-conditional-federation-content.md).

`status: sketch` mirrors the math entry: the layer-respect property of the canonical trajectory is at proof-sketch level on the math side, and the engineering-side proof inherits that status until the math is tightened.
