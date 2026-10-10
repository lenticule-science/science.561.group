---
name: loading
gerund: loading
agent-noun: loader
imperative: load
description: Reading the current state of a substrate area and writing it into a working location so other tools find it where they expect.
---

A load transformer.
Input is a source location and a target location.
Output is the target populated with the source's current state, with any required format translation applied.

## Domain and codomain

- **Domain:** a load-spec — a tuple of `(source-location, target-location, format-translation)` where source and target are addressable locations and format-translation is the (possibly identity) function that maps source-format to target-format.
- **Codomain:** a witness record naming the source, the target, the number of items loaded, and any items that failed translation.

## Morphological forms in naming grammar

- `gerund: loading` heads skills built on this transformer: `loading-the-character-memory`, etc.
- `agent-noun: loader` heads agents that invoke such skills: `loader-of-the-character-memory`, etc.
- `imperative: load` heads scripts that body such skills: `load-the-character-memory.mjs`, etc.
