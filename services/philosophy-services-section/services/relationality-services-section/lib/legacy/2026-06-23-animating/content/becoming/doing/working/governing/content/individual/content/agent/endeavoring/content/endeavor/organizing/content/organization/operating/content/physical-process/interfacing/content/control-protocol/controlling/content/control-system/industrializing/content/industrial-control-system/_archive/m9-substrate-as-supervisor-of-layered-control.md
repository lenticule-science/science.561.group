---
title: "M9 — Substrate-Precheck for High-Stakes Operations (Embodied Control as First Specialization)"
type: milestone
campaign: ship-pyfars-autonomous-loop
status: planning
horizon: captured
depends-on: [m8-inbound-participation-mcp-clients]
goals:
  - precheck-records-bind-dispatch-for-any-high-stakes-class
  - safety-shield-verification-as-substrate-precheck
  - control-barrier-function-records-bind-dispatch
  - hamilton-jacobi-reachability-records-as-admission-gate
  - verified-safe-envelope-cells-readable-by-dispatch
  - control-layer-feedback-as-execution-event-class
theory-basis: [llm-swarms-fail-classical-conditions, swarm-vs-orchestration-dichotomy, dispatch-readiness, charter-c5]
cites-objects:
  - pyfars/objects/dispatch-closure-rule-system.md
  - pyfars/objects/anomaly-witness.md
  - pyfars/objects/office-record.md
cites-morphisms:
  - pyfars/morphisms/dispatching.md
  - pyfars/morphisms/witnessing-completion.md
cites-claims:
  - pyfars/claims/substrate-purity.md
backing-gaps:
  - pyfars/objects/precheck-record.md (NOT YET AUTHORED — generic high-stakes precheck-binding cell)
  - pyfars/objects/control-barrier-function-record.md (NOT YET AUTHORED — CBF safe-envelope declaration)
  - pyfars/objects/hj-reachability-record.md (NOT YET AUTHORED — Hamilton-Jacobi reachability-set declaration)
  - pyfars/objects/verified-safe-envelope-cell.md (NOT YET AUTHORED — admission gate cell)
  - pyfars/morphisms/precheck-gating.md (NOT YET AUTHORED — verification-then-admit dispatch wrapper)
acceptance: "A workitem of any high-stakes class — embodied-action-dispatch (drone flight-segment), federation-envelope-emission (cross-host substrate write), budget-significant-agent-invocation (cost > some-cell-threshold), inbound-call-with-side-effect — is admitted by the dispatch graph only after the workitem's declared precheck-record (Control Barrier Function, Hamilton-Jacobi reachability set, budget-quorum, jurisdiction-totality, or other) emits a verified-safe-envelope cell; admission witnesses bind the dispatch to the verified envelope; rejection produces an ultra-vires witness without engaging the downstream layer. Embodied-action is the first specialization to land; non-embodied specializations follow."
---


After [M8](m8-inbound-participation-mcp-clients.md) closes the swarm-participation-handedness framework, M9 makes PyFARS's dispatch graph **precheck-aware**: any high-stakes workitem class can declare a precheck-record (CBF, HJ reachability, budget-quorum, jurisdiction-totality, etc.) that gates admission.
Embodied-action is the first and most theoretically-developed specialization — a workitem dispatched to a drone is admitted only if HJ-reachability and CBF cells show the parameters are within a verified safe envelope. **The same pattern admits non-embodied high-stakes operations.**

This rescope is per the open question [`hj-reachability-and-cbf-as-substrate-precheck-primitive`](../../questions/hj-reachability-and-cbf-as-substrate-precheck-primitive.md), which argues HJ reachability and CBFs are *general-purpose substrate-precheck mathematics*, not drone-specific.
The rescope makes the *precheck primitive* the milestone's center; embodied-control is the first specialization to land because (a) the captain's strategic-deployment-roadmap names the framework explicitly, (b) the upstream theorems concentrate there.
Other specializations — federation-envelope, budget-significant-invocation, accountability-totality — share the precheck-record pattern but use different verification mechanisms.

**The substrate's contribution to the [strategic-deployment-roadmap](../../../../../theories/theories/engineering/theories/tech/theories/computing/theories/artificial-intelligence/theories/agents/texts/strategic-deployment-raodmap-drone-swarms.md)'s three-tiered stack** remains: not the control layer itself, but the governed admission of every action that reaches the control layer. **This is now stated as one specialization** of substrate-precheck, not the milestone's whole content.

## What M9 does NOT claim

Per [`llm-swarms-fail-classical-conditions`](../../../../../theories/theories/engineering/theories/tech/theories/computing/theories/artificial-intelligence/theories/swarm-intelligence/theorems/llm-swarms-fail-classical-conditions.md) and [`swarm-vs-orchestration-dichotomy`](../../../../../theories/theories/engineering/theories/tech/theories/computing/theories/artificial-intelligence/theories/swarm-intelligence/theorems/swarm-vs-orchestration-dichotomy.md): PyFARS is on the orchestrated side of the dichotomy.
M9 does not claim PyFARS *implements* graph Laplacian dynamics, ADMM-style distributed optimization, or MARL-trained policies.
Those layers are *external*; M9 is the substrate's contract with them.

PyFARS-the-substrate sits **above** the control architecture, supervising via authorization gates, not inside it.
The control layer's mathematical guarantees (forward-invariance under GCBF+, etc.) are preconditions M9 reads as substrate cells, not properties M9 produces.

## Implementation status

**Research-actionable, implementation-blocked.** The lower-layer control architecture (Hamilton-Jacobi reachability solvers, GCBF+ runtime, MARL training pipeline) is outside PyFARS's scope.
M9's acceptance is contingent on at least one such lower layer existing in the deployment context.
The captain's [strategic-deployment-roadmap](../../../../../theories/theories/engineering/theories/tech/theories/computing/theories/artificial-intelligence/theories/agents/texts/strategic-deployment-raodmap-drone-swarms.md) names the candidate frameworks; choosing among them is a deployment-time decision M9 doesn't bind.

What M9 binds **now** is the **substrate's API to that layer**: what cells the substrate emits to invite verification, what cells the substrate reads to admit/refuse, what witness shape the audit chain takes.

## Goals

| Slug | One-liner | Status |
|---|---|---|
| `precheck-records-bind-dispatch-for-any-high-stakes-class` | The dispatch graph reads a workitem's declared `precheck-record:` cell; if present, dispatch is gated by the precheck-record's verification | open |
| `safety-shield-verification-as-substrate-precheck` | The embodied-action *specialization*: every workitem of an embodied-action class must produce a verification request to its declared safety-shield framework before the dispatch graph admits it | open |
| `control-barrier-function-records-bind-dispatch` | A `governance/control-barrier-functions/<slug>.md` record declares a CBF's safe-envelope and the workitem-classes it covers; dispatch reads it | open |
| `hamilton-jacobi-reachability-records-as-admission-gate` | A `governance/hamilton-jacobi-reachability/<slug>.md` record declares a 10D reachability set; a workitem whose state-projection falls outside is refused | open |
| `verified-safe-envelope-cells-readable-by-dispatch` | A workitem awaiting verification carries `(workitem, awaiting-verification, true) = T`; verification result lands as `(workitem, verified-safe, true|false) = T` cells | open |
| `control-layer-feedback-as-execution-event-class` | The downstream layer's runtime feedback (a CBF rejection at flight time, a reachability violation, a sensor anomaly, a federation-merge contradiction, a budget-overrun) projects back into substrate execution events of a new class `precheck-rejection` (legacy alias `control-layer-rejection`) | open |

The first goal is the *general* one — `precheck-records-bind-dispatch-for-any-high-stakes-class`.
The remaining four are the *embodied-control specialization* of that general pattern.
Other specializations (federation-envelope precheck via consensus-quorum, accountability-totality precheck per [`accountability-chain-totality-as-m11-audit-invariant`](../../questions/accountability-chain-totality-as-m11-audit-invariant.md), budget-significant-invocation precheck) would land as additional specializations after embodied-control is realized.

## Theoretical shape

**1.
Substrate-purity preserved across embodied dispatch** ([Charter](../../governance/charter.md) C5; substrate-purity discipline).
A workitem dispatched to a drone is *not* a flight command; it is an authorization to initiate. **The substrate stays pure** — workitems, witnesses, cost cells.
The flight is downstream.

**2.
Authority gating extended to physical action** (extends [`office-records-gate-authority`](../goals/office-records-gate-authority.md) from M5).
M5 made offices the authorization gate for in-process work; M8 extended to inbound calls; M9 extends to authorize-physical-action work. **Each extension is the same machinery, larger scope** — offices, jurisdictions, jural-relations.

**3.
Failure-witness propagation across the stack boundary** (extends [`emit-ultra-vires-witnesses-for-out-of-scope-inbound-calls`](../goals/office-bound-admission-policies.md)).
When the control layer rejects a substrate-authorized action (a sensor failure, a barrier-function violation), the rejection comes back as a substrate witness. **The substrate doesn't trust-but-verify; it authorize-and-witness.**

## Related self-questions

- [`hj-reachability-and-cbf-as-substrate-precheck-primitive`](../../questions/hj-reachability-and-cbf-as-substrate-precheck-primitive.md) — generalizing M9's safety-shield from drone control to a substrate-precheck primitive for any high-stakes operation. **Bears directly on M9's framing**: the question argues HJ reachability and CBFs are general-purpose substrate-precheck mathematics, not drone-specific.
  A yes-answer rescopes M9 from "supervisor of embodied control" to "supervisor-precheck for any high-stakes substrate operation"; the embodied case becomes one specialization rather than the milestone's center.
- [`predicated-drone-swarm-theory-as-theory-gap`](../../questions/predicated-drone-swarm-theory-as-theory-gap.md) — whether a predicated-drone-swarm theory must be authored before M9–M12 ship, so the embodied-deployment milestones rest on predicated theory rather than on survey texts.
  Theory-gap question; answering it is a precondition for advancing M9–M12 toward `later`.
- [`formation-control-rigidity-as-substrate-shape-invariant`](../../questions/formation-control-rigidity-as-substrate-shape-invariant.md) — adopting distance-based formation-control / rigidity-theory as the language for substrate-shape invariants.
  Bears on M9's safe-envelope-cell discipline (rigidity expresses what shape *must hold* under reshaping); also bears on M11.

See [`questions/_themes.md`](../../questions/_themes.md) for the full theme map.

## Related

- [Roadmap](roadmap.md)
- [Strategic deployment roadmap (theory)](../../../../../theories/theories/engineering/theories/tech/theories/computing/theories/artificial-intelligence/theories/agents/texts/strategic-deployment-raodmap-drone-swarms.md)
- [Cyber-resilience framework (theory)](../../../../../theories/theories/engineering/theories/tech/theories/computing/theories/artificial-intelligence/theories/agents/texts/cyber-resilience-frameowkr-for-decentralized-multi-agent-drone-swarms.md)
