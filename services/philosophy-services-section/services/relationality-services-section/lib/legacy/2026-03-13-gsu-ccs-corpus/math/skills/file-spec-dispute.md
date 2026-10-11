---
description: "Writes a structured math-domain dispute to spec/IDEAS.md when a spec claim is unsupported or contradicted by the math. Use from audit-spec-alignment when contradicted_claims is non-empty."
skill-closure-kind: process
---

# file-spec-dispute

domain: `dispute` — `{claim_text, source_file, citation, what_math_says, recommended_correction}`

codomain: entry appended to `spec/IDEAS.md` under **Active Ideas**

Cross-domain write to `spec/IDEAS.md` is authorized by this skill. Math domain
expertise has already judged the claim (via `audit-spec-alignment`); this skill
records that judgment where the spec department will see it.

---

## Step 1 — Format the dispute entry

Compose the entry text:

```
**Spec dispute filed by math domain** — [source_file]

Claim: "[claim_text]"
Citation: §[citation] (or: no citation given)

What the math says: [what_math_says]

Recommended correction: [recommended_correction]
```

---

## Step 2 — Append to spec/IDEAS.md

Open `spec/IDEAS.md`. Locate the **Active Ideas** section.
Append the formatted entry as a new numbered item at the end of that section.

If `spec/IDEAS.md` does not exist:
  → Create it with:
    ```markdown
    # spec/IDEAS.md

    ## Active Ideas
    ```
  → Then append the entry.

---

## Step 3 — Return

Return `{status: "filed", target: "spec/IDEAS.md", claim_text: <claim_text>}`.
