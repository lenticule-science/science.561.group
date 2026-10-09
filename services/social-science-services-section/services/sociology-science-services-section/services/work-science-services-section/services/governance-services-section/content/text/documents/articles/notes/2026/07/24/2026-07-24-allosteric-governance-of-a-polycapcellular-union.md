---
title: "Allosteric Governance of Distributed Capability Organisms: A Formal Model"
description: "Argues that this settlement's no-direct-intervention governance rule is not merely analogous to allosteric regulation but the same control-theoretic object, and derives from that identity a governability condition, an error-catastrophe bound, and a Coasean-mycorrhizal boundary-pricing rule. Section 4.1 makes the identity concrete: binding-site colors realized as a Wang (1961) tiling, whose Jeandel-Rao (2015) minimal aperiodic set — machine-witnessed in this corpus by a nonzero H1 cohomology class — proves a finite local matching rule can replace a democratic republic's periodic counting mechanism with a legitimacy test that has no aggregation point to capture, because it has no aggregation point at all. The error-catastrophe bound is then checked against a live, independently re-verified instance already on disk: 44 of the executive office's 45 duty records name a claimed owner other than the office whose own record actually lists that duty, read as the model's predicted signature of a correction process that has never run, not a hygiene defect to fault any one office for."
date-created: 2026-07-24
kind: research-note
keywords:
  - allostery
  - governance
  - economics
  - coase
  - mycorrhizal-markets
  - kinetic-proofreading
  - error-catastrophe
  - stigmergy
  - coordination-cohomology
  - rendanheyi
  - duty-registry
  - wang-tiles
  - aperiodic-order
  - jeandel-rao
status: design
declared-by: claude-interactive-session-supplying-leader-movement-team
---


## Abstract

A recurring constraint in this settlement's governing law — no office may act on another unit's
execution directly, only a market or a contract may — has so far been justified by appeal to
management doctrine (Rendanheyi's zero distance, `ling-juli.md`) and to political temperament
(Ming-Daoist wu-wei). This note argues the constraint has a third, independent justification: it is
formally identical to allosteric regulation as studied in biochemistry since Monod, Wyman, and
Changeux (1965) and Koshland, Nemethy, and Filmer (1966) — control exercised only at a site distinct
from the one doing the work, propagated through a change in accessible configuration rather than
direct modification. Taking that identity seriously yields four derived results, not analogies: a
governability condition bounding when non-interventionist control is even possible, given as an
inequality between a graph's connectivity and its constituent units' drift rate; an error-catastrophe
bound, following Eigen (1971) and Hopfield (1974), on how infrequently a coordination system can
afford to audit itself before coherence is lost regardless of local effort; and a boundary-pricing
criterion that recovers, from the same connectivity argument, both Coase's (1937) transaction-cost
theory of the firm and the biological-market account of mycorrhizal exchange (Noë and Hammerstein,
1994; Kiers et al., 2011). Section 4.1 makes the allosteric identity concrete rather than leaving it
qualitative: binding-site colors, realized as a Wang (1961) tiling with a Berger (1966)/Jeandel–Rao
(2015) matching rule and witnessed in this corpus by a finite, machine-checked nonzero `H¹`
cohomology class, prove that a legitimacy test built from local color-matching alone — no
aggregation, no count — can be *proven* incapable of collapsing into the small number of repeating
configurations a democratic republic's periodic counting mechanism cannot itself rule out. The
error-catastrophe bound is then checked, not merely asserted, against
a live instance already on disk: of the executive office's 45 duty records, 44 name a claimed office
other than the one whose own record actually lists that duty as borne — re-derived directly against
the live JSON for this note, not taken on a prior report's word — read as the model's predicted
signature of a correction process that has never run at all, not a defect in any one office's
diligence, which is the same diagnostic move Rendanheyi's own account of large-enterprise disease
makes about income determination rather than personnel failure (`da-qiye-bing.md`). Consistent with
this settlement's own ruling that a Lean proof is a persuasion service and never a legitimating badge
(`2026-07-24-the-math-is-the-product-lean-is-a-service.md`), the propositions below are argued on
their own terms; imported proved objects are cited here for calibration of vocabulary, not offered as
evidence that the propositions built on top of them are true.

## 1. Introduction

Every governance framework this settlement has drawn on — Rendanheyi's micro-enterprise model,
Legalist Fa/Shu/Shì, Ming-Daoist wu-wei — converges on one prohibition: a governing body may not
reach into a unit's own execution. It may write a contract, install a hook, define a schema, decide
a checkpoint. It may not edit what a unit is doing while it does it. This prohibition has been stated
repeatedly across this settlement's research notes as doctrine, cited to management theory and
classical political philosophy, and never given an independent theoretical grounding of its own.

This note supplies one, and then checks it. The claim is narrow and checkable: governance restricted
to this prohibition is not merely *like* allosteric regulation, it is the same mathematical object
under a relabeling — a control scheme where every legal action modifies a binding site and the effect
on the catalytic site is entirely mediated by the unit's own response function. Once that identity is
accepted, results already established for allosteric and related biological control systems transfer,
and several of them turn out to bound or sharpen claims this settlement's own governance doctrine has
so far only asserted. One of those results — the error-catastrophe bound of Section 6 — is not left
as a bare inequality defended only by structural analogy to biology and economics: Section 7 tests it
against a live, independently re-verified case already sitting in this settlement's own executive-office
registers, on the view that a proposition this settlement might use to justify anything about its own
conduct should be checked against that conduct wherever a check is available at all.

## 2. Related work

**Allostery.** Two classical formal models exist for how a distant binding event changes catalytic
behavior: the concerted (MWC) model of Monod, Wyman, and Changeux, in which the whole molecule
switches between a small number of discrete global conformations, and the sequential (KNF) model of
Koshland, Nemethy, and Filmer, in which each subunit shifts conformation incrementally and
independently in response to local binding. Neither model requires — or permits — direct modification
of the catalytic residues themselves; regulation is entirely a shape effect.

**Stigmergy.** Grassé (1959) named the phenomenon by which social insects coordinate not through
direct signaling but through modifications each leaves in a shared environment, read and acted on
by others with no requirement of symmetric exchange. This settlement's own prior-art notes on
embodied drone collectives establish, as a theorem sketch
(`2026-05-21-predicated-drone-collective-fails-classical-stigmergy.md`), that classical stigmergy's
convergence guarantees require symmetric reciprocal signal exchange among participants, and fail for
heterogeneous, asymmetrically-observing agents — precisely the condition a mixed population of
capability cells, characters, and human principals satisfies. That failure mode is addressed below
in the same terms it is addressed there: not by forcing symmetry at the participant layer, but by
routing coordination through a shared substrate that is itself symmetric.

**Kinetic proofreading and error catastrophe.** Hopfield (1974) and, independently, Ninio (1975)
showed that biological fidelity — correct amino acid selection during translation — is bought by
spending free energy and time at an irreversible checkpoint, not by better initial discrimination;
fidelity has a cost, and the cost buys a specific, boundable error rate. Eigen (1971) showed
separately that a self-replicating information carrier subject to a mutation rate above a critical
threshold relative to its own length cannot maintain a coherent quasispecies at all, regardless of
selective advantage — coherence is a property of the rate relationship, not of any single replication
event's fidelity.

**Wang tiles and aperiodic order.** Wang (1961) posed the domino problem — can a finite set of
edge-colored square tiles with a matching rule tile the plane, and if so must some tiling be
periodic — as a question about decidability. Berger (1966) answered the second half: some finite
rule sets tile the plane only non-periodically, and proved this by exhibiting one. Jeandel and Rao
(2015) found the minimal such set (11 tiles, 4 colors), and Labbé (2018) gave it a substitutive,
marker-domino structure this corpus's own Lean development extracts a finite cohomological witness
from (`jeandelRaoMarker01_nonzero_h1_class`). Section 4.1 is the first place in this corpus's
governance research that this literature is connected to a political claim rather than left as pure
combinatorics; the connection is this note's own argument, not a restatement of anything Wang,
Berger, Jeandel, Rao, or Labbé assert.

**Transaction-cost economics and biological markets.** Coase (1937) argued firms exist exactly where
internal coordination by fiat is cheaper than repeated market contracting, and dissolve into market
relations at the point where that stops holding — a firm's boundary is a transaction-cost boundary,
not an org-chart artifact. Noë and Hammerstein (1994) proposed biological market theory as a general
account of interspecies cooperation under partner choice, and Kiers et al. (2011) demonstrated it
directly in mycorrhizal symbiosis: resource transfer between a fungus and a plant root is measurably
priced and sanctioned, a genuine market, while transport within one connected fungal mycelium follows
unpriced source-sink physiological gradients. No citation in either literature references the other.

**This settlement's own standing ruling on proof status.** A note built partly from imported
Lean-proved objects risks exactly the failure this settlement ruled against by name:
treating "proved in Lean" as a badge that makes a claim more legitimate rather than as one service
among others. The ruling is verbatim and unambiguous — Lean proofs exist "to show the proofs," not
to certify that the underlying math "was worth writing code around" is itself beyond argument, and
"badge prose" asserting Lean-certification without a checked linkage is banned outright
(`2026-07-24-the-math-is-the-product-lean-is-a-service.md`). This note follows that ruling
throughout: where a Lean-proved object is cited below (the spectral-gap bound behind Definition 5,
the coordination-cohomology identity behind Section 6's reading of a correction pass as erasure with
a floor cost), the citation supplies vocabulary and a checked inequality this note then reasons with,
not a certificate that the proposition built on top of it is therefore true. The propositions are
argued in their own *Justification* paragraphs, and stand or fall on those arguments alone.

## 3. Formal preliminaries

**Definition 1 (Capability cell).** A capability cell is a pair $(a_c, \beta_c)$, where $a_c$ is its
active-site state — the internal execution realizing its one bounded capability, opaque to every
other cell — and $\beta_c \subseteq B$ is its exposed binding-site set: the schemas, contracts, duty
claims, and interfaces through which any other party may act on $c$ without reading or writing
$a_c$ directly.

This is not an abstraction laid over the settlement's actual units from outside; the same split is
already load-bearing in how this settlement distinguishes an office from its incumbent. An office
"persists independent of incumbent... defines *what*, not *who*" (Union Officer Academy Rom Keldar
specification `offices.md`), while a character or incumbent carries the mutable memory, persona, and
moment-to-moment conduct that actually executes the office's duties — "a model or API call is one
ephemeral animation of a session character, not the character itself" (Union Officer Academy
`README.md`). An office's schema, its `bears-duty` array, and the duty records it claims are exactly
$\beta_c$; an incumbent's own session-to-session conduct realizing those duties is $a_c$.

**Definition 2 (Coordination graph).** $G = (V, E)$, where $V$ is the union of all capability cells,
offices, and characters in the settlement, and an edge $(u, v) \in E$ holds exactly when $u$ carries
a live binding-site reference into $v$ — a contract, a duty claim, a dispatch record, a schema
dependency.

**Definition 3 (Governance action).** A governance action is a function $g : B \to B'$ over the
binding-site space. $g$ is *active-site-preserving* if, for every cell $c$, applying $g$ leaves
$a_c$ unchanged at the moment of application; $a_c$ may change afterward only through $c$'s own
transition function $T_c(a_c, \beta_c) \mapsto a_c'$ responding to the new $\beta_c$.

**Definition 4 (Admissibility).** $g$ is admissible iff it is active-site-preserving. This is a
formal restatement of Rendanheyi's zero-distance/no-middle-management law — stated in this
settlement's own glossary as the requirement that "nothing stand between the person doing work and
the user whose value that work creates," excluding management relay layers, internal proxies, and
aggregate measures alike (`ling-juli.md`) — and of Ming-Daoist wu-wei, as one constraint on the space
of legal governance functions, not two doctrines that happen to agree.

## 4. The allosteric correspondence

**Proposition 1.** The admissible governance actions under Definition 4 are exactly the class of
perturbations biochemistry classifies as allosteric: interventions applied at a site distinct from
the catalytic site, whose effect on catalytic behavior is entirely mediated by a shift in the
accessible conformational ensemble.

*Justification.* By Definition 4, $g$ cannot write $a_c$. Any influence $g$ has on $c$'s future
behavior must therefore route through $T_c$, which reads only $\beta_c$. This is exactly the
structural condition MWC and KNF both impose on a regulatory ligand: it may shift which
conformational states are accessible or preferred, and it may never touch the catalytic residues'
own chemistry. The two classical models further supply a genuine typology rather than a single
mechanism — a cell may respond to a binding-site change the MWC way, switching wholesale between a
small number of discrete configurations (an office reassignment, a contract superseded outright), or
the KNF way, adjusting incrementally and locally in response to each new binding event (a schema
field tightened, a duty clause amended). Which regime a given cell implements is an empirical fact
about its own $T_c$, not a modeling choice available to the governor — and it determines what kind of
governance action will actually move that cell's behavior versus sit unread at its binding site.

### 4.1 Binding-site colors as a Wang tiling, and what replaces counting

Proposition 1 already restricts every admissible action to $\beta_c$. Making that surface concrete
turns the correspondence into a checkable combinatorial model rather than a qualitative one:
represent $\beta_c$ as a finite coloring of $c$'s boundary directions in $G$ — one color per live
binding-site reference — and require that two adjacent cells' shared edge carry matching colors
before an admissible action may install that adjacency. This is not a second model set beside
Proposition 1; it is Proposition 1's own admissibility test written out as a Wang (1961) matching
rule: legality is decided by comparing a finite label at the shared boundary, never by reading or
aggregating anything about either cell's active site $a_c$, and never by tallying opinion across
cells not party to the edge.

That local-only test is exactly the machinery Wang (1961) posed and Berger (1966) answered: a finite
set of edge-colored tiles with a matching rule can force every valid tiling of the plane to be
non-periodic — there exist finite rule sets for which *no* periodic tiling satisfies the rule at all,
yet the plane can still be validly, completely tiled by that rule. Jeandel and Rao (2015) found the
minimal such set — 11 tiles, 4 colors — and this corpus carries a machine-checked, dependency-free
finite witness of it: `jeandelRaoMarker01_nonzero_h1_class`
(`Obsmetrologia/AperiodicOrder/Tiling/Witness/JeandelRao.lean`) exhibits a nonzero `H¹` cohomology
class on a finite one-vertex cochain complex extracted from the Jeandel–Rao set, following Labbé's
(2018) marker-domino construction — a finite, purely local certificate, settled by `decide` over a
closed integer complex, that the tiling carries genuine non-periodic structure. The file's own scope
note is exact about what this is not: "these are finite witness theorems. They do not prove that
every Jeandel–Rao tiling is non-periodic... each class is a candidate local representative of a
future `cl-inv` projection, not `cl-inv` itself" — a caveat this note keeps rather than rounds away.

Read against Definition 4, this supplies the missing half of Proposition 2's governability
condition. Section 5 shows admissible action can *propagate* fast enough to govern; this shows a
system built from admissible, color-matched actions can also, given the right finite coloring rule,
be *proven incapable of collapsing into a small number of repeating configurations* — the failure
mode no counting mechanism can rule out of itself. A democratic republic's legitimating act is a
count: preferences aggregate on a fixed period (an election cycle), a majority function selects one
of a small number of discrete outcomes, and the resulting structure of power is, by construction,
periodic — the same coalition or alternation recurring every cycle unless the count itself changes.
Periodicity is not a failure of a democratic republic; it is what counting produces when the
underlying preference structure is stable, and nothing in the counting mechanism forbids it. A
coordination graph governed only under Definition 4 has no counting step anywhere to produce that
periodicity from: legitimacy is decided edge-by-edge, by color match, the same test everywhere, with
no aggregation point a faction could capture because there is no aggregation point at all. The
Jeandel–Rao result is what turns "no counting step" from a bare absence into a positive property:
a finite, checkable rule set of that shape does not merely happen to avoid periodicity — for some
such rule sets periodicity is *impossible* — and the impossibility itself is what
`jeandelRaoMarker01_nonzero_h1_class` witnesses, locally and finitely, in the exact place a count
would otherwise have to go.

A second, narrower proved fact from this corpus sharpens one corner of this without extending the
claim past what it supports. `ChromaticTileGap.lean`'s crystallographic-restriction family
(`tile_gap_char_root`) proves algebraically that a path-graph tile's spectral gap `2 − √d` sits among
the periodic (crystallographic) orders only for `d ≤ 4`, and that the pentagon's gap
(`d = 5`, `tile5_gap_char_root`) is the first value this family produces that provably falls
*outside* that set — algebraic proof, not search, that a fivefold-organized structure cannot be the
symmetry of any periodic tiling in this family, the same crystallographic-restriction fact
responsible for the classical result that regular pentagons cannot tile the plane periodically. The
file's own docstring is explicit that this is "not a claim about Penrose tilings, matching rules, or
any continuum aperiodic order, only this one algebraic-family fact," and this note keeps that scope
intact: it is offered here only as a second, independently-proved instance of the same shape as the
Jeandel–Rao result — a finite algebraic fact ruling out periodicity for a specific structure, in
place of any count — not as a further claim about capability-cell governance in its own right.

This bridge is this note's own synthesis, not a claim any cited file makes about governance. Wang
(1961), Berger (1966), and Jeandel and Rao (2015) prove facts about plane tilings; `JeandelRao.lean`
and `ChromaticTileGap.lean` formalize finite witnesses of two of those facts; neither literature nor
either Lean file says anything about elections, aggregation, or political legitimacy. That
Definition 4's admissibility, realized as edge-color matching, replaces a democratic republic's
periodic counting mechanism with a finite local rule whose non-periodicity is a proved rather than
hoped-for property is this note's argument, resting on Proposition 1's already-established identity
between admissibility and allosteric shape-matching — a further specification of that one
correspondence, not a second, competing model standing apart from it. Prior art already in this
corpus surveys the coloring side of this directly
(`2026-06-26-memo-on-coloring-aperiodic-tiles.md`,
`2026-07-01-research-on-wang-tiles-and-sheaf-laplacians.md`) without yet drawing this governance
conclusion; this note is the first place that connection is made, and it is accordingly the least
settled claim in the note — flagged again in Section 10.

## 5. Propagation and the governability condition

Admissibility alone does not guarantee governance works. A binding-site change that never reaches
the cells it's meant to affect is admissible and useless. This settlement's own proved objects
supply the missing bound.

**Definition 5 (Propagation rate).** The rate at which a perturbation to $\beta_u$ at one vertex
$u$ reaches a distant vertex $v$ in $G$ is bounded above by $\lambda_2(L_G)$, the algebraic
connectivity of $G$'s graph Laplacian — the standard spectral-gap bound on consensus and diffusion
dynamics over a graph, and the object this settlement's allosteric-law research cites as the proved
carrier of Legalist $sh\grave{i}$ (positional power).

**Definition 6 (Drift rate).** Each cell's active site evolves under its own local dynamics at some
rate $\delta_c$ independent of any governance action — ordinary execution, market activity, model
updates, a character's own accumulating decision history.

**Proposition 2 (Governability condition).** A coordination system is governable under Definition 4
only if $\lambda_2(L_G) \gtrsim \max_c \delta_c$, up to a constant set by the tolerable correction
latency.

*Justification.* This is a sampling condition in the control-theoretic sense: a controller confined
to binding-site actions cannot correct drift it cannot outrun. If every cell's active site drifts
faster than a binding-site perturbation can propagate to it, admissible governance degenerates to
governance of the past — every correction lands on a configuration the cell has already left. Below
this threshold, the system has exactly three admissible futures: rising incoherence (the cohomological
signature developed in Section 6, checked against a live case in Section 7), founding a new,
separately-governed graph component (a genuine organism boundary, addressed in Section 8), or
abandoning Definition 4 — becoming interventionist, which is this model's formal name for what
Rendanheyi's own diagnosis calls large-enterprise disease: not a cultural or personnel failure but
"the correct behavior of rational people whose income, standing, and continued employment are
determined internally" (`da-qiye-bing.md`) — the same move Proposition 2 makes about coordination
graphs generally, substituting a rate condition for a character judgment. Wu-wei, on this reading, is
not unconditionally correct non-intervention; it is non-intervention that remains valid exactly where
Proposition 2's inequality holds, and stops being valid the moment it doesn't. The doctrine survives;
its scope is now a rate condition rather than an article of temperament.

## 6. Fidelity and the error-catastrophe bound

Even a governable system, in Proposition 2's sense, does not correct itself continuously — audits,
normalization passes, and register reconciliation happen at some cadence, not instantaneously.

**Definition 7 (Correction interval).** Binding-site correction occurs at intervals of length $\tau$,
each pass able to resolve drift accumulated since the previous one at some fidelity $f \in (0, 1]$.

**Proposition 3 (Error-catastrophe bound).** There exists a critical ratio of uncorrected active-site
drift to $f/\tau$ above which the coordination graph's coherence — informally, its standing as one
identifiable organism rather than a set of records that happen to share a filesystem — cannot be
sustained by any amount of local diligence at individual cells, exactly as Eigen's quasispecies
threshold bounds heritable coherence by mutation rate against genome length regardless of any single
replication event's accuracy, and exactly as Hopfield/Ninio kinetic proofreading shows fidelity is
bought by a checkpoint's energy and delay cost, not by the individual binding event trying harder.

*Justification.* Treat the settlement's constitutional graph (offices, duties, claims, contracts) as
the heritable structure and each correction pass as one round of proofreading. If drift between
passes routinely exceeds what a pass at fidelity $f$ can resolve, uncorrected error compounds round
over round independent of how carefully any single office keeps its own local records — coherence
loss becomes a property of the *schedule*, not of any office's competence. This reframes "audit
regularly" from hygiene advice into an inequality with a genuine threshold shape: below it, occasional
correction suffices; above it, no correction cadence recovers coherence without also reducing drift
or increasing per-pass fidelity. Section 7 tests this bound, rather than only asserting it, against
a live case already sitting in this settlement's own records — not a measurement of $f$ or $\tau$,
but a check of the qualitative shape the bound predicts when a correction pass has effectively never
run.

## 7. A checkable instance: the duty/office registry

Propositions 2 and 3 are stated as inequalities about rates this note does not measure. That is a
real gap, and Section 10 says so plainly. But one part of the claim does not require measuring a
rate at all: the claim that when a correction process never runs, a coordination graph should
already show cells that no longer agree about who bears what — not eventually, but now. This
settlement keeps exactly the register that would show it, if it existed.

The executive office's `content/duties/` pool holds 45 duty records, each with a `claim` field
naming the office its author believed would bear the duty. The executive office's `content/offices/`
pool holds 34 office records, each with a `bears-duty` array its own author populated independently.
If these two record types were ever swept into agreement by a correction pass, most `claim` fields
would name an office whose own `bears-duty` array lists that duty back. Re-derived directly against
the live JSON on disk for this note — not taken on a prior report's word — the count is: of 45 duty
records, exactly one, `reporting-an-anomaly` (claiming `quality-operations`), is listed in the
`bears-duty` array of the office it names, and that single match holds only because
`reporting-an-anomaly` is listed as borne by every office that carries a `bears-duty` array at all
(31 of the 34 office records), which makes it a universal duty rather than a genuinely reconciled
one. Checking that universality directly turns up a small correction worth stating rather than
silently absorbing: two offices, `quantitative-methods-lead` and `gambling-methods-lead`, carry no
`bears-duty` field at all (both seated outside `lib/emsenn/` proper, under `lenticule-science`), and
a third, `director-of-the-executive-office-of-the-board-of-directors`, has a `bears-duty` array that
lists only `managing-a-glossary` — not `reporting-an-anomaly`. So the one apparent match is universal
across 31 of 34 offices, not literally all of them.

The remaining 44 duty records each name a claimed office that does not list them back. Thirty name a
real, different office than the one that actually bears the duty: `delivering-a-charter` claims
`integrated-portfolio-management-team`, but only `product-development-team-leader`'s own record
lists it; `writing-a-high-level-design` claims `system-architect`, but only `module-lead`'s own
record lists it; `realizing-a-requirement` claims `requirements-analysis-team` — whose own record
states it "does not realize what it analyses" — while the duty is in fact borne only by
`requirements-implementation-team`. Fourteen name a claimant under which no office's `bears-duty`
array lists them at all: eight where the claim is `emsenn` (the settlement itself, not one of its 34
seated offices) and the duty appears in no office's array — `hold-the-standing-picture`,
`install-an-officer`, `absorbing-a-session`, `commissioning-a-record`, `commissioning-an-office`,
`sweeping-the-standing-inventory`, `settle-recurring-pattern-into-mechanism`, and
`writing-a-system-operational-concept` — and six where the claim names a real office whose own
`bears-duty` array simply omits it, e.g. `writing-a-conformance-plan` claims
`product-quality-assurance`, whose own three-item array does not include it.

Read against Proposition 3, this is not forty-four separate acts of carelessness. `claim` and
`bears-duty` are populated by different authoring acts — a duty record is written once, an office
record is written and later amended independently of it — and nothing in this settlement currently
sweeps the two into agreement; there is no correction pass here at all, which is the $\tau \to
\infty$ case, not merely a $\tau$ that is too long relative to drift. Under Proposition 3's framing,
a graph in that condition is not predicted to mostly cohere with a few visible gaps; it is predicted
to look close to what was just counted — near-total disagreement, with one artifact of accidental
universal coverage standing in for a genuinely reconciled duty. The parallel to Rendanheyi's own
diagnostic move (Section 5) is worth naming directly rather than leaving implicit: `da-qiye-bing.md`'s
claim that large-enterprise disease is not many separate lapses in conscientiousness but one rate
fact about who determines income is structurally the same move this section makes about who
reconciles registers — the fault, if that is even the right word, is in the schedule, not in any of
the 34 offices.

This is offered as exactly one thing: a real, independently checkable instance consistent with the
qualitative shape Proposition 3 predicts once its threshold is badly violated. It is not a
measurement of $f$, $\tau$, or the critical ratio between them — no instrument used here produces
those numbers — and it is not evidence that Proposition 3's specific inequality is the correct
threshold shape rather than some other one with the same qualitative signature. What it rules out is
treating the model as decoration: a model this cheap to falsify — count the mismatches — and that
names in advance the failure mode found on the first count is doing more work than a structural
analogy usually does.

## 8. Exchange boundaries: a Coasean–mycorrhizal correspondence

**Definition 8 (Genet).** Two cells share a genet iff they are connected in $G$ through binding sites
answerable to a single, administratively closed correction process in the sense of Definition 7 — the
same audit authority, the same corporate register, the same act of closing the loop on a
discrepancy. In this settlement's own vocabulary this is close to what a chain-group contract already
names for the units inside it: one instrument binding every constituent micro-enterprise to one
outcome, with no separate internal agreement and no internal sign-off between them (`lianqun-heyue.md`)
— though a genet as defined here is the audit relation specifically, narrower than every unit that
happens to share a market contract.

**Proposition 4 (Boundary-pricing criterion).** Value transfer between cells sharing a genet clears at
cost, as an admissible (Definition 4) internal action; value transfer crossing a genet boundary
requires priced exchange, cleared by a market mechanism external to either party's own correction
process.

*Justification.* This is exactly Coase's boundary of the firm, restated in graph terms: coordination
by fiat is available, and cheaper than repeated contracting, precisely where a single correction
process already reaches both parties (Proposition 2's condition, applied to the *audit* relation
rather than the execution relation); it is unavailable, and market pricing becomes the only
mechanism capable of resolving disagreement, exactly where it doesn't. That mycorrhizal biological-
market theory derives the identical partition — unpriced physiological transport inside one connected
mycelium, measured and sanctioned exchange across a fungus–plant boundary — from partner-choice and
resource-scarcity axioms with no reference to transaction costs at all, and lands on the same rule,
is the strongest evidence available that Proposition 4 names something general rather than an
economic convention imported by analogy. A pricing mechanism applied inside a single genet is not
merely unnecessary, it is a category error in the same sense a firm invoicing its own internal
transfers would be: there is no second correction process on the other side of the transaction for
the price to be settling a disagreement with.

## 9. Discussion

Three things change if Propositions 1–4 are accepted as governing this settlement's own constitution
rather than as an outside model applied to it. First, admissibility (Definition 4) becomes a literal
predicate any proposed governance act can be checked against — does it write an active site or only
a binding site — rather than a norm enforced by review. Second, the question of whether to found a
new sovereign enterprise, versus keep a unit inside an existing one, becomes Proposition 2's
inequality applied prospectively: will this graph's connectivity actually reach the new unit's drift
rate, or is separate governance being proposed for a unit that was already, in effect, ungovernable
from here. Third, and most concretely, correction cadence — how often offices whose duty is exactly
this kind of reconciliation actually run — stops being a diligence question and becomes a rate
this settlement can in principle measure against Proposition 3's threshold, the same way a
biological system's proofreading rate is measured against its own error threshold rather than judged
by how conscientious any single ribosome seems. Fourth, and this is what Section 7 adds beyond
restating the doctrine formally: the model is falsifiable at close to no cost. Anyone can re-run the
duty/office count in Section 7 against the live records at any later date; a future sweep that closes
most of that gap would itself be evidence a correction pass had finally started running, which is
exactly what Proposition 3 says such a graph needs, and a sweep that leaves the gap exactly as wide
would be evidence against treating "reconciliation" as a duty anyone currently discharges, whatever
the duty records claim.

None of this requires new infrastructure. Every piece of machinery Section 3 assumes — a binding-site
space distinct from execution state, a coordination graph with measurable connectivity, a correction
process running at some cadence — already exists in this settlement's ordinary agentic tooling
(`AGENTS.md` as binding-site declaration, hooks as admissible-action gates, schema validation as
binding-site geometry, the offices whose duty is register reconciliation as the correction process
of Section 6). What changes is only that these now have a shared formal description, with rate
conditions attached, rather than existing as independently-justified conventions that happen not to
contradict each other.

## 10. Limitations and open questions

Propositions 1–4 are stated and justified at the rigor level appropriate to a theory note, not proved
in this settlement's own Lean development — and this note follows this settlement's own explicit
ruling on what that status is worth. A Lean proof is a persuasion service, never a legitimating
badge, and "badge prose" asserting formal certification without a checked linkage is banned outright
(`2026-07-24-the-math-is-the-product-lean-is-a-service.md`). So the imported proved objects this note
leans on hardest — the spectral-gap propagation bound behind Definition 5, and the
coordination-cohomology identity behind Section 6's reading of a correction pass as erasure with a
floor cost — are cited for the vocabulary and the checked inequality they supply, not offered as
evidence that the propositions built on top of them are true. If every Lean citation in this note
were struck and replaced with "this is asserted, not proved," the propositions would carry exactly
the evidentiary weight they carry now: whatever each *Justification* paragraph earns them, no more,
and Section 7's count no less.

The biological framing itself is contested inside this settlement's own corpus, not only outside it,
and the contest is worth stating rather than stepping around. A same-day sibling note on Capability
Cell repair discipline opens by insisting its own central claim "is not a metaphor borrowed from
biology" but "a specific, checkable engineering property"
(`2026-07-24-capability-cells-and-emergency-repair-discipline.md`) — a direct rejection of exactly
the move this note makes repeatedly, of reading an engineering constraint through a biological one.
That note is not wrong; the two notes are making different-shaped claims. Its point is that
repair-before-addition needs no biology to be checkable — its completeness check either throws or it
does not. This note's claim is narrower and of a different kind: not that governance *resembles*
allostery usefully, but that Definition 4's admissibility condition and the MWC/KNF structural
condition are the same condition under relabeling (Proposition 1) — a claim about two formalisms
coinciding, not a claim that biology explains anything about this settlement that engineering
language alone could not. Whether that coincidence claim survives formalization is exactly the next
open item below; it is not settled by noting, correctly, that some neighboring notes use biology only
as loose decoration, because this note is not doing that.

Section 4.1's tiling account is the note's least-settled claim, and should be read as such. The two
Lean witnesses it cites (`jeandelRaoMarker01_nonzero_h1_class`, `tile_gap_char_root`/
`tile5_gap_char_root`) are real, checked, and about exactly what §4.1 says they are about — but
neither file, nor the mathematics literature behind either, makes any claim about elections,
representation, or political legitimacy. That a finite local color-matching rule can replace a
democratic republic's periodic counting mechanism, with non-periodicity standing in for the
guarantee a count would otherwise supply, is an argument this note makes by composing Proposition 1
(admissibility is allosteric shape-matching) with the tiling literature; it has not been formalized
as a proposition with its own justification paragraph the way Propositions 1–4 have, and doing that
— stating precisely what "collapsing into a small number of repeating configurations" means for a
coordination graph, and what would count as this settlement's own coordination rules realizing a
Jeandel–Rao-shaped ruleset rather than a crystallographically-restricted one — is the most important
open item this note has, more so than the two listed below.

Two operational questions remain open past what Section 7 already checked. First, the correct
empirical proxy for $\delta_c$ (active-site drift rate) for a software cell as opposed to a physical
or biological one: Section 7's case is a $\tau \to \infty$ instance, no correction pass exists at all
for that pair of registers, which is the easy end of Proposition 3's inequality to confirm and says
nothing about where the actual threshold sits for cells that *are* being corrected at some finite
cadence. Second, whether this settlement's other correction cadences — the ones
product-quality-assurance, internal-audit, and quality-operations actually run — can be estimated from
data already logged, or need new instrumentation, before Propositions 2 and 3 are checkable anywhere
but the one register Section 7 counted by hand. Both are prerequisites for treating this note's
governability and error-catastrophe claims as generally checkable rather than checkable in exactly
one place.

## 11. Conclusion

Restricting governance to binding-site action is not a management preference borrowed from Haier and
reinforced by a reading of Daoist political philosophy. Under Definitions 1–4 it is formally
allosteric regulation, and allosteric regulation has a body of results attached to it — a
governability condition bounding when non-intervention is even coherent, an error-catastrophe bound
on how infrequently correction can run, and a boundary-pricing criterion independently derived by an
entire second literature with no contact with the first. The convergence of transaction-cost economics
and mycorrhizal ecology onto the same boundary rule, from unrelated starting axioms, is one piece of
evidence that the model is not decoration on top of doctrine this settlement already held. The
duty/office registry checked in Section 7 is a second, cheaper piece of the same kind — not an
analogy borrowed from an unrelated field, but the model's own predicted failure mode, found on the
first count, in this settlement's own records. It is a candidate explanation for why the doctrine was
correct, and, at the same time, a candidate diagnostic for exactly where, right now, it is not being
followed.

## References

Every external citation above was checked against its primary source before this note was finalized;
none is asserted from unverified recall.

- Berger, R. (1966). The undecidability of the domino problem. *Memoirs of the American
  Mathematical Society*, 66.
- Coase, R. H. (1937). The nature of the firm. *Economica*, 4(16), 386–405.
  https://doi.org/10.1111/j.1468-0335.1937.tb00002.x
- Eigen, M. (1971). Selforganization of matter and the evolution of biological macromolecules. *Die
  Naturwissenschaften*, 58(10), 465–523. https://doi.org/10.1007/BF00623322
- Grassé, P.-P. (1959). La reconstruction du nid et les coordinations interindividuelles chez
  *Bellicositermes natalensis* et *Cubitermes* sp. La théorie de la stigmergie: essai
  d'interprétation du comportement des termites constructeurs. *Insectes Sociaux*, 6(1), 41–81.
  https://doi.org/10.1007/BF02223791
- Hopfield, J. J. (1974). Kinetic proofreading: a new mechanism for reducing errors in biosynthetic
  processes requiring high specificity. *Proceedings of the National Academy of Sciences*, 71(10),
  4135–4139. https://doi.org/10.1073/pnas.71.10.4135
- Jeandel, E., & Rao, M. (2015). An aperiodic set of 11 Wang tiles. arXiv:1506.06492.
  https://doi.org/10.48550/arXiv.1506.06492
- Kiers, E. T., Duhamel, M., Beesetty, Y., Mensah, J. A., Franken, O., Verbruggen, E., Fellbaum, C.
  R., Kowalchuk, G. A., Hart, M. M., Bago, A., Palmer, T. M., West, S. A., Vandenkoornhuyse, P.,
  Jansa, J., & Bücking, H. (2011). Reciprocal rewards stabilize cooperation in the mycorrhizal
  symbiosis. *Science*, 333(6044), 880–882. https://doi.org/10.1126/science.1208473
- Koshland, D. E., Némethy, G., & Filmer, D. (1966). Comparison of experimental binding data and
  theoretical models in proteins containing subunits. *Biochemistry*, 5(1), 365–385.
  https://doi.org/10.1021/bi00865a047
- Labbé, S. (2018). Substitutive structure of Jeandel–Rao aperiodic tilings. arXiv:1808.07768.
  https://doi.org/10.48550/arXiv.1808.07768
- Monod, J., Wyman, J., & Changeux, J.-P. (1965). On the nature of allosteric transitions: a
  plausible model. *Journal of Molecular Biology*, 12(1), 88–118.
  https://doi.org/10.1016/S0022-2836(65)80285-6
- Ninio, J. (1975). Kinetic amplification of enzyme discrimination. *Biochimie*, 57(5), 587–595.
  https://doi.org/10.1016/S0300-9084(75)80139-8
- Noë, R., & Hammerstein, P. (1994). Biological markets: supply and demand determine the effect of
  partner choice in cooperation, mutualism and mating. *Behavioral Ecology and Sociobiology*, 35(1),
  1–11. https://doi.org/10.1007/BF00167053
- Wang, H. (1961). Proving theorems by pattern recognition — II. *Bell System Technical Journal*,
  40(1), 1–41. https://doi.org/10.1002/j.1538-7305.1961.tb03975.x
