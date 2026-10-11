---
name: "Treasury Ruleset"
date-created: 2026-10-08
aliases:
  - "ruleset"
  - "Juicebox ruleset"
  - "funding cycle"
description: "A time-boxed bundle of treasury rules - issuance weight, reserved share, payout limits, cash-out rate, permissions - that a protocol applies for a fixed duration and then replaces by a queue, with an optional approval hook delaying changes."
references: {}
---

A **treasury ruleset** is the unit of change in Juicebox-style treasuries. Everything about how a project takes in and pays out money for one period is written into one object: tokens minted per unit paid and the cut applied to that rate each cycle, the share of new tokens reserved for named recipients, the payout limits that reset each period, the cash-out tax rate, and flags for what the owner may do (mint, migrate, change terminals).

The project owner can queue the next ruleset; when the current one ends, the next takes effect, or the current one repeats with its issuance reduced. An approval hook, such as a 1-day, 3-day or 7-day deadline contract, can refuse a queued ruleset that was submitted too late, giving participants a guaranteed notice period before rules change.

Payout limits make a recurring budget enforceable on-chain; the funds above those limits are surplus and are what token holders can redeem against. The mechanism constrains how rules change, not whether the people who set them are right.
