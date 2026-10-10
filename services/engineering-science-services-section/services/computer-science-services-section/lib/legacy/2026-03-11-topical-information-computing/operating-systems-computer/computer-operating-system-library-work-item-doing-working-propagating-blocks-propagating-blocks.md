---
name: propagating-blocks
description: A closure-rule-firing transformer that walks the depends-on graph and derives blocked status transitively. Implements the block-propagation closure rule from the work-item-as-predication-shape derivation. NOT a positing — closures are a distinct layer in PS that derives consequences from positings.
specializing: closure-rule-firing
acting-on-graph: depends-on
deriving: has-status
---

A **propagating-blocks** call walks the depends-on graph and derives blocked status: for every work-item a with $(a, \text{depends-on}, b) \wedge (b, \text{has-status}, \text{blocked})$, derive $(a, \text{has-status}, \text{blocked})$ with witness $(a, \text{blocked-by}, \text{"transitive-via-}b\text{"})$.

Per the work-item-as-predication-shape derivation, this is the **block-propagation** closure rule — distinct from a positing because it derives consequences rather than injecting fresh evidence.
The closure operates after every workflow positing; this transformer fires it on demand.

## Inputs

- `--root` — optional path to a single work-item to use as the seed.
  If omitted, walks all work-items found in doing/working/hacking/doing/working/planning/library/task/library/ and doing/working/hacking/doing/working/planning/library/project/library/*/tasks/.

## Algorithm

1. Walk the work-item file space; for each, parse the frontmatter to read has-status and depends-on.
2. Build the dependency graph as a directed graph.
3. For each currently-blocked work-item, mark all transitive depends-on-ers as blocked-by-propagation.
4. For each newly-derived blocked work-item, append a witness row to work-item.jsonl.
5. Return a summary: how many newly-blocked work-items were derived.

This is a closure-rule firing, not a positing — the speech-act partition does not apply.
Per the predication-categories theory, closure-rule firings are PS-morphisms in the closure layer, complementary to the positing layer.
