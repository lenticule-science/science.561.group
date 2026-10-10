---
id: math-unit
description: "A single markdown file in math/ that is the authoritative source for one mathematical concept, object, or result."
---

# Math Unit

## What this is

A `MathUnit` is a single file in `math/` that is the canonical location of one
mathematical concept, object, theorem, conjecture, axiom, or construction. It is
the source of truth for that concept in this corpus. All other files — proof files,
spec files, implementation files — are downstream of it.

## Frontmatter

A `MathUnit` MUST have a YAML frontmatter block delimited by `---`. The frontmatter
MUST contain `id`, `kind`, and `description`. It MAY contain the optional fields
below. It MUST NOT contain any other fields.

### Required fields

| Field | Type | Constraint |
|---|---|---|
| `id` | kebab-case string | unique across `math/`; filename MUST be `math/<id>.md` |
| `kind` | enum string | one of: `definition`, `construction`, `axiom`, `theorem`, `lemma`, `corollary`, `conjecture` |
| `description` | plain prose ≤200 chars, no LaTeX | human-orientation only; makes no mathematical claim |

`name` is NOT a stored field. The CamelCase display form of a unit is derived
mechanically from `id` when needed. Storing it would duplicate information that
is fully determined by `id`.

### Optional fields

| Field | Type | When to include |
|---|---|---|
| `symbol` | LaTeX string | when the unit has a primary notation that no other unit claims |
| `defines` | MathUnitName | when this file is the authoritative definition of the named object |
| `domain` | MathUnitName | when `defines` is set and the object is a morphism; paired with `codomain` |
| `codomain` | MathUnitName | always paired with `domain` |
| `describes` | MathUnitName[] | lists named objects this file proves properties of or places in relation; each name MUST have a `defines:` unit |
| `lean_file` | file path | when the claim has been machine-checked in Lean 4 without `sorry` |

**`domain` and `codomain` MUST NOT appear without `defines`.**
**`domain` and `codomain` MUST appear together — never one without the other.**
**Each value in `describes` MUST be the `name` of a unit carrying `defines`.**

## Heading

The first heading after the frontmatter MUST be a `###` heading of the form:

```
### Display title {#<id>}
```

The anchor `{#<id>}` MUST match the `id` field exactly. The display title is the
human-readable name for the unit — it MAY use mathematical notation, spaces, and
capitalisation that differ from the kebab-case `id`. No type prefix in the heading:
`kind` in frontmatter is the single source of truth for the unit's epistemic status.

### `kind` semantics

| Value | Meaning |
|---|---|
| `definition` | Introduces and names a mathematical object or structure |
| `construction` | Exhibits an object by explicit construction (stronger than asserting existence) |
| `axiom` | States a foundational assumption; not proved |
| `theorem` | A proved result; has a proof obligation (may live in `proof/`) |
| `lemma` | A proved auxiliary result |
| `corollary` | Follows directly from a theorem already in the corpus |
| `conjecture` | A precise claim believed true but not yet proved |

## Body structure by heading type

**Definition / Construction / Axiom:**
The body states the mathematical object: carriers, operations, axioms. May be followed
by remarks or consequences, but the primary object MUST be stated first.

**Theorem / Lemma / Corollary:**
Sections: (1) Statement — the formal claim, all hypotheses listed; (2) Proof — or a
reference to the Lean file if machine-checked; (3) optionally Remarks.

**Conjecture:**
Sections: (1) Statement — all genericity hypotheses listed explicitly; (2) Motivation
— structural arguments, not proofs; (3) What a proof requires — gaps named explicitly;
(4) Depends on — `§ref` list for units needed to state the conjecture.

## MUST

- Contain exactly one mathematical concept (one definition, one theorem, one conjecture)
- Have `id` that matches the filename (`math/<id>.md`)
- Have `kind` declaring the unit's epistemic status — `kind` is the single source
  of truth; do not repeat it in the heading
- Not contain `####` sub-headings with `{#anchor}` — sub-heading anchors are naming
  debt; each named sub-object MUST have its own unit file

## CANNOT

- Mix epistemic statuses (a proved theorem and an open conjecture in the same file)
- Contain Lean code, proof assistant syntax, or implementation code
- Contain numbered theorems, numbered sections, or `\ref{}` / `\label{}` LaTeX commands
- Have a `domain:` or `codomain:` field without `defines:`

## CAN

- Have a `lean_file:` annotation when the claim has been verified
- Contain a stub body (`**Status.** Stub.`) when the unit is registered but not yet written

## Pending

- Existing math/ unit files predate this spec and use the old heading-prefix
  convention (`### Theorem — Name {#id}`) and store `name:` in frontmatter.
  Migration: add `kind:` field, remove `name:` field, strip type prefix from
  heading. Tracked in math/INBOX.md.
