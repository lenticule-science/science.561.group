---
type: definition
class: substrate-entity
realizes: [process-boundary, syscall-discipline]
depends-on: [process-boundary, syscall-discipline, deployment-record, identity-record]
see-also: [storage-backend-record]
---

# Process record

A **process record** is the substrate-entity formal definition of *one OS process running the substrate*: the predication-graph entity declaring which host process belongs to which deployment-record, what OS-level capabilities it has, what syscalls it's permitted to make.

## Structural fields

- **`id`** — kebab-case identifier (typically `${deployment-id}-process-${index}`).
- **`description`** — one-line summary.
- **`bound-deployment`** — reference to the [deployment-record](deployment-record.md) this process belongs to.
- **`process-kind`** — `primary` (the substrate's main process), `worker` (sub-process for parallelism), `interfacer` (a sub-process for an external interfacer), `device-driver` (a sub-process for hardware device access).
- **`os-pid`** — the OS-level process ID (informational; not consulted for correctness).
- **`os-user`** — the OS user the process runs as.
- **`os-capabilities`** — declared OS capabilities the process has (which files it can read/write, which network bind addresses, etc.).
- **`syscall-policy`** — references to declared syscalls the process is permitted to make. Per [syscall-discipline](teaching/explanations/syscall-discipline.md).
- **`spawn-witness`** — reference to the witness that recorded the process's spawn.
- **`exit-witness`** — for terminated processes, reference to the exit witness.
- **`closure-kind`** — `process`.

## Invariants

- **Substrate-recorded.** Per [self-representation](teaching/explanations/self-representation.md), each substrate process has a process-record.
- **Capability-coherent.** The declared os-capabilities match what the host actually grants; mismatches indicate misconfiguration.
- **Deployment-bound.** Every process belongs to one deployment-record; orphan processes are inadmissible.

## Position in the substrate

Process records are the substrate's *OS-process registry*. Per [process-boundary](teaching/explanations/process-boundary.md), the boundary between substrate-internal operations and host-OS operations is at the process level; per [witness](../objects/witness.md), an auditor can review which processes the substrate is running and what they're permitted to do.
