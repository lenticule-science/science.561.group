---
type: theorem
class: contemporary
status: informal
depends-on:
  - cdt-edt-divergence-newcomb.md
  - ../objects/decision-algorithm.md
see-also:
  - teaching/explanations/decision-theory.md
references:
  - references/yudkowsky-tdt2010.md
  - references/soares-fallenstein2015.md
title: FDT Newcomb resolution
description: Functional Decision Theory (FDT) prescribes the intuitively correct act on both Newcomb's problem (one-box) and the Smoking Lesion (smoke).
---

# FDT Newcomb resolution

## Statement (informal)

Functional Decision Theory (FDT) prescribes the *intuitively correct* act on both Newcomb's problem (one-box) and the Smoking Lesion (smoke).
FDT achieves this by treating the agent's *decision algorithm* — rather than the act — as the choice variable.

This is presented as *informal* because FDT is a research proposal, not a fully formalized theory: the choice of the relevant counterfactual ("what would the world look like if this algorithm output $x$ instead?") relies on logical counterfactuals whose semantics is debated.

## The FDT prescription

The FDT agent asks: *of the worlds in which my decision algorithm outputs $x$, which has highest expected utility?*

The conditional ranges over all *implementations* of the algorithm — the agent itself, plus any predictors, simulations, or copies.
Specifically:

$$ x_{\text{FDT}}^* = \arg\max_x \mathbb{E}_{w \sim P}[u(w) \mid A(w) = x] $$

where $A(w) = x$ asserts that *every* instance of algorithm $A$ in world $w$ outputs $x$.
The conditional couples the agent's output to the predictor's prediction (which is, by hypothesis, a function of the same algorithm).

## On Newcomb's problem

Conditional on "the algorithm outputs one-box": - The predictor (running the same algorithm in simulation) predicted one-box. - Box B contains $1M. - The agent takes only B and earns $1M.

Conditional on "the algorithm outputs two-box": - The predictor predicted two-box. - Box B contains $0. - The agent takes both boxes and earns $1{,}000.

FDT chooses one-box, earning $1M.

## On Smoking Lesion

The lesion causes the desire to smoke (and the cancer); the agent's *decision algorithm* — the cognitive process that chooses to act on the desire — is not caused by the lesion in the relevant sense.
Conditional on "the algorithm outputs smoke," the lesion remains as likely as it was unconditionally (the algorithm's output does not screen off the lesion's prevalence).
The agent gets the enjoyment and the unconditional cancer risk.

FDT smokes, matching the CDT (and intuitive) verdict.

## Why this works

The trick is what FDT *holds fixed* in its counterfactual:

- **CDT** holds the past fixed and varies the act, severing causal arrows into the act.
- **EDT** holds nothing fixed and reads off the conditional distribution.
- **FDT** holds *the algorithm* fixed and varies its output, considering the joint logical counterfactual across all instances of the algorithm.

This treats Newcomb's predictor as *running the algorithm* (hence the agent's act and the prediction co-vary in the counterfactual) and treats the Smoking Lesion's lesion as *not running the algorithm* (hence the algorithm's output and the lesion's prevalence do not co-vary).

## Limits

FDT is *informal* in several respects:

- **Logical counterfactuals.** What does "the world in which algorithm $A$ outputs $x$" mean when $A$ deterministically outputs something else?
  Standard logic makes such counterfactuals trivial; FDT requires a substantive theory.
- **Algorithm individuation.** When are two physical computations "the same algorithm"?
  Source-equivalence is too strict; behavioral equivalence is too coarse.
- **Embedding effects.** How do partial implementations or approximations of an algorithm enter the counterfactual?

These open problems define the contemporary FDT research program.
See [are-fdt-and-udt-equivalent](are-fdt-and-udt-equivalent.md).

## Why it matters

FDT (or its near-equivalents UDT and TDT) is the most-developed contemporary alternative to CDT/EDT for embedded agents.
It gives a principled answer to Newcomblike scenarios that includes essentially every situation where a powerful predictor models an AI agent — which, increasingly, includes any AI deployed against modeling adversaries.
