---
name: find-naming-targets

description: "Scans math/ units for naming violations including invalid prefixes, meta head words, and head word mismatches against spec/naming-math-unit.md. Use to populate candidates for improve-math-naming."
skill-closure-kind: inquiry
---

domain: `math/` — the corpus of unit files.

Motivation: find units whose names do not satisfy the criteria in
`spec/naming-math-unit.md`, so they can be passed to `name-math-unit.md`.

Starting point: read `spec/naming-math-unit.md` to load the head word criteria.
Read `spec/math-unit.md` to load the valid heading type prefixes:
`Definition`, `Construction`, `Axiom`, `Theorem`, `Lemma`, `Corollary`, `Conjecture`.

Iteration rule: for each unit file, apply the checks below in priority order.
Stop at the first check that fires — record the unit as a candidate with the check
that triggered and a one-line note. Skip planning docs (PLANS*.md, IDEAS.md).

```
Check 0 — Invalid heading prefix
  Read the ### heading. Extract the type prefix (text before " —" or " -").
  If the prefix is NOT in the valid set: record as {check: "invalid-prefix",
  note: "prefix '<X>' not in spec; classify before naming"}.
  These units cannot be named until their type is settled — do not send to
  name-math-unit.md.

Check 1 — Meta-name head word (theorem/lemma/conjecture as suffix)
  Read name: field. Extract the last CamelCase segment (the head word).
  Meta head words: Theorem, Lemma, Conjecture.
  These are heading-type words used as name suffixes — the name should describe
  the SUBJECT, not the heading type.
  Exceptions: do NOT flag if "Lemma" or "Theorem" is the only word in the name
  (e.g. bare Lemma as a stub placeholder).
  Record as {check: "meta-head", note: "name suffix '<head>' is a type word; rename
  by subject"}.

Check 2 — Head word mismatch against spec criteria
  Compare the head word against the head word decision table in spec/naming-math-unit.md.
  Mismatch signals (apply each literally):
  - Head word is Fiber but heading prefix is Theorem or Conjecture (theorem about fibers
    ≠ a fiber object)
  - Head word is Sheaf but the body has no statement of a descent/gluing condition
  - Head word is Topos but the heading or body calls it a site or presheaf category
  - Head word is Nucleus but the body does not state idempotence and inflationarity
  Record as {check: "head-mismatch", note: "<specific criterion that failed>"}.

Check 3 — Heading / name complete mismatch
  This check is intentionally narrow to avoid noise.
  Extract the FIRST content word of the heading display name (after the type prefix).
  Extract the FIRST CamelCase segment of the unit name (the scope modifier, or the
  head if there are no modifiers).
  Flag ONLY when both of the following are true:
    a. The two words share no stem (neither is a prefix of the other, lowercased).
    b. The unit has been in the corpus for more than one session (description does not
       contain "Stub").
  Record as {check: "name-drift", note: "name starts '<X>', heading starts '<Y>'"}.
```

Termination condition: stop when either:
- 10 candidates have been found (enough for one working session), or
- all files in `math/` have been checked.

codomain: `candidate_files[]` — a list of `{file, check, note}` records, ordered by
check number (Check 0 first, then 1, 2, 3). May be empty if no candidates found.
