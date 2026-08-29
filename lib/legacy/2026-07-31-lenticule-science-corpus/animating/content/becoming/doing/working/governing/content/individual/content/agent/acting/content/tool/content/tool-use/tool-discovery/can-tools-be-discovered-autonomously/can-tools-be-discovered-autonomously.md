---
type: question
status: open
see-also:
  - ../morphisms/tool-discovery.md
  - ../objects/tool-registry.md
---

# Can tools be discovered autonomously?

## The question

Can LLM agents *discover* tools they don't know about through environmental exploration — by reading documentation, exploring APIs, finding code?
Or must tools always be pre-registered?

## Why it matters

If autonomous discovery works:

- Agents adapt to new environments without re-registration.
- Long-running agents can extend their own capabilities.
- Tool registries become less of a bottleneck.

If it doesn't:

- Tool augmentation requires explicit pre-registration.
- Agent capabilities are bounded by what humans configure.
- Discovery becomes a separate engineering problem rather than an agent capability.

The answer shapes how agentic systems will scale.

## What "discovery" could mean

Several senses, increasingly ambitious:

- **Documentation discovery.** Read docs of available APIs and infer how to use them.
- **API exploration.** Probe APIs (OPTIONS requests, introspection endpoints) to learn structure.
- **Filesystem discovery.** Find executable scripts, binaries, modules to use as tools.
- **UI discovery.** Computer-use agents discovering software functionality through UI exploration.
- **Code discovery.** Reading codebases to find callable functions.
- **Web discovery.** Finding services online via search or directories.

Different senses have different feasibility profiles.

## Empirical evidence

Mixed:

- **Documentation-based discovery.** Works partially.
  LLMs can read API docs and produce usable calls.
- **Exploration-based discovery.** AutoGPT-style attempts; brittle.
- **UI exploration in computer use.** Limited evidence; emerging.
- **Code exploration.** LLMs can read code and infer functionality, but reliable discovery of "what's callable in this codebase" is partial.

No clear "this works robustly" results.

## Why it's hard

- **Discovery requires generalization.** Agents must recognize tool-use opportunities they weren't trained on.
- **Trust.** Discovered tools may be untrusted; how to gate?
- **Schema synthesis.** Discovering a tool also requires synthesizing a usable schema.
- **Verification.** How to verify discovery is correct without trying?
- **Side effects of exploration.** Probing APIs may have unintended effects.

These compound.

## Hypotheses

- **Discovery works for documentation-rich environments.** When good docs exist, discovery is feasible.
- **Discovery requires sandbox exploration.** Agents must safely try tools to learn them.
- **Discovery is bounded by agent capability.** More capable agents discover better.
- **Discovery is bounded by trust.** Even discoverable tools require trust mechanisms.
- **Discovery is fundamentally limited.** Reliable autonomous discovery may not be achievable; pre- registration always preferable.

Mixed evidence on each.

## What progress requires

- **Discovery benchmarks.** Standardized tests of agent ability to find and use new tools.
- **Documentation-quality studies.** What documentation supports reliable discovery.
- **Trust mechanisms.** How to vet discovered tools.
- **Sandbox exploration safety.** How to explore safely.
- **Schema synthesis methods.** Generating usable schemas from discovered functionality.

These are early-stage.

## Connection to MCP

The Model Context Protocol provides standardized *registration* of tool servers — agents discover what tool servers expose through a standard protocol.
This is *guided discovery* — discoverable within the protocol's scope, not arbitrary discovery.

MCP-style approaches may be the practical middle ground: standardized discovery within standardized registries, rather than fully autonomous discovery in the wild.

## Why it matters

- **Long-running agent autonomy.** Agents that discover their own tools require less human configuration.
- **Multi-agent ecosystems.** Discovery is needed when agents must coordinate with new agents.
- **AI capability scaling.** Discovery removes a human-configuration bottleneck.
- **Safety.** Autonomously-discovered tool use is harder to audit and constrain.

## Status

Open and contested.
Some discovery works in restricted settings; reliable autonomous discovery in arbitrary environments doesn't yet.
The trajectory probably involves *guided* discovery (MCP-style standardized discovery within standardized registries) rather than *arbitrary* discovery.
