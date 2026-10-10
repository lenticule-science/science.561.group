# RelMath ultracode roadmap — toward the complete corpus formalization

Goal: RelMath = the **complete** dependency-free Lean formalization of the entire
561 corpus math (incl. `content/_archive`; math only, not the agent/operations
application domain), re-deriving where the four verbs conflate, filling the
connective tissue isolated research left open.

Derived from the `relmath-corpus-map` workflow (34 parallel deep-readers over the
in-tree spine + `_archive` math disciplines; run `wf_f8c2835b-076`). The 34 clusters
deduplicate to ~5 layers; **built ✓** = already in RelMath.

> **NOTE (2026-06-21): the 34-cluster map was heavily deduplicated and is NOT the
> whole corpus.** A direct enumeration of the settling subtree alone found **85 node
> dirs**; ~57 RelMath modules cover the spine + 34 backlog + received-math shadows +
> beyond-backlog (linear-algebra, number-theory, optimization, factorization). The
> **genuine novel-math FRONTIER** (settling-generated, past the public literature) that
> the map collapsed is catalogued in the new "Frontier backlog" section at the bottom.

## The keystone insight (connective tissue no single node states)

The four verbs are **one recurring four-corner coherence cell** at successive depths:
`{potential,active,stable,absurd}` (articulation) ≅ `{⊥,t,f,⊤}` (charge) ≅
`{free, j₁-fix, j₂-fix, both}` (nuclear quartet) ≅ `{neither,◇,□,both}` (modal) ≅
`{strict,Scott,TB,aperiodic}` (regime). RelMath must make each conflation a THEOREM.
`twistoring`-at-articulating = `commutating`-at-aperiodic-settling (σ∘Δ=Δ∘σ) is the
same coherence 2-cell at two depths. Keystone module: **QuartetRecurrence**.

## Current status (2026-06-22)

> **NEWEST+ (2026-06-22): RelMath = 93 modules, `lake build` green at 96 jobs, no free data.** Two
> follow-ups closing the dynamics front's two scopings (every headline `#print axioms` ≤ {propext,
> Quot.sound}; two depend on NOTHING):
> - `Ordinal` — the **transfinite ordinal, internal to the chain**, built the way the corpus's own node
>   project does (`lib/relating/.../settling/ordinal.mts` + `closure.mts`): a **Brouwer/tree ordinal**
>   `Ord = zero | succ | limit(fundamentalSequence : Nat→Ord)`, derived under settling. Retires the
>   "Lean core has no transfinite ordinals" scoping of `ClosureOrdinalRegime`: `limit_isLUB` (a limit IS
>   the supremum of its fundamental sequence — settling-continuity's directed-join-at-limits, now a
>   theorem), `isFinite` (a real recursion replacing the free `finiteBase` flag), `regimeOfOrd` reads the
>   four regimes off the genuine κ shape, and `regime_of_ord_refines_classify` proves the old Bool-flag
>   `classify` is the **shadow** of the real ordinal. (0 axioms / propext.)
> - `Laplacianizability` — the **Laplacianizer functor** `𝔏=(F,d,η)` from the corpus's laplacianizers
>   theory (`…/settling-cohomology/_archive/moduli-theories-laplacianizers-*`). Uses the node's key fact
>   that the *algebraic* laplacianizer is inner-product-free: `settling_laplacianizability` proves the
>   settling site/cohomology pair IS Laplacianizable, with the Tarski/Lawvere `L=□∘◇` as the
>   inner-product-free Laplacian (idempotent Q-functor) and `harmonic_eq_degree0` as the degree-0 **Hodge
>   isomorphism** `ker Δ ≅ H⁰`. Continuous inner-product moduli (orbifold) honestly scoped out (needs reals).
>
> **NEWEST (2026-06-22): RelMath = 91 modules, `lake build` green at 94 jobs, no free data.** The
> **SPATIOTEMPORAL GEOMETRY & DYNAMICS** front (the closure flow read as a dynamical system) is built — a
> 6-module ultracode worktree batch, each headline `#print axioms` ≤ `{propext, Quot.sound}` (three need
> only `propext`); forbidden-keyword scan clean:
> - `ClosureFlowDynamics` — the orbit as a TRAJECTORY: smooth (no-op/Scott) vs singular (firing) steps,
>   `smooth_is_terminal` (firings stop at the closure ordinal), and the increment-driven flow `drive`
>   realizing `F_U(E)_τ = Cl(E) ∨ₖ u_τ` (empty increment recovers the plain orbit).
> - `ClosureFlowCurvatureRegime` — the CURVATURE–REGIME CORRESPONDENCE: `H¹=0 ⟺ flat ⟺ strict/Scott`,
>   `H¹≠0 ⟺ curved ⟺ TB/aperiodic`, the empty "curved & ≤ω-terminating" cell, curvature-module rank
>   (`flat ↦ some 0`, curved ↦ `none`) with a concrete NSC-firing witness on the curved side.
> - `BlowupClassification` — the firing blowup's local triple `(π incidence, τ firing-type, γ
>   consistency-failure)` is a COMPLETE invariant (`blowup_classified`: predecessor + triple determine the
>   actual value cellwise); a model singularity = an iso class of non-trivial blowups.
> - `FreeEnergyLyapunov` (KEYSTONE) — settling as GRADIENT FLOW of a Nat-valued free energy `Φ = deficit`:
>   `free_energy_is_lyapunov` (antitone weak H-theorem + strict drop at each firing + `Φ=0` at equilibrium
>   + finite convergence `≤ Φ₀+1`); `kappa_bounded_by_initial_free_energy` (κ = ordinal shadow ≤ analytic
>   shadow Φ₀); `closureAtZeroTemp` (T→0 hard/Datalog endpoint); `energy_gives_unique_equilibrium`
>   (`H¹=0 ⟺ unique equilibrium ⟺ confluence` as a constructive energy estimate). NO reals.
> - `LawvereLaplacianSpectralGap` — the Lawvere Laplacian `L = □∘◇` (the F(f)∘F(f)* round-trip);
>   `harmonic_eq_degree0`: kernel of `L−id` = fixed points = quiescent global sections = `H⁰` = harmonic
>   equilibrium; diffusion ascends ≤ₖ-monotonically to it; locality preserves sheafhood.
> - `LorentzianMyrheimMeyer` — the rational ordering fraction `r(v) = 2|Apex|/(N(N−1)) ∈ ℚ`, diamond
>   witness `r=5/6`, Gauss–Bonnet `χ = |Apex| − |L_ns|`, and a geometry⊥topology independence witness
>   (diamond vs chain vs antichain). `d_MM = f⁻¹(r)` itself is honestly scoped out (needs reals/Γ; `Rat`
>   built via `Rat.mk'`+`Nat.gcd` to avoid `Classical.choice`).
>
> **EARLIER: RelMath = 85 modules, `lake build` green at 88 jobs, no free data.** (Since b4: settling
> loose-ends batch (4) + D4Gauge (KleinFourGauge's deferred dihedral, K4⋊σ=D₄=Aut(FOUR;{≤ₖ,≤ₜ}), relayed
> from another agent) + the `_archive` math-roots batch (FormalConceptAnalysis, LambekCalculus,
> CombinatoricsExtremal) + the `FCALambekCircle` capstone closing the FCA⇄Lambek⇄residuated⇄settling-closure
> circle as theorems. See the Frontier backlog section.)
> **EARLIER MILESTONE: RelMath = 76 modules, 79 jobs.** 34-module backlog
> complete + deferred bridge + 4 beyond-backlog received-math modules + **Frontier batches 1–4**
> (18 novel settling-generated modules). B1: DFrame, QuantaleEnrichedSheaf, TemporalTwoCategory,
> SettlingCoalgebra, SynonymyAntonymy. B2: ClosureRuleSystem (Datalog/van-Emden-Kowalski lfp),
> ScottContinuousClosure, InconsistencySheaf, KZCoherentSheaf, PredicationFibration. B3 (aperiodic
> firing dynamics): NonScottContinuousFiring, FiringBlowup, SubstitutionUniversalityClass (shift
> equivalence), AlexandrovHusainov. B4 (step-n RG tower): StepNRecurrence (co-incrementing hierarchy;
> Fibonacci x²−x−1 / Padovan x³−x−1 char polys), StepNFixedPoint (colimit = RG fixed point σ·M^∞=M^∞),
> AperiodicCoClassifyingInvariant (Verdier-dual H₁), TransfiniteCellComplex (colimit of finite subs +
> settling continuity). Remaining: unwalked `_archive` math roots (category-theory, combinatorics,
> lambek-calculus, formal-concept-analysis) + a few deep settling nodes.

**RelMath = 52 modules, `lake build` green at 55 jobs, no free data — THE 34-MODULE BACKLOG IS
COMPLETE.** Every theorem `propext`/`Quot.sound` at most (most zero-axiom); whole-tree code scan
shows no `axiom`/`opaque`/`constant`/`sorry`/`admit`/`native_decide`/`Classical`. **L0, L1, L2, L3, L4
ALL COMPLETE.** The 17-module settling spine + all 34 backlog modules + `ValuationFiberAlgebra`
(connective tissue) = the complete dependency-free formalization the roadmap set out to build:
every received-math shadow (order, lattice, residuated/linear logic, Heyting, hyperdoctrine,
Stone/Priestley duality, modal logic, type theory/STLC with full Church–Rosser, set/number/graph,
algebra, probability, stochastic/Markov, Lorentzian causal sets, Frobenius/TQFT, moduli stacks)
re-derived in-chain, with the keystone conflations proven as theorems.

**Now 56 modules, 59 jobs.** The deferred bridge is **DONE** (`ValuationQuartetDischarge` — the abstract
`Order.HeytingAlgebra`/`Order.CommutingNuclei`/`NuclearQuartet` bundle discharged at the genuine settled
Valuation fiber `A_p`, abstract σ/Δ/π definitionally equal to the concrete fiber maps, `[Quot.sound]`).

**Beyond-backlog growth — DONE (4 new pure-math modules** from the corpus's received-math archive
`_archive/library/science/mathematics/.../from-discourse-domain-locus-math/`, math the original 34-module
backlog did not cover):
- `Optimization` — the optimum IS the settling/closure fixed point ("optimization produces a fixed-point",
  proven); a settling IS an optimization. Both headlines **0 axioms**.
- `NumberTheoryCombinatorics` — Pascal recurrence + binomial theorem (over a CommSemiring), gcd/divisibility,
  primes + **Euclid's lemma** (full), modular congruence. `{propext, Quot.sound}`.
- `LinearAlgebra` — **full Steinitz exchange** (choice-free Gaussian-pivot induction) → `dimension_well_defined`
  in full generality over any field with DecidableEq; `rank_nullity` as a concrete 𝔽₂ witness (honest scope:
  the general kernel-extension form needs a subspace-dimension function, deliberately scoped out). `{propext, Quot.sound}`.
- `ValuationQuartetDischarge` — the bridge (above).

Remaining gap (smaller, optional): `factorization` (categorical factorization systems + arithmetic unique
factorization), and the general (non-𝔽₂) `rank_nullity` via subspace dimension.

Layer progress:

- **L0 order/residuation infrastructure — COMPLETE.** OrderInfra, KnasterTarskiStandalone,
  ResiduatedLatticeStandalone, TwistProductResiduation (`FOUR = TwistProduct Two ≅ Charge`),
  FourCornerCell.
- **L1 modal/closure — COMPLETE.** ✓ ModalPairAdjunction, NucleusAndCommutingNuclei,
  ClosureOperatorFiber, ClosureOrdinalRegime, SettlingMonotonicityQuiescence, Closure2MonadKZ.
- **L2 duality/keystone — COMPLETE.** ✓ OrderSwapDuality, KleinFourGauge, **QuartetRecurrence
  (keystone)**, PredicationHyperdoctrineDual, BigradedDiamondTower.
- **L3 site/sheaf/cohomology tower — COMPLETE.** ✓ PairwiseStoneClopen, BitopologicalSettlingSite,
  SettlingAssociatedSheaf, SettlingCohomologyH1, CRDTCohomologicalCALM, AperiodicClassification,
  NuclearAutopoiesisCell.
- **L4 applications — COMPLETE (11 of 11).** ✓ SetNumberGraphTheory, AlgebraHierarchy, LinearLogicChu,
  ModalKripkeFourValued, SettlingOverValueCategory (the hub), CurryHowardLambekQuartet (STLC + full
  Church–Rosser), SettlingFrobeniusTQFT, SettlingModuliStack, StochasticSettling, LorentzianCausalSettling,
  ProbabilityMeasure.

### Next tasks (buildable NOW — all deps already built)

**ALL FIVE LAYERS (L0–L4) COMPLETE — the 34-module backlog is fully built and verified.**
No "next buildable front" remains in the original backlog. Remaining work is optional:

1. **The deferred bridge** (by design): discharge the abstract `Order.*` bundle at the concrete
   `ValuationFiberAlgebra` fiber — the "down the line" instantiation the user chose to postpone.
2. **Polish / deepening** of modules whose faithful formalization used a documented substitution
   (e.g. the Frobenius `⊗` modeled as finite formal sums; the moduli colimit as the constant-map
   directed system; Perron–Frobenius as a concrete witness rather than general existence). Each is
   faithful and green; any could be deepened if a richer model is wanted.
3. **Beyond the backlog:** the corpus continues past these 34 nodes (the agent/operations application
   domain is explicitly OUT of scope per the math-only mandate). Any further math nodes would be new
   roadmap entries.

**Built (connective tissue):** `ValuationFiberAlgebra` — the fiber algebra's order/Heyting/
nuclei built **concretely and directly** on `Valuation` (NOT via the reusable `Order.*` bundle, by
design). 36 jobs green; `fiber_truth_nuclear_quartet` (`Quot.sound`/funext), `cross_order_not_knowledge_nucleus`
(0 axioms). Carries a machine-checked **finding**: the two orders' closures `(j_k, j_t)` cannot
co-inhabit one Heyting algebra as nuclei (a truth-closure is not knowledge-inflationary), so the
corpus's `(j_k, j_t)` reading is a **bigrading** (two Heyting structures), not two nuclei in one
square — the proven quartet uses two *same-order* closures (matching BigradedDiamond). Discharging
the abstract `Order.*` bundle at this concrete fiber is deferred (a later module).

Process: see [CLAUDE.md](CLAUDE.md). Pick modules whose deps are all built and that don't
depend on each other → ultracode worktree batch → integrate + verify. Hold the no-free-data
invariant every time.

## Backlog (dependency-ordered; earliest-buildable first)

| # | module | depends on | diff | status |
|---|---|---|---|---|
| L0 | **OrderInfra** — Preorder/PartialOrder/Monotone; Lattice (glb/lub, two orders agree); Bounded/Distributive; CompleteLattice (sSup/sInf univ. props) | Settling✓ | low | **✓ built (22 jobs)** |
| L0 | **KnasterTarskiStandalone** — lfp/gfp over CompleteLattice (`lfp=⋀ prefixpoints`, fixed+least; dual gfp) | OrderInfra | med | **✓ built (ultracode batch)** |
| L0 | **ResiduatedLatticeStandalone** — integral comm. residuated lattice (fuse_le_iff adjunction, modus_ponens, fuse≤meet); `Two` Boolean instance | OrderInfra | low | **✓ built (ultracode batch)** |
| L0 | **TwistProductResiduation** — `L^⊲` (fuse ⊙ ⊣ ⇒ truth-order residuation, non-integral); `FOUR=TwistProduct Two` ≅ `Charge` (decide); Avron/Chu | ResLat, OrderInfra | med | **✓ built (ultracode batch)** |
| L0 | **FourCornerCell** — canonical `Bool×Bool`; articulation phase ≅ charge | ArticulationCell✓, Four✓ | low | **✓ built (21 jobs)** |
| L1 | **ModalPairAdjunction** — ◇⊣□ Galois (adjunction_unit/counit); cl=◇∘□ closure (settling's operator) | FourCornerCell, OrderInfra, Positing✓ | med | **✓ built (ultracode batch)** |
| L1 | **NucleusAndCommutingNuclei** — standalone `Order.HeytingAlgebra`+Nucleus (fix_meet/fix_himp); commuting→quartet (fix_pi_iff); corners≅FourCorner | OrderInfra, FourCornerCell, BigradedDiamond✓ | med | **✓ built (ultracode batch)** |
| L1 | **ClosureOperatorFiber** — pointwise fiber closure; NoPeriodicOrbits (valuation), C-natural square, closure-merge, lfp=settled | ModalPair, KnasterTarski, ClosureMonad✓ | med | **✓ built (ultracode batch)** |
| L1 | **ClosureOrdinalRegime** — κ; FourRegimeDichotomy strict/Scott/TB/aperiodic | ClosureOperatorFiber, ClosureOrdinal✓ | high | **✓ built** |
| L1 | **SettlingMonotonicityQuiescence** — orbit monotone; quiescence=algebra; cosettling | ClosureOrdinalRegime, ClosureOperatorFiber | med | **✓ built** |
| L1 | **Closure2MonadKZ** — Cl 2-monad η/μ lax-idempotent; strict⇔Scott; property-like | ClosureOperatorFiber, ClosureOrdinalRegime, ClosureMonad✓ | high | **✓ built** |
| L2 | **OrderSwapDuality** — `swap` σ proven order-iso `KLE a b ↔ TLE(σa)(σb)`; ≤ₖ-closure→≤ₜ-closure transport; σ≠∼,− | TruthOrder✓, Four✓ | med | **✓ built (ultracode batch)** |
| L2 | **KleinFourGauge** — `K4` group (Cayley table, isGroup, inverses); orbits {t,f}/{⊥,⊤}; ℤ/2 gauge action on valuations (D₄ deferred) | Four✓, BigradedCohomology✓ | low | **✓ built (ultracode batch)** |
| L2 | **QuartetRecurrence** — KEYSTONE: FourCorner≅ArticulationCell≅FOUR≅NuclearQuartet≅modal; twistoring=commutating | FourCornerCell, NucleusAndCommutingNuclei, KleinFourGauge | high | **✓ built (0 axioms)** |
| L2 | **PredicationHyperdoctrineDual** — adjoints in BOTH orders; Frobenius (⊙ caveat); two-equalities-from-one-diagonal | OrderSwapDuality, Hyperdoctrine✓/Quantifying✓/Equality✓ | high | **✓ built** |
| L2 | **BigradedDiamondTower** — grade quartet by K₄; stack diamonds | NucleusAndCommutingNuclei, HyperdoctrineDual, KleinFourGauge, BigradedDiamond✓ | med | **✓ built** |
| L3 | **PairwiseStoneClopen** — bitopological Spec(A_q); paired Priestley; Z/2 swap | TwistProductResiduation, KleinFourGauge | high | **✓ built** |
| L3 | **BitopologicalSettlingSite** — Grothendieck site (T*,J); temporal 2-cat; no temporal covers | PairwiseStoneClopen, ClosureOrdinalRegime, HyperdoctrineDual | high | **✓ built** |
| L3 | **SettlingAssociatedSheaf** — F_U Z-module; paraconsistent/inconsistency/d-frame; Q-enriched; Lawvere-Laplacian | BitopologicalSettlingSite, Sheaf✓ | high | **✓ built** |
| L3 | **SettlingCohomologyH1** — H⁰/H¹; vanish by regime; bigraded mapping cone | SettlingAssociatedSheaf, ClosureOrdinalRegime, BigradedCohomology✓ | high | **✓ built** |
| L3 | **CRDTCohomologicalCALM** — H¹=0 ⟺ confluence ⟺ CRDT conv. ⟺ unique fp; Mayer-Vietoris | SettlingCohomologyH1, SettlingMonotonicityQuiescence | med | **✓ built** |
| L3 | **AperiodicClassification** — κ≥ω₁; MLD-equiv; Anderson-Putnam direct limit; trichotomy invariant | SettlingCohomologyH1, Closure2MonadKZ, QuartetRecurrence | high | **✓ built** |
| L3 | **NuclearAutopoiesisCell** — σ saturation/Δ transfer; A*; autopoiesis; nucleus-aperiodicity THEOREM | NucleusAndCommutingNuclei, AperiodicClassification, QuartetRecurrence | high | **✓ built** |
| L4 | **SettlingOverValueCategory** — universal F_U over V; four-regime V-independent; recovers FOUR spine | ClosureOrdinalRegime, ClosureOperatorFiber, SettlingMonotonicityQuiescence | high | **✓ built** |
| L4 | **StochasticSettling** — V=[0,1]; Markov stationary = closure fp; Perron-Frobenius | SettlingOverValueCategory | med | **✓ built** |
| L4 | **LorentzianCausalSettling** — causal set; apex/void ≡ timelike/spacelike; Myrheim-Meyer; tiling tower | SettlingOverValueCategory, SettlingCohomologyH1, AperiodicClassification | high | **✓ built** |
| L4 | **AlgebraHierarchy** — magma→…→field; lattice family; homomorphism/quotient; KleinFourGroup | OrderInfra, ResLat, KleinFourGauge | med | **✓ built (0 axioms)** |
| L4 | **SetNumberGraphTheory** — set/∈/⊆ Boolean algebra; ℕ semiring; graph/DAG/tree (83 decls) | OrderInfra, Predicating✓ | med | **✓ built (ultracode batch)** |
| L4 | **LinearLogicChu** — ⊗=⊙ ⊣ ⊸=⇒; Chu over FOUR *-autonomous; substructural↔algebraic; Lambek | TwistProductResiduation, ResLat, HyperdoctrineDual | high | **✓ built** |
| L4 | **ModalKripkeFourValued** — Kripke K/T/S4/S5; S4=closure algebra; bigraded common knowledge C^t/C^k | OrderInfra, NucleusAndCommutingNuclei, HyperdoctrineDual | med | **✓ built** |
| L4 | **CurryHowardLambekQuartet** — STLC (Church-Rosser, SN); Π/Σ/Id; CHL quartet = nuclear quartet | HyperdoctrineDual, NuclearAutopoiesisCell, BigradedDiamondTower | high | **✓ built** |
| L4 | **ProbabilityMeasure** — measure as valuation; conditional via fiber-adjoints; Bayes | SettlingOverValueCategory, HyperdoctrineDual, Positing✓ | med | **✓ built** |
| L4 | **SettlingFrobeniusTQFT** — Z(B)=H•(F) Frobenius algebra; K₄-graded; TQFT functor; Gauss-Bonnet | SettlingCohomologyH1, BigradedDiamondTower, KleinFourGauge | high | **✓ built** |
| L4 | **SettlingModuliStack** — fiber groupoid; invisible/visible Aut (negation⊆N(v)); coarse moduli=MLD; 1-stack; meta-moduli | AperiodicClassification, BitopologicalSettlingSite, KleinFourGauge, Closure2MonadKZ | high | **✓ built** |

## Connective-tissue gaps (bridges to derive, beyond any single node)

1. **FourCorner identity** — articulation 2×2 ≅ FOUR ≅ nuclear quartet ≅ modal four (seed ✓ in FourCornerCell; full chain in QuartetRecurrence).
2. **Twistoring = Commutating** — one coherence 2-cell at articulation and at settling.
3. **◇∘□ = closure operator = 1-truncated 2-monad**, and monotone+inflationary+idempotent ⇒ period-1 only.
4. **Two equalities from one diagonal** — classical (≤ₜ) & paraconsistent (≤ₖ) from the same specialization via the dual adjoint systems.
5. **σ-conjugation as transport** — every ≤ₖ theorem ↦ ≤ₜ theorem with matching κ (not re-proved).
6. **H¹=0 ⟺ confluence ⟺ CRDT ⟺ unique fp** — one equivalence at finite/Scott.
7. **κ is the SOLE regime classifier** — all application families are instances of `SettlingOverValueCategory`; four-regime dichotomy is V-independent.
8. **Fiberwise nuclear variation ⟹ aperiodicity** (Axiom of History Separation) — a theorem connecting to κ≥ω₁.
9. **Fiber algebra is a sheaf of equational algebras** ⟹ the 1-stack property (only ResLat descent is non-trivial).
10. **Negation-gauge ⊆ N(v)** — bilattice negation is always cohomologically invisible (value/cell distinction).
11. **`Two` is the universal residuated base** — `FOUR=TwistProduct Two`; twist residuation over any integral comm. residuated lattice; FOUR is free/initial.

## Frontier backlog (the novel-math the 34-map collapsed — discovered 2026-06-21)

A direct walk of the settling subtree (85 nodes) surfaced a large unformalized frontier of
genuinely novel settling-generated mathematics. **Batch 1 of the frontier is BUILT** (★✓ below);
RelMath now = **63 modules, 66 jobs green, no free data**. Clusters (★✓ = built this session):

**Quantale-enriched (Q-enriched) sheaf theory** — the fuzzy/continuous generalization of the
cohomology, off graphs onto arbitrary Grothendieck sites (Ghrist–Lopez–North–Riess 2025):
- ★✓ `QuantaleEnrichedSheaf` — commutative unital quantale Q; Q-categories/Q-functors; Q-enriched
  presheaf/sheaf on a site; Q-enriched cohomology `Hⁿ_Q = ker/image` in Q-Cat (deg-0 = Lawvere
  Laplacian fixed points); `q-fuzzy-equivalence` (graded categorical equivalence, composes ×).
- ☐ `q-enriched-sheaf-tensor`/`-hom` (closed monoidal Q-Cat), `quantale-enriched-cosheaf`,
  `q-enriched-transfinite-cellular-sheaf`.

**d-frame theory** — bilattice-native bitopological algebra:
- ★✓ `DFrame` — d-frame `(L₊,L₋,con,tot)` = algebraic dual of a bitopological space; d-frame-valued
  settling sheaf (encodes truth- AND inconsistency-sides intrinsically).

**2-categorical / coalgebraic structure** (the genuine 2-cat the closure-2-monad shadows):
- ★✓ `TemporalTwoCategory` — `T(C,λ)` 0/1/2-cells, temporal Beck–Chevalley, the dual `T*`.
- ★✓ `SettlingCoalgebra` — `c : E→F_U(E)` the DUAL of the settling algebra; settling-equipped
  hyperdoctrine; settling continuity (limit-ordinal joins); C-closed ⟺ Cl-algebra.

**Semantic relations** (negation/equality read as meaning):
- ★✓ `SynonymyAntonymy` — synonymy = MLD-equivalence = cohomological equiv; antonymy = strong-MLD to
  the negation-twist; negation-invisibility (`v ~syn ∼v`); strong-MLD firing-orbit-type refinement.

**The sheaf zoo**: ★✓ `InconsistencySheaf` (`F_U^(⊤)` cokernel + cohomology), ★✓ `KZCoherentSheaf`
(KZ-2-cell descent on T*). ☐ `negative-paraconsistent-settling-sheaf`, `d-frame-valued-sheaf` (full).

**Closure-rule / fibration cluster (batch 2)**: ★✓ `ClosureRuleSystem` (closure = lfp of the
immediate-consequence operator `T_S` = Datalog/van-Emden-Kowalski semantics), ★✓ `ScottContinuousClosure`
(directed-join preservation; finite-antecedent ⟹ Scott ⟹ κ=ω), ★✓ `PredicationFibration` (cloven
Grothendieck fibration; reindex = bilattice-residuated homomorphism; Grothendieck transpose, axiom-free).

**Aperiodic firing dynamics** (batch 3): ★✓ `FiringBlowup` (predecessor→actual; trivial⟺identity;
non-trivial⟺≤ₖ-jump), ★✓ `NonScottContinuousFiring` (Scott⟺no-NSC⟺κ≤ω; ∀-antecedent witness),
★✓ `SubstitutionUniversalityClass` (shift equivalence = transitive closure of SSE; integer-matrix
symbolic dynamics), ★✓ `AlexandrovHusainov` (Alexandrov topology w/ arbitrary ∩; Husainov acyclicity ⟹ Čech=derived).

**Step-n RG tower (batch 4)**: ★✓ `StepNRecurrence` (the co-incrementing hierarchy — one n controls
recurrence depth = alphabet = cohomological rank = growth-rate-min-poly-degree = bilattice structure;
Fibonacci x²−x−1 / Padovan x³−x−1 char polys as integer facts), ★✓ `StepNFixedPoint` (colimit M^∞ =
RG fixed point, σ·M^∞=M^∞ via depth-collapse), ★✓ `AperiodicCoClassifyingInvariant` (cosheaf-homology
H₁ dual of cl-inv via strict Boolean-d-frame Verdier duality; also complete for MLD), ★✓ `TransfiniteCellComplex`
(finite cells/transfinite indexing as colimit of finite subs; settling continuity = limit-ordinal directed join).
☐ remaining settling: `settling-local-constancy`, `negative-paraconsistent-settling-sheaf`, full `d-frame-valued-sheaf`.

**Spatiotemporal geometry & dynamics — BUILT (2026-06-22):** the closure flow as a dynamical system —
★✓ `ClosureFlowDynamics` (trajectory; smooth/singular times; increment-driven `F_U`), ★✓
`ClosureFlowCurvatureRegime` (curvature–regime correspondence `H¹` ⟺ curvature), ★✓ `BlowupClassification`
(local triple is a complete blowup invariant; model singularities), ★✓ `FreeEnergyLyapunov` (KEYSTONE:
free-energy/H-theorem Lyapunov flow, spectral-gap convergence, `H¹=0 ⟺ unique equilibrium` constructive),
★✓ `LawvereLaplacianSpectralGap` (kernel of `L=□∘◇` = `H⁰` = harmonic equilibrium), ★✓ `LorentzianMyrheimMeyer`
(rational ordering fraction + Gauss–Bonnet + geometry⊥topology). The `increment-sequence` and
`settling-continuity` dynamics are realized inside `ClosureFlowDynamics`; `firing-blowup`'s classification
theorem inside `BlowupClassification`.

**Misc frontier** (☐): `alexandrov-topology`, `world-set`,
`bigraded-settling-cohomology` (full bigraded `H^{m,n}_{k,t}` + truth-knowledge LES),
`cohomological-equivalence`/`-framework`, `resource-deficit`,
`settling-frobenius` deepening (cobordism category), `myrheim-meyer-dimension` (full real-valued `d_MM`,
needs reals/Γ), `sprinkled-causal-set-settling` (full Poisson/measure layer, needs measures),
positive-temperature / strategy-driven (utility) closure dynamics (needs measures).

**`_archive` math roots — BUILT (2026-06-21), THE CIRCLE CLOSED AS THEOREMS:**
- ★✓ `FormalConceptAnalysis` — formal context (G,M,I); derivation operators = a GALOIS CONNECTION 𝒫(G)⇄𝒫(M);
  A↦A″ a CLOSURE OPERATOR; concepts = closed pairs; concept lattice = COMPLETE LATTICE (fundamental thm of FCA);
  attribute implications B₁→B₂ ⟺ B₂⊆B₁″ (subsets as Prop-predicates for unrestricted quantification).
- ★✓ `LambekCalculus` — NON-commutative residuated logic: product · with TWO residuals + the bi-residuation
  (a·b≤c ⟺ b≤a\\c ⟺ a≤c/b), derived modus-ponens/monotonicity (0 axioms); commutative collapse: comm ⟹ lres=rres
  ⟹ the single-implication LinearLogicChu/ResLat case. Wurm/Pentus documented.
- ★✓ `CombinatoricsExtremal` — beyond SetNumberGraphTheory: even-sum-of-degrees / even-#-odd-vertices (Eulerian
  necessary condition) and bipartite ⟹ no odd closed walk (the easy König direction).
- ★✓ `FCALambekCircle` (CAPSTONE) — closes the circle: `fca_closure_is_settling_closure` (FCA's A↦A″ closure
  satisfies the settling closure's extensive/monotone/idempotent laws — computing concepts IS the settling closure)
  + `residuated_lattice_is_commutative_lambek` (0 axioms; every integral comm. residuated lattice IS a commutative
  LambekAlgebra, single residual = both \\ and /) + `the_circle` bundling the three proved edges. Wurm completeness
  documented as the closing model-theoretic edge.
category-theory's in-chain instance is ALREADY RelMath (predicate-category = Lawvere hyperdoctrine over FOUR —
Predicating/Hyperdoctrine/PredicationFibration); a `YonedaArrowsFirst` (object recovered from its morphisms) is
the one remaining categorical node.

Still NOT walked: the bilattice/predication-fiber-algebra deep nodes (verdier-duality, closure-rule-language,
presheaf-indexed-fiber, priestley-dual-cover, bilattice-homomorphism-naturality).
