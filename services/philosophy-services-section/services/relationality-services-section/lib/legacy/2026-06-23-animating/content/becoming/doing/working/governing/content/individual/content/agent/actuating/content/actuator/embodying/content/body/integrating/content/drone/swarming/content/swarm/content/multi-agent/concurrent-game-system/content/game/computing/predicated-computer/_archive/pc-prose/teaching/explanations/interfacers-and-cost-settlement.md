---
type: narrative
status: current
introduces: [interfacer]
recaps: [boundary, canonical-form]
---

# Interfacers and the cost settlement of I/O

Every predicated computer eventually has to do I/O. Markdown files have to be read into predications and written back out. JSON-RPC messages cross the boundary into substrate operations. Agent context windows have to be assembled from substrate content and sent to a model. HTTP bodies have to be parsed into substrate state and serialized back into responses. The temptation, at each interface, is to write a serializer: a piece of code that knows the format on one side and the substrate's storage on the other and translates between them.

This is the wrong abstraction. A serializer has no contract with the substrate beyond "produces some byte stream the other side can hopefully read." Round-trips lose information silently — values get re-quoted, ordering changes, whitespace shifts, comments evaporate. Two parallel writes against the same external content clobber each other. Adding a new format means writing a new serializer from scratch. The substrate's algebra ends at the serializer's boundary; everything past it is byte-banging.

The substrate's response is the [interfacer](../teaching/explanations/interfacer.md) discipline. An interfacer is not a serializer. It is the substrate's I/O contract on a specific external format, governed by three operations (extract, apply, compose) and three laws (counit, coassociativity, locality of glue). Read-then-write round-trips losslessly. Two compatible applies glue; two incompatible applies surface a contested predication. Adding a new format adds a new interfacer entity to the substrate, not a new serializer to the codebase.

The engineering content is the *cost settlement path* of I/O. Every substrate operation that produces an external observation sits on a continuum from expensive to cheap, depending on how much of the work is done by the substrate's algebra and how much is left to inference:

- **Inference reads and summarizes.** A model is asked to read substrate content and produce a summary. The substrate provides raw predications; the model interprets, summarizes, and emits prose. The cost is the model's per-call cost, which dominates everything.
- **Inference fills a structured prompt.** A skill provides a structured prompt template; the model fills the template's blanks from substrate content. Cheaper than free-form summary because the structure constrains the model, but the model is still doing the formatting work.
- **Code computes; inference formats.** A deterministic procedure computes the answer from substrate content; a small model wraps the answer in prose. The model's job shrinks to natural-language assembly. Cost drops by an order of magnitude.
- **Code computes and emits.** A deterministic procedure computes the answer from substrate content and emits the external representation directly. No model is invoked. Cost is the procedure's compute cost.
- **Interfacer composes.** No procedure runs. The interfacer's compose operation reads multiple substrate fibers and emits the external representation as a deterministic function of those fibers. The substrate's content *is* the answer; the interfacer is the discipline that surfaces it. Cost is the substrate's read cost — bounded, low, and amortizable across calls.

This is a settlement path in the substrate's sense. An I/O operation initially settled at the most expensive layer (inference reads and summarizes) is *the same operation* as one settled at the cheapest layer (interfacer composes). The migration from one to the other is the substrate gaining content: more predications on relevant entities, more vocabulary in the relevant scope, more declared rules that determine the answer from structural composition rather than from inference. Every operation that descends the path is a permanent cost reduction, because the structural facts the substrate now uses to answer the question are themselves substrate content — auditable, replicable, and inspectable — rather than ephemeral inference at call time.

The path generalizes the interfacer's role. An interfacer is the substrate's *terminal* I/O form: the form an operation reaches when its answer is determined entirely by substrate composition. A new operation typically does not start there. It starts in inference, gets shaped into a procedure, gets the procedure's content moved into substrate predications, and eventually settles into an interfacer when the predications are rich enough and the substrate's vocabulary is complete enough to compute the answer compositionally. Per [vocabulary-completeness](../teaching/explanations/vocabulary-completeness.md), this is a measurable progress: the proportion of substrate operations served by interfacer composition rather than by inference is a substrate health metric.

The implication for system design is that I/O is not a layer to be minimized after the substrate works. It is a substrate concern from the start. The interfacer's three laws are admission conditions: a new format is admitted to the substrate when its extract-apply pair satisfies the counit law, when applies coassociate, and when parallel applies glue per the substrate's coherence discipline. A format that does not satisfy these laws is not yet substrate content — it is host-runtime convenience that may or may not survive the substrate's algebraic discipline.

Interfacers are also the substrate's *self-publication* discipline. When the substrate emits a configuration file, an agent's prompt, a published document, an external API response — each of these is an interfacer's compose operation. The output is a deterministic function of substrate content; if the substrate's content changes, the next compose call produces the updated output. There is no separate publishing step, no template render, no manual sync. The substrate's content *is* what is published; the interfacer is the rule that decides which content composes into which external surface.

The discipline's limit case is striking: a substrate that has reached interfacer composition for all its I/O is a substrate whose external behavior is entirely determined by its predication content. Editing the predications edits the behavior. Inspecting the predications inspects the behavior. The byte-banging surface is gone; what remains is the substrate's algebra, and the interfacers that surface it.

## Three orthogonal cost-reduction vectors

The settlement path is not a single lever; it is three independent vectors a substrate can pull on, composing multiplicatively over time:

- **Fiber richness.** Adding predicates to entities — making fibers fatter — increases the determinism the substrate's algebra can extract from a given query. A thin fiber leaves many cells at $\bot$, which forces inference to fill the gaps; a rich fiber leaves the algebra enough to compose an answer without the model. This is the substrate's *content* vector: cost reduction by enriching what is already there.

- **Model cost.** When inference is genuinely needed, the model serving the inference matters: a frontier model on a free-form prompt is the most expensive case, a cheaper model on a structured prompt is mid-cost, a tiny model wrapping a deterministic computation is near-free. The substrate's choice of model per inference call is its *infrastructure* vector: cost reduction by routing the work to the cheapest model that satisfies the call's quality bound.

- **Interfacer coverage.** Operations that can be answered by the substrate's compose operation — interfacer-rendered observations of substrate content — never reach an inference call at all. Migrating an operation from inference to interfacer is its *terminal* settlement: cost drops to the substrate's read cost. This is the substrate's *boundary* vector: cost reduction by eliminating the inference call entirely.

The three vectors compose. A richer fiber lets a cheaper model produce the same answer it once needed a frontier model for; a cheaper model leaves more headroom for the substrate to migrate the operation to an interfacer; a successful interfacer migration retires the inference call entirely. Each vector's progress amplifies the others. A substrate that pulls on all three asymptotically approaches an operating regime where inference is reserved for novel content that cannot yet be expressed in substrate terms — and even those novel calls run on the cheapest model the answer's quality will tolerate.

The substrate-level health metric is per-vector: how rich are the relevant fibers, how cheap is the typical inference call, how many of the operations have settled into interfacer composition. A substrate that improves any one of the three reduces its operating cost; a substrate that improves all three reduces it compounded.
