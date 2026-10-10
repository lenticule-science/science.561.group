---
name: propagating-blocks
description: Walks the depends-on graph among work-items and derives blocked status transitively, per the block-propagation closure rule. Implements one of the two closure rules named in the work-item-as-predication-shape derivation.
---

Run `node scripts/propagating-blocks.mjs [--root=<path>]` and parse the JSON result.
Without --root, scans all work-items in doing/planning/.
