---
description: "Derives the set of frontmatter fields that should be added to a math unit based on its heading type and body content. Use when a unit is missing optional frontmatter."
skill-closure-kind: derivation
---

# classify-unit-frontmatter

domain: `unit_file` — path to a math unit whose optional frontmatter fields are to be determined.

codomain: `frontmatter_additions` — a record of which optional fields to add and what
their values are; a judgment about the unit's role in the corpus.

---

## Step 1 — Read the file

Read `unit_file`. Extract:
- `unit_id` — the `id:` field
- `unit_name` — the `name:` field (CamelCase of id)
- `unit_description` — the `description:` field
- `top_heading` — the first `### ` line and its type prefix (e.g. "Definition —", "Theorem —")
- `body` — all prose and math after the frontmatter block
- `existing_fields` — all frontmatter keys already present

---

## Step 2 — Determine `symbol:`

Scan the first paragraph of `body` for mathematical notation introduced as a primary
symbol. Look for patterns like "denoted $X$", "the map $f$", "the nucleus $\sigma$",
"we write $X$ for".

```
One clear primary symbol found → symbol: <that LaTeX string>
Multiple symbols of equal weight → omit symbol:
No symbol (concept-only unit)   → omit symbol:
```

If the unit already has `symbol:` in `existing_fields`: skip.

---

## Step 3 — Determine `defines:` and heading class

Read `top_heading`. The type prefix determines the heading class:

```
Prefix            → Heading class   → defines: rule
"Definition —"    → definition      → defines: <unit_name>
"Construction —"  → definition      → defines: <unit_name>
"Axiom —"         → definition      → defines: <unit_name>
"Theorem —"       → theorem         → no defines:
"Lemma —"         → theorem         → no defines:
"Corollary —"     → theorem         → no defines:
"Conjecture —"    → conjecture      → no defines:
no prefix         → unclassified    → flag: heading needs a type prefix
```

For definition-class units: `defines: <unit_name>`.
For theorem-class and conjecture-class units: no `defines:`.

If the unit already has `defines:` in `existing_fields`: skip.

---

## Step 4 — Determine `domain:` and `codomain:` (definition-class only)

Only applies when Step 3 produced `defines:`.

Check whether the named object is a morphism type. A unit defines a morphism when:
- The head word of `unit_name` (per `spec/naming-spec.md`) is one of:
  `Map`, `Nucleus`, `Functor`, `Morphism`, `Transformation`, `Retraction`, `Inclusion`
- OR the body contains language like "from X to Y", "maps X to Y", "a morphism
  from X to Y" where X and Y are named mathematical types.

```
Object is a morphism → determine domain: and codomain: values (see below)
Object is not a morphism → omit domain: and codomain:
```

To determine values: read the body for the source and target types. Each value MUST be
the `name:` of an existing math unit — verify by checking `math/_manifest.yaml` for a
unit whose `name:` matches. If a candidate type has no corresponding unit: record it as
UNRESOLVED and omit `domain:`/`codomain:` (a `describes:` reference would also be invalid).

If the unit already has `domain:` and `codomain:` in `existing_fields`: skip.

---

## Step 5 — Determine `describes:`

Only applies when Step 3 produced NO `defines:` (theorem, lemma, corollary, conjecture
units) OR when the unit has `defines:` but also significantly develops properties of
other named objects.

Collect the set of `§ref` citations in `body`. For each cited unit id:
1. Check that `math/<cited_id>.md` exists.
2. Check that it carries `defines: <SomeName>`.
3. If both: add `<SomeName>` to the `describes:` list.

```
describes: list is non-empty → describes: [Name1, Name2, ...]
describes: list is empty     → omit describes:
```

Note: a `describes:` reference to a unit without `defines:` set is invalid per the spec.
If the cited unit lacks `defines:`, the reference can be added after that unit is enriched.

If the unit already has `describes:` in `existing_fields`: skip.

---

## Step 6 — Output

Produce `frontmatter_additions`:

```
{
  symbol:   <value> | omit,
  defines:  <value> | omit,
  domain:   <value> | omit,
  codomain: <value> | omit,
  describes: [<values>] | omit,
  flags: [list of issues requiring human judgment]
}
```

Flags to record:
- Heading has no type prefix (→ heading needs to be fixed before `defines:` can be set)
- `domain:`/`codomain:` source or target type UNRESOLVED (→ no corresponding unit exists)
- A `describes:` candidate exists but its unit lacks `defines:` (→ add after that unit is enriched)

Present to caller. The decision to apply is the caller's.
