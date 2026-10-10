---
description: "Rewrites a node's Container or Component call in relational-machine-c4-diagram.md with updated technology label and description drawn from its math counterpart. Use when a system diagram node lacks the attributes needed to spec it."
skill-closure-kind: process
---

# update-system-node

domain:
- `node_name` — name of the node in `spec/relational-machine-c4-diagram.md`
- `math_counterpart` — name of the corresponding math node

---

1. Read the node's current content from `spec/relational-machine-c4-diagram.md`.
2. Read the math counterpart node in `spec/relational-machine-math-diagram.md`.
3. Note the existing element type (`Container(...)` or `Component(...)`) — do not change it.
4. Rewrite the node's call with updated 3rd and 4th arguments:
   - 3rd argument (technology label): the name of the mathematical operation this
     unit performs, taken from the math node's `ops:` line.
   - 4th argument (description string): one sentence stating what arrives and from
     where, what leaves and to where, and one must-NOT constraint stated as
     `[action] — breaks [math property]`; keep it under 30 words.
5. Save `spec/relational-machine-c4-diagram.md`.
