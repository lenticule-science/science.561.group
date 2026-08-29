---
title: "Network specs deferred until implementer named"
description: "Federation-protocol, peer-trust, mTLS-handshake, and other v0.4 network-layer specs are deferred to write-time pre-implementation rather than authored eagerly during v0.2 dev-doc work. The risk of writing a wire format the implementer then has to reverse-engineer to fit reality is too high; a one-paragraph stub plus the grounding citations is the v0.2 commitment."
kind: decision
date: "2026-05-02"
status: committed
class: convenience
---

# Network specs deferred until implementer named

## What

The substrate's v0.2 dev-docs deliberately **do not** author the full v0.4+ network-layer specs (federation-protocol wire format, peer-trust handshake, mTLS configuration, federation-rate-limit policy, etc.).
The decision is to ship one-paragraph **stubs** at the spec paths the higher-level decisions reference, naming the wire-format problem and citing the grounding decisions, but to defer the full spec to the milestone in which the implementing developer is named.

A network spec is "ready to author" when:

1. The implementing developer (Rust kernel author, Python kernel author, or both) is named for the milestone.
2. The captain has confirmed the regime and federation-rate envelope for the deployment.
3. At least one *real* deployment is identified that will exercise the spec at delivery (not "a future deployment may want this").

Until those three conditions hold, the network spec is a stub:

```markdown
---
title: "Federation protocol (stub)"
description: "v0.4 stub. Full spec deferred per decisions/network-spec-defer-until-implementer-named.md."
kind: spec
status: stub
version: "0.2-stub"
---

# Federation protocol (stub)

This spec is deferred. The wire format will be authored in v0.4 when the implementer is named.

## Grounded in

- [decisions/federation-by-construction](../../decisions/federation-by-construction.md)
- [decisions/cost-is-lawvere-quantale](../../decisions/cost-is-lawvere-quantale.md) §"Federation cost"
- [`predicated-computing/theorems/federation-path-metrics-multiplicative`](...)

## Conformance

Stub specs do not pass conformance gates. Higher-level specs that cite this stub MUST cite the grounding theorems directly until the full spec is written.
```

The stub serves three purposes: (1) it prevents broken markdown links from higher-level specs that already reference the path; (2) it documents the decision to defer; (3) it lists the grounding the eventual full spec will need to cite.

## Why

v0.2's dev-doc overhaul tempted us to write the v0.4 federation-protocol spec, the v0.5 multi-region failover spec, and the v0.6 cross-substrate-bridge spec — they are *near* in the spec tree and the math is settled (federation-by-construction, cost-quantale).
But:

- **Wire formats live and die by their first implementer.** A wire format authored in advance of implementation routinely needs revision when the implementer hits real-world constraints (TLS library mismatch, JSON streaming pathology, peer-clock skew).
  The captain's pattern across past projects is that pre-implementation wire specs get rewritten 30–50% on first implementation.
- **The grounding decisions are stable.** federation-by-construction and cost-is-lawvere-quantale settle the *algebra*; the wire format is the algebra's serialisation.
  The algebra does not need the wire format to be settled to be useful (higher-level specs cite the algebra directly).
- **The captain's authoring time is expensive.** The five-hour cost of writing a draft federation-protocol spec that gets ~half-rewritten in v0.4 is better spent on v0.2 specs that go into immediate use.
- **Stubs prevent link rot.** A higher-level spec saying "see federation-protocol.md" against a missing file is broken markdown; a stub says "deferred, see grounding" and stays valid.

The deferral discipline applies specifically to **network-layer wire formats**, not to all forward-looking specs.
Forward-looking *algebra* specs (multi-regime-session, projection-naturality) are written now because they ground higher-level decisions.
Forward-looking *wire formats* are deferred because they don't ground anything; they realise.

## What it rules out

- **Authoring full network wire-format specs in v0.2 without an identified implementer.** The implementer's input on TLS library, JSON streaming approach, peer-clock-skew tolerance, and timeout policy is load-bearing on the spec.
- **Implementing against a stub.** A v0.4 implementer who needs the federation wire format must convert the stub to a full spec first; implementing against a one-paragraph stub is non-conformant.
- **Citing a stub spec as authoritative for conformance.** A conformance gate that says "honours the federation-protocol.md wire shape" is non-conformant if `federation-protocol.md` is a stub.
- **Removing the stub.** Once a stub exists at a path, it stays until replaced by the full spec (so higher-level cross-references continue to resolve).

## What it does not constrain

- **Forward-looking algebra specs.** Specs that record substrate algebra commitments (multi-regime-session, projection-naturality, fuel-composition, inconsistency-repair) are written eagerly even when their implementation is v0.4+; the deferral applies only to wire formats.
- **The list of stubs to ship in v0.2.** v0.2 ships stubs for the network paths the higher-level specs already reference; new stubs are added when new higher-level references appear.
- **The eventual wire format choice.** This decision says when to write; it does not constrain what to write (HTTP/2 long-poll, gRPC, MQTT, custom binary — the implementer chooses, the captain approves).
- **The stub's exact prose.** The §"What" example is a template; stubs may add more grounding citations or scope notes as needed.
- **Whether stubs can graduate to "draft" before "normative."** A stub may become a draft spec authored by the implementer-to-be before it becomes normative; the lifecycle stub → draft → normative is permitted.

## Cross-references

- [decisions/federation-by-construction](federation-by-construction.md) — the algebra-layer commitment whose wire format this defers.
- [decisions/decision-precedence.md](decision-precedence.md) — this decision is convenience-class; its primary force is captain authoring discipline, not substrate behaviour.
- v0.2 stub specs: `network/federation-protocol.md`, `network/peer-trust.md`, `network/mtls-handshake.md`, `network/federation-rate-limit.md` (each shipping per this decision).
