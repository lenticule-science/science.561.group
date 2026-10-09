---
type: reference
class: foundational
status: active
authors: ["Neil C. Rabinowitz", "Frank Perbet", "H. Francis Song", "Chiyuan Zhang", "S. M. Ali Eslami", "Matthew Botvinick"]
year: 2018
venue: "ICML 2018; arXiv:1802.07740"
title: "Machine Theory of Mind"
---

# Rabinowitz et al. 2018 — Machine Theory of Mind

Rabinowitz, N.C., Perbet, F., Song, H.F., Zhang, C., Eslami, S.M.A., & Botvinick, M.
(2018).
Machine Theory of Mind. *Proceedings of ICML 2018*. arXiv:1802.07740.

The DeepMind paper introducing the *Machine Theory of Mind (ToMnet)* architecture — a neural network trained to predict agent behavior across episodes by inferring agent characteristics (preferences, capabilities, beliefs) from observed action sequences.

Architecture:

- A *character net* embeds an agent's past episodes into a latent character representation.
- A *mental-state net* embeds the agent's current episode trajectory into a latent mental state.
- A *prediction net* combines these to predict the agent's next action.

Trained on populations of varied artificial agents (random, algorithmic, RL-trained, with different goals and biases), the network learned to:

- Predict actions of novel agents from short observation.
- Distinguish agent types accurately.
- Pass simulated false-belief tasks (predicting an agent will look where it *believes* an object is, not where it actually is).
- Generalize across agent populations.

The work was influential as:

- **The first compelling demonstration** that neural networks can develop ToM-like representations through training.
- **A benchmark architecture** for subsequent machine ToM research.
- **A bridge between cognitive science and deep learning.** Showing that neural networks can be evaluated using cognitive-science protocols.
- **An existence proof.** Implementations of machine ToM in connectionist architectures were possible.

The work predates the LLM era; subsequent debates about LLM ToM (Kosinski, Ullman, etc.) build on the framing this paper helped establish.

Cited by: [machine-theory-of-mind](teaching/explanations/machine-theory-of-mind.md), [the-llm-tom-debate](teaching/explanations/the-llm-tom-debate.md).
