---
name: validating
description: Checking a record's conformance against its specification.
agent-noun: validator
gerund: validating
---

Given a record and the specification its kind admits, check every conformance rule the specification declares and emit a list of violations together with their severity. A read transformer; the substrate is unmodified by validation.

Distinct from `linting-a-resource-file`, which runs a broader check manifest over any file written to the substrate (the PostToolUse hook surface). Validating one specific kind (validating-a-task, validating-an-agent) checks the kind's spec-declared invariants only; lint checks cross-cutting surface invariants that apply to every record kind.
