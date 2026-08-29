---
name: spec-alignment

description: "Resolves a conflict between a spec claim and proof domain knowledge, returning ProofUpdated, ChallengeFiled, or Ambiguous. Use when a spec MUST or CANNOT contradicts established mathematics or current Lean state."
skill-closure-kind: procedure
---

domain:
- `spec_claim` — the specific MUST, CANNOT, or CAN statement from a spec file that conflicts with known proof state
- `spec_file` — path to the spec file making the claim
- `proof_context` — what the proof currently has (Lean code, math unit content, or domain knowledge that contradicts it)

Precondition: a specific, named conflict between a spec claim and proof domain knowledge.
This skill is reactive — called when a conflict is discovered during other work.
It is NOT a general spec-reading or compliance-scanning skill.

---

## Step 1 — Read the spec claim precisely

Read `spec_file`. Extract the exact claim that conflicts: quote it verbatim.
Note which math unit, Lean construct, or skill behavior it refers to.
Note whether it is a MUST (obligation), CANNOT (prohibition), or CAN (permission).

---

## Step 2 — Read the domain evidence

Read the relevant math unit(s): `math/{unit-id}.md`.
Read the relevant Lean file if the claim is about Lean behavior:

```sh
grep -rl "Establishes: {unit-id}" proof/RelationalHyperverse/RelationalHyperverse/
```

If the claim is about a skill: read the skill file in `proof/skills/`.

Collect:
- What the math establishes (axioms, theorems, constructions)
- What the Lean actually does or proves
- Any explicit constraints from `proof/AGENTS.md`

---

## Step 3 — Judge who is right

Apply domain expertise. Ask:

> Does the spec claim follow from, or remain consistent with, the established mathematics and the Lean formalization?

```
Spec claim is consistent with math and Lean              →  SPEC_CORRECT
Spec claim contradicts an established math result        →  PROOF_CORRECT (spec wrong)
Spec claim contradicts current Lean but math is unclear  →  AMBIGUOUS
Spec claim is about something not yet formalized         →  AMBIGUOUS
```

A spec claim that merely extends beyond current Lean (asks for something not yet done)
is NOT a conflict — it is a gap. File in `proof/IDEAS.md` and stop.

---

## If SPEC_CORRECT → ProofUpdated

The spec is right; proof needs to align.

1. Determine what must change: AGENTS.md, a skill file, a Lean comment, PLANS.md.
2. Make the change — keep it minimal and targeted.
3. Append to `proof/PLANS.md` §Resolution Log:
   > Aligned [what] to spec claim in [spec_file]: [one sentence].
4. Output: `ProofUpdated`

---

## If PROOF_CORRECT → ChallengeFiled

The spec claim is wrong per domain expertise. Report it.

1. Run `deposit-message-in-agent-inbox` with:
   - `from_department`: `proof`
   - `to_department`: `spec`
   - `message_type`: `FixNeeded`
   - `subject`: one sentence naming the incorrect claim (e.g., "spec/skills.md MUST on X contradicts established math result Y")
   - `body`: verbatim spec claim | what math establishes | why they conflict | suggested correction
   - `urgency`: `Blocking` if the claim actively contradicts working Lean; `Normal` if it would cause an agent to go wrong
2. Append to `proof/PLANS.md` §Resolution Log:
   > Challenge filed to spec/ re [spec_file] claim: [subject]. Date: [today].
3. Output: `ChallengeFiled`

---

## If AMBIGUOUS → Ambiguous

The conflict cannot be resolved with current knowledge.

1. Run `deposit-message-in-agent-inbox` with:
   - `from_department`: `proof`
   - `to_department`: `spec`
   - `message_type`: `Discovery`
   - `body`: what each side says, why they appear to conflict, what would need to be established to resolve it
   - `urgency`: `Normal`
2. Append to `proof/IDEAS.md`:
   > Spec-proof ambiguity: [spec_file] vs [proof_context]. Needs: [what would resolve it].
3. Output: `Ambiguous`

codomain: ProofUpdated | ChallengeFiled | Ambiguous
