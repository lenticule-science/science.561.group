---
type: concept
class: host-integration-discipline
depends-on: [trust-boundary, identity-key, capability]
see-also: [syscall-discipline]
---

# Process boundary

The *substrate-vs-host trust boundary at the OS process level*. The substrate runs as one or more processes on a host operating system; the boundary between substrate-internal operations and host-OS operations is where substrate-discipline meets OS-discipline.

The substrate's process boundary is structurally a [trust-boundary](trust-boundary.md):

- **Inside** — the substrate's process(es): closure-rule applications, settlements, witnesses, predication-graph reads/writes. All under the substrate's discipline.
- **Outside** — host OS operations: filesystem syscalls, network syscalls, signal handling, process lifecycle, memory mapping. Under the host's discipline.
- **Crossing** — syscalls (per [syscall-discipline](syscall-discipline.md)). Each syscall is the substrate asking the host to do something on its behalf; the host either grants or denies based on OS-level capabilities.

The substrate must respect OS-level capabilities (per the deployment-target's identity-key custody mechanism — see [deployment-target](deployment-target.md)):

- **File-system permissions.** The substrate process may only read / write files its OS user has access to.
- **Network capabilities.** The substrate may only bind to ports / connect to addresses its OS configuration permits.
- **Privilege boundaries.** The substrate process is typically *not* root; OS-privileged operations (raw socket binding, sub-1024-port listen, kernel module loading) require explicit host-level capability grants or sub-process delegation.

Per [self-representation](self-representation.md), the substrate's *requested* OS capabilities are declared as substrate content. Auditors can ask "what OS capabilities does this substrate require?" and verify against what the deployment-target grants.

Per [settlement-determinism](../theorems/settlement-determinism.md), the substrate's process boundary is *deterministic*: the same substrate operation makes the same syscalls. Host-OS variation (different kernel versions, different filesystem types) is admissible as long as the substrate's syscall-discipline is satisfied.

The process boundary also defines crash recovery: a host crash that kills the substrate process loses any work past the most recent fsync (per [fsync-discipline](fsync-discipline.md)). Per [restore-from-backup](../morphisms/restore-from-backup.md), the substrate can be restarted on the same or different host.
