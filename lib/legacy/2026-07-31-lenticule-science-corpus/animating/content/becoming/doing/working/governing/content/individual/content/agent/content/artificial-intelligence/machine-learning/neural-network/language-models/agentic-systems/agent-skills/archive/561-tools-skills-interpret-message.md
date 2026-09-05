---

description: Interpret a user message by extracting meaning and encoding it as content in the emsemioverse, following the encoding loop
name: interpret-message
version: [0, 6]
runtime: inference
triggers:
  - every user message (default behavior)
inputs:
  message: string
outputs:
  texts: string[]
  terms: string[]
  concepts: string[]
  research_questions: string[]
  actions: string[]
region:
  reads: ["content/"]
  writes: ["content/"]
dependencies:
  - write-new-note
  - find-thing
  - make-content-folder
  - fix-frontmatter
  - create-plan
  - improve-skill
  - write-advisory-report
  - mine-triage
  - enrich-triage
  - encode-learning
  - record-idea
scopes: []
part-of: mathematics/objects/universes/agential-semioverse/specifications/agential-semioverse-repository
---
Interpret the user's message by following the
[encoding loop](../../../../../../../../personal/projects/emsdeavor/emsemioverse/texts/the-encoding-loop.md).

## Fast path vs full path

**Fast path** — use when the message is:
- A simple, direct command ("commit this", "rename X to Y")
- A question answerable from existing content
- A continuation of in-progress work with no new ideas

Fast path: just do the action. Do NOT run the encoding loop.

**Full path** — use when the message contains:
- New ideas, framings, priorities, or corrections
- Imperative statements about what should exist or change
- Vocabulary that may need term entries
- Multiple threads or compound requests

Full path: run §0–§9 below.

## Instructions (full path)

### 0. Classify the message

Every message is primarily one or more of:

- **Defining** — introduces a concept, term, naming convention,
  architectural decision, rule, or correction. Something now exists
  that didn't before, or something is now named or bounded.
- **Questioning** — explores uncertainty, wants input, collaborative
  thinking. The answer isn't known yet; the message opens space.
- **Planning** — decides what to do next, sets priorities, assigns
  work, describes a desired future state.

Classification determines what to record FIRST:

| Type | Record immediately | Then |
|------|--------------------|------|
| Defining | Write the artifact (term, ADR, policy, practice) | Then execute |
| Questioning | Engage collaboratively | Commit conclusions as artifacts before acting |
| Planning | Create or update the plan | Then execute the plan |

A message may be all three. Order: define → plan → execute.
Do not execute before defining artifacts exist.

### 1. Read the message

Identify:

- **Explicit requests**: things the user directly asks to be done.
- **Implicit content**: ideas, framings, corrections not yet encoded.
- **Vocabulary**: terms that may need term entries.
- **Corrections**: misunderstandings to fix in existing content.

### 2. Write the artifacts (defining content first)

For each definition, correction, or decision: write the artifact
immediately — term file, ADR, policy, concept, or practice. Do not
discuss it; write it.

For each substantive idea: write a text in the appropriate
discipline's `researching/` or `learning/` directory (or `texts/`
for compositions). Search before writing — do not duplicate.

### 3. Refine terms, concepts, topics

For each artifact written: does every normative term have a term
entry? Does every concept have a concept entry? Flag gaps.

### 4. Identify research questions

List questions requiring external research. Do not start research
yet — list for prioritization.

### 5. Capture plans

For every imperative ("X should...", "we need to...", "I want..."),
create or update a plan at the right abstraction level (policy 010).
Corrections ("don't do X") become policies or decisions.

### 6. Identify actions

List concrete actions: content to create/modify, skills to build,
plans to write, structural changes.

### 7. Verify skill coverage

For each action, check if a skill exists. If a skill exists, use it.
If no skill exists and the action will recur, create the skill first.

Check the repo before web-searching. External research produces
texts (policy 006).

### 8. Execute

Do the actions through skills. Commit as you go.

### 9. Improve from this turn

After completing work: did you bypass any skill? Did a skill work
poorly? Fix the skill or add trigger phrases. 30 seconds, not a
full audit.

## Key principle

The user's words are the primary input to the emsemioverse. Every
substantive thing they say is potential content. Encode it — turn
speech into structure. Record before you discuss. Discussion only
when clarification is genuinely needed before recording is possible.
