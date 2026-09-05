---
id: derivation
description: "Work whose execution is settled but whose meaning is not — follows fixed rules to produce a judgment whose content cannot be predicted from the input alone."
aliases: [derivations]
meaning-settled: false
execution-settled: true
resolves-to: process
contrasts-with: process, procedure, inquiry
output: judgment
instance-of: work
date-created: 2026-03-29
---

A derivation is work whose execution path is settled but whose meaning is not.
You know exactly what steps to follow.
You do not know what the steps will produce until you follow them.
The output is a judgment — a named, typed result whose content could not have been predicted from the input alone.

A derivation follows fixed inference rules.
The rules are explicit and fully determined — there are no branches, no conditions to evaluate, no decisions to make about which rule to apply next.
The rules are applied in order.
But the result depends on the input in a way that cannot be shortcut: you must actually run the derivation to see what comes out.

A mathematical proof is a derivation.
The inference rules (axioms, previously proved theorems, logical rules) are fixed.
The steps follow deterministically.
But the content of what is proved — the theorem — could not have been predicted without doing the proof.
A code review is a derivation: the reviewer follows a checklist (rules), but the findings (judgment) depend on what the code actually does.
A medical differential diagnosis following a diagnostic algorithm is a derivation: fixed rules, unpredictable judgment.

A derivation contrasts with a [procedure](./procedure.md): a procedure knows what it is producing (meaning settled) but branches on how to produce it (execution open).
A derivation knows how to proceed (execution settled) but not what it will produce (meaning open).
They are complements in the four-type lattice.

Once the judgment is interpreted and its meaning settled, the derivation collapses to a [process](./process.md) — the same input will now be known to produce the same output.
The derivation was the work of discovering what the output is; the process is the work of reproducing it.

The four types of work:

| | Execution settled | Execution open |
|---|---|---|
| **Meaning settled** | [Process](./process.md) | [Procedure](./procedure.md) |
| **Meaning open** | **Derivation** | [Inquiry](./inquiry.md) |

A derivation sits in the meaning-open, execution-settled quadrant.
Resolving the meaning question (what does this judgment mean?) collapses it to a process.
