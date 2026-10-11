---
description: "Derives a canonical name recommendation for a math unit using spec/naming-math-unit.md as the naming rules document. Use when improve-math-naming needs a name judgment for a candidate unit."
skill-closure-kind: derivation
---

# name-math-unit

domain: `unit_file` — path to a math unit whose name is to be assessed or assigned;
OR a plain description of a mathematical object not yet in a file.

codomain: `name_recommendation` — output of `skills/name-unit.md`: proposed `id`,
proposed `name`, classification, head word with rule citation, modifier sequence, flags.

---

## Step 0 — Check heading prefix

If `unit_file` is a path to an existing file:
  Read the ### heading. Extract the type prefix (text before " —").
  Valid prefixes: Definition, Construction, Axiom, Theorem, Lemma, Corollary, Conjecture.

  If the prefix is NOT in the valid set (e.g. "Lesson", "Appendix", "Index"):
    Output `name_recommendation` with a single flag:
      "invalid-prefix: heading prefix '<X>' is not a valid unit type per spec/math-unit.md;
       this unit must be reclassified (or removed) before it can be named."
    Stop. Do not proceed to naming.

---

## Step 1 — Extract subject

If `unit_file` is a path to an existing file:
  Read the file. Extract as `subject`:
  - The top heading text (type prefix + display name)
  - The `description:` field
  - The first paragraph of the body (the mathematical definition or claim)
  - Any existing `id:` and `name:` fields (note if the current name may be wrong)

If no file yet (naming a new object):
  Use the provided description directly as `subject`.

---

## Step 2 — Load naming rules

Read `spec/naming-math-unit.md` as `naming_rules`.

This document is the authoritative naming rules for math units. It is passed unchanged
to `skills/name-unit.md` as the `naming_rules` argument. Do not summarise or paraphrase
it — pass the full text.

---

## Step 3 — Call general skill

Call `skills/name-unit.md` with `(subject, naming_rules)`.

Receive: `name_recommendation`.

---

## Step 4 — Check rename scope

If the unit already has an `id:` and the recommendation proposes a different one:
  Note that a rename requires:
  1. Renaming the file from `math/<old_id>.md` to `math/<new_id>.md`
  2. Updating `math/_manifest.yaml`
  3. Updating all markdown links pointing to `math/<old_id>.md` in `math/`
  4. Updating `name:` and `id:` in the frontmatter

  Add this as a `rename_scope` note in the output. Do not execute the rename here —
  that is the caller's decision.

---

## Step 5 — Output

Return `name_recommendation` (with `rename_scope` appended if applicable).
