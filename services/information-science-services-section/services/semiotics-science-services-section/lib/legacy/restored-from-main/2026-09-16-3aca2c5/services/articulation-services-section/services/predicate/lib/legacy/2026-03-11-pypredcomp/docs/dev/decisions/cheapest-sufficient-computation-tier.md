---
title: "Office work routes to the cheapest sufficient computation tier"
description: "Office work runs on three peer computation tiers: algebraic substrate (Tier 1), statistical model (Tier 2), and language-model inference (Tier 3). The scheduler picks the cheapest tier that can decide a given respond. LLM inference is reserved for work that genuinely needs natural-language reasoning."
kind: decision
date: "2026-05-02"
status: committed
---


## What

The OS recognises three peer tiers of computation for office work:

1. **Tier 1 — Algebraic substrate computation.** Closure rules and the bilattice operators $\odot$ / $\Rightarrow$.
  Already covered by the kernel.
2. **Tier 2 — Statistical model computation.** Markov chains, decision forests, classifiers, GNNs against substrate fibers.
  Fast, deterministic given weights, fine-tunable on substrate evidence.
  Suitable for F0–F2 office work that is *recognisable but not algebraically derivable from premises alone*.
3. **Tier 3 — Language-model inference.** Slow, expensive, non-deterministic.
  Reserved for work that genuinely needs natural-language reasoning.

The dispatch scheduler picks the cheapest tier whose admissibility includes "can decide this respond."
Cheapness is the strict order Tier 1 < Tier 2 < Tier 3, monotone in the same `settlement-path-cost-monotonicity` sense the heartbeat already cites.

The full normative content lives in [`specs/process/computation-tiers.md`](../specs/process/computation-tiers.md), [`specs/agential/non-lm-models.md`](../specs/agential/non-lm-models.md), and [`specs/scheduling/tier-routing.md`](../specs/scheduling/tier-routing.md).

## Why

The captain's [`beyond-language-models-for-agent-computation.md`](../../../engineering/triage/operations/command/ideas/triage/beyond-language-models-for-agent-computation.md) argues that the v0.8 agential layer and the v0.9 continuous-learning pipeline implicitly assume office work runs on language-model inference, and that this is wrong on four axes:

- **Cost.** Token spend per respond is unbounded; the algebra and small models are bounded.
- **Latency.** LLM round-trips are seconds; the algebra and small models are sub-millisecond to single-digit-millisecond.
- **Determinism.** LLMs are non-deterministic by default; the substrate's commitments to byte-identical replay and cross-language conformance ([`conformance-vectors.md`](../specs/conformance-vectors.md)) cannot rest on a non-deterministic surface.
- **Learnability.** Substrate evidence is a structured fiber; small models train against it directly; LLMs require expensive prompt-engineering or full fine-tuning to absorb the same signal.

The argument doesn't reject LLMs — it places them as one of three peers, not the default.
F3 office work whose behaviour is fully algebraic should be a script (Tier 1).
F1–F2 office work that is recognisable but not derivable is the natural home of Tier 2: classification (which office?), routing (which suboffice?), prediction (next likely predicate?), scoring (is this settled?), anomaly detection.
Only F0–F1 work that genuinely needs prose-level judgment requires Tier 3.

The cheapest-sufficient principle ties this to the substrate's existing cost monotonicity: every promotion from a higher tier to a lower one strictly reduces expected per-respond cost without changing observable behaviour beyond the office's confidence thresholds.
The continuous-learning pipeline (v0.9) is the trajectory: observed Tier-3 behavior gets captured into a Tier-2 model; converged Tier-2 behavior gets captured into a Tier-1 closure rule; the office's average tier drifts strictly cheaper over time.

The framing also resolves a small confusion in the v0.8 plan: the formality-layer F0–F6 grading on the office record is a property of *the office's discipline*, not a function from office to LLM model identifier.
Tier choice is the orthogonal axis.
F2 ≠ Haiku-by-decree; F2 with a converged Tier-2 router doesn't touch an LLM at all.

Source: this conversation (2026-05-02); the captain's [`beyond-language-models-for-agent-computation.md`](../../../engineering/triage/operations/command/ideas/triage/beyond-language-models-for-agent-computation.md), [`continuous-learning-pipeline.md`](../../../engineering/triage/operations/command/ideas/triage/continuous-learning-pipeline.md), [`algebraic-learning-calculus.md`](../../../engineering/triage/operations/command/ideas/triage/algebraic-learning-calculus.md), and the captain's intuition that "real training" is something other than fine-tuning a language model.

## What it rules out

- The dispatch scheduler treating LLM inference as the default execution surface for office work.
- The formality-layer field on the office record being a function from F-level to LLM-model identifier.
- A continuous-learning pipeline whose only output is a fine-tuned LLM (the algebraic-learning-calculus tasks added to v0.9 produce Tier-2 model artefacts as substrate cells alongside any LLM fine-tuning).
- Tier-3 dispatch on F5 / F6 offices without explicit `permits-tier: tier-3` opt-in (per [`specs/process/computation-tiers.md`](../specs/process/computation-tiers.md) §3).
- Statistical model artefacts living outside the substrate as opaque blobs managed by a separate ML service.
  Models are substrate cells; weights are content-addressed; training events are auditable; retraction propagates via the σ/Δ engine.

## What it does not constrain

- Specific Tier-2 model architectures (decision-forest depth, Markov order, GNN layer count, classifier feature set).
  The model-family tag on the model record is open; per-family architecture is an implementation choice per training event.
- Training infrastructure (GPU bring-up, distributed training topology, dataset versioning beyond the cursor-range corpus pointer the substrate already provides).
- The order in which v0.8 and v0.9 implement the Tier-2 surface: v0.8 introduces Tier-2 *invocation* (via the tier-routing rule, against pre-trained model records) and v0.9 introduces Tier-2 *training* (via the algebraic learning calculus tasks); the spec is normative for both releases.
- The Tier-3 LLM model selection within F-levels for offices that do permit Tier 3 — the F0→Opus / F1→Sonnet / F2→Haiku mapping in v0.8 stands.
- Voidmath / wavefront-settle / other Tier-1-internal refinements; those compose with this decision but ship on separate tasks.
- Whether to introduce a Tier-4 (e.g., human-in-the-loop) in future releases.
  The current three-tier framing leaves room for further tiers above Tier 3, ordered by the same cost monotonicity, without breaking this decision.
