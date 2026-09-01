---
name: append-ideas-entry

description: "Appends a spec-blocked Idea entry to IDEAS.md and marks the node as spec-blocked in the system diagrams. Use when a node's spec cannot be written because required math structure is missing."
skill-closure-kind: process
---

*Process — no branching. Execute each line.*

Given: node name, description of missing mathematical structure, related PLANS.md gap name (or "none").

1. Open `IDEAS.md`
2. Append:
```
## [node name] — spec blocked

The spec for [node name] cannot be written because [missing structure] has not been
established in math/. Needed: [what must exist or be proved].
Blocked spec: spec/[node-name].md
Related gap: [gap name]
```
3. In `relational-machine-c4.md`: add `(spec-blocked)` to the node's description string
4. In `relational-machine-math.md`: add `[spec-blocked]` to the node's `<<stereotype>>` line
5. Save all files
