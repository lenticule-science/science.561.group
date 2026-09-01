---
name: sync-correspondence-table

description: "Keeps the correspondence tables in relational-machine-math-diagram.md and relational-machine-c4-diagram.md synchronized after a node is modified in one file. Use after any update-math-node or update-system-node call."
skill-closure-kind: process
---

domain:
- `node_name` — name of the node just modified
- `modified_file` — which file was modified: `"math"` or `"system"`

---

1. Open `spec/relational-machine-math-diagram.md`, find `## Correspondence`.
2. Open `spec/relational-machine-c4-diagram.md`, find `## Correspondence`.
3. Find the row for `node_name` in both tables; add a row to whichever is
   missing it, with: node name, counterpart name, current state in Notes.
4. Open the file that was NOT just modified, find `## Open texture points`.
5. Add the counterpart node name to `## Open texture points` if not already
   present.
