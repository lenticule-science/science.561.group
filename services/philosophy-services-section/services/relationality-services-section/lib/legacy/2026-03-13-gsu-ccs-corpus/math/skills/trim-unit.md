---
description: "Trims dead sub-headings and removes incorrect content from a math unit file in place. Use when reform-unit is executing the TRIM branch of a critique finding."
skill-closure-kind: process
---

# trim-unit

domain:
- `unit_file` — path to the math unit to trim
- `critique` — output of `critique-unit.md`, identifying dead sub-heading sections
  and math errors in the remaining body

codomain: `unit_file` updated in place — dead sub-headings removed, errors corrected,
no new anchors introduced.

---

1. Read `unit_file` in full.

2. For each dead sub-heading section identified in the critique (a `####` heading
   with `{#anchor}` that has no external citations):
   a. Delete the `####` heading line and its entire body up to the next `####` or end
      of file.
   b. If any content in that section was marked in the critique as correct and worth
      keeping, insert it as inline prose at the end of the immediately preceding section.
      Use no sub-heading, no new anchor.

3. Apply each math correction from the critique to the remaining body. Make only the
   change stated in the critique — do not rewrite surrounding prose.

4. Save `unit_file`.
