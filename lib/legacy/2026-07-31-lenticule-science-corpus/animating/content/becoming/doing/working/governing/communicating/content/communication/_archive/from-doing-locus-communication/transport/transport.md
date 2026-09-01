---
type: concept
class: parameterized-discipline
parameters: [source-register, target-register, identity-criterion, loss-account]
realizes: [medium-specific-rigor]
see-also: [register, icon, accountable-closure]
instantiated-by:
- "../../math/theories/mathematical-communication/concepts/transport-discipline.md"
date-created: 2026-05-02
---

# Transport

*Transport* is the preservation of a communicative identity across representational [registers](register.md). An idea is robust when it can move — at least in principle — between prose, notation, example, diagram, code, and formalization. It need not move losslessly across every register. Some media expose structure that others suppress. But there must be a disciplined account of what is preserved, what is lost, and what is gained in the passage.

## Pattern

A practice names the registers it transports between and, for each pair (source-register, target-register), states the identity criterion (what counts as "the same idea" after transport) and the loss account (what the source carried that the target cannot, and vice versa). A transport without an explicit identity criterion or without a loss account is a smuggling, not a discipline.

## Parameters

- **`source-register`** — the register the artifact is moving from (prose, informal proof, diagram, executable code, …).
- **`target-register`** — the register the artifact is moving to (notation, formal proof script, machine-checked term, library API, …).
- **`identity-criterion`** — what counts as the *same* claim, structure, or object after transport. Equivalence under stated relation; isomorphism in a stated category; behavioral equivalence under stated tests; semantic correspondence under stated translation.
- **`loss-account`** — what the source carried that the target cannot (motivational structure, intuition, pedagogical sequence, heuristic shortcut) and what the target carries that the source did not (mechanical checkability, type discipline, library integration, executable behavior).

## Conformance shape

For each transport site in the artifact: identify source and target register; state the identity criterion under which the transported item is "the same"; account for the loss in both directions. A claim that depends on transport without an explicit identity criterion is a defect; a transport that pretends to be lossless is a more serious defect.

## Lineage

The discipline of transport across mathematical registers is developed in the [good-mathematical-communication](../../math/texts/good-mathematical-communication.md) essay, drawing on Avigad's "Mathematics and the formal turn" (*Bull. AMS* 61, 2024) and "The Design of Mathematical Language" (Springer Handbook, 2024), Macbeth on formal proofs in mathematical practice (Springer Handbook, 2024), and the autoformalization literature (Weng et al. 2025; Zhang, Valentino, & Freitas 2025; Wang et al.'s Chain-of-States 2025).

## Instances in the corpus

- The [mathematical-communication transport-discipline concept](../../math/theories/mathematical-communication/concepts/transport-discipline.md) instantiates transport for the mathematical registers `{prose, notation, example, diagram, code, formal-proof-script, library-API}`, with identity criteria and loss accounts specified for each ordered pair the practice admits.
