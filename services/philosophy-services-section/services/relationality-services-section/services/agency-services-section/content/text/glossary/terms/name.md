---
name: "Name"
type: "page"
date-created: 2026-03-18
description: A Name is a rigid designator — a syntactic constant that picks out the same object in every context, stable across changes to the object's properties — whose valid forms are constrained by a regular grammar.
---

A Name is a rigid designator — a syntactic constant that picks out the same object in every context, stable across changes to the object's properties — whose valid forms are constrained by a regular grammar.


## What this is

A **Name** is a rigid designator: a syntactic constant that picks out the same object in every context, regardless of how that object&rsquo;s properties change.

The mathematical invariant comes from Kripke (1980, *Naming and Necessity*). A **rigid designator** is a term that refers to the same object in every possible world — as opposed to a **definite description** (ιx.φ(x)), which picks out whatever satisfies φ in each world and may pick out different objects in different worlds. A name is rigid: &ldquo;Aristotle&rdquo; refers to Aristotle regardless of what properties Aristotle has or loses. A description like &ldquo;the greatest Greek philosopher&rdquo; is not rigid — it could pick out different people in different counterfactual situations.

This is why names and descriptions are categorically different (see [Id](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/archive/id.md) and [Description](description.md)): a description characterizes; a name designates. The name does not encode properties of the referent. When properties change, the name does not.

## Names as elements of a regular language

Valid names in this system are not arbitrary strings — they are constrained to a **regular language** L ⊆ {a-z, 0-9, -}*. A regular language is one accepted by a finite automaton; equivalently, one expressible by a regular expression. The type-specific constraints (flat-verb-first for skills, noun-first for specs) partition L into typed sublanguages, each also regular.

This is not incidental: the regularity constraint means name validity is decidable in linear time by a finite automaton. It also means the naming convention can be mechanically enforced without contextual interpretation.

## Naming rules

### Skills

A skill name MUST follow the pattern **flat-verb [object]** — the base/imperative form of the verb (no -ing, no -ed, no -s) followed optionally by the object the verb acts on.

A skill name MUST use a flat verb as its first word, MUST be globally unique within its namespace, and MUST be in kebab-case. It CANNOT use a gerund (-ing) as the verb, a vibe-word as the verb (improve, sharpen, enhance), a `run-` prefix, or a position number (step-3).

**Entry-point exception**: locale entry-point procedures (`improve-math`, `improve-proofs`, etc.) currently violate the flat-verb rule. This is known naming debt. Do not introduce new `improve-*` names.

### Spec files

A spec file name MUST be a noun or noun phrase naming the concept it defines — identical to its `id:` field value.

### The description: field

The `description:` field states what the skill produces or what territory it covers. It MUST NOT restate the name. The name designates; the description characterizes.

## Examples

Name
Verdict
Reason

`write-spec-file`
✓
flat verb `write` + object `spec-file`

`classify-spec-claims`
✓
flat verb `classify` + object

`review-recent-work`
✓
flat verb `review` + territory (Inquiry)

`audit-math-compliance`
✓
flat verb `audit` + object

`improve-diagram`
✗
`improve` is a vibe — what specifically changes?

`reviewing-work`
✗
gerund verb names an activity, not a skill

`run-audit`
✗
`run-` prefix adds nothing; use `audit-X`

`step-3`
✗
position, not a name

## Open questions

- Whether skill names need to be globally unique across all locales or only within a locale&rsquo;s namespace.
