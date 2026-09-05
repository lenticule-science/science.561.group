---
title: "Unified Record — First Officer's Working Sketch"
specialization: idea
date-created: 2026-04-04
serves: operations-loop
relates-to:
  - all-records-are-transactions
  - double-entry-operational-accounting
  - mud-chat-as-messaging
  - graph-is-composition-not-source
---

## Working sketch (first officer, not the researcher's formal design)

### The problem with what we built today

The daemon writes THREE separate things when a session completes: 1.
State update on session entity (update_state_and_pid) 2.
Event entity (record_session_event) 3.
Transaction entity (record_session_transaction)

These are the same act described three times.
The state change IS the event IS the transaction.
Three entities for one thing means three potential inconsistencies.

### What a unified record looks like

Every state change in the system produces ONE record with these attributes:

```yaml
# The act itself
introduces: record  # everything is a record now, not event/transaction/session
action: session-completed
timestamp: 2026-04-04T18:00:00Z
actor: daemon

# What was affected (the entity that changed)
subject: session-f07250d0
subject-prev-state: running
subject-new-state: completed

# The σ face (saturation — what stayed, what was completed)
saturates: session-f07250d0  # this entity is now settled
saturation-type: completion
saturation-content: "56"  # the output

# The Δ face (transfer — what flowed elsewhere)
transfers-to: income:work:tasks-completed
transfer-amount: 0.1098
transfer-unit: USD
transfer-also: knowledge  # qualitative transfer

# Audience (who should see this — the channel)
audience: bridge  # the first officer sees this
audience-also: engineering  # the engineering department sees this
```

### How this subsumes everything

**Logging:** A log entry is a record where you only care about the action and timestamp.
Query: `action = *`, sorted by time.

**Messaging:** A message is a record where you care about the audience.
Query: `audience = bridge`, sorted by time.
That's a chat channel.

**Financial accounting:** A transaction is a record where you care about transfer-amount and the accounts.
Query: `transfer-unit = USD`, grouped by transfers-to.
That's a ledger.

**Event tracking:** An event is a record where you care about the action and subject.
Query: `action = session-completed`, grouped by subject.
That's the event log.

**Officer monitoring:** The first officer queries `actor = daemon, audience = bridge, action = session-*` to see what officers have done.
Failed sessions show up as `action = session-failed` with `audience = bridge, audience-also = attention-queue`.

### The balance check

For every record with a transfer, there must be a corresponding saturation somewhere.
If tokens were spent (transfer) but nothing was saturated (no output, no knowledge gained), the books don't balance.
This is detectable by querying: records where transfer-amount > 0 but no saturation-content exists.

### What this means for implementation

1. Drop the separate `record_session_event` and `record_session_transaction` functions
2. Replace with ONE `record_state_change` that writes a unified record
3. The record carries both σ and Δ faces
4. Queries over these records produce: logs, messages, ledger entries, event streams
5. The MCP server gets query tools for each view: `/log`, `/messages`, `/ledger`, `/events`

### What I don't know yet

- Does every record need BOTH faces?
  Some state changes seem like pure saturation (a term definition is written — it saturates the library, but what does it transfer?)
- Answer might be: writing a term transfers capacity from the ready-queue (one less task open) and transfers knowledge to the library.
  The transfer is always there if you look.
- How granular?
  Does every EAVT fact write become a record, or only "significant" state changes?
- The researcher's design document should address these.
