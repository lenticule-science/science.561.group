---
name: email-messaging
keywords:
  - idea
  - messaging
  - email
part-of: relational-computer
description: "Treats emails, chats, and notifications as recognitions so inbox becomes a relational view instead of a flat list."
---

Treat emails, chats, and notifications as recognitions so “inbox” becomes a
relational view instead of a flat list.

## 1. Core recognitions

- `MessageRecognition`
  - headers (from, to, cc, subject), body, attachments.
  - topology: threads, conversations, labels/folders, participants.
  - measurement: delivery latency, read time, reply rate.
- `ConversationRecognition`
  - groups related messages and participants.
- `NotificationRecognition`
  - derived from other recognitions (runbook completions, alerts, social
    events).

## 2. Intake, policy, and traceability

- Incoming messages go through intake:
  - schema checks, spam/abuse policies, identity/auth checks (DKIM/DMARC, etc.).
- Traceability:
  - every message has provenance (protocol, TLS, auth, spam checks),
  - moderation decisions (spam, auto-archive) are runbooks with recorded
    reasons.

## 3. Views and runbooks

- “Inbox”, “Priority”, “Muted” are just different views over the topology +
  measurement slice for messages.
- Runbooks encode workflows:
  - triage (label/archive/snooze),
  - escalation (turn a thread into a task or runbook),
  - digest generation (summaries based on measurement + topology).

