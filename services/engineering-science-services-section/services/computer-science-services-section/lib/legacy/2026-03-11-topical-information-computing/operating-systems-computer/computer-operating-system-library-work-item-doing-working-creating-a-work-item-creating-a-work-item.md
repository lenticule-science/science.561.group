---
name: creating-a-work-item
description: An asserting positing-morphism that writes a new work-item-inhabiting record. Initializes the 3 required characteristic cells (has-kind, has-status=open, owned-by) and any optional refinements the caller provides. The lawful creator-of-work-items; replaces the making-a-task and opening-a-* hack scaffolders.
specializing: assertion-positing-morphism
acting-on-shape: work-item
---

A **creating-a-work-item** call is the asserting positing-morphism that writes a new work-item-inhabiting record at a target path.
Per the work-item-as-predication-shape derivation, an entity inhabits work-item iff (e, has-kind, k) ∧ (e, has-status, s) ∧ (e, owned-by, owner) — the three required cells.
This transformer asserts all three with sensible defaults (has-status = "open" unless overridden) plus whatever optional cells the caller specifies.

## Inputs

- `--target` — repository-relative path where the new record will be written.
  Must not already exist.
- `--kind` — the work-item kind (one of the 14 in Σ_kind).
- `--name` — kebab-case slug for the work-item.
- `--owned-by` — the actor accountable for this work-item.
- `--description` — short description for the frontmatter.
- Optional: `--has-status` (defaults to "open"), `--has-priority`, `--has-deadline`, `--assigned-to`, `--contributes-to`, `--depends-on`.

## Algorithm

1. Validate that the kind is in Σ_kind and the target path does not exist.
2. Build the frontmatter with the 3 required cells + any optionals provided.
3. Write the file with frontmatter and a minimal body.
4. Append a witness row to work-item.jsonl naming the creation.

## Output

`{status: "created", target, kind, name}` on success, or `{status: "rejected", reason}` on failure.
