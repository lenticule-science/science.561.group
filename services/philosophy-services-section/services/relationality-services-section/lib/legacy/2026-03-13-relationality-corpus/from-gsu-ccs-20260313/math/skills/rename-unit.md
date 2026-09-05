---
name: rename-unit

description: "Renames a math unit file, updates its frontmatter id and name, and fixes all citations to it across the corpus. Use when a name recommendation has been approved and the unit id must change."
skill-closure-kind: process
---

domain:
- `unit_file` — current path to the math unit (`math/<old_id>.md`)
- `name_recommendation` — output of `name-math-unit.md`; must have no unresolved flags

codomain: the unit file at its new path (`math/<new_id>.md`), frontmatter updated,
manifest updated, all `§<old_id>` citations in `math/` redirected.

Precondition: `name_recommendation.flags` is empty; `math/<new_id>.md` does not already
exist.

---

1. Read `unit_file`. Confirm `id:` matches `name_recommendation`'s current id (the
   one being replaced). Confirm `name:` matches CamelCase of that id.

2. Update the frontmatter in `unit_file`:
   - Change `id: <old_id>` to `id: <new_id>`
   - Change `name: <OldName>` to `name: <NewName>`
   - If `defines: <OldName>` is present: change to `defines: <NewName>`
   - Leave all other fields unchanged.

3. Update the top heading anchor: change `{#<old_id>}` to `{#<new_id>}`.

4. Rename the file: `math/<old_id>.md` → `math/<new_id>.md`.

5. In `math/_manifest.yaml`: replace `- <old_id>.md` with `- <new_id>.md`.

6. Replace all `§<old_id>` citations across `math/`:
   ```sh
   grep -rl "§<old_id>" math/ --include="*.md"
   ```
   For each file found: replace `§<old_id>` with `§<new_id>`.

7. Verify: run the same grep. Confirm zero results remain.

8. Call `math/skills/build-math.md`. Confirm `build_result.status = ok`.
