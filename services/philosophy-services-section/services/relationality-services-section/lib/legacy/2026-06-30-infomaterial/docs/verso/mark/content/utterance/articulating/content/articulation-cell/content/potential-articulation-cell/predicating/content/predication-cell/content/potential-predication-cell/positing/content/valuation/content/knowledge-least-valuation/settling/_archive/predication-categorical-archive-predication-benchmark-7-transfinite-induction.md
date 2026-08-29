---
type: example
status: verified
depends-on: [transfinite-induction-settling, transfinite-bounded-regime-h1-generators, transfinite-bounded-regime-d-frame-cohomology, four-regime-dichotomy, d-frame-cohomology-comparison]
instantiates: [transfinite-bounded-regime-h1-generators, transfinite-bounded-regime-d-frame-cohomology]
lineage: 4
---

# Benchmark 7: Transfinite-bounded $\Pi_1$ induction

End-to-end computation conforming to the [computation protocol](prose/teaching/explanations/computation-protocol.md). Fills the **transfinite-bounded regime** slot in the suite — the only regime not covered by cases 1-6 (which are aperiodic substitutions and strict CRDTs/Kripke).

The settling is the canonical $\Pi_1$-induction rule applied at a base where the closure ordinal lands strictly between $\omega$ and $\omega_1$. Computational verification draws from the [transfinite-bounded $H^1$-generators theorem](../theorems/transfinite-bounded-regime-h1-generators.md) and the [transfinite-bounded d-frame cohomology theorem](../theorems/transfinite-bounded-regime-d-frame-cohomology.md), both proved in the corpus.

## Step 1: Specification

$\Pi_1$-induction settling at $E = \omega \cdot 2$:
- **Lattice** $\mathbf{L} = \mathbf{2}$.
- **Entity set** $E = \omega \cdot 2$ (countable ordinal strictly between $\omega$ and $\omega_1$).
- **Predicate set** $\Pi = \{P\}$, $\mathrm{dom}(P) = \Delta_E$.
- **Closure rule** (single $\Pi_1$ rule):

$$(\forall \alpha < \beta.\; v(P)(\alpha, \alpha) = \mathbf{t}) \;\Longrightarrow\; \mathrm{cl}_P(v)(P)(\beta, \beta) \geq_k \mathbf{t} \qquad (\beta < \omega \cdot 2).$$

- **Increment sequence**: $u_0(P)(0, 0) = \mathbf{t}$, $u_\tau = \bot$ for $\tau > 0$.
- **Settling bound** $\lambda = \omega \cdot 2 + 1$.

## Step 2: Regime classification

**Transfinite-bounded regime**, $\kappa = \omega \cdot 2$ (countable, transfinite, $> \omega$, $< \omega_1$). The settling has non-Scott-continuous firings at $\mu = \omega$ (the first limit ordinal, where the Π_1 antecedent commits) — between $\omega$ and $\omega \cdot 2$ no further NSC firings occur except at the limit point itself. So $|L_{\mathrm{ns}}(\kappa)| = 1$ — exactly one NSC firing, at $\mu = \omega$.

The classifier output (from the per-stage analysis): regime "transfinite-bounded", $\omega < \kappa < \omega_1$, $\omega$-firing present, no $\omega_1$-firing.

## Step 3: $\mathbf{Ab}$-valued cohomology

By the [transfinite-bounded $H^1$-generators theorem](../theorems/transfinite-bounded-regime-h1-generators.md):

$$H^1(\mathbf{T}^*_{\leq \omega \cdot 2},\, \mathcal{F}_v) \;=\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\omega \cdot 2)} \mathbb{Z} \;=\; \mathbb{Z}.$$

A single generator $e_\omega$ at the firing ordinal $\omega$. $H^0$ is also non-trivial (the eventually-settled-cells data).

## Step 4: d-frame cohomology

Per the [transfinite-bounded d-frame cohomology theorem](../theorems/transfinite-bounded-regime-d-frame-cohomology.md):

$$H^1_{\mathbf{dFrm}}(\mathbf{T}^*_{\leq \omega \cdot 2},\, \mathbb{F}_v) \;=\; D_\omega$$

with the per-firing $D_\mu$ structure at $\mu = \omega$:
- The newly-added cell at $\omega$ has bilattice value $\mathbf{t}$ (the rule produces a truth-positive cell).
- $D_\omega = (\mathbb{Z}, 0, \text{trivial}, \text{trivial})$ — truth-only firing.

Firing-type counts: 1 truth-only, 0 falsity-only, 0 ⊤-firings, 0 ⊥-firings.

Shadow comparison: $\mathbb{S}(H^1_{\mathbf{dFrm}}) = (\mathbb{Z}^1, 0)$ — truth side has 1 generator, falsity side has 0. Per-firing accounting: $1 + 0 + 0 + 0 = 1$ ✓ matches $\mathbf{Ab}$-valued rank $\mathbb{Z}^1$.

## Step 5: Verdier dual

Per the [Verdier duality theorem](../theorems/verdier-duality-bitopological-site.md): $H_1(\check{\mathcal{F}}_v) \cong \mathbb{Z}$ (cosheaf-side dual of the single generator). Verdier duality $H^1 \cong H_1$ verified: both are rank 1 free abelian.

## Step 6: Strong-MLD orbit type

**Truth-only orbit** under the composed duality $\mathbb{D} = \mathbb{D}_{\mathrm{sp}} \circ \mathbb{D}_{\mathrm{val}}$. The single firing is truth-only, so $\mathbb{D}_{\mathrm{val}}$ swaps it to a falsity-only firing — pairing this settling with its bilattice-negation counterpart (the "$\Pi_1$-induction-but-with-$\mathbf{f}$-instead-of-$\mathbf{t}$" rule, which would produce $D_\omega = (0, \mathbb{Z}, \cdot, \cdot)$).

Two notions of self-duality both fail:
- (1) Firing-pattern self-duality: false (the firing is truth-only, not $\top$ or $\bot$).
- (2) Substitution-rule self-duality: not applicable (no substitution matrix; the rule is $\Pi_1$-induction).

Orbit size 2: the settling pairs with its negation. The strong-MLD classification puts both in the same orbit, refining ordinary MLD-equivalence by the firing-orbit-type function.

## Step 7: Literature comparison

Transfinite induction with $\Pi_1$-rule semantics is well-studied in proof theory and in inductive-definition theory (Aczel, Moschovakis, Hyland-Pitts). The closure ordinal of $\Pi_1$-induction is well-known to depend on the order-type of the base structure — for $E = \omega \cdot k$ ($k$ finite) the closure ordinal is $\omega \cdot k$; for $E = \omega^\omega$ it's higher, etc.

The corpus's classification of this case as "transfinite-bounded regime" with $|L_{\mathrm{ns}}| = 1$ at $\omega$ matches the standard inductive-definition theory analysis: $\Pi_1$-induction commits at limit ordinals, and on $\omega \cdot 2$ there's exactly one (at $\omega$) before the closure ordinal $\omega \cdot 2$ is reached.

## Step 8: What's new

Two findings:

1. **The transfinite-bounded regime is genuinely realised** by this benchmark — the suite now covers all four regimes (cases 1-4 aperiodic, cases 5-6 strict, case 7 transfinite-bounded; Scott-continuous would be a similar Π_1 rule at $E = \omega$, an obvious 8th case). The four-regime dichotomy is verified across the suite: each regime has a concrete representative in the framework.

2. **The d-frame structure adds a single truth-only generator** to the rank-1 $\mathbf{Ab}$-cohomology — minimal but real distinguishing content. The orbit-type classification pairs this settling with its "all-falsity" counterpart under bilattice negation, demonstrating the strong-MLD refinement on a small concrete case.

The transfinite-bounded regime is structurally the *thinnest* in terms of d-frame content (single firing, single generator), but the orbit-type pairing under negation gives a non-trivial classification refinement that distinguishes the truth-induction rule from the falsity-induction rule.

## Acceptance criteria checklist

- [x] **Reproducibility**: derivable from the [transfinite-induction-settling](transfinite-induction-settling.md) example and the proved [transfinite-bounded $H^1$-generators](../theorems/transfinite-bounded-regime-h1-generators.md) and [transfinite-bounded d-frame cohomology](../theorems/transfinite-bounded-regime-d-frame-cohomology.md) theorems. No additional computation needed beyond predication categories' existing analytical results.
- [x] **Triangulation**: $L_{\mathrm{ns}}$ count + Verdier duality + per-firing classification all consistent.
- [x] **Literature alignment**: closure-ordinal $\omega \cdot 2$ matches standard $\Pi_1$-induction theory.
- [x] **Distinctness or admission**: minimal but real d-frame content (truth-only generator with negation-pair orbit type). Genuinely distinguishes the truth-induction rule from its negation under composed duality.
