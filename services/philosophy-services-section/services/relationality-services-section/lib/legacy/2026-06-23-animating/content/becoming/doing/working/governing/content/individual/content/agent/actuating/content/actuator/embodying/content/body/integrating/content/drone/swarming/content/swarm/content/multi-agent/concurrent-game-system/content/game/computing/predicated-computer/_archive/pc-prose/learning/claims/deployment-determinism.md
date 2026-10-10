---
type: theorem
class: engineering-claim
status: proved
depends-on: [deploy-to-target, container-image, deployment-target, settlement-determinism, hash-discipline, settlement-determinism, snapshot-replay-fidelity]
see-also: [backup-restore-fidelity, doctrine-fidelity-compositionality]
---

# Two deployments of the same image on compatible targets produce equivalent substrate behavior

**Claim.** Let $I$ be a [container image](teaching/explanations/container-image.md) with canonical-form hash $h$. Let $T_1$ and $T_2$ be two [deployment targets](teaching/explanations/deployment-target.md) compatible with $I$'s format. Let $D_1$ and $D_2$ be deployments of $I$ on $T_1$ and $T_2$ respectively, both initialized with the same persistence-binding state. Then for any sequence of substrate operations applied identically to $D_1$ and $D_2$ via their respective hosts, the resulting substrate states at every ordinal are byte-identical (cellwise-equal predication valuations, equal canonical-form hashes).

The substrate's behavior is target-agnostic: where the substrate runs does not affect what it computes, given the image and the persistence-binding-initial-state are the same.

## Why this holds

The argument combines the deterministic content of [container-image](teaching/explanations/container-image.md), the target-agnostic nature of substrate operations, and [settlement-determinism](settlement-determinism.md).

**Part 1: Container-image determines the runtime's behavior on substrate content.** Per [container-image](teaching/explanations/container-image.md), the image's canonical-form hash determines its bundled runtime executables, configuration, and bootstrap content. Two deployments instantiating images with the same hash run byte-identical runtime code on byte-identical bootstrap. The runtime's reading of the closure-rule system is the same; the runtime's interpretation of admit, settle, project, etc. is the same.

**Part 2: Persistence-binding initial state determines starting substrate state.** Two deployments with the same persistence-binding initial state begin with byte-identical substrate state. Per [snapshot-replay-fidelity](snapshot-replay-fidelity.md) when the persistence-binding holds a backup snapshot, or per the bootstrap discipline when starting fresh, the initial state is byte-identical.

**Part 3: Substrate operations are deterministic.** Per [settlement-determinism](settlement-determinism.md), substrate operations are deterministic functions of `(event log, closure-rule system)`. Two deployments receiving the same event-log entries under the same rule-system version produce byte-identical substrate states throughout their settling. The substrate's behavior is target-agnostic because none of `(event log, closure-rule system)` references the host or the target.

**Part 4: Combining the parts.** $D_1$ and $D_2$ run byte-identical runtime code (Part 1) on byte-identical initial state (Part 2). They receive the same event-log entries (by hypothesis). Per Part 3, their substrate states evolve identically.

## Where target-specific behavior shows up

The theorem's claim is about *substrate behavior*. Some target-specific behavior is admissible without violating the claim:

- **Wall-clock time.** Different targets stamp events with different wall-clock times. Per [settlement-determinism](settlement-determinism.md), wall-clock time is informational, not consulted for correctness. Substrate state is unaffected.
- **Resource consumption.** Different targets allocate different amounts of CPU, memory, disk per the same operation. Per [wavefront-termination](wavefront-termination.md), the substrate's behavior is bounded by content (affected predications), not by host resources; the *time* an operation takes differs, but the *result* doesn't.
- **Network latency.** Federation operations may complete at different ordinals on different deployments depending on network conditions. Per [federation-convergence](federation-convergence.md), the eventual converged state is the same regardless of arrival order.
- **Logging / observability.** Different targets emit different operational logs. Per [cost-discipline-reads-free](cost-discipline-reads-free.md), observability is reads, free; the substrate's settling is unaffected.

What is *not* admissible:

- A deployment whose runtime branches on host-runtime conditions (host time, host environment variables, host file system outside the substrate's persistence binding). Per [settlement-determinism](settlement-determinism.md), this violates the host-independence requirement; the substrate's behavior is no longer target-agnostic.
- A deployment using a runtime that silently invokes target-specific operators (a closure rule that calls out to AWS Secrets Manager on AWS but to GCP Secret Manager on GCP, with different effective behavior). Per [doctrine-fidelity-compositionality](doctrine-fidelity-compositionality.md), the cross-target translation must be doctrine-fidel and explicit.

## Engineering consequence

Deployment-determinism is what makes the substrate *portable* and *testable*. Several engineering uses follow:

- **Cross-cloud federation.** Substrates deployed on different cloud providers (AWS, GCP, Azure, Replit) federate with full convergence per [federation-convergence](federation-convergence.md). The cross-cloud federation works because deployment-determinism guarantees the substrate's behavior is the same on each cloud.
- **Local development = production behavior.** A developer running the substrate on a laptop produces the same substrate behavior as the production deployment, given the same image and starting state. Local development reproduces production bugs deterministically.
- **Conformance testing.** Per the conformance-test discipline, a substrate deployment can be tested by exercising operators against expected canonical-form-hashed outputs. Deployment-determinism guarantees that conformance results on one target predict conformance on another.
- **Disaster-recovery on different targets.** A backup taken from a substrate on AWS can be restored on GCP, on Azure, or on a developer laptop. Per [backup-restore-fidelity](backup-restore-fidelity.md) plus deployment-determinism, the recovered substrate's behavior is byte-identical to the original.

## What the theorem rules out

- A container-image whose canonical-form hash doesn't determine its runtime behavior (e.g., images with non-deterministic build steps producing different bytes from the same source) cannot satisfy Part 1. Reproducible builds (Nix, Guix, OCI with reproducible-builds discipline) are the substrate's response.
- A runtime that consults host-runtime state outside the substrate's persistence binding violates Part 3 — the substrate is no longer deterministic on `(event log, rule-system)`. The substrate's response: lift host state into substrate content via [interfacers](teaching/explanations/interfacer.md).
- A persistence layer whose binding state varies across targets in undocumented ways (e.g., a database whose default sort order differs by collation per host locale) violates Part 2. The substrate's response: pin the binding state precisely (deterministic database init, canonical-form-respecting persistence).

## What the theorem requires

- The container-image is content-addressed and reproducible; same-hash images contain byte-identical runtime.
- The persistence-binding is initializable to byte-identical state across targets.
- The substrate's runtime does not branch on host-runtime conditions outside the substrate's persistence binding (per [settlement-determinism](settlement-determinism.md)).
- The cited targets are compatible with the image's format and the persistence-binding's requirements (per [deployment-target](teaching/explanations/deployment-target.md)).
