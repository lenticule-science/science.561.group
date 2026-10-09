---
name: "data structure"
aliases:
  - "data structure"
date-created: 2026-01-01
tags: []
description: "A **data structure** is a way of organizing, storing, and accessing data so that particular operations can be performed efficiently. The choice of data structure shapes what an [algorithm](algorithm.md) can do and how fast it can do it."
---

A **data structure** is a way of organizing, storing, and accessing data so that particular operations can be performed efficiently. The choice of data structure shapes what an [algorithm](algorithm.md) can do and how fast it can do it.

The simplest data structure is an **array**: a contiguous block of memory holding elements in a fixed order. Arrays allow fast access to any element by its position (index) but are slow to resize or insert elements in the middle, because doing so requires shifting everything that comes after.

A **linked list** solves the insertion problem by storing each element alongside a pointer to the next element. Inserting a new element requires only updating two pointers, regardless of the list's size. But accessing the hundredth element now requires following one hundred pointers in sequence — there is no way to jump directly to a position.

This tradeoff between access speed and modification speed illustrates a general principle: no single data structure is best for all operations. A **hash table** provides near-instant lookup by key but does not maintain any ordering among its elements. A **tree** (such as a binary search tree) maintains sorted order while allowing fast insertion and search, but its performance depends on whether the tree stays balanced.

More complex structures build on these foundations. A **graph** represents entities and the connections between them — useful for modeling networks, dependencies, or spatial relationships. A **stack** enforces last-in-first-out access, making it the natural structure for tracking nested operations like [function](function.md) calls. A **queue** enforces first-in-first-out access, appropriate for processing tasks in the order they arrive.

The study of data structures is closely tied to [algorithm](algorithm.md) analysis. An algorithm's efficiency often depends more on the data structure it operates on than on the cleverness of its logic.

## Related terms

- [algorithm](algorithm.md) — the procedures that operate on data structures
- [variable](variable.md) — a named reference to a value stored within a data structure
- [function](function.md) — a named operation that may accept or return data structures
