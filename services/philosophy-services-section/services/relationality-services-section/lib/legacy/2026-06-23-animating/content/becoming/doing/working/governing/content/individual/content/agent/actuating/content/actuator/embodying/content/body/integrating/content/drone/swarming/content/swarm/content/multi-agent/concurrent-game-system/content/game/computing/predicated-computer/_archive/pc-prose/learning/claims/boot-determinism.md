---
type: theorem
class: engineering-claim
status: proved
depends-on: [boot-sequence, boot-substrate, deployment-determinism, settlement-determinism, snapshot-replay-fidelity, closure-monad-no-non-trivial-periodic-orbits, settling-quiescence]
see-also: [restore-from-backup]
---

# Boot is deterministic given deployment and persistent-set state

**Claim.** For a [deployment-record](../objects/deployment-record.md) $D$ and a [persistent-set](teaching/explanations/persistent-set.md) state $P$ at boot time, [boot-substrate](../morphisms/boot-substrate.md) produces a byte-identical post-boot substrate state across replays. Per [deployment-determinism](deployment-determinism.md), this is host-agnostic: boots of the same $(D, P)$ on different compatible hosts produce the same post-boot state.

## Why this holds

The argument follows from substrate-determinism applied to each boot phase.

**Phase 1 (Container start) is deterministic.** Per [container-image](teaching/explanations/container-image.md), the image's canonical-form hash determines the runtime executable; same hash, same code.

**Phase 3 (Persistent-set attach) is deterministic.** Per [persistent-set](teaching/explanations/persistent-set.md), the persistent-set's content-addressed entries are byte-identical across hosts that read the same backend.

**Phase 5 (Bootstrap content load) is deterministic.** Per [bootstrap](teaching/explanations/bootstrap.md), bootstrap content is part of the container-image or the persistent-set; both are deterministic per phases 1 and 3.

**Phase 6 (Closure-rule-system activation) is deterministic.** Per [closure-rule-system](../objects/closure-rule-system.md), the cited version's content uniquely determines the closure operator.

**Phases 7-9** are deterministic given prior phases.

**Each phase's witness is deterministic.** Per [witness](../objects/witness.md), the witness's content is determined by the phase's inputs and outputs.

**Boot reaches a quiescent post-boot state.** The closure-rule system fires on the bootstrap content during phase 6 and reaches [settling quiescence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-quiescence.md) before later phases proceed. That the iteration does not oscillate — that there is no non-trivial periodic orbit the closure could land in instead of a fixed point — is the [closure-monad-no-non-trivial-periodic-orbits theorem](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-monad-no-non-trivial-periodic-orbits.md): an inflationary, monotone, idempotent closure operator (which the substrate's closure rule system is, by the [closure-2-monad lax-idempotence theorem](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md)) has no orbits of period $\geq 2$; the iteration is a $\leq_k$-monotone chain $\eta(P) \subseteq \mathrm{cl}(\eta(P)) \subseteq \cdots$ that stabilizes at the closure ordinal. For finite bootstrap content the closure ordinal is finite; the quiescence point is reached in a bounded number of firings and the post-boot state is that fixed point. (Transfinite closure ordinals are admissible by the math but a substrate whose bootstrap content drives the closure to a transfinite ordinal is non-conformant for boot purposes — the boot phase has a finite-step budget.)

Combining: every phase is deterministic on inputs from prior phases; the closure-driven phase reaches a determinate quiescence; therefore the boot-witness chain and the post-boot state are deterministic on $(D, P)$.

## Engineering consequence

- **Cross-host boot reproducibility.** A substrate booted on host A vs host B with the same $(D, P)$ produces the same state. Useful for cloud migration, disaster recovery, audit verification.
- **Pre-flight boot verification.** Before deploying to production, the same $(D, P)$ can be booted on a staging host; if staging-boot succeeds, production-boot will succeed.
- **Audit-replayable boot.** Per [snapshot-replay-fidelity](snapshot-replay-fidelity.md), the boot-witness chain can be replayed to verify boot history.

## What the theorem rules out

- A boot whose runtime branches on host-runtime conditions outside $(D, P)$ — host time, host environment variables not declared in deployment — is non-deterministic. Per [settlement-determinism](settlement-determinism.md), the substrate must avoid such branching.
- A boot that depends on race conditions between phases (e.g., federation-handshake completing before persistent-set attach) is non-deterministic. The boot sequence must serialize phases per [boot-sequence](teaching/explanations/boot-sequence.md).

## What the theorem requires

- Per [deployment-determinism](deployment-determinism.md), the deployment is reproducible.
- Per [persistent-set](teaching/explanations/persistent-set.md), the persistent-set state is content-addressed.
- Per [boot-sequence](teaching/explanations/boot-sequence.md), the boot phases are deterministic individually.
- Per [witness](../objects/witness.md), boot witnesses are emitted at each phase.
