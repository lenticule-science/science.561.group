---
name: system

description: "A system is two machines working together: an authoring machine and a runtime machine. The authoring machine produces content; the runtime machine executes it."
defines: System
---

## What it is

A **system** is two machines with complementary roles. One machine is the authoring
layer — it is where content is created, versioned, and maintained. The other is the
runtime layer — it ingests that content and executes it as a live service. The authoring
layer feeds the runtime; the runtime does not write back to the authoring layer.

## MUST

- The authoring layer is the single source of truth for all content
- The runtime layer derives its state from the authoring layer, never independently
- The two machines communicate in one direction only: authoring → runtime

## CAN

- The runtime layer cache or mirror content for performance
- The two machines be deployed independently

## CANNOT

- The runtime layer author new content — it only executes content authored in the
  authoring layer
- There be more than one authoring layer or more than one runtime layer in the system
