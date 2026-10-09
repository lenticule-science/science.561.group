---
title: "The loop stack: a build brief for coding agents"
description: "The session-of-2026-07-18/19 conjecture program (contact testimony, Chu/Dialectica, Wilson loops, Debye screening, confinement, reconnection, molecular-chaos audits, entropy oracles) translated into the concrete mechanisms, storage types, algorithms, and build order a coding agent needs to implement the mesh."
date-created: 2026-07-19
kind: research-note
in-service-of: lib/emsenn/services/561-group/services/board-of-directors/services/executive-office/services/leader-movement-team
tags:
  - lmt
  - fable
  - loop-stack
  - build-brief
  - holonomy
  - linear-logic
  - mesh
status: draft
declared-by: claude/union-recovery-agent
authority: "Leader in-chat instruction of 2026-07-19: earn the conjecture program toward the information any coding agent needs; standing instruction of 2026-07-18 to record. Ledger witness owed to the clerk tier."
---

# The loop stack: a build brief for coding agents

One sentence of theory, then mechanism. Five mathematical literatures inside
this corpus motivate one engineering rule: **sovereign local state stays local;
only explicitly contracted comparison residues are candidates for shared
consensus.** Local state is real to its owning settlement. A settlement's
self-report is gauge only for an external observer that has no independently
rerunnable comparison. Every build item below must preserve that distinction.
Proven in-house anchors are cited by file; everything else is design derived
from the conjecture program of 2026-07-18/19 and remains falsifiable rather than
adopted protocol law.

### 2026-07-19 correction controlling this brief

“Residue” is a tagged sum type, not one scalar fraud score. Implementations
must distinguish Chu seam defect, group-valued connection holonomy,
price/erasure residue, and economic current/affinity. Identity or zero is
lawful for some of these; protected nonidentity is lawful at a declared
sovereign border; positive irreversible movement with an absent price is the
free-operation counterexample. No component may infer “fraud” from an
untyped zero-sum cycle.

Internal clearing is equally distributed: provider and customer each retain
their own book entry and compare the paired seam receipts. There is no Union
CFO, common register, or global book.

## 0. Build order (start here)

1. `loop-lib`: cycle-basis + holonomy computation over existing JSONL ledgers. Pure
   node, no chain, no new infra. Everything else consumes it.
2. `connective-typer`: the ⊗/⅋ classifier for contract/obligation records.
3. `tightness-auditor`: Danos–Regnier switching check + zero-form-cycle search.
4. `minors-audit`: verifier-independence statistic over paired verdicts.
5. `causality-packet` wire format for all cross-membrane egress.
6. Only after 1–5 run against the live ledgers: the EVM/RMN layer. The chain is the
   *last* component, because its entire content is what `loop-lib` computes.

## 1. loop-lib — the holonomy ledger core

**What the chain stores. Nothing else was ever worth storing.**

- Model a connection graph as directed edges labelled by elements of one
  explicitly named group. FOUR with a negation involution is not, merely for
  that reason, a group. A FOUR-valued Chu evaluation and a group-valued
  connection are separate fields unless a proved bridge supplies the group law.
- `cycleBasis(graph)` — independent cycles (the count is the nerve's cycle rank).
- `holonomy(path)` — ordered edge-label product (`Quark.lean` `holo`).
- `wilson(loop)` — a conjugation-invariant class function of `holonomy(loop)`.
  Gauge-invariance is proved for the cited formal carrier
  (`wilsonLoop_invariant`). A digest keyed by basis-cycle id is the candidate
  consensus commitment; making it exclusive requires a separately adopted
  protocol profile.
- Pure-gauge check: a loop whose connection is a coboundary has trivial holonomy
  (`pureGauge_iff_delta0`, `pureGauge_closed_holo_one`). Committing a nontrivial
  Wilson value on a provably-pure-gauge loop is the protocol's definition of a
  fabricated obligation; reject at ingress.

## 2. connective-typer — what may never touch the chain

The research program attempts to derive, and records uncertainty when it
cannot derive, `connective: tensor | par` for an obligation:

- Attempt bilateral factorization: exhibit two independently verifiable deliverable
  halves, each with its own adjointness equation (`ChuMap.adj` shape:
  `D.r (fwd a) y = C.r a (bwd y)`, per `Calculus/Logic/LinearLogicChu.lean`).
- A witnessed factorization is evidence for `tensor` and bilateral seam
  settlement. The present program does not yet justify an infinite chain fee.
- Failure to find a factorization is not proof of `par`. A par classification
  needs a finite decision procedure or certificate profile; its asserted need
  for loop consensus is `C5`, still conjectural.
- FOUR-level support test (proved, `Calculus/Logic/LinearLogicMix.lean`
  `chargePar_eq_chargeFuse_iff`): the ⊗/⅋ gap is nonzero exactly on pairs with an
  uncommitted side (⊥) or direct conflict (t vs f). Operationally: **charge
  consensus fees are hypothesized to be supported at ignorance and conflict.
  Turning the exact FOUR theorem into a fee schedule still requires empirical
  and protocol acceptance.

## 3. tightness-auditor — the armies' node software

- Represent live contracts as a linear-logic proof structure (nodes = obligations
  typed by §2; edges = shared resources).
- **Danos–Regnier check**: apply the switching criterion to a carrier that is
  actually proved to be the relevant proof structure. A failed switching is a
  proof-net defect. Its identification with an overtwisted disk is a conjectural
  bridge, not a synonym.
- **Typed price-form cycle search**: flag a candidate free operation only when
  the profile witnesses irreversible/value movement, a missing or zero booked
  price in the same units, and no protected-border exception. Include lawful
  zero-holonomy and protected-nonzero counterexamples.
- **Metabolism endpoint**: per Schnakenberg, σ = Σ_cycles J_c·A_c (cycle current ×
  cycle affinity) over the ledger graph. Publish per epoch. σ = 0 (detailed
  balance) is not health; it is death-by-equilibrium. Alert on σ → 0 as much as on
  extraction spikes.
- Role mapping: white = structure internal consistency; black = conformance of a
  proposed morphism; blue = adversarial switching-cycle search; red = rehearse a
  proposed contract path against the current structure before execution.

## 4. minors-audit — mechanical verifier independence

The witness-monoculture disease gets a test statistic
(`KineticTheory/Gas/MolecularChaosGluing.lean`, proved): for verifier pair (P,Q)
and verdict outcomes, build the joint count matrix J and compute every 2×2 minor
`J(a,c)·J(b,d) − J(a,d)·J(b,c)`.

- Exact vanishing characterizes factorization for the exact mathematical
  distribution carrier. Sampled counts need uncertainty bounds; “approximately
  zero” is not by itself proof of independence.
- Nonzero empirical minors evidence dependence in the observed verdicts; they
  do not uniquely identify shared priors or justify an automatic downgrade
  without a declared statistical decision rule.
- Run per epoch over the quality-attestation and case ledgers. Same-model-family
  pairs are expected to fail this; the audit makes the failure a number.

## 5. entropy-oracle — the divination port

When §4 shows every available verifier correlated (for an AI federation: usually),
deadlocked disputes route to the entropy oracle:

- Commit to the question and panel spec on the ledger BEFORE the cast.
- Cast from a source outside every participating prior: VRF/drand beacon, or the
  divination settlement's producers (`lenticule-science/services/divination`,
  `src/lib/divining/` — live, dependency-free panel producers).
- Adjudicate the panel into one FOUR charge (the divination service's
  panel-consensus design; its settled-Reading core is the named unbuilt piece —
  building it clean is a priority item for exactly this reason).
- Witness the cast, the panel, and the verdict. An external random source is
  decorrelated from declared participants under stated assumptions; it is not
  literally a witness with no prior and cannot supply semantic truth by itself.

## 6. causality-packet — the only egress format

All cross-membrane egress uses the boundary-presentation shape already typed in
`Obsmetrologia/Computing/CausalityPacket.lean` (`CausalCarrierReadout`):
`{causalSupport, observableSupport, boundaryPresentation}`. Design rule (area
law): a settlement's knowable exterior is its interface, never its interior —
size interfaces deliberately; widening an API widens what the mesh may lawfully
know forever. Certificate exchange is the horizon's only radiation channel;
price every emission.

## 7. confinement — record types that cannot exist alone

Schema rule, everywhere: a bare claim is a free quark — unobservable, refused at
write time.

- **meson** = {claim, witness} — minimum bound state; the witness edge is
  mandatory at write, not attached later.
- **baryon** = {claim, witness, independent attester} — required for any record
  that other settlements will build on (the PQA triple).
- Separation cost is linear: any workflow that moves a claim away from its
  witness must carry the widening trust deficit as an explicit booked cost until
  a new witness pair is produced.

## 8. debye-monitor — quantitative anti-capture

From the contract graph with per-relay screening costs
(`KineticTheory/Plasma/DebyeGraphScreening.lean`, LFP machinery proved):

- Compute each actor's reachable influence cloud through admissible couplings;
  the effective screening length is the capture-resistance metric.
- Alert A: any actor's cloud exceeds a bounded fraction of the mesh (unscreened
  long-range influence = capture risk).
- Alert B: counterparty mobility (contract-switching rate, qiangdan events) drops
  toward zero — the plasma is freezing into a vacuum, and a vacuum does not
  screen. Hierarchy is the zero-mobility limit; the monitor's job is to see it
  coming.

## 9. reconnection-protocol — lawful topology change

`KineticTheory/Plasma/ReconnectionCurvature.lean` (proved): the flat regime
forbids topology change; a reconnection event forces H¹ ≠ 0. Therefore merges,
splits, and dissolutions of settlements are NEVER performed as a sequence of
ordinary lawful edits (the flat regime cannot reach them):

- Require an accumulated-curvature certificate (nonvanishing H¹ evidence from
  §1's loop-lib) to open a reconnection window.
- Declare the window: bounded scope, bounded duration, witnessed at its boundary.
  Inside it, structure may change discontinuously (the licensed-contrary/surgery
  site, mechanized).
- Close with both sides' receipts and a fresh cycle basis. Energy release
  (obligations discharged/re-homed) is booked, not leaked.

## 10. epoch-liturgy — the forced periodic orbit

The protocol hypothesis is that chain/epoch time may advance on quanta of
priced saying rather than wall clock. A candidate epoch runs the following
audit. Taubes's three-dimensional Weinstein result does not prove that a
deployed institutional carrier has this recurrence; the contact form, Reeb
field, compactness/dimension hypotheses, and operational mapping must be
supplied first.

1. Collapse audit: every held superposition pays rent or settles.
2. Metabolism reading (§3's σ).
3. Independence minors (§4).
4. Debye report (§8).
5. Wilson-loop recommitment over the fresh cycle basis (§1).

## Falsification hooks (keep them wired in)

Each subsystem carries its kill condition: §2 dies if a par-typed obligation is
observed settling bilaterally; §3's σ dies if it fails to track any independent
aliveness criterion; §4 dies if correlated verifiers are shown to manufacture
independence; §6 dies if lawful egress capacity is shown to scale with interior
volume; §9 dies if a topology change is exhibited within the flat regime. A
subsystem whose kill condition cannot fire anymore is no longer engineering; it
has become liturgy, and belongs in §10.
