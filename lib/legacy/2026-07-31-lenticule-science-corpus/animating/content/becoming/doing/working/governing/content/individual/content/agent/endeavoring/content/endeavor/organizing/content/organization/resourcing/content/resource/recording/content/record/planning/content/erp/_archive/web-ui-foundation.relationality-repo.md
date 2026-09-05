---
title: "Web UI Foundation — HTTP server in mash-engine"
specialization: plan
serves-system: mash
date-created: 2026-04-04
project: local-service-system
department: engineering
cross-cuts: [command]
enabled-by: user-boundary-system
---

# Web UI Foundation

The captain's native I/O is a browser.
The first officer's is MCP.
Both should read from the same EAVT graph through the same observation layer.
The web UI is not a separate application — it's an HTTP transport for the same queries the MCP server handles.

## Architecture

mash-engine already runs a tokio async runtime.
Adding axum (Rust HTTP framework) gives us an HTTP server in the same process:

```
mash-engine daemon
├── heartbeat loop (world tick, session monitoring)
├── EAVT graph (shared state)
├── HTTP server (axum, serves browser)
│   ├── GET /           → bridge view (HTML)
│   ├── GET /crew       → crew status (HTML)
│   ├── GET /api/graph  → graph query (JSON)
│   ├── GET /api/events → event stream (JSON)
│   └── GET /api/balance → trial balance (JSON)
└── (future: WebSocket for live updates)
```

The JSON API endpoints serve the same data the MCP tools serve.
The HTML pages are thin wrappers that render the JSON.
No separate frontend build system — just HTML templates in the binary.

## Dependencies

**Requires user-boundary-system** — no web UI without authentication.
The authentication fiber of the boundary entity IS the login system.
We don't bolt on auth as an afterthought; the user boundary is the foundation the UI renders through.

This means Phase 1 is the JSON API (internal, no auth needed — like MCP, it runs on localhost).
The HTML UI comes AFTER the boundary system provides authentication.

## Phasing

### Phase 0: Networking and access (BLOCKER) The daemon runs on the VPS.
The captain is on a laptop.
Options: - SSH port forwarding: `ssh -L 5610:localhost:5610 vps` (simplest, already secure) - Reverse proxy with nginx + SSL cert (proper, needed for Matrix compatibility later) - Tailscale/WireGuard VPN (connect laptop to VPS private network)

This must be solved BEFORE the web UI is useful to the captain.

### Phase 1: HTTP server + JSON API (code exists, not deployed) Axum added to mash-engine.
JSON API endpoints mirror MCP tools.
One HTML bridge page as proof of concept. **Code written but blocked on Phase 0 + authentication.**

### Phase 2: Operational pages Crew status, task boards, accounting views.
Still server-rendered HTML.

### Phase 3: Interactive features Form submission (create tasks, record events).
WebSocket for live updates.

### Phase 4: Matrix compatibility Map rooms→channels, events→messages.
Element becomes a free client.

## ERP Vision (from ideas/erp-web-platform.md, web-gui-messaging.md, mud-chat-as-messaging.md)

The web UI is not just a dashboard — it's the front end of an ERP (Enterprise Resource Planning) system.
Modules over the same transactional substrate:

1. **Messaging module** — channels over the event stream (homebrew Slack/Element, Matrix-compatible).
  Don't build a separate messaging system: use MUD-style chat channels where a "channel" is a query over the operations graph ("show me all events where subject matches this pattern").
  Messages are events with an audience attribute.
2. **Task management module** — task boards, plan views, dispatch (homebrew Asana/Todoist)
3. **Accounting module** — ledger views, trial balance, budget tracking (homebrew QuickBooks).
  See plaintext-accounting-operations plan.
4. **Fleet module** — session monitoring, agent status, dispatch controls
5. **Knowledge module** — library browsing, search, graph visualization
6. **Review module** — failure reports, observation logs, instinct tracking

Every module reads from and writes to the same unified record system.
A task completion shows up as a message in messaging, a credit in accounting, and a data point in fleet — because every record IS a transaction.

**Protocol compatibility target:** Matrix protocol as primary (our event/transaction system can present as a Matrix homeserver — rooms map to channels, events map to messages).
Element becomes a free client.
Secondary: Slack API compatibility layer where feasible.

**The MUD connection:** MUD rooms ARE channels.
The TUI shows channels as filtered views of the event stream.
The daemon watches channels for patterns.
Agents publish to channels by recording events.
The web UI is the graphical client for this same architecture.

## World-sim math enrichment (from predication-world-sim + old-draft mining, 2026-04-06)

The web UI isn't a dashboard showing data.
It's the captain's UMWELT — what respond(captain, ship) produces when the captain's fiber composes with the ship's fiber.

### The bridge IS the quasicrystal rendered

The settled fiber H*_t IS a Fibonacci quasicrystal — ordered but aperiodic, with a pure-point diffraction spectrum.
The bridge view IS the quasicrystal rendered for human perception.
The Bragg peaks (bright spots in the diffraction pattern) are the MOST STABLE vocabulary — the entities that have settled deepest.
The dimmer peaks are fragile vocabulary.
A bridge that shows settled entities at their spectral intensity shows the captain WHERE STABILITY LIVES in the organization.

Concretely: settled goals (deep Bragg peaks) glow bright.
Fragile plans (dim peaks) are subdued.
Entities in FreeShadow (pure potential — not yet settled in either direction) don't appear in the diffraction pattern at all — they're noise, waiting to crystallize.
The bridge IS a diffractogram of the organization's quasicrystalline settlement.

### Four temperatures, four dashboard modes

The partition function gives the web UI four natural modes corresponding to the four game phases:

| Mode | β range | What it shows | Captain sees |
|------|---------|---------------|--------------|
| **Frozen** (β > ln(3)) | Only shallow structure visible | Just the top-level goals and the ship entity | "Big picture only" |
| **Thawing** (ln(2) < β < ln(3)) | Histories accessible but nothing settled | All entities, color-coded by shadow class — lots of FreeShadow (orange), little H*_t (green) | "We have stuff but nothing's converged" |
| **Crystallizing** (ln(ρ) < β < ln(2)) | Settled entities visible but vocabulary not generating | H*_t entities highlighted, but the tower isn't growing — enrichment needed | "Things are settling but not producing" |
| **Living** (β < ln(ρ)) | Full tower accessible | Vocabulary fold events visible — settled entities becoming atoms for the next level, the quasicrystal actively growing | "The system is alive" |

The captain can ZOOM the temperature — colder shows less (strategic overview), hotter shows more (operational detail).
The zoom IS the inverse temperature β.
This isn't a feature to design — it's what the partition function naturally produces when you weight entities by exp(-β·depth).

### The ERP modules are shadow-class views

Each ERP module from the plan maps to a shadow-class query:

| Module | Shadow-class query | What it actually shows |
|--------|-------------------|----------------------|
| **Task management** | respond(tasks, {channel: shadow-class}) | Tasks by settlement status: H*_t = done, SatShadow = has history but uncertain future, TrShadow = fated but unstarted, FreeShadow = unassigned |
| **Accounting** | respond(transactions, {channel: settlement}) | σ/Δ = debit/credit. Every respond() IS a transaction. The ledger IS the event log filtered to σ/Δ pairs. |
| **Fleet** | respond(officers, {channel: barcode}) | Each officer's shadow-class barcode — distribution of duty predicates across the four classes |
| **Knowledge** | respond(library-terms, {channel: quasicrystal}) | The acceptance window: which terms have entered the settled quasicrystal (permanent vocabulary) vs. which are still outside |
| **Messaging** | respond(events, {channel: audience}) | Channels ARE audience-filtered event streams. A message IS a predication entering a channel. The composition gap (I.6) = why a message to a channel produces new reach |

### The Galois shadow dimension as hidden view

Every settled entity has a Galois conjugate shadow (φ → -1/φ).
The shadow determines whether the entity is inside or outside the acceptance window.
A "shadow view" toggle on the web UI shows the PERPENDICULAR projections — the hidden dimension that governs what persists and what doesn't.

The captain who can read the shadow dimension sees WHICH ENTITIES WILL PERSIST before they settle.
A term whose perpendicular projection is drifting toward the window edge is about to crystallize.
One drifting away is about to fall out.
The shadow view IS organizational precognition — seeing the acceptance dynamics before they resolve.

### Matrix compatibility is fiber composition

The Matrix protocol target maps naturally: rooms = fibers (a shared environment constituted by overlapping Umwelten).
Events = predications entering a room.
Typing notifications = firable adjacencies (something is about to fire but hasn't settled).
Read receipts = settlement acknowledgment (the message composed with the recipient's fiber and produced non-⊥).
The Matrix homeserver IS a MASH instance where rooms are channels, events are messages, and the DAG is the bypass structure.

### The MUD/TUI is the SAME architecture at lower bandwidth

The web UI (rich visual quasicrystal diffractogram) and the TUI/MUD (text channel navigation) are the SAME respond() compositions rendered through different perception fibers.
A visual fiber (the browser) perceives Bragg peaks as colored dots.
A textual fiber (the terminal) perceives the same peaks as named entries in a list.
Same data, same algebra, different rendering — because the renderer IS respond(display-fiber, data-fiber), and different display-fibers produce different Umwelten of the same underlying structure.
