---
type: reference
class: foundational-paper
status: active
cites:
  - teaching/explanations/stigmergy.md
  - teaching/explanations/from-classical-to-llm-swarms.md
  - teaching/explanations/why-stigmergy-works.md
---

# Grassé (1959) — La reconstruction du nid

**Full citation:** Grassé, P.-P.
(1959).
"La reconstruction du nid et les coordinations interindividuelles chez Bellicositermes natalensis et Cubitermes sp.
La théorie de la stigmergie: Essai d'interprétation du comportement des termites constructeurs." *Insectes Sociaux*, 6(1), 41–80.

## Summary

The originating paper for the concept of stigmergy.
Grassé observed that termites constructing complex nests (*Bellicositermes natalensis* and *Cubitermes sp.*) coordinate without any individual termite holding a plan or directly communicating with others.
He coined the term *stigmergy* — from Greek *stigma* (sign) and *ergon* (work) — to name the coordination mechanism: each termite responds to the local state of the partially constructed nest, and the nest itself carries the coordination signal across termites and across time.

The paper's central claim is that the structure of the nest, evolving through accumulated termite actions, is itself the medium of coordination.
The mechanism explains how a colony of insects with limited individual cognition produces architecturally complex structures.

## Contribution to the swarm-intelligence theory

This is the conceptual root of the [stigmergy](teaching/explanations/stigmergy.md) concept.
Every subsequent technical development — Dorigo's pheromone fields in ACO, the trace-field formalisms, the boids-style local-rule models — descends from Grassé's observation that *the environment itself can be a coordination channel*.

The [stigmergy-decouples-coordination-cost](../theorems/stigmergy-decouples-coordination-cost.md) theorem in this theory formalizes the cost-structural consequence of the mechanism Grassé identified: when coordination is mediated by the environment rather than by inter-agent messaging, the cost of coordination is bounded by environment size rather than population size.

## Historical position

The paper is sometimes cited as 1959 in *Insectes Sociaux*; the underlying observations and the theoretical framework were developed through Grassé's longer career on social insects.
The 1959 paper is the first published statement of the stigmergy theory under that name.

## Notes on citation practice

Grassé wrote in French and the term *stigmergie* entered English- language scientific literature primarily through citations and secondary explanations rather than through direct translation.
The canonical English-language exposition is in [bonabeau-dorigo-theraulaz1999](bonabeau-dorigo-theraulaz1999.md), which presents Grassé's original framework in modern terms and positions it within the consolidating swarm-intelligence field.
