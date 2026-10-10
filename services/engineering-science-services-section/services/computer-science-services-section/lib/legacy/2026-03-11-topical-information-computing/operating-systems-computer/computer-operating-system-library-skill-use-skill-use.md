---
name: skill-use
description: The witness-shape of a single skill invocation by an agent — one atom emitted into the stratified-predication-fiber, recording which agent invoked which skill, with what input, producing what output, signed against which scope and identity-key.
specializing: computer-operating-system
realizes: stratum-doing-act-atom
---

A **skill-use** is the cell-level record of one $\mathcal{P}$-morphism firing — one invocation of one skill by one agent.
Mathematically a skill-use is an atom emitted into the stratified-predication-fiber: stratum-1 (σ-doing-act) if the morphism's body produced a σ-saturated cell, stratum-2 (Δ-doing-act) if it produced a Δ-settled cell.
Each skill-use carries its `deps` chain pointing strictly back to lower-stratum atoms (the stratum-0 speech-acts of the records being read and the lower-stratum doing-acts in its `composes` ancestry), preserving the acyclic stratification property of the predication fiber.

## Skill-use vs tool-use

A skill-use is the *internal* record of a skill firing — the witness emitted by the skill's body.
A [tool-use](../tool-use/tool-use.md) is the *MCP-surface-side* record of a tool call — the JSON-RPC request and response that crossed the harness boundary.
The two are distinct cells with different deps-chains: a single MCP tool invocation produces one tool-use witness (the boundary crossing) and one skill-use witness (the morphism firing); the tool-use's deps include the inbound JSON-RPC envelope, the skill-use's deps include the precondition cells the skill read.

## Distinguishing predication-shape

- `invoked-skill(skill-use, skill)` — the skill that fired.
- `invoked-by(skill-use, agent)` — the agent (character) that invoked it.
- `with-input(skill-use, parameters)` — the parameters bound at invocation.
- `produced-output(skill-use, output)` — the output value the morphism returned.
- `against-scope(skill-use, scope)` — the scope authorization was checked under.
- `signed-by(skill-use, identity-key)` — the identity-key the witness is signed against.
- `at-time(skill-use, time)` — the time the firing completed.
- `deps(skill-use, [atom-id])` — the strictly-lower-stratum atoms this firing depends on.
  Derived from the log scan; not stored as a separate field.

## Not synonymous with

- **Tool-use** — see above.
  Skill-use is the morphism firing; tool-use is the harness boundary crossing.
- **Workitem-record** — a workitem records a dispatch *request*; a skill-use records the *resolution* of one such request once dispatch succeeded.
