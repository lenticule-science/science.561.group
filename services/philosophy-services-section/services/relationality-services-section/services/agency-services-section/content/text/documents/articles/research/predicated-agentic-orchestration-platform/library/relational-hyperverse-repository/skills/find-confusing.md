---
description: "Reads one file and returns a list of confusing passages: undefined terms, internal contradictions, scope drift, claims without backing, and prose that requires unlisted prior knowledge."
skill-closure-kind: inquiry
title: find-confusing
---

# find-confusing

domain: `file` — path to any repo file

codomain: a list of confusions, each with: - `location` — heading or line reference within the file - `kind` — one of: `undefined-term`, `contradiction`, `scope-drift`, `unsupported-claim`, `assumed-knowledge`, `wrong-level` - `passage` — the exact phrase or sentence that is confusing - `question` — the single question whose answer would resolve the confusion

---

Read `file` fully.
Then apply each check in order:

1. **Undefined-term.** Any term used as if established that is not defined in this file and has no cross-reference link.
  Flag with: "What does X mean here?"

2. **Contradiction.** Any two claims in the file that cannot both be true, or a claim here that contradicts a linked file's claim.
  Flag with: "Which is correct: A or B?"

3. **Scope-drift.** Any section that shifts what it is talking about mid-way — begins describing the concept but drifts to describing a specific instance, implementation, or example without marking the shift.
  Flag with: "Is this about the concept or this specific case?"

4. **Unsupported-claim.** Any assertion in a MUST/CAN/CANNOT section that has no stated reason and no link to a math unit or other backing.
  Flag with: "What is this constraint based on?"

5. **Assumed-knowledge.** Any sentence that only makes sense if the reader already knows something not in this file and not linked.
  Flag with: "What does the reader need to know to follow this?"

6. **Wrong-level.** Any content that belongs in a different file: implementation detail in a concept spec, concept definition in an instance spec, domain logic in an engine description.
  Flag with: "Does this belong here or in [other file]?"

Return only confusions actually found.
If a file is clear, return an empty list.
