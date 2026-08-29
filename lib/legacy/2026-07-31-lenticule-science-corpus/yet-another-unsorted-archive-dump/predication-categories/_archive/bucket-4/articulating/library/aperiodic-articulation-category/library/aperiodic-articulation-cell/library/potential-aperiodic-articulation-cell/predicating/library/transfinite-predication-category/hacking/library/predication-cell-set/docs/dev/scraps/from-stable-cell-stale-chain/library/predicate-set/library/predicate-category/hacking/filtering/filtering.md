---
name: filtering
gerund: filtering
agent-noun: filterer
imperative: filter
description: A transformer that takes a set and a predicate and emits the subset of elements for which the predicate holds.
---

A filtering transformer reads a set of candidates and a predicate, applies the predicate to each candidate, and returns the subset for which the predicate holds. The predicate may be deterministic (a regex, a property check) or may itself be the result of a dispatched call (e.g., asking a model "does this candidate apply to this paragraph?"); the transformer is agnostic to how the predicate is computed.

Filtering is distinct from matching: matching is constrained to token-presence predicates over a fixed token stream, while filtering admits arbitrary predicates including those that require external calls. Filtering is therefore the broader operation; matching is a deterministic specialization of filtering.

## Domain and codomain

- **Domain:** a set of candidate elements (any type) and a predicate (a callable that yields a boolean for each element, possibly via external dispatch).
- **Codomain:** the subset of candidates for which the predicate held.

## Morphological forms in naming grammar

- `gerund: filtering` heads skills built on this transformer: `filtering-skills-mentioned-in-a-paragraph`.
- `agent-noun: filterer` heads agents that invoke such skills: `filterer-of-skill-mentions-in-a-paragraph`.
- `imperative: filter` heads scripts that body such skills: `filter-skills.mjs`.
