---
name: texture-specs

description: "Advances all unspecced nodes in the system diagram by iterating through texture-diagrams and write-spec-file until every node has a spec file. Use to drive the full spec-writing pass for the system architecture."
skill-closure-kind: procedure
---

domain: none — reads current diagram and spec state autonomously

codomain: updated `relational-machine-c4-diagram.md` with more nodes marked
specced, and new spec files written; Messages sent to relevant department INBOXes

---

1. Read `spec/relational-machine-c4-diagram.md`, `spec/relational-machine-math-diagram.md`,
   all `spec/*.md` files.

2. Find the first container/component in the C4 diagram that does NOT have
   `(specced)` in its description.
   - If none found: halt — all nodes are specced.
   - If found: call it `target_node`. Go to step 3.

3. Find `target_node`'s math counterpart in the correspondence table.
   - If the math counterpart is missing `carrier:`, `ops:`, or `axioms:`:
     → run `spec/skills/texture-diagrams.md` with `target_node`
     → restart from step 1.
   - If the math counterpart has all attributes: go to step 4.

4. Find math unit files for this structure: search `math/` for files whose
   `id:` matches the counterpart name or whose content references it.
   - If no math unit files found:
     → run `skills/deposit-message-in-agent-inbox.md` with:
       - `to`: `math/INBOX.md`
       - `type`: `GapFound`
       - `subject`: "No math unit for [target_node]"
       - `body`: name of the structure, which C4 node needs it, what
         carrier/ops/axioms are expected from the math diagram
     → restart from step 1.
   - If math unit files found: go to step 5.

5. Run `spec/skills/classify-spec-claims.md` with: `target_node`, math unit
   file path(s), `target_node`'s `Rel()` lines from the C4 diagram.
   - If MUST list in the returned claims is empty:
     → run `skills/deposit-message-in-agent-inbox.md` with:
       - `to`: `math/INBOX.md`
       - `type`: `GapFound`
       - `subject`: "Insufficient math to spec [target_node]"
       - `body`: what claims are missing, what the diagram requires, which
         math units are involved
     → restart from step 1.
   - If MUST list is non-empty: go to step 6.

6. Run `spec/skills/write-spec-file.md` with: `target_node`, math unit ids,
   MUST list, CANNOT list, CAN list, PENDING list.

7. Run `spec/skills/mark-node-specced.md` with: `target_node`, path to the
   spec file just written.

8. Run `skills/deposit-message-in-agent-inbox.md` with:
   - `to`: `src/INBOX.md`
   - `type`: `Discovery`
   - `subject`: "New spec: [target_node]"
   - `body`: path to the new spec file, what it constrains, which C4 node
     it corresponds to — so src knows a new implementation target exists.

9. Restart from step 1.
