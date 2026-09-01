---
title: Recognition Universe
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Universe of recognitions of recognitions—type-like carrier for higher-order
reasoning.

## Definition
- Carrier: higher-level recognitions whose elements are themselves recognitions
  from the [Recognition Carrier](recognition.md).
- Structure: supports universe operations (lowering/closing) and self-reference.

## Invariants
- Closure: universe closed under earned logical operations.
- Hierarchy: may be stratified to avoid paradox; lowering maps back to base
  recognitions.

## Proof
- Uses: recognition carrier to build a universe object.
- Shows that: higher-order recognitions can be handled as a universe structure.
