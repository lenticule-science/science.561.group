---
name: closure-rule-analyzer
description: Reports whether a closure-rule set satisfies termination, confluence, local confluence, and unique normal forms, with evidence and counter-examples for each property. Use when designing or auditing a closure-rule set and you need a first-pass algebraic report before relying on the set in substrate engineering.
---

# closure-rule-analyzer

## Requirements

- A closure-rule set on disk at a readable path.
  Accepted forms: `.txt` (one rule per line, `lhs → rhs`), `.md` (rules in fenced code blocks or as plain `lhs → rhs` lines), `.json` (`[{"left": ..., "right": ...}, ...]` or `{"rules": [...]}`).
- Or a directory whose immediate contents are rule-set files in any of the above forms.
- The implementation script at `scripts/analyze-closure-rules.mjs` in this skill directory.
- Node.js (ESM-capable; recent LTS).

## Steps

1. Resolve the rule-set path from `$ARGUMENTS`.
2. Run `node ${CLAUDE_SKILL_DIR}/scripts/analyze-closure-rules.mjs <rule-set-path> [<property> ...]`.
  With no properties listed the script checks all four (termination, confluence, local_confluence, unique_normal_forms).
3. Read the printed report.
  For each property listed `VIOLATED`, note the violations and any counter-examples (critical pairs, expansion-rule warnings).
4. Decide the disposition: if any required property is `VIOLATED`, do not certify the rule set; report the findings to the caller.
  If a required property is `UNKNOWN`, decide whether the heuristic limit is acceptable for the caller's purpose or whether a stronger check (e.g., AProVE for termination) is required.

## Outcomes

- A report is printed to stdout containing per-property `status`, `evidence`, `violations`, `notes`; plus `overall_assessment` (`sound` | `deficient` | `unsound`), `improvement_suggestions`, and `mathematical_notes`.
- No substrate cells are written.
  The analysis is read-only.

If the script fails (file not found, parse error, malformed input): the failure is reported on stderr and the skill exits non-zero.
The caller treats this as an analysis failure, not a property violation.
