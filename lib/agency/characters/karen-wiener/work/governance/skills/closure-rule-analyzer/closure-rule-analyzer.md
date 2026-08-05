---
name: closure rule analyzer
description: Reports whether a closure-rule set satisfies termination, confluence, local confluence, and unique normal forms, with evidence and counter-examples for each property.
status: draft
non-conformance:
  - slug-does-not-decompose: "closure-rule-analyzer" starts with a structure-noun rather than a transformer-gerund; the naming grammar requires gerund-first. A rename to a gerund-first form (e.g., `analyzing-a-closure-rule-set`) is blocked until a corresponding `analyze` transformer is authored at `code/transformers/analyze.md`.
---

# closure-rule-analyzer

The record file for this skill.
Documents what the skill is, what its preconditions are, what it produces, and where its companion files live.

## What this skill does

Reads a closure-rule set (a file or directory of rule files in `.md`, `.txt`, or `.json` form) and reports whether the set satisfies four algebraic properties: termination, confluence, local confluence, and unique normal forms.
For each property the report carries the property's status (satisfied | violated | unknown), the evidence the analysis found, any counter-examples (e.g., overlapping critical pairs), and notes on why the analysis is or isn't definitive.

The analysis is heuristic, not a decision procedure.
Termination in general is undecidable; the implemented checks are syntactic (rules that increase complexity, recursive overlaps) and report `unknown` rather than asserting `satisfied` when the heuristic cannot conclude.
The skill is appropriate as a first pass against a candidate rule set, not as a substitute for a soundness proof.

## When to use

When designing or auditing a closure-rule set and you need a first-pass report on its algebraic properties before relying on it in substrate engineering.
The skill is also appropriate as part of an audit run over an entire program's rule sets, when surfacing drift in known-good sets is the goal.

## Inputs

- A path to a rule-set file or directory of rule-set files.
- Optionally a list of properties to check (defaults to all four).

## Output shape

An analysis report carrying, per property: `status`, `evidence`, `violations`, `notes`.
Plus an `overall_assessment` (`sound` | `deficient` | `unsound`), `improvement_suggestions`, and `mathematical_notes`.

## Companion files

- `SKILL.md` — the Claude Code projection of this skill (entry point for slash-command invocation).
- `scripts/analyze-closure-rules.mjs` — the implementation (Node ESM).
- `test-data/` — sample rule-set files (`confluent-terminating.txt`, `simple-confluent.txt`, `simple-terminating.txt`) used as fixtures.
