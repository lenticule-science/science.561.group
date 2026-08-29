---
part-of:
  - functional

title: "immutability"
aliases:
  - "immutability"
date-created: 2026-01-01
tags: []
---

**Immutability** is the [property](../../../../../../../../../humanities/theories/philosophy/terms/property.md) of data that cannot be modified after it is created. An immutable value is fixed at the moment of its creation; any operation that appears to "change" it instead produces a new value, leaving the original intact.

In contrast, mutable data can be altered in place. A mutable list allows elements to be added, removed, or replaced directly. An immutable list does not — appending an element produces a new list that contains all the original elements plus the new one, while the original list remains unchanged.

Immutability matters because mutation is a common source of bugs. When multiple parts of a program share a reference to the same mutable data, any one of them can modify it, and the others may not expect the change. This leads to action-at-a-distance errors that are difficult to trace. Immutable data eliminates this category of bug entirely: if data cannot change, sharing it is safe.

In concurrent programs — where multiple threads or processes execute simultaneously — immutability is particularly valuable. Mutable shared data requires synchronization mechanisms (locks, semaphores) to prevent conflicting modifications. Immutable data needs no synchronization, because there is nothing to conflict.

[Functional programming](/technology/disciplines/computing/software/programming/functional/index.md) treats immutability as a default. Languages like Haskell make all values immutable unless the programmer explicitly opts into a controlled form of mutation. Other languages, like JavaScript or Python, allow mutation freely but provide immutable alternatives (frozen objects, tuples) for situations where safety matters.

Immutability has a cost: creating new data structures instead of modifying existing ones uses more memory and processing time. In practice, functional languages use **persistent data structures** — structures that share unchanged parts between the old and new versions, reducing the overhead of immutable updates.

