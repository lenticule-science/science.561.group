---
type: theorem
class: informal
status: active
depends-on:
  - teaching/explanations/code-interpreter.md
see-also:
  - tool-augmentation-strict-improvement.md
references: []
---

# Tool-use expressivity

**Statement (informal).** An agent equipped with a code-interpreter tool has Turing-complete action capacity within the interpreter sandbox.
Other tools are special cases of "execute code that does X."

## What this means

Concretely:

- Any computable function can in principle be invoked by the agent through code execution.
- Specialized tools (`get_user_email`, `send_message`, etc.) are conveniences; their effects can be replicated by sufficiently capable code execution against appropriate APIs.
- Code-interpreter access *subsumes* most other tool access (modulo permissions and sandboxing).

This is why the code interpreter is the *most consequential* tool to provide — and the one with the broadest safety implications.

## Caveats

The "Turing-complete action capacity" is bounded by:

- **Sandbox constraints.** The interpreter only does what the sandbox allows.
- **External access.** Without network or filesystem access beyond sandbox, action capacity stays in-sandbox.
- **Library access.** Libraries determine which APIs the agent can call.
- **Resource limits.** CPU, memory, time bounds limit practical computation.
- **Agent capability.** The agent must be able to *generate* the right code; expressivity ≠ access.

So "Turing-complete" is theoretical; practical capacity depends on configuration.

## Implications

- **Provisioning code interpreter is high-leverage.** Most other tools become redundant when code interpreter has broad access.
- **Sandboxing is critical.** Code-interpreter capability must be matched by careful isolation.
- **Effect classification.** Code-interpreter invocations are the worst-case effect class: arbitrary side effects in principle.
- **Selection isn't the bottleneck.** When the interpreter is available, selection often degenerates to "use the interpreter for everything."

## Comparison with other tools

- **Specialized tools.** Bounded action; predictable effects.
- **Code interpreter.** Unbounded action; effects depend on what code does.
- **Computer use.** Similar expressivity at UI level; often slower and more error-prone than direct code.

The expressivity ordering is: specialized < ~browser ~ < computer-use < code-interpreter (when each has comparable access).

## In practice

Production agentic systems frequently use code interpreter for tasks they could have implemented as specialized tools, because:

- It's faster to provide than custom tools.
- It composes naturally (write a script combining steps).
- It handles unforeseen variations.

The trade-off: less predictable, harder to audit, more risk surface.

## Limits

This is informal:

- "Turing-complete" assumes adequate model capability.
- Real expressivity is bounded by sandbox and library configuration.
- Some classes of action (real-time UI feedback, hardware control) may need specialized tools even when code is available.

## Status

Standard observation in agentic-system design.
Justifies the centrality of code interpreter in modern agent architectures.
