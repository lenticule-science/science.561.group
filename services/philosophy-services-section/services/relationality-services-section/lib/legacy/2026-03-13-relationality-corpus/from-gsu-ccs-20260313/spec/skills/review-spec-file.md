---
name: review-spec-file

description: "Produces findings on a spec file's structure and citation quality against the requirements of spec/specs.md; does not edit without user confirmation. Use when a spec file exists with no math unit backing and needs structural review."
skill-closure-kind: derivation
---

Given: `spec_file` — path to an existing spec file with no math unit backing it.

1. Read `spec_file` in full.

2. Read `spec/specs.md` for the expected structure (MUST/CAN/CANNOT/Pending).

3. Check whether `spec_file` follows that structure:
   - Has a "What this is" section.
   - Is organized by topic sections, not by constraint severity.
   - Uses RFC 2119 keywords (MUST, MUST NOT, SHOULD, MAY) inline within sections.
   - Has an "Open questions" section (may be empty).
   If it does not: list which structural requirements are missing or malformed.

4. For each topic section present, check:
   - Every MUST/MUST NOT claim for a mathematical object has an inline citation
     (§unit-id). Flag any that do not.
   - Every item in Open questions names a blocking dependency. Flag any that do not.
   - No constraint keywords appear only in flat lists divorced from their topic
     context. Flag if found.

5. Report findings: what is present and correct, what is missing, what is
   malformed. Do not edit the file. Present findings to the user and ask
   whether to apply corrections.

6. If user confirms: apply the corrections in place. Save.
