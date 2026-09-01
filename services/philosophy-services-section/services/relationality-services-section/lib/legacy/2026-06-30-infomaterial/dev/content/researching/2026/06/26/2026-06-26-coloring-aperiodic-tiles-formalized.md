# The coloring / aperiodic-tiles memo, formalized

This note summarizes, in ordinary mathematics, what got proved in Lean (`sites/relmath.bare-cedar-fog.emsenn.net/RelMath/`) for the coloring-aperiodic-tiles program.
Everything below is machine-checked in dependency-free Lean 4 — no Mathlib, no axioms beyond `propext` and `Quot.sound` (the latter is just how `funext` enters), and no `sorry`.
The point of the note is so you don't have to read the proofs to know what's true.

The memo had one slogan and one boundary:

- **Slogan:** *coloring = factor map = information.* A proper coloring of a structure is the same datum as a factor map onto a finite shift, and the number of bits to specify one is a logarithm.
  We turn each "=" into a theorem and then make the logarithm an actual real number.
- **Boundary:** the **Pisot/Salem** dichotomy of substitution inflations is the same dichotomy as the corpus's **settling-regime** stratification — contraction settles, a neutral rotation does not.

Four threads, matching the memo's sections.

---

## 1. Coloring is a factor map, and four colors are FOUR (§2)

A proper coloring of a graph `G` with palette `C` is exactly a graph homomorphism `G → K_C`, the complete graph on `C` (`properColoring_iff_hom`).
This is the memo's first "=": a coloring is a factor map onto a finite object.
The functoriality that makes it more than a slogan is `ProperColoring.comp`: colorings pull back along factor maps, which is precisely the move a sofic/matching-rule cover uses (color the simpler cover, pull the coloring back).
The same vocabulary runs the symbolic-dynamics side in §4.

The four-color case is special because the natural palette is the Belnap bilattice `FOUR = {⊥, t, f, ⊤}` — the same four corners that recur through the corpus.
The Four-Color-Theorem palette and the four charges are one alphabet.

**Concrete chromatic numbers.** For the complete graphs the number is exact on both sides: the identity coloring shows `χ(K_C) ≤ |C|`, and *every* proper coloring of a complete graph is injective, giving `χ(K_C) ≥ |C|`.
So `χ(K₂)=2` (an edge), `χ(K₃)=3` (the triangle, the first odd cycle), and the payoff `χ(K₄)=4`: every 4-coloring of `K₄` uses *all four* charges, with no slack.
`K₄` is the extremal graph that forces FOUR.

**Coloring as information.** The number of bits to name a proper coloring is `log₂(#colorings)`.
A single edge has exactly two proper 2-colorings, so its coloring entropy is `log₂ 2 = 1` bit — equal to the entropy of the full binary shift.
The triangle has `3! = 6` proper 3-colorings (the falling factorial).
Counting is done by enumerating a finite `List` and computing, so no cardinality framework is needed.

---

## 2. Sofic shifts, and the deep recognizability cover (§4)

A shift of finite type is a transition graph read as admissible walks; a **sofic** shift is a 1-block (letter-by-letter) factor of an SFT.
Coloring and sofic covers are literally the same idea seen from two sides — both are factor maps onto finite objects — and the functoriality theorem is the symbolic twin of `ProperColoring.comp`.

The canonical example is the **golden-mean shift**: alphabet `{a, b}`, the single rule "no `bb`".
It is the follower SFT of the Fibonacci substitution `a ↦ ab, b ↦ a`.
The easy half of soficity is proved in general form (`substitute_preserves_path`): any substitution whose block images are admissible and whose block boundaries are allowed lands inside its follower SFT.

The hard half is the **Goodman-Strauss recognizability cover**, and it is now proved for the golden case (`fib_deep_sofic`).
The claim: there is a genuine *decorated* finite-type system whose forgetful image is **exactly** the Fibonacci substitution subshift — not merely contained in it.
The decoration is a label on each letter recording its role in the supertile hierarchy: the start of an `ab`-block, the end of one, or a lone `a` (the image of `b`).
The local rules on the decorated alphabet `{(a,start), (b,end), (a,lone)}` are

```
(a,start) → (b,end)            -- the ab block is contiguous
(b,end)   → (a,start) | (a,lone)
(a,lone)  → (a,start)          -- and (a,lone) → (a,lone) is forbidden
```

That last forbidden edge *is* the preimage's no-`bb` rule, one level down.
Forgetting the label gives back `a, b, a`, and every substitution word `σ(w)` over a golden-admissible preimage `w` lifts to an admissible decorated word — the decoration is recoverable.
So the Fibonacci subshift is the exact forgetful image of a finite-type system: it is sofic in the strong, decorated sense.

---

## 3. Pisot versus Salem: the algebraic boundary of aperiodicity (§5)

The substitution matrix of an inflation carries a binary similarity invariant: **Pisot** versus **Salem**.
A Pisot number is an algebraic integer `λ > 1` whose conjugates lie *strictly inside* the unit disk — a contracting internal direction, which is what gives pure-point diffraction, cut-and-project windows, and the clean sofic/Markov structure above.
A Salem number has conjugates on-or-inside the unit circle with at least one *on* it — a neutral rotation, the singular-continuous, non-settling boundary.

The metallic means are the Pisot family: the companion matrix `[[n,1],[1,0]]` has characteristic polynomial `x² − nx − 1`, non-reciprocal, determinant `−1`, golden when `n = 1`.
The first Salem in the library is the degree-4 `x⁴ − x³ − x² − x + 1`, reciprocal (palindromic), determinant `+1`.
The whole distinction is read off in the *reals*: dividing the reciprocal quartic by `x²` and setting `y = x + 1/x` gives the trace resolvent `y² − y − 3`, whose sign changes locate a conjugate pair *on* the unit circle (`y ∈ (−2,2)`) and the real Salem root `λ ≈ 1.72 > 1` (`y > 2`).
No complex numbers needed.

Several facts are pinned down:

- The metallic means are real numbers.
  Division-free, with `z = 2μ = n + √(n²+4)`, the metallic mean satisfies `z² = 2n·z + 4` (`metallic_root`, all `n`); the golden and Salem roots are the `n=1` and Salem instances.
  These rest on a constructive square root `√c` for the Bishop reals with `(√c)² = c`.
- The Salem companion satisfies its own characteristic polynomial, `M⁴ = M³ + M² + M − I` (`salemCompanion_cayley_hamilton`), the matrix form of the Salem recurrence.
- **The Salem/Pisot split is the settling-regime split** (`salem_vs_pisot_regime`).
  The corpus stratifies closure dynamics by ordinal `κ` into strict / Scott / transfinite-bounded / aperiodic.
  A contracting (off-circle, Pisot) direction settles at a finite stage — the **strict** regime.
  A neutral (on-circle, Salem) direction never contracts and settles only at `κ ≥ ω₁` — the **aperiodic ⊤-regime**.
  So the classical Diophantine invariant and the corpus's own regime classification are one dichotomy: the loss of contraction on the Salem circle is exactly the jump to aperiodicity.

---

## 4. Information made real: `log₂` and the golden entropy (§6)

The "= information" half needs entropy to be an actual number, so we build `log`.

**Integer floor logarithm and entropy of full shifts.** `log₂ N` is constructed as a Bishop real (the floor-approximation `⌊log_b(N^{k+1})⌋/(k+1)`, regular Cauchy with linear modulus).
The topological entropy of the full `N`-shift is `log₂ N`; the binary shift carries exactly `1` bit (`log₂ 2 = 1`); and entropy is monotone in the alphabet (more symbols, more entropy).

**`log` is additive, hence extensive.** The defining functional equation `log₂(MN) = log₂ M + log₂ N` holds for the real logarithm (`logNat_mul`).
The floor logarithm is *not* additive — it is off by `±1` — but that defect is a null sequence `≤ 1/(k+1)` that vanishes in the limit.
Additivity is what makes `log` *the* information measure rather than a monotone gadget: independent systems' information adds.
From it follow the power law `log₂(Nᵉ⁺¹) = log₂(Nᵉ) + log₂ N`, log on the rationals (`log₂(p/d) = log₂ p − log₂ d`, well-defined because the additivity cancels the shared part), and monotonicity of `log` on `ℚ`.

**The golden inflation entropy `log₂ φ` as a single real.** The headline.
The golden mean `φ = (1+√5)/2 ≈ 1.618` is the limit of the Fibonacci convergents `F_{k+1}/F_k`, so the golden inflation entropy is `log₂ φ = lim log₂(F_{k+1}/F_k)`.
We construct it as one Bishop real, *with* a proof that the convergent logarithms converge to it (`goldenLog_converges`).
The construction has a satisfying shape: all the convergent monotonicity collapses onto **Cassini's identity** `F_{k+2}F_k − F_{k+1}² = (−1)ᵏ` — even convergents increase, odd decrease, and even ≤ odd, each because a cross-product difference equals `±1`.
The hard analytic input is the per-step bound

> `log₂(M+1) ≤ log₂ M + 1/(k+1)` whenever `2(k+1) ≤ M`,

i.e. `log` is Lipschitz-with-a-rate.
Its arithmetic core is a Bernoulli inequality `(M+1)ⁿ ≤ 2·Mⁿ` for `2n ≤ M`; getting from there to the real bound required building scalar cancellation on the Bishop reals from scratch (`n·X ≤ n·Y → X ≤ Y`, lifted from integer cancellation through the quotient).
With Cassini giving the convergent widths and the Lipschitz bound giving the rate, the convergent-logarithm sequence is regular Cauchy, and the constructive completeness of `ℝ` delivers the limit.
`log₂ φ ≈ 0.694` is now a constructed number, not a slogan.

---

## What this adds up to

The memo's two claims are theorems. *Coloring = factor map = information*: the first equality is a graph identity (§1), the same factor-map functoriality runs both the coloring and sofic sides (§1, §2), and the information is a genuine real logarithm — additive, monotone, and in the golden case a single constructed real (§4). *The aperiodic boundary is a regime jump*: the classical Pisot/Salem invariant and the corpus's settling-ordinal stratification are the same split, with the loss of contraction on the Salem unit circle being exactly the transition into the aperiodic `⊤`-regime (§3).

The recurring lesson in the proofs: the deep structure makes the hard parts cheap.
Cassini collapses all the convergent ordering; additivity makes `log` the information measure for free; the no-`bb` rule one level down *is* the decorated boundary that makes the substitution recognizable.
The work was never in the combinatorics — it was in building the constructive real-analysis substrate (`√`, `log`, scalar cancellation, completeness) that lets these one-line facts land as numbers.

*Files: `sites/relmath.bare-cedar-fog.emsenn.net/RelMath/Order/{GraphColoring,ChromaticNumber,ColoringEntropy}.lean`, `sites/relmath.bare-cedar-fog.emsenn.net/RelMath/Aperiodic/SoficShift.lean`, `sites/relmath.bare-cedar-fog.emsenn.net/RelMath/Aperiodic/StepN/{Salem,SalemRoot,SalemRegime, MetallicRoot}.lean`, `sites/relmath.bare-cedar-fog.emsenn.net/RelMath/Real/{Logarithm,LogLipschitz,GoldenLog}.lean`.*
