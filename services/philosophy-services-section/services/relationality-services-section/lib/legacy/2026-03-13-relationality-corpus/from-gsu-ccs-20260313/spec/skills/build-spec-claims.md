---
name: build-spec-claims

description: "Builds four claim lists (MUST, CANNOT, CAN, PENDING) from a math context by classifying established claims, ruled-out statements, and open gaps. Use before writing or updating any spec file that has math unit backing."
skill-closure-kind: process
---

*Process — no branching. Execute each line.*

Given: `math_context` — output of `find-math-context.md`.

1. For each item in `math_context.established_claims`:
   - If kind is Axiom or Theorem or Lemma or Corollary: add to `must_list`
     as: "[one-sentence statement] — §[source_id]"
   - If kind is Construction: add to `must_list` as:
     "[thing constructed] exists — §[source_id]"

2. For each item in `math_context.ruled_out`:
   - Add to `cannot_list` as: "[one-sentence statement] — breaks §[source_id]"

3. For each item in `math_context.open_gaps`:
   - Add to `pending_list` as: "[one-sentence statement] — blocked by: [blocking_item]"

4. Set `can_list` to empty. (The math/ source of truth does not assert permission;
   CAN items are added by the caller if the user explicitly identifies open degrees
   of freedom.)

5. Output:
   - `must_list`
   - `cannot_list`
   - `can_list`
   - `pending_list`
