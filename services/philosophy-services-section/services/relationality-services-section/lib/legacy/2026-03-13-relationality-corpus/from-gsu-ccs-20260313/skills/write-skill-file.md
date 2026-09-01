---
name: write-skill-file

description: "Produces a new skill file by classifying the work as Process, Procedure, Derivation, or Inquiry and applying the corresponding template. Use when a new skill needs to be written anywhere in the repo."
skill-closure-kind: procedure
---

Run this skill when you need to write a new skill file anywhere in the repo.

Precondition: you know what task the skill must accomplish and where it lives (`skills/` for repo-wide, `*/skills/` for department-specific).

---

## Step 1 — Classify the skill

There are four kinds of skillful work. Pick by asking two questions:

> **Is the output type predetermined?** (Do you know what kind of thing you'll produce?)
> **Is the execution path predetermined?** (Do you know exactly which steps to take, with no branching?)

```
Output predetermined?  Execution predetermined?  → Type
        yes                     yes               → Process
        yes                     no                → Procedure
        no                      yes               → Derivation
        no                      no                → Inquiry
```

**Process** — H\*. Both settled. A fixed sequence of instructions that always runs the same way and produces a fully determined artifact. No inference, no branching. If an `if` appears, it is not a process.

**Procedure** — Fix(σ). Output type settled, execution path not. You know what you're producing; you branch on state to determine how. Runs only long enough to produce a named output and dispatch. Branches must end in a call to another skill, not inline work.

**Derivation** — Fix(Δ). Execution rules settled, output meaning not. You follow a fixed sequence of determinate steps — read this, apply this criterion, check this — but the conclusion is a judgment that couldn't have been precomputed. No branching in the steps; the output is an interpretation. Step 5 of a proof lives here. A critique lives here.

**Inquiry** — raw H. Neither settled. Open investigation: you don't know what you'll find or what form the result will take. You may loop, backtrack, produce nothing, or produce something that feeds into one of the other three types. No predetermined output type; no fixed execution path.

- IF Process → go to Step 2a
- IF Procedure → go to Step 2b
- IF Derivation → go to Step 2c
- IF Inquiry → go to Step 2d

---

## Step 2a — Write a process

```
# skill-name

domain: [explicit named inputs]

1. [instruction — no conditions, no inference]
2. [instruction — no conditions, no inference]
...

codomain: [named thing produced — fully determined by the inputs]
```

Rule: if a condition appears while writing, stop. Either remove it (make the step unconditional) or promote this file to a procedure and extract the unconditional parts here.

Go to Step 3.

---

## Step 2b — Write a procedure

```
# skill-name

domain: [explicit named inputs]

Precondition: [what must be true to enter]

1. [read or check]
2. IF [condition] → call [skill name], then [next step or halt]
   IF [condition] → call [skill name], then [next step or halt]
...

codomain: [named, typed thing produced — usable as input for another skill]
```

Rule: every branch must end in a call to a named skill or a halt. No branch may contain inline work that belongs in a process or derivation. If you find yourself writing instructions inside a branch, extract them first.

Go to Step 3.

---

## Step 2c — Write a derivation

```
# skill-name

domain: [explicit named inputs]

codomain: [description of the judgment or interpretation — note that its content
           is not predetermined, only its type]

1. [read or observe — fully specified]
2. [apply criterion — fully specified]
3. [apply criterion — fully specified]
...
N. [state conclusion] — the judgment follows from steps 1–(N-1); record it as output.
```

Rules:
- No branching. If a condition appears, either it is a lookup (determined by a criterion, not a choice) or this is not a derivation.
- Every step must be fully specified — not "consider X" but "check whether X satisfies criterion Y."
- The output section must acknowledge that the content is a judgment: "the critique", "the canonical name", "the next target" — not a deterministic artifact.

Go to Step 3.

---

## Step 2d — Write an inquiry

```
# skill-name

domain: [what is being examined — may be a corpus, a question, or nothing fixed]

Motivation: [what question or gap is being explored — not a predetermined goal]

Starting point: [what to read or examine first]

Iteration rule: [what to do with each thing found — how to follow a thread]

Termination condition: [when to stop and report, even if the answer is "nothing found"]

codomain: [whatever was found — may be empty, a conjecture, a gap, or a feed into
           another skill; state which types are possible]
```

Rules:
- An inquiry is allowed to loop and backtrack.
- It must have a termination condition — "when to stop" — or it is not a skill, it is an open-ended session.
- The output section must list the possible output types, including "nothing."

Go to Step 3.

---

## Step 3 — Name the file

Name it by what it produces, not by what it does to get there.

- `write-spec-file.md` ✓ — names the output
- `critique-unit.md` ✓ — names the output (the critique)
- `sharpen-node.md` ✗ — names a vibe
- `improve-diagram.md` ✗ — names a feeling

Place the file in the correct skills directory:
- `skills/` — if any agent in the repo might need it
- `[department]/skills/` — if it is specific to one part of the repo
