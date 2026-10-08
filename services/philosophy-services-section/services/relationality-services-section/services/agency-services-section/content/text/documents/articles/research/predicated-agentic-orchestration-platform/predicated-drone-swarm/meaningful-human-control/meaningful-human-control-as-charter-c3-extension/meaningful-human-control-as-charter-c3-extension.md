---
type: theorem
status: sketch
class: charter-extension
depends-on: [witness-chain-record, falsifiable-agency-certificate, charter-fragment-tier, safety-envelope-cell]
see-also: [safe-envelope-precheck-as-bilattice-modal-suspension, six-way-intersection-composition]
proof-target: subsequent-session
realizes: [meaningful-human-control]
title: Meaningful human control as charter C3 extension
description: The polity's meaningful human control (MHC) over a workitem is a charter-binding rule at the C3 fragment-tier (constitutional / hard-core), not a deployment policy or a regulation.
aliases:
  - meaningful-human-control-as-charter-c3-extension
science-owner: artificial-intelligence-science-services-section
---

# Meaningful human control as charter C3 extension

The polity's *meaningful human control* (MHC) over a workitem is a **charter-binding rule** at the C3 fragment-tier (constitutional / hard-core), not a deployment policy or a regulation.
The four conditions named in the [polity-root meaningful-human-control object](../../../../../../../../../../objects/meaningful-human-control.md) are decidable in bare-Π₁ + < per the [closure-rule-language](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-language.md); their composition is the substrate-algebraic content of MHC for *this* polity.

## Statement

**Theorem (MHC as charter C3 extension).** *Meaningful human control over a workitem $w$ holds in the 561 polity iff:*

$$\mathrm{MHC}(w) = c_1(w) \wedge_k c_2(w) \wedge_k c_3(w) \wedge_k c_4(w) = \mathbf{t}$$

*where $\wedge_k$ is the bilattice knowledge-meet and:*

1. *(Witness chain to captain.) $c_1(w) = \mathbf{t}$ iff $w$'s outcome cell carries a [witness-chain-record](../../../../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/witness-chain-record.md) whose `captain-attestation-cell` is non-empty and whose chain (per `cosheaf-source-events`) closes through a cell signed by an office authorized for captain-attestation.
  Closure rule `verify-witness-chain-to-captain`, decidable in Π₁ by finite path enumeration over the event-log subsequence.*

2. *(Safety-envelope precheck has fired.) $c_2(w) = \mathbf{t}$ iff there exists a witness in $w$'s chain whose operator is the safety-envelope-precheck $\Box_{\sigma}$ (per [safe-envelope-precheck-as-bilattice-modal-suspension](../../safety-envelope-cell/safe-envelope-precheck-as-bilattice-modal-suspension/safe-envelope-precheck-as-bilattice-modal-suspension.md)) and whose output-hash satisfies $\Box_{\sigma}(w) = \mathbf{t}$.
  Closure rule `verify-safety-envelope-precheck`, decidable in Π₁.*

3. *(Charter-tier discipline.) $c_3(w) = \mathbf{t}$ iff $w$'s authorization passes the charter-fragment-tier discipline at the tier appropriate to $w$'s class.
  The charter-fragment-tier table for this polity is below.
  Closure rule `enforce-charter-tier-discipline`, decidable in Π₁ by frontmatter classification.*

4. *(Falsifiable-agency Condition 3.) $c_4(w) = \mathbf{t}$ iff the dispatched office holds a current [falsifiable-agency-certificate](../../../../../notes/undated/falsifiable-agency-certificate.md) with `condition-3-persistent-state.verified: true`.
  Closure rule `verify-persistent-state`, decidable in Π₁ by finite state enumeration over the cell-DAG hash.*

*The MHC verdict is the bilattice meet across the four axes; an MHC failure on any single axis blocks the workitem's enactment regardless of other axes.*

## The charter-fragment-tier table

Resolving the Pass-1 deferral on the charter-fragment-tier table:

| Workitem class | Required tier | Justification |
|---|---|---|
| `process` / `procedure` (deterministic, non-actuating) | T1 (rules) | Mechanical enactment; no judgment-bearing decision |
| `derivation` / `inquiry` (LLM-mediated, non-actuating) | T2 (guidelines) | Judgment-bearing but no physical actuation |
| `actuating` (embodied participant, physical actuation) | T3 (constitutional / hard-core) | Physical actuation; must compose with `safe-envelope-precheck` |
| `governance-amendment` | T3 + captain-attestation co-signed | Charter changes; immune-to-bypass |
| `federation-admission` | T3 + multi-personnel-attestation | Federation-handshake commits the polity |

A workitem class declares `required-charter-tier:` in its frontmatter.
A dispatched office's `authorization-bundle` composes (in the substrate's bilattice meet) with a charter fragment of *at least* the workitem's required tier; insufficient composition is a `c_3 = \mathbf{f}` verdict.

## Why this matters

The May 2026 surveys identify the *persistent definitional problem* of meaningful human control across civil and defense frameworks.
PyFARS's substrate addresses this gap by *providing the polity-internal definition mechanically*.
The polity declares what counts as MHC for *this* polity via charter-tier discipline; substrate-resident closure rules verify it mechanically.
This does not solve the field-wide standardization gap, but it makes the polity's interpretation **substrate-decidable and audit-exportable** — which is more than the regulatory frameworks themselves provide.

## Proof sketch

Each of the four conditions is decidable in Π₁:

- $c_1$: finite path enumeration over the witness-chain.
  Bounded by the chain's `closure-ordinal` which is a finite ordinal in the strict regime where drone-swarm executions live (per [aperiodicity-characterization](../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodicity-characterization.md): drone-swarm settlings are structurally never aperiodic, so cofinality is at most $\omega$).
- $c_2$: predicate evaluation at proposal time, per [safe-envelope-precheck-as-bilattice-modal-suspension](../../safety-envelope-cell/safe-envelope-precheck-as-bilattice-modal-suspension/safe-envelope-precheck-as-bilattice-modal-suspension.md).
- $c_3$: fragment-tier classifier from frontmatter; finite case enumeration.
- $c_4$: finite state enumeration over the cell-DAG hash, per the substrate-algebra question's persistent-state test.

Composition by knowledge-meet is the bilattice's structural meet operation; decidable since each input is decidable and the meet is finite-arity.

The hard-core (T3) tier discipline is the substrate-algebraic realization of the surveys' "appropriate human judgment" requirement (DoD Directive 3000.09, NATO Principles). ∎-sketch

## Position

Resolves the Pass-1 deferral on `meaningful-human-control`'s four-condition statement and the charter-fragment-tier table.
The Pass-3 refinement updates the polity-root MHC record's body with the explicit table above and replaces the Pass-1 placeholder phrase "appropriate fragment-tier" with the substrate-decidable lookup.

## Open

- The exact form of `authorization-bundle` composition (substrate bilattice meet vs. join).
  Likely meet, since accumulating authorization positions narrows admissible operations; needs the [authorization](../../../governance/authorization/authorization.md) concept's algebraic refinement.
- Whether T3 hard-core compositions are themselves witnessed (likely yes, since they constitute charter-tier amendments per the [witness-hard-core-amendments](../../../../../../../../../tools/platform/pyfars/governance/duties/witness-hard-core-amendments.md) duty).
