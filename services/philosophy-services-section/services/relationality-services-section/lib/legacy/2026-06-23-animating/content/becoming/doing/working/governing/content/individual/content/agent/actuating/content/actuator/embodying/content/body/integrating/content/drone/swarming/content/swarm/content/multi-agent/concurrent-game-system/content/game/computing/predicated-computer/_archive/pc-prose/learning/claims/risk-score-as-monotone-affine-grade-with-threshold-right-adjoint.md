---
type: theorem
class: engineering-claim
status: proved
depends-on: [cost-composition-via-lawvere-quantale, cost-discipline-reads-free]
see-also: [graded-dispatch-via-q-enriched-fusion, federation-path-metrics-multiplicative, telemetry-as-continuous-valued-settling-projection]
---

# Tool risk score is a monotone affine grade in the additive Lawvere quantale, with threshold projection a Galois right-adjoint to threshold-embedding

**Claim.** For any tool call scored by a `risk-profile` cell over $n$ axes with non-negative weights $w_1, \dots, w_n \in [0, \infty)$, base $b \in [0, \infty)$, and axis-indicator vector $\mathbf{x}(\mathrm{call}) \in \{0, 1\}^n$ deterministically derived from the call payload, the score map

$$\sigma_{(b, \mathbf{w})}(\mathrm{call}) \;=\; b \;+\; \sum_{i=1}^{n} w_i \cdot x_i(\mathrm{call})$$

is a *monotone affine functional* of the indicator vector valued in the additive [Lawvere quantale](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/examples/benchmarks/benchmark-lawvere-quantale-settling.md) $\mathcal{V} = ([0, \infty], +, \min)$. The band-projection map

$$\pi(s) \;=\; \max\{\,B \in \mathbf{B} \mid \mathrm{thresh}(B) \le s\,\}, \qquad \mathbf{B} = \{\,\mathrm{low} < \mathrm{medium} < \mathrm{high} < \mathrm{critical}\,\}$$

is the *Galois right-adjoint* of the threshold-embedding $\mathrm{thresh} : \mathbf{B} \hookrightarrow \mathcal{V}$: that is, $\mathrm{thresh}(B) \le s \iff B \le \pi(s)$, equivalently $\mathrm{thresh} \dashv \pi$. The composite $\pi \circ \sigma_{(b, \mathbf{w})}$ is monotone in the axis-match partial order on calls, replay-stable when versioned at the `risk-profile-version` cell, and inheritance composes as parameter-vector addition: $(b_p, \mathbf{w}^p) \oplus (b_a, \mathbf{w}^a) = (b_p + b_a,\; \mathbf{w}^p \mathbin{\Vert} \mathbf{w}^a)$ on the commutative monoid of risk-profile parameters.

## Why this holds

Per [cost-composition-via-lawvere-quantale](cost-composition-via-lawvere-quantale.md), the additive Lawvere quantale $\mathcal{V} = ([0, \infty], +, \min)$ carries non-negative reals with associative-commutative addition, additive unit $0$, and natural total order. The score expression $b + \sum_i w_i x_i$ is a finite $+$-fold over non-negative summands; the result is a well-defined element of $\mathcal{V}$.

The map $\sigma_{(b, \mathbf{w})}$ is *not* a quantale homomorphism on the set of calls, because the call-set carries no $\otimes$-structure that $\sigma$ would need to preserve, and because the base term $b$ generally breaks unit preservation when $b > 0$. What $\sigma_{(b, \mathbf{w})}$ *is*, structurally:

- **Monotone in the indicator order.** For $\mathbf{x}, \mathbf{x}' \in \{0, 1\}^n$ with $\mathbf{x} \le \mathbf{x}'$ pointwise (every axis matched in $\mathbf{x}$ is matched in $\mathbf{x}'$), $\sigma_{(b, \mathbf{w})}(\mathbf{x}) \le \sigma_{(b, \mathbf{w})}(\mathbf{x}')$ in $\mathcal{V}$, since each summand $w_i (x'_i - x_i) \ge 0$.
- **Affine in the parameters.** Holding $\mathbf{x}$ fixed, $\sigma_{(b, \mathbf{w})}(\mathbf{x})$ is affine-linear in $(b, \mathbf{w})$.
- **A linear functional on the $\mathcal{V}$-module of axes when $b = 0$.** The $b = 0$ case is the genuine $\mathcal{V}$-linear part; the base term is the affine offset.

The threshold-projection adjunction goes in the order-theoretically forced direction. Consider $\mathrm{thresh} : \mathbf{B} \to \mathcal{V}$ embedding each band to its threshold value (with $\mathrm{thresh}(\mathrm{low}) = 0$ per the spec's §2 convention). For any $B \in \mathbf{B}$ and $s \in \mathcal{V}$:

$$\mathrm{thresh}(B) \le s \;\iff\; s \;\text{lies above $B$'s threshold} \;\iff\; B \le \pi(s)$$

— the universal property of "highest band whose threshold does not exceed $s$." This is the standard upper-set / upper-adjoint construction: $\pi$ is the *right* adjoint, $\mathrm{thresh}$ is the *left* adjoint. Per the adjunction, $\mathrm{thresh}$ preserves arbitrary joins (the embedding is join-cofinal on the discrete band poset), and $\pi$ preserves arbitrary meets (in particular $\pi(\min(s_1, s_2)) = \min(\pi(s_1), \pi(s_2))$ on the totally-ordered $\mathcal{V}$). The composite $\pi \circ \sigma$ is monotone because both factors are monotone.

Replay-stability follows from input-determinism: $\sigma$ depends only on $(b, \mathbf{w})$ (the profile cell content) and $\mathbf{x}(\mathrm{call})$ (a deterministic function of the call payload and the axis-pattern declarations). The audit-log cell pins `risk-profile-version` to the exact profile cell-id; re-evaluating $\pi \circ \sigma$ at the same pinned profile against the same payload reproduces score and band byte-identically.

## Inheritance is parameter-vector addition

Per the spec's `risk-profile-extends` discipline, a child profile's effective parameters are

$$(b_{\mathrm{child}},\, \mathbf{w}_{\mathrm{child}}) \;=\; (b_{\mathrm{parent}} + b_{\mathrm{additional}},\; \mathbf{w}_{\mathrm{parent}} \mathbin{\Vert} \mathbf{w}_{\mathrm{additional}}),$$

where $\Vert$ concatenates axis vectors (a profile may add new axes; weights of existing axes add per overlap). On the parameter set $\Theta = [0, \infty) \times \bigoplus_n [0, \infty)^n$ this $\oplus$-operation is associative, commutative, has the trivial profile $(0, \emptyset)$ as unit, and forms a commutative monoid. The map $\Theta \to (\mathcal{V}^{\{0,1\}^*}, +)$ sending $\theta \mapsto \sigma_\theta$ is then a monoid homomorphism into the pointwise-additive function monoid: $\sigma_{\theta \oplus \theta'} = \sigma_\theta + \sigma_{\theta'}$ pointwise on calls.

This is the precise sense in which inheritance composes: not as a quantale homomorphism on calls, but as parameter-monoid addition that pulls back to pointwise function addition in $\mathcal{V}$. The threshold projection $\pi$ does *not* in general distribute over inheritance ($\pi(\sigma_p + \sigma_a) \ne \pi(\sigma_p) + \pi(\sigma_a)$ — band addition is not defined on $\mathbf{B}$); inheritance composes at the score layer, then re-projects. This is structurally why the spec's §6 inheritance is at the axis layer, not at the band layer.

## Engineering consequence

- **Score is structurally additive in axes.** Per the affine-functional claim, the score is fully determined by per-axis contributions plus base; the substrate has no "hidden coordination cost." Per [cost-composition-via-lawvere-quantale](cost-composition-via-lawvere-quantale.md), the same additive Lawvere quantale grounds the substrate's settlement cost; risk and cost share the underlying value-domain.
- **Band-edge inclusivity follows from the right-adjoint construction.** The §2 spec convention "highest threshold whose value $\le$ score" makes lower edges inclusive. Per the adjunction $\mathrm{thresh} \dashv \pi$, this is the upper-adjoint's universal property; the convention is forced by the right-adjoint construction, not a free choice.
- **Pinning gives byte-identical replay.** Per the input-determinism of $\sigma$ and the spec's pinning of `risk-profile-version`, re-evaluating an audit cell reproduces the score and band exactly. Per [cost-discipline-reads-free](cost-discipline-reads-free.md), the re-evaluation is read-only and contributes the cost-quantale's unit; rescoring is free.
- **Federation crosses cleanly.** Per [federation-path-metrics-multiplicative](federation-path-metrics-multiplicative.md), federated audit cells carry the originating peer's `risk-profile-version`; the local substrate re-evaluates $\sigma$ against the peer's profile cell to verify. The score-domain $\mathcal{V}$ and band poset $\mathbf{B}$ are shared across the federation per spec §2.
- **Profile revision is a new homomorphism in the parameter monoid.** A revised profile is a *new* parameter $(b', \mathbf{w}')$; historical audit cells stay pinned to the prior parameters. Two parameter values at the same profile slug are parallel arrows in the monoid, distinguished by `risk-profile-version` — exactly what the spec's "later revisions to the profile do not retroactively re-score historical audit-log cells" requires.
- **Custom intermediate bands extend $\mathbf{B}$ as poset refinement.** A profile that adds bands (per spec §2) refines $\mathbf{B}$ to a longer total order; $\pi$ is replaced by the right-adjoint of the refined embedding. The score $\sigma$ is unchanged.

## What the theorem rules out

- **Negative weights or "discount" axes.** A weight $w_i < 0$ leaves the additive Lawvere quantale (whose carrier is $[0, \infty]$) and breaks monotonicity in the axis-match order. The spec's §2 non-negative-weights discipline is a structural prerequisite, not a stylistic preference.
- **Non-deterministic axis indicators.** An axis indicator drawn from a random source or from external state not pinned in the profile cell breaks $\sigma$'s input-determinism; replay would not be byte-identical. Per `PCC_RISK_SCORE_OUT_OF_RANGE` (spec §8), non-determinism is detectable as a re-derivation mismatch.
- **Band thresholds out of order.** A profile with $\mathrm{thresh}(\mathrm{medium}) > \mathrm{thresh}(\mathrm{high})$ would make $\mathrm{thresh} : \mathbf{B} \to \mathcal{V}$ non-monotone; the right-adjoint $\pi$ would be ill-defined. The spec's §8 `PCS_RISK_PROFILE_INVALID` is the runtime witness of the malformed embedding.
- **Inheritance at the band layer.** Defining "child band = parent band $+$ additional band" is structurally rejected: $\mathbf{B}$ is not a monoid under any natural binary operation that respects threshold ordering. Inheritance must compose at the parameter layer per spec §6, then re-project; the theorem fixes the layering.
- **Capability conflation.** A scoring axis that gates *whether the call runs* would collapse risk into capability; per [graded-dispatch-via-q-enriched-fusion](graded-dispatch-via-q-enriched-fusion.md), capability lives in a $\odot$-fold over the bilattice. Per spec §5, risk and capability are orthogonal layers; this theorem says they live in different mathematical structures (capability in the bilattice, risk as an affine grade in the additive quantale) and may not be conflated without losing replay-stability.

## What the theorem requires

- The substrate's risk-axis weights and base are non-negative reals (the additive Lawvere quantale's carrier).
- Each axis indicator is a deterministic function of the call payload and the profile cell content (so $\sigma$ is a true function, not a random variable).
- The four canonical bands $\{\mathrm{low}, \mathrm{medium}, \mathrm{high}, \mathrm{critical}\}$ are present, totally ordered, and embedded into $\mathcal{V}$ by an order-preserving threshold map (so $\mathrm{thresh} \dashv \pi$ is well-defined).
- The audit-log cell pins `risk-profile-version` (so $\sigma$ is identifiable across time).
- Inheritance is declared via `risk-profile-extends`; the substrate's effective profile is the parameter-monoid sum per §6.

## Position

This theorem grounds the substrate's tool-risk-scoring discipline in the same additive Lawvere-quantale value-domain that already grounds [cost-composition-via-lawvere-quantale](cost-composition-via-lawvere-quantale.md). The substrate's three numeric grading surfaces — settlement cost, dispatch grade, risk score — share the underlying quantale family, but each carries a different categorical structure on top. Cost composition is genuine $+$-fold composition of operation contributions. Dispatch grade per [graded-dispatch-via-q-enriched-fusion](graded-dispatch-via-q-enriched-fusion.md) is a $\mathsf{Q}$-enriched twist-product on the predication fiber algebra. Risk score is an affine functional pulled back through the additive quantale, paired with a Galois right-adjoint to a threshold-embedding into a discrete band poset. The substrate's claim that risk scores are *replay-stable, federation-portable, and inheritable without retroactive change* is structural: it follows from $\sigma$'s input-determinism, the right-adjoint construction's order-theoretic forcing of band assignment, and the parameter monoid's commutativity, plus the spec's pinning of `risk-profile-version`.
