---
name: meaningful human control
title: meaningful human control
description: A categorically-decidable definition of meaningful human control over a workitem, composed by knowledge-meet across four Π₁ closure-rule predicates.
---

A categorically-decidable definition of **meaningful human control** over a workitem, composed by knowledge-meet across four Π₁ closure-rule predicates. Per the [predicated-drone-swarm theory-gap question](../../../../tools/platform/pyfars/questions/predicated-drone-swarm-theory-as-theory-gap.md) §"The definitional problem and meaningful-human-control as charter": the field-wide definitional gap is addressed by *providing the definition mechanically* via charter-fragment hierarchy. Meaningful human control over a workitem `w` holds iff the four conditions below all hold; each is decidable in bare-Π₁ + < per the [closure-rule-language](../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-language.md).

## The four conditions

Per `meaningful-human-control-as-charter-c3-extension` (theorem to be authored in pass 2; this record adopts its statement):

### Condition 1 — Witness chain to captain (accountability-totality)

The workitem's outcome cell carries a witness chain terminating at a captain-attested cell. **Substrate test**: the [accountability-projector](../../../../transformers/accountability-projector.md) emits a [witness-chain-record](../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/witness-chain-record.md) whose `captain-attestation-cell` is non-empty and whose chain (per `cosheaf-source-events`) closes through a cell signed by an office authorized for captain-attestation. Closure rule: `verify-witness-chain-to-captain`. Π₁ — finite path enumeration over the event-log subsequence.

### Condition 2 — Safety-envelope precheck has fired

Per [safe-envelope-precheck-as-bilattice-modal-suspension](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/predicated-drone-swarm/safety-envelope-cell/safe-envelope-precheck-as-bilattice-modal-suspension/safe-envelope-precheck-as-bilattice-modal-suspension.md), the safety-envelope precheck is the **bilattice-modal operator** $\Box_\sigma$ over a [safety-envelope-cell](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/predicated-drone-swarm/safety-envelope-cell/safety-envelope-cell.md). **Substrate test**: there exists a witness in the workitem's chain whose `operator` is `safety-envelope-precheck` against an authorized envelope-cell $\sigma$, and whose output-hash represents $\Box_\sigma(w) = \mathbf{t}$ (action lies in $\sigma$'s admissible region). Closure rule: `verify-safety-envelope-precheck`. Π₁ — predicate evaluation at proposal time. Workitems that do not actuate physically (purely-substrate workitems) are exempt by their workitem-class declaration; their Condition 2 returns $\mathbf{t}$ vacuously.

### Condition 3 — Charter-tier discipline at appropriate fragment-tier

The workitem's authorization passes the governing polity's charter-fragment hierarchy at the fragment-tier appropriate to the workitem's class. Per [meaningful-human-control-as-charter-c3-extension §"The charter-fragment-tier table"](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/predicated-drone-swarm/meaningful-human-control/meaningful-human-control-as-charter-c3-extension/meaningful-human-control-as-charter-c3-extension.md#the-charter-fragment-tier-table):

| Workitem class | Required tier | Justification |
|---|---|---|
| `process` / `procedure` (deterministic, non-actuating) | T1 (rules) | Mechanical enactment; no judgment-bearing decision |
| `derivation` / `inquiry` (LLM-mediated, non-actuating) | T2 (guidelines) | Judgment-bearing but no physical actuation |
| `actuating` (embodied participant, physical actuation) | T3 (constitutional / hard-core) | Physical actuation; must compose with `safe-envelope-precheck` |
| `governance-amendment` | T3 + captain-attestation co-signed | Charter changes; immune-to-bypass |
| `federation-admission` | T3 + multi-personnel-attestation | Federation-handshake commits the federating polity |

A workitem class declares `required-charter-tier:` in its frontmatter. A dispatched office's `authorization-bundle` composes (in the bilattice meet) with a charter fragment of *at least* the workitem's required tier; insufficient composition is a `c_3 = \mathbf{f}` verdict. Closure rule: `enforce-charter-tier-discipline`. Π₁ — fragment-tier classifier from frontmatter; finite case enumeration.

### Condition 4 — Falsifiable-agency Condition 3

The target system holds a current [falsifiable-agency-certificate](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/falsifiable-agency-certificate.md) with `condition-3-persistent-state.verified: true` — the user's interrupt-and-resume capability is preserved across the workitem's settling-trajectory. Closure rule: `verify-persistent-state`. Π₁ — finite state enumeration over the cell-DAG hash.

## Composition: knowledge-meet across the four axes

The MHC verdict for workitem `w` is the bilattice meet across the four conditions' bilattice values:

```
mhc(w) = c1(w) ∧_k c2(w) ∧_k c3(w) ∧_k c4(w)
```

where each `cᵢ(w) ∈ FOUR` is the closure rule's verdict. Per the bilattice discipline:
- `mhc(w) = T` only when all four are T.
- `mhc(w) = F` if any is F (a positive falsification dominates).
- `mhc(w) = ⊥` if any is ⊥ (insufficient evidence on any axis).
- `mhc(w) = ⊤` if any is ⊤ (paraconsistent inconsistency on any axis — surfaces as a cell needing repair).

## Distinguishing predication-shape

Cells of the form `(workitem, mhc-verdict, FOUR)` are read by the dispatch graph's eligibility-rule layer. The composite verdict can be persisted as a cell or computed on demand by the closure-rule subsystem; persistence is preferred so audit replay is byte-identical (per [witness-chain-as-proof-object](../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/witness-chain-as-proof-object.md)).

## What MHC excludes

A workitem with `mhc(w) ≠ T` does not advance through enactment. The workitem is not refused permanently; what is missing is surfaced:

| Verdict on cᵢ | Response |
|---|---|
| `cᵢ = ⊥` | request additional evidence; workitem stays open |
| `cᵢ = F` | refusal; workitem moves to `failed-mhc` lifecycle state with reason |
| `cᵢ = ⊤` | repair required; workitem blocked pending captain repair-act |

Per the substrate-algebra question's bilattice-discipline, ⊥ is the bottom of knowledge-order; ⊤ is the top — a paraconsistent inconsistency that needs an explicit repair, not silent ignoring.

## Why this is a *boundary discipline*, not a runtime policy

Per [`scope`](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/scope/scope.md), authorization is *recorded as cells*, not externally enforced. MHC is a boundary discipline of `Cob_settling` — every cobordism (every workitem's settling trajectory) has the MHC verdict as part of its boundary data. Cobordisms whose boundary fails MHC do not compose with downstream cobordisms; the failure is a refusal at the cobordism category's structural level, not a runtime exception.

## Pass-3 status

Pass-2 resolutions incorporated:

- ✓ Four-condition substrate-algebraic form: body now cites [meaningful-human-control-as-charter-c3-extension](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/predicated-drone-swarm/meaningful-human-control/meaningful-human-control-as-charter-c3-extension/meaningful-human-control-as-charter-c3-extension.md) and carries the explicit theorem statement.
- ✓ Safety-envelope-precheck operator (Condition 2): body cites [safe-envelope-precheck-as-bilattice-modal-suspension](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/predicated-drone-swarm/safety-envelope-cell/safe-envelope-precheck-as-bilattice-modal-suspension/safe-envelope-precheck-as-bilattice-modal-suspension.md) and names $\Box_\sigma$ explicitly.
- ✓ Charter-fragment-tier table: incorporated in Condition 3 body above; "appropriate fragment-tier" placeholder replaced with substrate-decidable lookup.

Remaining for engineering integration (not this record's body — `pyfars.runtime` work):

- The four closure-rule instantiators (`verify-witness-chain-to-captain`, `verify-safety-envelope-precheck`, `enforce-charter-tier-discipline`, `verify-persistent-state`) and the MHC composition rule are to be registered in `pyfars.runtime.eligibility_rules.RULE_INSTANTIATORS`.
