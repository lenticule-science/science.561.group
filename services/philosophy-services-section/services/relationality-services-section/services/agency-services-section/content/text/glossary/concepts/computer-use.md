---
type: concept
class: contemporary
status: active
depends-on:
  - tool-use.md
see-also:
  - browser-automation.md
  - ../objects/side-effect.md
references:
  - references/anthropic-computer-use2024.md
title: Computer use
description: Computer use is tool use generalized to direct control of computer interfaces — keyboard input, mouse clicks, screen perception.
---

# Computer use

**Computer use** is tool use generalized to direct control of computer interfaces — keyboard input, mouse clicks, screen perception.
Where standard tool use operates through structured APIs, computer use operates at the level of *human-style interaction* with arbitrary software.

## What it adds

Computer use enables:

- **Interaction with non-API software.** Any program with a UI becomes accessible.
- **Cross-application workflows.** Coordinating actions across multiple programs.
- **Legacy system access.** Software without modern APIs is reachable through its UI.
- **End-to-end automation.** Tasks involving graphical applications can be automated.

The capability is qualitatively different from API tool use: the agent operates in a much richer, less structured action space.

## Operational structure

A computer-use agent typically:

1. **Receives a screenshot** of the current screen state.
2. **Reasons** about what's visible and what to do.
3. **Emits actions** — click coordinates, key presses, text input.
4. **Receives updated screenshot** after action takes effect.
5. **Continues** until task completion or failure.

This is essentially the visual analog of ReAct.

## Anthropic Computer Use (2024)

Anthropic's Claude with Computer Use was the first production-deployed computer-use capability:

- Vision-capable model perceives screen.
- Emits action calls (click, type, key).
- Iterates with updated screenshots.

Significantly extended LLM agent action capacity at substantial new safety risk surface.

## Distinguishing computer use from related capabilities

- **API tool use.** Structured calls to declared functions.
- **Browser automation.** Control specifically of web browsers (subset of computer use).
- **Computer use.** Generic UI control across all applications.
- **Robotic control.** Physical effectors (out of scope here).

Computer use sits between browser automation and robotic control in scope.

## Implications

Computer use:

- **Vastly expands action space.** Any computer task becomes addressable.
- **Vastly expands risk surface.** Side effects are no longer constrained by API design but by the full UI capability of the system.
- **Requires new evaluation.** Standard tool-use benchmarks don't capture computer-use tasks; new benchmarks (OSWorld, etc.) are emerging.
- **Requires new safety mechanisms.** Permission systems, action approval, sandbox isolation become critical.

## Failure modes

- **Misperception.** Model misreads UI elements.
- **Misclick.** Coordinate errors hit wrong elements.
- **Unintended effects.** Actions trigger unexpected consequences.
- **State drift.** Model loses track of UI state across actions.
- **Adversarial UIs.** Malicious UIs designed to confuse the model.

## In contemporary AI

Computer use is emerging:

- **Anthropic Computer Use** (Oct 2024).
- **OpenAI Operator** (2025).
- **Google Project Mariner** (browser agent).
- **Open-source agentic frameworks** with computer-use support.

The capability is early-stage; reliability is partial; safety mechanisms are evolving.

## Limits

- **Reliability.** Computer-use error rates are substantially higher than API tool-use error rates.
- **Latency.** Visual perception + reasoning + action
  + screenshot loop is slow per step.
- **Verification.** Hard to verify a computer-use agent did the right thing.
- **Sandboxing.** Computer-use agents need strong sandbox isolation; deployment outside sandboxes is high-risk.

## Status

Active and rapidly evolving.
The capability is emerging in production but reliability and safety are ongoing concerns.
Likely to mature significantly over the next several years.
