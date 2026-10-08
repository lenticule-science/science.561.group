---
type: object
class: contemporary
status: active
depends-on: []
see-also:
  - tool-schema.md
  - tool-result.md
  - side-effect.md
  - ../morphisms/tool-invocation.md
references: []
title: Tool
description: "A tool is the primitive object of tool-use theory: a function with a typed schema, an invocation interface, and an effect on environment state."
---

# Tool

A **tool** is the primitive object of tool-use theory: a function with a typed [schema](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/content/tool/content/tool-use/tool/tool-schema.md), an invocation interface, and an effect on environment state.
Tools generalize function-call APIs, REPL evaluators, browsers, and computer-use interfaces under one formalism.

## Anatomy

A tool $T$ comprises:

- **Identifier.** A name agents use to refer to it.
- **Schema.** Typed declaration of parameters and return.
- **Invocation interface.** How the tool is called (function call, HTTP request, syscall, etc.).
- **Implementation.** The code or service that performs the work.
- **Effect class.** Read-only, idempotent, mutating, irreversible — what kinds of [side-effects](side-effect.md) the tool can produce.
- **Latency profile.** Expected time to respond.
- **Error modes.** What kinds of failures the tool can return.

The effect class is critical for safety reasoning; read-only tools are safer than mutating tools, which are safer than irreversible tools.

## Tool taxonomy

Useful classifications:

- **By effect class.** Read-only, idempotent, side-effecting, irreversible.
- **By external dependency.** Pure (deterministic given inputs), state-dependent (reads external state), interactive (requires external I/O).
- **By scope.** Sandbox-local, application-scoped, cross-application, internet-scoped.
- **By trust requirement.** Self-trusted, requires authentication, requires user approval per call.

These dimensions are largely orthogonal; tools live in the product space.

## Examples

- `read_file(path)` — read-only, sandbox-local.
- `write_file(path, content)` — mutating, sandbox- local.
- `send_email(to, subject, body)` — irreversible, external-scoped.
- `query_database(sql)` — read-only or mutating depending on SQL, application-scoped.
- `execute_code(language, code)` — wildly variable effect class; the most general tool.
- `click_at(x, y)` — computer-use action; effect depends on what's at $(x, y)$.

The variety motivates the formalism: treating all of these as instances of "tool" lets agentic systems handle them uniformly.

## Composition

Tools combine through agent orchestration:

- Tool output feeds into next tool's input via agent reasoning.
- Multiple tools may be called in parallel when independent.
- Tool calls may be conditional on previous results.
- Tool chains may include retries on error.

Agents are essentially programs that compose tool calls; the tool registry is the available primitive operation set.

## In contemporary AI

Standard practice across all major LLM platforms:

- OpenAI tools / function calling.
- Anthropic tools (Claude API).
- Google function declarations (Gemini).
- Open-source: vLLM, TGI, llama.cpp all support tool formats.

The tool abstraction is sufficiently uniform across vendors that tool definitions are largely portable.

## Limits

- **Tool-call format brittleness.** Models may emit malformed calls.
- **Effect classification absent in standard schemas.** Effect class is metadata schemas don't capture natively.
- **Verification.** Verifying tool implementations match schemas is the implementer's responsibility.
- **Composition correctness.** Per [composition-correctness-undecidable](composition-correctness-undecidable.md), tool-chain correctness is undecidable in general.
