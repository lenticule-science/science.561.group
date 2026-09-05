# Forecasting Services Section

`@red-cup-engineering/forecasting` — forecasting as skill-for-fee: calibrated-
judgment forecasting sold as a service, the explicit inversion of
capital-at-risk trading. Question ingestion, metrologic bilattice evidence
fusion, proper scoring rules, and calibration tracking — no capital is ever
placed at risk. Entry cost is compute/time paid through the house's own
free-inference rails, never a market position.

## Pipeline

1. **Ingest** (`scripts/ingest-forecasting-question.mjs`) — validates and
   normalizes a raw question definition into a canonical
   `ForecastingQuestion` (`src/forecasting.mjs`'s `normalizeQuestion`).
2. **Gather** (`scripts/gather-question-evidence.mjs`) — dispatches the
   question through the free-first provider order
   (`@red-cup-engineering/openai-compatible-chat-completion-service`),
   parsing a `PROBABILITY:`/`CONFIDENCE:` estimate from the completion. Never
   falls back to a paid or frontier provider.
3. **Fuse** (`scripts/fuse-forecast.mjs`, `src/evidence-fusion.mjs`) —
   combines one or more evidence estimates into a single forecast: the
   probability point-estimate is a confidence-weighted mean (ordinary numeric
   aggregation); the qualitative support/refutation charge is real
   `@lenticule-science/metrologic/bilattice` fusion (`aggregate`/`isTop`),
   kept honestly separate from the numeric mean rather than one dressed up
   as the other.
4. **Record** (`scripts/record-forecast.mjs`) — writes the canonical
   `ForecastRecord` via `@red-cup-engineering/semantic-record-journal-service`
   (`createSemanticRecordJournal`), landing at this section's own
   `data/logs/`.
5. **Score** (`scripts/score-forecast.mjs`) — once a question resolves,
   scores the recorded forecast with the Brier score (always) and the log
   score (whenever the stated probability isn't exactly 0 or 1 — `logScore`
   is undefined at those boundaries), and journals a calibration-tracking
   record.

`apps/forecasting-cli.mjs` composes the full pipeline as two commands: `run
<question.json> [--catalog <path>]` (ingest → gather → fuse → record) and
`score <forecastId> <outcome 0|1>`.

## Exports

- `@red-cup-engineering/forecasting/forecasting` — `src/forecasting.mjs`:
  `normalizeQuestion`, `createForecast`, `brierScore`, `logScore`,
  `calibrationBuckets`.
- `@red-cup-engineering/forecasting/evidence-fusion` — `src/evidence-fusion.mjs`:
  `chargeFromEvidenceEstimate`, `fuseEvidenceToForecast`.

## Thread

Five-custody thread (org-layering.md, 2026-09-01):

- **science: this section.** Forecasting-as-skill-for-fee is itself science
  custody (economics-and-business-science, under social-science, under
  science) — a research capability, not merely code wrapping one. Theory
  base:
  - [economics-science-services-section](../economics-science-services-section)
    — the sibling section maintaining economics research under OECD FORD 5.2;
    forecasting is the applied-judgment arm of that same custody.
  - [TA as Folk Obsmetrologia](../../../../../../content/text/documents/articles/notes/2026/08/21/2026-08-21-note-on-ta-as-folk-obsmetrologia.md)
    — re-founds technical analysis as a pre-instrumental practice tradition
    whose surviving patterns are candidate charge-configurations (candlesticks
    as folk charge-notation, volume as the witnessing axiom, and so on); this
    section's evidence-fusion charge encoding (`chargeFromEvidenceEstimate`)
    is the same obsmetrologic charge/witness vocabulary applied to gathered
    forecasting evidence rather than chart patterns.
  - [Ludics and Game-Theoretic Technical Analysis](../finance-science-services-section/content/text/documents/articles/notes/2026/08/27/2026-08-27-note-on-ludics-and-game-theoretic-technical-analysis.md)
    — tests markets-are-games against Kelly/Shannon/ludics and names Vovk's
    *defensive forecasting* apparatus directly: it gives a provable
    calibration guarantee but calibration is not profitability — precisely
    the discipline `calibrationBuckets` exists to track and the reason this
    section scores skill (Brier/log score, calibration) rather than P&L.
- **engineering:** [technical-analysis-feature-measurement-service](../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/web-services-section/services/web-platform-services-section/services/web2-platform-services-section/services/web2-financial-platform-services-section/services/web2-financial-brokerage-platform-services-section/services/alpaca-services-section/services/technical-analysis-feature-measurement-service)
  is the nearest real engineering-custody neighbor — it measures a strictly
  causal technical-analysis feature vector from OHLCV observations, a
  forecasting-adjacent carrier, though not a package-level mirror of this
  one. **No distinct engineering seat mirrors `@red-cup-engineering/forecasting`
  itself** the way e.g. `computer-mud-system-engineering-services-section`
  (science) mirrors `computer-mud-engineering-services-section` (engineering)
  as two separate directories — the engineering-scoped package is physically
  colocated here in science custody instead. A seating debt, not fixed in
  this pass. (Related lineage, cited for context rather than as the
  thread-mate itself: [PERSONAL-QUANT-PLATFORM-THEORY.md](../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/web-services-section/services/web-platform-services-section/services/web2-platform-services-section/services/web2-financial-platform-services-section/services/web2-financial-brokerage-platform-services-section/services/alpaca-services-section/PERSONAL-QUANT-PLATFORM-THEORY.md)
  is the retired Alpaca capital-at-risk platform theory this package's own
  `src/forecasting.mjs` header names itself the explicit inversion of; it is
  a capital-allocation theory, not a forecasting-as-skill-for-fee one, so it
  is not conflated with the engineering thread-mate above.)
- **operations:** **absent — no operations-custody material for this
  capability turned up** (a grep of `operations-services-section` for
  "forecast" hit only an unrelated glossary term, an unrelated legacy
  work-orchestration task file, and an unrelated metroplat architecture
  note). Not fixed in this pass.
- **561-group:** **absent — no 561-group-custody material for this
  capability turned up** (a grep of `561-group-services-section` for
  "forecast" hit only unrelated agency-fiction journal entries, an unrelated
  legacy audit file, and unrelated goal-stack/roadmap text). Not fixed in
  this pass.
- **public:** **absent — no public face for this specific skill-for-fee
  product turned up.**
  [emsenn-trading-services-section](../../../../../../../public-services-section/services/personal-services-section/emsenn-services-section/services/emsenn-economic-services-section/services/emsenn-trading-services-section)
  cites the same "TA as Folk Obsmetrologia" theory note but is explicitly a
  different capability — Emsenn's personal capital-at-risk trading-research
  observatory ("this is Emsenn's private trading-research observatory...not
  a trading system and not financial-advice machinery"), the inverse case
  this package itself was built to invert — so it is named here rather than
  claimed as this product's public thread-mate. Not fixed in this pass.

## Entanglement

Checked against the house primitives named in the 2026-09-01 five-custody
ruling:

- `@lenticule-science/metrologic/bilattice` — genuinely used in
  `src/evidence-fusion.mjs` (`aggregate`, `isTop`) for the support/refutation
  charge fusion; not a duplication candidate. `brierScore`/`logScore`
  (`src/forecasting.mjs`) were checked against metrologic 0.1.1's full
  subpath export set (bilattice, obstruction, number, closure, chu,
  hyperdoctrine, spectral, dgen, dframe, readout, type-theory, verdier) —
  metrologic owns four-valued evidence/bilattice math, not proper scoring
  rules, so this is not a duplication.
- `@red-cup-engineering/semantic-record-journal-service` — already the sole
  writer in `scripts/record-forecast.mjs` and `scripts/score-forecast.mjs`
  (`createSemanticRecordJournal`); no hand-rolled record/receipt writing.
- `@red-cup-engineering/openai-compatible-chat-completion-service` — already
  the sole inference path in `scripts/gather-question-evidence.mjs`
  (`validateChatCompletionPacket`, `runOpenAiCompatibleChatExchange`,
  `selectFreeFirstProvider`); no hand-rolled provider dispatch.
- `@red-cup-engineering/eavt` — no hand-rolled EAVT-shaped rows anywhere in
  `src/` or `scripts/`; none needed.
- `@red-cup-engineering/image-generation-inference-team` — this package does
  no image generation anywhere; none needed.

No wiring changes were required in this pass.
