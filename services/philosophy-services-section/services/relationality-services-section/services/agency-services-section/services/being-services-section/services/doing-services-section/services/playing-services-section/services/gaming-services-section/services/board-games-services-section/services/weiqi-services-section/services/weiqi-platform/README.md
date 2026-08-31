# weiqi-platform

`@lenticule-science/weiqi-platform-services-section` — a covered services-section, not a
singular service. See the
[Weiqi Platform Constitution](../../content/text/documents/articles/notes/weiqi-platform-constitution.md)
for the full purpose/authority/refusal-conditions record, including why this is a section
(distinct Learn and Play faces with distinct inputs, outputs, and refusal conditions) rather
than one package, and the
[Weiqi Learn Constitution](../../content/text/documents/articles/notes/weiqi-learn-constitution.md)
for the 2026-08-19 materialization decision that placed this section at `services/weiqi-platform/`
(a covered section whose eventual Play member sits at the keyed/socketed `services/` tier) while
its pure Learn member sits at the `apps/` tier beneath it, exactly as the kernel's own
materialization placed `weiqi-kernel` at `apps/weiqi-kernel`.

## Cover

| member | status | address |
|---|---|---|
| `weiqi-platform-learn-service` | admitted | `apps/weiqi-learn` (`@lenticule-science/weiqi-learn`) |
| `weiqi-platform-play-service` | declared, not admitted | none — withheld until the board separately authorizes Phase 2 |

## Overlaps and restrictions

Both cover members (once both exist) share one carrier: the board-rendering component, the
glossary hover-card component, and the `weiqi-kernel` dependency itself. Until the Play service
is admitted this overlap is declared-discrete, not proven — see the platform constitution's
§"Cover, overlaps, and stratum". Neither member may reimplement kernel rules logic or diverge
in board-rendering or event-naming from the other.

## What this section does not own

Rules logic (the kernel's, consumed read-only by every member), corpus content (lessons,
glossary, ontology — authored in `weiqi-services-section`'s own `content/`), bot/engine hosting,
and billing/monetization. See each member's own constitution for its full non-ownership record.
