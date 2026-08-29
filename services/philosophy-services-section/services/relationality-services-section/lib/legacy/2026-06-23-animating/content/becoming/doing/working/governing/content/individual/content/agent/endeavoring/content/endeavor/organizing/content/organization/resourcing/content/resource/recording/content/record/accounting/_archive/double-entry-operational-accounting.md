---
name: double-entry-operational-accounting
specialization: idea
date-created: 2026-04-04
serves: operations-loop
relates-to:
  - plaintext-accounting-operations
  - ops-tracking-stage
  - ops-integration
---

## Captain's prompt (2026-04-04)

> One thing I would love to see is send some fault to start planning or of our internal accounting stuff especially now that we have metrics we need to start considering how we want to handle that, which relates deeply to things like how we want to handle logging, which I think also relates to how we want to handle things like chat channels, which is a bit of a weird concept but if you look at my mud code you can see how I use chat services to facilitate what other systems might do with a more internal messaging system, I don't see a need to unnecessarily internalize messaging, if we can treat it like standard knowledge being passed around.
> I think what we can do now that is totally different than simple chat channels and logging is start considering what it would mean to use double booked accounting to incorporate more checks on what is being logged and how it is being logged.
> I think this might help us catch technical things, but it might also help us see ethical issues and command failures in complicated ways.

## The idea

Apply double-entry bookkeeping principles to operational logging and metrics — not just financial transactions.
Every event that changes state has a debit and a credit: tokens consumed debit the session, credit the system's knowledge output.
A dispatch debits capacity, credits progress toward a goal.
A failure debits the plan's confidence, credits the learning system with new information.

This connects several things: - **Metrics** (tokens, cost, duration) — now captured per session - **Logging** — events as EAVT entities in the operations graph - **Messaging** — MUD chat channels as the transport (not a separate internal messaging system) - **Ethical/command checks** — imbalanced books reveal problems.
If tokens are consumed but no artifacts produced, something is wrong.
If authority is exercised but no accountability event recorded, something is wrong.

The double-entry constraint means every state change must balance.
This is a structural integrity check that catches both technical bugs (events without consequences) and organizational problems (work without accountability).
