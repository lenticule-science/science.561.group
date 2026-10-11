# Math Skills — Type Chain

Skills are morphisms. Every input must be the output of something upstream.
The opening input is always `user_prompt` (the user's request).

```
user_prompt
    │
    ▼
improve-math (Procedure)
    domain:  user_prompt
    reads:   PLANS.md → {priorities, known_gaps}
    parses:  user_prompt → {task_type, target?}
    │
    ├─ task_type=write ──────────────────────────────────────────────────────┐
    │   user supplies: unit_spec {id, description, depends_on, body?}        │
    │                                                                        ▼
    │                                                              write-unit (Process)
    │                                                                  domain: unit_spec
    │                                                                  calls:  build-math
    │                                                                  codomain: unit_file
    │
    ├─ task_type=critique ───────────────────────────────────────────────────┐
    │   target? = file path from user, or picked                             │
    │                                                                        ▼
    │                                                           critique-unit (Derivation)
    │                                                               domain: unit_file
    │                                                               codomain: (unit_file, critique)
    │                                                                        │
    │                                                               user confirms?
    │                                                                        ▼
    │                                                            reform-unit (Procedure)
    │                                                               domain: (unit_file, critique)
    │                                                               calls:  extract-subunit | conjecture-unit
    │                                                                       trim-unit | fix-references
    │                                                               codomain: reformed_files[]
    │
    ├─ task_type=naming ─────────────────────────────────────────────────────┐
    │   target? = file path or null                                          │
    │                                                                        ▼
    │                                                       improve-math-naming (Procedure)
    │                                                           domain: target
    │                                                                        │
    │                                          ┌─ target null ───────────────┤
    │                                          ▼                             │
    │                             find-naming-targets (Inquiry)              │
    │                                 domain: math/                          │
    │                                 codomain: candidate_files[]            │
    │                                          │                             │
    │                                          └────────────┐                │
    │                                                       ▼ target_file ←──┘
    │                                            name-math-unit (Derivation)
    │                                                domain: unit_file
    │                                                reads: spec/naming-math-unit.md
    │                                                calls: skills/name-unit.md
    │                                                codomain: name_recommendation
    │                                                       │
    │                                                       ▼ (if rename needed)
    │                                               rename-unit (Process)
    │                                                   domain: (unit_file, name_recommendation)
    │                                                   codomain: renamed unit file
    │
    ├─ task_type=prose ──────────────────────────────────────────────────────┐
    │   BLOCKED: apply-prose-principles (Process) not yet written            │
    │                                                                        ▼
    │                                                               [gap — report to user]
    │
    └─ task_type=frontmatter ────────────────────────────────────────────────┐
        target? = file path or picked (prefer definition-class units first)  │
                                                                             ▼
                                                   classify-unit-frontmatter (Derivation)
                                                       domain: unit_file
                                                       codomain: frontmatter_additions
                                                                             │
                                                                             ▼
                                                      apply-unit-frontmatter (Process)
                                                          domain: (unit_file, frontmatter_additions)
                                                          codomain: unit_file (fields added)

    ▼
work_report {done: files[], next_open_item: from priorities}
```

## Skills index

| File | Type | domain | codomain |
|---|---|---|---|
| `improve-math.md` | Procedure | `user_prompt` | `work_report` |
| `write-unit.md` | Process | `unit_spec` | `unit_file` |
| `build-math.md` | Process | *(none)* | `build_result` |
| `critique-unit.md` | Derivation | `unit_file` | `(unit_file, critique)` |
| `reform-unit.md` | Procedure | `(unit_file, critique)` | `reformed_files[]` |
| `extract-subunit.md` | Process | `(parent_file, sub_anchor, new_id, new_description)` | `unit_file` |
| `conjecture-unit.md` | Process | `(unit_file, critique)` | `unit_file` (reformed in place) |
| `trim-unit.md` | Process | `(unit_file, critique)` | `unit_file` (trimmed in place) |
| `fix-references.md` | Process | `(unit_file, critique)` | `unit_file` (references fixed) |
| `classify-unit-frontmatter.md` | Derivation | `unit_file` | `frontmatter_additions` |
| `apply-unit-frontmatter.md` | Process | `(unit_file, frontmatter_additions)` | `unit_file` (fields added) |
| `improve-math-naming.md` | Procedure | `target` | `reformed_files[]` |
| `find-naming-targets.md` | Inquiry | `math/` | `candidate_files[]` |
| `name-math-unit.md` | Derivation | `unit_file` | `name_recommendation` |
| `rename-unit.md` | Process | `(unit_file, name_recommendation)` | renamed unit file |

## Known gaps (skills not yet written)

- `apply-prose-principles.md` (Process) — domain: `unit_file`, codomain: `unit_file` (improved prose)
- `find-naming-gaps.md` (Inquiry) — domain: `math/`, codomain: `candidate_files[]` — currently
  the naming path in `improve-math.md` reads gaps from PLANS.md instead; a proper inquiry
  skill would grep the codebase directly
- `select-target.md` — currently `improve-math.md` handles target selection inline (random pick
  or user-supplied); could be extracted if selection logic grows
