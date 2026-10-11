---
description: "Derives an alignment report classifying spec claims about math objects as valid, unsupported, or contradicted by the math. Use in do-math-work Phase 3b to check spec/math consistency."
skill-closure-kind: derivation
---

# audit-spec-alignment

domain:
- `spec_files[]` — list of spec/ files that make claims about math/ objects; these
  are the files read in Phase 1 of `do-math-work.md`
- `math/` — the corpus of math unit files (readable per skill instruction)

codomain: `alignment_report` — a judgment containing three lists:
- `valid_claims[]` — spec claims that are correctly backed by math/
- `unsupported_claims[]` — spec claims with no §citation to any math unit
- `contradicted_claims[]` — spec claims whose cited math unit does not support them

The shape of the output is fixed. Its content is not — it requires reading and
judging whether the mathematics backs the normative language.

---

## Step 1 — Collect all normative claims about math objects

For each file in `spec_files[]`:
  Read the file in full.
  Extract every sentence containing **MUST**, **MUST NOT**, **SHOULD**, or **MAY**
  that makes a claim about a mathematical object (a unit with a `defines:` value,
  or a type described in `spec/math-unit.md` or `spec/naming-math-unit.md`).

  For each claim, record:
  - `claim_text` — the sentence verbatim
  - `source_file` — which spec file
  - `subject` — what math object the claim is about
  - `citation` — the inline §ref if present; `null` if absent

---

## Step 2 — Classify claims by citation status

```
citation is null
  → unsupported: add to unsupported_claims[] with note:
    "No §citation — claim has no math backing; should be in Open questions per specs.md"

citation is present
  → proceed to Step 3
```

---

## Step 3 — Verify cited claims

For each claim with a non-null `citation`:

1. Check that `math/<citation>.md` exists. If not:
   → Add to `unsupported_claims[]`: "§citation target does not exist in math/"

2. Read `math/<citation>.md`. Check whether the cited unit's content supports the
   claim:

   **Supporting criteria** — a claim is supported when:
   - The claim says "X MUST be Y" and the cited unit's definition/axiom/theorem
     states or implies Y for X
   - The claim says "X MUST NOT be Z" and the cited unit explicitly excludes Z or
     proves Z is incompatible with X's definition

   **Contradiction criteria** — a claim is contradicted when:
   - The cited unit is a Conjecture (not proved) but the claim uses MUST (settled)
   - The cited unit's content says the opposite of the claim
   - The cited unit defines X differently than the claim assumes
   - The claim asserts a constraint that is not in the cited unit's MUST/CANNOT/axiom
     list at all — it is new content, not a citation

3. Apply math domain expertise:
   Read the claim and the cited unit. Ask: given the mathematics as stated in
   `math/<citation>.md`, is this spec claim true, false, or open?

   ```
   Claim is mathematically correct AND cited unit supports it → valid_claims[]
   Claim is mathematically correct BUT cited unit does not support it
     → unsupported_claims[]: "claim is likely correct but citation is wrong or missing"
   Claim is mathematically incorrect (contradicts the cited unit or known math)
     → contradicted_claims[]: state what the math actually says; state what a correct
       claim would be
   Claim is about something open (conjecture territory) but uses MUST
     → contradicted_claims[]: "claim uses MUST for an open result; should be in
       Open questions"
   ```

---

## Step 4 — Output

Produce `alignment_report`:

```
valid_claims:        [list of {claim_text, source_file, citation}]
unsupported_claims:  [list of {claim_text, source_file, citation or null, note}]
contradicted_claims: [list of {claim_text, source_file, citation, what_math_says,
                               recommended_correction}]
```

Present to caller. This derivation ends here. The decision to file a dispute is the
caller's.
