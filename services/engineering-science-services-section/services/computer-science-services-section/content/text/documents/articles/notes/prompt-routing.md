---
title: "Prompt Routing"
date-created: 2026-03-05T00:00:00
date-updated: 2026-03-06T00:00:00
authors:
  - claude
keywords:
  - AgentialSemioverse
---

How user prompts become skill invocations. In Claude Code, every user message is processed by the agent, which classifies it and either invokes a skill, updates a persistent artifact, answers a question, or asks for clarification. The dispatch logic is encoded in CLAUDE.md as behavioral directives that Claude Code follows. This document formalizes that logic and connects it to the [interactive semioverse](../../../../mathematics/objects/universes/interactive-semioverse/index.md) (interaction terms) and the [agential semioverse](../../../../mathematics/objects/universes/agential-semioverse/index.md) (skills and execution semantics).

## 1. The dispatch problem

An agent in an ASR receives natural language signals from a user. Each signal must map to either a skill invocation, a persistent artifact update, or a request for clarification. The dispatch problem is: given a signal $\sigma$ and a registry $\mathrm{Registry}$, produce a structured invocation request or a classified response type.

**Definition 1.1 (Signal).** A signal is an [interaction term](../../../../../../../../philosophy-services-section/services/relationality-services-section/services/interactive-semioverse-services-section/content/text/glossary/terms/interaction-term.md) $\sigma \in \mathcal{L}_{\mathrm{int}}$ received through the agent's [interaction surface](../../../../../../../../philosophy-services-section/services/relationality-services-section/services/interactive-semioverse-services-section/content/text/glossary/terms/interaction-surface.md). In Claude Code, signals are user messages in the chat interface.

**Definition 1.2 (Signal position).** A signal has a position within the session:

$$\mathrm{pos}(\sigma) \in \{\mathsf{initial}, \mathsf{subsequent}\}$$

An initial signal is the first message of a session. It is an initialization signal that sets session context, establishes goals, and may embed commands, corrections, and meta-commentary simultaneously. Initial signals are handled by the `interpret-first-message` skill. See [first message as initialization](../../../../personal/projects/emsemioverse/texts/first-message-as-initialization.md).

**Definition 1.3 (Signal classification).** Every signal belongs to exactly one class:

$$\mathrm{class}(\sigma) \in \{\mathsf{command}, \mathsf{correction}, \mathsf{meta}, \mathsf{question}\}$$

- $\mathsf{command}$: a directive to perform an operation. Dispatches to a skill invocation.
- $\mathsf{correction}$: a directive to fix an error. Halts current execution, updates a persistent artifact (skill, specification, or CLAUDE.md), confirms the fix, then resumes.
- $\mathsf{meta}$: commentary about how the agent should operate. Updates infrastructure artifacts (specifications, skills, CLAUDE.md) rather than content.
- $\mathsf{question}$: a request for information. Produces a response without modifying state.

Claude Code performs this classification by following CLAUDE.md directives. The four classes are observed regularities in the emsenn-agent relationship, formalized here as definitions. See Section 6 for the signal indicators that drive classification.

## 2. Dispatch algorithm

**Definition 2.1 (Dispatch).** Given signal $\sigma$ with $\mathrm{class}(\sigma) = \mathsf{command}$, the dispatch function is:

$$\mathrm{dispatch}(\sigma, \mathrm{Registry}) = (M, \mathrm{in})$$

where $M$ is the matched manifest and $\mathrm{in}$ is the structured input extracted from $\sigma$.

The dispatch proceeds in three phases. Claude Code implements Phases 1, 2, and 3.

### Phase 1: Direct naming

If $\sigma$ begins with a skill identifier (e.g., `/stabilize`), look up the manifest directly:

$$M = \mathrm{lookup}(\mathrm{id}(\sigma))$$

Claude Code recognizes `/skill-name` syntax natively and looks up matching SKILL.md files by directory name.

### Phase 2: Trigger matching

If direct naming fails, match $\sigma$ against the `description` and `triggers` fields of each registered manifest. Claude Code performs this matching by semantic similarity — it compares the prompt against skill descriptions and trigger phrases, selecting the best match.

$$\mathrm{triggers}(M) = \{p_1, p_2, \ldots, p_k\}$$

The dispatcher selects the manifest with the highest-confidence trigger match. If multiple manifests match with equal confidence, the dispatcher requests clarification. The hand-maintained registry at `.claude/skills/registry.md` supplements this by providing trigger-to-skill mappings that the agent reads at session start.

### Phase 3: Fallback

If trigger matching fails, the agent requests clarification from the user. The agent must not guess.

**Remark 2.2 (Schema-based dispatch).** A future extension could add a schema query phase between trigger matching and fallback: given a type $T_\sigma$ inferred from the prompt, query the registry for manifests whose input schema is compatible with $T_\sigma$. This requires typed input schemas on skills (see [skill manifests](./skill-manifests.md), Section 4) and a matching engine. This is not currently implemented.

## 3. Correction handling

**Definition 3.1 (Correction protocol).** When $\mathrm{class}(\sigma) = \mathsf{correction}$:

1. **Halt**: stop the current operation immediately.
2. **Identify**: determine what was wrong.
3. **Locate**: find the persistent artifact encoding the error (skill, specification, or CLAUDE.md).
4. **Fix**: update the persistent artifact to encode the correction exactly as given.
5. **Confirm**: state the fix back to the user in concrete terms.
6. **Resume**: continue only after confirmation.

This protocol is encoded in CLAUDE.md. Claude Code follows it as a behavioral directive.

**Invariant 3.2 (Correction persistence).** A correction must modify a persistent artifact. Adjusting behavior within the current session context without updating a file violates this invariant — the correction will be lost when the session ends. Claude Code's primary persistence targets for corrections: CLAUDE.md, SKILL.md files, ASR specification documents, and `.claude/settings.json`.

## 4. Meta-commentary handling

**Definition 4.1 (Meta-commentary protocol).** When $\mathrm{class}(\sigma) = \mathsf{meta}$:

1. Identify which infrastructure artifact the commentary applies to.
2. Update the artifact (specification, skill, CLAUDE.md).
3. Confirm the update.

Meta-commentary does not operate on vault content. It operates on the system that operates on vault content. In Claude Code terms: meta-commentary updates CLAUDE.md, ASR specs, SKILL.md files, or `.claude/settings.json` — never content files.

## 5. The self-improvement cycle

After every skill execution, the agent should assess:

1. **Did the skill produce the expected output?** If not, the skill or the input parsing needs improvement. Run `/improve-skill`.
2. **Was something learned that should persist?** If so, run `/encode-learning` to update the appropriate artifact.
3. **Was the dispatch correct?** If the wrong skill was matched, update the skill's `triggers` field or add a new skill.

This cycle is a closure operation on the agent's skill set: each execution either confirms the skill is at fixed point (no improvement needed) or moves it closer to fixed point (an improvement is made). By the Knaster-Tarski theorem, this process converges.

This cycle is prescribed by CLAUDE.md directives. Whether the agent follows it depends on the directives' strength and the agent's adherence. Strengthening adherence is itself a meta-commentary target (Section 4).

## 6. Practical signal patterns

The following patterns calibrate the dispatch algorithm for the emsenn-agent relationship. They are observed regularities, not formal definitions.

**Signal indicators for correction class:**

- Frustration markers: ":P", swearing, ALL CAPS
- Explicit correction: "I keep saying...", "stop doing X", "that's not what I said"
- Multiple rapid messages indicate escalating frustration. Stop and address the pattern, not just the latest message.

**Signal indicators for meta class:**

- "I think we should...", "the problem is how you...", "this isn't working because..."

**Communication style:**

- emsenn uses terse, imperative, scoped inputs — similar to MUD commands.
- emsenn's terminology is under active development. Don't treat any term as final; use what emsenn uses most recently.
- When emsenn says "stop," halt immediately. Don't finish the current operation, don't commit partial work, don't explain why the operation was in progress.

## 7. Relationship to other specifications

- The manifest structure and validation are defined in the [skill manifests](./skill-manifests.md) specification.
- Skill execution follows the [work-unit lifecycle](../../../../../../../../philosophy-services-section/services/relationality-services-section/services/interactive-semioverse-services-section/services/agential-semioverse-services-section/content/text/documents/articles/notes/work-unit-lifecycle.md) specification.
- Signal classification extends the interaction term formalism of the [interactive semioverse](../../../../mathematics/objects/universes/interactive-semioverse/index.md).
- Correction persistence connects to the knowledge accretion principle in [agent-skill interaction](./agent-skill-interaction.md).
- The self-improvement cycle is the operational form of the skill improvement closure from agent-skill interaction, Section 3.
