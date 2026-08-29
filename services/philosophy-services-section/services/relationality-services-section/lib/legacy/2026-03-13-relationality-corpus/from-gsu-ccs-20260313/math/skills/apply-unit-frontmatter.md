---
name: apply-unit-frontmatter

description: "Applies pre-computed frontmatter additions to a unit file in canonical field order. Use after classify-unit-frontmatter when additions have been derived."
skill-closure-kind: process
---

domain:
- `unit_file` — path to the math unit to update
- `frontmatter_additions` — output of `classify-unit-frontmatter.md`; must contain
  no unresolved flags (UNRESOLVED domain/codomain types must be resolved before applying)

codomain: `unit_file` updated in place — optional frontmatter fields inserted in
canonical order, no existing fields altered.

Precondition: all values in `frontmatter_additions` name existing units (for `defines:`,
`domain:`, `codomain:`, `describes:` entries); no UNRESOLVED flags remain.

---

1. Read `unit_file`. Locate the closing `---` of the frontmatter block.

2. Insert the optional fields from `frontmatter_additions` immediately before the
   closing `---`, in this order:

   ```
   symbol:    <value>          ← if present
   defines:   <value>          ← if present
   domain:    <value>          ← if present (always paired with codomain)
   codomain:  <value>          ← if present (always paired with domain)
   describes: [<v1>, <v2>]     ← if present; YAML list on one line for ≤3 items,
                                  block list for 4+ items
   ```

   Do not add a field that is already present.

3. Save `unit_file`.
