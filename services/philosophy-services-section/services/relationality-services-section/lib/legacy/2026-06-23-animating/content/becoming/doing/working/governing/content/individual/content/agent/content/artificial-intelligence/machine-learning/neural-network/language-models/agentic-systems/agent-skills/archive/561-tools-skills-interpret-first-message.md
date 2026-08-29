---

description: Interpret the first message of a session — parse session goals, initialize context efficiently, and set up the work cycle
name: interpret-first-message
version: [0, 1]
kind: operational
runtime: inference
triggers:
  - first message of session
  - session-opening message
inputs:
  message: string
outputs:
  session_goals: string[]
  context_loaded: string[]
  plans_created: string[]
  texts_written: string[]
region:
  reads: ["content/", ".claude/"]
  writes: ["content/"]
dependencies:
  - interpret-message
  - review-plans
  - create-plan
scopes: []
part-of: technology/specifications/agential-semioverse-repository
follows-policies: [1, 8]
---
Interpret a session-opening message. First messages are structurally
different from subsequent messages — they are initialization signals,
not commands. See
[first message as initialization](../../../../personal/projects/emsemioverse/texts/first-message-as-initialization.md).

## Instructions

### 0. Pull and sync

Before anything else: pull latest from origin for both the repository
and the content submodule. Update the submodule pointer if it advanced.
This is mechanical — do it without commentary.

### 1. Parse the message into structured parts

Read the first message and classify each part:

- **Continuity references** — what past work is mentioned? What state
  is assumed?
- **Session goals** — what should this session accomplish? Extract
  these as concrete, testable statements.
- **Meta-guidance** — instructions about how to work, not what to
  work on. These may be corrections, new policies, or process
  preferences.
- **Embedded ideas** — substantive claims, framings, or connections
  that are content, not just direction.

Write each category down (internally, not as output to the user) before
proceeding.

### 2. Check assessment freshness

Before loading context, check whether a situational assessment is
needed. This is a conditional skill invocation — the decision protocol
is:

1. Read the most recent file in `plans/assessments/` (by filename
   date).
2. Read the 3 most recent commits in the content submodule
   (`git -C content log --oneline -3`).
3. **Decision**: If the most recent assessment predates the most
   recent commit, OR if no assessment exists, trigger the
   `situational-assessment` skill before proceeding. If the
   assessment is current, read it and use its recommendation as
   context for step 4 (session goal alignment).

This ensures every session starts with an up-to-date understanding
of where the endeavor is. The assessment is lightweight if run
recently; the cost of a stale assessment is working on the wrong
thing.

### 3. Load context — targeted, not exhaustive

Read ONLY what the session goals require:

1. **Always read:** the latest assessment (from step 2) and `TODO.md`.
2. **If session goals reference specific areas:** read only those areas'
   index files and relevant specs.
3. **If session goals are about infrastructure:** read the relevant
   ASR specs and plans.
4. **If session goals are about content:** read the relevant discipline
   index and recent files.

Do NOT read everything. The goal is minimum context for maximum
understanding. Every file read consumes context that could be used
for generative work.

### 4. Encode embedded ideas (encoding loop steps 1-3)

If the first message contains substantive ideas (not just directions),
run the encoding loop on them: write texts, refine terms, note
research questions. This is the same as interpret-message steps 2-4,
but scoped to only the ideas in the first message.

### 5. Capture session goals as plans

For each session goal identified in step 1:

- Check if an existing plan covers it. If so, note the plan number.
- If no plan exists and the goal spans more than a quick fix, create
  one using `create-plan`.
- If the goal is a quick fix, just note it as an action item.

### 6. Process meta-guidance

For corrections or process instructions in the message:

- If it's a correction: encode it in the appropriate persistent
  artifact (CLAUDE.md, a policy, a skill, an ASR spec).
- If it's a process preference: note it and follow it this session.
  If it recurs across sessions, encode it.

### 7. Report — concise

Tell the user:

1. What you understand the session goals to be (2-3 sentences max).
2. What relevant state you found (active plans, recent work).
3. What you encoded from their message (texts written, plans created).
4. What you propose to work on first.

This report should be SHORT. The user wrote a long message; they don't
need it paraphrased back at length. Lead with action.

## When NOT to use this skill

- If the first message is a simple command ("commit this," "fix X"),
  route to the appropriate skill directly.
- If the first message is a `/slash-command`, execute that skill.
- This skill is for messages that set session context — the kind of
  message that starts with "Our goal this session is..." or "Before
  anything, let me catch you up on..."

## Design rationale

This skill exists because the interpret-message skill treats all
messages identically. First messages need:

- **Targeted context loading** instead of loading everything
- **Goal extraction** instead of command dispatch
- **Session setup** instead of immediate execution

By handling initialization as a distinct skill, the agent spends its
context window on understanding the session's purpose rather than on
boilerplate reading. See
[two-sided prompt design](../../../../personal/projects/emsemioverse/texts/two-sided-prompt-design.md)
for the complementary idea of training the user to prompt effectively.
