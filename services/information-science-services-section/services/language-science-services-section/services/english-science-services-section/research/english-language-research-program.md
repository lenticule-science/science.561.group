# English for people and agents: a scientific research program

**Status:** Foundational research agenda, not an adopted grammar or a validated universal model. **Lenticule Science, 2026-10-10.** Parent: Language Science within Information Science. Partner: the separate [PTGAE / PlainEng Science Services Section](../services/ptgae-science-services-section/README.md).

## 1. Object of study

English is a historically developing family of language practices, not a single stable computational grammar. Every utterance recruits overlapping systems of phonology/prosody, orthography, morphology, lexicon, syntax, semantics, information structure, genre, pragmatics, and social convention. Technical language adds defined vocabularies, formal notation, domain authority and procedural expectations. Machine generation adds a further population of producers with different error distributions.

A project to make English better for the twenty-first century must study at least three different questions:

1. **Descriptive:** Which English constructions are actually used, by whom, with which readings, variations and exceptions?
2. **Explanatory:** Which mechanisms contribute to robust interpretation, disambiguation, learning, retention and cooperative action in a specified situation?
3. **Constructive:** Which *voluntary* restrictions and conventions improve a well-defined human or agent task while retaining the benefits of English as a human language?

PTGAE is one proposed engineered English register downstream of the first two questions. It is not the replacement for studying English itself, nor should it make General American a judgment of human worth, dialect legitimacy, or global universality. We can start with en-US writing because a concrete base is necessary, then study international English, other Englishes, and localized variants.

## 2. Units and subdisciplines

| Research unit | Scientific problem | PlainEng implication |
| --- | --- | --- |
| **Source mark and encoding** | Unicode, grapheme, script, code point vs byte vs UTF-16 span, punctuation and orthography | Raw source and exact span identity precede normalized rendering; protect quotations, identifiers and code |
| **Uttered articulation** | Speaker, addressee, medium, situation, quotation and discourse boundaries | Distinguish text, speaker's claim, parser hypothesis and receiver inference |
| **Lexeme / sense** | Polysemy, homonymy, conversion, technical terminology, lexical change | A controlled word choice is a versioned choice of sense and grammatical function, not a universal short-word list |
| **Morphology** | Inflection, tense/aspect/number/person, derivation, irregularity | Reuse the English-language algebra; measure failures on bare verbs, adjectives and inflection |
| **Constituency/dependency** | Head, argument, adjunct, attachment, coordination, ellipsis | Parser outputs a relation/candidate space; do not reduce alternatives to one forced tree |
| **Argument structure** | Agent, theme/patient, recipient, instrument and other participant roles | Map only evidence-supported frames; do not confuse grammatical subject with real-world agency |
| **Quantification and reference** | Every/some/most/no, articles, pronouns, presupposition, anaphora | Require explicit scope and stable referents for machine-certifiable clauses |
| **Polarity and modality** | Negation scope; may, must, should, can, perhaps; ability vs permission | Normative force, epistemic uncertainty and capability must be distinguished |
| **Time/aspect** | Tense, perfect/progressive, conditionals, deadlines, temporal perspective | Preserve ordering and units; tie claims to observation and effective dates |
| **Information structure** | Topic, focus, givenness, presupposition, implicature | Clear syntax does not eliminate implicit pragmatic content |
| **Discourse/dialogue** | Context updates, repair, question/answer, request/promise, coreference | Agent protocols require speech-act type and conversation reference separate from prose |
| **Prosody and access** | Spoken ambiguity, screen-reader navigation, visual hierarchy, cognitive load | One canonical written string is not always one accessible realization |
| **Register and genre** | Scientific, legal, operational, civic, educational, conversational | Different accepted fragments and evidentiary burdens; not a one-size-fits-all maximum brevity |
| **Variation and history** | Regional and community Englishes, learner varieties, diachronic shifts | Study divergence and interoperation; do not silently label a dialect “incorrect” |
| **Language technology** | Statistical parsers, symbolic grammars, LLM interpretation, controlled language, formal models | Evaluate calibration, abstention and structured recoverability against actual human tasks |

These are **research areas**, not claims that current software implements them all.

## 3. The existing English apparatus is real and limited

The two observed English source trees currently declare the same package name with different versions:
- [Linguistics English language algebra](https://github.com/lenticule-science/linguistics-services-section/tree/main/services/english-language-algebra) declares 0.1.2 and uses the owning section's language engine to articulate, tag, relate, settle, fold and expose cohomology readings. Its [test fixtures](https://github.com/lenticule-science/linguistics-services-section/blob/main/services/english-language-algebra/test/engine.test.mjs) include the successful past-tense “The teacher graded the exam.” and counterexamples for “difficult” as an adjective and “Mary reads a book.” as a present-tense parse. Its [English codecs](https://github.com/lenticule-science/linguistics-services-section/tree/main/services/english-language-codecs/src) implement a separate clause realization surface.
- [Science English language algebra](https://github.com/lenticule-science/science-services-section/tree/main/services/english-language-algebra) declares 0.1.7 and routes tagging to the Red Cup computer-language-systems section. Its dependencies and public exports differ. **Neither source is deemed canonical here** merely because its version number is larger.

The [earlier sentence-fiber-algebra design](https://github.com/lenticule-science/linguistics-services-section/blob/main/content/text/documents/articles/notes/recovered/history/triage/sentence-fiber-algebra.md) explains why grammar relations should be considered beyond one dependency tree. Some of its assertions about ambiguity and FOUR must be re-examined: two alternative attachment arcs on **different** cells are not inherently contradictory testimony about one cell.

A mature science program compares the versions against actual consumer/deployment receipts and preserves regression counterexamples, rather than papering over those gaps with a new PTGAE lexicon. See [linguistics issue #6](https://github.com/lenticule-science/linguistics-services-section/issues/6).

## 4. The fragment lattice: constrain without impoverishing

Instead of demanding that **every** English utterance have a total canonical formal semantics, study a family of increasingly restrictive *usage profiles*, indexed by audience, genre, domain and version:

- **E0: witnessed English.** Any authentic English text is preserved; interpretation may be multiple, incomplete or contested.
- **E1: analyzed English.** An explicit English-algebra version proposes morphology, dependencies and roles with uncertainty and exact spans.
- **E2: controlled PlainEng.** A *subset of English* with admitted grammar productions, typed reference, controlled scope and approved lexical senses supports a bounded interpretation contract.
- **E3: domain-grounded PlainEng.** Lexical senses and entities resolve against a named domain ontology, units and source authority; only scoped rules are admissible.
- **E4: communicative PlainEng.** A versioned agent/human exchange carries typed speech acts, source receipts, questions/repair and effect authority; the natural-language realization remains independently interpretable by human readers.

These levels are **capabilities**, not declarations that E4 is “better English” in every setting. E2 constrains some forms but may fail a poetry, informal dialogue, culturally specific narrative or a novel scientific discourse task where E0 is appropriate. A relationship across levels is a **partial morphism** that may reject, ask for repair or lose information. Whenever meaning cannot be preserved, the morphism must say so.

## 5. Phenomena to test before rule design

A scientific corpus and grammar study should specifically include the following contrasts:

1. **Control and raising:** “She promised him to leave” vs “She persuaded him to leave.”
2. **Attachment:** “The researcher saw the robot with the sensor” (who/what has the sensor?).
3. **Negation:** “All samples did not fail” vs “Not all samples failed.”
4. **Quantifiers:** “Every engineer reviewed a report” (shared report or one per engineer?).
5. **Modality:** “The agent can publish” (capability) vs “The agent may publish” (permission) vs “The agent must publish” (obligation).
6. **Temporal reference:** “The service has restarted” vs “The service restarted at 09:00 UTC.”
7. **Attribution:** “The vendor reports that it is live” vs “It is live.”
8. **Anaphora:** “The reviewer contacted the author after they submitted it” (referents unresolved).
9. **Scope:** “Submit the form only if the identity is verified” vs “If the identity is verified, submit the form.”
10. **Presupposition:** “The service stopped leaking keys” presupposes prior leakage.
11. **Appositions and restrictive clauses:** “Engineers who passed the test...” vs “Engineers, who passed the test,...”.
12. **Passive and accountability:** “The samples were measured” may be apt when the agent is irrelevant; “We measured...” matters for traceability.
13. **Morphological undercoverage:** bare “read”, “chase”, “difficult”, and compounds can defeat naive suffix rules.
14. **Modal-as-normative vs predictive:** “The file must be here” is an inference in one context and an obligation in another.
15. **Dialect and accessibility variation:** reader task, idiom, prior domain expertise, screen-reader structure and working memory alter outcomes independently of grammatical acceptability.

Each contrast should have source, syntactic readings, candidate logical forms, possible discourse interpretations, protected/variable components, empirical hypotheses and a falsifying example. An example in this agenda is **not** a demonstrated measurement.

## 6. Scientific measures, not just readability formulas

For each corpus family, preserve human judgments of syntactic acceptability, parser candidate recall, candidate calibration, ambiguity capture, semantic role agreement, scope fidelity, factual/evidentiary drift, round-trip stability, execution authorization confusion, and human comprehension/task errors. Stratify results by genre and target readers; record domain-specific failures. Define false-negative costs before accepting a constraint as safe.

Compare fully symbolic, statistical, hybrid and agent-in-the-loop approaches under a declared compute/time budget. Agents make exhaustive counterexample generation, corpus annotation and candidate induction feasible; they do **not** make their own synthetic labels independent evidence of human understanding.

A useful long-term question is whether an **information/attention cost** can be measured for choosing between asking a reader/agent to disambiguate, spending compute on further analysis, or declining to certify a form. This is an experiment and metrological program—not a reason to invent an “ambiguity energy” scalar without calibration.

## 7. Research organization

Language Science owns methods of contextual utterance interpretation; English Science owns empirical/grammatical models of English; PlainEng Science proposes tested restrictions and conformance; Linguistics' English language algebra and shared engine provide executable research apparatus; Red Cup PTGAE Engineering implements versioned controlled-language services and their receipts.

Immediate deliverables: version/diff reconciliation, an annotated construction corpus, the E0→E4 fragment relation and explicit rejection cases, a compare/contrast with existing controlled natural languages, and a first *actual* typed English fragment whose round-trip and disambiguation claims can be checked.

**Open work:** [English Science #59](https://github.com/lenticule-science/science-services-section/issues/59); [PlainEng controlled language #61](https://github.com/lenticule-science/science-services-section/issues/61); [Linguistics English algebra #6](https://github.com/lenticule-science/linguistics-services-section/issues/6).
