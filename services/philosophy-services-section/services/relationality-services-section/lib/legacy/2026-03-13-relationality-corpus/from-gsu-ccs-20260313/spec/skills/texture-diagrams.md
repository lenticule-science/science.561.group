---
name: texture-diagrams

description: "Advances one vague node in the system diagram by either updating its math node attributes or adding a deeper system diagram level; called by texture-specs. Use when a node is too vague to spec because it lacks carrier, ops, axioms, or must-NOT attributes."
skill-closure-kind: procedure
---

domain: `target_node` — name of a node in the C4 diagram that is too vague to spec

codomain: updated `relational-machine-math-diagram.md` or `relational-machine-c4-diagram.md`
with the node advanced one step toward being specced

---

1. Read `spec/relational-machine-c4-diagram.md` and `spec/relational-machine-math-diagram.md`.

2. Count fully-attributed math nodes (has: carrier, order, ops, axioms, must-NOT all present).
   Count containers/components in the C4 diagram.
   - If math count < system count:
     → the math node corresponding to `target_node` needs enrichment → go to step 3.
   - If math count ≥ system count:
     → the C4 diagram needs a new level of detail → go to step 4.

3. **Advance math node.**
   - Find the math unit files for `target_node` (search `math/` by the node's
     correspondence table entry).
   - Run `spec/skills/update-math-node.md` with: `target_node`, math unit file path(s).
   - Run `spec/skills/sync-correspondence-table.md` with: `target_node`, `"math"`.
   - Halt.

4. **Advance system diagram.**
   - The C4 diagram needs to go one level deeper (Context → Container, or
     Container → Component).
   - Identify the container/component that is least specific (missing technology
     label, receives, produces, or must-NOT).
   - Run `spec/skills/update-system-node.md` with: that node's name, its math
     counterpart name.
   - Run `spec/skills/sync-correspondence-table.md` with: that node's name,
     `"system"`.
   - Halt.
