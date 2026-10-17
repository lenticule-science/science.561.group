---
type: concept
class: protocol
description: A periodic check performed by the gateway to determine if any scheduled tasks (cron jobs) are due to run.
status: draft
depends-on: []
---

# Heartbeat

The **heartbeat** is a lightweight, periodic check that the OpenClaw gateway performs to see if any cron jobs have reached their scheduled time.
If a job is due, the gateway triggers it according to its configuration (e.g., spawning an isolated agent turn or injecting a system event).

In the OpenClaw theory: - The heartbeat is the mechanism that turns time-based scheduling into actual work. - It is conceptually similar to a cron daemon’s minute‑level check, but abstracted to work with the platform’s job representation. - Heartbeats do not perform the work themselves; they only detect due jobs and delegate to the gateway’s job‑execution logic. - The interval between heartbeats is configurable and represents a trade‑off between responsiveness and overhead.

The concept abstracts away from any specific clock implementation and focuses on the role of the heartbeat as the scheduling‑driven‑execution link in the platform.
