---
name: interpreting-messages
description: Interprets a user message by extracting meaning and encoding it as content following the encoding loop. Use for messages containing new ideas, definitions, plans, or corrections that need to be captured as artifacts.
---

## Requirements

- A user message to interpret
- Access to `content/` for reading and writing
- Ability to invoke write-new-note, find-thing, create-plan, improve-skill, and related skills

## Steps

1. Classify the message: determine if it is primarily defining (introduces concept/decision/correction), questioning (explores uncertainty), or planning (sets priorities/work).
  A message may be all three; process in order define → plan → execute.
2. For a simple direct command or question answerable from existing content, execute directly without running the full encoding loop (fast path).
3. For messages with new ideas, definitions, corrections, or compound requests, run the full encoding loop: identify explicit requests, implicit content, vocabulary, and corrections.
4. Write artifacts immediately for each definition, correction, or decision: term file, ADR, policy, concept, or practice.
  Do not discuss before writing.
5. Refine terms and concepts: check whether each artifact's normative terms have term entries and each concept has a concept entry.
6. Identify research questions requiring external research; list them without starting research.
7. Create or update plans for each imperative in the message.
8. List concrete actions and check for existing skills covering each action; create a skill first if the action will recur and no skill exists.
9. Execute actions through skills; commit as work progresses.
10. After completing work, check whether any skill was bypassed or worked poorly and fix it.

## Outcomes

- Substantive ideas from the message are encoded as artifacts (texts, terms, concepts, ADRs, policies).
- Plans exist for each imperative.
- Actions are executed via appropriate skills.
- Skills are improved if any were found inadequate during execution.
- Nothing is lost: every substantive claim in the message is either an artifact or a noted action item.
