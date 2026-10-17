---
type: theorem
class: invariant
description: The heartbeat process will trigger any cron job whose schedule has come due.
status: draft
depends-on: [cron-job, heartbeat]
---

# Heartbeat Triggers Due Cron Jobs

In OpenClaw 2026.05.07, the **heartbeat** process is responsible for evaluating scheduled cron jobs and triggering those whose scheduled time has arrived.

## Statement

Let `H` be a heartbeat event occurring at time `t_H`.
Let `J` be a cron job with schedule `S_J` and payload `P_J`.
If `S_J` evaluates to `true` at time `t_H` (i.e., the schedule is due), then the gateway will execute payload `P_J` according to the job's session target and delivery configuration.

## Proof Sketch

1. The heartbeat runs periodically at intervals defined by `heartbeat.intervalMs` (default 10000ms).
2. At each heartbeat, the gateway scans all loaded cron jobs.
3. For each job, it evaluates the schedule:
   - For `at` schedules: compares the ISO timestamp to `t_H`
   - For `every` schedules: checks if `t_H - anchorMs` is a multiple of `everyMs`
   - For `cron` schedules: evaluates the cron expression in the specified timezone (or gateway local timezone if none) at `t_H`
4. If the schedule evaluates to `true`, the gateway proceeds to execute the payload:
   - Constructs the appropriate session context based on `sessionTarget`
   - For `systemEvent` payloads: injects the text as a system event into the target session
   - For `agentTurn` payloads: spawns an isolated agent turn with the given message and configuration
   - Applies delivery mode (announce, webhook, none) as configured
5. The execution is logged and failure alerting is applied if configured.

Thus, whenever a cron job's schedule is due at the time of a heartbeat, the job is triggered.

## Dependencies

- Relies on accurate system clock in the gateway process
- Assumes the job is enabled (`enabled: true`)
- Assumes the schedule syntax is valid
- For `agentTurn` payloads, requires that the session target is compatible (not `main`)

## Notes

- The heartbeat does not guarantee real-time execution; there is a latency of up to the heartbeat interval.
- If multiple heartbeats occur while a schedule is due, the job will be triggered on the first heartbeat after the schedule becomes due (unless `deleteAfterRun` is true, in which case it runs at most once).
- The theorem holds regardless of the payload type or session target, as long as the job is enabled and the schedule is valid.
