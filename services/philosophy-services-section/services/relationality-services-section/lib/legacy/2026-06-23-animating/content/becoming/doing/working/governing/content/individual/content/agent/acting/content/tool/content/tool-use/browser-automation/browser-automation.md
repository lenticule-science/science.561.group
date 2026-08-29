---
type: concept
class: contemporary
status: active
depends-on:
  - tool-use.md
see-also:
  - computer-use.md
references: []
---

# Browser automation

**Browser automation** is tool use specialized to web browsers: navigating URLs, filling forms, clicking links, extracting content, executing JavaScript.
It is a restricted form of [computer-use](computer-use.md) — a single application class with rich agent-relevant capability.

## What it enables

Browser automation supports:

- **Web navigation.** Following links, navigating to URLs, managing tabs.
- **Information retrieval.** Searching, reading, and extracting content from web pages.
- **Form interaction.** Filling forms, submitting, handling responses.
- **Authentication flows.** Logging in to web services (with caveats around credentials).
- **JavaScript execution.** Triggering page scripts, reading dynamic content.
- **End-to-end web tasks.** Booking flights, ordering goods, filing forms — anything humans do in browsers.

## Implementations

Two main architectural approaches:

- **DOM-based.** Agent sees parsed HTML/DOM; emits actions targeting specific DOM elements (CSS selectors, ARIA labels, accessibility tree).
  Faster, more reliable when DOM is clean.
  Examples: early WebGPT, Playwright-based agents.
- **Vision-based.** Agent sees screenshots; emits click coordinates and key inputs.
  More general (works on any rendered content) but slower and less reliable.
  Examples: WebVoyager, vision-capable computer-use agents.

Hybrid approaches use accessibility trees augmented with screenshots.

## Operational structure

Typical loop:

1. Agent receives current page state (DOM or screenshot).
2. Agent decides next action.
3. Browser executes action; page state updates.
4. Agent receives new state.
5. Continues until task completion.

Identical structure to general computer use, restricted to browsers.

## In contemporary AI

- **WebGPT** (OpenAI 2021).
  Early browser-based agent for question answering.
- **WebArena, VisualWebArena.** Benchmarks for web agents.
- **Project Mariner** (Google).
  Browser agent.
- **Browser Use, browserbase, Stagehand.** Open-source browser-automation libraries for agents.
- **Operator** (OpenAI 2025).
  Computer use specialized to browser tasks.

## Failure modes

- **DOM brittleness.** Pages with dynamic IDs, complex layouts confuse DOM-based agents.
- **Visual brittleness.** Pages with non-standard UI confuse vision-based agents.
- **Captchas and bot detection.** Many sites detect and block automated access.
- **Authentication friction.** Sites with complex auth flows (2FA, SSO) hard to automate.
- **State management.** Multi-page workflows lose context easily.
- **Adversarial pages.** Malicious pages can attempt prompt injection on the agent.

## Safety considerations

Browser automation has substantial safety surface:

- **Credentials.** Agents accessing authenticated services handle credentials.
- **Side effects.** Clicks can purchase goods, send messages, etc.
- **Prompt injection.** Web content can include instructions targeting the agent.
- **Information leakage.** Agents may exfiltrate data through web requests.

Production browser agents typically use sandboxed browsers, scoped permissions, and human approval for high-stakes actions.

## Limits

- **Site-specific brittleness.** Each site has idiosyncrasies that break automation.
- **Captchas.** Effective bot detection limits browser agent reach.
- **Speed.** Each page interaction takes seconds; long workflows are slow.
- **Drift.** Sites change, breaking automation scripts/agents.

## Status

Active and emerging.
The capability is real and growing; reliability is partial.
Likely to mature significantly with vision-language model improvements.
The interplay with web platforms (which may resist or adapt to AI agents) will shape its trajectory.
