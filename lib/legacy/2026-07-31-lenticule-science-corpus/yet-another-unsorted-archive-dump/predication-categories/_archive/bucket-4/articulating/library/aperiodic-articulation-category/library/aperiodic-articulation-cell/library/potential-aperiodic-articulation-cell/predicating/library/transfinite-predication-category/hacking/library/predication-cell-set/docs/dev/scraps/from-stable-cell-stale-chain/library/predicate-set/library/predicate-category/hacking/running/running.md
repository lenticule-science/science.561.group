---
name: running
gerund: running
agent-noun: runner
imperative: run
description: Driving a process to its next state — iterating until a stop condition, advancing one tick of an engine, or executing a script's body to its completion.
---

A run transformer. The transformer takes a process specification and drives it forward by one or more steps: a tick, a pass, a loop iteration, an end-to-end execution. The output is the process's updated state plus any witness records the run emits.

## Domain and codomain

- **Domain:** a runnable — a tuple `(process, input)` where the process names the engine (a closure-rule pass, a respond loop, a test suite, a build pipeline) and the input names the state at entry (a snapshot, a queue handle, a configuration).
- **Codomain:** the updated state at exit plus a witness record describing what advanced and what was emitted.

## Morphological forms in naming grammar

- `gerund: running` heads skills built on this transformer: `running-the-respond-loop-of-a-character`, `running-pagefind`, `running-python-tests`, etc.
- `agent-noun: runner` heads agents that invoke such skills: `runner-of-the-respond-loop-of-a-character`, etc.
- `imperative: run` heads scripts that body such skills: `run-the-respond-loop-of-a-character.mjs`, etc.

## Distinct from adjacent transformers

- `firing` (`firing-closure-rule`) is one rule, one assignment — running iterates firings.
- `settling` (`settling-an-operational-record`) is the application body for closure-to-quiescence on one record — running can wrap settling repeatedly across many records.
- `dispatching` is matching work to a worker; running is executing the matched work.

## Step-induction role

A run is one of the principal acts by which the cell store changes deterministically over time. Reading produces witnesses without state change; running fires rules, advances ticks, executes scripts — each invocation produces a witness chain naming the firings and the resulting cells.
