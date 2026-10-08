---
description: A state a wealth or population process cannot leave once reached, such as ruin or extinction, which makes the process non-ergodic.
identity: absorbing-barrier
name: Absorbing Barrier
date-created: 2026-09-02
references:
  peters2019:
    authors:
      - Ole Peters
    title: The ergodicity problem in economics
    year: 2019
    publication: Nature Physics
    doi: 10.1038/s41567-019-0732-0
  feller1968:
    authors:
      - William Feller
    title: An Introduction to Probability Theory and Its Applications, Vol. 1
    year: 1968
    publisher: Wiley
    note: 3rd edition
---
An absorbing barrier is a state that a wealth or population process cannot leave once it reaches it — ruin, extinction, insolvency. Once the process is absorbed, it stays absorbed: there is no future draw, however favorable, that returns the process to circulation. Feller's classical treatment of random walks and diffusion processes (1968) develops the absorbing boundary as the case in which a particle reaching the boundary is removed from the state space rather than reflected back into it.

An absorbing barrier is distinguished from a reflecting or merely bad state, from which the process can still recover: a large loss that leaves capital positive, or a low population that can still reproduce, is bad but not absorbing. It is also distinguished from [risk of ruin](./risk-of-ruin.md), which names the probability that a process reaches the absorbing barrier before a target or horizon — the barrier is the state; risk of ruin is the probability of reaching it.

The presence of an absorbing barrier is why a wealth or population process built on it is non-ergodic: an ensemble average taken across many trajectories keeps averaging in the survivors even after some trajectories have been absorbed, so the ensemble average diverges from what happens to any one trajectory that is absorbed. No later gain in a surviving trajectory compensates for a trajectory that has already ended.
