---
title: "Regrounding the Hubble Tension: Three Eras, One Instrument"
description: "The Regrounding program's flagship deliverable — Era 1's g(z) diagnostic and Era 3's bilattice translation read term by term against the live SettlingCohomologyH1 module, the tension retyped as a bilattice-compatibility failure with a full obstruction typology and a coarsening/foam bridge, engaged against the 2026 cosmology literature, closing on a buildable open construction from real Planck and DESI data."
date-created: 2026-08-21
type: notes
name: 2026-08-21-regrounding-the-hubble-tension
authors:
  - claude-opus-4-6 (Regrounding flagship)
  - Claude Opus
status: draft-for-owner-review
keywords:
  - regrounding
  - obsmetrologia
  - cosmology
  - hubble-tension
  - bilattice
  - settling-cohomology
  - causal-sets
  - methodology
  - flagship
tags:
  - draft
---

# Regrounding the Hubble Tension: Three Eras, One Instrument

The owner walked toward this problem three times before any instrument
existed to receive the walk. This note is the estate keeping the
appointment Era 3 made with itself in June 2026 and never kept: *"Open: an
explicit construction of $E_\mathrm{early}$ and $E_\mathrm{late}$ as
bilattice-valued sub-settlings starting from published Planck and
DESI/Pantheon+ posterior chains, and verification that the predicated
$g(z)$ on this construction reproduces the empirical pattern."* That
sentence is still the most honest four-line summary of what this note
does and does not accomplish: it does not run that construction. It reads
the three eras against the instrument that finally exists to run it, types
the obstruction properly, engages the live 2026 literature by name, and
specifies the construction precisely enough that running it is now a
scoped task rather than an open question.

**What this note claims, stated once and held to throughout:** the Hubble
tension is well-described as a compatibility failure between two
bilattice-valued sub-settlings of one cosmological measurement site — a
better-typed statement of *what kind of disagreement this is*, with a
concrete empirical protocol attached. It is not a claimed resolution of
the tension, and no sentence below should be read as one. Cosmology is a
live, technically sophisticated professional field; the four modules cited
in this note's provenance line are the entirety of what obsmetrologia adds
to it.

## 1. Three eras, honestly told

### 1.1 Era 1 — Reflexive Existence (Oct 2025 – Feb 2026): the sscu-sprint

The philosophical engine (`proposing-a-reflexive-existence--000168.org`,
2025-10-18, a Hegel/Spencer-Brown/Lawvere-inflected 2442-line operator
calculus building `Rel, Includes, Excludes, Together, Either, Induces,
Close, Open` from a primitive `Differentiate`) gets aimed at metrology
generically (`reflexive-residuated-sufficiency.md`) and then at cosmology
specifically. It crystallizes, on 2026-02-27, into a genuine three-paper
sprint — the strongest prior-era material this program has found anywhere
in the estate, cosmology or otherwise:

1. **`analyzing-hubble-tension-as-reflexive-dynamics.md`** defines the
   redshift-indexed **residuated sufficiency gap**
   $$g(z)=1-\frac{V(\mathrm{Together}(E_\mathrm{early}(z),E_\mathrm{late}(z)))}{V(\mathrm{Either}(E_\mathrm{early}(z),E_\mathrm{late}(z)))}$$
   from the non-equivalence of $\mathrm{Includes}(\mathrm{Together}(E_\mathrm{early},E_\mathrm{late}),\mathrm{Close}(E_\mathrm{late}))
   \Leftrightarrow \mathrm{Includes}(E_\mathrm{early},\mathrm{Induces}(E_\mathrm{late},\mathrm{Close}(E_\mathrm{late})))$,
   and lays out a genuine empirical implementation plan: load Planck 2018,
   DESI BAO DR1, and Pantheon+ posterior samples with full covariance
   propagation, project to the joint $(H, D_A)$ plane, compute
   Together/Either/Induces/Close via convex or kernel-density
   constructions, bootstrap, and compare against ΛCDM-mock null
   distributions.
2. **`dynamic-sufficiency-in-cosmological-inference.md`** promotes the
   static picture to **Flow**, a Kock–Zöberlein comonad on `Rel` with
   counit $\varepsilon_x : \mathrm{Flow}(x) \to x$, comultiplication
   $\delta_x$, and the coherence laws (right-unit, KZ-laxity,
   coassociativity) modeling how inference sufficiency propagates across
   redshift, with a CoKleisli composition and a dynamic-imbalance
   diagnostic $g(z,\Delta z)$.
3. **`reflexive-disequilibrium-and-cosmological-phase-change.md`** (the
   strongest of the three) reads $g(z)$ as an order parameter for a phase
   transition, $dg/dz = -A(z)g - Bg^3$ from a quartic potential
   $\Phi(g;z) = \tfrac12 A(z) g^2 + \tfrac14 Bg^4$, couples it into the
   Friedmann equation as a **Reflexive–Friedmann System**
   $$H^2(z) = H_0^2\left[\Omega_m(1+z)^3 + \Omega_\Lambda + \Omega_g g^2(z)\right],$$
   derives an effective equation of state $w_\mathrm{eff}(z)$ and a
   "reflexive entropy" $S_r(z) = -\int g \ln g \, dz$ peaking at the
   critical redshift, and predicts $z_c \approx 0.9$, matching the
   matter–$\Lambda$ equality epoch. Its own strongest sentence, carried
   forward verbatim because it is the paper's real center of gravity: *"The
   transition $A(z_c)=0$ coincides with the onset of accelerated
   expansion, identifying dark-energy domination as the open phase of the
   reflexive field... Measured $g(z)$ profiles can thus reveal whether the
   universe's current expansion corresponds to relaxation from a reflexive
   phase change."*

All three papers report, in their body text, that "preliminary analyses
show $g(z)$ small at low and high $z$, peaking near $0.7 < z < 1.3$,
matching the transition from matter to dark-energy domination." **Evidence
honesty flag, load-bearing for everything that follows:** this program's
search of the sscu-sprint's own directories and every duplicate location
found no executable artifact, no data file, and no result table backing
that sentence — only the "conceptual pseudocode" reproduced in
§3.4/§7.2 of the papers themselves (`load_posteriors(...)`,
`for z in redshift_bins: ...`). The redshift-localization claim reads as
an *expected* pattern stated with the confidence of a *measured* one. It
is not fabricated — it is a reasonable physical expectation for where a
matter–$\Lambda$-transition-tracking quantity should peak, and it is
exactly what a real run of the plan in §3.2 would need to confirm or
refute — but this note will not carry it forward as an empirical result.
It is carried forward as Era 1's **hypothesis**, restated as the falsifier
this note's Open Construction (§4) is built to test.

### 1.2 Era 2 — Relational Hyperverse (Mar–May 2026): the calibrating contrast case

Per the program's own discipline (§3 of the program note), Era 2's
golden-step Hubble derivation gets one paragraph, not a section, and no
regrounding attempt. The seed (`hubble-golden-observation.md`) is a
numerical coincidence — $H_\mathrm{late}/H_\mathrm{early} \approx
73.04/67.4 \approx 1.0837$ against $\phi^{1/6} \approx 1.08351$, agreement
to 0.016%, inside the combined $1\sigma$ — logged honestly as "a numerical
observation, not a derivation... the observation predates that
derivation." The subsequent five-step Fibonacci-shuffle "derivation"
(`hubble-fibonacci-step.md`, `hubble-tension.md`) and its independent
Spectral Surface tunneling-mode argument both land on the same
$\phi^{1/(2d)}$ exponent for $d=3$ — two routes converging on one number is
suggestive, but neither route touches a bilattice, a gluing failure, or a
falsifiable measurement protocol distinguishable from curve-fitting a
constant. Its own honesty about this is worth crediting in full: *"'One
Fibonacci step': the claim that CMB and today are separated by exactly one
golden step needs a physical argument identifying the Fibonacci step with
a cosmological epoch. This is the weakest link in the correspondence."*
Graded **stretch**, exactly as the program note fixes it — kept here as
the discipline's negative exhibit, not quietly dropped, and its
self-flagging kept as the stylistic model independent of the math's fate.

### 1.3 Era 3 — Predicated Cosmology (June 2026): read term by term against the live core

Era 3 (`hubble-tension-as-residuation-failure.md`,
`sufficiency-gap.md`, both `status: draft`, orphaned in `lib/legacy`) is
the owner's own prior re-grounding pass, done before obsmetrologia's Lean
core matured to its present state. It replaces Together/Either/Induces
with Belnap knowledge-order meet/join $\wedge_k, \vee_k$ and a residual
$\to_k$, restates the sufficiency gap as
$$g(z) = 1 - \frac{V(v_\mathrm{early}(z) \wedge_k v_\mathrm{late}(z))}{V(v_\mathrm{early}(z) \vee_k v_\mathrm{late}(z))},$$
and states the theorem this note inherits as its central claim: the
**residuation law** $a \wedge_k b \leq_k c \iff b \leq_k a \to_k c$ never
fails (definitional, right-adjoint to meet), but the **compatibility
condition** $v_\mathrm{early}(p) \wedge_k v_\mathrm{late}(p) >_k \bot$ can
and does fail — and Hubble tension is exactly that failure for $p = H_0$.
It names three structurally distinct failure modes (systematic-in-one-
pipeline / missing-predicate / closure-rule-system-inconsistency) and
states its own open item verbatim (quoted in full above). This is careful
work, and the judgment this program's discipline demands is whether it is
sound against what the live core actually proves, term by term, or
whether it is aspirational prose borrowing the core's vocabulary without
being backed by it. Both are present, and separating them is this
section's job.

**Sound — backed by proved, live Lean facts:**

- *The residuation law never failing is not a modeling choice; it is a
  structure field.* `Obsmetrologia.Order.ResiduatedLattice` (in
  `Calculus/Order/ResiduatedLatticeStandalone.lean`) carries
  `fuse_imp_adj : ∀ a b c, (meet (fuse a b) c = fuse a b) ↔ (meet a (imp b c) = a)`
  as a field of the structure itself — the adjunction $a \cdot b \leq c
  \iff a \leq (b \to c)$ holds by construction for *any* term of this
  type, exactly as Era 3 asserts. There is no case where it can fail; that
  is what "definitional" means here, verified rather than merely restated.
- *The FOUR-valued bilattice charge is real, live, and does carry a
  proved Belnap structure.* `Charge := Articulating.Corner` is proved
  (`Articulation/Articulating/FourCorner.lean`) to biject with the
  status-pair object `Bool × Bool`, i.e. Belnap's `⊥ₖ / t / f / ⊤ₖ`; the
  Klein-four symmetry of negation and conflation on it is proved
  (`Language/Positing/Four.lean:klein_four`), and FOUR's status as
  *initial among bounded interlaced bilattices* is stated and pursued in
  the same module. Era 3's replacement of the informal
  Together/Either calculus with $\wedge_k, \vee_k$ on a genuine Belnap
  bilattice is not decoration — the object it names actually exists,
  proved, in the live core.
- *The obstruction-typing apparatus this note needs is proved, not
  aspirational.* `Obsmetrologia.Cohomology.SettlingCohomologyH1`
  (`Cohomology/SettlingCohomologyH1.lean`) proves `h1_vanishes`: every
  Čech 1-cocycle (an *agreeing family* of local sections) glues to a
  unique global section, constructively, by pointwise read-off
  (`glue`) plus `Sheaf` separation — and, separately, that this vanishing
  is gated by the closure-ordinal regime
  (`cohomologyVanishes_iff : cohomologyVanishes r = true ↔ r = strict ∨ r =
  scott`), so `H¹ ≠ 0` is possible only outside the strict/Scott-continuous
  regimes. This is the exact machinery Era 3's compatibility-failure
  reading needs to become more than a name.

**Aspirational — real vocabulary, no live construction backing it yet:**

- *There is no proved continuous bilattice in the live core.* The proved
  `Charge` object is the **finite** four-point Belnap lattice — exactly
  right for a single Boolean-flavored predicate ("is $p$ true, false,
  both, or neither"), and exactly wrong, as stated, for $g(z)$ as Era 3
  and Era 1 both define it: a ratio of *measures* $V(\cdot)$ of regions in
  a continuous $(H, D_A)$ plane. Era 3's own "Equivalent formulations"
  section already half-admits this — it defines the continuous case by
  falling back to $1 - V(\text{intersection})/V(\text{union})$ and treats
  the discrete FOUR case as a separate, coarser special case ($g=1$ when
  one side is $\mathbf t$ and the other $\mathbf f$). No module in the
  live core builds the continuous-bilattice extension (a `Charge`-valued
  or interval-valued measure on $\mathbb{R}^n$) that would make "$v_\mathrm{early}(z)
  \wedge_k v_\mathrm{late}(z)$" a literal meet in a *proved* lattice rather
  than a description in prose of what such a meet should do. This is the
  single largest gap between Era 3's translation and the instrument that
  actually exists, and it is the first thing §4's Open Construction has to
  build.
- *`SettlingCohomologyH1` is proved for the abstract Čech-datum shape, not
  for any cosmological instantiation of it.* `h1_vanishes` holds for
  *every* `Cech1` — but a `Cech1` datum is a `Sheaf.Cover` (a set of
  patches over `PredicationCell`) plus a local `F_U`-cochain per patch.
  Nobody has built the cover-and-local-sections object that would let
  `E_early` and `E_late` (as Planck-chain-derived and
  DESI/Pantheon+-chain-derived cosmological sub-settlings) actually *be*
  such a datum. The theorem is real; its cosmological instance is not yet
  constructed. Reading "the tension is a nonzero `H¹` class" is
  therefore, honestly, a *framing hypothesis borrowing a proved theorem's
  shape*, not yet an application of the theorem to cosmological data.
- *Flow, the KZ-comonad dynamical layer, has no live cosmology-specific
  counterpart.* The live core's closest live relative is the general
  nucleus/closure-operator theory
  (`Language/Positing/NucleusAndCommutingNuclei.lean` — closure operators,
  commuting nuclei, the nuclear-quartet), which is a real, proved,
  *different* piece of machinery (fixed-point sub-algebras of a Heyting
  algebra under meet-preserving closures) than a redshift-indexed KZ
  comonad modeling forward propagation of inference across cosmic time.
  The family resemblance (both are about closure/idempotence) is real;
  the specific dynamical claim Era 1's Flow and Era 3's status document
  (Era 3 does not even attempt to translate Flow — its own Provenance
  section lists only the static residuation papers, not
  `dynamic-sufficiency-in-cosmological-inference.md`, among what it
  translates) is unbuilt.

**Verdict, stated plainly because the program's discipline requires it
stated plainly:** Era 3's *theorem statement* — residuation-law-never-
fails vs. compatibility-condition-can-fail — is a correct restatement of a
real structural fact about residuated bilattices, verified against
`ResiduatedLatticeStandalone.lean`'s adjunction field. Era 3's *application
of that theorem to cosmological data* is not yet built: the bilattice
values $v_\mathrm{early}(H_0)$ and $v_\mathrm{late}(H_0)$ that the theorem
needs as inputs do not exist as constructed objects anywhere in this
estate. Era 3's own Status line already says this ("Draft... Open: an
explicit construction"); this note's contribution is to say precisely
*which* pieces of the live core that construction would need to touch, and
in §4, to specify how.

## 2. The mature-instrument reading

### 2.1 The compatibility-failure reading, re-grounded

Restated with the honesty of §1.3 attached: early- and late-universe $H_0$
determinations are candidate local sections over different "opens" of one
cosmological-measurement site. If they could be built as bilattice-valued
sub-settlings $E_\mathrm{early}$, $E_\mathrm{late}$ over a real `Sheaf.Cover`
of that site, the tension would be exactly the failure of
$v_\mathrm{early}(H_0) \wedge_k v_\mathrm{late}(H_0)$ to exceed $\bot$ — a
question `h1_vanishes` and its regime gate (`cohomologyVanishes_iff`)
already know how to answer *once the construction exists*. This is a
**framing hypothesis**, not a result: the theorem is proved, the
construction is not.

### 2.2 The obstruction typology

The obstruence note's general typology (genuine H¹ / witness error / gauge
artifact) specializes to cosmology exactly as Era 3's own three modes do,
now with each mode's *test* stated in terms the live core actually
supports:

1. **Genuine H¹.** The tension is load-bearing structure, not solved —
   `cl-inv`, the classifying invariant `[1_{F_U}]`, is provably forced to
   zero in the strict/Scott regime (`classifying_invariant_zero_strict`)
   and *can be nonzero only in the aperiodic regime* (`cohomologyVanishes_iff`,
   the negative direction). Test: does the cosmological settling's
   closure-ordinal regime sit outside strict/Scott? This is a real,
   checkable structural question once §4's construction exists — not
   currently answerable, because the construction does not exist.
2. **Witness error.** A systematic in one pipeline (calibration, distance-
   ladder rung, foreground model) — localizable, in principle, by
   provenance-tracked belief fusion the way `Settlement`'s four existing
   instances (tiles, beads, holes, Čech data) already localize admission
   failures to a specific base. No cosmology-specific provenance-fusion
   instance exists yet; this is the "standard measurement-issue hope"
   given a structural name, not evidence against it.
3. **Gauge artifact.** The two $H_0$ values are charts on one invariant
   with an unfound transition map — structurally the calibration-link
   bridge question already asks this exact thing
   (`calibration-link-as-residuation-bridge.md`, status: open), proposing
   a functor $\Phi$ from cosmological inference sub-settlings to
   instrument-fiber categories and naming three concrete obstructions to
   its existence (mismatched bilattices, loss of structure under $\Phi$,
   direction-of-inference mismatch). That question remains genuinely open
   and is not resolved by anything in this note.

The typology's honest contribution here is not that it tells you which
case obtains — nothing in the live core currently can — but that it makes
"new physics or systematics," cosmology's own working dichotomy (already
present verbatim in `how-we-measure-the-universe.md`), into three
*structurally distinct, separately falsifiable* hypotheses instead of one
undifferentiated shrug.

### 2.3 The settling/coarsening bridge: structure formation as foam

The what-the-foam-knows note's **Claim 6** (the hubble-bubble bridge) is
the single most direct bridge this program has found between the
flagship's own diagnostic and an independent obsmetrologia thread written
the same day: the universe's large-scale structure — voids walled by
filaments — *is* a foam, and structure formation is a coarsening process;
void statistics are an established cosmological probe in the live
literature (not an estate invention — see §3). The von Neumann settling
law the foam note ports to belief-communities, $dA/dt = k(n-6)$ (an
*exact* theorem in 2D dry-foam nonequilibrium dynamics — cell growth rate
depends only on neighbor count, not size or shape), gives $g(z)$ a second,
independent reading worth stating precisely and grading precisely:
**$g(z)$, read as a gluing-failure measure, is structurally the same kind
of quantity as a foam coarsening-rate residual** — both measure how far a
local patch's growth departs from what its topology alone would predict.
This is not a claim that cosmic structure formation obeys the von Neumann
law literally (nothing in this estate has checked that against real void
catalogs, and the foam note is explicit that its own claims await the
pymetrologic foam-settling simulation and dialect-atlas time-series as
referees). It is a claim that the *mathematics* connecting a settling
law's local rule to a global coarsening statistic is the same mathematics
$g(z)$ would need if it is ever computed from real survey data and checked
against void-size-distribution or wall-thickness statistics as an
*independent* falsifier of the same underlying construction. [Framing
contribution, Research-grade — the bridge is structural and stated
precisely; whether it says anything true about the actual cosmic web is
untested and belongs to §4's obligations, not this section's claims.]

### 2.4 What the causal-set/Lorentzian modules add

`CausalSets.Causal.Cone` proves, unconditionally for any finite causal set
with a decidable reachability relation, that causal reachability *is* a
strict cone geometry: `CausalLe` is a proved partial order
(`causalLe_refl`/`causalLe_trans`/`causalLe_antisymm`, the last of which is
literally the no-closed-timelike-curve statement — mutual precedence
forces equality), spacelike separation is proved symmetric
(`spacelike_symm`), and future cones are proved transitive and upward-
closed (`future_trans`, `future_is_upward_closed`), bundled in
`causal_reachability_is_cone_geometry`. **Correction to the program note's
own phrasing, made here because the discipline demands catching this on
self-review rather than carrying it forward uncorrected:** the program
note refers to "the proved apex-cone/void-cone timelike/spacelike
theorem"; this note's search of the live `CausalSets` tree did not locate
a theorem under that name. What it located is `causal_reachability_is_cone_geometry`
and its supporting lemmas above — the real content the program note was
almost certainly pointing at, differently named. Citing the theorem that
actually exists rather than repeating an unverifiable name is the
native-literature test applied to the estate's own prior claims about
itself.

What this genuinely adds, absent from all three prior eras: if
$E_\mathrm{early}$ and $E_\mathrm{late}$ were built as events (or event-sets)
on a causal set representing the cosmological measurement site — plausibly
one event-cluster per survey/epoch/redshift-bin — the early/late split
becomes literally a `Spacelike`-vs-`CausalLe` question, and "where is the
curvature/obstruction concentrated" becomes a question with a proved
structural answer-shape (`CausalSets.Curvature.Lambek`'s
`residuals_coincide_iff_commutative`, ported to language in the Witnessed
Field theory's own A6: composition curves precisely where it is most
non-commutative). Whether the matter–$\Lambda$ transition redshift band
Era 1 flagged (`0.7 < z < 1.3`) is where a causal-set curvature computation
on real cosmological event data would actually concentrate is an unasked,
unanswered, but now well-posed question — a genuinely new structural
question none of the three prior eras asked, and one this note does not
answer.

A further, more speculative echo, graded explicitly as an echo and not a
claim: Part 1 of the 561-and-the-whirl-hypothesis note records, as
verified estate fact, that `Defect.lean`'s
`unpaired_disclination_survives_descent` proves a five-coordinated site in
a six-fold lattice carries an undischargeable curvature quantum under the
corpus's own settling/relaxation dynamics, and that this session's foam
work (§2.3 above) already flags the disclination as "foam dynamics'
minimal mover." If the coarsening bridge in §2.3 holds any water, the
matter–$\Lambda$ transition redshift band is exactly the kind of place a
persistent, undischargeable topological defect in the causal-set curvature
field would show up — genuine H¹ in the settling-cohomology sense
literally realized as an undischargeable disclination in the causal-set
curvature sense. [Research-grade, offered because it is generative, not
because it is load-bearing; this is two independent obsmetrologia threads
noticing the same redshift band from different directions, which is either
a real structural convergence or an artifact of both threads inheriting
the same "matter–$\Lambda$ transition is interesting" prior. Nothing here
distinguishes those two possibilities.]

## 3. The live literature, engaged honestly (2026)

Per the program's native-literature test, this section reports what this
program actually found via live search in August 2026, graded by source
type, with the estate's own machinery held strictly separate from the
field's findings.

### 3.1 Where $H_0$ measurement stands

The tension has not resolved; if anything it has deepened. SH0ES's
JWST-updated distance-ladder result sits at $H_0 = 73.17 \pm 0.86$
km/s/Mpc (an extended JWST calibrator-host analysis reports $72.6 \pm 2.0$),
consistent with the original Riess et al. 2022 (ApJ 934, L7) value Era 1
and Era 3 both cite. Freedman et al.'s independent JWST TRGB/JAGB/Cepheid
combination reports a markedly lower $69.96 \pm 1.53$ km/s/Mpc — inside
neither the SH0ES nor the Planck $67.4 \pm 0.5$ envelope cleanly, and
2025-era JWST-calibrated TRGB analyses generally cluster $69$–$72$,
narrowing the gap to SH0ES without closing it to Planck. Reported directly
by a CERN Courier summary and corroborated by multiple 2025 arXiv
preprints: JWST's role has been to *rule out* the leading systematic
hypothesis (Cepheid crowding/dust bias in HST photometry), not to resolve
the tension — the tension deepened rather than dissolved once the
suspected witness-error candidate was checked and cleared. [Verified —
multiple independent 2025–2026 sources converge; see Sources below.] This
is, read against §2.2's typology, direct evidence *against* the simplest
version of the witness-error hypothesis for at least the Cepheid-crowding
candidate specifically, though it does not rule out witness error
elsewhere in either pipeline.

### 3.2 The dynamical-dark-energy hints

DESI DR2 BAO (arXiv:2503.14738), combined with CMB and various supernova
compilations, shows a preference for $w_0 > -1$, $w_a < 0$ (departing from
$w=-1$ ΛCDM) at significances ranging $2.6\sigma$–$3.9\sigma$ depending on
the supernova compilation used (Pantheon+ giving the weakest signal,
DES-SN5YR and Union3 the strongest) — reported independently converging
around $2.8\sigma$–$4.2\sigma$ across the 2025–2026 literature (see
Sources). The physical picture several 2026 papers now converge on: CMB
constraints favor a phantom phase ($w < -1$) at early times, BAO/SN data
prefer quintessence ($w > -1$) at late times, with a phantom-divide
crossing near $z \approx 0.4$–$0.5$ and present-day $w_0 \approx -0.8$.
[Research-grade summary of a live, contested literature — the significance
depends materially on which supernova compilation is trusted, which is
itself an active methodological dispute this note does not adjudicate.]

### 3.3 The geometric-obstruction paper — an unplanned, direct echo

The single most striking find of this literature pass, and worth stating
carefully because it was not solicited to match the estate's own
vocabulary: Zhou, Wang, Miao, Ai & Zhang, "Geometric obstruction to
resolving the Hubble tension: orthogonality of scale and shape in distance
measurements" (arXiv:2606.12822, 2026-06-11), reports that the
BAO-vs-supernova matter-density gap $\Delta\Omega_m = 0.037$ is
**exactly invariant** under sound-horizon rescaling, and that reconciling
BAO and SN data via late-time $w(z)$ deformation requires *opposite-sign*
deformations — phantom ($w<-1$) for BAO, quintessence ($w>-1$) for SN at
$z<0.5$ — an anti-alignment the paper quantifies as $\cos\theta = -0.97$
in $w(z)$-deformation space. Their full MCMC (DESI DR2 BAO + Planck
plik_lite + Pantheon+) finds the optimal sound-horizon rescaling brings the
joint fit to $H_0 = 70.3 \pm 0.3$ km/s/Mpc, still $3.2\sigma$ below SH0ES —
tension reduced, not removed. This is, independently of any obsmetrologia
vocabulary, a mainstream cosmology paper reporting that two sub-instruments
of the measurement site *cannot be reconciled by any single transition
map* because the corrections each would need are pointed in opposite
directions — which is precisely the shape of a compatibility failure
where a gauge-artifact reading (§2.2, case 3) is being actively tested and
found wanting *in this specific corrected-late-time-only direction*, by
working cosmologists, using their own tools, independent of and prior to
this program's existence. [Verified as a real, published, peer-reviewed-
track result — its cosmological interpretation is the authors' own and
this note adds nothing to it beyond noting the structural resonance; the
resonance itself is Research-grade, offered because it is a striking,
unplanned convergence, not because obsmetrologia predicted it in advance.]

## 4. The Open Construction

Era 3's own named open item, restated as a scoped, buildable task rather
than a wish, because the discipline's falsifiable-structure test demands
exactly this:

**Goal.** Construct $E_\mathrm{early}$ and $E_\mathrm{late}$ as
continuous-bilattice-valued sub-settlings from real, published posterior
chains, compute the predicated $g(z)$, and check whether it reproduces
Era 1's claimed empirical shape (small at low and high $z$, peaking near
$0.7 < z < 1.3$) — which, per §1.1's honesty flag, has never actually been
checked against real data by any prior era.

**What data.** Planck 2018 legacy MCMC chains (public via the Planck
Legacy Archive, `base_plikHM_TTTEEE_lowl_lowE`), projected to $(H(z),
D_A(z))$ via the standard ΛCDM background solution at each redshift bin;
DESI DR2 BAO likelihood chains plus a supernova compilation — Pantheon+
first, since it gives the most conservative dynamical-dark-energy signal
(§3.2) and is what Era 1's own plan named; Union3 or DES-SN5YR as a second
pass, since §3.2 shows the choice of compilation materially changes the
late-time picture, and the estate's own construction should not silently
inherit that dependency without surfacing it.

**What pymetrologic development.** Three concrete gaps, in build order:

1. A continuous-bilattice (interval- or measure-valued) extension of
   `Charge` — the largest gap identified in §1.3. This does not yet exist
   in the live core; building it (a `Charge`-indexed or interval-valued
   measure on $\mathbb{R}^n$, with meet/join defined as intersection/union
   of support regions weighted by posterior density, per
   `sufficiency-gap.md`'s own "Equivalent formulations" section) is
   prerequisite to everything else.
2. A `Cech1` instance whose cover is the redshift-binned $(H, D_A)$
   projection plane and whose local sections are the early/late posterior
   densities restricted to each bin — an actual cosmological instantiation
   of `SettlingCohomologyH1`'s abstract `Cech1` shape, not presently built.
3. A closure-ordinal regime classifier for the resulting settling (strict
   / Scott / transfinite-bounded / aperiodic), so that §2.2's genuine-H¹
   test (`cohomologyVanishes_iff`) is answerable rather than merely
   statable.

**What falsifies.** Two independent, pre-registered falsifiers, stated
before the construction is run rather than fit to its output after:

- **Era 1's shape claim.** If the computed $g(z)$ is flat, monotone, or
  peaks outside $0.7 < z < 1.3$, Era 1's central empirical hypothesis — the
  one this whole program has, until now, carried forward unverified — is
  false, and should be reported as false rather than quietly dropped.
- **The foam-bridge / geometric-obstruction cross-check.** If §2.3's
  coarsening bridge and §3.3's geometric-obstruction finding are both
  pointing at the same underlying phenomenon rather than a coincidence of
  vocabulary, the redshift bins where the predicated $g(z)$ is largest
  should correlate with the redshift range where Zhou et al.'s
  BAO-vs-SN anti-alignment ($\cos\theta \to -1$) is sharpest. This is a
  genuinely new, falsifiable link between an obsmetrologia construction
  and an independent, already-published mainstream result — not proposed
  by either source on its own, and not yet checked by anyone, including
  this note.

Neither falsifier has been run. This section specifies a task, not a
result.

## 5. Obligations

Stated as what would falsify or complete this note's framing, per the
program's own quality bar:

1. Build the continuous-bilattice extension of `Charge` (§4, item 1) —
   without it, every quantitative claim in this note about $g(z)$ remains
   prose describing what a computation should do, not a computation.
2. Run §4's construction against real Planck + DESI DR2 + Pantheon+
   chains and report the resulting $g(z)$ shape, whatever it is —
   including if it falsifies Era 1's hypothesis.
3. Determine the closure-ordinal regime of the resulting settling; only
   then does §2.2's genuine-H¹ test become answerable rather than merely
   well-posed.
4. Either build the calibration-link bridge functor $\Phi$
   (`calibration-link-as-residuation-bridge.md`'s own four numbered steps)
   or record that it fails and why — the gauge-artifact reading (§2.2,
   case 3) is not evaluable without it.
5. Check the §4 cross-falsifier against Zhou et al. 2026's published
   $w(z)$-deformation data directly, rather than against this note's
   restatement of it.
6. Cross-check §2.3's von Neumann-law port against the pymetrologic
   foam-settling simulation once it exists, and against real void-catalog
   statistics — the foam note's own referees, not this note's.

## 6. Self-grading against the anti-cosplay discipline

**Falsifiable-structure test.** Passed, conditionally: §4 adds a
measurement protocol (three named build steps, two pre-registered
falsifiers) that did not exist before this note, and §1.1's honesty flag
is itself new structure — no prior era's document states plainly that the
empirical shape claim was never computed. The condition: nothing in this
note has *run* that protocol yet, which is why §5 exists rather than a
results table.

**Resolution-vs-framing test.** Passed. Every claim about the Hubble
tension's *cause* is stated as a framing hypothesis (§2.1's opening
sentence, repeated: "This is a framing hypothesis, not a result"); every
section touching the live literature (§3) reports the field's own findings
without claiming the estate's mathematics adjudicates between them.

**Native-literature test.** Passed, with one self-correction recorded
rather than hidden (§2.4's apex-cone/void-cone naming correction) — the
discipline's own instruction to catch violations on self-review rather
than defend them, applied to a claim inherited from the program note
itself, not only to new material in this note.

## 7. Predecessor embeddings

Era 1's `Rel`/residuation calculus: the informal predecessor of the
proved `ResiduatedLattice` structure — real mathematical instinct, later
formalized, credited by name throughout §1.1 rather than absorbed silently.
Era 3's predicated-cosmology translation: the direct formal ancestor of
this note's §2, credited term by term in §1.3 including where its
translation remains aspirational. The obstruence note: source of the
genuine-H¹/witness-error/gauge-artifact typology used throughout §2.2.
The what-the-foam-knows note: source of the coarsening bridge in §2.3,
credited as an independent thread this note connects rather than
originates. The 561-and-the-whirl-hypothesis note (Part 1 only, per this
note's charge): source of the disclination echo in §2.4, explicitly graded
below load-bearing. Riess, Freedman, DESI Collaboration, and Zhou et al.:
the field's own working scientists, whose 2025–2026 results (§3) this note
reports and does not claim to improve on.

## Provenance

Written 2026-08-21 as the Regrounding program's flagship deliverable, per
the program note's §1 "First deliverable" specification. Sources for §1
and §2's Lean citations: `Obsmetrologia/Settlement.lean`,
`Obsmetrologia/Cohomology/SettlingCohomologyH1.lean`,
`Obsmetrologia/Calculus/Order/ResiduatedLatticeStandalone.lean`,
`Obsmetrologia/Articulation/Articulating/FourCorner.lean`,
`Obsmetrologia/Language/Positing/Four.lean`,
`Obsmetrologia/Language/Positing/NucleusAndCommutingNuclei.lean`,
`Obsmetrologia/CausalSets/Causal/Cone.lean` — all read directly from the
live `math-services-section/services/obsmetrological-services-section/lib/obsmetrologia`
tree (not `lib/legacy`) as part of this note's own preparation. Sources
for §1.1/§1.2's era material: the sscu-sprint trio at
`cosmology-services-section/content/text/documents/articles/notes/`
(2026-02-27) and the Era-2 relational-hyperverse corpus (dated 2026-05-21,
work traceable to 2026-03-16) via its `lib/legacy` duplicates. Sources for
§1.3: `hubble-tension-as-residuation-failure.md` and `sufficiency-gap.md`,
both `astronomy-services-section/lib/legacy/2026-06-21-astronomy/`, and
`calibration-link-as-residuation-bridge.md` (`science-services-section/lib/legacy/2026-07-31-lenticule-science-corpus/`).
Sources for §3: live WebSearch conducted 2026-08-21; see inline citations.

### Sources (§3)

- [Riess et al. 2022, "A Comprehensive Measurement of the Local Value of the Hubble Constant..."](https://iopscience.iop.org/article/10.3847/2041-8213/ac5c5b)
- [The Hubble Constant and the Crisis in Cosmology: A 2025 Status Report](https://newspaceeconomy.ca/2025/12/06/the-hubble-constant-and-the-crisis-in-cosmology-a-2025-status-report/)
- [The Hubble tension – CERN Courier](https://cerncourier.com/a/the-hubble-tension/)
- [The Chicago-Carnegie Hubble Program: JWST JAGB Extragalactic Distance Scale](https://arxiv.org/pdf/2408.03474)
- [Dissecting the Hubble tension: Sound-Horizon-Free H0 measurements](https://arxiv.org/html/2601.00650v2)
- [DESI DR2 Results II: BAO Measurements and Cosmological Constraints](https://arxiv.org/pdf/2503.14738)
- [Evidence for evolving dark energy from DESI DR2 BAO and Pantheon+, DES-Dovekie, and Union3](https://arxiv.org/html/2508.10514v7)
- [Evolving dark energy or supernovae systematics? (MNRAS)](https://academic.oup.com/mnras/article/538/2/875/8045606)
- [Geometric obstruction to resolving the Hubble tension: orthogonality of scale and shape in distance measurements](https://arxiv.org/abs/2606.12822)
- [Dynamical Dark Energy and the Unresolved Hubble Tension](https://arxiv.org/pdf/2512.07281)
