---
name: critique-unit

description: "Derives a structured critique of a math unit's heading, body structure, and references against spec requirements. Use when a unit is flagged for review or repair."
skill-closure-kind: derivation
---

domain: `unit_file` — path to a math unit file to critique.

codomain: a structured critique — a judgment about the file's repo health and mathematical
correctness. The shape of the output (two issue lists) is fixed; the content is not.

---

## Step 1 — Read the file

Read `unit_file` in full. Note:
- `unit_id`: the `id:` field in frontmatter
- `unit_description`: the `description:` field
- `top_heading`: the first `###` heading and its anchor `{#...}`

---

## Step 2 — Repo audit

Run each check. Record every finding.

**a. Frontmatter validity.**
- `id` present and matches the filename (without `.md`)? Flag if not.
- `description` present? Flag if not.
- Any fields other than `id`, `description`, hyphenated FML-clause fields, or underscored annotation fields (`math_symbol`, `lean_file`, `aliases`)? Flag each.

**b. Heading / frontmatter agreement.**
- Does the top heading say "Theorem" while `description` says "Conjecture" (or vice versa)?
- Does any sub-heading say "Theorem" or "Definition" for content that is actually speculative?
- Does the top heading have *no* type prefix (e.g., `### Structural Commitment` rather than
  `### Definition — Structural Commitment`)? Flag — every top heading must declare its type.
- Does the `description:` field itself contain multiple types (e.g., "Definition and conjecture:")?
  Flag as explicit bundling signal; this is a SPLIT candidate regardless of what the heading says.
Flag any mismatch.

**c. Sub-heading anchor audit.**
List every `{#X}` in the file below the top-level one — these are the sub-anchors.
For each sub-anchor X, run:
```sh
grep -rl "§X" math/ --include="*.md"
```
(Substitute the actual anchor text for X — do not search for the literal string `§X`.)
If zero external files cite it: flag as dead-weight sub-heading.
If one or more files cite it: note — this anchor should probably be its own unit.

**d. External citation count.**
```sh
grep -rl "§<unit_id>" math/ --include="*.md"
```
If zero files cite this unit: flag as orphaned.

**e. Dead §references.**
For each `§ref` in `unit_file`:
1. Check if `math/<ref>.md` exists with `id: <ref>`. If yes: live.
2. If not: check if `{#<ref>}` exists anywhere in `math/`. If yes: sub-heading cite (note).
3. If neither: flag as DEAD.

**f. Epistemic bundling.**
Does the file contain objects with different epistemic statuses — e.g., a proved theorem
and an open conjecture, or a definition and speculative claims — in the same unit?
Flag each distinct epistemic type present.

---

## Step 3 — Math audit

For each claim in the file that cites another unit (`§ref`):
1. Read the referenced unit.
2. Verify the claim matches what that unit actually says.
3. Flag any mismatch, noting what the file says vs what the unit says.

For each claim that cites a conjecture (check: does the cited unit's `description:` begin
with "Conjecture:"?):
- Is the citing language appropriate? Language like "is forced by", "it follows that",
  "equivalently", "if and only if" implies the cited result is proved. If the cited unit is
  a conjecture, this is an overstatement. Flag and note the weaker language that should be
  used ("conjectured to be forced by", "if §X holds, then...").

For each *definition* section in the file:
- Does the definition body assert an equivalence or correspondence that is actually the
  content of the accompanying conjecture? (Example: a definition of "cost" that states
  "one class resolved = one constraint committed" when the conjecture is precisely that
  this equality holds.) If yes: the definition is doing conjectural work. Flag — the
  assertion belongs in the conjecture statement, not the definition body. The definition
  should name the concept and say where the correspondence is established.

For any mathematical claim not backed by a citation:
Check against standard definitions in the relevant units. Flag:
- **Hidden assumptions**: genericity conditions, finiteness conditions, or "generic case"
  qualifiers stated in a remark rather than in the conjecture hypothesis.
- **Category errors**: e.g., applying an operator on a topos to objects of a site, or calling
  a right adjoint "reflective" (which means left adjoint to an inclusion).
- **Conflation**: two distinct mathematical objects sharing a name or symbol without noting
  the distinction (e.g., growth rate of a scalar count vs. dominant eigenvalue of an operator;
  exhaustion of H¹ classes vs. finiteness of total H¹ dimension).
- **Unjustified steps in motivation**: a recurrence *asserted* for counts vs. *derived* from
  an injectivity lemma; "finite sum ↔ convergence" vs. "exhaustion ↔ convergence".
- **LaTeX paper syntax**: `\ref{}`, `\label{}`, `Theorem~\ref{}` — these are leaks from a
  paper-writing context and do not render.

---

## Step 4 — Produce critique

Format output as:

```
### Repo Issues
1. [what] — [where: line or section] — [why it matters]
...

### Math Issues
1. [what] — [where] — [what the correct statement would be]
...
```

If no issues in a category: say "None found."

---

## Step 5 — Output

The critique is complete. Present it to the user.

The critique is complete. Present it to the user. The derivation ends here; the dispatch
decision is the caller's, not this skill's.
