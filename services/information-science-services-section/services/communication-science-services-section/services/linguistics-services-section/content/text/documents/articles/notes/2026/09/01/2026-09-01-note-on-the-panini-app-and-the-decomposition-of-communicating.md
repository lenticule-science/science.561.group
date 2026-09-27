---
title: "Panini: App and Decomposition of the Communicating Engine"
description: "Program design note for (2026-09-01) on distributing the communicating engine into topic sections and composing them as the panini app, with section map, app spec, 12-lot migration sequence, and design-comparison scores."
date-created: 2026-09-01
type: notes
name: 2026-09-01-note-on-the-panini-app-and-the-decomposition-of-communicating
authors:
  - claude-haiku-4-5
keywords:
  - panini
  - communicating
  - app-composition
  - org-layering
  - import-stratification
  - linguistics-services-section
status: synthesis-ready
---

## Program requirements

Communicating capabilities are distributed across services sections and scripts. Panini is the app that composes them into a coherent product that meets or exceeds familiar tools in the relevant field.

This design applies two house laws directly: **org-layering law #3** (topic sections carry src/<topic> + scripts/<verb>-<noun>, apps compose scripts and src) and **import stratification** (scripts import scripts+src, never apps; apps import apps+scripts+src). The precedent is **Metrologic**, the app over obsmetrological-proof-tree sections (`obsmetrological-services-section/apps/metrologic`).

The design has two requirements: (1) distribution of communicating's capabilities into topic sections, and (2) panini as the composing app. Both are mandatory; neither is optional or deferred.

## Incumbent Portfolio and MEET/BEAT Findings

The census of existing language-processing tooling against which panini measures itself (source: linguistics-services-section census, dated 2026-08-XX, awaiting exact receipt path in corpus):

**Incumbents measured:**
- spaCy: 3-line quickstart; default single-parse output; no default provenance per token
- NLTK: 4-line bootstrap (download step); no tokenize-to-parse pipeline witness as default behavior
- Stanza: 4-line stanza.download() + 3-line model fetch; Dependency and CRF tagging; no default ambiguity reporting
- CoreNLP: JVM/classpath required; GPLv3+commercial licensing; no default per-token rule traceability
- UDPipe: lightweight but rule-blind; single-parse only
- HuggingFace transformers: BERT/RoBERTa taggers; no rule-traceable provenance in default output

**MEET claim:** panini's 3-4 line quickstart (`import { load, read } from '@lenticule-science/panini'; const bundle = await load('english'); const reading = read('Hello world', bundle);`) matches or beats spaCy's measured floor and Stanza's 4-line floor, exercised against fixture sentences that stress the just-fixed copula/irregular-verb tagging (e.g., "She is running" or Mandarin 是-copula).

**BEAT claims (restricted to what the census's narrowed gap supports):**

1. **Witness-per-token/arc provenance as DEFAULT output.** Reading.tokens[i].witness = {rule, section, receiptId}, landing as Datoms via witness-journal-record-service (no hand-rolled writer), per computer-data custody law. No incumbent's default output includes this — spaCy's Matcher/EntityRuler are opt-in; NLTK's CFG derivation trees are partial/optional.

2. **Ambiguity as a first-class DEFAULT output.** Reading.tokens[i].charge ∈ {true,false,both,neither} (genuine Belnap four-valued signal from algebra/charge.mts + communicate/face.mts + articulating's four-corner-cell.mts, reused not reimplemented), plus reading.cohomology.refusalNumber (parsing/cohomology.mts composed with articulating's bigraded-cohomology settling) as secondary obstruction signal. No incumbent silently collapses ambiguity to a single guess by default.

3. **Permissive open-source license + single Node install.** No JVM/classpath (beats CoreNLP ergonomics outright); no GPLv3+commercial dual-license (house repo under MIT/similar).

**NOT claimed as BEAT:** Corpus-consent gating (proposed in one design as v0 addition) is held out — the census never measured governance/consent against incumbents, so shipping it is fine but claiming beat without measured comparison is not. It lands later as a plain v1 feature, not a Lot-1/2 gate item.

**Note:** Both surviving BEAT claims are designed-for at Lots 2-3 but not proven until Lot 4's falsification assay closes. Designing the fields is not proving the gap closed; no session may report BEAT as achieved before that assay runs.

## App Specification: Panini v0

**Seat:** @lenticule-science/panini at `linguistics-services-section/apps/panini` — the three competing designs converge here, following Metrologic precedent (app beside topic-section siblings within the same top science section).

**v0 (Lot 1, gated below) wraps @lenticule-science/communicating@0.0.5 UNMOVED.** The engine is not split in v0; distribution is deferred per Design 3's wedge-speed logic.

**Root export:** {load, read, settle} + thin subpath re-exports (./tokenize, ./tag, ./parse, ./lemmatize, ./render, ./grammaticality, ./discourse) to match the existing public surface.

**CLI:** apps/panini/bin/panini-cli.mjs

```
panini read "<text>" --lang=<fiber> [--json] [--witness]
panini annotate --file <path>
```

No JVM/classpath — beats CoreNLP's ergonomics outright; matches spaCy's 3-line quickstart and beats Stanza's 4-line stanza.download() step (fibers are npm-pinned, not runtime-fetched).

**Receiver:** The external developer/agent who today reaches for spaCy/NLTK/Stanza/CoreNLP/UDPipe for the tokenize→tag→parse→annotate job.

**Acceptance gate (Lot 1 precondition):**

1. The 3-4 line quickstart runs end-to-end against a real fixture sentence exercising the just-fixed copula/irregular-verb tagging (verified 2026-09-01: git commit de75d1bba18, "fix(communicating): surface copula tag; recognize verbs via irregularVerbs/verbFormRules", landed with 0 regressions in 70 prior tests) and returns correctly-tagged output.

2. Fresh install (`rm -rf node_modules package-lock.json && npm install`) with every resolved URL against registry.561.group.

3. `npm test` green, pass count quoted verbatim.

4. Publish-gate passes (first publish, additive by construction).

5. jsnode confirms zero re-pins of any of the 10 existing @lenticule-science/communicating / @red-cup-engineering/communicating consumers.

## Section Map (Decomposition Target)

The communicating engine's 16 source clusters are distributed into topic sections according to their theory dependencies. The section map is ordered by strangler-lift safety, not extraction order; migration lots below sequence the actual extraction.

| Module | Target Section | New/Existing | Rationale |
|--------|-----------------|--------------|-----------|
| communicate/ shallow (meme, actions, morphisms, carriers, expressing, face) | semiotics-science-services-section/articulation-services-section | existing | CHL meme-transform terms are identical vocabulary articulation already hosts (four-corner-cell, predicating/positing/settling); child enriches parent; panini's ambiguity BEAT consumes this directly. |
| communicate/ deep (codec-actions, manifest-actions) | semiotics-science-services-section/articulation-services-section (scripts, distinct) | existing | Same directory as shallow in monolith but reaches into holography/parsing/algebra — genuinely different stratum. Flagged to prevent naive directory-split. |
| messaging/ protocol trio (cloudevents, didcomm, protocol-translate) | metroplat | existing | org-layering law #5: protocol faces never inside/beside science/function packages. Census flags this as least externally-anchored (no located consumer for didcomm/protocol-translate). Safest cross-custody move; metroplat's exact path must be located before Lot 9 executes. |
| messaging/ carriers (Channel, Speaker, Listener, Message, Uptake, withinCapacity) | linguistics-services-section/services/semiotics-services-section | existing | Bound to SemiosphereCarrier; semiotics already owns this theory. Live consumer (socializing/broadcast.mts) justifies landing rather than leaving indefinitely. |
| speaking/illocuting | linguistics-services-section/services/pragmatics-services-section | new | Speech-act theory (Austin/Searle force types) — missing fourth leg of syntax/semantics/pragmatics/semiotics quartet. Ordinary textbook vocabulary. |
| speaking/signifying | linguistics-services-section/services/semiotics-services-section | existing | Peircean sign-relation/semiosis carriers depend on nothing but relating; exactly what semiotics already names. Zero cross-cluster imports; safest strangler lift. |
| speaking/listening/algebra | linguistics-services-section/services/obsmetrological-linguistics-services-section | existing | Highest-consequence compat surface (all 5 fibers pin RawBundle/CompiledBundle/load via this subpath). charge.mts must be diffed against metrologic's ./bilattice/charge and ./obstruction/settling before landing — consume, never reimplement. |
| speaking/listening/codecs | linguistics-services-section/services/syntax-services-section | new | Language-neutral render()/renderArcs() rides with parsing rather than seeding its own micro-section. |
| speaking/listening/geometry | linguistics-services-section/services/semantics-services-section | existing | Lexical-semantics sense-graph similarity; semantics already carries this theory. Fully self-contained, zero cross-file imports. |
| speaking/listening/grounding | linguistics-services-section/services/pragmatics-services-section | new | Clark/Stalnaker common-ground update — same missing quartet leg as illocuting. Grouped there to minimize new-section count. |
| speaking/listening/judging/grammaticality | linguistics-services-section/services/syntax-services-section | new | Rule-based well-formedness over dependency arcs (textbook syntax); depends only on parsing. Direct backing for panini's ./grammaticality surface and provenance BEAT feature. |
| speaking/listening/observing | linguistics-services-section/services/syntax-services-section | new | Internal-only adapter (no external consumer, not package-exported). Rides with parsing. Flagged as possible dead-code finding for future dedicated pass. |
| speaking/listening/parsing (+ lambek.mts) | linguistics-services-section/services/syntax-services-section (lambek.mts as child citing CHL quartet research carrier) | new | Highest fan-in, highest blast-radius cluster. Extracted only after algebra proven stable. cohomology.mts must be diffed against metrologic's ./obstruction/settling before local retention — same duplication-avoidance as algebra/charge. |
| speaking/listening/understanding top-level (discourse-state, discourse-information, linking, referring) | linguistics-services-section/services/pragmatics-services-section | new | Discourse-state/reference-resolution is discourse pragmatics. Grouped with grounding and illocuting in one new section. |
| speaking/listening/understanding/semantics subdir (roles, scope, tense, presupposition, logical-form, polarity) | linguistics-services-section/services/semantics-services-section | existing | Exactly the theory semantics already names (intension/extension/two-dimensional-semantic-theory). Clean, already-justified reuse. |
| holography (read/settle) | linguistics-services-section/services/obsmetrological-linguistics-services-section | existing | Highest fan-out symbol pair (every fiber calls read/settle directly). Deliberately extracted LAST — gated on all dependencies surviving full post-extraction test cycle, since regression here is invisible until widest consumer exposure. |

## Migration Order: 12 Lots

The decomposition proceeds in 12 lots, sequencing both the wedge (panini's appearance and BEAT feature shipping) and the strangler-based distribution. All preconditions are local to the lot; inter-lot dependencies are stated explicitly.

**Lot 1: Panini v0 scaffold — SHIPPED**

Depends on: @lenticule-science/communicating@0.0.5 published and verified (confirmed this session: `npm view @lenticule-science/communicating version` → 0.0.5; local package.json at linguistics-services-section/lib/communicating/package.json matches; git commit de75d1bba18, 0 regressions in 70 prior tests).

Produces: @lenticule-science/panini with library+CLI face, exact-pinned to @lenticule-science/communicating 0.0.6, unmoved engine. Root export {load, read, settle} thinly re-exporting UNMOVED; plus apps/panini/bin/panini-cli.mjs.

Receiver: External developer/agent.

Gate: (1) 3-4 line quickstart runs end-to-end against copula/irregular-verb fixture, returns correctly-tagged output; (2) fresh install with every resolved URL at registry.561.group; (3) npm test green, pass count quoted; (4) publish-gate passes, additive only; (5) jsnode confirms zero re-pins of 10 existing @lenticule-science/communicating consumers.

Shipped: commit `8145205e2be9` — `@lenticule-science/panini` at `linguistics-services-section/apps/panini`, {load,read,settle} + CLI (`panini read`/`panini annotate`), 5/5 green (re-verified this pass, fresh `npm test`). Lots 2-12 below remain queued.

**Lot 2: Witness-per-token provenance (BEAT claim 1)**

Depends on: Lot 1, existing witness-journal-record-service unmoved.

Produces: reading.tokens[i].witness={rule,section,receiptId} landing as Datoms via witness-journal-record-service, not hand-rolled writer.

Receiver: Same developer/agent, plus witness-journal as inter-session memory.

Gate: Tests green; example sentence's token stream carries real resolvable receiptId (not placeholder); dated wiring receipt lands in panini/data/records/.

**Lot 3: Four-valued ambiguity + cohomology refusal-number (BEAT claim 2)**

Depends on: Lot 1, existing algebra/charge.mts + communicate/face.mts + articulating's four-corner-cell.mts and bigraded-cohomology.mts (all unmoved).

Produces: reading.tokens[i].charge ∈ {true,false,both,neither}; reading.cohomology.refusalNumber.

Receiver: Same developer/agent.

Gate: Genuinely ambiguous fixture (e.g., PP-attachment) returns 'both'/'neither' (not single-parse); fixture with real grammatical obstruction returns nonzero refusalNumber (not always-zero); jsnode_search confirms zero @561-group/memetic-processing-unit overlap to avoid standing up second charge/cohomology implementation.

**Lot 4: BEAT falsification assay**

Depends on: Lots 2-3.

Produces: Dated meet-then-beat receipt in panini/data/records/, running same falsification method the census used on incumbents against panini's actual shipped Reading object.

Receiver: Campaign go/no-go review.

Gate: BEAT is reported achieved only if assay confirms it — designed field is not proven claim until this lot closes.

**Lot 5: Locate distribution preconditions**

Depends on: Nothing new.

Produces: Dated locate-receipt confirming (1) metroplat's exact section path and publish-gate posture, (2) metrologic's exact ./bilattice/charge and ./obstruction/settling subpath names, (3) witnessed-field theory carrier's path (via markdown-vault), (4) semantic-record-journal-service's current API.

Receiver: Lots 6-12 below.

Gate: All four located on disk, none asserted from memory.

**Lot 6: Layer-0 strangler lifts (signifying, geometry, grounding, illocuting)**

Depends on: Lot 5.

Produces: semiotics-services-section gains signifying; semantics-services-section gains geometry; pragmatics-services-section created carrying grounding+illocuting. communicating's own index.mts re-pointed to re-export each from new home — no consumer symbol change.

Receiver: None re-pinned (strangler shim absorbs).

Gate: Publish-gate per package; communicating test suite green after each re-export swap; zero of 10 downstream consumers touched.

**Lot 7: Algebra strangler lift (highest-consequence compat surface)**

Depends on: Lot 6 stable, Lot 5's metrologic-subpath confirmation.

Produces: obsmetrological-linguistics-services-section gains algebra, with charge.mts wired to metrologic's ./bilattice/charge + ./obstruction/settling instead of local reimplementation; communicating re-exports legacy subpath string all 5 fibers pin.

Receiver: None re-pinned yet.

Gate: All 5 language fibers' unmodified parity.test.mts pass against re-exported subpath; RawBundle/CompiledBundle byte-identical; publish-gate additive-only.

**Lot 8: Syntax-services-section stands up (parsing, judging, codecs, observing)**

Depends on: Lot 7 stable.

Produces: New syntax-services-section. cohomology.mts diffed against metrologic's ./obstruction/settling before local retention.

Receiver: None re-pinned yet (strangler re-export).

Gate: Fresh-install tests green; publish-gate additive-only; all 5 fibers still pass unmodified.

**Lot 9: Pragmatics+semantics absorb understanding; communicate lands in articulation-services-section; messaging carriers land in semiotics; protocol trio moves to metroplat**

Depends on: Lot 8, Lot 5's metroplat-path confirmation.

Produces: Remaining section_map entries landed via strangler re-export. Protocol trio is real cross-custody handoff (recorded as finding, not silently absorbed).

Receiver: metroplat (protocol trio only).

Gate: Fresh-install tests green per package; metroplat suite green post-merge; publish-gate additive-only throughout.

**Lot 10: Holography strangler lift (riskiest cut, extracted last)**

Depends on: Lots 6-9 each survived one full post-extraction test cycle.

Produces: obsmetrological-linguistics-services-section gains holography (read/settle), communicating re-exports unchanged.

Receiver: None re-pinned yet.

Gate: All 5 fibers' parity tests (calling read/settle directly) pass unmodified.

**Lot 11: Opt-in consumer re-pin off strangler shim**

Depends on: Lot 10.

Produces: panini itself, plus animating/computing/feltos/socializing, re-pinned one at a time (migrate-consumer skill) from @lenticule-science/communicating directly onto new topic sections. Language fibers may remain on compat subpath indefinitely at zero cost. feltos's `import * as communicating` gets explicit runtime smoke test. gaming's listed-but-unused dependency independently reconfirmed dead before exclusion.

Receiver: Each consumer's own owning section.

Gate: Per-consumer fresh-install test green before and after re-pin.

**Lot 12: Retire the monoliths**

Depends on: Lot 11, jsnode_query confirming zero remaining importers of @lenticule-science/communicating and @red-cup-engineering/communicating tree-wide.

Produces: Both packages deleted (never deprecated); closing campaign receipt in linguistics-services-section/data/records/.

Receiver: The tree itself.

Gate: jsnode returns zero hits for both package names as declared dependencies anywhere before deletion.

## Binding Design Constraints (reconciled 2026-09-01)

This plan was produced twice, independently: by the design panel above (channel B)
and by the ringleading session's own architecture pass grounded in the full theory
corpus (channel A — closure-cones-and-proof-path-forests, the glass-sponge note,
the Witnessed Field working theory, the machine glossary). The two channels were
reconciled by the session, and per the glass-sponge note §16.4 the record of which
channel caught which defect is kept: channel B caught the BEAT over-claim (spaCy
Matcher `match_id` and NLTK CFG derivation trees are real partial provenance, so
the claim narrows to *default, whole-pipeline*), the two-strata structure of
`communicate/`, the feltos whole-namespace smoke-test risk, the demotion of
consent-gating to feature-until-measured, and the un-diffed duplication triangle;
channel A supplies the three constraints below, which bind every lot.

1. **Stage seams follow the placement law.** The decomposition boundaries are the
   theory's own four stages — articulate → predicate → posit → settle (the
   placement test in closure-cones §9.0) — with understanding (charge dynamics)
   and speech acts (charge exchange) above them. Each stage boundary hardens to
   the theory's typed carrier: Utterance → PredicationCell forest (with Lambek
   derivations retained — factorization is data, never erased) → Meme valuation →
   settled reading with cohomology receipt. Every stage output is thereby an
   addressable apex whose several projections (script output, app surface,
   protocol face) are legs that must show the same object.

2. **The Reading object is QMA-ready from Lot 2.** Panini is the front half of
   the firm's intended language model (the QMA shape: untrusted proposer, cheap
   trusted verifier). Therefore `reading.cohomology.obstructions[]` entries are
   shaped as typed questions — `{kind, locus, question, prerequisites}` —
   sufficient to form an RMN effect-cell proposal for the inference-dispatch
   market without re-parsing. v0 ships the shape; v1 wires obstruction → dispatch
   so a bought model may propose a tag, arc, or reading as an effect cell at
   FOUR-bottom, settled by the kernel, entering the valuation charged
   proposed-by-model/verified-by-kernel. The toolkit arena is the wedge; this
   seam is the summit.

3. **Duplication gates resolve toward the primitive.** Where Lots 3, 7, and 8
   find overlap between the engine's cohomology/charge code and metrologic's
   `./obstruction`, `./settling`, or `./bilattice/charge` subpaths (or the
   memetic-processing-unit's charge engine), the default direction is ruled:
   migrate the engine onto metrologic (primitives exist once, on the registry).
   If the diff shows metrologic lacks a needed capability, the capability is
   added to metrologic upstream through the publish gate — never kept as a
   private reimplementation. Only a diff proving semantic divergence (not mere
   API difference) may keep the code separate, and that outcome is recorded as a
   finding.

## Material Uncertainties

1. **Design-3's deferral under-executes the ruling.** Design 3 (the selected path) pushes full distribution into Lot 5 and beyond as demand-gated, not scheduled. This is an intentional trade against faster receiver-visible wedge (Lot 4). The program requires distribution; this plan schedules it (Lots 5-12), rejecting the indefinite deferral.

2. **Concurrent-edit risk has been independently verified resolved this session** (git commit de75d1bba18, published as 0.0.5, 0 regressions in 70 prior tests). Lot 1 should re-confirm no further concurrent edits have landed since before pinning.

3. **Structural twin duplication remains unresolved.** @lenticule-science/communicating vs @red-cup-engineering/communicating custody question is a census finding this plan does not decide. Record it as a finding; resolve custody direction only at Lot 11/12, never fix en passant earlier.

4. **Algebra and holography are highest-consequence compat surfaces.** Any field-shape drift during Lots 7 or 10 breaks all 5 fibers (plus @emsenn/communicating-in-lakota) simultaneously. Mitigated only by strangler re-export discipline (old names never change, implementation source only), never by coordinated cutover.

5. **Possible duplication in three places requires verification before Lots 3, 7, 8.**
   - Lot 3: @561-group/memetic-processing-unit's own bilattice-charge engine vs algebra's charge.mts.
   - Lot 7: metrologic's ./obstruction/settling vs algebra's charge.mts (duplication check).
   - Lot 8: metrologic's ./obstruction/settling vs parsing's cohomology.mts (duplication check).
   Neither the reuse nor the independence has been diffed; each lot carries explicit verification gate.

6. **BEAT claims are designed-for, not yet proven.** Lots 2-3 wire the fields; Lot 4's falsification assay proves or disproves. No session may report BEAT achieved on design strength alone.

7. **Corpus-consent gating excluded from BEAT claim.** Proposed as BEAT feature 4 in one design but never measured against incumbents. Shipping later as plain feature is fine; claiming beat is not, without dedicated meet-then-beat pass first.

8. **metroplat's exact path and publish-gate unconfirmed.** Lot 5 must locate before Lot 9's protocol-trio handoff. If metroplat cannot cleanly absorb trio without re-architecture, that piece becomes bounded sub-campaign rather than Lot 9.

9. **feltos's whole-namespace mount invisible to symbol diffing.** feltos's `import * as communicating` needs explicit runtime smoke test at Lot 11 re-pin, not just unit-test green. Removed root export could break it silently.

10. **Long migration (12 lots, 16 clusters, one cross-custody handoff).** Per usage-is-the-scarcest-resource law, proceeds lot-by-lot at ordinary solo-dev bandwidth, never multi-agent fan-out. Lots 5-12 should not open on schedule if bandwidth unavailable — the wedge (Lots 1-4) must not slip.

## Design Comparison Scores (three candidate paths evaluated)

**Design 1: Decompose-first (10 new/enriched sections, Lots 1-7 before panini ships at Lot 8)**

- Lawfulness: 8/10. Correctly applies org-layering law #5 (messaging protocols to metroplat), import stratification sound, section placements correct.
- Migration safety: 7/10. Old package stays published; each fiber can roll back individually, but Lot 6 is coordinated cutover of all 6 fiber-shaped consumers at once — real big-bang despite rollback safety, not true strangler at every step.
- Time-to-receiver-visible-wedge: 3/10. panini does not exist until Lot 8 of 10 — receiver waits through full decomposition before seeing anything. Fails meet-then-beat step 6.
- Honesty of risk register: 8/10. Thorough; names custody-direction assumption unconfirmed, metrologic-duplication check, memetic-processing-unit overlap, BEAT unassayed.

**Design 2: Quartet-shaped sections with progressive strangler re-export (9 lots, panini at Lot 8)**

- Lawfulness: 8.5/10. Best-organized section map; reuses existing sections (semantics, semiotics, obsmetrological-linguistics); correctly moves protocols to metroplat; flags semiotic-exchange-chain-services-section scope-change as custody finding rather than absorbing silently.
- Migration safety: 9/10. Strongest of three. communicating's root package re-pointed lot by lot to re-export from new sections, so every consumer never re-pins until optional deferred Lot 9; keeps strangler promise at every intermediate step, not just start/end.
- Time-to-receiver-visible-wedge: 3/10. Same failure as Design 1 — panini ships only after 7 lots decomposition.
- Honesty of risk register: 8.5/10. Most thorough — adds feltos whole-namespace-mount smoke-test risk and parallelization-breaks-guarantee risk neither other design names.

**Design 3: Wedge-first (panini at Lot 1 wrapping unmoved engine, BEAT Lots 2-4, full decomposition deferred indefinitely as demand-gated)**

- Lawfulness: 4/10. Weak point — barely executes the requirement to distribute communicating contents across many sections; pushes entirely into not-scheduled Lot 5 with no committed sequencing. Only small new consent-gate script created.
- Migration safety: 9/10. Trivially high since nothing moves in v0 (zero consumers touched); low relevance since so little actually migrates.
- Time-to-receiver-visible-wedge: 9/10. Standout — panini runnable and BEAT-bearing by Lot 4, directly satisfying meet-then-beat step 6's demand for fast receiver-visible wedge. This is the whole point of the discipline.
- Honesty of risk register: 8.5/10. Self-aware — flags consent-gate unverified against corpus, explicitly requires real falsification assay before claiming BEAT, correctly excludes consent-gating from incumbent-measured BEAT claim.

**Selected path:** This synthesis adopts Design 3's wedge-speed (Lots 1-4 before any decomposition begins, panini visible by Lot 4) and its honest risk register, but rejects its deferral of the second half of the ruling. The synthesized plan sequences distribution (Lots 5-12) immediately after the wedge closes and BEAT ships, not as indefinite future work. This respects both requirements while keeping the receiver-visible wedge as compact as Design 3 intended.

## See Also

- `lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/communication-science-services-section/services/linguistics-services-section/lib/communicating/package.json` — the communicating package being decomposed.
- org-layering law: `.claude/rules/org-layering.md` §3 (app/section composition); §5 (protocol custody).
- import-stratification law: `.claude/rules/import-stratification.md`.
- Metrologic precedent: `obsmetrological-services-section/apps/metrologic` (app over proof-tree sections).
- Witness-journal-record-service: (exact path to be located in corpus via markdown-vault).
- articulating's four-corner-cell: (exact path TBD, Lot 5).
- metrologic's bilattice/charge and obstruction/settling: (exact subpath TBD, Lot 5).
