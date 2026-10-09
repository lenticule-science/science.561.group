---
name: verb-as-bilattice-instrumented-slash-command
description: "A bilattice-instrumented slash command is a runtime-side projection of a FARS verb in which the slash command has no substrate-side prose record of its own — its body is generated mechanically from the verb's SPEC (or legacy _HELP entry), and its invocation is a one-liner that hands control back to python -m fars <verb>."
kind: concept
type: concept
title: "Verb as bilattice-instrumented slash command"
status: draft
depends-on:
  - concept:bilattice-valued-witness
  - concept:bilattice-graded-hook-intercept
  - concept:dispatch-witnessed-workflow-step
  - concept:pam-channels
realizes:
  - "harness:claude-agent-sdk-plugin"
references:
  - "operations/engineering/fars/src/fars/cli/__main__.py"
---


## Primary intension

A *bilattice-instrumented slash command* is a runtime-side projection of a FARS verb in which the slash command has no substrate-side prose record of its own — its body is generated mechanically from the verb's `SPEC` (or legacy `_HELP` entry), and its invocation is a one-liner that hands control back to `python -m fars <verb>`.
The verb's substrate machinery (the `EventLog.append(Witness(...))
` calls inside whichever channel the verb owns) fires on the `python -m fars` invocation regardless of which runtime opened the slash command.
The witness chain produced by `/fars-<verb>` in claude-agent-sdk and by `python -m fars <verb>` in a bare shell are indistinguishable on the event log — the slash command is *envelope*, not *content*.

Two related projections in this family — the [bilattice-graded hook intercept](../../bilattice/bilattice-graded-hook-intercept/bilattice-graded-hook-intercept.md) and the [dispatch-witnessed workflow step](../dispatch-witnessed-workflow-step.md) — are not envelope-only.
The hook intercept *adds* a witness emission that didn't exist before (the runtime event itself is what becomes a `Witness`).
The workflow step *wraps* the runbook in a per-step witness preamble that the runtime has to obey.
The slash command does neither: it adds nothing to the witness chain, because the verb already produced one.

## Secondary intension

Three pieces define the contract:

1. **The verb registry is the substrate record-set.** `fars.cli.__main__.
  VERB_MODULES` enumerates every verb.
  Each verb either carries a `SPEC: VerbSpec` constant (declarative shape — name, description, parameters, example) or has a row in `cli.help._HELP`.
  The harness installer walks both sources and produces a per-verb command markdown — slug, frontmatter, body — without any substrate prose to hand-author.
2. **The plugin envelope is the runtime projection.** Each `commands/<verb>.md` has `description` (from `SPEC` / `_HELP`) and `allowed-tools: Bash(python -m fars <verb>:*)` in frontmatter; body is a parameter list, an example, and the invocation block.
  The runtime opens the plugin, sees the slash command, the user types `/fars-<verb>`, the runtime invokes the verb under shell.
3. **The witness chain is invariant under envelope swap.** The `python -m fars <verb>` invocation runs the verb's `run()`, which calls `EventLog.append(Witness(...))
  ` on the verb's channel — the same channel the verb writes to under any other invocation surface.
  Two invocations of `/fars-validate` (one via the slash command, one via raw shell) produce two `Witness` records that differ only in `timestamp` and (possibly) `details`.

## Why an envelope projection is load-bearing

The naive intuition: an envelope is degenerate, since it adds no semantic content.
Why bother projecting if you're not adding anything?

Under [PAM channels](pam-channels.md), the answer is: envelope projection *preserves the channel structure under runtime swap*.
If the substrate's observation surface (the event log) only sees `dispatch:fars.validate` cells when the verb is run from one specific runtime, the runtime is leaking semantic content into the channel.
If the event log sees the same `dispatch:fars.validate` cells regardless of which runtime opened the verb, the channel is genuinely substrate-owned and the runtime is a swappable surface.
An envelope-only projection — like this plugin — is the *test* that the channel structure has not been entangled with the runtime.

This is the same property that makes test fixtures durable across language migrations: if your tests assert on log lines and the log lines are produced by a layer below the language under test, you can swap the language without rewriting the tests.
Here, swap "language" for "agent runtime" and "tests" for "the substrate's observation channels."

## Realization

- `pyfars.harnesses:claude-agent-sdk-plugin/_index.md` — the harness descriptor.
- `_install_claude_agent_sdk_plugin` / `_walk_verb_records` / `_claude_plugin_command_text` / `_claude_plugin_manifest_text` in `operations/engineering/fars/src/fars/cli/install_harness.py` — the projector.
- `fars.cli.__main__.
  VERB_MODULES` — the substrate record-set (existing).
