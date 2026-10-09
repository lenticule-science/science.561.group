---
type: reference
authors: [Brewka, Gerhard, Eiter, Thomas]
year: 2007
title: "Equilibria in Heterogeneous Nonmonotonic Multi-Context Systems"
venue: "Proceedings of the 22nd AAAI Conference on Artificial Intelligence (AAAI-07), 385–390"
description: G.
---

## Full citation

G. Brewka, T. Eiter. "Equilibria in heterogeneous nonmonotonic multi-context systems." In *Proceedings of the 22nd AAAI Conference on Artificial Intelligence (AAAI-07)*, pages 385–390, 2007.

## Status

Pending direct access. Cited via secondary literature on distributed nonmonotonic reasoning.

## Annotation

Foundational paper on **multi-context systems** (MCS): a framework for distributed reasoning where each *context* has its own theory (logic, knowledge base, possibly nonmonotonic), and contexts interact via **bridge rules** of the form $s_1 : p_1, \ldots, s_n : p_n \implies s : q$ — "if context $s_1$ believes $p_1$, …, $s_n$ believes $p_n$, then context $s$ should derive $q$." The semantics is given by *equilibria*: joint belief sets across contexts that are simultaneously fixed-points of all bridge rules.

For the corpus, this is the standard literature for **per-context / per-agent reasoning systems with inter-context propagation**, the closest external parallel to the corpus's [multi-observer system with rules](../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/objects/multi-observer-system-with-rules.md): per-observer rule systems are the corpus's analog of per-context theories; settling-morphisms between observers are the corpus's analog of bridge rules; the joint settling at $\sup_o \kappa_o$ (per the [CRDT convergence with per-observer rules theorem](../notes/undated/crdt-convergence-with-per-observer-rules.md)) is the corpus's analog of MCS equilibrium.

Cited in the agentic-swarm-theory study plan as the literature for **Direction 2: per-agent closure dynamics**. The corpus's distinctive content beyond MCS: bilattice-valued contexts (paraconsistency native), and the closure-2-monad framework for rule application (rather than fixed-point semantics on Boolean knowledge bases).

## Where used

- [Toward agentic swarm theory narrative](../notes/undated/toward-agentic-swarm-theory.md) — Direction 2 literature reference.
- [Multi-observer system with rules object](../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/objects/multi-observer-system-with-rules.md) — corpus's analog of multi-context systems.
- [CRDT convergence with per-observer rules theorem](../notes/undated/crdt-convergence-with-per-observer-rules.md) — corpus's analog of MCS equilibrium.
