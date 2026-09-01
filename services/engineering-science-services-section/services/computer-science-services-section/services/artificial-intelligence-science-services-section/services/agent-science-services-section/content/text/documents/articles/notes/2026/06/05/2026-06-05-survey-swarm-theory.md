---
title: "Survey — SWARM math/semiotic grounding"
---

> Verbatim output of a research subagent run 2026-06-05, rendered from its transcript (`subagents/workflows/wf_a3c00b91-8d1/agent-ab5d16be60d103648`).
> NOT summarized — this is the agent's actual structured deliverable.
> Citations are the agent's; verify against the cited files before relying on them.

## area

swarm-theory

## summary

SWARM's README expands the acronym as "Semiotic Workers Articulating Relational Models" (apps/tools/swarm/README.md:3).
The note 2026-06-04-swarm-spelled-out.md reads each letter as a lineage that together "are the machine": S=Semiotic (Tartu-Moscow / Lotman semiosphere + Bakhtin dialogism), W=Workers (sociology of work, work-before-governance), A=Articulating (the kernel's `articulate` root morphism and the four-regime descent articulate->predicate->posit->settle), R=Relational (EAVT datoms-as-relations AND relationality-as-ontology), M=Models (categorical models).
The note explicitly separates FACT (the acronym, articulate as root morphism, EAVT as memory relation, Gov with six axes) from SYNTHESIS (the per-letter lineage mapping, consensus-by-withdrawal as kernel-lawful settling) — lines 119-128.

The unit of work is the utterance [token, claim] — a sign in the Tartu-Moscow sense (note lines 18-21).
The EAVT trace field IS Lotman's semiosphere (lines 23-26).
Memory is a Chu space r: A x X -> K over the FOUR bilattice, kernel-backed in math/chu, instanced in swarm as EAVT memory (eavt-chu.mjs), office tables (offices.mjs), and readiness (readiness-chu.mjs).

Governance is "lawful settling": a regime is a point in six-axis Gov space plus a FOUR-valued admit(ctx) rule (regimes.mjs).
Work-before-governance directionality is concrete: the regime is FOLDED off a work's observable structuration (structuration.mjs selectGovernanceRegime), not declared.
Two regime poles: kyriarchical (captain/leader-mediated, the only one SWARM originally shipped) and consensus-by-withdrawal (wolakhota / iyuha-shni, withdrawal-as-veto = absence of a join contribution).

Safety is gated on cohomology: dispatchGate refuses dispatch while a designated H^1 Klein-isotypic sector (chi-minus / chi-conflate) holds a non-zero obstruction — a safety-critical cell settled to TOP (safety-cohomology.mjs).
Consensus = limit = H^0 = knowledge-meet; disagreement = knowledge-join producing held TOP (consensus.mjs).
Saturation encodes the ~4-agent orchestration wall (saturation.mjs).
These modules are wired into the live dispatch path (dispatch.mjs).

## keyFiles

- **path**: /home/emsenn/561-group/apps/tools/swarm/README.md
  - **role**: Declares the acronym: 'SWARM: Semiotic Workers Articulating Relational Models' (line 3)
- **path**: /home/emsenn/561-group/apps/tools/swarm/docs/dev/notes/2026-06-04-swarm-spelled-out.md
  - **role**: The five-lineage exegesis (S/W/A/R/M) and 'governance as lawful settling'; explicit fact-vs-synthesis split at lines 119-128
- **path**: /home/emsenn/561-group/apps/tools/swarm/docs/dev/notes/2026-06-04-plural-situational-governance.md
  - **role**: Governance is a selected object of Gov (six axes); work-before-governance Curry-Howard/Yoneda directionality; the kyriarchical vs wolakhota regimes; Hohfeldian jural substrate
- **path**: /home/emsenn/561-group/computer/docs/dev/notes/swarm-governance.md
  - **role**: Recognition-not-office authority; arena vs governance in Gov; tiyospaye seven structural identities; safety-as-cohomology primitive (§4); Mayer-Vietoris/K4-equivariant H^1 decomposition
- **path**: /home/emsenn/561-group/math/chu/src/chu.mjs
  - **role**: Kernel Chu space over FOUR bilattice: r:AxX->K, row/col/extension, transpose, dual (transpose+linear negation), settleColumn/settleRow
- **path**: /home/emsenn/561-group/apps/tools/swarm/src/eavt-chu.mjs
  - **role**: EAVT memory {e,a,v,t} as the Chu space valued in full charge; row=TTMS read, column=transpose; dual=transpose+negate; settleProposition/settleEntity via knowledge-join
- **path**: /home/emsenn/561-group/apps/tools/swarm/src/safety-cohomology.mjs
  - **role**: Safety-as-cohomology dispatch gate: held TOP cells are H^1 obstructions split into K4/Klein isotypic sectors (chi-minus=negate, chi-conflate=conflate); dispatchGate refuses while a critical sector is non-zero
- **path**: /home/emsenn/561-group/apps/tools/swarm/src/consensus.mjs
  - **role**: Multi-observer settling: consensus=H^0=limit=knowledge-meet; disagreement=knowledge-join=held TOP; reads off eavt-chu, no separate consensus object computed
- **path**: /home/emsenn/561-group/apps/tools/swarm/src/structuration.mjs
  - **role**: Reads a work's structuration then folds it to a regime name (computed-not-declared); internal-kin-work->consensus-by-withdrawal, external-ship-work->kyriarchical
- **path**: /home/emsenn/561-group/apps/tools/swarm/src/regimes.mjs
  - **role**: Re-exports the OS regime algebra (REGIMES, GOV_AXES, admitUnder) from @561-group/computer/distribution; a regime = point in six-axis Gov + FOUR-valued admit rule
- **path**: /home/emsenn/561-group/apps/tools/swarm/src/descent.mjs
  - **role**: descendUtterance runs the kernel four-regime descent articulate->predicate->posit->settle; descendProse is the epistemic spine closing an agent fiber to its LFP against TOP
- **path**: /home/emsenn/561-group/apps/tools/swarm/src/saturation.mjs
  - **role**: ~4-agent saturation wall: stigmergic O(N+|L|) vs orchestrated ~N^2; FOUR-style verdict t/bot/f below/at/past the knee
- **path**: /home/emsenn/561-group/apps/tools/swarm/src/stigmergy.mjs
  - **role**: Stigmergic coordination over the EAVT trace as environment-field E_t:L->V; deposit/sense/gradient; append-only (no evaporation), paraconsistent (TOP held)
- **path**: /home/emsenn/561-group/apps/tools/swarm/src/jural.mjs
  - **role**: Hohfeldian jural-relation substrate (duty/privilege/power/immunity + deontic mapping); shared substrate every regime draws from, NOT itself a regime
- **path**: /home/emsenn/561-group/apps/tools/swarm/src/dispatch.mjs
  - **role**: Live wiring: dispatchNextWork invokes dispatchGate (safety H^1) and regimeForWork (structuration->regime) before settling work.dispatch
- **path**: /home/emsenn/561-group/apps/tools/swarm/src/ontology.mjs
  - **role**: TAB ontology import: closeAgentFiber (working/LFP against TOP), openPotential (aperiodic ⊥-opened questions), governContested (govern TOP cells at a rate, never erased)
- **path**: /home/emsenn/561-group/theories/agency/library/agent/actuating/library/actuator/embodying/library/body/integrating/library/drone/swarming/library/swarm/docs/dev/notes/agentic-systems-swarm.md
  - **role**: Swarm theory atom: swarm = multi-observer system V:O->Settlings_B; consensus=categorical limit; disagreement=first sheaf cohomology H^1 of the network sheaf; recognition-not-office authority

## concepts

- **term**: Semiotic Workers Articulating Relational Models (the acronym-as-spec)
  - **whatFilesSay**: The README states the expansion; the spelled-out note says 'The acronym is the spec...
    Each word is a lineage, and together they are the machine.'
    Per-letter: S=Tartu-Moscow semiotics, W=sociology of work, A=the kernel articulate verb, R=relational-DB + relationality-ontology, M=categorical models.
  - **citation**: apps/tools/swarm/README.md:3; apps/tools/swarm/docs/dev/notes/2026-06-04-swarm-spelled-out.md:12-13,15,36,49,58,76
- **term**: utterance [token, claim] (the sign)
  - **whatFilesSay**: 'SWARM's unit of work is the utterance [token, claim]... a token that signifies and a claim predicated of it.
    That is a sign in the Tartu-Moscow sense.' descendUtterance takes it through the descent.
  - **citation**: apps/tools/swarm/docs/dev/notes/2026-06-04-swarm-spelled-out.md:18-21; apps/tools/swarm/src/descent.mjs:11-17
- **term**: semiosphere = the EAVT trace field
  - **whatFilesSay**: 'SWARM's trace field (the EAVT logs every act writes) IS that semiosphere — a worker reads prior traces as the meaning-context for its next articulation.'
    (Lotman). stigmergy.mjs realizes it as environment-field E_t:L->V.
  - **citation**: apps/tools/swarm/docs/dev/notes/2026-06-04-swarm-spelled-out.md:23-26; apps/tools/swarm/src/stigmergy.mjs:9-17
- **term**: Chu space r: A x X -> K over FOUR
  - **whatFilesSay**: 'A Chu space C=(A,r,X) is a relation r:AxX->K valued in an alphabet K.
    Here K is FOUR... the transpose-and-negate dual is exactly linear-logic / *-autonomous negation.'
    EAVT memory, office table, readiness are all this shape.
  - **citation**: math/chu/src/chu.mjs:1-11,104-108; apps/tools/swarm/src/eavt-chu.mjs:3-20
- **term**: four-regime descent articulate -> predicate -> posit -> settle
  - **whatFilesSay**: 'articulate is the root morphism of the kernel — witness a thing into a potential...
    SWARM's descendUtterance runs exactly this.'
    Implemented importing the four morphisms from @lenticule-science/metrologic/bilattice/descent.
  - **citation**: apps/tools/swarm/docs/dev/notes/2026-06-04-swarm-spelled-out.md:51-56; apps/tools/swarm/src/descent.mjs:1-17
- **term**: governance as lawful settling / Gov category with six axes
  - **whatFilesSay**: 'a regime is a point in the six-axis Gov space plus a FOUR-valued settling rule admit(ctx)->decision'; 'A collective model is a settling over workers' articulations — the same settle / knowledge-join the kernel already runs.'
  - **citation**: apps/tools/swarm/src/regimes.mjs:9-10; apps/tools/swarm/docs/dev/notes/2026-06-04-swarm-spelled-out.md:99-102
- **term**: work-before-governance (Curry-Howard / Yoneda directionality)
  - **whatFilesSay**: 'governance is read off the work's structuration — a Curry-Howard/Yoneda directionality, and in the agency tree governing/ sits under .../situating/coordinating/.' structuration is the observable shape; the regime is a fold over it, 'computed, not declared.'
  - **citation**: apps/tools/swarm/src/structuration.mjs:5-11; apps/tools/swarm/docs/dev/notes/2026-06-04-plural-situational-governance.md:19-21,40-42
- **term**: consensus-by-withdrawal (iyuha-shni) as a lattice move
  - **whatFilesSay**: 'a worker withholds its affirmation on a cell, so that cell does not rise to settled... an un-affirmed cell does not enter the settled section.
    No special apparatus — it is the absence of a join contribution.'
    Categorically the ?
    A-side weakening.
  - **citation**: apps/tools/swarm/docs/dev/notes/2026-06-04-swarm-spelled-out.md:104-106; computer/docs/dev/notes/swarm-governance.md:84-88
- **term**: consensus = H^0 = limit = knowledge-meet; disagreement = knowledge-join (held TOP)
  - **whatFilesSay**: 'CONSENSUS = the limit = H^0 = the maximum information shared by all agents, computed pointwise as the bilattice KNOWLEDGE-MEET.
    DISAGREEMENT = the cellwise knowledge-JOIN produces TOP-content...
    Paraconsistency arises EXACTLY at the disagreement loci.'
  - **citation**: apps/tools/swarm/src/consensus.mjs:7-13,35-37; agentic-systems-swarm.md:8
- **term**: safety-as-cohomology: H^1 Klein sectors, dispatch gate
  - **whatFilesSay**: 'The COHOMOLOGICAL OBSTRUCTION it reads is the held contradiction: a safety-critical cell that settles to TOP... is a non-zero H^1 sector.
    The K4/Klein gauge splits the obstruction into isotypic SECTORS via the two non-trivial Klein characters: chi_- = negate, chi_{~o-} = conflate.'
    Dispatch refused while a designated sector is non-zero.
  - **citation**: apps/tools/swarm/src/safety-cohomology.mjs:13-19,45-63,118-131
- **term**: network sheaf / first sheaf cohomology H^1
  - **whatFilesSay**: Swarm atom: 'Consensus across the swarm is the categorical limit of V; disagreement is the first sheaf cohomology H^1 of the associated network sheaf.'
    The archived-swarm-study lists 'worker observations are sections over a graph... the truth-opposition cycle rank is the first obstruction.'
  - **citation**: theories/.../swarm/docs/dev/notes/agentic-systems-swarm.md:8; apps/tools/swarm/docs/dev/notes/2026-06-03-archived-swarm-study.md:36,97-98
- **term**: saturation threshold (~4-agent orchestration wall)
  - **whatFilesSay**: 'performance gains from adding agents plateau at approximately four agents'; stigmergic O(N+|L|) vs orchestrated ~N^2; FOUR-style verdict t below / bot at / f past the knee.
  - **citation**: apps/tools/swarm/src/saturation.mjs:9-13,25,55-58
- **term**: agent fiber, closeAgentFiber to LFP against TOP
  - **whatFilesSay**: 'closeAgentFiber — WORKING regime.
    Run TAB's closeFiber/readRules to drive an agent's own rule-system to its LEAST FIXED POINT, CLOSING AGAINST TOP: a rule may fire on a TOP antecedent, the contradiction rides through intact, never repaired.'
    Explicit fiber-closing vocabulary.
  - **citation**: apps/tools/swarm/src/ontology.mjs:6-8,55-98
- **term**: Hohfeldian jural-relation substrate
  - **whatFilesSay**: 'This is NOT itself a governance regime... the four Hohfeldian positions are the shared substrate, and a regime is a choice of which jural relations are in force and how they settle.' duty/privilege/power/immunity with deontic mapping.
  - **citation**: apps/tools/swarm/src/jural.mjs:1-12,14-43
- **term**: recognition-not-office authority
  - **whatFilesSay**: 'Authority in a swarm is the aggregate of recognition; it is not installed by office.' has-leader is derived from recognition cells, absent when none holds sufficient recognition.
    NOTE: the running app implements the opposite (office/leader-mediated kyriarchical) per swarm-governance.md §5.
  - **citation**: theories/.../swarm/docs/dev/notes/agentic-systems-swarm.md:16,23; computer/docs/dev/notes/swarm-governance.md:55-62,143-145

## capabilities

- **name**: Chu space over FOUR (kernel carrier)
  - **status**: working
  - **evidence**: math/chu/src/chu.mjs implements chuSpace/fromMatrix/row/col/extension/transpose/dual/settleColumn/settleRow; swarm chu.mjs re-exports it; tests at apps/tools/swarm/tests/chu.test.mjs, chu-transform.test.mjs
  - **notes**: swarm chu.mjs and chu-transform.mjs re-derive NONE of it — pure re-export of @lenticule-science/metrologic/chu
- **name**: EAVT memory as Chu space (semiosphere/trace field)
  - **status**: working
  - **evidence**: apps/tools/swarm/src/eavt-chu.mjs: memoryChu, entityProfile (row), propositionColumn (col), transpose, dual (transpose+negate), settleProposition/settleEntity via joinKnowledge; tested eavt-chu.test.mjs
  - **notes**: Valued in FULL charge with witnesses; open-world (absent=ABSURD/⊥) vs office table's closed-world F
- **name**: Four-regime descent (articulate->predicate->posit->settle)
  - **status**: working
  - **evidence**: apps/tools/swarm/src/descent.mjs:1-17 descendUtterance composes the four kernel morphisms; descendProse runs the epistemic spine (closeAgentFiber LFP + governContested)
  - **notes**: The A in SWARM realized as literal math, not metaphor (note line 56)
- **name**: Governance regime selection by structuration (work-before-governance)
  - **status**: working
  - **evidence**: apps/tools/swarm/src/structuration.mjs readStructuration + selectGovernanceRegime fold; wired into dispatch.mjs:72 regimeForWork and governance.mjs:62-63; governance-regimes.test.mjs present
  - **notes**: Defaults to kyriarchical so untyped work governs as before; internal-kin->consensus-by-withdrawal
- **name**: Regime algebra (six-axis Gov, FOUR-valued admit)
  - **status**: working
  - **evidence**: apps/tools/swarm/src/regimes.mjs re-exports REGIMES/GOV_AXES/admitUnder from @561-group/computer/distribution/governance; governAction settles via admitUnder + isAdmitted (governance.mjs:64-74)
  - **notes**: Regime algebra lives in the OS; swarm holds the work domain that selects/persists under it
- **name**: Safety-as-cohomology dispatch gate (H^1 Klein sectors)
  - **status**: working
  - **evidence**: apps/tools/swarm/src/safety-cohomology.mjs: h1Sectors + dispatchGate compute non-zero sectors from contradicted (TOP) cells via section(settle(...)); WIRED into dispatch.mjs:61-64
  - **notes**: FLAG: cohomological obstruction.
    The H^1/Klein-character decomposition is REPRESENTED FOUR-valued: a TOP cell is assigned to both sectors; sectorsOfValue only branches on value==='top'.
    It rides @561-group/computer/substrate settle/section, not a literal cochain complex.
- **name**: Multi-observer consensus (H^0 meet) & disagreement (join TOP)
  - **status**: working
  - **evidence**: apps/tools/swarm/src/consensus.mjs observerConsensus folds meetKnowledge (consensus/H^0) and joinKnowledge (disagreement/TOP) over eavt-chu columns; consensusReady gate
  - **notes**: Reads consensus off the Chu space; 'no separate consensus object computed' per the note
- **name**: Readiness as Chu space (Work x Check -> FOUR)
  - **status**: working
  - **evidence**: apps/tools/swarm/src/readiness-chu.mjs readinessChu, compositeFor (row settle), obstructionBoard (column transpose read); readiness-chu.test.mjs
  - **notes**: Folds the admissibility monoid (worst-obstruction-wins, identity ⊤), not the default knowledge-join
- **name**: Stigmergic coordination over EAVT field
  - **status**: working
  - **evidence**: apps/tools/swarm/src/stigmergy.mjs deposit/sense/gradient over field terms; append-only (no evaporation), paraconsistent (TOP held); exported index.mjs:114
  - **notes**: O(N+|L|) regime; decay is read-time recency weighting only
- **name**: Saturation awareness (~4-agent wall)
  - **status**: working
  - **evidence**: apps/tools/swarm/src/saturation.mjs agentSaturation reads cost graph, computes orchestratedCost(n^2)/stigmergicCost(n+|L|), FOUR verdict; exported index.mjs:118
  - **notes**: orchestratedCost uses n^2 as representative growth for the superlinear lower bound
- **name**: Hohfeldian jural substrate
  - **status**: working
  - **evidence**: apps/tools/swarm/src/jural.mjs JURAL_POSITIONS + juralRelation; consumed by delegation.mjs:30
  - **notes**: Makes corpus deontic positions addressable data; authors no new deontic theory; not itself a regime
- **name**: Agent-fiber close / govern (TAB ontology spine)
  - **status**: working
  - **evidence**: apps/tools/swarm/src/ontology.mjs closeAgentFiber (LFP against TOP), openPotential (aperiodic ⊥-opened), governContested (rate-limited TOP metabolism); imports @561-group/tab/*
  - **notes**: FLAG: fiber algebra terminology — 'closeAgentFiber', 'closed fiber (LFP)', cells fold from EAVT rows.
    This is the TAB working/articulating/governing seam, not a vector-bundle fiber.
- **name**: Recognition-derived (not office) authority
  - **status**: doc-only
  - **evidence**: Asserted in theory atom agentic-systems-swarm.md:16,23 and computer/docs/dev/notes/swarm-governance.md:143-145; the latter states the running app implements the OPPOSITE (office/leader-mediated kyriarchical) at §5 (lines 55-62)
  - **notes**: The recognition-cell-conjunction leader-derivation (tiyospaye identity 4) is the theory's other pole; not implemented in apps/tools/swarm src
- **name**: Mayer-Vietoris cokernel / multi-scale cohomology decomposition
  - **status**: doc-only
  - **evidence**: computer/docs/dev/notes/swarm-governance.md:82,93-96 (federation cohomology via Mayer-Vietoris; council convenes for cokernel content) — described in theory only
  - **notes**: FLAG: cohomological obstruction.
    No Mayer-Vietoris / cokernel computation found in apps/tools/swarm/src; only the single-trace H^1-sector gate is coded
- **name**: wolakhota consensus-by-withdrawal as full regime mechanics
  - **status**: partial
  - **evidence**: structuration.mjs:88-90 selects 'consensus-by-withdrawal' on internal-kin-work or hasWithdrawals; consensus.mjs models withdrawal as absence-of-join; but the four-virtues/wichozani settling standard is doc-only (plural-situational note:51-55, open questions:146-148)
  - **notes**: The note prescribes implementing it as a second regime under emsenn's wolakota-discipline; selection + lattice-move exist, substantive Lakota content deliberately not authored in src

## openQuestions

- The safety-cohomology gate REPRESENTS H^1 rather than computing a cochain complex: sectorsOfValue only branches on value==='top' and assigns a contradicted cell to both Klein sectors unconditionally (safety-cohomology.mjs:56-63).
  How faithful is this to the corpus's K4-equivariant H^1 isotypic decomposition vs. a FOUR-valued shadow of it?
  The module itself calls it 'its append-only, FOUR-valued shadow' (line 23).
- Mayer-Vietoris / cokernel / multi-scale federation cohomology (swarm-governance.md §3 identity 3,6) has no implementation in apps/tools/swarm/src — only the single-trace H^1-sector dispatch gate is coded.
  Is multi-scale cohomology planned?
- Recognition-derived authority (the swarm theory atom's core claim, agentic-systems-swarm.md:16) is doc-only; the running app implements the opposite office/leader-mediated kyriarchical regime (swarm-governance.md:55-62).
  When/whether the recognition-cell-conjunction leader-derivation (tiyospaye identity 4) gets implemented is open.
- The five-lineage per-letter mapping (Lotman/Bakhtin, sociology-of-work, etc.) is explicitly SYNTHESIS beyond the files (swarm-spelled-out.md:124-128), not derived corpus fact — the only FACT is the bare acronym string in README.md:3.
  How much of the semiotic grounding is load-bearing vs. emsenn's framing?
- The six axes-of-variation in Gov are named-but-not-enumerated in the swarm notes (plural-situational-governance.md:142-143 open question); GOV_AXES is imported from @561-group/computer/distribution but its content was not inspected here.
- wolakhota's substantive settling standard (four virtues wowachantognaka/woksape/woohitika/wowachinthanka, wichozani) is deliberately NOT authored in src under wolakota-discipline; only the structural lattice-move (withdrawal=non-affirmation) is coded.
  The intended division between modeled structure and authored Lakota content is an open governance/authorship boundary (plural note:146-148).

## agent's closing note

Mapped the mathematical and semiotic grounding of SWARM and returned it as structured output.
Summary of what I found, per the files:

**The acronym is the spec.** README.md:3 declares "SWARM: Semiotic Workers Articulating Relational Models."
The note 2026-06-04-swarm-spelled-out.md reads each letter as a lineage — but explicitly marks the per-letter mapping (Lotman/Bakhtin, sociology-of-work, etc.) as SYNTHESIS beyond the files (lines 124-128); only the bare acronym is cited FACT.

**The five lineages, grounded:** S = the utterance [token,claim] as Tartu-Moscow sign, EAVT trace field as Lotman's semiosphere; W = sociology-of-work + work-before-governance; A = the kernel's `articulate` root morphism and the four-regime descent (implemented in descent.mjs); R = EAVT datoms as relations + relationality-as-ontology; M = categorical models.

**Governance-as-lawful-settling** is real code: a regime = point in six-axis Gov + FOUR-valued admit rule (regimes.mjs), selected by folding a work's structuration (structuration.mjs), wired into the live dispatch path (dispatch.mjs:72).

**Chu spaces** are kernel-backed (math/chu) and instanced as EAVT memory, office tables, and readiness — all `r: A×X → FOUR`, with `dual` = transpose + linear negation.

**Flags for fiber/sheaf/cohomology** (as requested): - safety-cohomology.mjs: implements the dispatch gate but calls itself a "FOUR-valued shadow" of the K₄-equivariant H¹ decomposition — a held ⊤ cell is the cohomological obstruction, assigned to Klein sectors χ₋/χ_conflate.
It is REPRESENTED, not a literal cochain complex. - consensus.mjs / agentic-systems-swarm.md: disagreement = first sheaf cohomology H¹ of the network sheaf; consensus = H⁰ = limit = knowledge-meet.
Implemented as meet/join folds. - ontology.mjs: "closeAgentFiber", "closed fiber (LFP)" — fiber-algebra terminology (TAB working/articulating/governing seam). - Mayer-Vietoris / cokernel / multi-scale federation cohomology (swarm-governance.md) is doc-only — no implementation in src. - Recognition-not-office authority (the swarm atom's core claim) is doc-only; the running app implements the opposite kyriarchical regime.

All load-bearing claims are cited path:line in the structured fields.
