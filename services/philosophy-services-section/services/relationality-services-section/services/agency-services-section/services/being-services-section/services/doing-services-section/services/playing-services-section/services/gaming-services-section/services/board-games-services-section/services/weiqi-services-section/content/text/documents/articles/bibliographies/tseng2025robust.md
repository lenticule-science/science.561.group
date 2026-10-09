---
type: bibliography
key: tseng2025robust
reference-type: paper-conference
authors:
  - Tseng, Tom
  - McLean, Euan
  - Pelrine, Kellin
  - Wang, Tony T.
  - Gleave, Adam
year: 2025
title: "Can Go AIs be adversarially robust?"
container-title: "Proceedings of the AAAI Conference on Artificial Intelligence (AAAI 2025)"
url: https://ojs.aaai.org/index.php/AAAI/article/view/34980
arxiv: "2406.12843"
verified: "https://arxiv.org/abs/2406.12843 and https://ojs.aaai.org/index.php/AAAI/article/view/34980, fetched 2026-09-04"
description: "Three defenses against the cyclic attack are tried: adversarial training on hand-constructed positions, iterated adversarial training, and a changed network architecture."
---

## Why this is central

Three defenses against the cyclic attack are tried: adversarial training
on hand-constructed positions, iterated adversarial training, and a changed
network architecture. Some protect against the attacks already found; none
withstands a freshly trained adversary, and most of the reliably effective
new attacks are "different realizations of the same overall class of cyclic
attacks." For this section that is the decisive fact: the blind spot is a
class, not an instance, and the class has a shape. A defense that patches
instances cannot close a class; only a reading that sees the shape can, and
that is what the cohomological reading in
[Strategy Spaces the Engines Cannot See](../research-articles/strategy-spaces-the-engines-cannot-see.md)
is for.

## What it does not settle

Whether the class is exactly "groups whose shape carries a nontrivial
cycle" is this section's reading of the examples, not a theorem in the
paper.

## Bridges

- [Wang et al. 2023](wang2023adversarial.md): the original attack.
