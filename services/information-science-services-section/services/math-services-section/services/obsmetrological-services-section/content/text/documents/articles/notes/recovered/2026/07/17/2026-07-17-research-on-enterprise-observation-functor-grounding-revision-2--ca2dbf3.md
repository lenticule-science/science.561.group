---
title: "Research on enterprise observation functor grounding, Revision 2"
description: "Immutable correction of successor-pointer transition semantics and fixed-fiber law claims in the enterprise observation functor candidate."
date-created: 2026-07-17
kind: research-note
in-service-of: lib/emsenn
tags:
  - obsmetrologia
  - enterprise-records
  - category-theory
  - requirements-analysis
status: design
declared-by: codex/requirements-analysis-team
---
# Enterprise observation functor grounding, Revision 2

This immutable Revision 2 supersedes only the defective claims in the research
note `2026-07-17-research-on-enterprise-observation-functor-grounding.md`, whose
SHA-256 remains
`b9f889d4c677cee915090c226c5bd795f5045e900b44ca28a3e5be8a3be2bbcb`.
Revision 1 is evidence and is not edited. Product-quality-assurance found two
substantive defects: Revision 1 treated task supersession as movement into an
archive, and it stated the fixed-fiber identity laws more strongly than the
checked Lean declarations. PQA reported that every other machine goal and the
unchanged harness passed. This note corrects those claims, removes the
nonexistent schema shorthand that made the old carrier-path goal weak, and
preserves the valid inventory, obligations, obstructions, and nonclaims.

The analysis still reads the management records through
`2026-07-16-research-on-rendanheyi-is-a-hoare-program.md` and
`2026-07-16-the-distal-bypass.md`. The first supplies the Hoare reading: instrument
executions compose through validated protocol records. The second supplies the
observation reading: local records, overlaps, settlement, gluing, causal
structure, valuation, and obstruction should be machine-derived.

Evidence method: the repaired `obsmetrologia-lean-lsp` skill was invoked first.
This initialized session exposed no Obsmetrologia/Lean MCP tools, so the
handshake remained unavailable in-session and a fresh session is still
required for LSP diagnostics, hover, goal, or axiom-audit evidence. The bounded
fallback was exact source inspection and the compiling, definition-free harness
`lib/emsenn/services/561-group/services/lenticule-science/src/services/obsmetrologia/scripts/CheckEnterpriseObservationGrounding.lean`.
It contains only imports and `#check` commands and remains byte-identical at
SHA-256
`e185f519457bae6258d81e5122b96c3cf8fe9120fe9e65c3b95d95fe185d65a6`.

Labels remain strict. **Proved** means the cited Lean declaration exists and
was compile-checked; it does not mean that declaration already describes
emsenn JSON. **Definable** means the carrier can be stated from inspected types,
but no production definition or preservation proof exists. **Conjectural**
means a correspondence still owes an encoding or proof. **Nonclaim** refuses
an inference.

## Source category

**Definable candidate.** Let EntExec be the free path category of successful,
authorized management-instrument executions over finite enterprise-history
states. An object contains the relevant validated instances of the eight
classes below, addressed by kind and id, together with journal position or an
immutable snapshot identity. It also distinguishes the append-only historical
record set from derived views such as the effective obligation board. A
generating arrow is one successful execution of an inspected writer or
composite instrument, including its input, output, and witness. Identity is the
empty trace. Composition is chronological concatenation when the first trace's
output state byte-for-byte equals the second trace's input state. No quotient
by observational equivalence is assumed.

Whole finite states, not bare instances, are necessary: `make-a-task.js` seats
a task and work-items; `dispatch-a-task.js` relates an existing task and office;
`write-an-office.js` may patch reciprocal edges; and `supersede-a-task.js`
appends a successor task and successor dispatch while a separate board readout
changes which dispatch is effective. Those are not unary functions between
single JSON records.

**Definable object classes.** The actual class carriers are:

- `lib/emsenn/services/board-of-directors/services/executive-office/lib/schemas/office.schema.json`, id `emsenn/schema/office`:
  normative structure, deontic profile, theory basis, and organizational edges.
- `lib/emsenn/services/board-of-directors/services/executive-office/lib/schemas/duty.schema.json`, id `emsenn/schema/duty`:
  authority, governed work, and correlative claimant.
- `lib/emsenn/services/board-of-directors/services/executive-office/lib/schemas/task.schema.json`, id `emsenn/schema/task`:
  machine-runnable goal, discharged duty, and subtasks or work-items.
- `lib/emsenn/services/board-of-directors/services/executive-office/lib/schemas/work-item.schema.json`, id
  `emsenn/schema/work-item`: a work-unit or workflow with actions.
- `lib/emsenn/services/board-of-directors/services/executive-office/lib/schemas/dispatch.schema.json`, id `emsenn/schema/dispatch`:
  task-to-office hand-off, with openness derived rather than stored.
- `lib/emsenn/services/board-of-directors/services/executive-office/lib/schemas/requirement.schema.json`, id
  `emsenn/schema/requirement`: raiser, ask, runnable settlement conditions,
  tier, change provenance, and realization edges.
- `lib/emsenn/services/board-of-directors/services/executive-office/lib/schemas/contract.schema.json`, id `emsenn/schema/contract`:
  material, precondition, move, postcondition, phase, lens, and evidence policy.
- `lib/emsenn/services/board-of-directors/services/executive-office/lib/schemas/anomaly.schema.json`, id `emsenn/schema/anomaly`:
  independently re-observable observation made while doing named work.

These eight `.schema.json` paths are the exact carriers used by this revision.
No shortened schema filename is evidence.

**Definable generating transitions inspected.**

- `lib/emsenn/services/board-of-directors/services/executive-office/lib/management/skills/write-an-office.js` creates, amends,
  checks, or withdraws a failed office write and maintains reciprocal edges.
- `lib/emsenn/services/board-of-directors/services/executive-office/lib/management/skills/write-a-duty.js` creates or amends duties,
  validates references, and withdraws a failed read-back.
- `lib/emsenn/services/board-of-directors/services/executive-office/lib/management/skills/make-a-task.js` creates a task and
  work-items; `--verify` is a read-only witness re-execution, not a state arrow
  and not worker self-attestation.
- `lib/emsenn/services/board-of-directors/services/executive-office/lib/management/skills/dispatch-a-task.js` creates a task-office
  hand-off and refuses a second dispatch of the same task.
- `lib/emsenn/services/board-of-directors/services/executive-office/lib/management/skills/writing-a-requirement/scripts/write-a-requirement.js`
  appends a requirement, a changed requirement, or tier/distribution snapshots;
  satisfaction remains a readout.
- `lib/emsenn/services/board-of-directors/services/executive-office/lib/management/skills/report-an-anomaly.js` appends an observation
  and neither fixes nor routes it.
- `lib/emsenn/services/board-of-directors/services/executive-office/lib/management/skills/supersede-a-task.js` resolves a decided
  authority, raises a successor task whose `x-provenance.supersedes` and `per`
  fields point backward, and raises the successor dispatch. The successor
  dispatch does not carry the pointer; `list-open-obligations.js` reads the
  pointer from successor tasks. The old task and dispatch are never amended or moved, and their append-only journal lines remain seated. Therefore, supersession is derived from the successor: the board reader scans successor task pointers
  and removes the old dispatch from the effective board without changing the
  historical record set.

Accordingly the supersession generator is the append of the successor task and
successor dispatch plus its witness. The effective-board change is a derived
observation of the output state, not deletion, relocation, or mutation of the
old source records. The causal edge runs from the old task and authorizing
decision to the later successor evidence; it is not a backward edge and it does
not erase the old event.

**Obstruction.** No management writer for `contract.schema.json` was found,
although
`lib/emsenn/services/board-of-directors/services/executive-office/data/contracts/sovereign-authority-custody-provider-acquisition.json`
is seated. Contract formation, amendment, discharge, and release cannot be
admitted as authorized EntExec generators merely because a schema and instance
exist. The source must initially exclude them or general-counsel must supply the
lawful instrument.

**Nonclaim.** A schema is a class, not an instance. Schema validation alone does
not authorize a transition; writer preconditions, refusal semantics, and
witnesses are part of each arrow.

## Target carrier inventory

These are the exact existing Lean carriers or theorems checked by the unchanged
harness.

- **Proved:** `Obsmetrologia.PredicationCell` in
  `Obsmetrologia/Language/Predicating/Cell.lean` is the oriented
  subject-predicate-object cell. Its `specialize_id` and `specialize_comp`
  prove local specialization laws, not enterprise functoriality.
- **Proved:** `Obsmetrologia.Valuation` in
  `Obsmetrologia/Language/Positing/Valuation.lean` is
  `PredicationCell -> Charge`; Charge is the four-corner bilattice carrier in
  `Obsmetrologia/Language/Positing/Charge.lean`.
- **Proved:** `Obsmetrologia.Claim.SitePoint` and
  `Obsmetrologia.Claim.FiberHom` in `Obsmetrologia/Site/Claim.lean` place a
  claim at a settling stratum and clopen support, with fixed-claim,
  fixed-stratum clopen-inclusion morphisms.
- **Proved:** `Obsmetrologia.Site.FiberHom.id` and
  `Obsmetrologia.Site.FiberHom.comp` in `Obsmetrologia/Site/Basic.lean` are the
  fixed-`q`, fixed-`tau` identity and composition operations.
  `Obsmetrologia.Site.fiber_id_comp` proves equality only of its `.incl`; `Obsmetrologia.Site.fiber_comp_id` proves equality only of its `.incl`.
  `Obsmetrologia.Site.fiber_comp_assoc` proves
  equality of the whole `FiberHom`. The inspected source and harness checked no
  full identity-equality theorem and no checked Category instance.
- **Proved:** `Obsmetrologia.AssocSheaf.restrict`,
  `Obsmetrologia.AssocSheaf.restrict_id`, and
  `Obsmetrologia.AssocSheaf.restrict_comp` in
  `Obsmetrologia/Site/Section.lean` give restriction identity/composition.
- **Proved:** `Obsmetrologia.ClosureRule.RuleSystem`,
  `Obsmetrologia.ClosureRule.Tstep`, and `Obsmetrologia.ClosureRule.clS` in
  `Obsmetrologia/Closure/RuleSystem.lean` carry rule closure and settlement;
  that file proves inflationarity, monotonicity, and least closedness.
- **Proved:** `Obsmetrologia.CausalSets.Causal.Order.CausalSet` and
  `Obsmetrologia.CausalSets.Causal.Order.CausalSet.reaches_trans` in
  `Obsmetrologia/CausalSets/Causal/Order.lean` carry a finite acyclic event
  order and transitive reachability.
  `Obsmetrologia.CausalSets.Causal.Reachability.properTime` in
  `Obsmetrologia/CausalSets/Causal/Reachability.lean` measures chain length.
- **Proved:** `Obsmetrologia.Cohomology.Cech1`,
  `Obsmetrologia.Cohomology.Cocycle`, `Obsmetrologia.Cohomology.glue`, and
  `Obsmetrologia.Cohomology.glue_coboundary` in
  `Obsmetrologia/Cohomology/SettlingCohomologyH1.lean` carry compatible local
  sections and constructive gluing.
- **Proved:** `Obsmetrologia.Cohomology.CoverNerve` and
  `Obsmetrologia.Cohomology.CoverNerve.H1rank` in
  `Obsmetrologia/Cohomology/CoordinationCohomology.lean` carry nerve counts and
  the cycle-rank obstruction.
- **Proved:** `Obsmetrologia.Landauer.landauerBits` and
  `Obsmetrologia.Landauer.landauer_zero_iff_reversible` in
  `Obsmetrologia/Cohomology/LandauerEntropy.lean` identify that rank with
  Landauer bits and prove vanishing exactly for the forest count equation.

**Obstruction.** No checked Lean structure combines site point, valuation,
closure system, causal set, Cech datum, and cover nerve. No checked full-site
morphism handles arbitrary changes of claim and stratum.
`Obsmetrologia.Claim.FiberHom` is intentionally fixed-claim and fixed-stratum;
`Obsmetrologia.Site.FiberHom` is fixed-`q` and fixed-`tau`. Neither supplies the
required full target category. The target category is therefore definable, not
already present.

## Object and morphism assignment

**Definable candidate F0.** For each validated enterprise-history state X:

1. deterministically normalize each record and schema-recognized reference into
   PredicationCells, preserving kind, id, field path, referenced address,
   journal identity, and evidence polarity;
2. place each claim in a Claim.SitePoint, with record class and jurisdiction
   determining fiber, append position determining stratum, and an explicit
   overlap mask determining clopen support;
3. assign a Valuation: knowledge-bottom for no evidence, truth-top for only
   support, truth-bottom for only refutation, and knowledge-top for both;
4. derive the authorized-transition dependency graph as a finite CausalSet; and
5. derive local overlap sections and, separately, their CoverNerve.

The historical component retains old and successor task/dispatch lines. The
effective board is a deterministic projection that excludes an old dispatch
when a uniquely read successor task points to its task. This distinction keeps
F0 append-monotone without pretending that a derived live view can only grow.
The product-shaped observation state's Lean structure and well-formedness
predicates remain undefined.

**Definable candidate F1.** Map a successful execution e : X -> Y to a structured
target transition that transports unchanged cells identically; adds or refines
cells named by the writer output and witness; advances append strata;
knowledge-joins new evidence; adds causal edges from consumed prerequisites to
produced records; restricts local sections on preserved overlaps; and
recomputes the cover nerve from resulting source-stance incidence.

For supersession, F1 retains the old task and dispatch cells, adds the successor
task cell carrying the backward pointer and the successor dispatch cell, and
recomputes the effective-board projection. It does not map supersession to a
removal morphism.

For a fixed claim and fixed stratum whose only change is smaller clopen support,
the site component may be a Claim.FiberHom. Most management executions are not
of that form and need a full-site morphism not supplied by the checked carrier.

**Conjectural.** Normalization is faithful enough to preserve every distinction
material to authorization. Collapsing ids, field paths, journal snapshots,
offices, successor pointers, or contradictory witnesses without an explicit
law could erase a border and invalidate F0.

**Nonclaim.** F0 and F1 are not Lean definitions, executable instruments, or a
proof that a functor exists.

## Preservation obligations

1. **Identity — definable, unproved for the candidate.** Prove the empty EntExec
   trace maps to target identity on every component. The checked
   `fiber_id_comp` and `fiber_comp_id` equalities can discharge only the
   `.incl` projection after an encoding exists; they are not whole-morphism
   identity theorems. `restrict_id` remains reusable for the restriction
   component.

2. **Composition — definable, unproved for the candidate.** For composable
   executions, prove F1(f after e) = F1(f) after F1(e), including journal
   identity, reciprocal writes, successor pointers, derived-board filtering,
   and witnesses. `fiber_comp_assoc` proves whole-FiberHom associativity, while
   `restrict_comp` and `reaches_trans` cover separate components; a coherence
   theorem tying them together is owed.

3. **Restriction/gluing — conjectural for enterprise records.** Define overlap
   covers and masks from exact references and jurisdictions. Prove normalized
   local sections form `Cohomology.Cocycle`, then apply `glue_coboundary` and
   uniqueness. Existing gluing assumes compatibility; it does not prove two
   JSON records agree.

4. **Causality — conjectural.** Prove every generator produces a finite acyclic
   dependency relation and composition preserves reachability. In particular,
   prove a supersession appends a successor after the old task and decided
   authority, preserves the old event, and changes only the derived effective
   board. CausalSet requires acyclicity as data; it does not derive it from
   journals.

5. **Valuation/settlement — conjectural.** Prove evidence-to-Charge is
   deterministic and append-only evidence is monotone under Valuation.leK.
   Define mutable-record snapshots and successor appends as monotone history
   even when the effective board projection shrinks. Then prove the selected
   ClosureRule.RuleSystem is the actual management rule set and that clS
   preserves record meaning.

6. **Obstruction/valuation — conjectural at value level.** Construct a
   well-formed CoverNerve and prove its counts. H1rank and Landauer theorems then
   apply. Still open is the value-level claim that every nonzero enterprise
   cycle prevents a monotone global section or needs total order; the
   `CoordinationCohomology.lean` source names this converse as a frontier.

7. **Authorization reflection — definable and mandatory.** Prove every source
   generator corresponds to exactly one authorized instrument success, while
   refusals, dry-runs, checks, board reads, and witness-only verification create
   no arrow.

## Obstructions and nonclaims

- **Obstruction:** no in-session Lean LSP handshake after package-root repair;
  compilation proves declaration availability but is not fresh-session LSP
  diagnostic, hover, goal, or axiom-audit evidence.
- **Obstruction:** contract.schema.json has no inspected lawful writer.
- **Obstruction:** fixed-fiber Claim.FiberHom cannot type claim/stratum changes,
  and the checked Site.FiberHom identity results cover only `.incl`.
- **Obstruction:** no target product category or enterprise record encoder.
- **Obstruction:** mutable snapshots, append-only successor records, and a
  shrinking derived board are monotone only under a not-yet-defined
  append-preserving history semantics.
- **Obstruction:** gluing requires a proved cocycle and lawful cover.
- **Obstruction:** the general value-level converse from nonzero rank to failed
  monotone section is explicitly open.
- **Nonclaim:** enterprise records are not already a Grothendieck site.
- **Nonclaim:** every authorized transition is not already a Claim.FiberHom or
  Site.FiberHom.
- **Nonclaim:** there is no checked Category instance for Site.FiberHom, and the
  two checked identity projections do not establish one.
- **Nonclaim:** validation does not prove functoriality, compatibility,
  causality, or settlement.
- **Nonclaim:** H1rank = 0 would not alone prove semantic record agreement.
- **Nonclaim:** Landauer bits are not assigned to the enterprise until a lawful
  nerve construction and preservation proofs exist.
- **Nonclaim:** this note authorizes no production Lean definition, theorem,
  schema, or management transition.

The bounded next proof task remains to define and review a lossless
record-to-predication encoding, an append-preserving enterprise-history
category that distinguishes immutable record history from derived board views,
and the full target observation-state category. Only then can identity and
composition be stated, followed by restriction, gluing, causality, valuation,
and obstruction preservation.
