---
name: Chain
description: "An ordered sequence of relational structures, typically tensions, at one shared depth: composite(k, [T1, ..., Tk], n) with k at least 2. Its identity is its components and their order; it can be deepened, nested and composed, and it is reconfigured by swap, flatten and merge, none of which adds an act beyond relating."
aliases: [chains, tension chain, chain of tension]
---
A **chain** is an ordered sequence of relational structures at one shared [relational depth](relational-depth.md), usually [tensions](tension.md):

$$\mathrm{chain}([T_1, \dots, T_k], n) := \mathrm{composite}(k, [T_1, \dots, T_k], n), \qquad k \geq 2.$$

It extends relational dynamics beyond a single pair to structured multiplicity.

## Properties

- **Order is identity.** Each component has a fixed position, so reordering gives a different chain ([composition](composition.md)).
- **One depth, one type.** Every component sits at the same depth and is of the same ontological type. Components from different depths are aligned first.
- **Closed under relating.** A chain is a relational structure. It can be reflexively deepened, keeping its order and each component's structure ([reflexive sequencing](reflexive-sequencing.md)), placed in tension with another structure, and nested inside another chain.

## Operations

These reconfigure a chain without introducing any act beyond relating:

- **Swap** exchanges the positions of two components.
- **Flatten** turns a chain of chains at one depth into a single chain, keeping order.
- **Merge** contracts two adjacent identical components into one.

Swap commutes with deepening: swapping and then deepening gives the same structure as deepening and then swapping. Merge and flatten also apply after deepening.

Chains that interconnect in branching patterns form a network: the relational units are its nodes, and the bindings between them are its edges.

## Related

- [Tension](tension.md), [Composition](composition.md)
- [Reflexive sequencing](reflexive-sequencing.md), [Relational depth](relational-depth.md)
