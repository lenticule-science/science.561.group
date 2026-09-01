---
type: definition
class: substrate-entity
realizes: [clock, schedule]
depends-on: [clock, schedule, time-and-event-ordinals, witness]
see-also: [tick-advance]
---

# Clock record

A **clock record** is the substrate-entity formal definition of a [clock](teaching/explanations/clock.md) and its relationship to substrate ordinals and wall-clock time. Clock records are how the substrate makes time queryable, federation-portable, and audit-replayable.

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary.
- **`clock-kind`** — `substrate-ordinal`, `wall-clock`, `monotonic`, `external-time-source` (NTP, GPS, atomic).
- **`current-ordinal`** — for substrate-ordinal clocks, the substrate's current ordinal. For wall-clock and monotonic clocks, the most-recently-recorded substrate-ordinal at which the wall-clock or monotonic-clock value was sampled.
- **`current-wall-time`** — for wall-clock and monotonic clocks, the most-recent value.
- **`time-source`** — for external-time-source clocks, references to the source: NTP server URL, GPS receiver address, atomic-clock device.
- **`drift-bound`** — declared maximum drift between this clock and the substrate ordinal clock. Drift exceeding the bound surfaces as a substrate event.
- **`samples`** — references to historical clock samples (substrate-ordinal-and-wall-time pairs).
- **`closure-kind`** — `clock`.

## Invariants

- **Substrate-ordinal-monotone.** The substrate-ordinal clock is monotone non-decreasing. Other clocks may be non-monotone but their relationship to substrate ordinal is recorded.
- **Wall-clock advisory.** Per [clock](teaching/explanations/clock.md), wall-clock readings are informational. The substrate's correctness does not depend on wall-clock accuracy.
- **External-source-citable.** External-time-source clocks cite the source; an auditor can verify the source's claimed authoritative-time at the cited substrate ordinal.

## Position in the substrate

Clock records are the substrate's *time-source registry*. Without them, time is ambient host configuration; with them, the substrate's relationship to time is queryable and replayable. The pattern composes with [schedule](teaching/explanations/schedule.md), [tick-advance](theories/agential-orchestration-platform/morphisms/tick-advance.md), and [witness](witness.md) (which record substrate ordinals and may carry wall-clock metadata).
