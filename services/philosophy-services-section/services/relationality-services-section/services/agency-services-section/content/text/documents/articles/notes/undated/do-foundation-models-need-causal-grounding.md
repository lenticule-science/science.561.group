---
type: question
status: open
references:
  - references/pearl-bookofwhy2018.md
  - references/scholkopf-toward-causal2022.md
  - references/kiciman-llms-causal2023.md
title: Do foundation models need causal grounding?
description: Pearl and others argue that foundation models cannot achieve robust intelligence without explicit causal machinery — they need causal grounding.
---

# Do foundation models need causal grounding?

## The question

Pearl and others argue that foundation models cannot
achieve robust intelligence without explicit causal
machinery — they need *causal grounding*. Others
argue that scale and the right training produce
sufficient causal capability without explicit
machinery. Who's right?

## The Pearl argument

The argument from the causal hierarchy:

- LLMs are trained on observational text (rung-1
  data).
- Per the hierarchy theorem, rung-1 data does not
  determine rung-2 or rung-3 quantities in general.
- Therefore LLMs cannot do interventional or
  counterfactual reasoning except by accident or by
  pattern-matching causal text.
- For *real* causal capability, models need explicit
  causal machinery: structural causal models,
  do-calculus, identification analysis.

Pearl: AI without causality is stuck on rung-1
forever, no matter how much it's scaled.

## The empirical pushback

Counter-argument:

- LLMs *do* perform creditably on causal benchmarks
  (Kıcıman et al. 2023).
- Training-data text encodes substantial causal
  knowledge (people write about causes, effects,
  counterfactuals); models internalize this.
- Chain-of-thought enables multi-step causal
  reasoning that wasn't apparent from one-shot
  outputs.
- Foundation-model causal capabilities are improving
  empirically, possibly without theoretical
  guidance.

Defenders: empirical performance trumps
hierarchy-based theoretical impossibility claims.

## What's actually at stake

Several distinct claims to disentangle:

1. **Can LLMs do *some* causal reasoning?** Yes,
   empirically.
2. **Can LLMs do *all* causal reasoning humans can?**
   Unclear; mixed evidence.
3. **Do LLMs do causal reasoning *the way Pearl
   describes*?** Probably not — there's no internal
   SCM-and-do-calculus.
4. **Will scale alone close the gap?** Disputed.
5. **Is explicit causal augmentation needed?**
   Open.

The debate often conflates these.

## What grounding might mean

If we want "causal grounding" for foundation models,
several flavors:

- **Explicit causal modules.** Augment LLMs with
  do-calculus checkers, causal-graph extractors,
  intervention reasoners.
- **Causal training signal.** Train on
  intervention-rich data (RCT results,
  counterfactual scenarios).
- **Multi-environment training.** Force models to
  learn invariants by training on heterogeneous
  data.
- **Verification by causal tools.** Output causal
  claims; check with explicit causal-inference tools.
- **Causal world models.** Train models with
  explicit causal world models for action and
  planning.

These are not exclusive; all might play roles.

## Why this matters

- **Reliability.** If LLMs don't reason causally,
  they'll fail in causal-inference-heavy domains
  (medicine, policy, science).
- **Agent design.** Agents that act on the world
  need causal reasoning; how to build it matters.
- **Safety.** Counterfactual fairness and
  algorithmic recourse depend on causal capability.
- **Scientific use.** Whether to trust LLMs as
  scientific assistants depends on their causal
  capability.

## What might resolve it

- **Mechanistic interpretability.** Determine
  whether LLM internals do causal-reasoning-like
  computation.
- **Targeted benchmarks.** Test causal reasoning
  outside training distribution.
- **Hybrid systems.** Empirically compare
  LLM-only vs LLM-plus-causal-tools.
- **Theory of pre-trained causal capability.**
  Characterize what training-data composition
  produces what causal capability.

## Status

Genuinely open and central to the future of AI.
Likely the answer is "some grounding helps for some
tasks but the form depends on task." More refined
debate awaits empirical and mechanistic clarification.
