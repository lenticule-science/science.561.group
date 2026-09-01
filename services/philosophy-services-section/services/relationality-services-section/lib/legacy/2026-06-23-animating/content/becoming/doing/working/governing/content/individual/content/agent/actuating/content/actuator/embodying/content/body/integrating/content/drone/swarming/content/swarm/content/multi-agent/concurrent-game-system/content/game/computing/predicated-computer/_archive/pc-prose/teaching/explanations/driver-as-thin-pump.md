---
type: narrative
status: current
recaps: [driver-substrate-split, substrate-universality, self-representation]
introduces: []
---

# The driver is a thin pump; the program is the substrate

Every substrate runtime has a driver — a process that reads bytes from external sources, hands them to the substrate's algebra, and routes the substrate's outputs back to external destinations. The structural question is how much *program logic* the driver carries. Two answers are possible. The driver carries program logic: it knows about specific predicates, branches on specific values, encodes specific decisions, hard-codes the substrate's behavior in runtime code. Or the driver carries no program logic: it pumps bytes between external boundaries and the substrate's admission and read primitives, and lets the substrate's content carry the program.

The dominant pathology of the first answer is opacity. Reasoning about the substrate's behavior requires reading the runtime's code — which is opaque (compiled binaries, language-specific idioms), version-tied (behavior depends on which runtime version is loaded), and platform-specific (different runtimes have different bugs). Two substrates with identical content can behave differently because their runtimes have drifted. The substrate's audit trail covers content but not the runtime decisions that gated the content's effect; the audit is incomplete in a way the substrate cannot detect.

The substrate's response is the [driver/substrate split](../teaching/explanations/driver-substrate-split.md): a structural commitment that the runtime is a thin pump and the program lives in the substrate's content, not in the runtime code. The runtime's job is reduced to four narrow responsibilities:

- Reading its own configuration (which sources, which scope, which host identity).
- Translating external bytes into reified messages and admitting them through the substrate's admission primitive.
- Routing the substrate's outputs back to external destinations.
- Exposing the substrate's I/O surface as transport-level adapters (network protocols, file system mounts, REPLs, MCP servers).

Anything outside these is substrate territory. Function dispatch, query handling, witnessing, inference, modal reasoning, type hierarchies, language semantics, organizational behavior, decision-making — all happen *inside the substrate* via closure rules established by admitted messages.

Several engineering consequences follow:

- **Runtime upgrades preserve behavior.** Replacing the runtime with a different implementation that respects the substrate's algebra produces the same substrate behavior, because the program is in the substrate, not in the runtime. Two implementations of the substrate's algebra (in different host languages, on different operating systems, with different transport surfaces) are interchangeable as long as both honor the algebra and the [canonical-form](../teaching/explanations/canonical-form.md) discipline.
- **Testing is substrate-content-driven.** A test for substrate behavior is a sequence of input messages and an expected output configuration. The runtime is not under test; the substrate's content is. Per [source-of-truth](../teaching/explanations/source-of-truth.md), the test is a deterministic function of the input messages, and the test's outcome is reproducible across any conforming runtime.
- **Debugging is substrate inspection.** When the substrate behaves unexpectedly, the substrate's content is what the engineer reads. Runtime debugging is rarely necessary because the runtime carries no decision logic. The substrate's audit trail (witnesses, event log, predication content) is the authoritative record of what happened.
- **Editing program behavior is editing predications.** Adding a closure rule, retiring an operator specification, revising a shape — these are substrate edits per [self-representation](../teaching/explanations/self-representation.md). The runtime does not need to be changed; the substrate reads its updated content and operates accordingly.
- **The substrate is implementation-portable.** A substrate's content (its event log, its predication-graph, its canonical-form serialization) can be exported from one runtime and imported into another. Per [hash-discipline](../teaching/explanations/hash-discipline.md), the imported substrate is byte-identical to the exported one, and both runtimes produce matching working models.

The discipline's hard edge is the refusal to put program logic in runtime code. Three frequent temptations have to be refused:

The first is *runtime feature flags*. A runtime configuration that says "if FEATURE_X is true, evaluate predicate Y differently" has encoded program logic in the runtime. The right structure is a substrate predication declaring whether feature X is active, with closure rules that consume that predication. The closure rule's effect is then auditable, replicable, and editable through the substrate's normal disciplines.

The second is *hardcoded predicate semantics*. Runtime code that special-cases the predicate `type` or the predicate `depends-on` has hardcoded program logic. The right structure is closure rules that operate on those predicates as ordinary substrate content. The closure rule's behavior changes if the predicate's specification changes; the runtime's behavior does not depend on the predicate's identity.

The third is *runtime-resident workflows*. A workflow whose steps and ordering live in runtime code is not substrate content. The right structure is a [runbook](../theories/agential-orchestration-platform/concepts/runbook.md) entity whose steps are predications. The substrate's [runbook-execution](../theories/agential-orchestration-platform/morphisms/runbook-execution.md) operator reads the runbook's predications and dispatches the steps; if the workflow changes, editing the runbook entity changes the workflow's behavior on the next execution.

The structural analog is operating-system-shaped. A kernel provides primitives; userspace contains the program. The predication substrate is the kernel-and-program-in-one — the substrate's algebra is fixed (the kernel role), but the substrate's content (the program role) is mutable through ordinary messages. Pointing the runtime at a different substrate gives a different program; pointing it at the same substrate again gives the same behavior. The runtime is interchangeable; the substrate is the program.

The pattern's coupling with [substrate-universality](../teaching/explanations/substrate-universality.md) is what makes it operative. Because the runtime carries no program logic, the same runtime can be pointed at any substrate. A user pointing the substrate at their own data — a personal corpus, a hobby project, a sensor in their home — gets a predicated computer over that data, with the same machinery the substrate's developers use for their own substrates. The runtime did not need to anticipate the user's data source; the substrate's content carries everything that needs to be specific.

The pattern composes with [bootstrap](../teaching/explanations/bootstrap.md) (the substrate's program is established at bootstrap by admitting closure-rule and operator-specification messages; the runtime's behavior changes immediately on the next admission cycle), with [interfacer](../teaching/explanations/interfacer.md) (the runtime's transport adapters are interfacer-mediated boundaries, with the interfacer specifications themselves living in substrate content), and with [federation-as-substrate-join](federation-as-substrate-join.md) (federation between substrates is byte exchange between drivers, with the substrate's algebra producing convergence at each receiver — no protocol logic in the drivers).

A substrate that has fully internalized this discipline has a single-source contract for behavior: *what is in the substrate?* The runtime's code is reduced to plumbing. The substrate's content is the program. Reasoning about the program is reading the substrate.
