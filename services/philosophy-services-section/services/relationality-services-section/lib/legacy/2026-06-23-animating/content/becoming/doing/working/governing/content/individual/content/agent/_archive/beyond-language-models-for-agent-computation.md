---
name: beyond-language-models-for-agent-computation
specialization: idea
date-created: 2026-04-04
source: captain-directive
connects-to:
  - algebraic-learning-calculus
  - training-as-closure
  - offices-as-fuzzy-cells
  - progressive-automation-plan
---

## Captain's words (2026-04-04)

> I guess I'm conflating two levels of work, training/tuning and using models.
> But we don't wanna lose sight of our algebraics and shit; I feel like in ways I don't know, maybe we can do real training, or like... shit that isn't even quite "language models"?
> Iunno

## The insight

There are THREE levels of computation in the system, not two:

### Level 1: Inference (what we do now) Send a prompt to Claude, get a response.
Every call costs tokens.
The agent is a language model doing general reasoning.

### Level 2: Fine-tuned inference (the small model path) Train a small model on our tool-call logs.
It's still a language model — just a specialized one.
Cheaper per call but still doing token-by-token generation.

### Level 3: Algebraic computation (what the math implies) An F3 office's work is deterministic given inputs.
That means it's a FUNCTION, not a conversation.
The harness-cleaner doesn't need to "think" — it needs to run a grep pipeline.
The bookkeeper doesn't need to "reason" — it needs to apply double-entry rules.

For F3 work, the right computation isn't a language model at all.
It's: - A script (the progressive automation path: agent → tool) - A decision tree (error code → known fix) - A lookup table (task work-type → office) - A graph query (Datalog over the EAVT store) - A state machine (task lifecycle: open → in-progress → done)

These cost ZERO tokens.
They run in milliseconds.
They never hallucinate.

### The algebraic connection

The closure operators from training-as-closure aren't metaphors.
An office at F3 has CONVERGED — its behavior is a fixed point.
A fixed point of a closure operator IS a computable function.
You don't need a neural network to compute it.
You need the function itself.

The progression: - F0 (implicit): needs opus-tier inference — the work isn't even specified - F1 (narrative): needs sonnet — follows prose instructions with judgment - F2 (structured): could be haiku or fine-tuned 1B — follows structured checklists - F3 (algebraic): should be a SCRIPT — the behavior is deterministic

### What "real training" might mean

For the F1-F2 middle ground, there's something between "fine-tune a language model" and "write a script": - **Decision forests** trained on tool-call sequences (which tool next, given this state?) - **Markov chains** over office behavior (predict the next action from the last N actions) - **Small classifiers** (is this a task for researcher or writer? — a classification problem, not a generation problem) - **Graph neural networks** over the EAVT store (propagate information through entity relationships)

None of these are language models.
They're cheap, fast, and trainable on our data.
The captain's intuition is right: the algebra points toward computation that isn't language-model-shaped.

### What this changes

The progressive automation plan has TWO paths, not one: 1. **Agent → tool** (for F3 work): replace inference with scripts.
Already planned.
2. **Agent → classifier/function** (for F2 work): replace language generation with lightweight ML models that answer specific questions (which office? which tool? is this valid?).
NOT planned yet.

Path 2 is where the algebraic learning calculus earns its keep.
The closure measure tells you when an office's behavior has converged enough to be captured by a simple model.
The formality assessment tells you what KIND of model: F2 → classifier, F3 → function.

## Research needed

1. Can tool-call sequences be modeled as Markov chains?
  What order is needed?
2. Can office-task matching be a simple classifier (random forest on frontmatter features)?
3. What does a graph neural network over EAVT look like for propagating task state?
4. Is there a connection between the bilattice and decision tree learning?
  (The extending operation as a split criterion?)
5. What computation is the closure operator itself?
  Can we extract it from converged traces?
