---
kind: narrative
status: current
discusses: [settling-path, cl-inv-locally-constant-on-paths, skh-deformation-ext-classification, regime-stratification-non-semicontinuity, multi-observer-system, geometries-of-failure-dynamics-of-void]
title: Tunneling and agential dynamics
description: A clarifying narrative on what the corpus's no-tunneling theorem means for agential dynamics.
---

# Tunneling and agential dynamics

A clarifying narrative on what the corpus's [no-tunneling theorem](../../../../glossary/concepts/cl-inv-locally-constant-on-paths.md) means for agential dynamics. The structural claim — *MLD-classes are connected components of the moduli stack; smooth deformation paths cannot cross between them* — translates into a clean dichotomy on agent behavior over time:

- **Continuous (within-class) agents**: smooth deformation paths, stay in one cohomological classification.
- **Transition (between-class) agents**: discontinuous changes, regime jumps, or rule-altering events.

These are qualitatively different agential dynamics, and the corpus's framework now lets us state precisely which mechanism produces which.

## The setup

An agent, in the corpus's vocabulary, is a closure operator producing a settling — see [the void-dynamics narrative](narratives-geometries-of-failure-dynamics-of-void.md) for the full unpacking. An agent's *behavior over time* is most naturally a [settling path](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-path.md): a parameterized family $(v_t)_{t \in I}$ of settlings, where $t$ is "agent's internal time" and $v_t$ is the agent's settled content at that time.

Three primitive structural questions:

1. *Does the agent's content stabilize?* (Does $v_t \to v_\infty$ as $t \to \sup I$?)
2. *Does the agent's classification change over time?* (Does $\mathrm{cl}\text{-}\mathrm{inv}(v_t)$ change?)
3. *Does the agent transition between regimes?* (strict / SC / TB / aperiodic)

The no-tunneling theorem answers (2) cleanly: **classification doesn't change along smooth deformation paths.** The framework's distinctive content for agential dynamics lives at the *non-smooth transitions* — when does an agent's dynamics become non-smooth, and how do we characterize those events?

## The two qualitative regimes of agential dynamics

### Continuous agents

A *continuous agent* has its settling path $(v_t)$ realizable as a smooth family of formal deformations. The corpus's results imply:

- $\mathrm{cl}\text{-}\mathrm{inv}(v_t) = \mathrm{cl}\text{-}\mathrm{inv}(v_0)$ for all $t$ — **classification is preserved**.
- The agent stays within one MLD-class for all time.
- Strong-MLD orbit type stays within the same Klein-four-group orbit (per the [strong-MLD via composed duality](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/theorems/strong-mld-via-composed-duality.md) and [conflation-strong-MLD](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/theorems/conflation-strong-mld.md) theorems).
- Per the [SKH deformation Ext-classification](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/skh-deformation-ext-classification.md), the agent's content at $t$ differs from its content at $0$ by an Ext$^1$-class element — a *deformation* rather than a *transformation*.

This is the *evolution* mode of agency: the agent's content develops over time within a fixed structural classification. Real-world examples might be: an agent whose beliefs gradually refine without any *new kinds* of beliefs entering; a CRDT system whose replicas converge without any conflict events; a Kripke frame where each agent's K-facts deepen without paradigm shifts.

### Transition agents

A *transition agent* has its settling path including discrete jumps where the dynamics is *not* a smooth deformation. The no-tunneling theorem implies these jumps cross MLD-classes — they're the only way for $\mathrm{cl}\text{-}\mathrm{inv}$ to change.

Three structural sources of transitions, per the corpus:

1. **Regime jumps**. The [regime-stratification non-semicontinuity theorem](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/theorems/regime-stratification-non-semicontinuity.md) lets a settling's regime change "upward" — strict → SC → TB → aperiodic. Each upward jump is a *transition event* in the agent's dynamics. The agent acquires more cohomological complexity (more firings, more classification content); the cohomological classification changes.

2. **Increment events**. New increment data — new evidence, new observation, new constraint — added to the increment sequence shifts the closure dynamics. Cells previously $\bot$ acquire content; new firings appear; cl-inv changes. This is the *receiving new information* mode — the agent encounters new content that doesn't fit the existing classification.

3. **Rule perturbations**. Changing the agent's closure rule (the apparatus, in Barad's terms) is a meta-level change. The [meta-deformation theory](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/meta-moduli-deformation-theory.md) (currently sketched) classifies these. This is the *paradigm shift* mode — the agent updates its closure rules, and the entire settling moves to a different classification.

These three structural sources cover the agential transitions. **Each one corresponds to a specific kind of cognitive / operational event for the agent.**

## What the framework lets us say cleanly

Three statements that the framework now supports:

**1. Classification rigidity.** "An agent's MLD-class is rigid under smooth evolution." Within continuous evolution, classification stays put. Cross-class transitions are events, not gradations.

**2. Transition typology.** "Agential transitions come in three structural types" — regime, increment, rule. Each has its own cohomological signature in the framework. An empirical agent's transition can be classified by which type it is.

**3. The aperiodic-regime is the regime of ongoing agency.** Per [the void-dynamics narrative](narratives-geometries-of-failure-dynamics-of-void.md), aperiodic settlings have $\omega_1$-persistent void — there's always indeterminate content at every countable stage. **Aperiodic agents have continuing dynamics that doesn't terminate.** Under the no-tunneling theorem, an aperiodic agent's classification is preserved through ongoing evolution, but the *content* keeps developing within that classification. This is the most distinctive structural shape for "an agent that keeps doing things."

## Multi-agent / multi-observer extension

The [multi-observer system](../../../../glossary/terms/multi-observer-system.md) infrastructure pairs naturally with tunneling theory:

- A *multi-observer settling path* is a parameterized family of multi-observer systems $(V_t : O \to \mathrm{Settlings}_B)_{t \in I}$.
- Per-observer paths $(V_t(o))$ for each $o \in O$ are individual settling paths — each follows the no-tunneling theorem.
- Cross-observer agreement / disagreement (consensus, paraconsistency from disagreement) can change along the multi-observer path *only if some observer's individual path crosses an MLD-class boundary*.

This gives a clean picture: **multi-observer dynamics is mostly continuous within-class; cross-class transitions are localized events affecting specific observers, propagated to the multi-observer system via the consensus / disagreement structure.**

For agentic swarms: the swarm's collective classification is stable when individual agents stay in their classes; the swarm "phase-transitions" only when individual agents cross class boundaries via the three transition types above. This is structurally a *swarm-level theory of phase transitions* the corpus now supports.

## Why this matters for agential reality

The Barad-flavored agential reality framework treats apparatuses (closure-rule systems) as constituting phenomena (settlings) through ongoing intra-action. The no-tunneling theorem says:

- **Within an apparatus' operating regime, the produced phenomena form a rigid classification.**
- **Apparatus changes (rule perturbations) are required to produce phenomenologically-different phenomena.**

The dichotomy maps onto Barad's distinction between *intra-action within a phenomenon* (continuous) and *re-cutting / re-apparatusing* (discontinuous). The corpus's framework provides the formal mathematics for this Baradian distinction.

## Position in the program

Clarifying narrative tying together the no-tunneling theorem's structural content with agential interpretation. The corpus now has:

- A formal classification of agential dynamics (continuous vs. transition).
- Three structural sources of transition events (regime jumps, increment events, rule perturbations).
- A multi-agent extension via multi-observer systems.

This is **Phase 1.1 complete** — cohomological tunneling theory established in the corpus, with both the structural theorem and the agential narrative. Remaining Phase 1 pieces: the void-cone cohomology theorem (closes the void-side) and the settling internal Hom (closes closed-monoidal structure).

Open downstream:

- **Discontinuous-path classification**: the non-smooth jumps that cross MLD-classes form their own structural subject. A theorem characterising the *structure* of these jumps (their cohomological signature, their multiplicity, their composition) would close the transition-agent side of the dichotomy.
- **Apparatus theory**: the Baradian apparatus = closure-rule-system identification developed formally. Closes the agential-realism connection at corpus-content level.
- **Swarm-level phase transitions**: when does a multi-agent swarm's collective classification change? The framework can ask the question; the answer is open.
