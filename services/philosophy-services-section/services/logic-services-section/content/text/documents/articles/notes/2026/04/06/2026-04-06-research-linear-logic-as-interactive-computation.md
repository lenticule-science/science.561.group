---

title: "Linear Logic as Interactive Computation"
description: "The Curry-Howard correspondence for linear logic maps proofs to interactive programs — Abramsky showed this in 1993, Hyland-Ong proved game semantics fully models PCF, and Martens built a working interactive fiction language on the result."
date-created: 2026-04-06
requires:
  - linear-logic
  - residuated-lattice
teaches:
  - curry-howard-for-linear-logic
  - game-semantics
  - ceptre
traditions:
  - proof-theory
  - game-semantics
  - programming-language-theory
references:
  - id: abramsky1993
    type: document
    title: Computational Interpretations of Linear Logic
    author:
      - literal: S. Abramsky
    container-title: Theoretical Computer Science, 111(1–2), 3–57
    issued:
      - year: 1993
  - id: abramsky-jagadeesan1994
    type: document
    title: Games and Full Completeness for Multiplicative Linear Logic
    author:
      - literal: S. Abramsky
      - literal: R. Jagadeesan
    container-title: Journal of Symbolic Logic, 59(2), 543–574
    issued:
      - year: 1994
  - id: hyland-ong2000
    type: document
    title: On Full Abstraction for PCF
    author:
      - literal: M. Hyland
      - literal: C.-H. L. Ong
    container-title: Information and Computation, 163(2), 285–408
    issued:
      - year: 2000
  - id: martens2015
    type: document
    title: Programming Interactive Worlds with Linear Logic
    author:
      - literal: C. Martens
    container-title: Ph.D. dissertation, Carnegie Mellon University
    issued:
      - year: 2015
  - id: martens2023
    type: document
    title: Modeling Game Mechanics with Ceptre
    author:
      - literal: C. Martens
    container-title: IEEE Transactions on Games
    issued:
      - year: 2023
  - id: martens2025
    type: document
    title: Finite-Choice Logic Programming
    author:
      - literal: C. Martens
    container-title: POPL 2025
    issued:
      - year: 2025
  - id: girard1987
    type: document
    title: girard1987
    author:
      - literal: J.-Y. Girard
    container-title: Theoretical Computer Science, 50(1), 1–102
    issued:
      - year: 1987
---

The Curry-Howard correspondence says proofs are programs. For classical logic, proofs correspond to lambda calculus terms — pure functional programs. For [linear logic](../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/linear-logic.md), what do proofs correspond to?

Interactive programs. Programs that consume inputs, produce outputs, respond to messages, and maintain state through resource tracking. This is not a metaphor — it is a theorem with multiple independent proofs.

## Abramsky: proofs as concurrent processes

Abramsky (1993) gave the first systematic computational interpretation of linear logic. He showed two readings:

**Intuitionistic linear logic** corresponds to a refined lambda calculus where every variable is used exactly once. This gives fine control over evaluation order and storage allocation — each argument is consumed, not copied. The $!$ modality ("of course") marks resources as reusable, recovering classical behavior selectively.

**Classical linear logic** corresponds to concurrent processes in Berry-Boudol's chemical abstract machine (CHAM). Sequents are multisets of molecules; inference rules are chemical reactions. The tensor $A \otimes B$ is parallel composition. Linear implication $A \multimap B$ is a reaction that consumes $A$ and produces $B$. Cut elimination is computation.

This means the [residuation](../../../../research/2026/07/algebra/terms/residuated-lattice.md) $a \odot p \leq_t q$ iff $p \leq_t (a \Rightarrow q)$ — the same adjunction that structures [predication on bilattice-valued fibers](../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/documents/articles/research-articles/the-adjoint-structure-of-predication-on-bilattice-valued-fibers.md) — has direct computational content. Extending ($\odot$) is parallel composition of processes. Restricting ($\Rightarrow$) is a process that consumes one input and produces one output.

## Game semantics: strategies as programs

Abramsky and Jagadeesan (1994) proved full completeness for multiplicative linear logic via game semantics: every strategy in a certain class of games corresponds to a proof. Linear logic proofs ARE winning strategies in two-player games where moves are resource exchanges.

Hyland and Ong (2000) extended this to PCF — a programming language with booleans, natural numbers, conditionals, and recursion. Their game-semantic model is *fully abstract*: two programs are observationally equivalent if and only if they determine the same strategy. Since PCF is Turing-complete, this means game semantics over linear types models all of sequential computation — including conditional branching, pattern matching, loops, and recursion.

Conditional branching in game semantics is not simulated or encoded — it is native. A conditional is a game where one player asks a question and the other answers, and the continuation depends on the answer. The game structure IS the branching structure.

## Martens: interactive fiction on linear logic

Chris Martens (2015, CMU; now at Northeastern University) made this concrete. Her dissertation "Programming Interactive Worlds with Linear Logic" built **Ceptre**, a linear logic programming language for authoring interactive systems.

In Ceptre:

- **Game state** is a multiset of linear logic propositions. A room containing a sword and a lamp is `room(west_house), has(sword, west_house), has(lamp, west_house)`.
- **Player actions** are linear logic inference rules. "Take the sword" is a rule that consumes `has(sword, Location), at(player, Location)` and produces `carrying(player, sword)`. The preconditions are consumed — the sword is no longer in the room.
- **Interactive computation** is interactive proof search. The player chooses which rules to apply (which actions to take). The engine finds all applicable rules (available actions) and presents them. Applying a rule transforms the state.
- **State machines** are encoded naturally: a door's state is a linear proposition `door_state(closed)`. Opening it consumes `door_state(closed)` and produces `door_state(open)`. The old state is gone — consumed by the action.
- **Non-player behavior** is additional rules that fire automatically. An NPC that wanders is a rule `at(npc, X), adjacent(X, Y) -o at(npc, Y)` that the engine applies non-deterministically.

Martens tested Ceptre on combat games, social simulations, board games, and interactive storytelling. The state transitions are formally verifiable — linear logic's type system guarantees that resources are neither duplicated nor lost. If the rules are well-typed, the game cannot enter an impossible state.

She continued this work: "Modeling Game Mechanics with Ceptre" (IEEE Transactions on Games, 2023) applies the framework to real game design. "Finite-Choice Logic Programming" (POPL 2025) introduces Dusa, extending the paradigm with constraint-based generation.

## What this means for predication

The [Chu construction](../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/documents/articles/teaching-articles/explanations/the-chu-construction-and-linear-logic.md) proves that every bilattice-valued predicate system is a model of linear logic. The tensor/implication adjunction on the bilattice IS the $\otimes \dashv \multimap$ adjunction of linear logic. And linear logic, via Curry-Howard, IS a programming language for interactive systems.

This chain is tight:

| Layer | What it is | Citation |
|-------|-----------|----------|
| Bilattice algebra | $\odot / \Rightarrow$ on $\{\bot, t, f, \top\}$ | Busaniche-Cignoli 2014 |
| = Linear logic | $\otimes / \multimap$ via Chu construction | Jakl 2025 |
| = Interactive programs | Curry-Howard for linear logic | Abramsky 1993 |
| = Game strategies | Full abstraction for PCF | Hyland-Ong 2000 |
| = Working game engines | Ceptre language | Martens 2015 |

A system that computes via $\odot / \Rightarrow$ on bilattice-valued fibers is not merely *analogous* to a programming language for interactive worlds. It IS one, by the chain of theorems above. The question is not whether the algebra can express interactive computation — the question is how to write the specific rules for a specific world.

## See also

- [The Chu Construction and Linear Logic](../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/documents/articles/teaching-articles/explanations/the-chu-construction-and-linear-logic.md) — the bridge between bilattices and linear logic
- [What Is Linear Logic?](../../../../research/2026/07/31/lenticule-import/what-is-linear-logic.md) — introduction to resource-sensitive reasoning
- [The Adjoint Structure of Predication on Bilattice-Valued Fibers](../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/documents/articles/research-articles/the-adjoint-structure-of-predication-on-bilattice-valued-fibers.md) — the bilattice algebra that instantiates all of this
- [What Resource Sensitivity Means for Knowledge](../../../../../../../../../relationality-services-section/content/text/documents/articles/teaching-articles/explanations/what-resource-sensitivity-means-for-knowledge.md) — epistemic states as linear resources
