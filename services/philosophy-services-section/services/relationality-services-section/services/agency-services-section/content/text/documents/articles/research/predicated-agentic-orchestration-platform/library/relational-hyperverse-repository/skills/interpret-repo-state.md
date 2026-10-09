---
description: "Cross-department synthesis inquiry: reads the current state of all four departments, interprets what each department's progress implies for the others and for the big-picture trajectory, and routes all discovered implications as Messages to the relevant INBOXes. The root agent's standing job when no department has requested coordination."
skill-closure-kind: inquiry
title: interpret-repo-state
---

# interpret-repo-state

domain: - `since` — optional; if provided, first call `skills/review-recent-work.md` with `since` before running the synthesis questions below.
This catches induced debt from recent changes before interpreting the resulting state.

territory: the cross-department state of the repository; what department progress implies for other departments; what the current state means for the trajectory toward a realizable relational machine

termination: all discovered cross-department implications have been routed as Messages to the relevant INBOXes; and a synthesis entry has been appended to root `MEMORY.md`

---

Work through the following questions in order.
Each question may produce zero or more Messages.
Collect all Messages and send them at the end.

---

## Q1 — What has the proof frontier earned?

Read `proof/PLANS.md` and `proof/MEMORY.md`.

- Identify which theorems are currently proved (no sorry) and which sorries are open.
- For each **proved theorem**: does anything in `math/` have a corresponding unit that is still marked unsettled (not in Fix(σ))?
  If so — that proof may now settle it. → Message to `math/INBOX.md` (`type: Discovery`): "proof of [theorem] may settle [math unit] — check whether `lean_file:` should be updated."
- For each **open sorry**: is anything in `math/`, `spec/`, or `src/` explicitly waiting on this proof — i.e., is any unit marked as depending on it?
  - If yes → note as a bottleneck (include in synthesis).
  - If no → the sorry is locally open but not currently blocking anything.

---

## Q2 — What has math settled that hasn't been cashed upstream?

Read `math/MEMORY.md` and scan `math/*.md` frontmatter for units in Fix(σ) ∩ Fix(Δ) (settled) vs. Fix(Δ) only (proved claim, awaiting proof).

- For each **recently settled unit** (settled since the last synthesis in root
  `MEMORY.md`): check whether a spec has been written for it.
  - If no spec exists → Message to `spec/INBOX.md` (`type: Discovery`):
    "math unit [id] is now settled — ready to be specced or to unblock a
    diagram texture point."
- For each **unit in Fix(Δ) but not yet in Fix(σ)**: is it proof-ready?
  (All its dependencies settled.) If so → Message to `proof/INBOX.md`
  (`type: FixNeeded`): "math unit [id] is proof-ready — all dependencies
  settled, no proof yet assigned."

---

## Q3 — Does the diagram look different now?

Read `spec/relational-machine-c4-diagram.md` and `spec/relational-machine-math-diagram.md`.

For each node in `## Open texture points`:
- Find its math counterpart in the correspondence table.
- Check whether the math counterpart is now fully attributed (carrier, ops,
  axioms, must-NOT all present) — either from the diagram file or from settled
  math units.
  - If fully attributed AND no spec exists → Message to `spec/INBOX.md`
    (`type: Discovery`): "C4 node [name]'s math is now fully determined —
    ready for a texture pass."
- Ask: does what we now know about the math change how the node should be
  described? Does any node's technology label or must-NOT constraint need
  updating in light of what's been proved?
  - If yes → Message to `spec/INBOX.md` (`type: FixNeeded`): what needs
    updating and why.

---

## Q4 — Has spec outrun src?

Read all `spec/*.md` files with a `defines:` frontmatter field that corresponds to a C4 node.
Read `src/PLANS.md` and `src/INBOX.md`.

For each spec that defines a C4 component or container:
- Is there a corresponding WorkItem or Message in `src/` acknowledging it?
  - If not → Message to `src/INBOX.md` (`type: Discovery`): "spec [id] defines
    [component] — src has no record of this implementation target."

---

## Q5 — What is the frontier?

After working through Q1–Q4, synthesize:

- **The most advanced settled thing**: the math unit or proved theorem that is farthest along the math → proof → spec → src chain.
- **The bottleneck**: the single thing that, if resolved, unlocks the most downstream work.
  (Usually the unsettled unit with the most proof-ready descendants, or the diagram node blocking the most specs.)
- **The gap between what's been earned and what's been cashed**: how many settled math units have no spec; how many specs have no src record.

---

## Send and record

Send all collected Messages using `skills/deposit-message-in-agent-inbox.md`.

Append a MemoryEntry to root `MEMORY.md`:
```
### synthesis-{date}

**Frontier:** [most advanced settled thing]
**Bottleneck:** [single biggest blocker]
**Gap:** [N settled units unspecced; M specs unimplemented]
**Messages sent:** [count and destinations]
```
