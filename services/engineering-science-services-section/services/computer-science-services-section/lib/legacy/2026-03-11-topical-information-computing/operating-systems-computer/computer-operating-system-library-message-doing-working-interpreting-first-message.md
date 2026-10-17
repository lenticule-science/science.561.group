---
name: interpreting-first-message
description: Interprets the first message of a session by parsing session goals, loading targeted context, encoding embedded ideas, and setting up the work cycle. Use for session-opening messages that establish goals or provide catch-up context rather than simple commands.
---

## Requirements

- The first user message of a session
- Access to `plans/assessments/`, recent git log, and `TODO.md`
- Ability to invoke `interpret-message`, `review-plans`, and `create-plan` skills

## Steps

1. Pull and sync: pull latest from origin for the repository and content submodule before anything else.
2. Parse the message into: continuity references, session goals (concrete and testable), meta-guidance (process corrections), and embedded ideas (substantive claims or framings).
3. Check assessment freshness: read the most recent file in `plans/assessments/` and the 3 most recent commits; if the assessment predates the most recent commit or no assessment exists, trigger `situational-assessment` before proceeding.
4. Load targeted context: read only what the session goals require (latest assessment, `TODO.md`, and area-specific index files or specs); do not read exhaustively.
5. Encode embedded ideas using the encoding loop steps (write texts, refine terms, note research questions) for any substantive ideas in the first message.
6. Capture session goals as plans: check for existing plans covering each goal; create new plans for goals spanning more than a quick fix.
7. Process meta-guidance: encode corrections into persistent artifacts (CLAUDE.md, policies, skills); note process preferences for this session.
8. Report concisely: state understood session goals (2-3 sentences), relevant active state, what was encoded, and proposed first action.

## Outcomes

- Session goals are identified and documented.
- Context loaded is limited to what the goals require (no exhaustive reading).
- Embedded ideas are encoded as artifacts or notes.
- Each session goal has a corresponding plan or is noted as a quick action item.
- A concise report is delivered to the user stating goals, state, and proposed first action.
