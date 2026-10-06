# Plain Technical General American English (PTGAE)

PTGAE is the 561 Group's default English prose standard for technical, scientific, operational, and institutional writing.

## Core rule

State the proposition first. State its epistemic status only where that status changes meaning, action, safety, or evidence.

Use direct declarative sentences, ordinary contemporary General American vocabulary, precise technical nouns and verbs, explicit agents and actions, short dependency chains, restrained punctuation, and consistent terminology.

## Claim status

Prefer compact claim labels when they carry real information:

- **Observed:** directly witnessed in a named source or event.
- **Measured:** produced by a stated measurement with units and time when relevant.
- **Inferred:** derived from stated observations or measurements.
- **Hypothesis:** a proposition under investigation.
- **Model:** a formal or operational representation used to derive expectations.
- **Proposed:** an intended design, policy, architecture, or action not yet adopted.
- **Required:** an active requirement under the named authority.
- **Unknown:** the available evidence does not establish the value.

Do not expand these statuses into ceremonial caveats.

## Tonal poison

Rewrite or reject prose whose main function is to sound cautious, important, strategic, or balanced instead of saying the thing. Common defects include:

- `it is important to note`
- `it is worth noting`
- `may potentially`
- `could possibly`
- `one possible approach could be`
- `while this has not been conclusively demonstrated`
- `this does not necessarily mean`
- `serves as` when a direct verb exists
- `represents a significant` without a stated measure
- generic balanced-opposition framing that avoids a conclusion
- repetitive disclaimers
- vague passive constructions that hide the actor
- managerial abstractions that replace concrete work

These strings are examples, not a closed vocabulary. Detect the underlying pattern.

## Rewrite tests

Bad: `While this has not been conclusively demonstrated, it may be possible that the model predicts X.`

PTGAE: `Model prediction: X.`

Bad: `One possible approach could be to use a typed event log.`

PTGAE: `We propose a typed event log.`

Bad: `It appears there may currently be approximately 14.2 GB available.`

PTGAE: `Measured: 14.2 GB free.`

Bad: `The section maintains knowledge and practices for this service domain.`

PTGAE: replace the sentence with the section's actual work. If the actual work is unknown, mark the description incomplete; do not generate generic filler.

## Generated prose

Generators must consume canonical terminology and PTGAE constraints. Repeated corpus defects belong in lint rules, fixtures, templates, schemas, or generation constraints. Do not use raw corpus frequency as evidence of house style: repeated AI prose may be contamination.

A generated draft is not factual, scientific, legal, translation, publication, or brand acceptance. Preserve those statuses separately.
