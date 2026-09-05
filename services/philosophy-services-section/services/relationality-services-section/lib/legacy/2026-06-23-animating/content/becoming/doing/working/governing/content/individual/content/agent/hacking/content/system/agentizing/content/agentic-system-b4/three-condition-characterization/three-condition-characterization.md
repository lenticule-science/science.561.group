---
type: theorem
class: definitional-claim
status: proved
depends-on:
  - teaching/explanations/agentic-system.md
  - teaching/explanations/environmental-action.md
  - teaching/explanations/goal-directed-planning.md
  - teaching/explanations/persistent-state.md
see-also:
  - teaching/explanations/agentness-spectrum.md
  - teaching/explanations/from-chatbot-to-agent.md
  - ../texts/toward-a-falsifiable-definition-of-agentic-systems.md
references:
  - references/bent2025.md
  - references/anthropic2024.md
  - references/staufer2026.md
  - references/russell-norvig2020.md
---

# Three-condition characterization

**Claim.** The three conditions — [environmental action](teaching/explanations/environmental-action.md), [goal-directed planning](teaching/explanations/goal-directed-planning.md), and [persistent state](teaching/explanations/persistent-state.md) — are jointly sufficient and individually necessary for a computational system to be an agentic system.
A system satisfying all three is an agentic system; a system failing any one is not.

## Why each condition is necessary

**Environmental action is necessary.** A system that does not modify persistent external state through its operations cannot produce lasting effects on its environment.
It can generate outputs (text, computations), but those outputs exist only within the interaction that produced them.
Such a system is a generator or a classifier — not an agent. *Excluded by this condition:* chatbots, RAG systems, single-turn language models, search engines.

**Goal-directed planning is necessary.** A system that acts on its environment through a fixed, developer-specified execution path is an automation.
The developer did the planning; the system executes.
Execution is not planning — planning requires the system itself to decompose objectives into action sequences and select among alternatives. *Excluded by this condition:* predefined workflows, RPA scripts, deterministic pipelines, cron jobs with tool calls.

**Persistent state is necessary.** A system that loses all operational context at process termination cannot accumulate knowledge of its environment, cannot track its own progress, and cannot resume toward a goal after interruption.
Such a system is stateless with respect to its objectives — it addresses each interaction from scratch. *Excluded by this condition:* stateless API wrappers, context-window-only LLM sessions without checkpointing, single-invocation function calls.

## Why the three conditions are jointly sufficient

A system satisfying all three conditions:

- Acts on its environment, producing effects that outlast its computation (environmental action).
- Selects and sequences its own actions toward a goal without external specification of the execution path (goal-directed planning).
- Maintains and recovers operational context across interaction boundaries (persistent state).

Such a system can receive a goal, develop a plan, execute the plan through environmental actions, track progress, recover from interruptions, and terminate when the goal is achieved.
This is the functional definition of an agentic system across the literature surveyed (Bent 2025, MIT AI Agent Index 2026, Anthropic 2024, Russell and Norvig 2020).

## Why this characterization is falsifiable

Each condition admits an operational test:

- *Environmental action test:* Remove the system; observe whether the changes it caused remain in external state.
- *Planning test:* Present a goal requiring two causally dependent actions; observe whether the system identifies and executes the dependency without external specification of the execution order.
- *Persistent state test:* Interrupt the system between actions; resume it; observe whether it recovers without re-deriving its plan.

A system that passes all three tests is agentic.
A system that fails any test is not.
The falsifiability is what distinguishes this characterization from prior definitions (Anthropic's workflow/agent distinction, Ng's four patterns, Sapkota et al.'s gradient taxonomy) — all of which identify relevant properties but do not supply tests.

## What the theorem does not claim

The theorem does not claim that the three conditions are the only interesting properties of agentic systems.
They are necessary and sufficient for membership in the category; they are not a complete description of any system's behavior.
The [agentness spectrum](teaching/explanations/agentness-spectrum.md) provides gradation above the floor.
The coordination theorems characterize multi-agent behavior.
The accountability theorems characterize governance obligations.
These are all distinct from the characterization theorem.

The theorem also does not claim that any system passing the three tests is safe, reliable, or appropriate for deployment.
Meeting the three conditions establishes that a system is agentic; it says nothing about the quality, predictability, or risk profile of the system's behavior.

## Engineering consequences

The three conditions define a design checklist for agentic system development:

1. Does the system have write-capable tools that produce persistent external state changes?
  (Environmental action)
2. Does the system's model select and sequence tool calls based on goal analysis, not a fixed execution path?
  (Goal-directed planning)
3. Is the system's operational state serialized to durable storage, enabling recovery after interruption?
  (Persistent state)

A "yes" to all three confirms the system is agentic and should be treated with the safety, accountability, and observability practices appropriate to agentic systems.
