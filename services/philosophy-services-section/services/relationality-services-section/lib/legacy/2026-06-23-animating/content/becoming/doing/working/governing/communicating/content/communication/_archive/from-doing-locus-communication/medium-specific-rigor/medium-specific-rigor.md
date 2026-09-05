---
type: concept
class: parameterized-discipline
parameters: [medium, rigor-criterion, failure-mode]
see-also: [register, icon, transport]
instantiated-by:
- "../../math/theories/mathematical-communication/concepts/medium-specific-rigor.md"
date-created: 2026-05-02
---

# Medium-specific rigor

A medium is rigorous when it makes accountable the closures *proper to that medium*, not by imitating another. *Medium-specific rigor* is the per-register criterion that resists the common mistake of asking every medium to justify itself by imitating proof.

This is not relativism. It does not say every medium validates itself. A diagram that licenses a false theorem fails. A proof that hides a crucial lemma fails. A formalization of the wrong statement fails. A metaphor treated as proof fails. But each fails in a *medium-specific* way.

## Pattern

For each register the practice works in, the rigor criterion is stated in the register's own terms: a proof is rigorous when its inferential obligations are discharged or acceptably delegated; a diagram is rigorous when its meaningful visual features and licensed transformations are controlled; a definition is rigorous when it creates a stable object of recognition and future use; an example is rigorous when it exposes a reusable pattern rather than a lucky calculation; a metaphor is rigorous when it marks both the structural correspondence and the point at which the correspondence ends.

## Parameters

- **`medium`** — the register the criterion governs (proof, diagram, definition, example, computation, formal script, lecture, metaphor, code, benchmark).
- **`rigor-criterion`** — the medium's own standard, stated in its own terms.
- **`failure-mode`** — the characteristic way the medium fails when it does fail (a diagram licensing an unsupported inference; a proof hiding a lemma; a definition compressing too much too early; an example mistaken for a pattern; a benchmark without acceptance criteria).

## Conformance shape

For each region of the artifact, identify the medium; recover the practice's stated rigor criterion for that medium; apply the criterion's check; record any failure-modes triggered. The audit is per-region; cross-medium comparison happens through [transport](transport.md), not through borrowing one medium's rigor criterion to judge another medium.

## Lineage

The medium-specific-rigor framing is developed in section 10 of the [good-mathematical-communication](../../math/texts/good-mathematical-communication.md) essay; it draws on Avigad's "The Design of Mathematical Language" (Springer Handbook 2024), the philosophy of diagrammatic reasoning (SEP entry, 2025), and Macbeth on formal proofs in mathematical practice (Springer Handbook 2024). The position parallels Kress's multimodality framework in semiotics (*Multimodality*, Routledge 2010).

## Instances in the corpus

- The [mathematical-communication medium-specific-rigor concept](../../math/theories/mathematical-communication/concepts/medium-specific-rigor.md) instantiates this concept with the mathematical media inventory and the per-medium rigor criteria from sections 7–10 of the source essay.
