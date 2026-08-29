---
title: "Bundled apps"
description: "Standard userland shipped in the v0.3 OS image: email, calendar, chat, file browser, text editor, terminal, calculator, ledger tool. Sensor dashboard at v0.5."
kind: index
---

# Bundled apps

The standard userland shipped in the OS base image.
Like Plan 9 ships with `sam`, `acme`, and the basic 9P utilities, this OS ships with email, calendar, chat, and the rest at v0.3.

These apps are **OS-bundled** — not user-stack productivity apps (those come at v0.7).
They cover the basic at-the-keyboard work that any general-purpose OS provides.

## Specs (to be written at v0.3)

- `email-client.md` — IMAP/SMTP email client; threading; attachments; DKIM/DMARC handling.
- `calendar-client.md` — CalDAV calendar client; iCalendar import/export; recurrence; timezone.
- `chat-client.md` — Matrix client (primary); XMPP and IRC drivers (optional); presence; channels; DMs.
- `file-browser.md` — cell-as-file browsing; mount-point browsing; predicate search; tagged views.
- `text-editor.md` — substrate-aware text editor; CRDT collaborative editing; plain-text fallback.
- `terminal.md` — Xterm-equivalent running the message-language CLI; ANSI escapes; readline-equivalent.
- `calculator.md` — operates on the message language; integers/rationals/decimals; unit-aware.
- `ledger-tool.md` — hledger-format render and import; chart-of-accounts as substrate entities; trial balance as fiber projection.

## Specs (to be written at v0.5)

- `sensor-dashboard.md` — ICS sensor data view; bilattice handling for partial/contradictory readings.

## Sibling-theory grounding (per [`references/theories.md` §"Sibling computing theories"](../../references/theories.md))

Bundled apps that mirror an existing computing-theory sibling cite that sibling as their conceptual ground:

- [`multi-user-dungeons`](../../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/multi-user-dungeons/) — LPMUD, MUD libraries, "the-mud-as-system-architecture", "world-building-as-programming".
  Direct authority for the bundled MUD-style app candidate landing (5E in [implementation/capability-ladder.md](../../implementation/capability-ladder.md#candidate-landings-not-yet-on-the-ladder)).
  The "MUD as system architecture" text is the closest peer-system analysis to the substrate's own architecture — both treat the world-state as a substrate that programs run *in*, not over — so its texture also informs how every bundled app here treats world-state vs. session-state.

## Theory grounding

Each bundled app cites its relevant external spec:

- `email-client.md` — RFC 5321/5322 (SMTP), RFC 9051 (IMAP), RFC 1939 (POP3 optional), RFC 6376 (DKIM), RFC 7489 (DMARC).
  Substrate side: `interactive-application-platform/objects/notification-record`.
- `calendar-client.md` — RFC 4791 (CalDAV), RFC 6638 (CalDAV scheduling), RFC 5545 (iCalendar), RFC 6557 (timezones).
- `chat-client.md` — Matrix CS API (https://spec.matrix.org/latest/client-server-api/), RFC 6120/6121 (XMPP), RFC 1459/2811/2812/2813 (IRC).
- `file-browser.md` — substrate-native; uses [filesystem/](../filesystem/) specs.
- `text-editor.md` — `interactive-application-platform/objects/document-record` (CRDT shape), `interactive-application-platform/concepts/collaborative-editing`.
- `terminal.md` — substrate-native; uses [shell/](../shell/) specs; ANSI escapes per https://en.wikipedia.org/wiki/ANSI_escape_code.
- `calculator.md` — substrate-native; uses `kernel/message-language.md` for evaluation; unit-aware via measurement-algebra.
- `ledger-tool.md` — hledger format (https://hledger.org/journal.html); substrate-native chart-of-accounts.
- `sensor-dashboard.md` — substrate-native; uses [drivers/mqtt-driver.md](../drivers/mqtt-driver.md), [drivers/modbus-driver.md](../drivers/modbus-driver.md).

## Conformance

Bundled apps pass:

1. The captain (or a test user) can read and reply to a real email through the email-client.
2. The captain can accept a calendar invite through the calendar-client; CalDAV publishes to a configured server.
3. The captain can chat with a 561 peer (or external Matrix user) through the chat-client.
4. The captain can edit one of their own substrate cells in the text-editor and save it.
5. The captain can compute a balance in the ledger-tool against their existing hledger journals.
6. The terminal, calculator, and file-browser work for at-the-keyboard operations.

## What's NOT a bundled app

The 561 group's productivity stack — tasks, knowledge, governance, dispatch, fleet, review, publishing — are **not** OS-bundled.
They are user-stack apps shipped at v0.7 in their own project directories.
The OS provides the substrate; those apps run on it.

Predicated Zork, the world-sim, Hevî Mala, paracosms — also not bundled apps.
They're research artifacts and content; see [milestones/research-sidebar.md](../../milestones/research-sidebar.md).
