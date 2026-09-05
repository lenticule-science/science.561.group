---
description: "Parses a raw operator prompt into a list of typed PromptUnits by applying classification rules in order. Use inside do-work to convert free-form operator text into discrete, actionable units before routing."
skill-closure-kind: derivation
---

# interpret-prompt

domain:
- `prompt` — raw operator text of any length; may contain mixed concerns, multiple
  departments, casual phrasing, and implicit assumptions

Inference rules (apply to every identifiable claim, request, or statement in `prompt`;
a single sentence may produce more than one PromptUnit):

1. **Principle rule.** If the statement expresses a stable constraint on how the system
   should always behave — a rule, invariant, or design value — regardless of any
   specific task:
   → Emit `type: Principle`, `department: root` (unless clearly scoped to one dept),
     `text:` the constraint stated affirmatively.
   Example: "there should be one source of truth for each piece of information" → Principle.

2. **Idea rule.** If the statement names a feature, capability, or concept that does
   not yet exist and the speaker is not committing to implement it now:
   → Emit `type: Idea`, `department:` the department that would own it,
     `text:` the feature or concept named, `problem:` what gap it fills.
   Example: "we should have a src/read/markdown.py" → Idea for `src`.

3. **WorkItem rule.** If the statement names a specific, bounded task with a clear
   done-condition that the speaker intends to have done this session:
   → Emit `type: WorkItem`, `department:` the owning department,
     `text:` the task, `action:` one sentence stating the deliverable.
   Example: "write spec/unit.md" → WorkItem for `spec`.

4. **Conjecture rule.** If the statement makes a mathematical or structural claim that
   is not yet established as a theorem or spec:
   → Emit `type: Conjecture`, `department: math`,
     `text:` the claim, `evidence:` any supporting reasoning given.

5. **Question rule.** If the statement asks something that requires investigation before
   any action can be taken:
   → Emit `type: Question`, `department:` the most likely owner,
     `text:` the question as a question.

6. **Gap rule.** If the statement identifies something that is missing, broken, or
   inconsistent in an existing file or skill:
   → Emit `type: Gap`, `department:` the owning department,
     `text:` what is missing or broken, `location:` file or skill if named.

After applying all rules to the full prompt:
- Collect all emitted PromptUnits into a list.
- For each unit: verify `department` is one of `math`, `proof`, `spec`, `src`, `root`.
- **Path override (apply after all rules, before emitting):** If a PromptUnit mentions
  creating, modifying, running, or referencing a file or directory whose path begins
  with `math/`, `proof/`, `spec/`, or `src/`, override `department` to match that
  prefix — regardless of what semantic inference produced. Path is a harder signal
  than intent. If a unit mentions paths from multiple departments, split it into one
  unit per department.
- If the list is empty: emit one unit of `type: Question, department: root, text:` the
  full prompt unchanged — do not discard operator input.

codomain: a list of PromptUnits, each with fields `type`, `department`, `text`, and
type-specific fields (`action`, `problem`, `evidence`, `location` as applicable).
The list is ordered: Principles first, then WorkItems, then Ideas, then the rest.
