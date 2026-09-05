---
type: question
class: open-problem
status: open
see-also:
  - teaching/explanations/rlhf.md
  - ../objects/reward-model.md
  - can-rlhf-be-made-robust-to-overoptimization.md
references:
  - references/amodei-concrete-problems2016.md
  - references/christiano-rlhf2017.md
---

# Scalable oversight

Reward signals in [RLHF](teaching/explanations/rlhf.md) come, ultimately, from
human evaluators comparing model outputs. As model capabilities
exceed evaluator capabilities — when the model can produce outputs
the evaluator cannot reliably judge — the preference signal becomes
unreliable, and the [reward model](../objects/reward-model.md)
trained from it inherits the unreliability.

**Question.** What training, evaluation, and feedback mechanisms
allow human oversight of model behavior in regimes where the model's
outputs exceed the evaluator's ability to directly verify them?

## Why this is the key bottleneck

The [reward-hacking-inevitability](../theorems/reward-hacking-inevitability.md)
theorem says optimization will exploit any divergence between proxy
and true reward. In RLHF the proxy is a function trained from human
preference data. As long as humans can *recognize* good outputs even
if they cannot *produce* them, the proxy can in principle be made
arbitrarily good.

When humans can no longer reliably *recognize* good outputs, the
proxy training data is itself unreliable, and no amount of
proxy-training improvement helps.

## Approaches under investigation

**Debate** (Irving, Christiano, Amodei 2018). Two AI systems argue
for opposite positions in front of a human judge. The judge does not
need to verify the answers directly; only to evaluate which side's
arguments are stronger. Provably reduces the supervision burden in
toy settings; empirical results in LLM-debate setups (2024–2025) are
mixed.

**Iterated amplification** (Christiano, Shlegeris, Amodei 2018).
A weaker overseer evaluates the outputs of a stronger system one
piece at a time, with assistance from copies of the stronger system
acting as subordinates. Recursive in the same way debate is.

**Recursive reward modeling** (Leike et al. 2018). Train a
reward model for task $T$ using oversight that itself is improved by
RL on a simpler oversight task $T'$. The oversight problem is
decomposed rather than directly solved.

**Constitutional AI / RLAIF** (Bai et al. 2022). Replace some human
oversight with AI critique, with the critique model trained to apply
written principles. Reduces labeling cost; trades direct human
oversight for principle-following oversight, with the question of
whether the principles capture what the humans would have wanted.

**Process supervision** (Lightman et al. 2023, Uesato et al. 2022).
Have humans supervise *steps* of the model's reasoning rather than
final outputs. Provides denser signal and is robust to outputs the
human cannot directly verify, *if* the human can verify the
intermediate reasoning.

## Why none of these is yet a solution

Each approach reduces the oversight burden at a fixed capability
level. None has been shown to scale: as model capability grows, all
of them eventually run into a regime where the structure of the
oversight scheme is itself something the model can game. The proposed
mechanisms can be analyzed at each capability level in turn but no
analysis covers the full asymptotic regime.

A complete answer would specify: (i) a class of oversight mechanisms,
(ii) a sense in which the mechanism's reliability is preserved as
capability scales, (iii) conditions under which (ii) holds.

## Connection to the agents theory

If scalable oversight remains unsolved, the [agents theory](../../agents/_index.md)'s
deliberative agents have an upper bound on the reliability of any
behavior they have been RLHF-trained to perform: the bound is set by
the RLHF training pipeline's effective oversight quality. This
propagates into the
[three-condition-characterization](../../agents/theorems/three-condition-characterization.md)
in the form of a sub-condition on the *reliability* dimension that
this theory cannot itself improve.
