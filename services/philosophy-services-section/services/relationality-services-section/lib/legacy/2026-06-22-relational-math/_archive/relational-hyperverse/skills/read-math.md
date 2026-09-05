---

description: "Produces a MathContent record from a math/ unit file given a unit ID. Use before attempting to close any Sorry, to load the mathematical statement, proof strategy, and dependency list."
skill-closure-kind: derivation
---
# read-math
*Derivation*

domain: a math unit ID (e.g., `normalization`, `stable-envelope`)

Given a math unit ID, extract everything needed to write a Lean proof.
The inference rules are fixed; the output is a judgment about what is machine-checkable.

---

## Step 1 — Read the unit file

Read `math/{unit-id}.md`.

Extract from YAML frontmatter:
- `id`, `description`, `proof_sketch`, `proof_method`, `axioms_used`, `depends`, `status`

Read the prose body for:
- Explicit equations (these are the exact statements to prove)
- Named sub-cases (these become case arms in Lean)
- Appeals to prior results (these become lemma calls)

---

## Step 2 — Check depends

For each ID in `depends:`: run `lookup` on that ID (one level only — do not recurse).

If a dependency has `status: sketched` or lower: note it. Do not block unless
the current unit directly relies on it in an essential way.

---

## Step 3 — Find the Lean file (1:1 check)

One math unit → one Lean file. The search should return exactly one result.

```sh
grep -rl "Establishes: {unit-id}" proof/RelationalHyperverse/RelationalHyperverse/
```

- **One result** — that is the file. Note the path. Read ±50 lines around any `sorry`.
- **No result** — no Lean file exists yet. Note as a gap finding; do not invent content.
- **Two or more results** — 1:1 violation. Record in `proof/PLANS.md` and stop;
  the split must be resolved before proof work on this unit continues.

---

## Step 4 — Note gaps

If the math unit has no `proof_sketch`: this is a math gap. Record in `proof/PLANS.md`.
If the `proof_sketch` mentions something not yet in Lean: note it.

---

## Step 5 — Output (judgment)

Return:
- The precise mathematical statement to prove
- The proof strategy (from `proof_sketch`, or "none — math gap")
- Names of previously-established results it uses
- The Lean file and location of the corresponding sorry (or "no Lean file")

Accumulate CoursOfWork: files read, gaps noticed, anything unexpected.
Pass to `post-work-update` when running inside an `improve-proofs` context.

codomain: MathContent — unit_id, mathematical statement, proof_sketch, depends list, and Lean file location
