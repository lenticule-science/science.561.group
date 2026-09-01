---
title: "MetroPlat architecture model"
description: "The whole-system architecture model for metroplat, the CQRS falsification, and the hypothesis discipline — read WITH metroplat-coherence-not-diagnosis before any metroplat work"
date-created: 2026-07-11
kind: research-note
in-service-of: lib/emsenn
keywords:
  - metroplat
  - architecture
status: settled
declared-by: researcher
---
# Infography [renamed later to MetroPlat] architecture model


**Falsified and must stay falsified: "metroplat = CQRS/event-sourcing."**
Prior sessions concluded CQRS is wrong at both ends and the operator confirmed
(2026-07-11): admission is PROOF-governed (journal admission runs the language
type-checker on every claim — proof admission, not command validation), and
settlement serves CAPABILITY/AUTHORITY (a semantic fixpoint that authorization
is derived from — normative, not a disposable read-model cache). Do not
resurrect CQRS, five-role classifications derived from it, or any
"ingestors→journal→projections→transports is the whole" claim.

**Discipline rule (operator, after reviewing 15 transcripts):** never extract
an architecture from one local artifact and declare it the whole; keep
hypotheses separate from conclusions; keep counterevidence attached to the
hypothesis it killed; no implementation until the model accounts for the WHOLE
system (language, proof kernel, settlement, capability/authority, SDK, math
models, deployable apps).

**Model v1 (2026-07-11, from reading the code itself — verified parts):**
MetroPlat is a proof-carrying, paraconsistent claim-settlement system over a
causal ledger, whose authorization model is derived from what has settled.
Its own joints (each verified in source):
1. Projector kernel (`lib/codecs/projector`, operator-designated "the kernel"):
   Yoneda-style boundary typing — a type IS its recognize/read/write morphisms
   over resources; restriction lattice; Corner = Belnap bilattice of
   ⟨addressability, assertivity⟩; Rung = decidability ladder (identity/scott/
   non-monotone/turing), only decidable rungs complete a read.
2. Language (`src/language`): RMN typed term calculus — check/infer, eval/
   normalize, canonical bytes + digest. Proof discipline for claims.
3. Journal (currently `src/apps/journal`): content-addressed events
   (seat, claim:Tm, address:Tm, time, causes); admission = typecheck +
   acyclicity; single funnel writeRowsAtRoot→writeRows→admitEvents.
4. Descent/settlement (`runtime/actions/descent`, `lib/fixpoint`,
   `language/stdlib/settling`): utter → articulate → predicate (Φ=E×Π×E) →
   posit (evidence presheaf) → settle (monotone ordinal closure to fixed
   points; regimes finite/scott/transfinite/aperiodic). Charges are Belnap
   FOUR — contradiction is a finite priced value; sheaf/cohomology measures
   where local agreement fails to globalize. Chain realized twice (TS + RMN
   terms) deliberately, and as a POSIX pipe (infograph utter|…|settle).
5. Authority (`lib/capability`, `runtime/authorize`, `runtime/standing`,
   `integrations/authority-cut`): a capability IS a charged claim; callable
   standing is READ from the settled valuation (capability-claims fold is the
   only reader); enforced at entry with no identity fallback; carried by
   industry ocap formats (UCAN, macaroons, CapTP, WASI) as codecs;
   authority-cut checks delegated authority via quantum-contextuality
   machinery (contested authority = no global section).
6. Boundaries: `integrations/` = utterance sources for outside systems;
   `interfaces/` = transports (cli/http/mcp/lsp/federation); `sdk/` = the
   published calculus surface.
7. Products: `apps/` dashboards/sites/tooling over settled valuations.

**Model v2 additions (2026-07-11, after full sweep of every subsystem's own
docstring):**
- The physics corpus consists of finite realizations of
  `Obsmetrologia (“Infomaterial” at time of writing).Relational.*` (the sibling Lean package's theorems).
  OPERATOR CORRECTION (2026-07-11): the "three-way certification spine /
  golden-vectored against Lean" framing is Claude-authored TROPHY CRUFT —
  citation instead of integration, the shrine disease in a lab coat. Golden
  vectors are frozen fixtures (already deleted with test/), not a bridge;
  docstring boasts about them get deleted on sight, never extended. NEVER add
  provenance-flavored self-certification (golden vectors, "Lean-certified"
  claims, evidence arrays). What the operator wants is real INTEROP:
  Lean theorem standing admitted as charged claims in the journal (Lean as
  just another seat), and RMN term digests referenced by / emitted as Lean
  proof obligations — one shared content-addressed representation, admission
  both ways. Until that exists, Lean/RMN/TS are three sealed silos and must
  not be described as a certification spine.
- `lib/values` is the atom: FOUR charges built from two evidence bits
  (for/against → unknown/held/denied/contested). Everything above is
  evidence-charged.
- Coordination discipline is the CALM theorem operationalized: settlement is
  coordination-free while monotone; Raft consensus (`runtime/standing/
  consensus-log`) is invoked ONLY where the CALM frontier reports a
  non-monotone conflict. Claim-sessions accumulate {cell,charge} rows; their
  nonzero obstruction readings become work-ledger obligations.
- `apps/harness` + `integrations/agent-worker` = accountable AI-agent
  operations: work-items/obligations are claims, agent-worker picks
  undischarged obligations, runs bounded tool loops, witnesses discharge.
  Doctrine/strategy/heartbeat/turn/characters govern agents through the same
  claim machinery.
- `interfaces/federation` is the IndieWeb/Fediverse stack (ActivityPub,
  Micropub, Microsub, Webmention, IndieAuth): claims federate socially.
- x402 = value settlement (payments) witnessed into the journal;
  accountable-transaction = transaction boundary with witnesses.
- runtime declares itself "the engine loop: admit, append, settle, serve" —
  by the code's own law the journal is the append quarter of the ENGINE, so
  `src/apps/journal` (operator's earlier placement) contradicts the layer
  headers; flagged to operator, their call.
- The lib strata are DISCIPLINED (every index declares its import law); the
  real incoherence is concentrated in mid-runtime (actions grab-bag,
  harness remnants, project/program-surface/journal-store overlap) and in
  vocabulary drift: module headers still cite ≥3 historical layouts
  ("coordination/claim-sessions", "apps/harness/action-family",
  "projections/witness/reading", "executing/…") — successive relayouts each
  left their self-descriptions behind.

**Model v3 (2026-07-11, later same day — tree RELAID onto `main`; older
path facts above are stale):** layout is now src/{core, journal,
infrastructure, application, presentation, modules, integrations, interfaces,
apps, sdk}, 794 files, verified by 4-agent full census. Findings:
- `core/` is strictly stratified pure algebra: values→schema→records→logic→
  fixpoint→math→codecs→capability→contracts→rendering→search→language. Descent
  spine lives distributed: articulate=records/utterance:344, predicate=
  logic/predicating/predication:378, posit=logic/predicating/evidence/fiber:409,
  settle=fixpoint/valuation-closure:357; byte-identical RMN mirror in
  language/stdlib/descending. TS operational chain = modules/builtins/descent.mts.
- Journal is a clean pure-model/impl SPLIT (src/journal = event+causal-graph+
  reading law; infrastructure/journal = fs impl re-exporting it). Funnel:
  writeRowsAtRoot → private writeRows → events.mts writeRows → admitEvents
  (typing verdict + acyclicity/closed-timelike-curve verdict). Tiers:
  log→state→record→content.
- application/standing/capability-claims = settleCapabilityWitnesses (FOUR
  knowledge join + dK/dTop sheaf read) — capability standing read from settled
  valuation, confirmed. authorization = canInvoke enforcement, no fallback.
  arrival = pure (application) / fs (infrastructure) split.
- modules/holography = THE one read/one write projection boundary (4-leg disk
  profile admit/settle/commit/realize); modules/claims = pure claim-session
  domain (CALM/Raft frontier), no journal duplication.
- presentation = operation catalog → program surface → apex; interfaces =
  "four transports as functorial images of the apex"; apps/infograph = single
  dispatcher binary; sdk = curated façade, src/index just re-exports it.
- Verified residue (deltas from the latent architecture, not proposals):
  (1) math/index.mts aliases ALL 7 subject namespaces to ./topology — physics
  (57 files) etc. unreachable through the barrel; (2) schema imports
  records/utterance against its own stated law; (3) misfiled under
  integrations/: agent-worker, accountable-transaction, token-usage, x402
  settlement legs, vscode — these are execution/accountability DOMAIN modules,
  not translators; (4) four-corner/Belnap table materialized ~5 places
  (self-acknowledged in logic/four-corner-cell); Corner name reused with two
  meanings (projector vs logic); (5) two writeRows, two ws-session.mts;
  (6) indieauth holds an in-memory grant store.

**Model v4 (2026-07-11, from primary reading of ~10 load-bearing files, not
surveys):** the system's invariants, each verified in source:
(1) every judgment is witness⊕obstruction as serializable values, never
boolean/exception; obstructions carry finite price and are never erased;
(2) boundary-first: structural coincidence not reference identity, canonical
bytes+digest as identity — the whole domain is JSON values;
(3) generators-not-artifacts: wire objects carry minimal generators, readers
re-derive by free construction; settlement is TERMINAL (no un-settle,
valuation-closure.mts:370);
(4) morphism-as-data: operations carry runTerm (RMN) + run (host); compose()
refuses closure-only bodies; `settled` readouts are boundary observations,
not morphism bodies (descent.mts settleOperation doc);
(5) every boundary crossing is an arrival admitted to the journal BEFORE
acting — reads too (read-write/index.mts "reads are arrivals too");
(6) decidability grading governs transports: reads only at decidable rungs;
negotiation may settle a value DOWN the corner order never up
(serving.mts:1021); non-strict-finite regimes cross MCP as partial
observations (serving.mts:1158);
(7) authority = settled evidence; effector body is a declaration never a
closure (capability-claims.mts:17);
(8) one apex, functorial transport faces, every envelope contract-witnessed
("no second ontology", serving.mts header);
(9) monotone-first: joinK merge is the Lean-proven CRDT
(Positing/Valuation.lean:42 cited in descent.mts relateGenerators);
(10) storage = log→state→record→content, each leg idempotent/non-mutating,
upper tiers deletable+recoverable ("the settlement law",
read-write/index.mts:158).
There is a numbered internal "placement law" (rules 6, 22 cited in
read-write/index.mts) — find and read its home before proposing placement.
NEW verified defect: read-write/index.mts:659+671 error messages name the
charge vocabulary "absurd|potential|active|stable" while isChargeValueName
checks unknown|held|denied|contested — the two four-corner namings colliding
user-facing.

Layout is a CONSEQUENCE of these joints and is the operator's call informed by
industry standards; do not invent a layout from a partial pattern-match. See
`metroplat-coherence-not-diagnosis` (note not in the record) for the standing task and failure loop.
