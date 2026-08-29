---
title: Evaluation Context
id: evaluation-context
role: structure
status: plan
emerges_from: seed-evaluation-context
proof_refs:
- seed-evaluation-context
- build-evaluation-context
- hypertensor-section
- coverage-site
fields:
- name: spine
  type: hypertensor-section
  description: section with a distinguished hole window.
- name: hole_scope
  type: coverage-site
  description: coverage where the hole may be filled.
- name: plug
  type: hypertensor-section
  description: section used to fill the hole (plugged under admissible flow/nucleus).
- name: empty
  type: evaluation-context
  description: neutral frame acting as identity under plug/compose.
---

# Evaluation Context

Frame with a single distinguished hole over a hypertensor section. Generated
from the acts [Seed Evaluation Context](../acts/seed-evaluation-context.md) and
[Build Evaluation Context](../acts/build-evaluation-context.md).

## Definition
- `spine`: partial [Hypertensor Section](hypertensor-section.md) with one hole.
- `hole_scope`: [Coverage Site](coverage-site.md) admissible for filling.
- `plug`: section used to fill the hole (respecting flow/nucleus).
- `empty`: neutral frame acting as identity.

## Invariants
- Neutrality: plugging into `empty` yields the original section.
- Locality: plugging respects `hole_scope` and admissible flow/nucleus.
- Composability: frames compose associatively where holes nest.

## Proof
- Uses: acts [Seed Evaluation Context](../acts/seed-evaluation-context.md) and
  [Build Evaluation Context](../acts/build-evaluation-context.md) to generate
  frames, plug, and neutral elements; sheaf/topos acts for admissible glue.
- Shows that: frames form the basis for evaluation contexts with well-defined
  plug/compose operations and a neutral element over hypertensor sections.
