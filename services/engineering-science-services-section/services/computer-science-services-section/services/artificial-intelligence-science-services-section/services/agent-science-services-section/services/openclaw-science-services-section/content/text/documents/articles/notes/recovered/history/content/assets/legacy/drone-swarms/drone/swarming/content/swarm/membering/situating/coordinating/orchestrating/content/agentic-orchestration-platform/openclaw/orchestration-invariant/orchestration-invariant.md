---
type: concept
class: invariant
description: A property that holds across all agent orchestration platforms, ensuring coherent behavior despite concurrency and distribution.
status: draft
depends-on: [agent-turn, session]
---

# Orchestration Invariant

An **orchestration invariant** is a property that must hold true for any system to be considered a coherent agent orchestration platform.
These invariants define the essential guarantees that allow reasoning about agent behavior, safety, and composition.

In the OpenClaw theory, several key invariants emerge from the architectural commitments:

## Turn Atomicity Each agent turn executes as an indivisible unit of work from the perspective of the agent's decision-making process.
While tool invocations may interleave with model reasoning, the turn maintains a single causal chain: the model's state and the conversation history progress sequentially through the turn.

## Session Isolation Sessions provide strong isolation boundaries: agent turns in one session cannot directly observe or mutate the state (history, workspace, skill snapshot) of another session.
Cross-session communication must occur through explicit mechanisms (shared files, external services, or gateway-mediated messages).

## Skill Determinism Given the same prompt, session state, skill set, tool configuration, and model seed, an agent turn will produce the same sequence of tool invocations and the same final output (modulo model stochasticity).
This invariant enables reproducibility and debugging.

## Heartbeat Liveness The heartbeat mechanism ensures that no scheduled cron job remains indefinitely past-due.
If a job's schedule becomes due at time t, then there exists a heartbeat at time t' ≥ t such that the job is triggered at t'.

## Dependency Confinement Skills declare their dependencies explicitly (required bins, env vars, config flags) and the gateway enforces these constraints at load time.
A skill cannot implicitly depend on undeclared system state, ensuring predictable behavior across environments.

## Composition Safety The composition of skills (via one skill invoking another) preserves the invariants of the platform.
The gateway's skill loading and allowlist mechanisms prevent skill composition from violating dependency confinement or session isolation.

These invariants form the theoretical foundation for reasoning about OpenClaw as an agent orchestration platform and provide a basis for comparing it to other systems in the same class.
