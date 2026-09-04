---
type: bibliography
key: wang2023adversarial
reference-type: paper-conference
authors:
  - Wang, Tony T.
  - Gleave, Adam
  - Tseng, Tom
  - Pelrine, Kellin
  - Wang, Nora
  - Chen, Joseph
  - Miller, Michael D.
  - Dennis, Michael D.
  - Shah, Yawen
  - Krishnan, Ayush
  - Russell, Stuart
year: 2023
title: "Adversarial Policies Beat Superhuman Go AIs"
container-title: "Proceedings of the 40th International Conference on Machine Learning (ICML 2023), PMLR 202"
url: https://proceedings.mlr.press/v202/wang23g.html
arxiv: "2211.00241"
verified: "https://arxiv.org/abs/2211.00241 and https://proceedings.mlr.press/v202/wang23g.html, fetched 2026-09-04"
---

## Why this is central

The existence proof that a strategy space invisible to current engines
exists. Adversarial policies trained against KataGo at superhuman settings
win more than 97 percent of games "not by playing Go well" but by inducing
blunders; the attack transfers zero-shot to other superhuman engines and is
simple enough that human experts execute it by hand. The dominant attack is
the *cyclic* attack: the adversary lets the engine build a large group whose
shape encircles the adversary's stones, and the engine misjudges that
group's liberties and lets it be captured. The section's reading, in
[Strategy Spaces the Engines Cannot See](../research-articles/strategy-spaces-the-engines-cannot-see.md),
is that the blind spot is topological: a group whose shape carries a
nontrivial cycle, and whose safety depends on coordination outside the
network's effective field, is exactly the object the coordination-cohomology
reading counts and a scalar evaluation cannot.

## What it does not settle

It finds the exploit by training an adversary, not by computing it from a
board invariant; whether the invariant predicts the exploit is this
section's conjecture, not the paper's claim.

## Bridges

- [Tseng et al. 2025](tseng2025robust.md): the defenses tried and why they fail.
- [Silver et al. 2016](silver2016.md), [2017](silver2017.md), [Wu 2019](wu2019.md): the engines attacked.
