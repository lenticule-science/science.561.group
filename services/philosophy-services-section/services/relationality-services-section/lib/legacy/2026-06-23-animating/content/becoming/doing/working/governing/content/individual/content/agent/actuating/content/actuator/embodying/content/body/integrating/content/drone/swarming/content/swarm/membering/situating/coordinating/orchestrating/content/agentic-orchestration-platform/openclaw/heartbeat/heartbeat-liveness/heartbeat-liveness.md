---
type: theorem
class: invariant
description: The хуbheartbeat mechanism ensures that no scheduled cron job remains indefinitely past-due.
status: draft
depends-on: [heartbeat, cron-job, orchestration-invariant]
---

# Heartbeat Liveness Theorem

In OpenClaw 2026.05.07, the **heartbeat** mechanism satisfies the orchestration invariant of **heartbeat liveness**: if a cron job's schedule becomes due at time `t`, then there exists a heartbeat at time `t' ≥ t` such that the job is triggered at `t'`.

## Statement

Let `J` be a cron job with schedule `S_J` and payload `P_J`.
Let `t` be a time such that `S_J` evaluates to `true` at `t` (i.e., the schedule is due).
Then, under the OpenClaw gateway's heartbeat mechanism, there exists a time `t' ≥ t` at which a heartbeat occurs and the gateway executes payload `P_J` according to `J`'s session target and delivery configuration.

## Proof Sketch

1. The heartbeat runs periodically at intervals defined by `heartbeat.intervalMs` (default 10000ms).
  Let the heartbeat times be `..., t_{-2}, t_{-1}, t_0, t_1, t_2, ...
  ` where `t_{i+1} - t_i = heartbeat.intervalMs`.

2. Since the heartbeat interval is finite and positive, the sequence of heartbeat times is unbounded above and has gaps of at most `heartbeat.intervalMs`.

3. Let `t` be the first time at or after which the schedule `S_J` is due (i.e., `S_J` is false for all times `< t` and true at `t`).
  Such a `t` exists because cron schedules are evaluated in wall-clock time and time progresses monotonically.

4. Consider the heartbeat time `t'` that is the smallest heartbeat time greater than or equal to `t`.
  Such a `t'` exists because the heartbeat times are unbounded above.

5. At time `t'`, the gateway evaluates all cron jobs.
  Since `t' ≥ t` and `S_J` is true at `t`, and cron schedules are evaluated based on wall-clock time (without conversion to UTC first), `S_J` evaluates to `true` at `t'` as well (because if a schedule is due at `t`, it remains due for all times until the next schedule change, which for standard cron expressions does not happen within a single interval unless the expression is irregular—but even then, the evaluation at `t'` will reflect the schedule's state at that time).

6. Therefore, the gateway recognizes that job `J` is due and proceeds to execute its payload `P_J` according to the job's configuration.

## Dependencies

- Relies on the system clock being monotonic and approximately correct.
- Assumes the job is enabled (`enabled: true`).
- Assumes the schedule syntax is valid and evaluates correctly at the given time.
- For `agentTurn` payloads, requires that the session target is compatible (not `main` unless the payload is `systemEvent`).

## Notes

- The delay between the schedule becoming due (`t`) and the actual execution (`t'`) is at most `heartbeat.intervalMs`.
- If `deleteAfterRun` is true, the job is removed after execution and will not trigger again.
- The theorem holds regardless of the payload type or session target, as long as the job is enabled and the schedule is valid.

This theorem formally guarantees that the heartbeat mechanism prevents indefinite postponement of scheduled work, satisfying the heartbeat liveness invariant of the orchestration platform.
