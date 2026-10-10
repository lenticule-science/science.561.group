---
type: concept
class: host-integration-discipline
depends-on: [process-boundary, witness, settlement-determinism, capability]
see-also: [interfacer]
---

# Syscall discipline

The *substrate's discipline for invoking host-OS system calls*. Syscalls are the [process boundary](process-boundary.md)'s crossing point — substrate operations that need host services (read a file, write to network, allocate memory, fork a sub-process) issue syscalls to the host.

The substrate's syscall discipline:

- **Substrate-recorded.** Per [self-representation](self-representation.md), every syscall the substrate makes is declared in substrate content (typically via the [interfacer](interfacer.md) handling it). An auditor can enumerate "what syscalls does this substrate make."
- **Capability-gated.** Per [capability](theories/functional-runtime-platform/concepts/capability.md), syscalls require capabilities. A substrate operation that wants to write to a file must hold the file-write capability.
- **Witnessed at the boundary.** Per [witness](../objects/witness.md), syscall invocations produce witnesses — at minimum the syscall name, the arguments (where not security-sensitive), the return value. Auditors can review syscall patterns.
- **Deterministic-where-possible.** Per [settlement-determinism](../theorems/settlement-determinism.md), reads-from-host should produce the same data on replay (if the host hasn't changed). Writes-to-host are non-replayable in general (the host state moves forward), but the substrate's witness records what was attempted.

Common syscall categories:

- **Filesystem.** open/read/write/close/stat/unlink. Per [fsync-discipline](fsync-discipline.md), writes have explicit fsync semantics.
- **Network.** socket/bind/listen/accept/connect/send/recv. Per [transport](transport.md), network syscalls are the substrate's transport-implementation layer.
- **Memory.** mmap/munmap/brk. The substrate's [working-set](working-set.md) management uses these.
- **Process.** fork/exec/wait/kill. For sub-process delegation (e.g., running an external tool as a [skill](theories/agential-orchestration-platform/concepts/skill.md)).
- **Signal.** signal/kill/sigaction. For the substrate's response to OS-delivered signals (SIGTERM for graceful shutdown, SIGUSR1 for runtime introspection).

Syscalls that *introduce non-determinism* (reading wall-clock time, reading random bytes, reading host environment variables) require the substrate's discipline to make the non-determinism explicit:

- **Wall-clock reads** — per [clock](clock.md), wall-clock is informational; reducers don't branch on it.
- **Random reads** — the entropy source's hash is recorded in the witness so an auditor can reproduce.
- **Environment reads** — the env-var values are declared as substrate content (per [bootstrap](bootstrap.md)) so they're queryable rather than ambient.

Per [deployment-determinism](../theorems/deployment-determinism.md), substrate behavior is host-agnostic when its syscall discipline is properly substrate-recorded — different hosts that grant the same syscalls produce the same substrate behavior.
