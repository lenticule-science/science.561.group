---
description: "Produces a judgment on which mathematical properties of a node govern its interface (MUST/CANNOT) versus its internals (CAN) by checking each property against the node's Rel() arrows. Use when building spec claims for a node with interface arrows in the system diagram."
skill-closure-kind: derivation
---

# classify-spec-claims

Given: target node name, math unit file path(s), target node's `Rel()` lines from `relational-machine-c4.md`.

Produces: four claim lists (MUST, CANNOT, CAN, PENDING) — a judgment about which mathematical properties govern the node's interface and which are internal implementation details.

Inference rules:
- A property governs what **enters** the interface arrows (is required of input) → MUST
- A property governs what **leaves** the interface arrows (is required of output) → MUST
- A property, if violated, would break what crosses the boundary → CANNOT
- A property is internal to the math object — not observable at the interface arrows → CAN
- A property's id appears as an open gap in `math/PLANS.md` → PENDING; use the gap name

---

1. Read the target node's `Rel()` lines from `relational-machine-c4.md`. These define the interface exactly: what enters this node and from where, what leaves this node and to where.

2. Read each math unit file in turn.

3. For each mathematical property in the unit files (each axiom, theorem condition, or definitional requirement):
   - Name the property in one clause
   - Ask: does this property constrain something that crosses one of the interface arrows identified in step 1?
   - Apply the inference rules above to assign it to MUST, CANNOT, CAN, or PENDING

4. After all unit files: check `math/PLANS.md` for open gaps whose id matches any of the math unit ids read. Assign those to PENDING.

5. Output:
   - `must_list` — one entry per property, as: "[property statement] — §[source_id]"
   - `cannot_list` — one entry per property, as: "[property statement] — breaks §[source_id]"
   - `can_list` — one entry per property (no citation required; these are implementation freedoms)
   - `pending_list` — one entry per gap, as: "[property statement] — blocked by: [gap name]"
