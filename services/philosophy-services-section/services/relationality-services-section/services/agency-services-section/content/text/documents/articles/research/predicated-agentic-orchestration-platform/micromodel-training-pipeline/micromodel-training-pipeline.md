---
type: question
status: open
explores:
  - teaching/explanations/formality-layer.md
  - teaching/explanations/agential-self-generation.md
  - teaching/explanations/skill.md
  - teaching/explanations/dispatch.md
see-also:
  - teaching/explanations/learning-as-settlement.md
  - teaching/explanations/offices-and-the-formality-progression.md
  - agential-fixed-point-asymptote.md
title: What is the canonical pipeline for training the platform's micromodel from its own tool-call logs?
description: The formality-layer discipline rests on a micromodel — a fine-tuned classifier handling structured but specifically-formatted work at near-zero cost — that progressively replaces frontier-model invocations as the platform accumulates…
---

# What is the canonical pipeline for training the platform's micromodel from its own tool-call logs?

The [formality-layer](../scope/formality-layer/formality-layer.md) discipline rests on a *micromodel* — a fine-tuned classifier handling structured but specifically-formatted work at near-zero cost — that progressively replaces frontier-model invocations as the platform accumulates tool-call history.
The substrate of [agential self-generation](../agent/agential-self-generation/agential-self-generation.md) is what makes this loop coherent: tool-call logs are themselves substrate entities, so a classifier trained on them is itself a substrate entity, and the platform's improvement of itself is recorded in the same store as its data.
But the *concrete pipeline* — extraction, training, deployment, iteration, regression-detection — is not yet specified.

## Statement

> What *substrate-side discipline* governs the extraction, training, deployment, and rollback of a micromodel that is itself a substrate entity, what does [dispatch](teaching/explanations/dispatch.md) commit to as the engineer-visible behaviour at each stage of the pipeline, and how does the pipeline interact with the platform's [agent-community-consensus](../agent/agent-community/agent-community-consensus/agent-community-consensus.md) when the micromodel's outputs disagree with frontier-model outputs on the same work-item?

## Decomposition

### Sub-question A — What is the substrate-side discipline for extracting training examples?

The [event log](../../../objects/event-log.md) carries every tool-call as a substrate predication with full provenance.
Extracting training examples is selecting a subset of these events and rendering them as `(input, output)` pairs the training procedure consumes.
The candidate disciplines:

- **All successful invocations.** Every event whose witness chain records a successful skill invocation (no error, no retraction, no governance reversal) becomes a training example.
  The discipline is simple but conflates work-types — a successful classification and a successful code-generation are both included.
- **Skill-typed selection.** Each micromodel is targeted at a specific skill or skill-family; only events invoking the targeted skills are included.
  The discipline preserves training-time / inference-time alignment but requires a substrate-resident *skill catalog* the extractor reads against.
- **Quality-graded selection.** Each event carries a substrate-recorded quality predication — successful invocation that *also* received later positive corroboration (no retraction, downstream success, agent endorsement).
  Only quality-positive events are included.
  The discipline is most discriminating but depends on the substrate carrying quality predications, which is itself an open commitment.
- **Plural-witness selection.** Each event has multiple agents' witness predications (the invoking agent, observing agents, governance reviewers); only events where the witnesses agree (no $\top$-cells in the event's witness chain) are included.
  The discipline rides on [agent-community-consensus](../agent/agent-community/agent-community-consensus/agent-community-consensus.md) directly.

The sub-question: which discipline is canonical?
Or is the discipline *configurable per micromodel* — each micromodel declares its extraction predicate, and the pipeline supports any predicate the substrate's query language can express?

### Sub-question B — What substrate machinery represents the trained micromodel?

A micromodel is a fine-tuned classifier with weights, a base-model lineage, a training-set identification, and a deployment endpoint.
Per [agential self-generation](../agent/agential-self-generation/agential-self-generation.md), the model itself must be a substrate entity.
The candidate substrate-content shapes:

- **Model-record entity.** A `model-record` substrate entity carries: the model's content-hash (deterministic identifier), the base-model identifier, the training-set's substrate-identifier (the snapshot of the event-log at training time), the training-procedure's runbook-identifier, the deployment endpoint, and the *evaluation* predications (per-work-type accuracy on a held-out set).
  The model file itself is content-addressed off-substrate; the substrate carries the metadata.
- **Model-record + weights-as-substrate-content.** The model's weights themselves are substrate content (encoded in the substrate's value-domain, possibly chunked across many predications).
  The discipline is fully self-generating but expensive — model weights are large and the substrate's predication discipline is not optimised for tensor data.
- **Model-record-with-pointer + weights-pointed-to.** The substrate carries the `model-record` and the model file is a content-addressed external blob the record points at.
  The blob is *referenced* by the substrate but lives outside the predication store.
  The discipline is operationally tractable but weakens [agential self-generation](../agent/agential-self-generation/agential-self-generation.md): the model's weights are not strictly substrate-content, only the substrate-side metadata is.

The sub-question: which discipline is canonical?
The fully-substrate-resident discipline is the most strictly self-generating; the pointer discipline is operationally cheaper.
The asymptote discussion in [agential-fixed-point-asymptote](../agent/agential-self-generation/agential-fixed-point-asymptote/agential-fixed-point-asymptote.md) is directly implicated.

### Sub-question C — How does dispatch select between micromodel and frontier-model invocations?

Once a micromodel is deployed, [dispatch](teaching/explanations/dispatch.md) must decide *when* to route a work-item to the micromodel versus to a frontier-model.
The candidate disciplines:

- **Confidence-thresholded.** The micromodel is invoked first; if its confidence (output-distribution-entropy, per-class-probability, or a substrate-side calibrated score) exceeds a threshold, its output is accepted; otherwise the work-item is escalated to the frontier model.
  The discipline is operationally cheap but requires confidence to be *substrate-recordable* — the micromodel's output schema must include a confidence field the substrate stores.
- **Cost-utility-optimised.** Dispatch maintains substrate-recorded cost-and-utility predications for each (skill, model) pair (cost = inference-time, dollar-cost; utility = expected-correct-fraction).
  For each work-item, dispatch selects the model that maximises expected utility minus cost.
  The discipline is most economically rational but requires substrate-resident utility-tracking.
- **Formality-layer-routed.** The platform's [formality-layer](../scope/formality-layer/formality-layer.md) classification of the work-item determines the routing: substrate-layer work goes to substrate operators (no model), driver-layer to frontier model, agent-layer to micromodels-trained-on-this-agent's-history.
  The discipline aligns with the formality progression directly.

The sub-question: which routing discipline is canonical?
Or is dispatch's routing *itself* a substrate predication the [governance](teaching/explanations/governance.md) discipline can edit?

### Sub-question D — What is the rollback discipline when a re-trained micromodel regresses?

A re-trained micromodel may regress on some work-types — produce worse outputs than the previously-deployed version.
The platform must detect and roll back.
The candidate disciplines:

- **Held-out-set evaluation gating.** Before deployment, the new micromodel is evaluated against a substrate-resident held-out set; if any per-work-type accuracy regresses below threshold, deployment is blocked.
  The discipline is conservative but depends on the held-out set being kept current.
- **Shadow-deployment monitoring.** The new micromodel is deployed in shadow mode (its outputs are recorded but not acted on) for a period; dispatch continues to use the old model.
  After enough shadow events, the substrate computes regression and either promotes or rejects the new model.
  The discipline is empirically grounded but slow.
- **A/B substrate-recorded.** The new and old micromodels both serve a fraction of work-items; the substrate records which model produced which output, downstream success/failure of each is attributed via the witness chain, and after enough A/B events the better-performing model wins.
  The discipline is the strongest empirical evidence but requires the substrate to support A/B routing.
- **Witness-chain regression-detection.** Per [agent-community-consensus](../agent/agent-community/agent-community-consensus/agent-community-consensus.md), a regression manifests as $\top$-cells in the new model's outputs versus the old model's stored historical outputs.
  The substrate's $\top$-pressure can trigger the rollback automatically.
  The discipline is the most strictly self-generating.

The sub-question: which discipline is canonical, and does the rollback decision itself require a [governance](teaching/explanations/governance.md) act, or can it be a closure-rule firing on $\top$-pressure?

## What is established

- The platform's [event log](../../../objects/event-log.md) carries the raw material the pipeline needs; every successful skill invocation is a substrate predication with the full witness chain.
- The [formality-layer](../scope/formality-layer/formality-layer.md) discipline names the progression from frontier-model-mediated to micromodel-mediated to substrate-operator dispatching; the discipline is qualitative but consistent across the corpus.
- Industry practice for fine-tuning (LoRA, full fine-tuning, RLHF, distillation) is well-established; the platform inherits the technique catalog without commitment to a specific one.
- Per [park-et-al2023](../park-et-al2023/park-et-al2023.md) (Generative Agents) and [schick-et-al2023](../skill/tool-use-as-skill-invocation/schick-et-al2023/schick-et-al2023.md) (Toolformer), the discipline of training agent-relevant micromodels on agent-generated trajectories has empirical precedent.
- Per [agent-community-consensus](../agent/agent-community/agent-community-consensus/agent-community-consensus.md), the substrate's bilattice machinery handles disagreement between models structurally; the substrate is *able* to record micromodel-vs-frontier disagreement as a $\top$-cell.
- Per [promote-is-strictly-cost-reducing](../office/promote/promote-is-strictly-cost-reducing/promote-is-strictly-cost-reducing.md), **the pipeline's maturation loop has a well-founded termination structure**: each successful promote of a micromodel-mediated skill ($F_1$) to a structured skill ($F_2$) or tool ($F_3$) strictly reduces the promoted content's per-invocation cost, and the promote chain terminates in at most three steps per content item.
  The pipeline's cost-reduction effect is therefore monotone and bounded: the platform cannot promote the same content infinitely, and the per-invocation cost for promoted content decreases monotonically toward the substrate-operator floor.
  This settles a structural precondition for sub-question D: a witness-chain rollback regime (where $\top$-pressure triggers rollback) is consistent with the promote-chain's termination — the pipeline does not need to detect infinite loops, because the structure prohibits them.
- Per [skill-composition-cost-is-bounded-by-constituent-sum](../skill/skill-composition/skill-composition-cost-is-bounded-by-constituent-sum/skill-composition-cost-is-bounded-by-constituent-sum.md), **micromodel-mediated compositions have a predictable cost envelope**: the cost of a composed skill containing a micromodel-invocation step is at most the sum of its constituents' costs.
  When the entire composition is promoted to $F_3$ (all steps reducible to substrate-only operations), the cost collapses to the substrate-operator floor — the pipeline's highest-value optimization target is identifying compositions whose constituents are all promotable.

## What remains open

- Which of sub-question A's four extraction disciplines (all-successful / skill-typed / quality-graded / plural-witness) is canonical.
- Which of sub-question B's three model-substrate-content disciplines (full-record / weights-in-substrate / pointer) the platform commits to, and how this interacts with the [agential-fixed-point-asymptote](../agent/agential-self-generation/agential-fixed-point-asymptote/agential-fixed-point-asymptote.md) measurement.
- Which of sub-question C's three dispatch-routing disciplines is canonical, and whether routing is itself governance-editable.
- Which of sub-question D's four rollback disciplines is canonical, and whether rollback is closure-rule-driven or governance-driven.
- The interaction between the pipeline and *cross-deployment* model sharing: can a micromodel trained on deployment X be shared to deployment Y per [federation-convergence](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md), and what conformance schema does the sharing require (per [substrate-specific-federation-conformance](../agent/federation/substrate-specific-federation-conformance/substrate-specific-federation-conformance.md))?
- Whether the training procedure *itself* is a runbook (per [agential self-generation](../agent/agential-self-generation/agential-self-generation.md), it should be), and what the runbook's body looks like.

## Why it matters

Resolving this question would settle four downstream commitments:

1. **The operational realisability of [formality-layer](../scope/formality-layer/formality-layer.md) progression.** As written, the formality progression is a *direction*; without a pipeline, the platform has no concrete path from frontier-model dispatch to micromodel dispatch.
2. **The economic case for the platform.** A platform that can train its own micromodels has a per-invocation cost that decays with deployment age; without the pipeline, the platform's economics are bounded by frontier-model pricing.
3. **The strength of [agential self-generation](../agent/agential-self-generation/agential-self-generation.md) at the model layer.** The pipeline's commitment to model-as-substrate-content per sub-question B is a direct test of how strongly the platform commits to self-generation.
  A pointer-only commitment is weaker than a full-substrate-content commitment; the trade-off is real.
4. **The interaction with cross-deployment sharing.** A micromodel trained on one deployment's traces is potentially valuable to another; the pipeline's federation-conformance per [substrate-specific-federation-conformance](../agent/federation/substrate-specific-federation-conformance/substrate-specific-federation-conformance.md) determines whether sharing is mechanical or per-pair-negotiated.

A tractable next step is a worked-example pipeline against the [yaml-realizer-runbook example](../runbook/yaml-realizer-runbook/yaml-realizer-runbook.md): the events the realizer generates over a sustained run, an extraction predicate selecting training examples, a fine-tuning procedure, a model-record substrate entity, a confidence-thresholded dispatch routing, and a rollback test simulating regression.
Each of sub-questions A–D would have a concrete answer in the worked example, even if the *canonical* answer for the platform remains open.
