---
title: "RelConLang Experimental Semantics Program"
description: "Lenticule Science program for studying RelConLang as an experimental agent language, separating linguistic content, FOUR-valued evidence, illocutionary force, dialogue relations, repair, and discourse history before any production use."
date-created: 2026-10-01
kind: research-note
in-service-of: lib/emsenn/services/561-group/services/lenticule-science
tags:
  - relconlang
  - communicating
  - relating
  - linguistics
  - bilattice
  - four
  - dialogue
  - speech-acts
  - discourse
  - repair
  - experimental-language
status: active
declared-by: chatgpt-web-lenticule-science
---

# RelConLang Experimental Semantics Program

## Program constraint

RelConLang remains an experimental language. This program does not authorize MetroPlat integration, institutional acts, agent dispatch, or production control surfaces. The present task is to determine what linguistic and mathematical structure the language actually has.

The central experimental question is:

> Can a population of agents use a compact relation-oriented language such that propositional content, evidence state, illocutionary force, conditional-relevance relations, any separately represented normative obligations, repair, and conversational history remain distinguishable and recoverable without hand-authored metadata?

## Recovered implementation lineage

The active RelConLang corpus is implemented in `emsenn/bare-cedar-fog` as `@emsenn/communicating-in-relation-conlang`, downstream of `@red-cup-engineering/communicating` and `@red-cup-engineering/relating`.

Current built material includes role particles, complement clauses, FOUR-associated particles, provenance, lexical modality, dialogue particles, information-structure particles, generative morphology, single-utterance corpora, and manually annotated multi-turn dialogue corpora.

The general communicating stack already provides parse forests, FOUR-valued parse evidence, cohomology-shaped parse-obstruction receipts, Lambek-shaped proof receipts, discourse-state readings, common-ground carriers, illocution carriers, membrane truth-face readings, discourse graph cohesion, causal discourse spacetime, and channel information.

These capabilities are related but must not be conflated.

## Finding 1 — FOUR is indexed, not self-interpreting

The underlying relating algebra uses the four values as the Boolean twist-product points:

`absurd = (0,0)`,
`potential = (1,0)`,
`active = (0,1)`,
`stable = (1,1)`,

where the coordinates carry evidence-for and evidence-against.

Knowledge join accumulates the two coordinates independently, so `potential ∨ₖ active = stable`.

A FOUR value therefore has no adequate interpretation without the cell/fiber it values. At minimum the current software uses FOUR over distinct objects including proposition support, parse hypotheses, membrane truth-direction, message state, visibility, and other application-specific carriers.

Program invariant:

> Never identify two FOUR readings merely because they use the same value name. Record the indexed object/fiber and the interpretation of each coordinate.

## Finding 2 — the current RelConLang charge-particle record is inconsistent

The current RelConLang stance resource maps both `ta` and `na` to `potential`, while the language manifest maps `ta` to `active`.

A 2026-09-02 commit records a deliberate correction making `ta` potential and dropping a surface particle for the former active reading. The present manifest therefore appears to have reintroduced an older mapping during later reconstruction.

This is not yet repaired here. The mismatch is retained as experimental evidence because it exposes a deeper design question: should RelConLang lexicalize the four FOUR points as a mood paradigm at all, or grammaticalize evidence-for and evidence-against more compositionally?

The same manifest contains a second, richer representation: its Chu space takes `ta`, `na`, `sha`, and `mu` as points and `truth` / `falsity` as states, with the matrix assigning a charge to each point–state pair. In that matrix, `ta` is supported on the truth state while `na` is supported on the falsity state. This is structurally different from a flat particle → charge dictionary. The experiment must therefore test whether the witness-journal mapping is an intended projection of the Chu relation or an accidental flattening.

## Finding 2a — row knowledge-join reproduces stance, but the projection is non-unique

Relating's canonical charge-pair `aggregate` is knowledge-order join. Applying it across each RelConLang particle's `truth/falsity` Chu row reproduces the stance-system mapping exactly:

`ta → potential`, `na → potential`, `sha → stable`, `mu → absurd`.

`ta` and `na` can therefore share a row-aggregate while remaining distinct inside the matrix. But a deeper audit shows that row aggregation is only one possible projection. The standard relation `stateExtension` semantics yield `truth={ta,sha}` and `falsity={na}`, while non-bottom occupancy yields the canonical four side patterns. These disagree about what the matrix means, especially for `sha`.

The shared communicating parser does not interpret the matrix. Current SignCraft implements the same **flat result** directly as `ta/na → potential`, `sha → stable`, `mu → absurd`, without deriving it from the Chu relation. The matrix therefore remains an unresolved semantic artifact, not a proof of the stance system.

See [Is RelConLang clause stance the knowledge aggregate of its Chu row?](./questions/is-relconlang-clause-stance-the-knowledge-aggregate-of-its-chu-row.md) and [What does the RelConLang Chu matrix actually mean?](./questions/what-does-the-relconlang-chu-matrix-actually-mean.md).

## Finding 3 — illocutionary force is not a FOUR point

The current communicating implementation has five illocutionary forces:

`assertive`, `directive`, `commissive`, `expressive`, `declaration`.

The implemented `illocute` operation acts on charged memes. Projection to the FOUR value is non-injective: assertive, directive, and commissive all project to potential; expressive preserves the incoming value; declaration projects to stable. Their evidence payloads still differ.

The mathematically appropriate object is therefore closer to an action of force operators on communicative state than an identification of force classes with FOUR points:

[
F \curvearrowright \mathrm{Meme}
]

rather than `Force ≅ FOUR`.

Older prose claiming that illocutionary force classes are "exactly the four corners" is not treated as a governing result.

## Finding 4 — RelConLang already factors coarse force from dialogue move

The current manifest's feature rules already preserve a useful two-level distinction:

- `ku`: `force:directive` + `dialogue:question`;
- `du`: `force:directive` + `dialogue:request`;
- `se`: `force:assertive` + `dialogue:answer`;
- `ha`: `force:expressive` + `dialogue:acknowledgement`.

Thus question/request are not separate peers of directive in one flat force enum; they are finer dialogue moves under a broader illocutionary family. The experimental reading schema now records `illocutionaryForce` and `dialogueMove` separately.

## Finding 5 — dialogue force is parsed but lost by discourse state

RelConLang currently distinguishes clause-initial dialogue particles:

- `ku`: question;
- `du`: request;
- `se`: answer/confirmation;
- `ha`: acknowledgement.

These distinctions survive tokenization, feature extraction, and dependency parsing.

However, the general `discourseStateOfForest` layer currently classifies every proved, non-negated reading as an assertion commitment. It therefore does not dynamically preserve question, request, answer, and acknowledgement as distinct discourse moves.

The current RelConLang dialogue corpus supplies `move`, `respondsTo`, and adjacency-pair metadata by hand, and its tests verify those annotations rather than recovering them.

Experimental frontier:

> Recover dialogue relations from speaker, turn order, and RelConLang text alone.

## Finding 6 — repair currently names at least four different structures

The corpus currently uses "repair" for different objects:

1. `ren`: a lexical agency verb meaning repair;
2. `ri`: an information-structure marker indicating a replacement item;
3. discourse-state repair records: diagnostic obligations such as unresolved reference, presupposition accommodation, parse obstruction, or grammar obstruction;
4. current SignCraft contradiction/denial settlement, which can derive `stable` cells but does not expose a current affirm/retract/acknowledge repair API;
5. archival Lenticule repair-resolution/adjudication theory distinguishing affirm, retract, and acknowledge.

These must remain distinct.

In particular, acknowledgement is not equivalent to erasing contradiction. The archival repair-resolution theory explicitly preserves an acknowledged contradiction, but this is theoretical lineage rather than a current RelConLang/SignStuff operation.

## Finding 6a — repair is now factored into report, diagnostic, and evidence transition

The current `communicating.discourse-state` object calls unresolved references, presupposition accommodation, and parse/grammar obstructions `repairs`; operationally these are repair **needs/diagnostics**, not evidence that a conversational repair succeeded.

The current language has executable `ren` and `ri` syntax, while SignCraft has executable positive/negative evidence settlement. The older affirm/retract/acknowledge repair-resolution theory lives in archived Lenticule resources and no current executable API for those modes was found.

The experimental bridge is therefore a `repair-report`: identify the repair target and proposed replacement/clarification while leaving evidence untouched by language alone. Any evidence addition/retraction/preservation is a separate transition carrying its own warrant.

## Finding 7 — generic H¹ decrease is not a repair metric

`CoordinationCohomology.H1rank` is the cycle rank of a graph/cover nerve:

[
\beta_1 = E - V + C.
]

It measures independent cycles / coordination loops, not contradiction.

A successful conversational repair may leave this rank unchanged or increase it by adding a useful cross-link. The separate settling Čech H¹ used elsewhere in the corpus is a different object and must not be substituted for coordination H¹.

Therefore the program rejects the provisional rule "repair succeeds iff H¹ decreases."

Contradiction repair should instead be studied through the contradicted-cell sector, witness history, and repair-resolution trajectory.

## Finding 8 — current cohesion and spacetime readings are useful but insufficient

`communicate/cohesion` already provides independent readings of a membrane:

- semantic connectivity / topic components;
- graph cycle rank and spanning-tree robustness;
- exact versus harmonic graph flow;
- causal ordering fraction;
- longest causal chain;
- speaker–subject mutual information.

These are useful observables, but shared terms and temporal adjacency do not establish a dialogue relation. An answer can be topically connected to a question without answering it.

The program therefore distinguishes at least three graphs:

[
G_{semantic},\qquad G_{temporal},\qquad G_{dialogue}.
]

The missing experimental object is `G_dialogue`: edges justified by conditional relevance, response type, and attempted satisfaction. Conditional relevance is not by itself a normative/deontic obligation.

## Finding 9 — message lifecycle currently overloads FOUR

The messaging and socializing layers use `potential` for a message in transit and `active` for a received/spent message.

The recovered Player/Opponent handedness theorem does not justify this value transition. Its duality swaps the input/output coordinates `recv ↔ send` and `observe ↔ actuate`; it preserves the charge stored at those coordinates.

Therefore message lifecycle and truth/falsity polarity are currently at least conceptually distinct. Whether there is a missing lawful representation from linear-resource lifecycle into FOUR, or an accidental carrier conflation, remains open.

See [Should message lifecycle use FOUR charge?](./questions/should-message-lifecycle-use-four-charge.md).

## Finding 10 — aspect morphology is productive syntax, not yet settling semantics

RelConLang's `-ai`, `-en`, `-um`, and `-o` suffixes are compiled as regex morphology. The compiler applies suffix rules independently of declared root-family membership. A suffix-matching nonce stem can therefore receive verb/aspect tags without acquiring a lexical-semantic witness.

This is useful: it means the language has productive morphology. It also means `-um` ("settled result") must not be read as evidence that the mathematical settling operator reached a fixed point. No such bridge has been recovered.

A separate assay now contrasts declared roots with nonce stems under the same suffixes.

See [What do RelConLang aspect suffixes denote?](./questions/what-do-relconlang-aspect-suffixes-denote.md).

## Finding 11 — presupposition exposes the "stable means settled" naming trap

The semantic presupposition detector and the `presuppose` meme morphism currently use different FOUR conventions. Detection emits `absurd` for an identified but as-yet unsupported presupposition. The morphism emits `stable` and places the same trigger witness on both the for and against evidence sides, documented as "must already be held."

Under canonical FOUR, that `stable` value is a contradiction, not merely a highly settled proposition. The program therefore treats this as an unresolved representation question, not a linguistic fact.

A machine-readable FOUR-use audit now records this and the other distinct FOUR fibers found so far.

See [What FOUR charge should a presupposition carry?](./questions/what-charge-should-presupposition-carry.md).

## Finding 12 — particle admission currently leaks legacy lexical classes

RelConLang role/stance markers are being admitted through shared legacy lexicon buckets. `ga`, `do`, and `ve` are listed as determiners. `ta`, `na`, `sha`, and `mu` are listed as both determiners and auxiliaries, but the compiler returns the first closed-class match and therefore tags them as determiners.

Role strategies independently recover intended subject/object/complement/discourse arcs from the surface markers. This lets the corpus tests pass while generic determiner attachment can also produce unrelated `det` arcs.

More importantly, `compiledBundleFromLanguageManifest` compiles only `manifest.bundle`. The `witnessJournal` charge mappings are exposed as receipts but are not used by `parseCommunication`. Current stance tests check that a charge particle is present and that its manifest metadata agrees with the stance resource; they do not show that the parsed proposition receives that particle's FOUR value.

The Semioverse now records a maturity correction: FOUR particle *surface recognition and receipts* are built, while propositional charge semantics remain experimental.

See [How should RelConLang particles be admitted without borrowing the wrong lexical classes?](./questions/how-should-relconlang-particles-be-admitted.md).

## Finding 13 — explicit role particles are not yet preserved as receipts

The grammar profile can distinguish particle-licensed and position-licensed dependency proposals, but `construe()` discards each proposal's `rule` before charging and settling. The final dependency arc therefore does not retain whether it came from `nsubj-particle`, `nsubj-position`, or both.

This matters specifically for RelConLang's design claim that `ga/do` are optional explicit receipts. Their surface presence is parseable, but the settled grammatical relation is not presently provenance-bearing in that sense.

The existing grammar profile already enumerates generic particle markers, so a language-neutral experiment can derive marker admission and grammatical evidence from those strategies rather than inventing RelConLang-specific parser primitives.

See [How should grammatical licensing provenance survive parsing?](./questions/how-should-grammatical-licensing-provenance-survive-parsing.md).

## Finding 14 — dialogue deixis is not yet grounded

RelConLang declares `mi` as first person and `tu` as second person, but the shared reference resolver only handles third-person anaphora. It has no speech-event speaker/addressee context.

This makes several existing dialogue fixtures semantically provisional. When the speaker changes between turns, repeating surface `tu` does not preserve a referent under ordinary second-person deixis. The existing corpus nevertheless labels such pairs as successful question-answer or request-acknowledgement relations.

The experiment therefore now requires a deictic context before proposition identity is evaluated. Legacy dialogue gold labels that depend on ungrounded `mi/tu` are treated as provisional rather than as semantic ground truth.

See [How should RelConLang ground indexicals across turns?](./questions/how-should-relconlang-ground-indexicals-across-turns.md).

## Finding 15 — proposition identity needs a RelConLang-specific normal form over generic readers

The current semantic readers are enough for simple contrasts: role/logical-form structure can separate `kan(tu,kano)` from `ran(mi,sava)`. They are not yet a general proposition identity mechanism.

Current limitations include ungrounded first/second-person deixis, surface rather than RelConLang-root predicate identity, omitted `obl + case` provenance/locus/kind relations, and flattening of `ccomp` embedding. The generic lemma reader does not strip RelConLang aspect suffixes.

The experiment therefore distinguishes same nucleus, refinement/update, related-but-distinct, and unrelated readings. It does not equate exact surface repetition with semantic identity.

A proposition-nucleus schema and assay now make these distinctions explicit.

## Finding 16 — the headline holographic read is not the full understanding surface

The `understanding` module exports roles, polarity, scope, temporal, presuppositions, and logical form. The headline `holography.read()` currently includes roles but not the latter five semantic projections in its returned `Reading`.

The blind-dialogue experiment may compose those readers explicitly, but the program does not treat `read()` as a complete semantic reading until that boundary is clarified.

See [What is proposition identity across RelConLang turns?](./questions/what-is-proposition-identity-across-relconlang-turns.md).

## Finding 17 — agency and modality are currently parser-visible but not semantically interpreted

RelConLang agency/modality verbs receive useful parser features and manifest metadata, but the shared semantic readers do not presently consume those RelConLang-specific meanings. `kan` and `kod`, for example, are not recognized by the generic English-oriented modal reader; `vom`'s `commissive` feature does not itself construct a commissive illocution.

This is another reason to replace unqualified maturity labels with a layer-specific matrix. The Semioverse now records maturity separately for surface admission, morphosyntax, dependency structure, semantic interpretation, cross-turn dynamics, mathematical receipts, and provenance.

See [How should RelConLang agency and modality enter semantic interpretation?](./questions/how-should-relconlang-agency-and-modality-enter-semantics.md).

## Finding 18 — the generative lexicon is presently a recognized design table, not a full generator

The shared compiler can recognize root-pattern surfaces and attach `root:*` and `template:*` features. RelConLang's root-pattern rules presently cover noun-like forms. Related verbs are admitted independently and do not inherit the same compiled root identity.

Consequently the language's biconsonantal families are real design structure and parser metadata, but noun↔verb relations are not yet grammar-derived. This matters for any future experiment in autonomous coinage or diachronic drift.

See [What makes a RelConLang root family generative?](./questions/what-makes-a-relconlang-root-family-generative.md).

## Finding 19 — a stronger normalized RelConLang parser exists in current SignCraft

Recovered September 2026 SignCraft code already implemented several structures this program has independently identified as useful: canonical verb roots, separate aspect, clause-level readings, explicit provenance/locus/kind rows, and embedded-clause event links.

On 2026-10-01 it was moved, not retired, into the standalone `@red-cup-engineering/signcraft` SignStuff package. It is current experimental software at `lib/.../computer-engineering-services-section/lib/signstuff/signcraft/src/inference/relconlang.mjs`.

Its later revision deliberately renamed clause values from charge to **knowledge readings**, reflecting a broader SignCraft distinction worth preserving.

## Finding 20 — the historical saturation evaluation was transductive in lexical features

The SignCraft evaluator correctly held out deduplicated facts, but its CLI built `featuresByWord` from every corpus record before splitting. Those features came from hand-authored `expect.features` annotations and were supplied to the FCA closure model.

The result therefore demonstrates completion aided by an externally supplied semantic lexicon, not fully inductive learning of that lexicon. Future evaluation should separate no-feature, manifest-feature, training-only-feature, and historical full-corpus-feature conditions.

See [RelConLang SignCraft Lineage](./relconlang-signcraft-lineage.md) and [What did the SignCraft RelConLang saturation result demonstrate?](./questions/what-did-the-signcraft-relconlang-saturation-result-demonstrate.md).

## Finding 21 — current SignStuff makes evidence primary and FOUR derivative

The standalone SignCell implementation carries no stored FOUR value. A cell is a stable-addressed `(subject,predicate,object)` triple plus grow-only witness sets `for` and `against`. Its FOUR reading is computed from which evidence sides are nonempty. SignChain composes the witness sets themselves; the value is the evidence.

This is a materially cleaner substrate than treating a surface stance particle as authority to stamp a proposition with a FOUR value. The program therefore now distinguishes linguistic stance profile, evidential interpretation, and derived FOUR reading.

## Finding 22 — the two current RelConLang parsers are experimental instruments, not duplicates to collapse

The shared communicating parser and the current SignCraft normalized parser optimize for different things. A dual-parser differential assay now compares them on the same utterances and projects both toward a common proposition-nucleus / stance / force / dialogue / context interface.

The goal is observational comparison and recoverable disagreement, not immediate parser consolidation.

See [What should be shared between the communicating and SignCraft RelConLang readers?](./questions/what-should-be-shared-between-communicating-and-signcraft-relconlang-readers.md) and [Should RelConLang stance contribute evidence or store a FOUR reading?](./questions/should-relconlang-stance-contribute-evidence-or-store-a-four-reading.md).

## Finding 23 — proposition-level denial is currently an open expressive problem

RelConLang has `nes` ("negate") and `nul` ("refuse"), but current software treats these as lexical predicates. `nes` was explicitly corrected in the SignCraft lineage to be a predicate rather than a polarity operator.

At the same time, canonical FOUR has an evidence-against-only `active` point, while the corrected stance system has no aggregate `active` particle. No current semantic path has been demonstrated from a RelConLang surface construction to an against-side proposition witness.

The experiment must therefore keep lexical negation, refusal, proposition polarity, evidence-against, and contradiction separate.

See [How does RelConLang express propositional negation or evidence-against?](./questions/how-does-relconlang-express-propositional-negation.md).

## Finding 24 — stance can be represented without forging proposition evidence

Current SignStuff makes the crucial distinction concrete: evidence belongs to the exact cell it witnesses. The program now has a candidate two-level stance model.

Parsing `sha P` yields a proposition nucleus `P` and a separate stance report saying that the utterance/speaker presented `P` under `sha`. The utterance can witness the stance report. Grammar alone does not add both a for-witness and an against-witness to `P`.

Independent evidence can later populate `P`; only then does its own FOUR reading change.

This mirrors SignStuff's existing source-statement discipline, where evidence that a source made an assertion is not itself a truth judgment about the assertion.

The distinction also preserves the richer `ta` versus `na` Chu profiles even though their aggregate stance reading is the same.

See [Should RelConLang stance be a report about a proposition rather than evidence on it?](./questions/should-relconlang-stance-be-a-report-about-a-proposition.md).

## Finding 25 — the math already has a denial lane; the language may not need an active stance particle

Current SignCraft formal contexts represent positive incidence and denial incidence separately. Negative closure can derive an `active` reading, and a cell with both positive and negative support settles to `stable` without erasing either side.

RelConLang already has `nes` plus generic complement-clause syntax. The program therefore adds an assay for `nes … ve P` as a metalinguistic denial report about embedded proposition `P`. An explicit evidential policy could promote that report into an against-side witness; parsing alone does not.

The matched `nul … ve P` construction is a control: refusal may change dialogue state while leaving the proposition's truth/evidence state untouched.

See [Can nes + ccomp realize proposition denial?](./questions/can-nes-plus-ccomp-realize-proposition-denial.md).

## Finding 26 — prefield ordering is underspecified and already separates the two parsers

The built stance resource includes `sava pa na mi ga dav do luma.`, with fronted provenance before stance. Current SignCraft strips stance/dialogue particles only before entering its clause parser; after consuming a fronted provenance phrase it expects a nominal subject, so this documented ordering is predicted to be refused.

The shared parser's role-strategy machinery can recover the provenance and subject without that control-flow restriction.

Rather than declare one parser wrong, the program now treats prefield order as a linguistic question: fixed slots versus typed partially free operators, and whether differing surface orders preserve or change scope.

See [How should RelConLang order prefield operators?](./questions/how-should-relconlang-order-prefield-operators.md).

## Finding 27 — current dialogue tests are annotation-consistency tests, not dialogue inference

The source `dialogue.test.mjs` parses each turn, then checks that hand-authored `move`, `respondsTo`, and `adjacency` labels fit a fixed allowed-pair table. It does not derive `respondsTo`, proposition compatibility, or whether a purported answer actually answers the question.

The Semioverse now carries an initial dialogue transition algebra for the inverse problem. Move recognition, proposition target selection, compatibility, relevance-state transition, evidence side effects, and deixis are scored separately.

This gives the v0.2 corpus a concrete experimental evaluator without turning conversational relevance into obligation.

See [What dialogue transition laws does RelConLang need?](./questions/what-dialogue-transition-laws-does-relconlang-need.md).

## Finding 28 — question punctuation and question grammar are currently different carriers

`ku` is the current machine-readable interrogative: the shared parser emits `dialogue:question`/a discourse arc and SignCraft emits a question discourse row.

Sentence-final `?` is currently only segmentation/orthography. SignCraft strips it; the shared parser uses it as a sentence terminator. Neither derives question force from punctuation alone.

This makes the built `ko tu kan kano?` example a real mismatch: its parser reading is contrastive, but its documented English gloss treats it as a question. The experiment now records punctuation and `ku` as distinct interrogative carriers until a composition rule is chosen.

## Finding 29 — local focus is not yet QUD update

The information-structure resource already describes `fi` as potentially answer-like, but its current implementation is local only. No cross-turn machinery links a focused constituent to a prior `ku`.

A `question-issue-v0.1` carrier now represents the missing discourse object. For the present experiment, `ku P` can open an issue; `fi`/`ko` may constrain a response only when such an issue already exists. They do not create a hidden question by themselves.

See [What makes a RelConLang utterance a question?](./questions/what-makes-a-relconlang-utterance-a-question.md) and [Can information structure update RelConLang question state?](./questions/can-information-structure-update-relconlang-question-state.md).

## Finding 30 — RelConLang comprehension and generation have very different maturity

The concrete RelConLang package exposes the language's **decode** boundary: raw text can be articulated, settled, and read. Shared communicating explicitly leaves genuine structure→surface realization to each concrete language.

RelConLang has no general realization codec yet. Current SignCraft `speak()` is a narrower saturation experiment that emits only explicit-role simple transitive clauses of the form `subject ga verb do object.`

The program now carries a language-specific `realization-plan-v0.1` and round-trip assay. Future generation experiments should be evaluated as `plan → surface → both readers → projected plan`, with explicit loss accounting rather than grammatical-looking output alone.

See [What should a RelConLang realization codec realize?](./questions/what-should-a-relconlang-realization-codec-realize.md).

## Finding 31 — register is currently fixture metadata, not a semantic or generative layer

RelConLang's register corpus labels everyday, technical, proof, and ritual examples and tests constraints on those fixtures. There is no current register classifier or RelConLang-populated register fiber.

The shared communicating algebra already separates register, style, evidentiality, politeness, and genre. This supports a cleaner reconstruction: register should constrain realization choices while remaining orthogonal to stance/evidence and dialogue force.

This especially corrects the current proof fixture. Its `sha` is a contradiction-held stance in RelConLang, not a generic marker of proof or certainty. Future proof-register realization should make proposition structure and warrants explicit and use `sha` only when contradiction is actually intended.

See [What makes a RelConLang register a register?](./questions/what-makes-a-relconlang-register-a-register.md).

## Finding 32 — zero marking is best treated as no explicit stance report

The language's own grammar and lessons make stance particles optional: a charge particle is added when a speaker needs to say how a claim is held. No recovered source establishes an implicit-`ta` zero rule.

The preferred experimental reading is therefore:

`unmarked(P)` = proposition/illocution with no explicit stance report;

`ta(P)` = the same proposition plus an explicit `ta` stance report.

Current SignCraft flattens both to `potential`, so its event-row reading loses this distinction. The v0.2 turn-reading schema now preserves `surfaceStance`, nullable `stanceReport`, and target evidence separately.

The remaining `ACT/Actively` glosses for `ta` are treated as documentary drift from before the September 2 correction that established `ta=potential` and removed the old surface `active` reading.

## Finding 33 — SignCraft saturation fibers are language-use incidence, not world-truth evidence

Current SignCraft adds every observed subject/object argument to a predicate's hole fiber with `potential`, regardless of the clause's own stance reading. A `mu`/absurd clause and a `sha`/contradicted clause still teach the model which arguments have occurred in those grammatical roles.

That behavior is coherent if the fiber means **attested saturation / selectional compatibility**. It is not coherent if `potential` is read as evidence that the proposition is true.

Accordingly, the program now reserves proposition evidence for explicit `for/against` witnesses on the target cell. SignCraft's current `speak()` samples corpus-plausible lexical continuations, not warranted world claims.

See [What do SignCraft's RelConLang saturation fibers mean?](./questions/what-do-signcraft-saturation-fibers-mean.md).

## Finding 34 — current surface generation can erase stance

SignCraft's `witnessCells()` deliberately learns predicate/argument incidence from every accepted clause regardless of the clause's stance. Its `speak()` then samples from those stance-insensitive counts/fibers and emits an unmarked `subject ga verb do object.` clause.

Therefore a corpus containing only `mu sa ga mor do rama.` is sufficient, by construction, to generate `sa ga mor do rama.` The lexical combination survives while the source `mu` does not.

This is acceptable for a typed **corpus-continuation** experiment. It is not acceptable as semantic realization of a warranted assertion unless a separate emission policy supplies the intended stance/force/evidence relation.

The program now distinguishes selectional competence, corpus continuation, and semantic realization.

## Finding 35 — SignCraft has two different generators, neither is a complete speech pipeline

`signcraft/inference/generate()` is evidence/knowledge-sensitive but produces an enabled **semantic/inference move**, not language. It samples from closure/energy-scored continuations.

`signcraft/inference/speak()` produces language, but only a simple corpus-plausible clause and is stance-insensitive at emission.

The missing operation is a RelConLang realization codec driven by an explicit emission policy and realization plan. A candidate pipeline is:

[
KnowledgeState 	o CandidateMeaning 	o EmissionPolicy 	o RealizationPlan 	o Surface.
]

Each arrow needs its own receipt. Sampling provenance is not epistemic warrant.

See [How should RelConLang generation use stance and evidence?](./questions/how-should-relconlang-generation-use-stance-and-evidence.md) and [How should RelConLang compose inference generation, speech sampling, and realization?](./questions/how-should-relconlang-compose-inference-generation-speech-sampling-and-realization.md).

## Finding 36 — current inference generation is evidence-sensitive but positive-only

SignCraft's settlement algebra is genuinely signed: negative evidence can derive `active` and combine with positive evidence into `stable`.

Its current `inference/generate()` does not mirror that symmetry. The generator reads both positive and denied attributes in the current state, but denied basis conclusions are skipped as candidates and every proposed move is simulated by adjoining `potential`.

So negative evidence can constrain and score generation without itself becoming a generated negative move.

For RelConLang, this means a denial-capable language cannot assume that current inference generation will spontaneously supply denial candidates. Either negative/refutational proposal is a distinct operation, or the inference move carrier eventually becomes signed.

See [Should SignCraft inference generation propose negative moves?](./questions/should-signcraft-inference-generation-propose-negative-moves.md).

## Blind dialogue experiment

Input contains only the evidence allowed by the assay:

- speaker identity;
- turn order;
- participant/addressee context required to ground person deixis;
- RelConLang surface text.

Hand-authored move, `respondsTo`, adjacency-pair, and compatibility labels remain hidden.

Gold metadata is hidden during inference.

The experiment attempts to recover, independently:

1. surface syntax;
2. propositional content;
3. indexed FOUR/evidence reading;
4. coarse illocutionary force;
5. fine dialogue move;
6. conditional-relevance expectations opened by the turn;
7. candidate earlier expectations the turn addresses;
8. response relation and compatibility;
9. repair-resolution mode, if any;
10. remaining conditionally relevant responses after the turn, plus any independently represented normative obligations.

Initial minimal contrasts should include:

- question → relevant answer;
- question → irrelevant answer;
- question → refusal;
- question → counter-question;
- request → acknowledgement;
- request → refusal;
- request → capability denial;
- assertion → contradiction;
- contradiction → retracting repair;
- contradiction → affirming repair;
- contradiction → acknowledgement-with-persistence;
- repair → acknowledgement.

A sentence may be syntactically complete while failing discourse compatibility. The experiment must score these independently.

## Recovered predecessor

A legacy Lenticule Science discourse note already proposed `SpeechActRecognition`, `TurnRecognition`, adjacency pairs such as question–answer and offer–accept/refuse, discourse-relation recognition, and conversation-level measurement of repair/acknowledgement patterns. It is a conceptual predecessor, not an implementation. The current program should consume its useful distinctions rather than rediscovering them.

## Candidate factorization

The current evidence supports treating an utterance reading as a product/fibration of distinguishable coordinates rather than one overloaded status:

[
U \mapsto
(Content, Evidence, IllocutionaryForce, DialogueMove, InformationStructure, DialogueRelation, History).
]

This is a research factorization, not yet a proved minimal basis.

## Semioverse navigation

Machine-readable manifest:

- `content/catalogs/relconlang-experimental-semantics.json`

Experimental schema:

- `content/schemas/relconlang/dialogue-turn-reading-v0.2.schema.json`

First-class open questions:

- [What does a FOUR reading mean when indexed over different linguistic fibers?](./questions/what-does-four-mean-over-different-linguistic-fibers.md)
- [Is RelConLang clause stance the knowledge aggregate of its Chu row?](./questions/is-relconlang-clause-stance-the-knowledge-aggregate-of-its-chu-row.md)
- [What does the RelConLang Chu matrix actually mean?](./questions/what-does-the-relconlang-chu-matrix-actually-mean.md)
- [Can dialogue relations be recovered from RelConLang without hand-authored metadata?](./questions/can-dialogue-relations-be-recovered-from-relconlang-alone.md)
- [What constitutes repair in RelConLang?](./questions/what-constitutes-repair-in-relconlang.md)
- [Should illocutionary force be modeled as an endomorphism rather than a stance value?](./questions/should-illocutionary-force-be-an-endomorphism.md)
- [How should RelConLang factor illocutionary force from dialogue move?](./questions/how-should-relconlang-force-factor.md)
- [What do RelConLang aspect suffixes denote?](./questions/what-do-relconlang-aspect-suffixes-denote.md)
- [What FOUR charge should a presupposition carry?](./questions/what-charge-should-presupposition-carry.md)
- [How should RelConLang particles be admitted without borrowing the wrong lexical classes?](./questions/how-should-relconlang-particles-be-admitted.md)
- [How should grammatical licensing provenance survive parsing?](./questions/how-should-grammatical-licensing-provenance-survive-parsing.md)
- [How should RelConLang ground indexicals across turns?](./questions/how-should-relconlang-ground-indexicals-across-turns.md)
- [What is proposition identity across RelConLang turns?](./questions/what-is-proposition-identity-across-relconlang-turns.md)
- [How should RelConLang agency and modality enter semantic interpretation?](./questions/how-should-relconlang-agency-and-modality-enter-semantics.md)
- [What makes a RelConLang root family generative?](./questions/what-makes-a-relconlang-root-family-generative.md)
- [What did the SignCraft RelConLang saturation result demonstrate?](./questions/what-did-the-signcraft-relconlang-saturation-result-demonstrate.md)
- [What should be shared between the communicating and SignCraft RelConLang readers?](./questions/what-should-be-shared-between-communicating-and-signcraft-relconlang-readers.md)
- [Should RelConLang stance contribute evidence or store a FOUR reading?](./questions/should-relconlang-stance-contribute-evidence-or-store-a-four-reading.md)
- [Should RelConLang stance be a report about a proposition rather than evidence on it?](./questions/should-relconlang-stance-be-a-report-about-a-proposition.md)
- [How does RelConLang express propositional negation or evidence-against?](./questions/how-does-relconlang-express-propositional-negation.md)
- [Can nes + ccomp realize proposition denial?](./questions/can-nes-plus-ccomp-realize-proposition-denial.md)
- [How should RelConLang order prefield operators?](./questions/how-should-relconlang-order-prefield-operators.md)
- [What dialogue transition laws does RelConLang need?](./questions/what-dialogue-transition-laws-does-relconlang-need.md)
- [What makes a RelConLang utterance a question?](./questions/what-makes-a-relconlang-utterance-a-question.md)
- [Can information structure update RelConLang question state?](./questions/can-information-structure-update-relconlang-question-state.md)
- [What should a RelConLang realization codec realize?](./questions/what-should-a-relconlang-realization-codec-realize.md)
- [What makes a RelConLang register a register?](./questions/what-makes-a-relconlang-register-a-register.md)
- [What does an unmarked RelConLang clause say about stance?](./questions/what-does-an-unmarked-relconlang-clause-say-about-stance.md)
- [What do SignCraft's RelConLang saturation fibers mean?](./questions/what-do-signcraft-saturation-fibers-mean.md)
- [How should RelConLang generation use stance and evidence?](./questions/how-should-relconlang-generation-use-stance-and-evidence.md)
- [How should RelConLang compose inference generation, speech sampling, and realization?](./questions/how-should-relconlang-compose-inference-generation-speech-sampling-and-realization.md)
- [Should SignCraft inference generation propose negative moves?](./questions/should-signcraft-inference-generation-propose-negative-moves.md)

These resources are the durable program entrypoints. The chat that produced them is provenance, not canonical state.