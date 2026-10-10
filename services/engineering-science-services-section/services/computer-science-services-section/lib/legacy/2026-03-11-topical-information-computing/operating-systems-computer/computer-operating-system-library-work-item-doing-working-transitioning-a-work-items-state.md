---
name: transitioning-a-work-items-state
description: Updates a work-item's has-status cell after validating the proposed (from, to) transition against the lifecycle-state-machine. The single parameterized transformer for all lifecycle transitions. Returns a structured result naming whether the transition fired and, on rejection, why.
---

Run `node scripts/transitioning-a-work-items-state.mjs --target=<path> --from=<state> --to=<state> [--reason=<text>]` and parse the JSON result.
