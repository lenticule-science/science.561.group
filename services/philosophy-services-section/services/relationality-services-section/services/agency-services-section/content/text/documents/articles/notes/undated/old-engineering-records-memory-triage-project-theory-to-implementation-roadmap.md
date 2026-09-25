---
name: project_theory-to-implementation-roadmap
description: How the theoretical breakthrough (MASH as persistent dynamics) and cellular system specs guide concrete implementation priorities. Maps from mathematics to code to user features.
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: project_theory-to-implementation-roadmap
---

## From Theory to Practice

The theoretical understanding is solid:
- GFRTU (mathematics) → Cellular machine (specification) → FARS + MASH (implementation)
- MASH = FARS's logical structure + persistent dynamics through history machinery
- The daemon's world_tick IS the composite nucleus operating

Now: **how does this guide what we build next?**

## Implementation Phases (Ordered by Leverage)

### Phase 1: Explicit nucleus (Current → Next)

**Theory:** CCE apply/merge operations with repair logs; nucleus rules (σ_t, Δ_t) deterministic.

**Current state:** Daemon world_tick detects anomalies but doesn't record why they happened or what rule applies.

**Next:** Codify the rules.
- What conditions trigger each anomaly detection?
- What is the repair procedure for each?
- Record before/after hashes for evidence
- Create repair log entries (like CCE does)

**Deliverable:** `explicit-nucleus-rules.json` — a queryable ruleset specifying:
```json
{
  "rule": "stale-task-detection",
  "condition": "task.status == open AND file_mtime < now - 7 days",
  "repair": "emit stale-task event to bridge channel",
  "evidence": "{code, before_hash, after_hash, fuel_used}"
}
```

**Why this first:** Without explicit rules, we can't make the closure deterministic or auditable. Can't verify correctness. Can't enable independent implementations.

**Effort:** Medium (system already detects; we just formalize the specs)

---

### Phase 2: File watcher + rule engine (local-svc-file-watcher task)

**Theory:** Engine applies rules continuously; FARS changes trigger automatic closure (σ_t).

**Current state:** Daemon ticks every 5 minutes; rules are checked occasionally, not continuously.

**Next:** File watcher detects file changes; rule engine applies relevant rules immediately.

**Deliverable:** mash-engine file-watcher subcommand
```bash
mash-engine watch --rules explicit-nucleus-rules.json
# Watches operations/command, operations/engineering, library
# On file change: load file → parse YAML frontmatter → extract entity
# Check relevant rules → apply σ_t (saturation) → update operations graph
# Emit event if rule triggered
```

**Why this second:** The file watcher is the bridge between FARS (files) and MASH (engine). Without it, changes are asynchronous and delayed.

**Effort:** Low-medium (watch pattern with chokidar or similar; straightforward Rust)

**Unblocks:** Continuous constraint enforcement, real-time graph updates

---

### Phase 3: Evidence preservation (repair logs)

**Theory:** CCE produces evidence vectors; every settlement produces CEcR (Closure Event Record).

**Current state:** Sessions produce metrics; world_tick produces events. No repair log entries.

**Next:** Every operation that changes state records evidence.

**Deliverable:** Repair log format and collection
```json
{
  "timestamp": "2026-04-04T12:34:56Z",
  "history_point": "t_42",
  "operation": "apply nucleus rule 'stale-task-detection'",
  "rule": "stale-task-detection",
  "subject": "task-id-xyz",
  "before_state": {sha256_hash},
  "after_state": {sha256_hash},
  "witness": "daemon.world_tick"
}
```

**Why this third:** Without evidence, we can't audit or verify closure. We can't enable independent auditors. We can't compose multiple settlements.

**Effort:** Medium (requires hash canonicalization; need to use SHA-256 not FNV-1a for verification)

---

### Phase 4: Multi-level closure

**Theory:** Closure applies at every level — FARS files, MASH graph, operations loop.

**Current state:** world_tick runs once every 5 minutes; settles one time.

**Next:** Composable rule stacks. Can define σ/Δ for FARS, for MASH, for ops loop independently, then run them in sequence.

**Deliverable:** Rule composition system
```yaml
sigma_rules:  # saturation: what history forces
  - detect-missing-dependency
  - validate-frontmatter
  - compute-plan-status

delta_rules:  # transfer: what all forward extensions share
  - propagate-task-completion
  - update-project-status
  - emit-plan-review-needed
```

Run: `sigma_rules` first (materialize what must be true), then `delta_rules` (propagate to dependents).

**Why this fourth:** Multi-level closure is the key to the system "noticing things automatically." Each domain (FARS, MASH, operations) has its own consistency model.

**Effort:** Medium-high (requires rule engine abstraction; orchestration logic)

---

### Phase 5: Constraint enforcement (not detection)

**Theory:** Engine prevents violations before they occur, not just after.

**Current state:** World tick detects stale tasks, failures, etc. — after the fact.

**Next:** Before allowing state change, check constraints. Block if violation would occur.

**Deliverable:** Constraint checking on graph mutations
```
Before: graph.insert_entity(task_entity)
Check: is this task creation consistent with open plan/project?
       Do we have capacity to work on it?
       Does it violate any authority bounds?
If valid: allow mutation, record evidence
If invalid: reject with reason, emit constraint-violation event
```

**Why this fifth:** Enforcement requires the apparatus from phases 1-4 to be solid. Need explicit rules, evidence collection, multi-level closure working first.

**Effort:** High (requires constraint solver or deep integration with graph operations)

---

### Phase 6: Physical equipment interface

**Theory:** The system is a processual database that controls resources.

**Current state:** Accounting (double-entry) implemented; equipment integration: zero.

**Next:** Equipment controllers register as external agents. State changes in the system trigger equipment actions.

**Deliverable:** Equipment protocol adapter
```
event: 3d-printer.print-job-assigned → equipment-controller
equipment-controller: fetch job details via MCP → send to printer → poll status
status-update: 3d-printer.printing → update graph
completion: 3d-printer.job-done → emit event → mark resource as available
```

**Why this sixth:** Physical interface requires everything else working first. Need rule engine, event system, evidence collection all solid. Otherwise we're driving real hardware with uncertain state.

**Effort:** Very high (requires hardware research, protocol design, safety considerations)

---

## Implementation Priorities

**By user goal (controlling 3D printers):**
1. ✓ Phases 1-2: explicit rules + file watcher (enables real-time system)
2. ✓ Phase 3: evidence (enables auditability)
3. ✓ Phase 4: multi-level closure (enables composable control logic)
4. Phase 5: constraint enforcement (ensures safety before equipment action)
5. Phase 6: physical interface (actual hardware control)

**By system health:**
1. Phase 1: explicit rules (makes system verifiable)
2. Phase 2: file watcher (makes system responsive)
3. Phase 3: evidence (makes system auditable)
4. Phase 4: multi-level closure (makes system composable)
5. Phase 5: constraint enforcement (makes system safe)
6. Phase 6: physical interface (makes system useful at scale)

## Next Immediate Step

**Local-svc-file-watcher task** combines phases 1 and 2:
- Codify the rules the daemon already runs
- Implement file watching in mash-engine
- Emit events on file changes
- Test with a small rule set first (e.g., just frontmatter validation)

This is achievable in one session and unblocks everything downstream.

## References

- Theory: `project_theory-session-2026-04-04.md`
- Cellular specs: `operations/command/.../semiotic-cell-machine/cce.md`
- Current daemon: `operations/engineering/fars/mash-engine/src/session/daemon.rs`
- Task: `operations/command/records/tasks/local-svc-file-watcher.md`
