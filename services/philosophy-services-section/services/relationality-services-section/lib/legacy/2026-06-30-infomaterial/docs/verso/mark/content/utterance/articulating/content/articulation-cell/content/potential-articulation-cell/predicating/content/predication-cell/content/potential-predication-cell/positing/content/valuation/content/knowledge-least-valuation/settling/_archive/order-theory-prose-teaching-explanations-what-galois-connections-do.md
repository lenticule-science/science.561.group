---
title: "What Galois Connections Do"
description: "An explanation of Galois connections for readers who understand functions but haven't seen the concept of two maps that partially undo each other."
date-created: 2026-03-31
depends-on: []
introduces:
  - galois-connection
  - adjoint-pair
  - formal-concept-analysis
type: concept-introduction
status: current
---
A [Galois connection](../morphisms/galois-connection.md) is a pair of maps between two ordered sets, where each map partially undoes the other.

## The idea

Suppose you have two collections — say, a set of people and a set of skills — with a relation between them (who has which skill). You can ask two questions:

- Given a group of people, what skills do ALL of them share?
- Given a group of skills, which people have ALL of them?

These two questions define two maps. The first goes from subsets of people to subsets of skills. The second goes from subsets of skills to subsets of people. They go in opposite directions, and they are connected: the more people you include, the fewer skills they all share. The more skills you require, the fewer people qualify.

This connection is not arbitrary. It satisfies a precise law:

$$\text{skills}(A) \supseteq B \quad\text{if and only if}\quad A \subseteq \text{people}(B)$$

"The group $A$ shares all skills in $B$" is the same statement as "everyone in $A$ qualifies for $B$." The two maps are [adjoint](../../categories/theories/ordinary-categories/texts/what-is-an-adjunction.md) — they are complementary views of the same relationship.

## What the connection extracts

When you compose the two maps — take a group of people, find their shared skills, then find everyone who has those skills — you typically get a LARGER group than you started with. The new group includes everyone who shares the same skill profile. Applying the maps again gives the same group (the process stabilizes).

These stable pairs — groups that map to a set of skills and back to themselves — are the **formal concepts** of [formal concept analysis](../../../../information/terms/formal-concept-analysis.md). They form a [lattice](../objects/lattice.md): the [concept lattice](../objects/concept-lattice.md).

The Galois connection extracts structure from a relation. You put in raw data (who has which skill) and you get out an organized hierarchy of concepts. The hierarchy was implicit in the data; the Galois connection makes it explicit.

## Where they appear

Galois connections appear whenever two kinds of things are related and you want to extract structure from the relationship:

- **Formal concept analysis**: objects and attributes. The Galois connection gives the concept lattice.
- **Algebraic geometry**: polynomial ideals and algebraic varieties. The Galois connection (Hilbert's Nullstellensatz) links equations to their solution sets.
- **Logic**: theories and models. The Galois connection links axiom sets to the classes of structures satisfying them.
- **Residuated lattices**: for each element $a$, the maps $x \mapsto a \cdot x$ and $y \mapsto a \to y$ form a Galois connection. This is the [residuation](../../algebra/objects/residuated-lattice.md) — and it is the algebraic structure of predication.

The pattern is always the same: two kinds of things, a relation between them, two maps going in opposite directions, a law connecting the maps. The structure that emerges from the connection — the concept lattice, the variety, the model class, the residuated algebra — is determined by the relation, not imposed from outside.
