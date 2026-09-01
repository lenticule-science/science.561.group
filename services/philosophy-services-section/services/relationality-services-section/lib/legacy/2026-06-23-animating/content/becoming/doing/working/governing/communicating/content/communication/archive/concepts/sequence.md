---
type: concept
class: parameterized-discipline
parameters: [ordering-principle, supported-closures, foreclosed-closures]
realizes: [plan-reconstruction]
see-also: [panel, gutter, register]
instantiated-by:
- "../../math/theories/mathematical-communication/concepts/sequence-as-meaning.md"
- "../../math/theories/mathematical-communication/objects/dependency-sequence.md"
- "../../math/theories/mathematical-communication/objects/proof-plan-sequence.md"
date-created: 2026-05-02
---

# Sequence

A *sequence* is the ordered path through which [panels](panel.md) make particular [closures](communicative-closure.md) possible. Sequence is constitutive of meaning: the same panels in a different order admit and foreclose different closures. There is no neutral sequence.

## Pattern

A practice declares which sequence-types it admits and what each one is good for. A mature artifact often coordinates several sequences (motivational sequence in introduction, dependency sequence in preliminaries, proof-plan sequence in major theorems, formal sequence in appendices, historical sequence in remarks) and *marks* which sequence is governing at each region — the normative requirement is honesty about the sequence in use.

A text fails when it uses one sequence as though it were another: motivational prose passed off as proof, dependency order passed off as explanation, historical narrative passed off as conceptual necessity.

## Parameters

- **`ordering-principle`** — the rule the sequence follows (dependency, discovery, motivation, proof-plan, formalization, history, pedagogy, reference order).
- **`supported-closures`** — the closures this ordering makes possible (verification, recognition, plan-reconstruction, conceptual transport, source-stabilization).
- **`foreclosed-closures`** — the closures this ordering foreclosess by its choice (motivational sequence forecloses fast verification; dependency sequence forecloses motivational understanding; historical sequence may carry obsolete detours that foreclose minimal-mass exposition).

## Conformance shape

For each region of the artifact: identify the governing sequence; verify the sequence's supported-closures cover what the region asks the reader to perform; verify the artifact does not silently rely on closures the sequence foreclosess. Sequences must be *marked*: the reader should be able to tell which sequence governs each region.

## Lineage

The classification of sequences (dependency, motivational, proof-plan, formalization, historical, pedagogical) is developed explicitly in the [good-mathematical-communication](../../math/texts/good-mathematical-communication.md) essay, drawing on McCloud's general account of sequence in comics (*Understanding Comics*, ch. 3) and on the philosophy-of-mathematical-practice literature on proof understanding and reconstruction (Hamami & Morris 2024, Lakatos 1976, Thurston 1994).

## Instances in the corpus

- The [mathematical-communication sequence-as-meaning concept](../../math/theories/mathematical-communication/concepts/sequence-as-meaning.md) instantiates sequence with `ordering-principle ∈ {dependency, discovery, motivational, proof-plan, formalization, historical, pedagogical, reference}`; the supported and foreclosed closures are tabulated in the corresponding objects (`dependency-sequence`, `motivational-sequence`, etc.).
