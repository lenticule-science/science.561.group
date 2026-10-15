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

### Verify search hits against source bytes

Search indexes are discovery surfaces, not literal-count authorities. Before a corpus migration, read the source bytes or run an exact detector against the admitted source snapshot. A quoted search that returns a document does not prove that the literal phrase occurs in that document.

Record the source revision used for the exact check. Count only verified occurrences. Fuzzy or semantic search results may nominate files for inspection, but they must not become migration counts, lint receipts, or evidence that a phrase is house style.

`tools/ptgae-literal-verify.mjs` or the exact-literal mode of the corpus scanner is the acceptance mechanism for literal claims. A result is safe to migrate only after the literal verifier and the semantic PTGAE rule agree on the defect.

## Detection is not rewrite authorization

A linter may flag text that still needs human or domain judgment. Automatic rewriting requires a narrow semantics-preserving rule with positive and negative regression fixtures.

If deleting or replacing a phrase can change claim status, actor, causality, scope, chronology, quotation, code, identifier, or technical meaning, leave it as a finding. The substantive owner or an explicitly authorized semantic rewrite must resolve it.

Mechanical linting and rewriting must not treat quotations as house prose. Preserve Markdown blockquotes and inline straight or curly quotations exactly. Lint and rewrite the surrounding prose, not the quoted source. Corpus frequency inside quotations is evidence about what the corpus cites, not evidence about 561 Group house style.

## Mechanical enforcement

`tools/ptgae-lint.mjs` is the executable rule set. It must keep code examples out of prose findings, distinguish warning-level style pressure from hard corpus contamination, and provide machine-readable output for corpus work.

Safe mechanical rewrites may remove wording that adds no semantic content or collapse stacked modality. A mechanical rewrite must not invent facts, change substantive claim status, or convert an unknown into a claim. Anything that requires domain knowledge remains a finding for the substantive owner.

## Canonical scientific terms: WIT, ACK, ATT, tally

**Required:** The words `wit`, `wits`, `witness`, `witnesses`, `witnessing`,
`acknowledge`, `acknowledgment`, `acknowledgement`, `attention`,
`attend`, `attending`, and `tally` are **not** acceptable interchangeable
synonyms in 561-authored theoretical or institutional assertions.

The canonical owners are Monetary Economics
[`wit.md`](../services/social-science-services-section/services/economics-and-business-science-services-section/services/monetary-economics-science-services-section/content/text/glossary/terms/wit.md),
[`ack.md`](../services/social-science-services-section/services/economics-and-business-science-services-section/services/monetary-economics-science-services-section/content/text/glossary/terms/ack.md),
[`att.md`](../services/social-science-services-section/services/economics-and-business-science-services-section/services/monetary-economics-science-services-section/content/text/glossary/terms/att.md),
and [`tally.md`](../services/social-science-services-section/services/economics-and-business-science-services-section/services/monetary-economics-science-services-section/content/text/glossary/terms/tally.md).
The mathematical sources are Obsmetrologia's
[`Four.lean`](https://github.com/lenticule-science/obsmetrologia/blob/main/Obsmetrologia/Language/Positing/Four.lean),
[`Record.lean`](https://github.com/lenticule-science/obsmetrologia/blob/main/Obsmetrologia/Language/Positing/Record.lean),
[`WitLedger.lean`](https://github.com/lenticule-science/obsmetrologia/blob/main/scripts/WitLedger.lean)
and its [2026-10-06 proof-status audit](https://github.com/lenticule-science/obsmetrologia/blob/main/docs/history/quot-sound-as-residue.md).
Do not replace a proved constraint with a disputed cross-carrier analogy.

**Each owned term occurrence requires a typed referent:**

- `WIT`: a claim/cell, evidence polarity and one 0→1 cover of FOUR's
  knowledge order. A direct `⊥→⊤` crosses **two** covers; another same-polarity
  `Record` increment may make **no new FOUR cover**. A news report,
  bystander or affidavit is not by definition one WIT.
- `ACK`: a concrete WIT, **different receiving party**, crossing/border,
  and uptake record. It can ACK a contested claim without resolving it.
  Self-certification is not an ACK.
- `ATT`: in the source's **budget sort**, a bounded agent's finite
  reconciliation budget `B` and the costed obstruction selection
  `S` with `totalCost(S) ≤ B`; in its **border-act sort**, a
  concrete **WIT of an ACK** with both first- and second-order relations
  identified. The 2026-10-09 source connects the two as a WIT-denominated
  expenditure but leaves the cross-carrier Landauer bridge unproved.
  Do not equate `B` itself with a single second-order event. Elapsed
  screen time, staff hours, clicks, interest or concern are not
  automatically the budget or a WIT-of-ACK.
- `tally`: identify whether the carrier is the pair
  `Obsmetrologia.Record(pos, neg)`, which counts evidence with multiplicity,
  or the matched economic `release/admission` instruments for one
  border crossing. Do not infer equivalence from a shared noun.
- `obligation`: identify bearer, beneficiary, specific required performance,
  provenance and independent discharge criteria. A matched tally for one
  transaction does not discharge an unrelated obligation.

**Distinct discipline-specific terms are not synonyms.** A constructive
existential *proof witness*, a court *witness*, and experimentally studied
*selective visual attention* can remain in attributed or domain-specific
discourse when their particular formal or empirical referents are named.
Do not silently recast them as `WIT`, `ACK` or `ATT` or equate them by word
similarity. Historical quotations, published titles, protocol identifiers,
API symbols, named physical quantities and literal source excerpts retain
their original bytes. Own prose surrounding them must distinguish their
senses explicitly. When a sentence means `operator-hours`, write
`operator-hours`, not `attention`; when it means `report received`, name
the received report, not an unverified ACK.

**Counterexamples for the writing method:**

| Rejected unspecific sentence | Typed substitute |
| --- | --- |
| "The organization witnessed the harm." | "Report `r` supports claim `c`; its positive evidence tally changed from 0 to 1, producing the FOUR cover `⊥→t` (one WIT)." |
| "The institution acknowledged the issue." | "Receiver `q` recorded uptake of WIT `w` across border `b` as ACK `a`; the contradictory evidence tally remains present." |
| "We paid attention to that response." | "Originator `p` produced WIT `w₂` of ACK `a`, yielding ATT `att(w₂,a)`." |
| "We gave this task attention for two hours." | "Operator `p` spent 2 operator-hours investigating task `x`; no ACK or ATT is established by this cost." |
| "The vote discharged the duty." | "The election receipt concerns ballot `b`. Obligation `o` remains open absent performance/receiving evidence for `o`." |

**Conformance process:** exact lexical search nominates source spans for review.
Classification requires the term's typed referent and canonical source, or
an explicitly cited **different** discipline and its distinct sense. A
literal-match scanner cannot prove semantic conformance; its output is a
**review requirement**, never rewriting authority or a certification of
mathematical correctness. Repair generated templates and scientific source
definitions *first*, then update owned descendants, preserving independent
authorial quotations. No synonym substitution and no regex-generated
assertions of WIT, ACK or ATT.
