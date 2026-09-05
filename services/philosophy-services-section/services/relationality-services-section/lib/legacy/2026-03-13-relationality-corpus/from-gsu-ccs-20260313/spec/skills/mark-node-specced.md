---
name: mark-node-specced

description: "Marks a node as specced in both relational-machine-math-diagram.md and relational-machine-c4-diagram.md after its spec file has been written. Use immediately after write-spec-file to keep the system diagrams synchronized with spec/ state."
skill-closure-kind: process
---

domain:
- `node_name` — name of the node just specced
- `spec_file` — path to the spec file just written

---

1. In `spec/relational-machine-math-diagram.md`: find the node's class body;
   add the line `specced: true` immediately after the `<<stereotype>>` line.
2. In `spec/relational-machine-c4-diagram.md`: find the node's description
   string; append ` (specced)`.
3. In `spec/relational-machine-math-diagram.md`: move the node's entry from
   `## Open texture points` to `## Specced`.
4. In `spec/relational-machine-c4-diagram.md`: do the same.
