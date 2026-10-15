---
name: research
description: Answer an allocated science question from the theory the house already holds, and leave the answer as a note and glossary terms in the owning science section plus the requirements engineering is obliged to receive. Use when the Chief Science Officer, the Leader or a work-board allocation hands a Senior Scientist a question to research, or when a Leader prompt names a term, practice or theory the house has not yet stated.
type: skill
skill-closure-kind: inquiry
discharges: emsenn/duty/realizing-allocated-science-work
bound-by-rules:
  - reality-outranks-stale-rules
  - mesh-resilience-outranks-local-optimization
  - complex-inter-office-conflict-uses-formal-coordination
fuel-cap:
  turns: 80
  tokens: 600000
  seconds: 3600
  on-exhaustion: stop, write the note of what is established so far, name the next question as the output, and report the cap that was reached
input: an allocation naming the question, the theory it answers from, and the engineering consumer if any
output: a source- and proof-qualified update to the existing canonical Science carrier and needed terms, or a justified new carrier only if none exists; a recipient-bound Engineering requirement or evidenced unknown result
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
source-custody order is Science knowledge/ontology → Red Cup reusable code
(Data → Code → Networking → Systems) → Coesite reusable operation parameters
→ Group/Public instance parameters. The current
[Science-owned OWL/SHACL custody law](https://github.com/lenticule-science/science-services-section/blob/main/services/philosophy-services-section/services/relationality-services-section/services/agency-services-section/data/records/service-section-custody.ttl) records
the typed rules, **not a certificate that every current repository conforms**.
Classify the real artifact and trace its original consumer before migration:
executable code found outside Engineering is extraction debt to be preserved
until its proper owner and independent receiving are established.

The previous `bound-by-rules` names included ten archived rules not present
in the current 561 Group rule store. They have not been treated as ten
available executables: the applicable surviving *method obligations* are in the
current [561 Group Operational Method](https://github.com/561-group/561-group-services-section/blob/main/content/text/glossary/concepts/method-for-work-in-the-561-group.md)
and the source-owned scientific research process below. The current active
rule identifiers above resolve to actual JSON rule sources. Historical
provenance and unique obligations remain in their original revisions; absence
of a local rule file never licenses a conflicting action.

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
your own ([rule](https://github.com/561-group/561-group-services-section/blob/main/lib/agency/skills/improve-operating-skills/SKILL.md)).

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
  ([rule](https://github.com/561-group/561-group-services-section/blob/main/lib/agency/skills/improve-operating-skills/SKILL.md)).
- Never scan the tree. Reach the corpus by terms, notes, indexes and
  `ls-files` pathspecs
  ([rule](https://github.com/561-group/561-group-services-section/blob/main/lib/agency/skills/improve-operating-skills/SKILL.md)).
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
([rule](https://github.com/561-group/561-group-services-section/blob/main/lib/agency/rules/complex-inter-office-conflict-uses-formal-coordination.json)).
A rule that no longer fits reality has its revision opened with the evidence.
Settle nothing beyond the allocation.

### 5. Consolidate the owning Science carrier; create only missing terms

State supported theory in declarative, falsifiable sentences, with every
premise cited to the exact owning paper, external source or Lean declaration
and scope ([rule](https://github.com/561-group/561-group-services-section/blob/main/content/text/glossary/concepts/method-for-work-in-the-561-group.md)).
**Edit an existing canonical document before making a nearby new note.**
When two documents repeat one result, first preserve all unique definitions,
counterexamples, source provenance, historic authority, and counterevidence
in the survivor; only then retire the demonstrably redundant text, checking
inbound links and preserving retrievable revision history. Distinguish
proved-in-scope, observed, externally supported, analogy, hypothesized,
contested, and unassayed claims where their engineering consequences differ.
A Lean theorem proves its stated formal result, not the analogies built on it.
Unknown derivations and both sides of scientific conflicts remain explicit.

- Locate the **current Science owner-held** note or research paper first.
  Enrich it and reconcile its assertions and source identities. Only if no
  authoritative existing carrier answers this question may the Scientist
  create `content/text/documents/articles/notes/YYYY/MM/DD/YYYY-MM-DD-note-on-<subject>.md`.
  Measured questions retain source-record rows and `references:` with
  `record-check` passing before receiving.
- Enrich the owner's existing canonical `content/text/glossary/terms/<term>.md`.
  Create a term only when there is genuinely no semantic home. Distinct senses,
  languages, contradictory testimony and dated changes are not duplicates
  merely because their spelling matches.
- The record is at least as rich as what is reported in chat
  ([rule](https://github.com/561-group/561-group-services-section/blob/main/content/text/glossary/concepts/method-for-work-in-the-561-group.md)).
  Findings reach the corpus inside `/home/emsenn/info`, never `/tmp` or a
  harness memory.

### 6. Hand engineering the requirements

If the allocation names an engineering consumer, or the theory obliges one,
use the original work-board obligation through `agency-work-propose` **where
actually available**. When a known-down host prevents that operation, do not
contact that host or invent a parallel queue: advance the owning GitHub
issue/source/PR under its existing Work identity and original receiver. It names the wanted
outcome and the judge that will receive it, never the builder or the
implementation. Each request carries, in the owning engineering section's terms:

1. Stable, numbered EARS `shall` requirements, each traced to the exact
   Science claim, external source or kernel-checked declaration;
2. A behaviorally precise **specification** with explicit evidence and
   falsifiers; a historical SAS filename is not an Architecture admission;
3. Architectural concerns and responsibilities for an ISO/IEC/IEEE 42010
   architecture description, followed by constraints for Engineering's
   high-level and detailed **design** contracts and tests. HLD is not a
   synonym for Architecture, and LLD is not the whole Design stage
   ([order rule](https://github.com/lenticule-science/science-services-section/blob/main/services/philosophy-services-section/services/relationality-services-section/services/agency-services-section/data/records/service-section-custody.ttl));
4. An independent Operations/consumer receiving condition for an actual
   installed effect, admissible rights, measured resources and buyer/customer
   value. CI success and source hashes alone cannot satisfy it.

Where the engineering is too large for one request, write the requirements and
specification in the owning section and name the slices.

### 7. Check and report

Re-read the note against step 1's sources: every statement is held by a cited
record, every cited path exists, and no statement is stronger than its source.
Return the output the skill declares.

## Output

One of:

- the changed canonical Science carrier (or explicitly justified new one),
  needed term revisions, proof/observation status, and typed receiving work
  references named by exact source path or Semioverse work identity;
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
