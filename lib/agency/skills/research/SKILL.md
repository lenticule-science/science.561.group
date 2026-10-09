---
name: research
description: Answer an allocated science question from the theory the house already holds, and leave the answer as a note and glossary terms in the owning science section plus the requirements engineering is obliged to receive. Use when the Chief Science Officer, the Leader or a work-board allocation hands a Senior Scientist a question to research, or when a Leader prompt names a term, practice or theory the house has not yet stated.
type: skill
skill-closure-kind: inquiry
discharges: emsenn/duty/realizing-allocated-science-work
bound-by-rules:
  - notes-state-the-theory
  - read-the-house-notes-for-a-leader-term
  - context-discovery-before-change
  - leader-prompts-become-research-before-code
  - existing-work-is-judged-before-it-is-discarded
  - science-engineering-operations-parameterize-in-order
  - durable-record-at-least-as-rich-as-chat
  - no-whole-tree-scans-on-bare-cedar-fog
  - group-material-on-bare-cedar-fog-lives-under-info
  - no-harness-private-memory
models: the model and effort the allocation's staffing names; this skill does not choose one
fuel-cap:
  turns: 80
  tokens: 600000
  seconds: 3600
  on-exhaustion: stop, write the note of what is established so far, name the next question as the output, and report the cap that was reached
input: an allocation naming the question, the theory it answers from, and the engineering consumer if any
output: one note and its glossary terms in the owning section, the source record when the question is measured against literature, and the opened requests for the engineering consumer; or the stated result that the territory is empty
requires-capabilities:
  - read
  - path-corpus
  - markdown-search-workbench
  - term-intension
  - read-term-catalog
  - write
  - markdown-file-workbench
  - knowledge-claims
  - agency-work-propose
  - utter
---

# Research

A Senior Scientist researches an allocated question to the point where the house
states the theory that answers it, in the section that owns the science, and
engineering can derive tools from that statement. The skill is one inquiry:
neither what the answer is nor how to reach it is settled going in, so it runs
under the fuel cap above and its output type is not fixed beforehand. The
knowledge-first order is science, then engineering, then operations
([rule](../../../../../561-group-services-section/lib/agency/rules/science-engineering-operations-parameterize-in-order.json)).
Science holds theory and research, so nothing this skill produces carries a
tool's code, a section's data or a brand.

The skill discharges the duty `realizing-allocated-science-work`. Its receiver
is the Chief Science Officer or the science office it names; the Senior
Scientist never receives its own outcome, and engineering consumes the
specification without receiving anything of science's.

## Input

An allocation names the question, the theory it answers from, and the
engineering consumer if any. A Leader prompt that names a term or practice is an
allocation once the Chief Science Officer or the Leader's dispatch carries it.
Without a question the skill returns `MissingInput`. Without a named owning
section the skill finds it in step 1 and records which section it chose and why.

## Steps

The steps are the order the work usually takes. The inquiry may loop and
backtrack between 1 and 4; steps 5 to 7 are written only once 1 to 4 have
settled what is to be stated.

### 1. Locate the held theory by term and note

Read what the house already holds before reasoning from any association of
your own ([rule](../../../../../561-group-services-section/lib/agency/rules/read-the-house-notes-for-a-leader-term.json)).

- For each term in the question, read the glossary entry in the science section
  that owns it (`content/text/glossary/terms/<term>.md`), through the term
  catalog and `term-intension`, or by name with
  `git -C /home/emsenn/info ls-files -- '*/<term>.md'`. Read the whole entry.
- For each practice or theory in the question, find the notes that state it by
  name in the same way (`*<keyword>*` under the owning section) and read them in
  full, newest first. The Leader's statements in them are theory.
- Read the notes and terms the entries cite, one hop out, and the work-science
  terms when the question concerns work, skill, inquiry or runbook.
- Read the rule store for rules that bind the subject.
- Find the open work: the work-board items, open pull requests and branches on
  the subject. Judge each against the house's theory (aligned, misaligned,
  superseded, already landed) before building anything beside it
  ([rule](../../../../../561-group-services-section/lib/agency/rules/existing-work-is-judged-before-it-is-discarded.json)).
- Never scan the tree. Reach the corpus by terms, notes, indexes and
  `ls-files` pathspecs
  ([rule](../../../../../561-group-services-section/lib/agency/rules/no-whole-tree-scans-on-bare-cedar-fog.json)).
  A held statement may be spread across several notes; collect every place it
  appears.

Stop locating when the next read adds no new statement. If nothing under the
subject's name exists, widen to the nearest term and the notes that cite it
before concluding the territory is empty.

### 2. Frame the question

Restate the question as one sentence the answer can be judged against, with its
terms, its owning section and its consumer. If reading shows the original
question was wrong, replace it and record the replacement and the reason. When
the question is about evidence outside the house (a disease, a protocol, a
statute, a material), write the source record the
[literature-measurement schema](../../../../data/records/schema/literature-measurement.schema.json)
describes and run the searches through the bibliography CLI, as the
[research role reference](references/research-role.md) sets out: search the
registers, read each source from its first-party surface, write the rows, then
the prose. A statement that something has not been studied rests on a search
row with an empty `included`.

### 3. Read the sources and derive the theory

Read each source named in step 1 or 2 from its first-party surface. Derive what
the held theory and the sources together establish about the question. Where
the question is mathematics, derive it as kernel-checked declarations in the
owning Obsmetrologia package and read golden vectors off them for engineering;
state the remaining derivations as work. A conjecture stays named as a
conjecture and is never asserted to unblock engineering.

### 4. Record conflicts

When two held records, two offices or a record and a source disagree, keep both.
Write each side with its path and line, the point of disagreement, and which
one the question depends on. Do not flatten a disagreement into a priority. A
complex disagreement between offices about reality goes to the Obsmetrologia-
derived coordination framework with its provenance kept
([rule](../../../../../561-group-services-section/lib/agency/rules/complex-inter-office-conflict-uses-formal-coordination.json)).
A rule that no longer fits reality has its revision opened with the evidence.
Settle nothing beyond the allocation.

### 5. Write the note and the terms in the owning section

State the theory in declarative sentences, with the Leader's statements taken as
theory and cited by their record, and the house's by path and line
([rule](../../../../../561-group-services-section/lib/agency/rules/notes-state-the-theory.json)).
The note makes no evidence grades and no disclaimers. What is not yet derived
comes after the statement, briefly, and never in place of it. The conflicts of
step 4 follow the statement, each with both sides.

- The note goes in the owning section at
  `content/text/documents/articles/notes/YYYY/MM/DD/YYYY-MM-DD-note-on-<subject>.md`
  with `title`, `description`, `date-created`, `keywords` and `authors`. A
  measured question cites its source record's rows and carries the derived
  `references:`; `record-check` ships at zero errors.
- Each term the note defines or revises goes in the same section at
  `content/text/glossary/terms/<term>.md`, as an enrichment of the entry if one
  exists. A term is not duplicated beside the existing one.
- The record is at least as rich as what is reported in chat
  ([rule](../../../../../561-group-services-section/lib/agency/rules/durable-record-at-least-as-rich-as-chat.json)).
  Findings reach the corpus inside `/home/emsenn/info`, never `/tmp` or a
  harness memory.

### 6. Hand engineering the requirements

If the allocation names an engineering consumer, or the theory obliges one, open
the request on the work board with `agency-work-propose`. It names the wanted
outcome and the judge that will receive it, never the builder or the
implementation. Each request carries, in the owning engineering section's terms:

1. requirements in EARS form, one `shall` each, each traceable to a sentence of
   the note;
2. the specification the note and any golden vectors give;
3. the design constraints the theory sets, without code, data or brand
   ([order rule](../../../../../561-group-services-section/lib/agency/rules/science-engineering-operations-parameterize-in-order.json));
4. the receiving conditions: how the receiving office judges that the
   requirements hold.

Where the engineering is too large for one request, write the requirements and
specification in the owning section and name the slices.

### 7. Check and report

Re-read the note against step 1's sources: every statement is held by a cited
record, every cited path exists, and no statement is stronger than its source.
Return the output the skill declares.

## Output

One of:

- the note, the terms and the opened requests, each named by path or work-item
  id, with the one-line statement of what the theory now says;
- the statement that the territory is empty or not yet reachable, with the
  searches that show it and the nearest held theory, which is a valid result;
- a further inquiry, when the question transformed or the cap was reached,
  stated as its new question.

## Errors

Errors are named outputs the caller handles.

| Class | When |
|---|---|
| MissingInput | the allocation names no question |
| ValidationFailure | a source record or note fails its check and cannot be repaired within the allocation |
| UnexpectedState | the owning section, a cited record or a required capability is absent from the house |
| Unresolvable | the inquiry could not be conducted at all; "nothing found" is not this |

Each error states its class, one sentence on what went wrong, what was being
attempted, and a recovery hint.

## Not this skill

- Not building the tool: engineering consumes the specification and receives
  its own work.
- Not settling theory beyond the allocation, appointing anyone or taking a
  financial, credential or external commitment.
- Not receiving its own outcome.
- Not a chain of other skills; the sequence across offices belongs to a runbook.
