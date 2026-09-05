---
type: concept
class: discipline
depends-on: [self-representation, source-of-truth]
see-also: [substrate-universality, interfacer]
---

# Driver/substrate split

The substrate's commitment that *the runtime is a thin pump* — its job is to move bytes between external systems and the substrate's algebra, nothing more — and that *the program lives in the substrate's content, not in the runtime code*. Function dispatch, query handling, witnessing, inference, modal reasoning, type hierarchies, language semantics, organizational behavior, decision-making — all happen *inside the substrate* via closure rules established by admitted messages. The runtime executes the substrate's algebra; it does not encode the program's behavior.

The discipline is the substrate's answer to the question "where does program logic live?" A substrate without driver/substrate split has runtime code that knows about specific predicates, branches on specific values, encodes specific decisions. The runtime's behavior depends on the substrate's content *and* on the runtime's own logic; reasoning about the substrate requires reading the runtime code, which is opaque, version-tied, and platform-specific.

## What the runtime does

A driver in the substrate's sense does four things, and only four:

- **Reads its runtime configuration.** Which substrate sources to load, in what order, what host-level identity to use, what scope policies to apply at the boundary.
- **Translates external sources into reified messages.** For each source — a filesystem walk, an inbound network request, a sensor stream, a configuration file — the driver constructs reified messages per [reification](reification.md) and admits them to the substrate's algebra through the substrate's admission primitive.
- **Routes the substrate's responses back to whoever needs them.** When the substrate produces an output (a JSON-RPC reply, a file written to disk, a CLI rendering), the driver routes the bytes to the appropriate external endpoint.
- **Exposes the substrate's I/O surface to external clients.** Network protocols, file system mounts, REPLs, model context protocol servers — these are all transport adapters at the substrate's outer boundary. They translate between the substrate's reified-message vocabulary and whatever vocabulary the external world speaks.

Anything outside these four is substrate territory. A driver that decides "if the config says X, behave like Y" has encoded program logic in the runtime; the right structure is a substrate closure rule whose premises match X and whose conclusion produces Y.

## What the substrate does

The substrate carries the program. Specifically:

- **All decisions.** Every conditional that affects substrate behavior is a closure rule, not a runtime branch.
- **All vocabulary.** The predicates the substrate admits, the shapes those predicates fit, the closure rules that compose them — all are substrate entities, not runtime constants.
- **All operators.** [Insertion](../morphisms/insertion.md), [retraction](../morphisms/retraction.md), [traversal](../morphisms/traversal.md), [merge](../morphisms/merge.md), [settle](../morphisms/settle.md) — these are substrate primitives whose specifications live in substrate content. The runtime's job is to execute those specifications, not to encode their behavior.
- **All policies.** Authorization, scoping, federation, replication policies are substrate predications; the runtime reads them at admission time and applies them through the same algebra that processes ordinary content.

The pattern is structurally similar to the operating-system architectures in which the kernel provides primitives and the userspace contains the program. Here the substrate is the kernel-and-program-in-one — the substrate's algebra is fixed (the kernel role), but the substrate's content (the program role) is mutable through ordinary messages.

## Engineering consequences

- **Runtime upgrades preserve behavior.** Replacing the runtime with a different implementation that respects the substrate's algebra produces the same substrate behavior, because the program is in the substrate, not in the runtime. Two implementations of the substrate's algebra (in different host languages, on different operating systems, with different transport surfaces) are interchangeable as long as both honor the algebra and the canonical-form discipline.
- **Testing is substrate-content-driven.** A test for substrate behavior is a sequence of input messages and an expected output configuration. The runtime is not under test; the substrate's content is. Per [source-of-truth](source-of-truth.md), the test is a deterministic function of the input messages.
- **Debugging is substrate inspection.** When the substrate behaves unexpectedly, the substrate's content is what the engineer reads. Runtime debugging is rarely necessary because the runtime carries no decision logic. The substrate's audit trail (witnesses, event log, predication content) is the authoritative record of what happened.
- **Editing program behavior is editing predications.** Adding a closure rule, retiring an operator specification, revising a shape — these are substrate edits per [self-representation](self-representation.md). The runtime does not need to be changed; the substrate reads its updated content and operates accordingly.
- **The substrate is implementation-portable.** A substrate's content (its event log, its predication-graph, its canonical-form serialization) can be exported from one runtime and imported into another. Per [hash-discipline](hash-discipline.md), the imported substrate is byte-identical to the exported one, and both runtimes produce matching working models.

## What the discipline rules out

Specifically:

- **No runtime feature flags that change substrate behavior.** A runtime configuration that says "if FEATURE_X is true, evaluate predicate Y differently" has encoded program logic in the runtime. The right structure is a substrate predication declaring whether feature X is active, with closure rules that consume that predication.
- **No hardcoded predicate semantics.** Runtime code that special-cases "the predicate `type`" or "the predicate `depends-on`" has hardcoded program logic. The right structure is closure rules that operate on those predicates as ordinary substrate content.
- **No runtime-resident workflows.** A workflow whose steps and ordering live in runtime code is not substrate content. The right structure is a [runbook](theories/agential-orchestration-platform/concepts/runbook.md) entity whose steps are predications.

## Position in the substrate

Driver/substrate split is the substrate's *what-runs-where* commitment. It is what makes the substrate a program-as-content rather than a program-as-runtime. Per [substrate-universality](substrate-universality.md), the same runtime can be pointed at any substrate content; what makes a particular pointing *a particular predicated computer* is the content, not the runtime.

The pattern composes with [self-representation](self-representation.md) (operators are themselves substrate entities, and the runtime executes them through the substrate's algebra), with [interfacer](interfacer.md) (the runtime's transport adapters are interfacer-mediated boundaries, with the interfacer specifications themselves living in substrate content), and with [bootstrap](bootstrap.md) (the substrate's program is established at bootstrap by admitting closure-rule and operator-specification messages; the runtime's behavior changes immediately on the next admission cycle).
