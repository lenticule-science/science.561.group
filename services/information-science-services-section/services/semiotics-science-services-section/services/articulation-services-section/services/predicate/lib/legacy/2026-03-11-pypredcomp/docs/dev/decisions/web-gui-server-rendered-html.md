---
title: "Web GUI is server-rendered HTML by default"
description: "Server-rendered HTML with minimal client JS as the default. Heavier frameworks per-app where justified."
kind: decision
status: accepted
---

# Web GUI is server-rendered HTML by default

**Decision.** The web GUI defaults to **server-rendered HTML** with minimal client-side JavaScript for forms and WebSocket subscriptions.
Heavier frameworks (React, Yew, Elm, Svelte) MAY be used per-app where they fit, but they are not the default.

**Why.** From the captain's [`web-gui-messaging`](../../../../../../../../operations/engineering/triage/operations/command/ideas/triage/web-gui-messaging.md) and ECC-related plans:

- **The substrate is the source of truth.** Heavy client-side state management duplicates substrate state in the browser, creating drift.
  Server rendering keeps the substrate canonical.
- **The substrate already streams.** Fiber updates push via WebSocket; the browser updates the rendered HTML.
  No need for a virtual DOM diff against client-side replicated state.
- **Simplicity.** A Jinja-or-equivalent template plus a thin WebSocket subscriber is far simpler than a full SPA framework.
  The substrate's state model fits the pattern.
- **The captain prefers it.** Multiple plans reference htmx, Jinja, or unpoly-style server-rendering as the target.

**What this rules out.**

- React / Vue / Angular as the *default* for all UI.
- Client-side routing as the default (URL → fiber projection works server-side).
- Redux / MobX / Zustand for state management (substrate is the state).

**What this does not constrain.**

- Specific apps where rich client-side interaction matters: a graph viewer ([apps/knowledge.md](../specs/apps/knowledge.md)), a real-time game terminal ([apps/simulation.md](../specs/apps/simulation.md)), a complex dispatch editor — these MAY use heavier frameworks.
  The base shell stays light.
- Progressive enhancement (vanilla JS for forms, fetch for live updates) is encouraged.
- Server-side rendering may be done from any language (Python/Jinja, Rust/Tera/Askama, JS/Handlebars).
  The choice is per-implementation.

**Reference architecture.**

```
Browser request
  → Rust HTTP handler
  → fetches relevant fiber from substrate
  → renders HTML via template engine
  → returns HTML + minimal CSS/JS shell
  → opens WebSocket for live updates
  → updates HTML fragments as fibers change
```

This pattern is closer to Phoenix LiveView or htmx-style apps than to a JS-heavy SPA.
It scales to substantial UI complexity (Phoenix LiveView runs entire complex apps this way).
