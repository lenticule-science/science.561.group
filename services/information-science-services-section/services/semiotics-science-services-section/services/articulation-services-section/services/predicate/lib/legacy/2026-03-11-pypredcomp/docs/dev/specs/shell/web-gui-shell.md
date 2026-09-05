---
title: "Web GUI surface"
description: "The browser-facing protocol. Every UI affordance is a structured message into the substrate; every UI element renders a fiber projection."
kind: spec
status: normative
version: "0.1"
---


The web browser interface is a first-class surface, not a stretch goal.
Its protocol is the embodiment of [decisions/web-ui-is-messages.md](../../decisions/web-ui-is-messages.md): every visible affordance constructs a structured message; every rendered element projects from a substrate fiber.

## 1. Transport

Two channels:

- **HTTP** — request/response for navigations, form submissions, page loads.
  Endpoints per [http-addressing.md](../http-addressing.md).
- **WebSocket** — `wss://<base-uri>/ws` — for live fiber updates pushed from the heartbeat to subscribed views.

Initial page load: HTTP.
Subsequent fiber-update pushes: WebSocket.
Form submits: HTTP POST `/respond`.
Long-running operations: HTTP with streaming response.

## 2. Message construction (browser → substrate)

Every UI affordance — button click, form submit, drag-drop release, keyboard shortcut — constructs and sends a message:

```json
POST /respond
Content-Type: application/json
body: {
  "target": "<entity-slug>",
  "payload": {
    "<predicate>": "<value>",
    ...
  },
  "sender": "<authenticated-user-slug>",
  "evidence": false
}
```

The browser MUST NOT mutate any other endpoint.
There is no `PUT /tasks/<id>`, no `DELETE /messages/<id>`.
The single mutation primitive is `respond`.

For convenience, the browser may compose payloads using the [message language](../message-language.md) when needed (e.g., `{"apply": {...}}
` for computed values).

## 3. Fiber projection (substrate → browser)

The browser renders fibers.
A view is a function:

```
view(fiber, ord) → DOM
```

The view is pure: same fiber + same ord → same DOM.
Re-rendering happens when:

- The view's underlying fiber's hash changes (substrate appended a new event affecting that fiber).
- The user navigates to a different fiber.
- The user explicitly re-fetches.

The substrate pushes fiber updates via WebSocket subscriptions:

```
ws subscribe → {"action": "subscribe", "fiber": "<entity-or-projection>"}
ws push  ← {"fiber": "<entity-or-projection>", "ord": <new-ord>, "fiber_data": {...}}
```

The browser maintains an in-memory fiber map of subscribed entities; pushes update individual entries; the renderer re-runs.

## 4. Rendering primitives

The DOM is structured around fiber projection:

- **Cell renderers** — given a cell's value, render appropriate UI (a $t$ checkbox, a $\top$ disagreement note, etc.).
- **Predicate renderers** — given a predicate slug, decide which cell renderer to use and what label to show.
- **Entity views** — for an entity, the predicates the view foregrounds (per the projection's spec) determine layout.
- **List views** — for a fiber slice (entities matching a filter), how to render headers and rows.

These are themselves substrate entities (`view-spec` records) so the renderer reads its layout from the substrate.
New views are appended; the renderer hot-reloads.

## 5. The single-page-app structure

The browser shell is one HTML document.
Inside, route changes update the displayed view:

| Route | View |
|---|---|
| `/` | dashboard (configurable per user) |
| `/chat/<channel>` | chat app's channel view |
| `/chat/dm/<user>` | DM view |
| `/tasks` | task board |
| `/tasks/plan/<id>` | plan view |
| `/ledger` | trial balance |
| `/ledger/account/<slug>` | register |
| `/fleet` | fleet dashboard |
| `/library/<entity>` | knowledge entity view |
| `/governance` | charter view |
| `/sim/<world>` | game terminal |
| `/admin/...` | substrate-admin views (cells, rules, events, peers) |

Routes resolve to fiber-projection specs; specs render against the substrate.
Adding a new route is appending a route record + view spec to the substrate.

## 6. Authoring

UI authoring (when a user composes content like a chat message or a plan body):

- A textarea collects user input.
- On submit, the input is wrapped in a `respond` payload.
- The payload's predicates are determined by the form's spec (e.g., for chat: `body`, `audience`, `format`).
- The substrate handles closure rules; the browser awaits the `respond` result and updates.

There is no "edit mode" vs "view mode" beyond the form being focused or not.
Edits are appended events; old versions are queryable.

## 7. The component model

Per the captain's [`web-gui-messaging`](../../../../../../../../../operations/engineering/triage/operations/command/ideas/triage/web-gui-messaging.md), the browser uses **server-rendered HTML with minimal client interactivity** as the default: Jinja-or-equivalent templates rendered server-side, plus small bits of vanilla JavaScript for forms and WebSocket subscriptions.

Reasoning:

- The substrate is the single source of truth; the browser is a renderer.
- Heavy client-side state management (Redux, MobX, etc.) duplicates substrate state in the browser, creating drift.
- Server rendering is simpler; the substrate can stream changes; the browser doesn't need a virtual DOM.

Heavier client frameworks (React, Yew, Elm) MAY be used for specific apps where they fit (a complex graph viewer for [knowledge.md](../apps/knowledge.md), a real-time game terminal for [simulation.md](../apps/simulation.md)).
The base shell stays light.

## 8. Authentication

The browser session carries an authentication token mapping to a substrate entity (typically a personnel slug):

```
GET / 
  Cookie: pc-session=<base64-token>
```

The token is validated against substrate cells `(personnel:<slug>, session-token, <hash>)`.
The corresponding entity becomes the browser's `sender` for all `respond` calls.

Unauthenticated users (configurable per deployment) may have a default sender (anonymous, with restricted scope) or be blocked.

## 9. Errors and feedback

A `respond` returning `PCC_*`, `PCA_*`, or other error codes surfaces in the UI:

- Inline form errors for `PCC_UNKNOWN_FIELD` and friends.
- A toast/banner for `PCA_SCOPE_INSUFFICIENT` ("you don't have authority to do this").
- A modal for `PCC_MONOTONICITY_FAIL` ("this would un-witness past evidence; explicitly retract instead").

Error codes are textual ([error-codes.md](../error-codes.md)); the UI displays the code plus a human-readable message keyed off the code.

## 10. Live $\top$-cells

When a fiber the browser is viewing has a $\top$-cell, the renderer presents both sources of evidence honestly.
Common pattern:

```
[Predicate]: ⊤ (two sources disagree)
  - peer-A says: True (signed 2026-05-01T10:00Z)
  - peer-B says: False (signed 2026-05-01T11:23Z)
  [Resolve as: True | False | Both | Discuss]
```

Resolution clicking constructs a `respond` to record the resolution as a substrate cell.
Both source values remain in the event log.

## 11. Conformance criteria

A working web-gui surface:

1. Loads `/` and renders the dashboard from a substrate-derived view spec.
2. Submitting a form constructs a `respond` and the resulting fiber update arrives via WebSocket within 200ms locally.
3. The browser cannot bypass `respond` to mutate the substrate (no separate API endpoints for direct writes).
4. A $\top$-cell renders with both source values.
5. Authentication routes the session to a substrate entity; that entity is the sender for all writes.
6. Adding a new view spec to the substrate hot-loads in connected browsers.
