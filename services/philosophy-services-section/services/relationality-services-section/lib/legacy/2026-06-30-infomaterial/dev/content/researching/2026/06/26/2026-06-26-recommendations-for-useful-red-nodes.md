## 1. `thm:aperiodic-mld-classification`

**Claim:** cohomological equivalence/classifying-invariant equality implies mutual-local-derivability.

This is the most important red node.
Multiple modules explicitly prove only the easy direction, MLD ⇒ equal `clInv`, and say the converse is the open classification theorem. fileciteturn36file0L49-L62 fileciteturn37file0L12-L16

```tex id="4f7wll"
\begin{theorem}[Aperiodic MLD classification]\label{thm:aperiodic-mld-classification}
  \lean{RelMath.Aperiodic.mld_of_cohEquiv}
  \notready
  \uses{thm:cohEquiv-classification-model, thm:aperiodic-direct-limit, thm:cohomological-equivalence-framework}
  If two aperiodic settlings have the same classifying invariant \(\mathrm{clInv}\),
  then there exists an invertible settling morphism between them; equivalently,
  cohomological equivalence is complete for mutual-local-derivability.
\end{theorem}
```

Missing bridge: Hermida–Jacobs / Bonchi-style fibered coinduction “up to closure,” not just equality of the invariant.

## 2. `thm:bigraded-truth-knowledge-les`

**Claim:** the two-row mapping-cone input induces the truth–knowledge long exact sequence, degenerating to a direct-sum decomposition.

`BigradedSettlingCohomology` already proves the cochain-level input: two rows, `d_v = 0`, split designated SES.
It explicitly says the cohomology-level LES/direct-sum theorem is **not** derived and names it as `thm:bigraded-truth-knowledge-les`. fileciteturn77file0L24-L30 fileciteturn78file0L9-L19

```tex id="8trjn9"
\begin{theorem}[Truth--knowledge long exact sequence]\label{thm:bigraded-truth-knowledge-les}
  \lean{RelMath.Bigraded.truthKnowledgeLES}
  \notready
  \uses{thm:bigraded-two-row-mapping-cone}
  The split designated short exact sequence
  \(0\to F_U^{(t)}\to F_U^{(k)}\to F_U^{(\top)}\to 0\)
  induces a long exact sequence in settling cohomology, and because the vertical
  differential vanishes, this sequence degenerates to
  \(H^n(F_U^{(k)}) \cong H^n(F_U^{(t)}) \oplus H^n(F_U^{(\top)})\).
\end{theorem}
```

Missing bridge: actual cohomology-group objects and induced maps, not just cochain-level split exactness.

## 3. `thm:jeandel-rao-persistence`

**Claim:** the finite Jeandel–Rao local cocycles persist through the marker/desubstitution directed system to a nonzero direct-limit class.

`JeandelRao.lean` proves two finite nonzero `H¹` projections, but explicitly says they do not yet prove persistence, full AP shift cohomology, or complete `clInv`; it names `thm:jeandel-rao-persistence` as the open frontier. fileciteturn75file0L49-L63

```tex id="njmhcg"
\begin{theorem}[Jeandel--Rao persistence]\label{thm:jeandel-rao-persistence}
  \lean{RelMath.Aperiodic.Witness.jeandelRaoPersistence}
  \notready
  \uses{thm:jeandel-rao-marker01-nonzero-h1-projection, thm:marker-ring-b3-nonzero-h1-projection, thm:aperiodic-direct-limit}
  The decorated witness \(\varphi\) is the pullback of the marker-ring class \(b_3\)
  along the marker/desubstitution system, and its class remains nonzero in the
  Anderson--Putnam direct limit.
\end{theorem}
```

Missing bridge: a finite chain-map/pullback map between the two witness complexes and the directed-system persistence proof.

## 4. `thm:real_stochastic_interval_value_category`

**Claim:** replace the older abstract/no-real stochastic semiring with the internally derived constructive reals, then build the actual `[0,1]` stochastic value category.

`Probability/Stochastic.lean` says stochastic settling is currently abstract because the file predates internal reals: it has no genuine `[0,1]`, only an abstract `StochSemiring` and a `Nat` witness. fileciteturn81file0L23-L29 `InternalReals.lean` later builds constructive reals and proves they instantiate the value-settling hub. fileciteturn47file0L35-L89

```tex id="7jmq9v"
\begin{theorem}[The real stochastic interval is a value category]\label{thm:real-stochastic-interval-value-category}
  \lean{RelMath.Probability.Stochastic.realUnitIntervalStochVC}
  \notready
  \uses{thm:reals-close-value-settling-hub, thm:stochastic-is-value-settling}
  The internally derived constructive reals support a unit-interval stochastic value
  category whose Markov kernels instantiate stochastic settling over genuine real
  probabilities, not merely an abstract semiring or counting witness.
\end{theorem}
```

Missing bridge: constructive `[0,1]` subtype, closure under `+`, `·` where appropriate, and probability-normalization laws.

## 5. `thm:positive_temperature_free_energy_flow`

**Claim:** extend `FreeEnergyLyapunov` from the `T=0` hard-closure/Nat-energy endpoint to positive-temperature real-valued stochastic/utility-driven closure dynamics.

`FreeEnergyLyapunov` is intentionally `Nat`-valued and explicitly says the positive-temperature/stochastic-firing extension is open without measures. fileciteturn30file0L167-L190 With internal reals now present, this becomes a very natural red node rather than vague speculation.

```tex id="qs557t"
\begin{theorem}[Positive-temperature settling free energy]\label{thm:positive-temperature-free-energy-flow}
  \lean{RelMath.Flow.positiveTemperatureFreeEnergy}
  \notready
  \uses{thm:free-energy-is-lyapunov, thm:real-stochastic-interval-value-category}
  There is a real-valued positive-temperature free energy whose \(T\to 0\) limit is
  the existing hard-closure Lyapunov theorem, and whose stochastic closure flow
  decreases expected free energy toward stationary settling equilibria.
\end{theorem}
```

Missing bridge: measure/expectation layer over internal reals, plus a stochastic closure operator compatible with the settling order.

## 6. `thm:myrheim_meyer_dimension_internal_reals`

**Claim:** finish the real-valued Myrheim–Meyer estimator using internal reals.

`MyrheimMeyer.lean` formalizes only the rational ordering fraction `r(v)` and scopes out `d_MM = f^{-1}(r)` because real/Γ machinery was absent.
It even flags a formula discrepancy in the corpus’s real-valued layer. fileciteturn79file0L78-L88 Now internal reals exist, so the next red node should isolate the real-valued estimator as a precise target.

```tex id="ozs03w"
\begin{theorem}[Internal Myrheim--Meyer dimension]\label{thm:myrheim-meyer-dimension-internal-reals}
  \lean{RelMath.Lorentzian.MyrheimMeyer.internalDimension}
  \notready
  \uses{thm:diamond-spacetime-portrait, thm:reals-are-scott-continuous-settling-completion}
  The rational ordering fraction \(r(v)\) of a finite causal settling can be lifted
  to an internally real-valued Myrheim--Meyer dimension estimator \(d_{MM}(v)\),
  with the diamond, chain, and antichain witnesses retaining geometry/topology
  independence after the lift.
\end{theorem}
```

Missing bridge: internal real special functions/inversion, or a deliberately weaker monotone calibration theorem avoiding full Γ.

## 7. `thm:cross_dimension_shift_equivalence`

**Claim:** generalize substitution universality from fixed-dimension SE to cross-dimension shift equivalence.

`Universality.lean` explicitly scopes to fixed matrix dimension, while noting that the corpus’s general shift equivalence can change rank/alphabet size. fileciteturn71file0L39-L43

```tex id="dvz4zf"
\begin{theorem}[Cross-dimension shift equivalence]\label{thm:cross-dimension-shift-equivalence}
  \lean{RelMath.Aperiodic.Universality.crossDimensionSE}
  \notready
  \uses{thm:shift-equivalence-is-equivalence, thm:universality-class-se-invariance}
  Shift equivalence of primitive substitution systems can be defined across
  different alphabet sizes, and the resulting universality relation still preserves
  the cohomological classifying invariant through the moduli stack.
\end{theorem}
```

Missing bridge: rectangular matrices / dimension groups / alphabet-change maps.

## 8. `thm:lawvere_kernel_h0_iso`

**Claim:** identify the Lawvere Laplacian kernel with `H⁰` at the cohomology object level.

`LawvereLaplacianSpectralGap` says the identification with degree-zero cohomology/global sections is an open in-core target. fileciteturn32file0L41-L55 `Laplacianizability` gives an algebraic Laplacianizer whose harmonic kernel is the settled sections. fileciteturn53file0L108-L145 The red node should explicitly bridge those.

```tex id="eei9pl"
\begin{theorem}[Lawvere harmonic kernel equals \(H^0\)]\label{thm:lawvere-kernel-h0-iso}
  \lean{RelMath.LawvereLaplacian.harmonicKernelH0Iso}
  \notready
  \uses{thm:harmonic-kernel-is-fixed-quiescent, thm:settling-laplacianizability}
  The harmonic kernel of the Lawvere Laplacian is naturally isomorphic to the
  degree-zero settling cohomology object \(H^0\), not merely definitionally aligned
  with quiescent fixed points.
\end{theorem}
```

Missing bridge: a shared `H⁰` object/API between `SettlingCohomologyH1` and `LawvereLaplacian`.

Best immediate additions: **1, 2, 3, 8**.
Those are already named or strongly implied by the repo itself, so they are low-risk red nodes.
Nodes **4, 5, 6** are newly available because `InternalReals` changed the ground under older “no reals” scoping.
