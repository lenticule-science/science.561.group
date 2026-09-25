---
description: "Returns the definition, type signature, or description of a named Lean or math entity. Use when any step needs the type, LHS/RHS, or proof sketch of a named identifier or math unit."
skill-closure-kind: process
title: lookup
---
# lookup

domain: a name X (reduction rule, math unit ID, Lean identifier, sorry category, or tactic)

Given any name encountered while doing Lean work, find its definition.
Match the pattern, follow the steps, return the result.

---

## Pattern: looks like a reduction rule

Regex: `^R[0-9]+'?s?$` — examples: R1, R7, R12, R12s, R18', R20

1. Read `math/reduction-system.md`.
  Search for X.
2. If not found: read `math/normalization.md`.
  Search for X.
3. Extract: LHS term structure, RHS term structure, informal justification.
4. Note whether LHS is Saturate-headed or Transfer-headed.
5. Return: LHS, RHS, head constructor.

---

## Pattern: looks like a math unit ID

Regex: all-lowercase, words separated by hyphens — examples: normalization, fiber-algebra

1. Read `math/{X}.md`.
2. Extract: `id:`, `description:`, `proof_sketch:` (if present), `depends:` (if present).
3. For each entry in `depends:`: note those unit IDs (do NOT recurse).
4. Return: description, proof_sketch, depends list.

If file not found: search `math/_manifest.yaml` for X.

---

## Pattern: looks like a Lean theorem or definition

Regex: CamelCase or snake_case, no hyphens — examples: sound_saturate_idempotent, localConfluence

**MCP (preferred):** - `lean_declaration_file(name="X")` — returns file and line of declaration - `lean_hover_info(file_path=<any file importing X>, line=<line where X appears>, character=<col>)` — returns type signature

**Fallback:**
```sh
grep -rn "theorem X\|lemma X\|def X\|abbrev X\|structure X" \
  proof/RelationalHyperverse/RelationalHyperverse/
```
Read the file at the matching line; extract the full type signature.

If not found in proof/: common Mathlib names: - `Relation.
ReflTransGen` — reflexive-transitive closure - `WellFounded.fix` — well-founded recursion - `Acc` — accessibility predicate

---

## Pattern: looks like a sorry category label

Examples: "Category A", "Category B"

1. Read `proof/PLANS.md` §Sorry categories.
2. Extract: description, line numbers, standard witness pattern.

---

## Pattern: looks like a Lean tactic or term-mode combinator

Examples: `simp`, `exact`, `cases`, `Relation.
ReflTransGen.single`

Recall from Lean 4 knowledge; do not search the repo.

---

## If nothing matches

```sh
grep -rn "X" proof/ math/ --include="*.lean" --include="*.md" | head -20
```

codomain: definition, type signature, or description of X — or NONE if not found after all patterns tried
