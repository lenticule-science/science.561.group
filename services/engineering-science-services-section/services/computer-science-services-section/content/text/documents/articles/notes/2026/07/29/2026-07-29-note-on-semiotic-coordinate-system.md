# Working paper: a semiotic coordinate system as an atlas of carrier assays

**Date:** 2026-07-29
**Status:** explicitly speculative working paper for a NotebookLM research notebook. It proposes an assay programme; it does **not** introduce a software ontology, package, protocol, or claim that a universal fixed coordinate tuple exists.

## Reading key

Each substantive statement is marked so that mathematical facts, current implementation facts, and research interpretations do not blur together.

- **[Proof-backed]** means a theorem/definition is present in the current Lean library, under its stated hypotheses.
- **[Implementation-backed]** means the current Solidity runtime enforces or records the stated property; it is not a theorem about all deployments or social practice.
- **[Interpretation]** is a proposed reading of those formal/implemented structures.
- **[Conjecture]** is a falsifiable research claim not established by the library.
- **[Open question]** names missing definitions, data, or proof obligations.

## Thesis and scope

**[Conjecture]** A phenomenon should not be assigned a coordinate count by analogy or by a preferred database schema. Its semiotic dimensionality should be assayed from the independent distinctions that must be preserved for a specified task, with a carrier required only when eliminating a distinction causes a demonstrable failure. The output is therefore a local chart and a carrier-minimum claim, not an a priori universal tuple.

Here, a *coordinate* is a reproducible readout of a distinction; a *dimension* is an independently variable family of such readouts relevant to the task; and a *carrier* is a material, formal, institutional, or computational medium that preserves the required distinctions with the needed operations. These are working definitions, not additions to Obsmetrologia.

The proposed universal object, if one exists, is an **atlas/family of compatible charts**. A node may have several vectors at once—an arrow bundle—not one overloaded vector. A coordinate chart is intrinsically adequate only up to the transformations that preserve the task's relevant relations.

## Ground that is already available

**[Proof-backed]** `Primitive/Mark.lean` defines a mark as a finite surface string, expressly not categorical identity; `Kind` has the two positional cases `token` and `claim`, with `token ≠ claim`. `Articulation/Articulating/Utterance.lean` makes an utterance the ordered pair `(token, claim)`. Thus a first coordinate chart must retain positional asymmetry: swapping the two positions is not a harmless rendering change.

**[Implementation-backed]** The matching runtime realizes that floor without inventing a richer ontology. `Mark.sol` admits a non-empty surface once into an append-only event spine and indexes it by `sha256(surface)`. `Utterance.sol` forms only an ordered pair of admitted marks, uses `sha256(token, claim)`, and recovers `Token`/`Claim` by position. `Articulating.sol` stores content-addressed finite `utter` and `pair` nodes, including `head`, `depth`, `moved`, and an eventual `floor`. `Predicating.sol` forms an ordered `(subject, predicate, object)` only from seated cells and only when its subject is potential. These are useful empirical constraints on what the EVM carrier currently records; they do not prove a general theory of semiotic identity.

**[Proof-backed]** `Articulating.lean` proves finite recursive inhabitants, total `head`, `floor`, and `depth`, and jointly onto `head`/`moved` readouts. This supplies a small, concrete example of two separable readouts rather than a declaration that all phenomena have two coordinates.

**[Proof-backed]** FOUR is not merely four labels. `Language/Positing/Quartet.lean` provides explicit bijections among articulation corners, `Bool × Bool`, charge, and modal readings; its generic `CommutingPair` isolates a commuting-square coherence cell. The same shape is instantiated as articulating's commuting involutions and as commuting nuclei on a settled fiber algebra, while their extra laws are deliberately kept distinct. `BigradedCohomology.lean` separately models truth-side and inconsistency-side components. A coordinate assay must therefore test whether an apparent scalar erases one of these independently actionable components.

**[Proof-backed]** `Closure/Regime.lean` and the aperiodic-order modules distinguish strict, Scott, transfinite-bounded, and aperiodic closure regimes. The finite charge spine is classified strict and settles by at most three iterations under the module's assumptions. The library also has a concrete non-idempotent `κ = ω` example; the `κ ≥ ω₁` aperiodic height remains a frontier in the relevant classification work. Regime is consequently a candidate chart coordinate only when the phenomenon actually has a specified closure process and ordinal evidence—not a synonym for elapsed wall-clock time.

**[Proof-backed]** `Calculus/Logic/LinearLogicChu.lean` defines a `ChuSpace` as point and state carriers with a FOUR-valued matrix. A `ChuMap` carries a forward point map and a backward state map whose matrix evaluations agree; composition and the transpose-and-negate dual are proved. This is a precise change-of-description pattern: a valid transformation must preserve the relevant relation, not merely rename fields.

**[Proof-backed]** `Language/Predicating/YonedaArrowsFirst.lean` proves the local arrows-first result that an object is recovered, up to isomorphism, by its representable incoming-arrow presheaf. `CurryHowardLambek.lean` packages the Curry–Howard–Lambek correspondence in its modeled setting. These results support treating a node's relational incidence as coordinate-bearing. They do **not** establish that every empirical object is exhausted by whichever arrows a chosen observer happened to record.

**[Proof-backed]** A causal-set chart is available in `CausalSets/Causal/Order.lean`: finite events, an acyclic direct-link graph, and its directed transitive closure model causal precedence. `CausalSets/Dimension/Fingerprint.lean` computes a diamond ordering fraction and embeds its value `5/6` into internal reals, but explicitly leaves the Gamma/inversion step needed for a full Myrheim–Meyer dimension unresolved. `CausalSets/Continuum/ChuActionColimit.lean` is a relevant bridge between causal actions and Chu structure/colimit language, not a proof that any platform event stream is spacetime.

**[Proof-backed]** `Cohomology/CoordinationCohomology.lean` defines an obstruction/rank in its finite cover-nerve model, and `LandauerEntropy.lean` relates the modeled coordination cost to its entropy quantity. `Dynamics/Flow/FreeEnergyLyapunov.lean` proves a Lyapunov-style descent in its specified dynamical model. These provide separate formal lenses for coordination and free-energy descent; no theorem identifies a social coordination burden with physical energy without a validated model bridge.

## Intrinsic coordinates, charts, and arrow bundles

**[Interpretation]** A coordinate is *intrinsic to a task* when every adequate representation for that task must preserve the associated distinction up to an explicitly stated equivalence. A coordinate is *chart-dependent* when another adequate chart can remove, combine, or replace it while preserving all task-relevant tests.

**[Conjecture]** A useful semiotic node is better represented by an arrow bundle than a single vector:

`B(x) = {utterance/position, articulation lineage, FOUR/bigrading, closure regime, causal incidence, Chu point-state relation, coordination obstruction, carrier attestations, ...}`.

The braces are intentionally open. Components occur only when assayed. The bundle makes it possible for the same node to have, for example, a token/claim orientation, a causal predecessor cone, a repository history, and a commitment history without claiming that those are one time coordinate.

**[Conjecture]** A change of chart `F : B_U → B_V` is admissible for task `T` only if it transports every tested relation and witness needed by `T`. At minimum, a Chu-like forward/backward preservation condition is a model for this requirement; for an arrow-sensitive chart, a Yoneda-style preservation of incidence is a stronger test. A non-invertible projection is allowed only when its discarded distinctions are shown irrelevant to `T`; otherwise it is under-dimensional.

## Assaying dimensionality and carrier necessity

The following is a research protocol, not a completed metric.

1. **State the phenomenon and task.** Specify the decisions, predictions, audits, or coordinated actions that must remain possible.
2. **Propose a local chart.** List candidate readouts and their observational procedures; distinguish directly observed values from derived values.
3. **Independence test.** Seek cases where one readout changes while the others are held fixed, or where a model with the readout removed loses a required discrimination. FOUR's two independent axes and `head`/`moved` provide formal exemplars, not a universal count.
4. **Transformation test.** Supply chart maps between observers, scales, or carriers. Verify the relations that must commute—e.g., Chu adjointness, causal-order preservation, or compatible restriction maps—rather than relying on matching labels.
5. **Ablation/quotient test.** Deliberately merge, erase, or coarsen one candidate dimension. Record a falsifier: prediction error, impossible audit, broken composition, unresolvable conflict, or failure of a specified standard.
6. **Carrier test.** Demonstrate that a candidate carrier preserves the required distinctions, operations, provenance, latency, and public verification conditions. The word “MUST” is warranted only relative to this test suite and task.
7. **Publish residuals.** Retain counterexamples, unmodeled cases, and chart-transition failures. They are evidence against sufficiency, not defects to hide.

**[Conjecture]** The least adequate carrier is the one for which no tested quotient preserves the task. This is a relative, revisable minimum; it must not be inflated into a claim that a particular chain, repository, or standard is metaphysically necessary.

## Temporal hyperdimensions are not interchangeable

**[Interpretation]** Git, GitHub, and an EVM chain can each supply a temporal coordinate, but they presently mean different relations:

| Candidate carrier | Plausible coordinate it preserves | What it does not establish |
|---|---|---|
| Git | content-addressed parent/merge ancestry of repository objects | public publication, organizational review, or final commitment |
| GitHub | hosted collaboration, review, issue/PR and publication-visible event relations | a canonical causal order beyond the service's semantics |
| EVM runtime | ordered, contract-validated state-transition/event-log history within the chain's consensus semantics | authorship truth, off-chain intent, or Git/GitHub provenance |

**[Conjecture]** These should be modeled as distinct temporal hyperdimensions when their order relations are independently queried or can conflict. A chart map may relate a commit, pull request, and contract event, but it must carry explicit witnesses; timestamp coincidence alone is not a transformation law.

## Public standards and market constraints

**[Interpretation]** Standards, exchange rules, regulators, and buyer expectations are empirical constraints on carriers: they determine which signatures, audit trails, interoperability formats, settlement finality, retention properties, or public visibility a task must satisfy. They are not coordinates merely because they are named, and a standard's existence does not prove its fitness.

**[Conjecture]** A carrier constraint becomes part of an assay when a real counterpart can reject, fail to verify, or refuse to transact on a representation that lacks it. Evidence should include the applicable standard/rule, the exact conformance test, the affected population, and observed rejection or acceptance behavior. Market demand is evidence about interoperability and exchange, not a theorem of semantic dimensionality.

## Proof-path addressing is one generative chart, not universal identity

The current 2026-07-09 PPA plan at `lib/emsenn/services/561-group/services/engineering-services-section/services/computer-services-section/services/computer-systems-services-section/services/semiotic-computer-system-services-section/content/text/documents/articles/notes/2026/07/09/2026-07-09-ppa-proof-path-addressing.md` says that an earned filesystem path is the canonical **operational proof path** for a typed CHL/RMN address term, and that protocol readings should preserve its generative descent.

**[Implementation-plan boundary]** This is a detailed implementation plan, not a theorem that filesystem paths are universal identity or the only canonical temporal carrier. Its own maturity table marks the PPA cone-of-readings and leg-agreement specialization as roadmap/red-node work, despite citing proof-backed CHL reduction and general Yoneda ingredients.

**[Interpretation]** The proposal is a strong local *generative chart*: root-to-leaf path segments encode a derivation, so flattening an earned path can erase a relation relevant to discovery and composition. That makes proof-path descent a candidate arrow-bundle component when the task is generative provenance.

**[Conjecture]** It is also a useful prior under-dimensionality test. If the same task requires Git ancestry, GitHub review/publication relations, EVM validated commitments, or an external standard's attestation, the filesystem path alone cannot be declared the complete coordinate. The atlas should retain the proof-path coordinate and ask for explicit, task-preserving maps to those other orders. It may correct the PPA plan's implicit carrier priority without rejecting its local operational role.

## Under-dimensionality: predicted failures and falsifiers

**[Conjecture]** Under-dimensionality has observable signatures:

- Collapsing token and claim changes an utterance's position-sensitive meaning or makes a runtime pair unverifiable.
- Collapsing FOUR/bigrading to one confidence value makes truth-side and inconsistency-side updates indistinguishable when they lead to different permitted actions.
- Replacing causal order with a total timestamp makes incomparable events appear ordered, or admits cycles/inferences prohibited by the causal chart.
- Replacing Git, GitHub, and EVM histories with one “time” field cannot answer provenance, review, and commitment queries simultaneously without extra witnesses.
- Treating filesystem proof-path descent as universal identity or a universal temporal carrier fails whenever a required Git, GitHub, EVM, or standards attestation has no task-preserving reconstruction from that path.
- Dropping a coordination obstruction predicts coordination-free merge where a cover-cycle case requires additional reconciliation; the finite model's results must be checked against the actual cover.
- Claiming physical free-energy descent from a social or computational trace without a model bridge yields quantitatively failed predictions or unit-incoherent measurements.

A proposed chart is falsified for a task by one reproducible case in which it passes its own stated input conditions yet cannot preserve a required distinction or make a correct decision that a richer chart can make. Conversely, a candidate dimension is demoted when repeated ablation preserves all preregistered task tests across a declared domain.

## Legacy boundary: “Hyperversal Coordinate System”

The legacy section in `content/assets/legacy/.../infinite-relational-mathematics/infinite-relational-mathematics.md`, Part 57, calls `(n, t, a)` a coordinate for a Relational Hyperverse and explicitly labels itself a **Conjecture**. It must not be silently promoted.

- **[Legacy, proved boundary]** Its ground-level description of a fiber address `(t, a)` is presented there as a known case. In the current library, there are formal local structures—fiber/closure/categorical constructions—but this paper has not audited a theorem proving the legacy section's complete global claim.
- **[Legacy, conjectural boundary]** Birth depth for every object, persistence through every turn, a coherent equivalence relation across turns, and colimit classes forming the hyperverse are all stated there as conjectural or dependent on unconstructed transition data.
- **[Legacy, stale boundary]** Its table says turn-1 coordinates are “not yet constructed” and treats `tower_depth` frontmatter as an encoding. That is archival context, not current implementation evidence. It also uses a fixed triple as its headline; the present paper deliberately treats any universal tuple as unproved and favors a family of charts.

The legacy note remains valuable as a hypothesis about depth-stratified coordinates. It is not evidence that a coordinate system for arbitrary semiotic phenomena, carriers, or public standards has been derived.

## Research commitments and open questions

**[Open question]** What equivalence relation on arrow bundles makes “same phenomenon for task T” decidable or at least auditable without erasing legitimate chart differences?

**[Open question]** Which independence statistic or categorical invariant can distinguish a genuinely new semiotic dimension from a redundant readout? Causal dimension, closure ordinal, bigraded cohomology, and cover-nerve obstruction each answer different questions and cannot yet be summed into one number.

**[Open question]** Can a carrier-minimality claim be formally stated as a universal property over task-preserving chart maps, with standards and market tests represented as empirical boundary conditions rather than axioms?

**[Open question]** What concrete cross-carrier witnesses make a Git commit, GitHub review, and EVM event compatible without collapsing their distinct orders?

**[Open question]** When does nonzero coordination cohomology predict a measurable operational cost outside the finite modeled cover nerve, and what calibrated bridge—if any—relates that cost to free energy?

The immediate deliverable is therefore an atlas research notebook: collect phenomena, local charts, transformations, carrier tests, ablation failures, standards evidence, and unresolved residuals. The central discipline is negative: never call a coordinate intrinsic, a carrier mandatory, or an atlas universal before the corresponding quotient and transformation tests have been survived.
