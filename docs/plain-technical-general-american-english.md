# Plain Technical General American English (PTGAE)

PTGAE is the 561 Group's default English prose standard for technical, scientific, operational, and institutional writing.

## Core rule

State the proposition first. State its epistemic status where that status changes meaning, action, safety, or evidence.

Use direct declarative sentences, ordinary contemporary General American vocabulary, precise technical nouns and verbs, explicit agents and actions, short dependency chains, restrained punctuation, and consistent terminology.

Prefer a concrete claim over prose about the act of claiming it. Prefer `We propose X` to `One possible approach could be X`. Prefer `Model: X follows from Y` to a paragraph explaining that X has not been proven. Prefer `Unknown: the provider does not expose remaining quota` to an invented zero or a vague disclaimer.

## Epistemic status

Use compact claim labels when they carry real information:

- **Observed:** directly witnessed in a named source or event.
- **Measured:** produced by a stated measurement, with units and time when relevant.
- **Inferred:** derived from stated observations or measurements.
- **Hypothesis:** a proposition under investigation.
- **Model:** a formal or operational representation used to derive expectations.
- **Proposed:** an intended design, policy, architecture, or action not yet adopted.
- **Required:** an active requirement under the named authority.
- **Intended:** the stated aim or designed behavior of an actor or system.
- **Simulated:** produced by a simulation rather than observed in the target system.
- **Unverified:** asserted or reported but not yet checked against the required evidence.
- **Disputed:** materially conflicting claims or authorities remain unresolved.
- **Deprecated:** retained for provenance but not current use.
- **Unknown:** the available evidence does not establish the value.

Do not expand these statuses into ceremonial caveats. A status should replace hedging, not add another layer of it.

## Put the claim before the caveat

Lead with the thing the reader needs to know. Add a bounded qualification after it when the qualification changes the claim.

Bad: `While this has not been conclusively demonstrated, it may be possible that the model predicts X.`

PTGAE: `Model prediction: X.`

Bad: `Although the mechanism has not been proven, it is possible that A causes B.`

PTGAE: `Hypothesis: A causes B.`

Safety, legal effect, and high-stakes instructions are exceptions when the limitation must come first to prevent a dangerous or materially misleading reading.

## Preserve unknowns instead of generating filler

Do not hide missing knowledge behind institutional boilerplate.

Bad: `The Music Services Section maintains knowledge and practices for this service domain.`

PTGAE when the work is known: state the work directly.

PTGAE when the work is not known: `Description incomplete.`

An explicit unknown is better than fluent text that contains no information.

## Tonal poison

Rewrite or reject prose whose main function is to sound cautious, important, strategic, polished, or balanced instead of saying the thing. Common defects include:

- `it is important to note`
- `it is worth noting`
- `it should be noted`
- `may potentially`
- `could possibly`
- `one possible approach could be`
- caveat-first sentences that bury the actual hypothesis, model, design, or conclusion
- `this does not necessarily mean`
- `serves as` when a direct verb names the action
- `represents a significant` without a stated measure
- `plays a crucial role` without naming the role
- `a wide range of` when the class or examples can be named
- `paradigm shift` without the old model, new model, and changed consequence
- `robust and scalable` without tested reliability and scale properties
- generic balanced-opposition framing that avoids a conclusion
- repetitive disclaimers
- vague passive constructions that hide the actor
- managerial abstractions that replace concrete work
- conclusion markers that restate rather than conclude
- generic section descriptions that can be copied unchanged into unrelated domains

These strings are examples, not a closed vocabulary. Detect the underlying pattern.

## Rewrite tests

Bad: `One possible approach could be to use a typed event log.`

PTGAE: `We propose a typed event log.`

Bad: `It appears there may currently be approximately 14.2 GB available.`

PTGAE: `Measured on 2026-10-06: 14.2 GB free.`

Bad: `The Sociology Services Section maintains knowledge and practices for the study of social structure.`

PTGAE: `The Sociology Services Section studies social structure.`

Bad: `The section maintains knowledge and practices for this service domain.`

PTGAE: replace the sentence with the section's actual work. If that work is unknown, use `Description incomplete.` until the substantive owner supplies it.

## Generated prose

Generators must consume canonical terminology and PTGAE constraints. Repeated corpus defects belong in lint rules, fixtures, templates, schemas, or generation constraints. Do not use raw corpus frequency as evidence of house style: repeated AI prose may be contamination.

Prefer curated PTGAE examples as generation context. Quarantine deprecated or poisoned examples so later models do not imitate them as house style.

A generated draft is not factual, scientific, legal, translation, publication, or brand acceptance. Preserve those statuses separately.

## Corpus evidence and contamination

Frequency is evidence of recurrence, not evidence of approval. A phrase that appears across unrelated authoritative files may be a generator artifact rather than house style.

Treat a defect as systemic when the same empty construction appears in two or more unrelated authoritative sources or when one known generator emits it repeatedly. Repair the source template, generator, prompt, schema, or rewrite rule before mass-editing descendants.

Do not automatically condemn a frequent phrase whose meaning depends on context. For example, `designed to`, `helps`, and `home` can state real design, effect, or custody. A detector must target the defective construction, not merely a common word.

## Detection is not rewrite authorization

A linter may flag text that still needs human or domain judgment. Automatic rewriting requires a narrow semantics-preserving rule with positive and negative regression fixtures.

If deleting or replacing a phrase can change claim status, actor, causality, scope, chronology, quotation, code, identifier, or technical meaning, leave it as a finding. The substantive owner or an explicitly authorized semantic rewrite must resolve it.

Mechanical linting and rewriting must not treat Markdown blockquotes as house prose. Blockquotes preserve quoted source text; review the surrounding prose instead of silently normalizing the quotation.

## Mechanical enforcement

`tools/ptgae-lint.mjs` is the executable rule set. It must keep code examples out of prose findings, distinguish warning-level style pressure from hard corpus contamination, and provide machine-readable output for corpus work.

Safe mechanical rewrites may remove wording that adds no semantic content or collapse stacked modality. A mechanical rewrite must not invent facts, change substantive claim status, or convert an unknown into a claim. Anything that requires domain knowledge remains a finding for the substantive owner.
