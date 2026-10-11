# English for the twenty-first century: linguistic science and constrained computational registers

**Status:** research specification, 2026-10-11. Hypotheses and interface proposals, not established theorems or an adopted language standard. **Private research; no public license or release implied.**

**Source ownership:** Information Science → Language Science → English Science. Plain Technical General American English (PTGAE/PlainEng) is a *downstream* restricted-English profile and engineering consumer, not the science of English itself. See science issues [#59](https://github.com/lenticule-science/science-services-section/issues/59), [#60](https://github.com/lenticule-science/science-services-section/issues/60) and [#53](https://github.com/lenticule-science/science-services-section/issues/53).

## Research question

Can we deliberately **constrict English** to construct a succession of expressive, human-usable registers that are increasingly reproducible for agents and proof-producing computational tools, without inventing a disconnected conlang or confusing controlled syntax with true claims? Unlike historical controlled-language work, contemporary language agents can both generate and adversarially test examples at scale. They cannot, by repetition or self-agreement, supply independent human comprehension evidence or semantic proofs.

Build an English of the present and future by *studying existing English more deeply*, including varieties, rhetoric, pragmatics, historical change, and specialized registers. Treat ordinary English as a rich empirical subject, not an error-ridden approximation to a formal language. Restrictions are task/genre/audience specific and reversible in documentation; register differences are not rankings of speakers or dialects.

## The source-to-consumer order

1. **Marks and uttered articulations (Obsmetrologia):** preserve concrete source marks, token occurrence identity, segmentation hypotheses and utterance provenance. A token string is not a unique occurrence and a transcript is not automatically the speaker's intended proposition.
2. **English science:** orthography, phonology/prosody when available, morphology, constituents, dependency relations, argument structure, tense/aspect, modality, reference, presupposition, implicature, discourse, register, dialect, genre and reader tasks. Version real corpus evidence.
3. **English algebra and codecs:** language-neutral parser interface plus versioned English grammar, candidate forest, compositional interpretation where defined, and controlled realization. Reconcile the distinct English-algebra 0.1.2 and 0.1.7 source trees before claiming a single runtime. No PTGAE-specific duplicate tokenizer or morphology.
4. **Typed candidate interpretations:** scoped propositions, participants, referents, quantifiers, negation, modality, temporal intervals, units and provenance with explicit ambiguity, partiality and abstention.
5. **SignCell:** source-bound typed carriers and admitted evidence; the act of parsing creates candidates, not factual witnesses.
6. **SignChain:** evidence-conditional derivations with recorded inference rules; an entailment is not a citation, a factual observation, or operational permission.
7. **SignGraph:** context-indexed predicates and relations, transport/restriction across overlapping contexts, provenance-preserving crosswalks.
8. **SignCraft:** warranted inference, adjudication/repair and traceable settlement under separate authority; no linguistic parse confers action authority.
9. **Controlled English realizations:** restrict and surface a reading in PTGAE or other task-bounded English profiles, preserving claims and explicit uncertainty.

This is a *proposed dependency and testing order*, not a claim all named integrations exist.

## A lattice of English fragments, rather than one universal dialect

Let E be attested ordinary English usage, with phenomena and varieties represented descriptively. Define profiles by **admitted construction sets and obligations**, not a single global quality score:

- **E-source:** lossless source quotation, spans, speaker, document edition and uncertain segmentation; accepts colloquial, dialectal and unparsed examples.
- **E-parse:** a source has one or more licensed parses, with explicit coverage/ambiguity metrics; still permits unsupported interpretations.
- **E-controlled:** a declared grammar edition and sense inventory admit selected structures with scope and reference made explicit when needed.
- **E-evidential:** controlled utterances are associated with independently identified testimony, temporal scope, measurement and claim status.
- **E-protocol:** a domain-bound reading can be checked for authorized use by a *separate* policy/operational system.

The profiles are not necessarily a linear chain: one register may allow complex discourse but disallow pronouns; another may allow pronouns with a fixed reference discipline. Use a partial order of admitted constructions, interpretation guarantees, and task constraints. Profile inclusion does not imply easier human comprehension. A lossless quotation is not required to satisfy a controlled grammar.

**Formalization target:** define `Fragment` with grammar edition, admitted constructions, interpretation semantics (possibly partial), source mapping, obligations and realization relation. Define morphisms that preserve source spans and specified semantic invariants. Prove only restricted monotonicity/roundtrip properties where hypotheses hold.

## Algebraic objects to investigate

**Typed reading relation.** For source utterance u and context c, define `Read(u,c)` as a *set of interpretations* with spans and derivation/provenance. Empty means unparsed or inadmissible, not false. Two members of `Read` represent grammatical alternatives, not positive and negative evidence for the same proposition. Mark unresolved indexicals, anaphora and domain vocabulary without inventing a referent.

**Evidence bilattice.** For a pinned typed proposition p, a context c and a time/authority scope, keep support and refutation coordinates distinct. The four statuses (neither, support only, refutation only, both) are evidence states, not grammatical ambiguity classes. Require provenance-preserving aggregation and avoid converting parser likelihood into evidence.

**Contextual fibers.** For each context object c, assign a fiber of admissible typed readings/evidence states; define explicit transport or restriction along context inclusion. Investigate whether these form a presheaf or sheaf for a specified site/cover. State gluing and uniqueness hypotheses rather than presuming them. A failed global section may indicate conflicting local constraints, missing reference transport, or a wrongly specified cover; it does not by itself diagnose false natural-language statements.

**Adjunctions.** Investigate existential/direct-image and universal/right-adjoint semantics relative to a typed change of context or predicate projection. Only assert `∃_f ⊣ f* ⊣ ∀_f` when the orders, fibers, map f and existence conditions are explicitly constructed. Compare with Curry–Howard–Lambek propositions-as-types/programs/proofs, typed grammar, Yoneda-style observational characterization and formal concept analysis (FCA) extents/intents, without collapsing these into equivalent structures by analogy.

**CHL and lightcone language:** distinguish the established Curry–Howard–Lambek correspondence from proposed Lorentzian-lightcone and chromatic extensions. Specify information availability/causal reachability, observer-indexed vocabulary, transport rules and possible chromatic partitions as *new definitions*, then exhibit models, nonmodels and counterexamples. Do not present proposed relationships as proven physics or logic.

**Cellular sheaves and Laplacians.** When a *justified numeric vector representation* and restriction matrices exist, construct coboundary δ and L = δᵀδ and test consistency residuals. Generic parse forests, propositions and bilattice states have no canonical Euclidean encoding, hence no automatic sheaf Laplacian. Establish what any spectrum measures under a chosen encoding, and test sensitivity to changed encodings and deliberately ambiguous controls.

## English phenomena and falsifiable examples

For each construction, collect source-attested examples, controlled paraphrases, negative controls, dialect/genre context, source spans and human interpretation judgments. First fixture set:

| Phenomenon | Source pair / family | Invariant or ambiguity to test |
| --- | --- | --- |
| Quantifier scope | “Every reviewer read a report.” | One shared report vs per-reviewer reports |
| Negation and necessity | “You must not submit” / “You need not submit” | Prohibition vs absence of obligation |
| Reporting and attribution | “Ada says the valve failed” / “The valve failed” | Attribution must not become direct observation |
| Conditionals | “If the sensor fails, stop the pump” | Antecedent and instruction remain scoped |
| Modality | “The patient may leave” | Permission vs epistemic possibility; use nonmedical evaluation contexts too |
| Anaphora | “The analyst told the editor they were late” | Pronoun reference remains unresolved |
| Time and units | “Send 5 mg daily” / “Send 5 g daily” | Unit preservation and domain-sensitive hazard checks |
| Coordination | “Inspect and repair pumps and valves” | Attachment and distributive scope |
| Speech acts | “Could you close the gate?” | Interrogative form vs conventional request |
| Quoted or negated claim | “The report denies ‘system is safe’” | Quoted proposition is not endorsed |

Add dialect-sensitive constructions and nonstandard writing without treating them as errors. The test must distinguish a parser's ignorance from a speaker's communicative failure.

## Research workstreams and receiving evidence

**A — English descriptive atlas.** Study reference grammars, corpus linguistics, diachrony, varieties and sociolinguistics, formal semantics, discourse representation, pragmatics, rhetorical genre, plain-language research, readability/accessibility and controlled natural languages. Create a bibliography with editions, licenses and exact tested claims. Include systematic challenges from constructions outside edited technical prose.

**B — Fragment grammar and realizers.** Reconcile the existing Lenticule English-algebra source revisions and dependencies. Specify a typed grammar for a *small fragment* with explicit semantic roles, quantifier/negation/modality scopes and deterministic or alternative-preserving realization. Compare roundtrip with an independent reader/parser rather than only a self-consistent generator.

**C — Agent-driven corpus and counterexamples.** Agents propose and adversarially perturb minimal pairs, test parse/realize/interpretation stability, and triage errors. Prevent training/evaluation leakage and synthetic self-consensus. Independent human participants measure task success, time, comprehension and perceived naturalness, with dialect and accessibility representation.

**D — Mathematical semantics.** Start with a small finite context diagram and typed claim universe: calculate restrictions and gluing conditions symbolically; prove preservation/abstention/non-escalation lemmas in Lean where justified; separately run numerical sheaf experiments only for explicit linear representations. Include countermodels for every attractive failed analogy.

**E — PTGAE engineering transfer.** PTGAE consumes pinned English grammar + versioned language-fiber restriction profiles + source-preserving reading receipts. Gate transformations for attribution, modality, negation, quantity, reference, time and units. Maintain positive and *negative* fixtures. The receiving gate is not independently authenticated English-package integration and current rewrite service is unimplemented. Do not rename a lint result “semantic certification.”

## Initial measurable hypotheses

- H1: For selected high-risk technical tasks, an explicit controlled-fragment grammar decreases *material semantic-drift errors* compared with unconstrained rewriting at comparable human comprehension, measured blind on held-out source pairs.
- H2: Preserving parse alternatives and abstaining on unresolved reference reduces false asserted facts relative to forced single-parse output, at a measurable coverage/latency cost.
- H3: Explicit type/scope checks reduce unauthorized normative escalation (e.g. “may” → “must”, attribution → fact), measured with adversarial controls.
- H4: Context restriction/transport models detect specified incompatibilities missed by flattened proposition stores; compare against simpler rule baselines and measure false alarms.
- H5: Agent-generated adversarial fixtures add previously unseen failures but do not substitute for independently sampled human judgments.

Record denominators, corpus origin, abstention rates, confidence intervals and failure types. A theoretically elegant model that worsens communication must be reported as such.

## Ownership and acceptance

- Lenticule **English Science** owns descriptive evidence, interpretation hypotheses, research bibliography, fragment definitions and empirical protocols; **Information/Language Science** own shared upstream foundations.
- Obsmetrologia/Sign-stack scientific work owns its precise mathematics and claims of proof; Red Cup owns implementations **in their existing upstream libraries** rather than a parallel PTGAE SignStack.
- Red Cup English Engineering owns executable English grammar/codec integration; PTGAE Engineering owns downstream constrained profiles, diagnostics and opt-in transformations. Causeway and institutional publishing offices separately decide applied registers and external adoption.

Accept this research stage only when: (1) English phenomenon inventory and licensed bibliography exist; (2) a concrete grammar edition and a tiny fully worked typed fragment are specified; (3) ambiguity, evidence, context and authorization are demonstrably separate; (4) examples/nonexamples and measurement plans exist; (5) a real upstream dependency closure and test receipts back any integration claim. No automatic FOSS, universal adoption, external certification or Lean theorem claim follows from merging this document.

## Existing source pointers

- [English science issue #59](https://github.com/lenticule-science/science-services-section/issues/59)
- [Linguistic Sign-stack issue #60](https://github.com/lenticule-science/science-services-section/issues/60)
- [PTGAE science issue #53](https://github.com/lenticule-science/science-services-section/issues/53)
- [Actual upstream integration and version split](https://github.com/red-cup-engineering/ptgae-engineering-services-section/blob/main/docs/plaineng-upstream-english-sign-contract.md)
- [Existing engineering delivery program](https://github.com/red-cup-engineering/ptgae-engineering-services-section/blob/main/docs/plaineng-engineering-program.md)
