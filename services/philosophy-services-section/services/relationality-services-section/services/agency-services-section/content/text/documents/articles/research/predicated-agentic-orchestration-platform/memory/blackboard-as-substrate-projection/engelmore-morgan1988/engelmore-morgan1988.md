---
type: reference
class: academic
status: cited
authors: [Engelmore, Robert, Morgan, Tony]
year: 1988
title: "Blackboard Systems"
venue: "Addison-Wesley"
description: R.
---

## Source

R.
Engelmore, T.
Morgan (eds.). *Blackboard Systems*.
Addison-Wesley, 1988.

## Form

Edited volume.
The standard reference for the *blackboard system* architecture, consolidating the lineage from HEARSAY-II (Erman, Lesser, Reddy 1980) through the BB1, GBB, and HEARSAY-III generations.

## Content summary

Consolidates the blackboard architecture: a problem-solving framework in which independent *knowledge sources* (KSes) cooperate through a shared *blackboard* — a partitioned, hierarchically-organized data structure recording the current solution state.
Each KS monitors the blackboard and, on detecting a pattern that matches its trigger condition, may contribute to the blackboard by adding, modifying, or refining solution elements.
A *control component* arbitrates between KSes that are simultaneously eligible to contribute, using priorities, focus-of-attention heuristics, or explicit control rules.
The blackboard is hierarchically organized into *levels* (raw data, hypotheses, intermediate solutions, final solutions); KSes typically operate within or between levels, mapping evidence at one level to hypotheses at another.
The architecture became the canonical reference for *opportunistic* problem-solving — solutions emerge from the interaction of specialized KSes whose contributions are coordinated by the blackboard's structure rather than by an explicit control flow.
