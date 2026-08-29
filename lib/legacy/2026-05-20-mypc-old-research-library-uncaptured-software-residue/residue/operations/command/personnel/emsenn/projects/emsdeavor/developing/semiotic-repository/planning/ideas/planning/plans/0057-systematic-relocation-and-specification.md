---
title: "Systematic repository relocation and specification"
date-created: 2026-03-09T00:00:00
authors:
  - emsenn
  - claude
status: active
priority: high
depends-on: []
goal: "006"
milestone: ""
appetite: "large"
supersedes: "0044"
---

## Summary

Systematically review and relocate every published file in the
emsemioverse to its correct location, then specify the decision
procedures that prevent recurrence. Supersedes plan 0044 (relocation
sweep) by encompassing layer-level relocations as one phase of a
broader effort covering depth placement, content-type compliance,
discipline structure, and emsemioverse consolidation.

## Core principle

Files go with the most specific Thing they relate to. Specifications
can go under any Thing — there is no single "specifications namespace."
This is recursive: always drill to the most specific home.

Corollary: `technology/specifications/` holds only specs about
technology-in-general (e.g., `specification-specification`). The
semiotic-* specs are correctly under `agential-semioverse/specifications/`
because they specify aspects of the agential semioverse. References
that say `technology/specifications/semiotic-*` are wrong.

## Motivation

Content accretes where it is produced, not where it belongs. Current
state:

- 53% of text-typed files are outside `texts/` directories
- 22% of concept-typed files are outside `concepts/` directories
- 95 root-level terms in sociology (should be under schools)
- 43 root-level terms in philosophy (should be under disciplines)
- 18 root-level terms in medicine (should be under modalities)
- ASR theory/ contains agential-semioverse-level mathematics
- 79% of emsemioverse references are outside their proper directories
- AGENTS.md and dependency map use wrong paths for specs

## Standing rules

1. Do NOT edit any `index.md` until Phase 5
2. Do NOT edit any hyperlinks in file bodies until Phase 5
3. Do NOT touch `triage/`, `private/`, `.obsidian/`
4. Use `git mv` for all relocations
5. Update frontmatter on moved files (`part-of`, `date-updated`);
   leave body content unchanged
6. One scope-area per work session
7. Log progress in this plan's Log section
8. When uncertain, leave file in place, record uncertainty
9. `slop/` files stay in slop unless emsenn promotes them
10. Fix-as-you-go: when you encounter a clearly misplaced or malformed
    file during any work, fix it immediately rather than deferring.
    See `practices/fix-as-you-go.md`. Do not let it expand into a sweep.
11. The canonical directory types (from decision 0009) are:
    governing: methods/, practices/, standards/
    engaging:  learning/, researching/, applying/
    situating: disciplines/, schools/, lineages/
    defining:  topics/, concepts/, terms/
    Plus: plans/, skills/, questions/, decisions/ as structural types.
    Old types `specifications/`, `texts/research/`, `texts/civil/`,
    `curricula/` are superseded. Specifications are now
    `thing/practices/specification.md` (the practice-face of a Thing).
    `standards/` groups conventions a Thing uses or creates.

## Phase 0: Specify the decision procedures

Write the specs that guide all subsequent work.

### 0A: File location decision procedure

Add to directory-organization spec: given a file with known type and
subject, where does it go?

1. Identify the most specific Thing this file is about
2. Find or create that Thing's directory
3. Place in the appropriate content-type subdirectory per decision 0009:
   term → terms/, concept → concepts/, topic → topics/,
   policy → policies/, skill → skills/{name}/, plan → plans/,
   decision → decisions/, question → questions/
   learning content → learning/ (was curricula/)
   research content → researching/ (was texts/research/)
   applied content → applying/ (new)
   conventions/standards → standards/ (was specifications/)
   specification for a Thing → thing/practices/specification.md
4. Files that merely reference a Thing stay with what they're about
5. Created-here principle: Things derived from another Thing go under
   that Thing's directory, not under their nominal discipline

### 0B: Directory type reference

The four-group structure (decision 0009, knowing-semioverse standard):
- governing: methods/, practices/, standards/
- engaging: learning/, researching/, applying/
- situating: disciplines/, schools/, lineages/
- defining: topics/, concepts/, terms/

Normative specification:
`information/disciplines/knowledge-systems/standards/knowing-semioverse/practices/specification.md`

### 0C: Fix path references, write decision record

Update AGENTS.md and dependency map to use physical paths. Record as
decision 0008.

## Phase 1: Layer-level relocation

Move content to its correct conceptual layer per the dependency map.

### 1A: ASR spec → Agential Semioverse

Relocate theory/ files that define the agential semioverse as a
mathematical object: multi-agent-coordination, agent-skill-interaction,
skill-manifests, work-units-and-chains, work-unit-lifecycle,
coordination-patterns, prompt-routing, error-envelopes.

Relocate concepts: skill-maturity, closure-pressure (possibly to
semiotic-universe level).

Retain in ASR: directory-organization, semantic-frontmatter,
predicate-graph, plans, skills, scripts, domain-specific ASR refs.

### 1B: Semiotic-endeavor audit

Verify each file in concepts/semiotic-endeavor/ is with its most
specific Thing.

### 1C: Layers 2-3 audit

Quick check of interactive-semioverse and semiotic-universe.

## Phase 2: Depth + type compliance (discipline by discipline)

Every file at correct depth AND in correct content-type subdirectory.
Mathematics is the model: root terms/ holds only meta-theoretical
terms; domain-specific terms go under disciplines/{sub}/terms/.

The normative reference for directory types is the knowing-semioverse
specification at `information/disciplines/knowledge-systems/standards/
knowing-semioverse/practices/specification.md` (decision 0009).

Priority: sociology (95 floating terms), philosophy (43),
medicine (18), technology, personal, mathematics, remaining.

Per discipline: for each root-level file, determine if it belongs
under a specific subdiscipline/school/topic. Move it there. Then
verify content-type directory against the knowing-semioverse types.
Create new subdirectories as needed.

## Phase 3: Discipline structure audit

Every discipline has standard structure; no loose files at roots.
Evaluate empty directories (domestic/ vs domesticity/, tags/,
scripts/). Add AGENTS.md where justified.

## Phase 4: Emsdeavor/emsemioverse consolidation

The ~95 scattered emsemioverse references homed properly.
Practice content → personal/projects/emsdeavor/emsemioverse/.
Theory content → agential-semioverse/concepts/semiotic-endeavor/.
Spec content → that spec's directory.
Mere references → stay where they are.

## Phase 5: Cross-reference and index cleanup

Fix all broken references from Phases 1-4. Intentionally last.
Broken-link scan, update part-of fields, update index.md files,
fix technology/specifications/index.md, update AGENTS.md,
update dependency map.

## Phase 6: Specify to prevent recurrence

Finalize directory-organization spec with knowing-semioverse types.
Plans 0059 (standards deviation measurement) and 0060 (AGENTS.md
routing chain to locate-file skill) are the primary vehicles for
enforcement and placement assistance. Update file-creation skills
to consult the locate-file skill (plan 0060 Phase 3). Write decision
record documenting architectural choices from the sweep. Mark plan
0044 as superseded.

## Done when

- Every published file is in its correct location per the decision
  procedure
- The decision procedure is specified in the directory-organization spec
- All cross-references and index files are updated
- A placement validation skill exists
- The AGENTS.md and dependency map use correct physical paths
- Plan 0044 is marked superseded

## Dependencies

Benefits from completed plan 0045 (conceptual dependency mapping).
Coordinates with plan 0033 (semiotic specification family) for spec
placement decisions.

## Log

2026-03-09 — Created. Supersedes plan 0044. Based on systematic
audit: 53% of texts misplaced, 95 sociology terms floating at root,
43 philosophy terms floating, ASR theory/ containing Layer 4 math,
AGENTS.md using wrong spec paths. Core principle from emsenn: files
go with the most specific Thing they relate to. Phase 0 (specification
writing) is first priority.

2026-03-09 — Phase 0 complete.
- 0A: Created semiotic-directory-layout specification at
  agential-semioverse-repository/specifications/semiotic-directory-layout/
  with full placement procedure (§1-§5) and worked examples.
- 0B: Text subtype convention (research/civil) included in §4 of the
  semiotic-directory-layout spec.
- 0C: Fixed all wrong path references in AGENTS.md (content repo) and
  CLAUDE.md (parent repo) — replaced technology/specifications/ paths
  with actual physical paths under agential-semioverse/. Fixed
  conceptual dependency map node and cross-cutting source paths.
  Wrote decision record 0008 (canonical paths are physical).

2026-03-09 — Phase 1A in progress. Classified all 18 ASR theory/ and
concepts/ files. Relocated 10 files:
- 6 theory files to agential-semioverse/theory/: multi-agent-coordination,
  work-unit-lifecycle, work-units-and-chains, skill-manifests (+.ttl),
  error-envelopes, coordination-patterns
- 4 concept files to agential-semioverse/concepts/: closure-pressure,
  composite-semioverse, policy, skill-maturity
- 8 files confirmed as staying in ASR spec (implementation-specific):
  agent-skill-interaction, conditional-skill-invocation,
  domain-specific-content, implementation-correspondence,
  operational-closure, prompt-routing, questions-as-first-class-objects,
  file-quality-score
- Observation: universe directories (semiotic-universe, interactive-
  semioverse, agential-semioverse) are flat siblings under universes/
  but conceptually should nest. Noted as future structural work.
- Phases 1B (semiotic-endeavor audit) and 1C (Layers 2-3 audit) remain.

2026-03-09 — Phase 1B complete. Audited all 24 files in
concepts/semiotic-endeavor/ module. 23 correctly placed. 1 structural
fix: relocated semiotic-endeavor-specification/ from nested under
concepts/semiotic-endeavor/specifications/ to
specifications/semiotic-endeavor-specification/ (sibling of
semiotic-endeavor, per three-level naming convention decision 0005).
Updated part-of frontmatter. Removed empty specifications/ directory.
Body hyperlinks deferred to Phase 5.

2026-03-09 — Phase 1C complete. Audited all 57 files across Layers 2-3:
semiotic-universe (31 files) and interactive-semioverse (26 files). All
correctly placed — no relocations needed.

2026-03-09 — Phase 1 complete. Summary:
- 1A: 10 files relocated (6 theory, 4 concepts) from ASR spec to
  agential-semioverse; 8 confirmed staying in ASR spec
- 1B: 1 structural relocation (semiotic-endeavor-specification)
- 1C: 0 relocations needed (Layers 2-3 clean)
- Total: 11 files relocated, 0 data loss, body hyperlinks deferred
  to Phase 5
- Ready for Phase 2 (depth + type compliance, discipline by discipline)


2026-03-09 - Phase 2 sociology pass complete (first pass, safe moves
only).
- Relocated 29 files with `git mv` and updated moved-file frontmatter
  (`date-updated`, `part-of`).
- Created minimal directories and index files for new homes:
  `schools/abolition/`, `schools/postliberalism/`,
  `schools/autonomism/terms/`,
  `schools/autonomism/schools/operaismo/`,
  `topics/settler-colonialism/{terms,concepts}/`,
  `topics/state-repression/{terms,texts}/`.
- School moves:
  `anarchism` -> `schools/anarchism/terms/`;
  `abolition` -> `schools/abolition/terms/`;
  `postliberalism` -> `schools/postliberalism/terms/`;
  autonomism cluster -> `schools/autonomism/terms/`
  (`care-work`, `class-composition`, `general-intellect`,
  `refusal-of-work`, `social-reproduction`);
  `operaismo` -> `schools/autonomism/schools/operaismo/terms/`;
  cybernetic-postliberalism cluster -> its `terms/` and `texts/`
  (`epistemic-overclosure`, `informational-malfunction`,
  `structural-contradiction`, and 2 related texts).
- Topic moves:
  settler-colonialism cluster -> its `terms/` and `concepts/`
  (`decolonization`, `grounded-normativity`,
  `indigenous-resurgence`, `indigenous-sovereignty`,
  `knowledge-sovereignty`, `land-back`, `settler-colonialism`,
  `settler-moves-to-innocence`, `colonial-botany`);
  state-repression cluster -> its `terms/` and `texts/`
  (`cointelpro`, `counterinsurgency`, `snitch-jacketing`,
  `surveillance`, `citing-for-containment`,
  `tilf-charges-complaint-analysis`).
- Remaining sociology root counts after this pass:
  70 terms, 3 concepts, 4 texts (excluding `index.md` files).
- Left in place as uncertain or genuinely broader:
  political-economy terms (`capitalism`, `commodity-fetishism`,
  `exchange-value`, `surplus-value`, etc.); terms that already have
  school-specific parallel versions under `schools/anarchism/`;
  queer/feminist boundary terms (`cruel-optimism`, `precarity`,
  `feeling-rules`, etc.); broader theory clusters
  (`late-liberalism`, `economies-of-abandonment`,
  `organized-abandonment`, `biopolitics`, `governmentality`,
  `necropolitics`, etc.).
- Body hyperlinks intentionally left unchanged for Phase 5.

2026-03-09 - Phase 2 philosophy pass complete (first pass, safe moves
only).
- Relocated 24 files with `git mv` and updated moved-file frontmatter
  (`date-updated`, `part-of`).
- Created minimal directories and index files for new homes:
  `disciplines/epistemology/`, `disciplines/metaphysics/`,
  `disciplines/ontology/`, `disciplines/phenomenology/`,
  `disciplines/nihilism/terms/`, and `topics/ontological-turn/terms/`.
- Existing-home moves:
  nihilism cluster -> `disciplines/nihilism/terms/`
  (`absurdism`, `active-nihilism`, `existentialism`, `nihilism`);
  process-philosophy cluster -> `disciplines/process-philosophy/terms/`
  (`individuation`, `intra-action`, `metastability`);
  analytic-philosophy cluster -> `disciplines/analytic-philosophy/terms/`
  (`intertheoretic-reduction`, `law-of-excluded-middle`,
  `mathematical-constructivism`, `provenness`);
  ontological-turn cluster -> `topics/ontological-turn/terms/`
  (`animism`, `multinaturalism`, `ontological-turn`,
  `perspectivism`).
- New-discipline moves:
  `epistemology` -> `disciplines/epistemology/terms/`;
  metaphysics cluster -> `disciplines/metaphysics/terms/`
  (`metaphysics`, `materialism`, `contingency`);
  ontology cluster -> `disciplines/ontology/terms/`
  (`ontology`, `mereology`, `ontologization`,
  `relational-ontology`);
  `phenomenology` -> `disciplines/phenomenology/terms/`.
- Remaining philosophy root counts after this pass:
  18 terms, 0 concepts, no root `texts/` directory.
- Left in place as uncertain or already paralleled elsewhere:
  broad critical-theory terms with existing school-specific versions
  (`geontologies`, `quasi-event`);
  terms likely needing future homes in political philosophy, queer
  theory, postcolonial thought, psychoanalysis, or adjacent schools
  (`grievability`, `reproductive-futurism`, `opacity`,
  `libidinal-investment`, `procedural-liberalism`, etc.);
  broader cross-cutting terms (`dialectics`, `constructivism`,
  `symbolic-act`, `simulacra`, `polyvalence`, etc.).
- Body hyperlinks intentionally left unchanged for Phase 5.

2026-03-09 - Phase 2 medicine pass complete (first pass, safe moves
only).
- Relocated 13 files with `git mv` and updated moved-file frontmatter
  (`date-updated`, `part-of`).
- Created minimal directories and index files for new homes:
  `disciplines/public-health/`,
  `disciplines/public-health/terms/`,
  `disciplines/psychology/terms/`,
  `disciplines/traditional-chinese-medicine/terms/`.
- Modality moves:
  traditional-chinese-medicine cluster ->
  `disciplines/traditional-chinese-medicine/terms/`
  (`jing`, `qi`, `san-bao`, `shen`, `wu-xing`, `yin-yang`);
  psychology cluster -> `disciplines/psychology/terms/`
  (`affect`, `attachment`, `defense-mechanism`,
  `therapeutic-alliance`, `trauma`);
  public-health cluster -> `disciplines/public-health/terms/`
  (`harm-reduction`, `syndemic`).
- Remaining medicine root counts after this pass:
  4 terms, 0 concepts, no root `texts/` directory.
- Left in place as uncertain or cross-cutting:
  disability/access cluster (`access-intimacy`,
  `disability-justice`) and Esposito-derived theory terms
  (`communitas`, `immunitas`).
- Body hyperlinks intentionally left unchanged for Phase 5.

2026-03-09 - Phase 2 technology audit complete.
- No root `terms/` directory, no floating root `concepts/`, and only
  one root `text`.
- Root structure is effectively compliant already.
- One unresolved collision left in place:
  `technology/texts/what-makes-a-web-platform-robust.md` appears to be
  a parallel copy of
  `technology/disciplines/computing/concepts/internet/texts/civil/what-makes-a-platform-robust.md`.
  Left in place for a later deduplication decision rather than
  overwriting an existing text during Phase 2.

2026-03-09 - Phase 2 personal pass complete (first pass, safe moves
only).
- Relocated 25 files with `git mv` and updated moved-file frontmatter
  (`date-updated`, `part-of`).
- Created minimal directories and index files for new homes:
  `about/terms/`, `writing/terms/`,
  `projects/emsdeavor/emsemioverse/terms/`.
- Writing moves -> `personal/writing/terms/`
  (`babble-by-emsenn`, `my-babbles`, `my-letter-to-the-web`,
  `my-letters-to-the-web`, `my-essays`,
  `my-philosophical-writing`, `my-writing`,
  `my-writing-style`).
- About moves -> `personal/about/terms/`
  (`burdock`, `emsenn`, `emsenn-kolektiva-social`,
  `emsenn-s-omnibook`, `my-authority`,
  `my-corporate-person`, `my-fediverse-profile`, `my-friend`,
  `my-intellectual-practice`, `my-public-image`,
  `my-research`, `my-work`).
- Emsemioverse moves ->
  `personal/projects/emsdeavor/emsemioverse/terms/`
  (`emsean`, `emsean-analysis`, `emsean-paracosm`,
  `emsean-thought`, `emsiverse`).
- Remaining personal root counts after this pass:
  29 terms, 0 concepts, no root `texts/` directory.
- Left in place as uncertain or requiring narrower future homes:
  account/service terms (`my-ko-fi`, `my-substack`,
  `my-facebook-profile`);
  device/object terms (`my-smartphone`, `my-thermos`,
  `my-tech-stack`, `my-mud-engine`);
  project/log terms (`my-gtao-empire`, `my-music-log`,
  `my-television-log`, `my-personal-project`,
  `2025-relaunch-of-emsenn-net`);
  worldview/placeholders (`my-ethics`, `my-ethos`,
  `my-metaphysics`, `my-ontology`, `my-praxis`,
  `my-position`, `my-research-method`, `terran`, etc.).
- Body hyperlinks intentionally left unchanged for Phase 5.

2026-03-09 - Phase 2 mathematics pass complete (first pass, safe moves
only).
- Relocated 6 files with `git mv` and updated moved-file frontmatter
  (`date-updated`, `part-of`).
- Added `type: text` to moved mathematics texts that were missing it.
- Created minimal directories and index files for new homes:
  `concepts/fragment-calculus/{terms,texts}/`,
  `concepts/reflexive-calibration/{terms,texts}/`,
  `concepts/shaggy-dog-spectrality/texts/`.
- Concept moves:
  fragment-calculus cluster ->
  `mathematics/concepts/fragment-calculus/`
  (`illicit-globalism`, `tension-index`,
  `fragment-calculus.md`);
  reflexive-calibration cluster ->
  `mathematics/concepts/reflexive-calibration/`
  (`reflexive-calibration.md` term and text);
  shaggy-dog-spectrality text ->
  `mathematics/concepts/shaggy-dog-spectrality/texts/`.
- Remaining mathematics root counts after this pass:
  0 terms, 0 concepts, 0 texts (excluding `index.md` files).
- Root mathematics is now index-only at Phase 2 depth.
- Body hyperlinks intentionally left unchanged for Phase 5.

2026-03-09 - Phase 2 business pass complete (safe moves only).
- Relocated 38 root business terms with `git mv` and updated
  moved-file frontmatter (`date-updated`, `part-of`).
- Created minimal directories and index files for new homes:
  `disciplines/finance/`, `disciplines/operations/`,
  `disciplines/marketing/`, `disciplines/strategy/`,
  `disciplines/human-resources/`, and `topics/negotiation/`.
- Accounting moves:
  `bookkeeping`, `fifo`, `gross-margin`, `net-income`,
  `operating-expenses`, and `payroll` ->
  `disciplines/accounting/terms/`.
- Finance moves:
  `break-even-analysis`, `cash-conversion-cycle`, `collateral`,
  `debt-service`, `financial-projections`, `line-of-credit`,
  `pro-forma`, `use-of-funds`, and `working-capital` ->
  `disciplines/finance/terms/`.
- Operations moves:
  `average-check`, `capacity-utilization`, `inventory`,
  `inventory-turnover`, `labor-cost`, `menu-engineering`,
  `point-of-sale`, `standard-operating-procedures`, and
  `supply-chain` -> `disciplines/operations/terms/`.
- Marketing moves:
  `customer-acquisition-cost`, `market-analysis`, `marketing-plan`,
  `pricing-strategy`, and `target-market` ->
  `disciplines/marketing/terms/`.
- Strategy moves:
  `competitive-analysis`, `corporate-structure`, `exit-strategy`,
  `revenue-model`, `risk-mitigation`, and `swot-analysis` ->
  `disciplines/strategy/terms/`.
- Human-resources moves:
  `at-will-employment` and `progressive-discipline` ->
  `disciplines/human-resources/terms/`.
- Topic move:
  `batna` -> `topics/negotiation/terms/`.
- Remaining business root counts after this pass:
  13 terms, 0 concepts, no root `texts/` directory.
- Left in place:
  10 accounting filename collisions already represented under
  `disciplines/accounting/terms/`
  (`accounts-payable`, `accounts-receivable`, `accrual-accounting`,
  `balance-sheet`, `bank-reconciliation`, `cash-flow-statement`,
  `chart-of-accounts`, `cost-of-goods-sold`, `depreciation`,
  `income-statement`) plus the uncertainty cluster
  `business-insurance`, `commercial-lease`, and `franchise`.
- Body hyperlinks intentionally left unchanged for Phase 5.

2026-03-09 - Phase 2 writing pass complete (safe moves only).
- Relocated 55 root writing terms with `git mv` and updated
  moved-file frontmatter (`date-updated`, `part-of`).
- Created minimal `terms/` directories and index files for existing
  topic homes:
  `topics/plain-language/terms/`,
  `topics/rhetoric-and-composition/terms/`, and
  `topics/language-and-power/terms/`.
- Plain-language moves:
  `accessibility`, `cognitive-load`, `document-design`,
  `paramedic-method`, `plain-language-movement`,
  `progressive-disclosure`, `protocol-aided-audience-analysis`,
  `readability`, `task-analysis`, `think-aloud-protocol`, and
  `usability-testing` -> `topics/plain-language/terms/`.
- Rhetoric-and-composition moves:
  `allusion`, `analogy`, `anaphora`, `audience`, `cliche`,
  `coherence`, `cohesion`, `connotation`,
  `constraint-based-composition`, `denotation`, `diction`, `ethos`,
  `euphemism`, `figurative-language`, `genre`, `hyperbole`, `irony`,
  `logos`, `multimodal-composition`, `parallelism`, `pathos`,
  `personification`, `rhetoric`, `style`, `subtext`, `syntax`,
  `tone`, `transition`, `voice`, and `writer-based-prose` ->
  `topics/rhetoric-and-composition/terms/`.
- Essay-writing moves:
  `argumentative-essay`, `draft`, `essay`, `freewriting`, `hook`,
  `revision`, and `thesis` ->
  `disciplines/essay-writing/terms/`.
- Technical-writing moves:
  `content-strategy` and `information-architecture` ->
  `disciplines/technical-writing/terms/`.
- Language-and-power moves:
  `discourse-community`, `jargon`, `official-style`, and
  `translingual-writing` -> `topics/language-and-power/terms/`.
- Poetry move:
  `poem` -> `disciplines/poetry/terms/`.
- Remaining writing root counts after this pass:
  10 terms, 0 concepts, 1 root text (`style-guide.md`).
- Left in place:
  filename collisions with existing specialized homes
  (`exposition`, `imagery`, `pacing`, `style-guide`) plus the
  uncertainty cluster `cognitive-poetics`, `first-order-thinking`,
  `minimalism`, `narrative-identity`, `paragraph`, and `register`.
- Body hyperlinks intentionally left unchanged for Phase 5.

2026-03-09 - Phase 2 sociology pass complete (second pass, structural
refinement).
- Relocated 20 sociology files with `git mv` and updated moved-file
  frontmatter (`date-updated`, `part-of`).
- Refined sociology's internal structure rather than only using
  existing homes:
  created `schools/marxism/terms/` and a new
  `schools/marxism/schools/gramscian/` subtree with `terms/` and
  `texts/`.
- Marxism moves:
  `alienation`, `class-struggle`, `commodity-fetishism`,
  `exchange-value`, `historical-materialism`,
  `primitive-accumulation`, `reification`, `surplus-value`,
  `use-value`, `vanguardism`, and `wage-labor` ->
  `schools/marxism/terms/`.
- Gramscian moves:
  `hegemony` and `organic-intellectual` ->
  `schools/marxism/schools/gramscian/terms/`;
  `gramscis-organic-intellectual-in-the-post-snowden-era.md` ->
  `schools/marxism/schools/gramscian/texts/`.
- State-repression moves:
  `biopolitics`, `economies-of-abandonment`, `governmentality`,
  `necropolitics`, `organized-abandonment`, and `panopticism` ->
  `topics/state-repression/terms/`.
- Remaining sociology root counts after second pass:
  51 terms, 3 concepts, 4 texts.
- Left in place:
  anarchism collision cluster with already-existing anarchism-specific
  copies (`affinity-group`, `anarcho-nihilism`, `direct-action`,
  `dual-power`, `federation`, `green-anarchism`,
  `insurrectionary-anarchism`, `mutual-aid`,
  `prefigurative-politics`, `propaganda-of-the-deed`, `recuperation`,
  `refusal`, `the-state`, and related generic terms such as
  `capitalism`, `colonialism`, `ideology`, `labor`, `property`);
  broader political-economy and social-theory terms
  (`commons`, `communication`, `institution`, `media`, `narrative`,
  `risk`, etc.); and the queer/affect cluster
  (`cruel-optimism`, `precarity`, `slow-death`).
- Body hyperlinks intentionally left unchanged for Phase 5.

2026-03-09 - Phase 2 sociology pass complete (third pass, parallel
definitions allowed).
- Applied revised placement rule from emsenn:
  same-named terms at different levels are valid parallel definitions,
  so existing school-level files no longer block more specific
  relocations unless the exact target path already exists.
- Relocated 31 sociology files with `git mv` and updated moved-file
  frontmatter (`date-updated`, `part-of`).
- Created new sociology homes:
  `schools/affect-theory/`,
  `schools/affect-theory/schools/berlant/`,
  `schools/black-radical-tradition/`,
  `topics/political-economy/terms/`,
  `topics/settler-colonialism/texts/`,
  and new anarchist subschools
  `green-anarchism/`, `indigenous-anarchism/`,
  `insurrectionary-anarchism/`.
- Anarchism moves:
  `anarcho-nihilism` ->
  `schools/anarchism/schools/anarcho-nihilism/terms/`;
  `green-anarchism`, `indigenous-anarchism`,
  `insurrectionary-anarchism` -> their new subschool `terms/`;
  `horizontal-organization` -> `schools/anarchism/terms/`;
  `communication`, `media`, `narrative`, and `propaganda` ->
  `schools/anarchism/schools/anarchist-communication/terms/`.
- Affect-theory moves:
  `feeling-rules` and `precarity` ->
  `schools/affect-theory/terms/`;
  Berlant cluster `affective-infrastructure`, `cruel-optimism`,
  and `slow-death` ->
  `schools/affect-theory/schools/berlant/terms/`.
- Political-economy moves:
  `capitalism`, `commons`, `enclosure`, `imperialism`,
  `neoliberalism`, `pareto-condition`,
  `principal-agent-problem`, `property`, and `reciprocity` ->
  `topics/political-economy/terms/`.
- Postliberal/cybernetic moves:
  `friend-enemy-distinction` and `producerism` ->
  `schools/postliberalism/terms/`;
  `hypernormalization` ->
  `schools/cybernetic-postliberalism/terms/`.
- Black-radical-tradition moves:
  `racial-capitalism` and `undercommons` ->
  `schools/black-radical-tradition/terms/`;
  `black-radical-tradition-and-russian-semiotics.md` ->
  `schools/black-radical-tradition/texts/`.
- Settler-colonialism move:
  `liberal-anarchism-is-incommensurate-with-decolonization.md` ->
  `topics/settler-colonialism/texts/`.
- Remaining sociology root counts after third pass:
  22 terms, 3 concepts, 2 texts.
- Left in place:
  the residual anarchist-strategy cluster
  (`affinity-group`, `direct-action`, `dual-power`, `federation`,
  `mutual-aid`, `prefigurative-politics`,
  `propaganda-of-the-deed`, `recuperation`, `refusal`,
  `the-state`);
  broader social-theory terms (`institution`, `practice`, `risk`,
  `ideology`, `labor`, `kinship`);
  unresolved general-political terms
  (`american-jeremiad`, `attribution-theory`, `communism`,
  `colonialism`, `late-liberalism`, `spectacle`);
  and root concepts/texts requiring a later dedicated pass.
- Body hyperlinks intentionally left unchanged for Phase 5.

2026-03-09 - Phase 2 sociology pass complete (fourth pass, anarchism
topic refinement).
- Relocated 9 sociology term files with `git mv` and updated
  moved-file frontmatter (`date-updated`, `part-of`).
- Created new sociology homes under
  `schools/anarchism/topics/organization/`,
  `schools/anarchism/topics/strategy/`, and
  `schools/anarchism/topics/state/`, each with minimal `index.md`
  plus `terms/index.md`.
- Organization moves:
  `affinity-group`, `federation`, `mutual-aid`, and
  `prefigurative-politics` ->
  `schools/anarchism/topics/organization/terms/`.
- Strategy moves:
  `direct-action`, `dual-power`, `propaganda-of-the-deed`, and
  `refusal` ->
  `schools/anarchism/topics/strategy/terms/`.
- State move:
  `the-state` -> `schools/anarchism/topics/state/terms/`.
- Remaining sociology root counts after fourth pass:
  13 terms, 3 concepts, 2 texts.
- Left in place:
  broader social-theory terms (`institution`, `practice`, `risk`,
  `ideology`, `labor`, `kinship`);
  unresolved general-political terms
  (`american-jeremiad`, `attribution-theory`, `communism`,
  `colonialism`, `late-liberalism`, `spectacle`);
  and the remaining ambiguity case `recuperation`,
  plus root concepts/texts requiring a later dedicated pass.
- Body hyperlinks intentionally left unchanged for Phase 5.

2026-03-09 - Phase 2 information pass complete.
- Relocated 10 information term files with `git mv` and updated
  moved-file frontmatter (`date-updated`, `part-of`).
- Created new information homes:
  `disciplines/cybernetics/terms/` and
  `disciplines/information-theory/terms/`, with minimal new indexes.
- Cybernetics moves:
  `autopoiesis`, `cybernetic-feedback`, `cybernetics`,
  `reflexive-deficit`, `requisite-variety`,
  `second-order-cybernetics`,
  `single-loop-double-loop-learning`,
  `structural-coupling`, and `viable-system-model` ->
  `disciplines/cybernetics/terms/`.
- Information-theory move:
  `mutual-information` ->
  `disciplines/information-theory/terms/`.
- Remaining information root counts after pass:
  8 terms, 1 concept, 0 texts.
- Left in place:
  repository-meta type terms (`concept`, `discipline`, `school`,
  `term`, `text`, `topic`);
  ambiguous cross-cutting terms (`cognitive-capitalism`,
  `programmability`);
  and the root concept `biomedical-ontologies`, which appears to
  belong under `knowledge-systems` but was left untouched because that
  subtree is already concurrently in flux.
- Body hyperlinks intentionally left unchanged for Phase 5.

2026-03-09 - Phase 2 biology pass complete.
- Relocated 16 biology files with `git mv` and updated moved-file
  frontmatter (`date-updated`, `part-of`).
- Created new biology homes:
  `disciplines/genetics/terms/`,
  `disciplines/ecology/terms/`,
  `disciplines/evolutionary-biology/concepts/`,
  `disciplines/evolutionary-biology/terms/`,
  `disciplines/developmental-biology/concepts/`,
  `disciplines/physiology/terms/`,
  and `disciplines/ethology/concepts/`, with minimal new indexes.
- Botany moves:
  `photosynthesis` and `tropism` ->
  `disciplines/botany/terms/`.
- Physiology moves:
  `homeostasis` and `metabolism` ->
  `disciplines/physiology/terms/`.
- Genetics moves:
  `dna`, `gene`, and `phenotype` ->
  `disciplines/genetics/terms/`.
- Ecology moves:
  `ecosystem` and `symbiosis` ->
  `disciplines/ecology/terms/`.
- Evolutionary-biology moves:
  `adaptation` and `species` ->
  `disciplines/evolutionary-biology/terms/`;
  `evolution` and `natural-selection` ->
  `disciplines/evolutionary-biology/concepts/`.
- Developmental-biology move:
  `morphogenesis` ->
  `disciplines/developmental-biology/concepts/`.
- Ethology move:
  `umwelt` -> `disciplines/ethology/concepts/`.
- Type-compliance move:
  `biological-individuality-as-relational-process.md`
  moved from `biology/texts/` to `biology/topics/` because its
  frontmatter declares `type: topic`.
- Remaining biology root counts after pass:
  4 terms, 1 concept, 0 texts.
- Left in place:
  broadly general biology terms (`cell`, `enzyme`, `organism`,
  `reproduction`) and the specialized cross-disciplinary concept
  `combinatorial-scent-mereology`.
- Body hyperlinks intentionally left unchanged for Phase 5.

2026-03-09 - Phase 2 media pass complete.
- Relocated 9 media term files with `git mv` and updated moved-file
  frontmatter (`date-updated`, `part-of`).
- Created minimal new term indexes under
  `topics/worldbuilding/terms/` and `topics/zines/terms/`.
- Worldbuilding moves:
  `worldbuilding`, `paracosm`, `secondary-world`, `storyworld`,
  `relational-worlding`, `praxonic-worldbuilding`, and `lore` ->
  `topics/worldbuilding/terms/`.
- Zines moves:
  `zine` and `zinefest` -> `topics/zines/terms/`.
- Remaining media root counts after pass:
  3 terms, 0 concepts, 3 texts.
- Left in place:
  broader narrative/media terms (`canon`, `continuity`, `diegesis`)
  and root texts (`baseball-cap-as-crown-and-code`,
  `describing-the-zombie`, `hoodies-as-history`) pending a later
  topic-specific pass.
- Body hyperlinks intentionally left unchanged for Phase 5.

2026-03-09 - Phase 2 music pass complete.
- Relocated 7 music term files with `git mv` and updated moved-file
  frontmatter (`date-updated`, `part-of`).
- Music-theory moves:
  `harmony`, `improvisation`, `intonation`, `melody`,
  `rhythm`, `timbre`, and `tonality` ->
  `disciplines/music-theory/terms/`.
- Remaining music root counts after pass:
  3 terms, 0 concepts, 0 texts.
- Left in place:
  the school-anchored but not-yet-nestable cluster
  (`call-and-response`, `drone`, `polyrhythm`), since the relevant
  schools currently exist as flat files rather than directories and
  converting those school pages into nested directory homes should be
  handled as a dedicated structural pass.
- Body hyperlinks intentionally left unchanged for Phase 5.

2026-03-09 - Phase 2 linguistics pass complete.
- Relocated 6 linguistics files with `git mv` and updated moved-file
  frontmatter (`date-updated`, `part-of`).
- Created new linguistics homes:
  `languages/english/terms/`,
  `languages/english/texts/`,
  and `topics/language-and-power/terms/`, with minimal new indexes.
- English-language moves:
  `dead-english` ->
  `languages/english/terms/`;
  `history-of-rhoticity-in-general-american-english.md` ->
  `languages/english/texts/`.
- Language-and-power moves:
  `citing-for-containment`, `linguistic-extraction`,
  `meme-grammar`, and `syntactic-branding` ->
  `topics/language-and-power/terms/`.
- Remaining linguistics root counts after pass:
  0 terms, 0 concepts, 0 texts.
- Body hyperlinks intentionally left unchanged for Phase 5.

2026-03-09 - Correction pass: cybernetic-postliberalism linguistic
cluster reclassified under relationality.
- Applied emsenn clarification that `dead-english`,
  `citing-for-containment`, `linguistic-extraction`,
  `meme-grammar`, and `syntactic-branding` are terms of
  cybernetic postliberalism rather than primarily linguistics pages.
- Created new nested home:
  `relationality/disciplines/cybernetic-postliberalism/disciplines/linguistics/terms/`
  with minimal indexes at each new directory level.
- Relocated the 5-term cluster with `git mv` from the temporary
  linguistics placements into the new relationality discipline home
  and updated moved-file frontmatter (`date-updated`, `part-of`).
- Linguistics root remains clean after the correction:
  0 terms, 0 concepts, 0 texts.
- Body hyperlinks intentionally left unchanged for Phase 5.

2026-03-09 - Session: architectural revision to directory types and
specification pattern. All phases updated accordingly.
- Decision 0009 (directory-structure-as-structuration-interface):
  five decisions encoded — specifications as practice-face of a Thing
  (`thing/practices/specification.md`); four-group canonical directory
  types (governing/engaging/situating/defining with gerund subtypes);
  `standards/` replaces `specifications/` for grouping conventions;
  created-here principle (Things derived from X go under X's dir);
  decision 0005 amendment (three-level naming still valid, but spec
  files live at `practices/specification.md` not under a spec Thing).
- Decision 0010 (repository-means-files-on-disk): repository is only
  the physical git repo. Endeavor and organizational spec are distinct
  layers. Plans/decisions belong to endeavor layer (structural debt).
- Knowing-semioverse standard created at
  `information/disciplines/knowledge-systems/standards/knowing-semioverse/`
  with index.md, practices/specification.md (12 required directory
  types, 4 groups), and decisions/0001-four-group-directory-structure.md.
  This is the normative reference for all Phase 2/3 type compliance.
- ADR standard created at
  `information/disciplines/knowledge-systems/standards/adr/`
  with practices/specification.md. Governs all decision records
  going forward (Context/Decision/Consequences/Alternatives required).
- Fix-as-you-go practice created at
  `agential-semioverse-repository/practices/fix-as-you-go.md`.
  Added as standing rule 10.
- Plan 0059 (standards-deviation-measurement): general capability for
  measuring repository deviation from any standard with
  practices/specification.md and optional shapes.ttl.
- Plan 0060 (agents-routing-chain-to-file-location-skill): AGENTS.md
  chain to a locate-file skill returning MUST (one location) or SHOULD
  (candidates). SHOULD→MUST feedback loop is progressive automation
  applied to file placement. Phase 6 now references these plans.
- interpret-message skill updated to v0.6: classify-first approach
  (defining/questioning/planning), record before discuss.
- Policy 010 (match-plan-abstraction-to-decision-level): plans must
  not presuppose implementation choices not yet decided.
- Standing rules updated: rule 10 (fix-as-you-go), rule 11 (canonical
  directory types per decision 0009).
- Phase 0A/0B updated to reflect new patterns.
- Phase 2 now references knowing-semioverse specification as normative.
- Phase 6 now references plans 0059 and 0060 as enforcement vehicles.
