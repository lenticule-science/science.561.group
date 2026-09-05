---
type: concept
class: discipline
depends-on: [interfacer, port, predication-fibration, predication-fiber-algebra, parameter-base-category, predicate-category]
see-also: [sensor, boundary, reification, doctrine-fidelity-via-faithful-interfacer-functor]
---

# Doctrine fidelity

The substrate's discipline that the [interfacer](interfacer.md) admitting external content into the substrate must carry an *isomorphic* representation of the source's structure — not a quotient, not a projection, but a structurally faithful internal model. In the substrate's hyperdoctrine setting, doctrine fidelity is *the substrate-side instance of the interfacer being a [faithful functor](https://ncatlab.org/nlab/show/faithful+functor) between the source's representation category and the substrate's [predication fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md)*: distinct source structures map to distinct substrate predications, and the source's structural relations correspond to fiber-algebra relations in the substrate.

The discipline is the substrate-level form of the *Good Regulator* condition (Conant and Ashby 1970): a regulator can act faithfully on a system only if the regulator carries enough internal structure to mirror the system. The substrate's response to being asked to act on something is to first build a doctrine-isomorphic copy of it.

The discipline matters at every external interface: the filesystem boundary admitting markdown files, the chat-window boundary admitting human-authored text, the sensor boundary admitting measurement readings, the federation boundary admitting peer messages. In each case, the substrate's internal predications about the source must preserve enough of the source's structure that the substrate can faithfully reason, query, settle, and emit derived content.

## Hyperdoctrinal grounding

A source $S$ presents content as some external category $\mathcal{S}$ — JSON objects with their schema, markdown files with their structural relations, sensor readings with their type and units, peer messages with their wire format. The substrate's interfacer is structurally a functor

$$I : \mathcal{S} \to \mathrm{Pred}(\mathcal{C})$$

from the source's representation category to the substrate's predication fibration over the [parameter-base category](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/parameter-base-category.md) $\mathcal{C}$. Doctrine fidelity is the *faithfulness* of $I$:

- **Faithful on objects.** Distinct source objects $s_1 \neq s_2$ map to distinct substrate predications $I(s_1) \neq I(s_2)$ (modulo declared kernel — see below).
- **Faithful on morphisms.** Distinct source structural relations $f, g : s_1 \to s_2$ in $\mathcal{S}$ map to distinct substrate fiber-algebra morphisms $I(f), I(g)$.

Per [doctrine-fidelity-via-faithful-interfacer-functor](../theorems/doctrine-fidelity-via-faithful-interfacer-functor.md), the substrate-level test of faithfulness is the [interfacer-counit-law](../theorems/interfacer-counit-law.md): `extract(apply(Δ, c)) = extract(c) ⊕ Δ`. A faithful $I$ satisfies the counit law; a non-faithful $I$ has a structural collapse that the counit law detects.

## What "isomorphic" means at the substrate level

Two structures are doctrine-isomorphic when there is a structure-preserving bijection between them: every distinguished element of one corresponds to a unique distinguished element of the other, and every relation in one corresponds to a relation in the other. In categorical terms, $I$ is full-and-faithful (or at least faithful-with-known-kernel). Substrate-level doctrine fidelity asks more than mere data-model coverage:

- **Every distinguishable source feature corresponds to a substrate predication.** If the source distinguishes two cases, the substrate's representation of the source must distinguish them too. A markdown projector that loses the difference between H1 and H2 headings has lost a distinguishable source feature; the substrate's downstream reasoning cannot recover it. (Categorically: $I$ is faithful on objects.)
- **Every source relation corresponds to a substrate relation.** If the source has a parent-child relationship between elements, the substrate's representation must carry the relationship as a predication. A JSON projector that flattens nested objects has lost the nesting relation; downstream operators that want to reason about "containing" find nothing to reason against. (Categorically: $I$ is faithful on morphisms.)
- **The substrate's operations on the representation correspond to operations on the source.** Reading the substrate's predications about a source object yields the same answers as reading the source directly. Editing the substrate's predications produces a corresponding source-level edit (per the [interfacer](interfacer.md)'s counit law). The two structures are operationally interchangeable up to the substrate's projector. (Categorically: $I$ has a right adjoint $E : \mathrm{Pred}(\mathcal{C}) \to \mathcal{S}$ — the extract — with $E \circ I \cong 1_\mathcal{S}$.)

## What doctrine fidelity is not

- **Doctrine fidelity is not data preservation.** A backup that preserves source bytes faithfully is not doctrine-fidelity; it preserves the bytes, not the source's relational structure. A doctrine-fidelity claim is about *substrate-level structure* (predications and their relations), not byte-level preservation.
- **Doctrine fidelity is not full embedding.** The substrate may legitimately discard parts of the source — comments in a configuration file, formatting in a markdown file — provided what is discarded is per the [interfacer](interfacer.md)'s declared kernel and is not relied upon for substrate reasoning. Doctrine fidelity is about the *non-discarded* structure being isomorphic, not about discarding nothing. Categorically: $I$ may have a non-trivial kernel, but the kernel is *declared* — the substrate knows what is being projected out.
- **Doctrine fidelity is not unconditional accuracy.** The substrate's representation of a source may carry an error model (per [sensor](../objects/sensor.md)'s six-tuple); doctrine fidelity says the representation's structure mirrors the source's structure, not that the representation is error-free.

## Why the discipline holds

Three engineering properties make doctrine fidelity the substrate's correct interface contract:

- **Faithful regulators do not lose information.** A substrate that admits a source through a non-faithful interfacer has lost source structure that the substrate may later need. The Good Regulator condition forbids this: a regulator that does not contain a model isomorphic to the system it regulates cannot act faithfully on it. The substrate's discipline is to build the model up front rather than discover the loss later. Per [doctrine-fidelity-via-faithful-interfacer-functor](../theorems/doctrine-fidelity-via-faithful-interfacer-functor.md), the faithfulness condition is checkable, not a hopeful claim.
- **Round-trip checks are how the discipline is enforced.** A doctrine-fidelity claim is checkable: extract the source's structure into the substrate, apply substrate operations, project back to the source's external representation. The result is a deterministic function of the input. If the round-trip loses structure, the interfacer is not doctrine-fidel; the substrate has identified the gap and can refuse to admit the source until the interfacer is repaired.
- **Federation requires it.** When two substrates federate, each substrate's representation of the other's content must be doctrine-fidel: the receiver's predications about the sender's content must carry the sender's structure. Otherwise the receiver cannot reason about what the sender said in the same way the sender does. The federation's coherence-glue would silently lose content the two substrates cannot align.

## Engineering consequences

The doctrine-fidelity discipline produces several substrate-level decisions:

- **Interfacer counit law is the operative test.** Per [interfacer-counit-law](../theorems/interfacer-counit-law.md), the substrate's interfacers must satisfy `extract(apply(Δ, c)) = extract(c) ⊕ Δ` — read after write recovers the original predications joined with the change set. If the law fails, the interfacer is lossy and the substrate's representation is not doctrine-fidel. The counit law is doctrine fidelity in operational form — it is exactly the categorical condition for the interfacer-extract pair to form an adjunction.
- **Sensor calibration is recorded as substrate content.** Per [sensor](../objects/sensor.md), every measurement boundary carries a transfer function, an operating range, and an error model recorded as substrate predications. The recorded calibration is the substrate's claim that the sensor's output mirrors the measurand's structure to within the declared error. A sensor with no recorded calibration has no doctrine-fidelity claim.
- **Federation arena alignment is structural, not nominal.** Per [predicated-arena](../objects/predicated-arena.md), connection compatibility is checked at the type level — the receiver's port must admit the sender's emissions structurally. Two substrates with semantically similar but structurally different arenas cannot federate without an explicit translation interfacer that itself respects doctrine fidelity.
- **Validation is composition, not a separate concern.** Per [interfacer](interfacer.md)'s validation-as-composition pattern, a doctrine-fidel interfacer composes the source's structure against the substrate's shapes during admission. A contradiction surfaces as a contested predication; the substrate does not silently squash it. Doctrine fidelity is what makes the contradiction *detectable*.

## Position in the substrate

Doctrine fidelity is the substrate's *commitment to faithful representation*. Without naming the discipline, every interfacer carries an implicit understanding of what it preserves and what it discards, and silent representation losses are diagnosed only when a downstream operator finds them missing. With the discipline named, every interfacer is testable against the same standard: does it carry an isomorphic copy of the source's structure for what the substrate intends to reason about?

The discipline composes with [interfacer](interfacer.md) (which is the structural pattern for any source-side discipline; doctrine fidelity is what each interfacer must commit to), with [sensor](../objects/sensor.md) (the measurement-side specialization where doctrine fidelity is bounded by the calibration's error model), and with [federation-as-substrate-join](teaching/explanations/federation-as-substrate-join.md) (where peer-to-peer arena alignment depends on each substrate's doctrine-fidel internal model of the other).

The pattern's hard discipline: when a substrate proposes to admit content from a new source, the first engineering question is *what doctrine-fidel internal model is required for substrate operations on that content*. The answer determines the interfacer's specification. A substrate that admits content without a doctrine-fidel model has accepted future surprises that no later engineering can fully undo.
