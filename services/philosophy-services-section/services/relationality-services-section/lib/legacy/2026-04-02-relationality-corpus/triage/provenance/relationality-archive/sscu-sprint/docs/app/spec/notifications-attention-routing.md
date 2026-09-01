---
name: notifications-attention-routing
keywords:
  - idea
  - notifications
  - attention
part-of: relational-computer
description: "Treats notifications and alerts as recognitions governed by explicit attention budgets and policies."
---

Treat notifications, alerts, and reminders as recognitions governed by explicit
attention budgets and policies.

## 1. Core recognitions

- `NotificationRecognition`
  - An event requesting attention: source, severity, domain (health, finance,
    social, ops, MUD), suggested urgency, and links to underlying recognitions.
- `AttentionBudgetRecognition`
  - Budgets per identity/workspace/domain: how much interruptive attention is
  - allowed over time, preferred channels and schedules.
- `RoutingRuleRecognition`
  - Rules for routing notifications to workspaces, devices, or agents based on
    source, severity, time, and current focus.

## 2. Topology and measurement

- **Topology**
  - Notifications link to the recognitions they summarize (events, anomalies,
    thresholds crossed, runbook status).
  - Budgets and routing rules attach to identities, workspaces, and domains.
- **Measurement**
  - Counts of notifications by type, outcomes (acted on, dismissed, snoozed),
    and latency to response.
  - Overload metrics: budget overruns, frequent snoozing/dismissal, ignored
    critical alerts.

## 3. Runbooks and flows

- `run_emit_notification`
  - Create a `NotificationRecognition` when important events occur; annotate
    with measurements and suggested urgency.
- `run_route_notifications`
  - Apply routing rules and attention budgets to decide where/when/how to
    surface notifications (desktop, email, MUD, mobile, etc.).
- `run_review_attention_health`
  - Periodically review notification patterns and budgets; suggest rule/budget
    changes to reduce noise and preserve awareness.

## 4. Cross-domain connections

- Connects to:
  - email/messaging, social timelines, ops monitoring, health/finance/ecology,
    projects, and MUD/game events.
- Provides a unified, measurable way to coordinate alerts across all slices of
  the universal relational computer.

