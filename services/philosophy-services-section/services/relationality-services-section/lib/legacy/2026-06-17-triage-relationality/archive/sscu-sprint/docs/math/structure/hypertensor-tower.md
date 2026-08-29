---
title: Hypertensor Tower
role: structure
emerges_from: build-profile-tower
proof_refs:
- build-profile-tower
fields:
- name: base_fiber
  type: hypertensor-fiber
  description: fibre over which the tower is built.
- name: profiles
  type: matching-family
  description: layered profiles reconstructed upward from the fibre.
- name: flow_nucleus
  type: flow-nucleus-adjunction
  description: flow/nucleus compatibility along the tower.
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



## Definition
- Carrier: profile towers attached to each [Hypertensor Fiber](hypertensor-fiber.md).
- Source: earned from [Build Profile Tower](../acts/build-profile-tower.md) over stabilised recognitions.

## Invariants
- Compatible with composite towers via [Build Composite Profile Tower](../acts/build-composite-profile-tower.md).
- Respects flow/nucleus stability from [`flow`](../acts/flow.md) and [`nucleate`](../acts/nucleate.md).

## Proof
- Derived from: [Build Profile Tower](../acts/build-profile-tower.md), applying tower construction to fibres.
- Shows that: tower construction over fibres yields a well-defined carrier of hypertensor towers, stable under composition and flow/nucleus laws.
