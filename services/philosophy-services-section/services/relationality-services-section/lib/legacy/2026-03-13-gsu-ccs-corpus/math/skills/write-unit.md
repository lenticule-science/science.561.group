---
description: "Writes a new math unit file from a unit spec and registers it in the manifest. Use when do-math-work selects a write-unit task from PLANS."
skill-closure-kind: process
---

# write-unit

domain: `unit_spec` — `{id: string, description: string, depends_on: UnitId[], body?: string}`

codomain: `unit_file` — path `math/<id>.md`, written and added to manifest.

Precondition: `math/<id>.md` does not already exist, and no existing unit in
`math/_manifest.yaml` or `math/*.md` covers the same concept under a different id.

---

1. Write `math/<id>.md`:
   ```
   ---
   id: <id>
   description: "<description>"
   ---

   ### [Heading derived from id, CamelCase or natural English] {#<id>}

   <body>
   ```
   If `body` is empty: write a one-sentence stub that states what the object is,
   then mark the file with `**Status.** Stub.` at the end.

2. In `math/_manifest.yaml`, add `- <id>.md` immediately after the last item listed
   in `depends_on` (or at the end of the manifest if `depends_on` is empty).

3. Call `math/skills/build-math.md`.

codomain: `unit_file = math/<id>.md`
