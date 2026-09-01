---
description: "A four-point scale (F0–F3) classifying how precisely a work specification is stated — from implicit convention to machine-checkable algebra."
aliases: [formality level, formality scale, formality levels, F0, F1, F2, F3]
instance-of: metric
measures: specification-precision
scale: [F0-implicit, F1-narrative, F2-structured, F3-algebraic]
traditions: [maturity-models, specification-theory]
date-created: 2026-04-05
---

A **formality level** measures how precisely a work specification is stated — how much of the specification is machine-checkable versus implicit or narrative.
The scale runs from F0 (nothing stated) to F3 (fully algebraic).

| Level | Name | Character | Example |
|-------|------|-----------|---------|
| **F3** | Algebraic | Machine-checkable. Typed inputs and outputs, formal invariants, decidable correctness. | A tool allowlist. A double-entry ledger constraint (debits = credits). An exit code contract. |
| **F2** | Structured prose | Lists, enumerations, templates with clear patterns that could be formalized. | A duty checklist. Frontmatter schemas. An enumerated set of allowed actions. |
| **F1** | Narrative | Natural language descriptions that resist formalization without loss. Judgment-dependent. | An architect's design rationale. A research question. A triage decision. |
| **F0** | Implicit | Not stated anywhere — inferred from usage patterns, convention, or training data. | The unwritten understanding that a particular agent "just knows" how to handle edge cases. |

The scale originates from analyzing organizational work units — specifically, decomposing each unit into its site (action domain), recognition fibers (what it accepts), production fibers (what it produces), constructors (what operations it can perform), and invariants (what constraints it maintains).
Each component of a work unit sits at some formality level independently.
A unit might have F3 constructors (a typed tool list) but F1 invariants (prose principles about when to escalate).

The distribution is not uniform.
In practice, constructors tend toward F3 because tool interfaces are inherently typed.
Sites tend toward F1 because describing an action domain requires narrative.
Recognition and production fibers are mixed, with engineering work more formal than research or synthesis work.

Formality level connects directly to the [work type classification](./process.md).
An F3 specification across all components describes a [process](./process.md) — fully determined, automatable.
An F1 specification describes [inquiry](./inquiry.md) or [derivation](./derivation.md) — requiring judgment.
The path from lower to higher formality is the path from inference-dependent work to computable work.

This matters for [progressive automation](./progressive-automation.md): identifying which components of a work unit are at which formality level tells you where automation is possible (F2→F3 transitions) and where it is not yet tractable (F0→F1 transitions that require making implicit knowledge explicit).
