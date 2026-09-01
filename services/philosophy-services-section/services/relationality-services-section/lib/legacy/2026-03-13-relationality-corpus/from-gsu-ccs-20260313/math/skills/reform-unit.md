---
name: reform-unit

description: "Repairs a math unit by executing either a TRIM pass or a REFERENCES fix based on critique findings. Use when critique-unit returns a TRIM or REFERENCES action."
skill-closure-kind: procedure
---

domain:
- `unit_file` — path to the math unit to reform
- `critique` — output of `math/skills/critique-unit.md`

codomain: `reformed_files[]` — reformed unit file(s), updated manifest, updated citations.

---

## Step 1 — Classify the primary problem

Read the critique. Determine which case applies (first match wins):

```
Critique flags epistemic bundling (proved theorem + conjecture in one file)
  → CASE: SPLIT
  Proved parts have their own identity and external value
  → call extract-subunit.md for each proved theorem/corollary, then conjecture-unit.md for the remainder

Top-level claim is speculative but heading/frontmatter says "Theorem" or "Definition"
  → CASE: CONJECTURE
  → call conjecture-unit.md

Sub-heading anchors are dead (no external citations) AND content has math errors
  → CASE: TRIM
  → delete the sub-sections; fold any correct content into the main body prose;
    fix the errors inline; remove dead anchors

Sub-heading anchors have external citations from multiple files
  → CASE: EXTRACT
  → call extract-subunit.md for each cited sub-anchor

Only dead §references, no structural or math problems
  → CASE: REFERENCES
  → fix each dead reference (replace with correct §id or remove); no structural change
```

---

## Step 2 — Execute

**SPLIT**: Identify which sections belong to the definition and which to the conjecture.
Watch for sentences in the definition body that assert the correspondence the conjecture
is trying to establish — these must move to the conjecture file, not stay in the definition.
The definition should name the concept and forward-reference the conjecture for the
equivalence; it must not assert the equivalence itself.

If the proved component is a theorem with its own identity (name, external citations),
run `math/skills/extract-subunit.md` for it first.
Then write the conjecture unit by hand (the conjecture is not a sub-heading extraction —
it is a new unit shaped by `math/skills/conjecture-unit.md`).
Finally, strip the definition file down to definition-only content and update its
frontmatter description to remove the "and conjecture" qualifier.

**CONJECTURE**: Run `math/skills/conjecture-unit.md`.

**TRIM**: Call `math/skills/trim-unit.md` with `(unit_file, critique)`.

**EXTRACT**: Call `math/skills/extract-subunit.md` for each sub-anchor that has
external citations.

**REFERENCES**: Call `math/skills/fix-references.md` with `(unit_file, critique)`.

---

## Step 3 — Verify

Re-read every modified file. Confirm:
- No new sub-heading anchors introduced that aren't in the original or needed.
- No §references added without checking the target exists.
- Frontmatter `description` matches the heading type (Theorem/Conjecture/Definition).
- No LaTeX paper syntax present.

---

## Step 4 — Report

State: which files were modified or created, what case was applied, and what the
next open item is (if any unresolved issue remains from the critique).
