---
type: question
status: open
see-also:
  - teaching/explanations/episodic-memory.md
  - teaching/explanations/context-as-memory.md
references:
  - references/tulving1972.md
---

# Do LLMs have episodic memory?

## The question

Episodic memory, in Tulving's (1972) sense, is memory of
specific events tagged with spatiotemporal context, available
for re-experiencing or for use in answering "when/where"
questions. Do LLM agents have episodic memory?

## What LLMs have

- **Within a single context.** The model can answer questions
  about what was said earlier in the same conversation. This
  looks episodic but expires when the context closes.
- **From training data.** The model "remembers" particulars
  it saw during training (specific historical events, named
  entities, dated episodes). This looks episodic but is
  encoded into weights rather than retrieved as a discrete
  trace.
- **Via external scaffolding.** A conversation log stored
  in a vector index can be retrieved across sessions. This
  is episodic-by-implementation, not native to the LLM.

## Arguments yes

- Within-context recall is *functionally* episodic: the
  model retrieves specific past events from the current
  episode.
- Training-data recall of dated specific events satisfies
  the surface description of episodic memory: the model
  can answer "what happened in Y" questions.
- The functional criterion suffices; demanding mechanisms
  identical to mammalian episodic memory imports cognitive
  intuitions not relevant to the AI question.

## Arguments no

- Episodic memory in Tulving's sense requires *re-experiencing*
  the original event with autonoetic accompaniment — a
  phenomenological criterion LLMs do not satisfy.
- Training-data "memories" are extracted as semantic
  generalities, not as bound spatiotemporal episodes; they
  fail Tulving's *binding* criterion (spatial + temporal +
  content + self).
- Without external scaffolding, an LLM has no cross-session
  memory at all — episodic memory across episodes is what
  "episodic" was meant to capture.
- The LLM agent's "memories" are subject to confabulation
  in ways biological episodic memory is not.

## What's at stake

The answer affects:

- **Evaluation design.** What do we test for when we test
  "memory" in LLM agents? Within-context recall, cross-
  session recall, or some functional analog?
- **Architecture decisions.** Does an LLM agent need an
  *added* episodic memory subsystem, or does the
  combination of context + RAG suffice?
- **Cognitive comparison.** Whether the analogy between LLM
  agents and human cognition is enlightening or misleading
  for memory specifically.

## Status

Open. The question is partially terminological (what counts
as episodic) and partially empirical (does any LLM-agent
configuration demonstrate the relevant capacities). No
consensus has emerged.
