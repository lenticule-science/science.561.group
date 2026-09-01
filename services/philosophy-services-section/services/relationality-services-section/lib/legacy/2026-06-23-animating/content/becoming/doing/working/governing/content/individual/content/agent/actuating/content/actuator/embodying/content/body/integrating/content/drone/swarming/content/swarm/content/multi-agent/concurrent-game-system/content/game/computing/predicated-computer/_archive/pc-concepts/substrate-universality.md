---
type: concept
class: discipline
depends-on: [predication-substrate, driver-substrate-split, bootstrap]
see-also: [scope, interfacer]
---

# Substrate universality

The substrate's commitment that *the same substrate machinery applies to any data source*. Pointing the substrate at a folder of source code, a corpus of email, a server's logs, a sensor stream, a photo collection, an entire drive, or a cluster of drives produces a predicated computer over those bytes — by virtue of what the substrate *is*, not by virtue of features that handle special cases. The substrate has no per-data-source code paths; its universality is structural.

The discipline is the substrate's answer to the question "what can the substrate be a substrate over?" A substrate without universality has different code paths for different data sources — a markdown handler, a JSON handler, a logfile handler, each with its own assumptions about what predicates exist, what shapes apply, what closure rules fire. The codebase grows with the number of supported sources; behavior diverges between sources because each handler has its own quirks; adding a source requires runtime changes.

## What universality means concretely

Three properties realize the discipline:

- **The substrate's primitives are data-source-agnostic.** [Insertion](../morphisms/insertion.md), [retraction](../morphisms/retraction.md), [traversal](../morphisms/traversal.md) operate on substrate content regardless of where the content originated. The fact that a particular claim came from a markdown frontmatter, a JSON field, a database row, or a network message has no effect on how the substrate processes it.
- **Format awareness lives at the boundary.** Per [interfacer](interfacer.md), each external format has an interfacer entity that translates between bytes and substrate predications. The interfacer is itself substrate content; adding a new format is admitting a new interfacer entity, not changing runtime code. The substrate's interior remains data-source-agnostic.
- **Identity and scope are configuration, not architecture.** What makes a particular substrate the substrate-over-this-folder vs. the substrate-over-that-server is the [bootstrap](bootstrap.md) content that established its scope and vocabulary. Two substrates pointed at different sources are structurally identical; their content differs.

## What universality is not

Universality is not "no constraints on what content the substrate accepts." A substrate has a [vocabulary](vocabulary-completeness.md) and an admission discipline; content outside that vocabulary is rejected at the boundary or surfaces as vocabulary debt. What universality says is that the *machinery* — the algebra, the operators, the closure machinery, the witness chain, the event log discipline — is the same regardless of what the substrate is over. The vocabulary varies with the substrate's purpose; the machinery does not vary.

Universality is also not "any tool can be plugged into the substrate." A substrate's I/O is mediated by interfacers and admission discipline. A tool that wants to read or write substrate content does so through the substrate's discipline, not by reaching into the substrate's runtime. The substrate is universal in *what it can be over*; what *operates on* it is governed by its admission and read disciplines.

## Engineering consequences

- **Pointing the substrate at a new source is configuration.** A substrate runtime accepts a configuration that names the source (a path, a URL, a stream identifier) and the bootstrap profile to apply. There is no per-source code path. Adding a source the substrate has never seen is admitting an interfacer entity for that source's format, then pointing the runtime at the source.
- **Cross-source operations are substrate operations.** A substrate over one folder can federate (per [federation-as-substrate-join](teaching/explanations/federation-as-substrate-join.md)) with a substrate over a different folder, a different server, or a different cluster. The federation is the substrate's merge applied across boundaries; the data-source distinction does not surface as a special case.
- **Migration is a substrate operation.** Moving a substrate's content from one host to another is exporting its event log and importing it into another runtime. Per [source-of-truth](source-of-truth.md), the imported substrate is byte-identical to the exported one. The data source has changed; the substrate has not.
- **Package management is composition.** A "package" in the substrate's sense is a directory or event log of substrate content. Installing a package is pointing the runtime at that source; loading the package is the runtime walking the source and admitting its messages. Conflicts between packages surface as aggregate-level contradictions in the substrate's value-domain, not as installation-time errors.
- **The substrate works on data sources its developers never saw.** A user pointing the substrate at their own data — a personal corpus, a hobby project, a sensor in their home — gets a predicated computer over that data, with the same machinery the substrate's developers use for their own substrates. The substrate's value to that user does not depend on the substrate's developers having anticipated their use case.

## What the discipline rules out

- **No data-source-specific runtime code.** A code path whose existence is justified by "we need to handle markdown specially" is a violation. Markdown is handled by an interfacer entity; the interfacer's specification is substrate content; the runtime's code path is the same as for any other format.
- **No hardcoded vocabulary assumptions.** Runtime code that assumes a predicate `type` exists, or that the predicate `depends-on` has a particular shape, is a violation. Vocabulary is substrate content; the runtime processes whatever vocabulary the substrate currently carries.
- **No data-source-specific configuration in runtime code.** A configuration field that is meaningful only for a particular data source has encoded source-awareness in the runtime. The right structure is to encode the configuration as substrate content (a predication on the source's interfacer entity).

## Position in the substrate

Substrate universality is the engineering content of "the substrate is a substrate." It is what distinguishes a predicated computer from a relational *application*: an application has a particular domain it serves; a substrate is a general-purpose computer over whatever data its current scope admits. Per [driver-substrate-split](driver-substrate-split.md), universality is what the runtime's thinness makes possible — because the runtime carries no program logic, the substrate's behavior is determined entirely by the substrate's content, and the same runtime serves any substrate.

The pattern composes with [scope](scope.md) (each substrate's scope determines its current vocabulary and admission discipline; pointing at a new source is establishing a new scope), with [bootstrap](bootstrap.md) (each substrate's bootstrap establishes its identity and initial vocabulary; the bootstrap content is what makes the substrate *this particular* substrate), and with [federation](theories/agential-orchestration-platform/concepts/federation.md) (the substrate's universality is what makes federation across heterogeneous sources structurally simple — the substrate's algebra is the same on all sides of the federation boundary).
