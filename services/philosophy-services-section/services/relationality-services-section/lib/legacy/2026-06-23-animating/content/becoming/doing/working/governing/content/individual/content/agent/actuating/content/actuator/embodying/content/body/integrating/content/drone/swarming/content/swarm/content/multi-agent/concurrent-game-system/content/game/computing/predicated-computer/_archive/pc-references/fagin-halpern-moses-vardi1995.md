---
type: reference
class: academic
status: cited
authors: [Fagin, Ronald, Halpern, Joseph Y., Moses, Yoram, Vardi, Moshe Y.]
year: 1995
title: "Reasoning About Knowledge"
venue: "MIT Press"
see-also: [../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/references/fagin-halpern-moses-vardi1995]
---

## Source

R. Fagin, J. Y. Halpern, Y. Moses, M. Y. Vardi. *Reasoning About Knowledge*. MIT Press, 1995.

## Form

Textbook. Math-side annotation at [predication-categories/references/fagin-halpern-moses-vardi1995](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/references/fagin-halpern-moses-vardi1995.md); this entry positions the same source for the engineering register, where it grounds the substrate's *agent-knowledge-as-substrate-content* discipline.

## Content summary

Develops the modal logic of knowledge for multi-agent systems: each agent has a knowledge modality $K_a$ ("agent $a$ knows $\phi$"); group-knowledge modalities include *everyone-knows* $E_G \phi = \bigwedge_{a \in G} K_a \phi$ and the recursively-stronger *common knowledge* $C_G \phi$ (everyone knows, everyone knows that everyone knows, ...); semantics is given through Kripke structures (sets of possible worlds with per-agent indistinguishability relations). The textbook covers: axiomatizations of S5 and weaker logics for knowledge; computability and complexity of model checking; the *coordinated attack* problem and the impossibility of common knowledge in asynchronous systems with unreliable channels; protocols for *eventual* common knowledge and approximate variants; the relationship to belief revision, public announcement logic, and dynamic-epistemic logic; applications to distributed-systems analysis (the role of common knowledge in agreement protocols). The textbook is the load-bearing reference for *what it means for agents to know things in a distributed system*.
