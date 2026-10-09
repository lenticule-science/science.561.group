---
type: question
status: open
explores:
  - teaching/explanations/agential-self-generation.md
  - teaching/explanations/skill.md
  - teaching/explanations/runbook.md
  - teaching/explanations/governance.md
see-also:
  - teaching/explanations/learning-as-settlement.md
  - teaching/explanations/composability-with-predicated-knowledge-systems.md
  - micromodel-training-pipeline.md
  - ../theorems/settlement-path-as-regime-descent.md
  - ../theorems/agent-community-consensus.md
title: How is progress toward the agential self-generation asymptote measured?
description: The agential self-generation commitment — that every operative element of the platform is itself a substrate entity — is the platform's defining structural commitment, beyond what either parent supplies.
---

# How is progress toward the agential self-generation asymptote measured?

The [agential self-generation](../agential-self-generation.md) commitment — that every operative element of the platform is itself a substrate entity — is the platform's defining structural commitment, beyond what either parent supplies.
It is approached *asymptotically*: a platform need not have every operative element representable on day one; it can start with externally-defined skills and progressively migrate them into the substrate.
The asymptote is approached as more skills are defined using skills, more shapes validate shapes, more runbooks generate runbooks, more governance decisions edit the office graph.

The question is what the *engineering metric* of progress toward the asymptote looks like.
The corpus characterises the *property* (the structural commitment) and the *direction* (the platform should be approaching it), but the operational metric for "how close are we" is open.

## Statement

> What *substrate-extractable measurement* of an agential platform's state determines its position on the agential-self-generation asymptote, what is the discipline by which a platform's measurement is *comparable* across deployments and across federation boundaries, and what does the [agent-community-consensus](../../agent-community/agent-community-consensus/agent-community-consensus.md) theorem actually guarantee at each measured position?

## Decomposition

### Sub-question A — What is the substrate-extractable signal of self-generation?

Three candidate signal families, each with a different substrate-side reading:

- **Substrate-coverage signal: fraction of operative elements that are substrate entities.** A platform at full coverage has every skill, runbook, shape, office, governance rule, dispatch table, and scheduler as a substrate-recorded entity; a platform at zero coverage has none.
  The signal is extractable from the substrate by counting (operative elements declared in the platform's manifest) and intersecting with (substrate entities of the corresponding type).
  The Liskov-correctness condition: every operative element the platform invokes can be *named* by a substrate path.
- **Reflexivity-depth signal: deepest closure-rule chain bottoming out at substrate operations.** A skill that uses other skills is reflexive at depth 1; a skill that uses skills that use skills is at depth 2; the deepest chain is the platform's reflexivity depth.
  The asymptote is *every* skill-using-skill chain bottoms out at substrate operations — full reflexive closure of the skill graph in the substrate.
  The signal is extractable from the [event log](../../../objects/event-log.md) by tracing skill-invocation chains.
- **Witness-density signal: fraction of platform-state-changes recorded as substrate predications with full provenance.** A platform at full witness-density has every state change carry a [witness](../../teaching/explanations/witness.md) recording the operator, the inputs, the outputs, and the agent attribution.
  A platform at zero density has changes that occur in agential machinery without substrate-side records.
  The signal is extractable by sampling state-change events and checking witness-chain completeness.

The sub-question: does the platform commit to *one* signal as the canonical measurement, to a *vector* of signals (each independently meaningful), or to a *composite* signal (e.g., the bilattice-meet of the three)?
Each option has different comparability and gaming properties.

### Sub-question B — Which substrate operations record the signal extraction?

Whatever signal is committed to, the *act of measuring it* must itself respect [agential self-generation](../agential-self-generation.md): the measurement procedure is itself a skill, the measurement result is itself a substrate predication, the measurement schedule is itself a runbook.
The sub-question is what substrate-content the measurement produces:

- **A measurement-record entity per measurement event.** Each invocation of the measurement procedure produces one substrate entity recording the timestamp, the signal value, the substrate snapshot identifier the measurement was taken against, and the agent attribution.
  The measurement is *replayable* against the snapshot and is auditable.
- **A measurement-stream entity continuously updated.** The measurement is a closure-rule whose firing on every relevant substrate state-change updates a single substrate-resident measurement entity.
  The measurement is *current* at all times but the historical sequence is recovered only via the [event log](../../../objects/event-log.md)'s replay of the closure-rule firings.
- **A measurement-shape that any agent can instantiate.** The measurement procedure is a skill any agent can invoke; the result is a predication attributed to the invoking agent.
  The measurement is *plural* — different agents may report different values — and disagreements are recorded as $\top$-cells per the substrate's bilattice discipline.

The sub-question is which discipline the platform commits to.
The plural-shape discipline is the most strictly self-generating but also the most contestable; the measurement-record discipline is the most auditable.

### Sub-question C — What is the comparability discipline across deployments?

Two AgOP deployments at different positions on the asymptote should be *comparable*: a measurement of 0.7 substrate-coverage on deployment X should mean the same thing as 0.7 on deployment Y, modulo a published comparability discipline.
Without comparability, the signal is not a metric — it is a per-deployment dial without external meaning.
The candidate disciplines:

- **Schema-conformance comparability.** Two deployments are comparable iff their substrate manifests (the catalog of *what kinds of operative elements exist on this platform*) are schema-conformant — same operative-element types, same scope hierarchy, same governance regime.
  The measurement is comparable across deployments that share the schema; deployments with divergent schemas are *not* directly comparable.
- **Federation-relative comparability.** Two deployments are comparable iff they federate per [federation-convergence](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md): the act of federating gives the substrates a common base $E^* = E_X \cup E_Y$ over which both deployments' measurements re-cast as measurements over $E^*$, and *those* measurements are comparable.
- **Witness-equivalence comparability.** Two deployments are comparable iff their measurement procedures *witness* equivalent substrate computations — i.e., the measurement skill on X and the measurement skill on Y are the same skill (perhaps a substrate-resident shared skill replicated to both), so by construction the measurements are comparable.

The sub-question: does the platform commit to *one* comparability discipline, *several* (different deployments may commit to different ones), or *none* (the measurement is per-deployment by design)?

### Sub-question D — What does agent-community-consensus guarantee at each measured position?

The [agent-community-consensus](../../agent-community/agent-community-consensus/agent-community-consensus.md) theorem guarantees that the community's joint state is computable as the cellwise bilattice-meet over agents, with disagreements recorded as $\top$.
The theorem's *strength* depends on the platform's position on the asymptote:

- At **full self-generation**, every agent's contribution is substrate-recorded, every disagreement is observable as a $\top$-cell, every governance decision is a substrate predication.
  The consensus theorem's claim 2 (disagreement-as-structural) and claim 5 ($H^n = 0$ for $n \geq 2$) are *enacted* on the platform — every disagreement IS a $\top$-cell, every higher cohomology IS trivial.
- At **partial self-generation**, some operative elements are substrate-recorded (so the consensus theorem applies to *those*) and some are externally-defined (so the consensus theorem is silent on those — the substrate cannot record their disagreements).
  The theorem's claims hold *modulo* the externally-defined elements; the position on the asymptote determines the modulus.
- At **zero self-generation**, all operative elements are externally-defined; the consensus theorem is structurally available but has no substrate-resident agential content to apply to.
  The theorem holds vacuously.

The sub-question is to rephrase agent-community-consensus as *parametric in the asymptote-position*: the theorem's claims hold over the substrate-resident fraction of agential content, with the externally-defined fraction excluded from the consensus computation.
The current statement of the theorem assumes full self-generation; the parametric form is open.

## What is established

- The substrate's bilattice machinery and the [agent-community-consensus](../../agent-community/agent-community-consensus/agent-community-consensus.md) theorem hold *unconditionally* over the substrate-resident fraction of agential content; this is independent of asymptote-position.
- A coarse three-level grading exists in the engineering record — *registration* (operative elements named in the substrate), *composition* (operative elements composed via substrate), *reflexivity* (operative elements generating other operative elements via substrate).
  The three levels are observable but the numerical thresholds are not specified.
- The [event log](../../../objects/event-log.md) carries enough information to compute any of the three signal families; the substrate-side machinery for measurement is structurally adequate.
- The [formality-layer](../../../scope/formality-layer/formality-layer.md) discipline (driver / substrate / boundary / agent split) provides one progression-axis the measurement can be tied to.
- For the substrate-coverage signal, the underlying counting machinery is well-understood: it reduces to manifest-count / substrate-count ratios, which the substrate's catalog operations support directly.
- **Regime-descent identifies the canonical signal.** The [settlement-path-as-regime-descent theorem](../../../settlement/settlement-path/settlement-path-as-regime-descent/settlement-path-as-regime-descent.md) establishes that each formality layer corresponds to a bounded regime in the [four-regime dichotomy](../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md): F₀ is regime-unconstrained, F₁ is at most Scott-continuous, F₂ and F₃ are strict-regime.
  This makes the *regime-distribution signal* — the fraction of operative elements whose closure ordinal is finite (strict regime) — the canonical substrate-extractable measurement.
  It subsumes and refines the substrate-coverage signal: coverage asks whether the element is substrate-resident at all; regime-distribution asks whether it has descended to the strict regime.
  A platform at the asymptote has all operative elements in the strict regime; regime-distribution = 1.0 at the asymptote.
- **Parametric agent-community-consensus is characterizable.** At asymptote-position measured by regime-distribution $\alpha$ (fraction of operative elements at F₂ or F₃, hence strict-regime), the [agent-community-consensus](../../agent-community/agent-community-consensus/agent-community-consensus.md) theorem's claims hold with the network sheaf $\mathcal{F}_{V_\mathcal{C}}$ restricted to the substrate-resident strict-regime subgraph $\hat G_\mathcal{C}^\alpha \subseteq \hat G_\mathcal{C}$.
  The externally-defined ($\alpha$-complement) fraction of agential content is excluded from the consensus computation.
  Consensus exists, disagreement is structural, and cohomology vanishes above degree 1 — all within $\hat G_\mathcal{C}^\alpha$.
  The parametric form of the theorem is: as $\alpha \to 1$, the subgraph $\hat G_\mathcal{C}^\alpha \to \hat G_\mathcal{C}$ and the parametric consensus theorem recovers the full theorem statement.

## What remains open

- Which of sub-question A's three signal families (coverage / reflexivity-depth / witness-density) is canonical, and whether a single signal or a vector is committed to.
- Which of sub-question B's three measurement-substrate disciplines (record / stream / plural-shape) the platform commits to.
  The plural-shape discipline is the most strictly self-generating but the most contestable; the trade-off has not been settled.
- Which of sub-question C's three comparability disciplines (schema / federation-relative / witness-equivalence) holds across deployments, and whether multiple deployments may commit to different disciplines.
- The parametric statement of [agent-community-consensus](../../agent-community/agent-community-consensus/agent-community-consensus.md) over asymptote-position, and the parametric statement of [governance-as-modal-restriction](../../../governance/governance-as-modal-restriction/governance-as-modal-restriction.md) over the substrate-resident fraction of governance decisions.
- Whether *contestation between measurements* (two agents reporting different signal values for the same platform) is itself handled by the substrate's $\top$-pressure discipline, or by an explicit measurement-arbitration office.
- The relationship between asymptote-position and the [formality-layer](../../../scope/formality-layer/formality-layer.md) progression: is the formality-layer a coarse classification of the same underlying signal, or an orthogonal axis?

## Why it matters

Resolving this question would settle four downstream commitments the platform depends on:

1. **The strength of [agential self-generation](../agential-self-generation.md) as an engineering claim.** As written, the commitment is structural; without a measurement, the corpus cannot say whether a deployment *satisfies* the commitment or *approaches* it, only that the commitment exists.
2. **The portability of agential platforms across deployments.** Two deployments claiming to be agential platforms need a comparable measurement to interoperate; without comparability, federation across them per [federation-convergence](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md) cannot import each other's agential content with confidence.
3. **The strength of [agent-community-consensus](../../agent-community/agent-community-consensus/agent-community-consensus.md) at non-asymptotic positions.** As written, the theorem assumes full self-generation; resolving the parametric form would let the theorem make claims at every position on the asymptote, not only at the limit.
4. **The audit discipline for platform conformance.** A library-wide audit (per the [predicated-markdown-vault audits](../../../../../../../../../science/theories/information/theories/knowledge-systems/theories/markdown-vault-knowledge-system/theories/predicated-markdown-vault-knowledge-system/audits/_index.md) discipline) of an AgOP deployment requires a measurement to score the deployment against; without one, the audit is qualitative.

A tractable next step is to write a worked-example measurement under each of the three signal families against a single AgOP deployment (the [yaml-realizer-runbook example](../../../runbook/yaml-realizer-runbook/yaml-realizer-runbook.md) is the candidate), with the substrate-side machinery for each measurement spelled out and the resulting numbers compared.
The signal that produces the most-discriminating, least-game-able measurement on the worked example becomes the candidate canonical signal.
