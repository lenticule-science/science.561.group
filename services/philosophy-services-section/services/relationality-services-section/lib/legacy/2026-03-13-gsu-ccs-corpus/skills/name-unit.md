---
description: "Derives a canonical kebab-case id and CamelCase name for a unit by applying four inference rules (output, identity, judgment, compound) against provided naming rules. Use when a new skill or spec concept needs a name that follows repo conventions."
skill-closure-kind: derivation
---

# name-unit

domain:
- `subject` — a description of the thing to be named: what it is mathematically, what
  it produces or characterizes, what structural type it belongs to
- `naming_rules` — the domain-specific naming rules document; provides the
  classification criteria, head word decision table, and modifier rules to apply

codomain: `name_recommendation` — a judgment: the proposed `id` (kebab-case),
the proposed `name` (CamelCase), the classification assigned, the head word chosen,
the modifier sequence, and the rule citation justifying each choice.

---

## Step 1 — Read subject

Read `subject`. Note:
- What kind of thing is it? (a map, an algebra, a property, an operation, a pattern...)
- What structural type does it belong to? (a sheaf, a nucleus, a category, an adjective...)
- What is its role in the larger construction?
- What does it produce or characterize — not how, but what?

---

## Step 2 — Read naming rules

Read `naming_rules` in full. Identify:
- The classification criteria (how to decide between Object / Quality / Relation / Act
  or equivalent)
- The head word decision table for each classification
- The modifier ordering and scope/property vocabulary

---

## Step 3 — Classify

Apply the classification criteria from `naming_rules` to `subject`.

When two classifications seem to apply: apply the tiebreaker rule from `naming_rules`
(typically: Object wins; the secondary character becomes a modifier).

Record: `classification`.

---

## Step 4 — Choose head word

Apply the head word decision table from `naming_rules` for `classification`.

For each candidate head word: check whether it fits by applying the stated criterion
(e.g. "does it satisfy the nucleus condition?" for `Nucleus`; "is it a category without
a distinguished topology?" for `Category`).

Take the first head word whose criterion is satisfied. If multiple criteria are satisfied,
take the more specific one (e.g. `Nucleus` is more specific than `Map`).

Record: `head_word` and the rule that selected it.

---

## Step 5 — Assemble modifiers

Apply the modifier ordering rule from `naming_rules`. Prepend `[scope][property]` to
`head_word`. Omit scope and property when the head alone is unambiguous within the
corpus.

Record: `modifier_sequence`.

---

## Step 6 — Form id and name

```
id   = kebab-case([modifier_sequence, head_word].join('-').lowercase)
name = CamelCase([modifier_sequence, head_word])
```

Verify `id` is unique by file existence: confirm `math/<id>.md` does not already exist.
If a file with that id exists: flag it — "id conflict: math/<proposed_id>.md exists;
verify the two units are not the same concept before proceeding."
Concept-uniqueness (whether two units cover the same object) requires human judgment
and cannot be checked mechanically here.

---

## Step 7 — Output

Produce `name_recommendation`:

```
id:         <kebab-case>
name:       <CamelCase>
classification:  <Object | Quality | Relation | Act>
head_word:  <word> — selected by rule: <citation from naming_rules>
modifiers:  [<scope>, <property>] — or empty
flags:      [any conflicts or ambiguities requiring human judgment]
```
