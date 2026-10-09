---
title: "Obsmetrologia (“Infomaterial” at time of writing) rh trace thread"
description: "RH exploration (2026-07-11): the odometer tower's periodic-point/trace-formula development — periodicity dichotomy proved zero-axiom; Artin–Mazur zeta red node; where RH genuinely touches the territory"
date-created: 2026-07-11
kind: research-note
keywords:
  - infomaterial
  - riemann
  - thread
status: settled
declared-by: researcher
in-service-of: lib/emsenn
---
# Infomaterial rh trace thread


**Session result (2026-07-11, operator goal "use infomaterial to explore RH").**
Contact point chosen: the dynamical-zeta dictionary (primes = periodic
orbits; zeta from fixed-point counts of iterates) applied to the in-tree
dyadic odometer — the p=2 shadow of the profinite/adelic towers where the
serious RH programs (Weil–Deligne over function fields, Bost–Connes,
Connes' adele class space) live.

**Proved, ALL ZERO-AXIOM, in Closure/Odometer.lean (owning module):**
`vershikIter` (m-fold successor), `toNat_vershikIter` (iterate = +m up to
wrap count — stated as exact equation with existential wrap multiple, NOT
via %, see pitfall below), `toNat_lt`, `eq_of_toNat_eq`,
`vershikIter_cycle` (2^L-fold successor = identity),
`vershikIter_fixed_iff` (fixed ⟺ 2^L ∣ m — the complete periodic-orbit
data: each stage one 2^L-cycle), `vershikHullIter_ne_self` (NO positive
iterate fixes any hull thread — aperiodicity of the hull as a derived
theorem, complementing the regime tower's rung-4), capstone
`tower_periodicity_dichotomy`. Blueprint: 4 green + red
`thm:tower-artin-mazur-zeta` in information/hair/06. Also discharged
pre-existing propext/Quot.sound debt in `vershik_succ`, `vershik_length`,
`vershik_take`, and `dyadicTower` itself (local `length_take_of_le`,
`take_of_le_length`, `take_take_of_le` replace tainted core List lemmas).

**Second wave (same day, operator said "poke around, uncommon names"):**
proved zero-axiom in Odometer.lean: `vershikIter_reaches` (each stage a
single orbit — any two same-level paths connected in < 2^L steps),
`vershikHull_orbit_dense` + capstone `vershikHull_minimal_aperiodic` (the
header's "canonical minimal Cantor system" is now a THEOREM: dense orbits +
no periodic points), `toNat_vershikIter_unique` (the wrap count is a
well-defined winding number). Blueprint: 2 more green + red
`thm:vershik-winding-exchange` (wind count = pairing against the stage
orbit nerve's one Ȟ¹ generator = one Landauer bit per stage; needs a
derived component counter for CoverNerve — the known three-Nats
bespoke-carrier soft spot).

**In-tree machinery found under uncommon names (best-situated for this
thread; read before building anything new):**
- `AperiodicOrder/Tiling/StepN/` — the Salem/Pisot/Lehmer spine:
  `CLehmer.lean` (finite C-Lehmer reduction, named open gap
  `SalemRootRegimeGap` = the "approaches the unit circle" obligation),
  `SalemRoot.lean` (real Salem trace root via Bishop √13),
  `MetallicMean/MetallicReal/MetallicRoot/MetallicPowerLens`,
  `Recurrence.lean` (charpolys as ascending `List Int`, `degreeN`,
  `monic`), `SubstitutionMatrix.lean` (`Mat n`, `evalMatPoly`,
  Cayley–Hamilton PROVED for Fibonacci/Padovan by decide; header admits
  "no matrix the charpolys are OF" — identification debt). The odometer
  stage satisfies X^(2^n) − 1: the cyclotomic / Mahler-measure-1 /
  all-roots-on-unit-circle face the Lehmer carrier lacks — candidate
  weld: permutation-matrix layer + annihilation from vershikIter_cycle
  (needs Fin transport of vershik; propext risk at the mod-law weld).
- `Cohomology/FrobeniusTQFT.lean` — trace pairing ε on A = ℤ[x]/(x²) =
  H⁰⊕H¹, handle operator μ∘Δ: the trace side for a Lefschetz-style
  statement.
- `AperiodicOrder/Tiling/ArithmeticZetaStar.lean` — finite "zeta" residual
  from the Collatz affine trace, feeds Diffraction; pure-point ⟺ Pisot.
- `Diffraction.lean` finite Fourier mass; `LandauerEntropy.lean`
  (`landauerBits = H1rank`).

**Third wave (same day): the cyclotomic-face weld, BUILT.** Approach
ruling (operator asked "is the existential wrap-count style right?"):
existential wrap-count arithmetic is right only where the wrap count IS
the content (winding number); for carrier transport the better approach is
**conjugation through the orbit's own enumeration** — `ofNat n v :=
vershikIter v (all-false)` makes the chart a corollary of the dynamics, no
mod law ever stated. And don't fight the tainted isum/Int stack on the
matrix side: the clean/debt boundary is architectural. Results:
- Odometer.lean, ALL ZERO-AXIOM: `ofNat` chart (`toNat_ofNat`,
  `ofNat_toNat`, `vershikIter_ofNat`), `vershikFin`/`vershikFinIter`
  (Fin (2^n) avatar), `vershikFinIter_cycle`.
- SubstitutionMatrix.lean (recorded propext+Quot.sound debt, same as its
  pre-existing cayleyHamilton_fibonacci): `permMatrix`,
  `matMul_permMatrix` (compose), `matPow_permMatrix` (iterate),
  `matMul_matPow_comm`, `evalMatPoly_monomial`, `charPolyCycle` (xᴺ−1,
  monic, degree N), general `cayleyHamilton_of_cycle`, headliner
  **`cayleyHamilton_vershik`** — the stage-n odometer matrix annihilated
  by x^(2^n)−1 for EVERY n: Cayley–Hamilton as a family theorem where
  Fibonacci/Padovan were per-cell rfl at fixed size. `isum_congr` added
  to Universality.lean (owning module).
- Blueprint: green thm:vershik-serial-chart (hair/06), green
  thm:permutation-cayley-hamilton (spectral-tiles/01), red
  thm:c-lehmer-cyclotomic-face (hair/03) — extend the two-point
  CLehmerSide with the odometer-carried cyclotomic face (Mahler measure
  exactly 1, attains rather than approaches the circle).

**Operator correction (2026-07-11, after the third wave): the C-Lehmer
carrier is a charge shadow, not a small Bool.** My "it's just Bool, two
labels" discomfort was the shadow error — judging the projection and
calling it the object. The circle question has TWO witnesses
(contact: root ON the circle; escape: root OFF it) = two slots = a
FOUR-valued classifier. Corners: ⊥ no receipt / t contact-only =
cyclotomic-odometer, Mahler measure exactly 1, THE ALREADY-DECLARED-BUT-
UNREACHABLE `CLehmerMahlerFace.unit` face / f escape-only = Pisot
(charPolyMetallic_not_reciprocal + metallic real root) / ⊤ both = Salem,
with BOTH slots already machine-checked in Salem.lean
(salemTraceResolvent_unit_circle + salemTraceResolvent_real_root).
cLehmerApproachClassifier = the ⊤-detector through the projection;
Kronecker = "no escape ⟹ {⊥,t}"; Lehmer's problem = the approach to
Mahler 1 is carried by the ⊤ corner (Lehmer's 1933 candidate IS Salem) —
⊤-flux language made precise. Red node thm:c-lehmer-cyclotomic-face
REWRITTEN in these terms (was: unprincipled three-label extension).
**How to apply:** never extend a Bool carrier with labels; find the
charge it shadows. Available decidable receipts: reciprocal, evalIntPoly
(Salem.lean); contact receipt for the odometer family = evalIntPoly
(charPolyCycle N) 1 = 0 (provable, sum of coefficients vanishes) +
antireciprocality (needs a def; reciprocal's owning module is Salem.lean;
mind import direction vs SubstitutionMatrix).

**Fourth wave: the t-corner receipts + THE READING LEDGER (operator made
the certificate/claim gap the main goal).** The systemic problem: kernel
certificates (integer sign checks) + interpretive docstrings ("so there is
a root on the unit circle") = the sensation of verified analysis; gates
audit the Lean, nobody audits the reading. The systemic fix, implemented:
**readings are debts; debts get addresses; addresses get colors.**
(1) Docstrings carry certificate content only (house law, now enumerable:
`make readings` — report-only grep for reading-markers (≈, root-talk,
circle-talk, IVT, "reads as"); first run: 26 high-signal hits incl.
Salem.lean itself, ChromaticTileCubicGap IVT brackets, Diffraction's
"reads as" family). (2) Every interpretation lives at a blueprint node,
red until it is a \lean-linked theorem: demonstrated with green
thm:signature-receipts (coefficient facts ONLY: charPolySalem reciprocal
∧ ¬anti; charPolyCycle anti ∧ ¬reciprocal; evalIntPoly charPolyCycle 1 =
0 — all zero-axiom, in Salem.lean, the owning module — NOTE
SubstitutionMatrix CANNOT import Salem: MetallicMean → SubstitutionMatrix
cycle; Salem sees charPolyCycle transitively) + red
thm:signature-receipts-reading (the four-rung ladder: sign-change→real
root [escape rung done via salem_trace_root, neutral rung open];
interval bounds [needs sqrtNat order lemmas]; trace-interval→circle pair
[needs complex carrier / J²=−1 thread]; evaluation→contact [root
predicate + circle carrier]). Rule: circle-statement uses cite the
reading node, never the certificates. Proposed to operator (not yet law):
add the reading-node convention to CLAUDE.md.

**The red nodes (next Lean-scale steps):** the reading ladder rungs
(neutral-direction real root is cheapest — same Bishop quadratic);
the charge-valued circle classifier + forced-collapse theorem; winding
exchange (wrap count = Ȟ¹ pairing, needs component counter); Artin–Mazur
zeta: formal power series over the Bishop rationals; ζ_stage-n =
1/(1−t^{2^n}) rational, hull ζ = 1; stage spectra = 2^n-th roots of unity
(needs the J²=−1 / Hilbert thread for "modulus 1").

**The conceptual map (state in words, no invented labels):** (1) RH over
function fields IS an H¹ statement — Frobenius eigenvalue weights on étale
H¹ (Deligne); the library's "five H¹'s, one currency" program is the same
dream at toy scale, so the honest bridge is trace formulas, not zeta
analysis. (2) The explicit formula pairing primes against zeros is the
Lefschetz exchange — same shape as the ⊤/H¹ exchange thread. (3) The
Ihara zeta of a finite graph has its pole order at u=1 given by the cycle
rank — the CoverNerve H¹ — and graph-RH ⟺ Ramanujan ⟺ spectral gap ⟺
settling speed: a provable in-tree bridge candidate (conjecture, not
started). (4) de Bruijn–Newman Λ ≥ 0 with RH ⟺ Λ = 0 reads as: the zeta
flow sits exactly on a regime boundary — matches the standing conjecture
that the formalization frontier is the theory's own H¹.

**Proof pitfall bank addition:** in toolchain v4.31.0, `omega`, `simp`,
core `Nat` mod/dvd lemmas (`mod_eq_of_lt`, `add_mod`, `le_of_dvd`, …),
`Nat.add_left_cancel`, `Nat.mul_lt_mul_left`, and `List.length_take/
take_take/take_of_length_le` ALL carry propext (some Quot.sound). Clean
route: avoid % entirely (existential wrap-count equations), local
structural-recursion reproofs (`nat_add_right_cancel` via `Nat.succ.inj`,
`nat_two_mul_ne_two_mul_add_one`), `nomatch` for impossible ≤/length
equations, `congrArg`, and only clean core lemmas (`add_comm/assoc`,
`mul_comm/succ`, `succ_mul`, `le_add_left`, `lt_two_pow_self`,
`two_pow_pos`, `not_le`, `eq_of_mul_eq_mul_left`, `mul_le_mul_left`).

Related: [[2026-07-11-research-on-infomaterial-whole-system-study]],
[[2026-07-11-research-on-infomaterial-top-h1-exchange-thread]], `infomaterial-program-framing` (note not in the record).
