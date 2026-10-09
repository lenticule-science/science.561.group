---
type: narrative
status: current
recaps:
  - ../README.md
  - ../../../README.md
  - ../../../../../../../../../science/theories/information/theories/knowledge-systems/theories/predicated-knowledge-systems/_index.md
discusses:
  - ../teaching/explanations/agent.md
  - ../teaching/explanations/skill.md
  - ../teaching/explanations/runbook.md
  - ../teaching/explanations/dispatch.md
  - ../teaching/explanations/governance.md
  - ../teaching/explanations/federation.md
  - ../teaching/explanations/agential-self-generation.md
  - ../theorems/dispatch-as-closure-rule-system.md
  - ../theorems/agent-community-consensus.md
  - ../theorems/governance-as-modal-restriction.md
see-also:
  - what-aop-inherits.md
  - structural-lineage-from-blackboard-to-aop.md
  - ../../../../../../../../../science/theories/information/theories/knowledge-systems/theories/predicated-knowledge-systems/morphisms/federate.md
  - ../../../../../../../../../science/theories/information/theories/knowledge-systems/theories/predicated-knowledge-systems/morphisms/specialize.md
  - ../../../../../../../../../science/theories/information/theories/knowledge-systems/theories/predicated-knowledge-systems/morphisms/classify.md
title: Composability of agential-orchestration-platform with predicated-knowledge-systems
description: The agential-orchestration-platform (AgOP) and the predicated-knowledge-systems (PKS) substrate live in different registers — AgOP in the engineering register of who acts on the substrate, PKS in the knowledge-systems register of what…
---

# Composability of agential-orchestration-platform with predicated-knowledge-systems

The agential-orchestration-platform (AgOP) and the [predicated-knowledge-systems](../../../../../../../../../science/theories/information/theories/knowledge-systems/theories/predicated-knowledge-systems/_index.md) (PKS) substrate live in different registers — AgOP in the engineering register of *who acts on the substrate*, PKS in the knowledge-systems register of *what claims the substrate carries* — but they share the same five-component substrate $(\mathbf{L}, \mathcal{C}, E, \mathcal{S}, \Sigma)$.
Composability is the question of which AgOP primitives have substrate-side identifications that compose with PKS primitives without re-encoding either side.

This narrative names *four* substrate-bridges, each enacted on at least one worked example, and records what is operational versus what is sketch-level per bridge.
The discipline mirrors the [functional-runtime-platform composability narrative](../../functional-runtime-platform/narratives/composability-with-predicated-knowledge-systems.md) and the [semiotics composability narrative](../../../../../../../../../science/theories/linguistics/theories/semiotics/narratives/composability-with-predicated-knowledge-systems.md): the bridges are structural-mathematical readings, not metaphors.

## Bridge 1 — Agent ↔ scope-bounded sublocale of $E$

An [agent](../teaching/explanations/agent.md) on the platform reads as a *sublocale-with-witness-attribution* on the substrate's entity set $E$, restricted to the agent's scope, with the agent's [agent-record](../objects/agent-record.md) entity as the witness-attribution origin.

**The substrate-side identification.** Each agent has a *scope* — the sublocale of the substrate the agent is authorised to read and write.
The scope is named by the substrate's [scope family](../../../../../../../../../science/theories/information/theories/knowledge-systems/theories/predicated-knowledge-systems/objects/predicated-knowledge-system.md) $\Sigma$: the agent's scope is one element of $\Sigma$, the agent's read-access is the substrate restricted to that sublocale, the agent's write-access produces witness predications attributed to the agent's record.
Per [boundary-as-fiber](../scope/boundary-as-fiber/boundary-as-fiber.md), the scope is the *fiber* of the substrate over the agent's location in the platform's federation graph.

**Faithfulness, what is operational.** The reading is enacted on every example: in the [yaml-realizer-runbook example](../runbook/yaml-realizer-runbook/yaml-realizer-runbook.md) the realizer agent's scope is the file-system region under its working directory; in the [two-agent-disagreement-resolution example](../agent/agent-community/two-agent-disagreement-resolution/two-agent-disagreement-resolution.md) each agent's scope is the substrate sublocale they observe; in the FARS sub-theory each `agent-record` is a substrate entity with its sovereign-node scope.
The categorical move — agent as sublocale-section of $E \to \Sigma$ — is operational.

**Faithfulness, what is sketch.** The full categorical isomorphism between *the agent qua agential-platform-entity* and *the sublocale-with-witness-attribution qua substrate-entity* is sketch-level.
Open frontiers: how does scope-elevation (an agent assuming an [office](../teaching/explanations/office.md)) compose with the sublocale algebra; how is revocation of scope the *inverse* sublocale move; how does federation across substrates compose two agents' scopes when the scopes overlap in distinct substrates.

## Bridge 2 — Runbook ↔ derivation in the closure-rule system $\mathcal{S}$

A [runbook](../teaching/explanations/runbook.md) execution on the platform reads as a *derivation* in the substrate's closure-rule system $\mathcal{S}$: each skill invocation is one closure-rule application, each sub-goal is a sub-derivation, each post-condition is a derived cell.

**The substrate-side identification.** A runbook's body is a sequence of operators (skill invocations, sub-goals, conditional branches, parallel forks, achieve-goal calls).
Each operator commits to a closure-rule application against the substrate's current state: the operator's preconditions are the rule's premise pattern, the operator's effects are the rule's conclusion pattern, the operator's sub-goals are recursive premises that must themselves be derived.
The runbook's *trace* — the sequence of substrate predications the execution produces — IS the derivation tree of the closure-rule system, recorded in the [event log](../../../objects/event-log.md) per [agential self-generation](../agent/agential-self-generation/agential-self-generation.md).

**Faithfulness, what is operational.** The reading is enacted on the [runbook-execution-walkthrough example](../runbook/runbook-execution/runbook-execution-walkthrough/runbook-execution-walkthrough.md): each step of the walkthrough is one closure-rule application, the cumulative substrate state at each step is the cumulative derivation, the execution's witness chain IS the derivation tree's traversal.
Per [dispatch-as-closure-rule-system](../dispatch/dispatch-as-closure-rule-system/dispatch-as-closure-rule-system.md), dispatch itself is a closure-rule system on the agential layer, so runbook execution is a *staged* closure-rule derivation: dispatch fires the runbook's first skill, the skill's effects fire the next dispatch, and so on.

**Faithfulness, what is sketch.** The discipline of mapping BDI plan-body operators (sequence, parallel-fork, choice, while-loop, achieve-goal) onto closure-rule combinators is operational for sequence and achieve-goal, sketch-level for parallel-fork (composition with the bilattice's $\vee_k$ join), and open for while-loop (the closure-operator's fixed-point reading vs the runbook's bounded-iteration discipline).
The full categorical isomorphism between *runbook-execution-as-platform-operation* and *derivation-in-$\mathcal{S}$* across the operator catalog is sketch-level.

## Bridge 3 — Dispatch ↔ match-strength-as-bilattice-value in $\mathbf{L}$

The [dispatch](../teaching/explanations/dispatch.md) operator's match-strength for a (skill, work-item) pair reads as a *value in the substrate's bilattice* $\mathbf{L}$: $\mathbf{t}$ if the skill matches and the agent is authorised, $\mathbf{f}$ if no match, $\bot$ if no information, $\top$ if competing-evidence (multiple skills match equally well, or a skill matches but authorisation is contested).

**The substrate-side identification.** Dispatch reads predications about the (skill, work-item, agent) relation: *does this skill apply to this work-item?* (capability predication), *is this agent authorised to invoke this skill on this work-item?* (authorisation predication, per [dispatch-composes-authorization](../dispatch/dispatch-composes-authorization/dispatch-composes-authorization.md)), *does this skill's expected effect satisfy the work-item's success criterion?* (suitability predication).
The *match-strength* a dispatch operator emits is the bilattice-meet of these predication readings: $\mathbf{t}$ when all three are $\mathbf{t}$, $\mathbf{f}$ when any is $\mathbf{f}$, $\bot$ when any is $\bot$, $\top$ when any is $\top$.

**Faithfulness, what is operational.** The reading is enacted on the [dispatch-from-properties](../dispatch/dispatch-from-properties/dispatch-from-properties.md) narrative and on the dispatch worked examples: the match-strength IS the bilattice-meet of the relevant predications.
Per [dispatch-as-closure-rule-system](../dispatch/dispatch-as-closure-rule-system/dispatch-as-closure-rule-system.md), dispatch's behaviour across the work-item population IS the substrate's closure operator on the dispatch-predicate fiber.

**Faithfulness, what is sketch.** The categorical faithfulness across the *predicate category* of work-item shapes — that the bilattice-meet operation *commutes* with the substrate's restriction across changes in work-item shape — is sketch-level.
Open frontiers: how dispatch composes across federation boundaries (dispatch in substrate A invoking a skill resident in substrate B); how dispatch handles work-items whose shape is itself a $\top$ value (paraconsistent work-items where the requirements are contradictory); how dispatch's *match-strength function* itself is a substrate entity per [agential self-generation](../agent/agential-self-generation/agential-self-generation.md).

## Bridge 4 — Governance ↔ modal-necessity restriction along the office accessibility relation

The platform's [governance](../teaching/explanations/governance.md) discipline reads as a *modal-necessity operator* on the substrate's accessibility relation between agents and operations, per [governance-as-modal-restriction](../governance/governance-as-modal-restriction/governance-as-modal-restriction.md).

**The substrate-side identification.** The platform's office-graph defines an *accessibility relation* between agents and operations: agent $a$ has access to operation $o$ iff $a$ holds an office that authorises $o$.
Governance is the discipline of *restricting* this accessibility relation per a published policy: a governance decision is a substrate predication that adds, removes, or restricts an office's authorisation set.
The substrate-side reading is *modal-necessity along the accessibility relation*: an operation $o$ is *governance-permitted* for agent $a$ iff every accessibility-related office of $a$ admits $o$.
Per the [modal-necessity operator](../../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/modal-necessity-operator.md) construction in the math parent, this is exactly the bilattice modal-$\square$ at the office accessibility relation.

**Faithfulness, what is operational.** The reading is enacted in [governance-as-modal-restriction](../governance/governance-as-modal-restriction/governance-as-modal-restriction.md) directly: the theorem's body proves that governance decisions act as modal-restriction on the accessibility relation, and that the modal-restriction commutes with closure-rule application (so a governance decision restricts what an agent *can* do *before* the substrate fires the rule, not after).
The proof rides the math parent's modal-necessity-basic-properties theorem.

**Faithfulness, what is sketch.** The extension to *dynamic* governance — offices created and dissolved during operation, accessibility relations changing under closure-rule firings, the modal-restriction operator's commutation with these changes — is sketch-level.
The static-office-graph case is operational.
Open frontiers: governance decisions whose effect is itself a $\top$ value (a decision that simultaneously authorises and revokes); governance composing across federation (a sub-platform's governance bound by a parent platform's); the relation to constitutional-republic governance regimes that are themselves agential entities.

## What composability buys

The four bridges together let the platform compose with the substrate without re-encoding either side.
Concretely:

- **PKS-substrate reasoning applies to AgOP entities.** Every property the substrate carries about $E$ — assertion-monotonicity, settled-vs-contested behaviour, federation-convergence, $\top$-pressure under contestation — applies directly to agent-records, skill-records, runbook-records, governance-decisions.
  The platform need not re-prove these properties at the agential layer.
- **AgOP-side operations apply to PKS-substrate entities.** Every operation the platform supports — dispatch, runbook execution, governance restriction, federation across populations — applies to *any* substrate entity, not just agential ones.
  A dispatch can fire on a knowledge-system claim cell; a runbook can derive a knowledge-system theorem; a governance decision can restrict authorisation over knowledge-system contributions.
- **Federation across the AgOP layer composes with PKS federation.** Per [agent-community-consensus](../agent/agent-community/agent-community-consensus/agent-community-consensus.md), the agential layer's federation IS the math parent's network-sheaf consensus restricted to agent-record entities.
  PKS's federate morphism applies directly to the broader substrate; AgOP's federation operators are special cases.
- **Skill-colocation discipline binds AgOP to PKS at the operational layer.** The corpus's own operational tooling — the personnel-and-offices machinery in `operations/command/`, the SKILL.md files realising agential primitives — citing the platform's concepts is the same discipline that PKS's [skill-colocation spec](../../../specifications/skill-colocation.md) commits to.
  The platform's operational binding is enacted at the substrate, not at a separate layer.

## What composability does not buy

The bridges are structural-mathematical readings, not full reductions.
The platform retains content that does not reduce to PKS substrate operations:

- **The agential-self-generation commitment is stronger than substrate-level self-representation.** PKS commits to the substrate's own machinery being substrate-content (per [self-representation](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md)).
  AgOP additionally commits to the *agential* machinery being substrate-content.
  The stronger commitment is a *parameter* of AgOP, not a consequence of PKS.
- **The practical-reasoning trajectory is a runtime trajectory, not a static structural property.** A runbook's execution unfolds over substrate ticks; the *sequence* the execution traces is content the substrate records, but the *commitment* to a particular sequence (the runbook's plan) is agential content the substrate does not derive.
- **Governance decisions are normative content the substrate does not adjudicate.** The substrate records a governance decision and applies its modal-restriction; the *legitimacy* of the decision (whether the deciding agent had the office, whether the office's authorisation extends to this restriction) is itself substrate-recorded but is normative content the platform's governance discipline interprets, not content the substrate derives.

The bridges thus give *composability*, not *reduction*.
The platform composes with PKS without losing what makes the agential layer a distinct register.
