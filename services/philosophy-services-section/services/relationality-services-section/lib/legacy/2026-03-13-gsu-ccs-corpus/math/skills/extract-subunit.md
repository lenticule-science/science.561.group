---
description: "Extracts a named sub-concept from an existing math unit into its own dedicated unit file. Use when a unit contains a sub-heading anchor that should be its own unit."
skill-closure-kind: process
---

# extract-subunit

domain:
- `parent_file` — path to the math unit containing the sub-heading
- `sub_anchor` — the anchor being extracted, e.g. `noether-fiber`
- `new_id` — id for the new unit file (usually same as `sub_anchor`)
- `new_description` — the `description:` field for the new unit (≤200 chars, plain prose)

codomain: a new unit file at `math/<new_id>.md`, the parent file updated, manifest updated,
all citations of `§<sub_anchor>` redirected.

---

1. Read `parent_file` in full.

2. Locate the sub-heading block: `#### ... {#<sub_anchor>}` and all body lines that follow
   it up to the next `####` heading or end of file.

3. Write `math/<new_id>.md`:
   ```
   ---
   id: <new_id>
   description: "<new_description>"
   ---

   ### [Heading text from the extracted sub-heading] {#<new_id>}

   [Body of the extracted sub-heading, verbatim]
   ```
   Remove the `####` prefix from the heading; promote it to `###`.

4. In `parent_file`, replace the entire extracted block (from `####` heading through its
   last body line) with a single sentence referencing the new unit. Use the form appropriate
   to the object type:
   - Theorem: "This is proved in §<new_id>."
   - Definition: "This is defined in §<new_id>."
   - Conjecture: "This is the subject of §<new_id>."
   - If the parent sentence that introduced the sub-section already names the object,
     keep that sentence and append the reference.

5. In `math/_manifest.yaml`, add `- <new_id>.md` on the line immediately after
   `- <parent_file_basename>`. Do not place it at the end.

6. Grep `math/` for all `§<sub_anchor>` citations:
   ```sh
   grep -rn "§<sub_anchor>" math/ --include="*.md"
   ```
   For each file and line found (excluding `parent_file`, already updated):
   Replace `§<sub_anchor>` with `§<new_id>`.

7. Verify: run the same grep. Confirm zero results remain.
