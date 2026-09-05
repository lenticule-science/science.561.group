---
name: update-math-node

description: "Adds missing attributes (carrier, order, ops, axioms, must-NOT) to a node in relational-machine-math-diagram.md from its math unit files. Use when a math node is missing attributes needed before a spec can be written for it."
skill-closure-kind: process
---

domain:
- `node_name` — name of the node in `spec/relational-machine-math-diagram.md`
- `unit_files` — path(s) to the math unit file(s) for this node

---

1. Read the node's current attribute lines from `spec/relational-machine-math-diagram.md`.
2. Read the math unit file(s).
3. For each attribute below that is missing from the node, copy the answer from
   the math unit and add it as an attribute line:
   - `carrier:` — the explicit set or family of sets
     (e.g. `M(Sigma,I)`, `H_t for each t`, `Fix(sigma) intersect Fix(Delta)`)
   - `order:` — the partial order relation stated as `x leq y iff [condition]`
   - `ops:` — each operation listed as `name: domain to codomain`
   - `axioms:` — each required equation or inequality on a separate line
   - `must-NOT:` — one property explicitly ruled out by the math unit, stated
     as `[property] — breaks [what]`
4. If `<<stereotype>>` is missing or generic: replace it with the mathematical
   object type from the math unit's first definition line.
5. Save `spec/relational-machine-math-diagram.md`.
