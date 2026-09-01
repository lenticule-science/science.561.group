---
type: theorem
class: cohomology-bound
status: sketch
depends-on: [inconsistency-sheaf, paraconsistent-settling-associated-sheaf, bigraded-settling-cohomology, d-frame-h1-generator-at-nsc-firing, transfinite-bounded-regime-h1-generators, non-scott-continuous-firing-ordinal, four-regime-dichotomy]
see-also: [aperiodic-regime-cohomology-via-direct-limit, scott-continuous-regime-cohomology-vanishing, strict-regime-cohomology-vanishing]
---

# H¹ rank bound via witnessed step ordinals

**Claim.** Let $v = (v_\tau)_{\tau \le \kappa}$ be a predication settling and, for each clopen $U$ in the bitopological settling site, let

$$T_U(v) \;:=\; \{\tau < \kappa \;:\; \mathcal{F}^{(\top)}_v(q, \tau, U) \neq 0 \text{ for some predicate } q\}$$

be the set of step ordinals at which the [inconsistency sheaf](../objects/inconsistency-sheaf.md) $\mathcal{F}^{(\top)}_v$ acquires a fresh $\top$-cell whose carrier lies in $U$. Then

$$\dim_{\mathbb{Z}} H^1(U, \mathcal{F}^{(\top)}_v) \;\le\; |\,T_U(v)\,|.$$

Equality holds when the settling lies in the [transfinite-bounded regime](four-regime-dichotomy.md) and every $\tau \in T_U(v)$ is a non-Scott-continuous firing ordinal contributing a single $\top$-firing on each evidence side, with the firing's carrier cell lying in $U$. In the strict and Scott-continuous regimes, $T_U(v) = \emptyset$ on consistent settlings and the bound is the trivial vacuous statement $0 \le 0$; in the aperiodic regime, equality holds for each countable truncation, and the rank of the colimit $H^1$ is the supremum of the truncation ranks per [aperiodic-regime-cohomology-via-direct-limit](aperiodic-regime-cohomology-via-direct-limit.md).

The bound provides the math justification for the operational $H^1$-enumeration discipline used by the substrate's audit machinery, which reads $|H^1|$ off the count of distinct step ordinals carrying a witness.

## Why this holds

**Part 1 — at most one cohomology contribution per witnessed ordinal.** Per [d-frame-h1-generator-at-nsc-firing](d-frame-h1-generator-at-nsc-firing.md), at each non-Scott-continuous firing ordinal $\mu$, exactly one new cell is designated on each evidence side, and a single $H^1$-generator $D_\mu$ records the firing on the d-frame side; the abelian shadows on the truth-positive and falsity-positive sides of $\mathcal{F}^{(\top)}_v$ each contribute at most one $\mathbb{Z}$-rank to $H^1$. Aggregating the contributions across all firings of stage $\tau$ whose carrier lies in $U$:

- If $\tau \in T_U(v)$ but $\tau$ is *Scott-continuous* (a successor or directed-sup-respecting limit), the firings at $\tau$ are derivable from earlier-stage cochains and contribute coboundaries only — they add no $H^1$-rank.
- If $\tau \in T_U(v)$ and $\tau$ is non-Scott-continuous, the firings at $\tau$ contribute up to two $\mathbb{Z}$-generators (truth-side, falsity-side) — but only the *new* cells (not previously cohomologous to anything earlier) survive in $H^1$. A composite ($\top$) firing collapses the two sides to a single $\mathbb{Z}^2$-block at the d-frame level and a $\mathbb{Z}$-block at each abelian shadow.

In all cases, the contribution per $\tau \in T_U(v)$ to the rank of $H^1(U, \mathcal{F}^{(\top)}_v)$ is at most 1 in the abelian-shadow projection. Aggregating over $\tau \in T_U(v)$ gives $\dim H^1(U, \mathcal{F}^{(\top)}_v) \le |T_U(v)|$.

**Part 2 — equality in the transfinite-bounded regime under the per-firing simple-cell hypothesis.** Per [transfinite-bounded-regime-h1-generators](transfinite-bounded-regime-h1-generators.md), in the transfinite-bounded regime the $H^1$-generators are exactly the firing-ordinal contributions, indexed by the NSC ordinals below the closure ordinal $\kappa$. Under the dev-side hypothesis "each step ordinal carries at most one fresh contradiction", every $\tau \in T_U(v)$ is an NSC firing producing exactly one new $\top$-cell with carrier in $U$, and the bound is saturated: $\dim H^1(U, \mathcal{F}^{(\top)}_v) = |T_U(v)|$.

**Part 3 — the bound is tight in the aperiodic regime per truncation.** Per [aperiodic-regime-cohomology-via-direct-limit](aperiodic-regime-cohomology-via-direct-limit.md), the aperiodic-regime cohomology is computed as the direct limit over countable truncations $v_n = v|_{\tau \le n}$. Each truncation is transfinite-bounded; Part 2 applies. The colimit's rank is $\sup_n |T_U(v_n)|$, which equals $|T_U(v)|$ since the witnessed-ordinal sets exhaust under truncation.

**Part 4 — vanishing in the strict and Scott-continuous regimes.** Per [strict-regime-cohomology-vanishing](strict-regime-cohomology-vanishing.md) and [scott-continuous-regime-cohomology-vanishing](scott-continuous-regime-cohomology-vanishing.md), in these regimes $H^1$ vanishes structurally and on consistent settlings $\mathcal{F}^{(\top)}_v = 0$. The bound's left and right sides are both 0; the inequality is vacuous.

## Why the inequality can be strict

The bound is not always an equality. Failure modes that make it strict:

- **Multiple $\top$-cells at one ordinal.** If two distinct cells in $U$ acquire $\top$ at the same step ordinal $\tau$ (e.g., two compose-time joins fire in one layer), $\tau$ contributes one element to $T_U(v)$ but up to two abelian-shadow generators (truth-side and falsity-side) and up to four d-frame-level generators (each $(s, p, o)$-pair on each side). The substrate's "step-ordinal" count under-reports.
- **Cohomologically equivalent firings at distinct ordinals.** If two ordinals $\tau_1 < \tau_2$ both lie in $T_U(v)$ but the second's firing cell is cohomologous (in the d-frame sense) to a coboundary of the first's, $|T_U(v)|$ counts both but $H^1$ only the first.
- **Composite ($\top$) firings on a single side.** If $\tau$ is a composite firing at which both sides acquire content simultaneously, the d-frame generator $D_\tau$ has a non-trivial consistency relation. The d-frame-level generator counts as one in $H^1_{\mathbf{dFrm}}$; the abelian shadow projection sees a contribution to both the truth-positive and falsity-positive sides, so a $\dim$-of-direct-sum reading reports rank 2 contribution at $\tau$ while $|\{\tau\}| = 1$. This makes the bound (which is over the direct-sum-projected $H^1$) potentially loose at composite firings.

The substrate's audit machinery can therefore use the witnessed-ordinal count as a *cheap upper bound* on the true cohomological complexity in the abelian-shadow direction; refinement is available by inspecting the witness records' kind / side fields. The bound's *direction* in the abelian-shadow projection is robust under the per-firing simple-cell hypothesis (Part 2); the regime / firing-side hypotheses are what make the bound an equality versus a strict inequality, and `status: sketch` reflects that the precise hypotheses on $U$, on the firing-cell-in-$U$ relation, and on the composite-firing case are stated at the proof-sketch level.

## What this rules out

- **An audit client claiming $\dim H^1(U, \mathcal{F}^{(\top)}_v) > |T_U(v)|$ in the abelian-shadow projection.** Per the bound, this is impossible. Such a client has miscounted (perhaps by counting cells rather than ordinals, or by including coboundary contributions twice).
- **A substrate that compacts the witness catalogue by collapsing distinct ordinals.** Compacting two distinct $\tau_1, \tau_2 \in T_U(v)$ into a single record loses the upper-bound information; the substrate's $H^1$ can no longer be enumerated by its witnesses alone.
- **A substrate that assumes equality without verifying the per-firing simple-cell hypothesis.** A substrate that uses $\dim H^1 = |T_U(v)|$ as a normative invariant, rather than as a cheap-upper-bound estimator, can over- or under-report cohomology when the regime admits composite firings or coboundary-equivalent firings at distinct ordinals.

## What this requires

- The settling lies in one of the four regimes per the [four-regime dichotomy](four-regime-dichotomy.md).
- The witness catalogue records each $\top$-firing's step ordinal in `step-ordinal` per the [witness](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/objects/witness.md) invariants on the engineering side.
- The bitopological settling site's clopen $U$ over which the bound is taken is well-defined per the [bitopological-settling-site](../objects/bitopological-settling-site.md) construction.

## Position

This theorem is the cohomological foundation underneath the substrate's `query_inconsistency_cohomology` `$H^1$ generators` operationalisation: the dev spec defines the $H^1$-generator output as "the distinct step_ord values at which a witness was recorded," which corresponds to $T_U(v)$ for the queried region $U$. The theorem shows this is a valid upper bound on $\dim H^1$ and a tight bound under the regime-and-firing hypotheses the substrate's audit-discipline imposes. It composes with [d-frame-h1-generator-at-nsc-firing](d-frame-h1-generator-at-nsc-firing.md) (per-firing generator structure), [transfinite-bounded-regime-h1-generators](transfinite-bounded-regime-h1-generators.md) (regime-side equality), and [aperiodic-regime-cohomology-via-direct-limit](aperiodic-regime-cohomology-via-direct-limit.md) (colimit treatment). The engineering consequence is recorded directly in the substrate's `query_inconsistency_cohomology` interface and surfaces in [audit-content-via-inconsistency-sheaf-cohomology](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology.md).
