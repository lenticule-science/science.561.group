---
title: "polymorphism"
aliases:
  - "polymorphism"
date-created: 2026-01-01
type: term
tags: []
defines:
  - "polymorphism"
---

Polymorphism allows code to operate on [objects](./object.md) of different types through a shared interface. When a method call is dispatched to an object, the runtime selects the implementation based on the object's actual type, not the declared type of the reference. This enables writing code that works with any type satisfying an interface, without knowing the concrete type at compile time.
