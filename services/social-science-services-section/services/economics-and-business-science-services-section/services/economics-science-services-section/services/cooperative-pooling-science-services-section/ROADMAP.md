# Cooperative pooling science roadmap

Theory notes and glossary for the Tidepool protocol (master specification 2026-10-08 in `public-blockchain-yield-pool-finance-services-section`). Lean work is `TP-LEAN-*` in `economics-science-services-section/lib/obsmetrologia-economics/ROADMAP.md`. Conventions: notes under `content/text/documents/articles/notes/2026/MM/DD/`, frontmatter per the research conventions (`title`, `description`, `date-created`, `type: notes`, `status`, `authors`, `keywords`, `references:` derived by `cli record-references <record> --write`); every outside claim cites a row of a 2026-10-08 research record by its label; glossary terms under `content/text/glossary/terms/` matching the economics-science neighbours' frontmatter; `cli record-check` prints `0 errors` for every record touched. **Note rule:** every task's acceptance includes a note (for this section, the task's own deliverable is the note; for a glossary task, a short note listing the terms and what was left open) at `content/text/documents/articles/notes/YYYY/MM/DD/YYYY-MM-DD-note-on-<task-id>-<slug>.md`. One Sonnet session each.

## Phase 1: the theory the kernel stands on (v0.1 where marked)

### TP-SCI-001 `v0.1` Founding note: pooling as a manufactured ensemble
- Goal: `2026-10-08-note-on-pooling-as-a-manufactured-ensemble.md`: the Peters and Adamou result stated exactly (g = μ − σ²/2; μ − σ²/(2N); premium (σ²/2)(1 − 1/N); ρ-limit μ − σ²ρ/2; the two-party sharing rule μ₁ − 3σ₁²/4 < μ₂ − σ₂²/4), the insurance example, the behavioural evidence, the sizing note's reading (ruin re-seeded, the pool as a sleeve with a barrier), and the absence of a measured pooling gain in an operating cooperative as the protocol's first falsifier; names the Lean module `Decorrelation` and its declarations.
- Files: the note; `references:` from record `2026-10-08-ergodicity-and-pooling.json`.
- Acceptance: every formula matches the record's C1 rows verbatim; `record-check` 0 errors; the note names TP-LEAN-015's declarations by name.
- Depends: research block C (landed).

### TP-SCI-002 `v0.1` Glossary terms
- Goal: terms `cooperation-premium`, `decorrelation-dividend`, `consensus-by-withdrawal-allocation`, `site-sheaf`, `pay-the-meet`, `settlement-bounty`, `attention-worklist`, `algedonic-cell`, `tally-credit` cross-reference (monetary section owns it), `reseed-mutual`, `energy-commons`, each with `description`, `relations`, and the spec section it names.
- Files: `content/text/glossary/terms/<term>.md` (eleven files); note `2026-10-08-note-on-tp-sci-002-glossary.md`.
- Acceptance: frontmatter validates like the economics-science neighbours (`ergodicity.md` as the model); each term links its spec section; no term duplicates one already in economics-science, monetary-economics or finance-science (check those three `glossary/terms/` directories only).
- Depends: TP-SCI-001.

### TP-SCI-003 Federation topology against poverty traps
- Goal: `2026-10-09-note-on-federation-topology-and-poverty-traps.md`: Wand, Kamps and Skjold's lattice result (everyone gains; rich and poor clusters; a rich agent collapses unless rich neighbours insure it) read as the federation's design rule (edges bridge clusters of different variance and wealth; the decorrelation reduction selects them); the Očhéthi Šakówiŋ reading restricted to what the Lakota section actually holds (Ω1 conjunctive aggregation, Ω2 council on conditions, Ω4 inter-division kinship as glue, Ω6 health as no persistent contradiction), cited to the section's `oceti-sakowin.md` and `omniciye-council.md`; the statement of `Federation.edge_admitted_iff_sharing_and_reduction` for TP-LEAN-019.
- Acceptance: cites the `ergodicity-and-pooling` and `lakota-and-indigenous-economy` records; no claim about Lakota governance beyond the two structure documents.
- Depends: TP-SCI-001.
- Status: done 2026-10-08 as `2026-10-08-note-on-federation-topology-and-poverty-traps.md`; `lakota-and-indigenous-economy` holds no rows, so the Lakota reading cites only the two structure documents.

### TP-SCI-004 The pool as a viable system
- Goal: `2026-10-09-note-on-the-pool-as-a-viable-system.md`: the VSM map in spec §7 (S1–S5, S3\*, the algedonic channel) with Beer's definitions cited from the `cybernetic-planning` record, Cybersyn's opsroom as the public face's ancestor, the ship rule (interpretive load) as the S5 criterion, and what a pool loses if any system is missing.
- Acceptance: cites the `cybernetic-planning` record; each VSM system names the contract that realizes it.
- Depends: TP-SCI-001.
- Status: done (2026-10-08); note `2026-10-08-note-on-the-pool-as-a-viable-system`.

### TP-SCI-005 Energy commons and EROEI-scored allocation
- Goal: `2026-10-09-note-on-the-energy-commons.md` written with the solar-economics section: the net-energy-positive assets a float may finance (heat pump, insulation, rooftop PV, stove efficiency) with the EROEI boundary each needs stated (solar-economics' `energy-storage-return-on-investment`, `energy-cannibalism`, `net-metering` terms), kWh repayment as attested savings, the EROEI-scored allocation weight, and the measurement the energy-descent note's §3.10 asks for (joules per settled row) as this instrument's own unit.
- Acceptance: cites the `energy-theories-of-money` record and solar-economics bibliographies; states `EnergyCommons.repay_conserves_kwh` for TP-LEAN-016.
- Depends: TP-SCI-001.

### TP-SCI-006 Interpretive load per settled row
- Goal: `2026-10-10-note-on-interpretive-load-per-settled-row.md`: a measurement design for the ship rule (what a member must parse to use each instrument; a count of distinct questions a member must answer before and after a cycle; the comparison to the incumbents' fee schedules and dispute flows), with the sociology section's criterion quoted and the prediction that a californicated instrument raises the count.
- Acceptance: a measurable procedure a later operations task can run; cites the cybernetic-postliberalism overview.
- Depends: TP-SCI-004.
- Status: done (2026-10-08); note `2026-10-08-note-on-interpretive-load-per-settled-row`.

### TP-SCI-007 Mutual credit, clearing and demurrage
- Goal: `2026-10-10-note-on-clearing-and-demurrage-for-a-pool.md`: Sardex, WIR, Cycles/MTCS and the bancor plan as prior art for B1; Wörgl and Circles as prior art for B3's demurrage on idle float and persistent credit (never on holdings); the open question of what rate; the statement of `Netting.clear_conserves_net` and `Demurrage.step_conserves`.
- Acceptance: cites the `mutual-credit-and-clearing` and `demurrage-and-local-currency-evidence` records.
- Depends: TP-SCI-001.
- Status: done 2026-10-08 as `2026-10-08-note-on-clearing-and-demurrage-for-a-pool.md`; `mutual-credit-and-clearing` and the finance-science trustline record hold no rows, so Sardex, Cycles/MTCS, the bancor plan and Circles are open.

### TP-SCI-008 The ROSCA turn auction
- Goal: `2026-10-10-note-on-the-priced-turn-auction.md`: Besley, Coate and Loury's bidding ROSCA, Ardener and Geertz on collusion and last-member default, the float-guaranteed last turn and record-bounded bid as the house's additions, `Rota.pot_conserves`.
- Acceptance: cites the `rosca-economics` record.
- Depends: TP-SCI-001.
