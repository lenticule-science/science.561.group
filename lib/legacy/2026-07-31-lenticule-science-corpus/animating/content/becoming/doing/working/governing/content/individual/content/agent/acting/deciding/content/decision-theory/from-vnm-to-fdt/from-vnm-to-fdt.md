---
type: narrative
status: active
see-also:
  - ../theorems/vnm-utility-theorem.md
  - ../theorems/cdt-edt-divergence-newcomb.md
  - ../theorems/fdt-newcomb-resolution.md
---

# From VNM to FDT

The arc of decision theory across the twentieth and early twenty-first centuries can be told as a sequence of axiom systems, each prompted by the failure of its predecessor on a class of problems.

## VNM (1944): preferences over lotteries

The starting point is von Neumann and Morgenstern.
A rational agent has preferences over lotteries; the four axioms (completeness, transitivity, continuity, independence) suffice to extract a real-valued utility function such that the agent's preferences are represented by expected-utility comparison.
See [vnm-utility-theorem](../theorems/vnm-utility-theorem.md).

This is, normatively, the founding result.
It says that *coherent risk preferences* reduce to one number per outcome.
But VNM takes probabilities as primitive: lotteries come with their probabilities labeled.
Where do the probabilities come from?

## Savage (1954): preferences over acts

Savage answers by deriving probability from preference.
The agent has preferences over *acts* (functions from states to outcomes); axioms — including the famously contested Sure-Thing Principle — yield both a utility function and a subjective probability.
The combined representation is the Savage expected-utility framework that dominates twentieth-century economics, statistics, and decision science.

## Jeffrey (1965): evidential decision theory

Jeffrey takes preferences over *propositions* and uses conditional probabilities for evidential reasoning.
The expected utility of an act $a$ is $\sum_s P(s \mid a)\, u(o(a, s))$ — the expectation conditional on the act.
This is **Evidential Decision Theory**.

EDT is elegant and tractable, and it correctly handles cases where act-state correlation is causal.
It famously breaks on the *Smoking Lesion*: smoking is evidence of having a cancer-causing lesion (lesion causes smoking-desire and cancer), but it's not the cause of cancer.
EDT's prescription to abstain feels wrong.

## Gibbard-Harper (1978): causal decision theory

Gibbard and Harper isolate the failure as a *causal* one and propose **Causal Decision Theory**: condition on $\mathrm{do}(a)$ rather than $a$, severing causal arrows into the act.
CDT correctly handles Smoking Lesion (the lesion is unaffected by the act, so the conditional cancer probability is just the unconditional probability).

But now CDT breaks on *Newcomb's Problem*: a powerful predictor predicts your act and stocks the boxes accordingly.
CDT says two-box (the prediction is in the past, can't be affected); but the predictor's accuracy means two-boxers consistently earn $1{,}000 while one-boxers earn $1{,}000{,}000.

EDT and CDT each give the intuitive answer on one of the two problems, neither on both.
See [cdt-edt-divergence-newcomb](../theorems/cdt-edt-divergence-newcomb.md).

## FDT (Yudkowsky-Soares 2010s): the algorithm as choice variable

Functional Decision Theory takes the *decision algorithm* itself as the choice variable.
The agent asks: of the worlds where this algorithm outputs $x$, which has highest expected utility?
On Newcomb, the predictor and the agent are both running the same algorithm; conditioning on "the algorithm outputs one-box" couples the agent's act to the prediction; FDT one-boxes.
On Smoking Lesion, the algorithm is the agent's *decision procedure*, not the lesion (which is biology, not deliberation); conditioning on the algorithm's output does not shift the lesion's probability; FDT smokes.
See [fdt-newcomb-resolution](../theorems/fdt-newcomb-resolution.md).

## Where this is going

FDT remains informal: logical counterfactuals are not fully formalized.
The frontier of the agent-foundations program is to give them a substrate, possibly via [logical-induction](../teaching/explanations/logical-induction.md), possibly via Cartesian frames, possibly via something not yet invented.

The arc is one of widening domain: each successor theory correctly handles its predecessor's domain plus a new class of problems the predecessor mishandled.
The pattern points forward to a decision theory that handles the embedded-agency problems FDT itself does not.
