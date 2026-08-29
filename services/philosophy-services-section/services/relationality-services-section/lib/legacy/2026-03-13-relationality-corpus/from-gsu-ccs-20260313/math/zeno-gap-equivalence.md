---

name: zeno-gap-equivalence
description: "three conditions are equivalent — H^1_tower(k) nonzero for all k (Zeno gap), witnessing function nu is unbounded (non-uniform convergence), and new formulas appear at every tower level. Separately: H^1(H) = 0 is equivalent to decidability-colimit. These are different conditions, and both can hold simultaneously."
---

### Theorem — Zeno Gap Equivalence {#zeno-gap-equivalence}

The Zeno Settling Conjecture (§zeno-settling), the unboundedness of the witnessing
function (§pointwise-uniform-convergence), and non-uniform convergence of the tower
are not separate claims — they are equivalent. This theorem makes the equivalences
precise and separates them from the related (but different) question of the full
hyperverse cohomology $H^1(\mathcal{H})$.

#### The First Equivalence: Gap ↔ Unbounded Witnessing {#zeno-gap-first}

**Theorem.** The following are equivalent:

**(Z1) Zeno Gap.** $H^1_{\mathrm{tower}}(k) \neq 0$ for all $k \geq 0$ — there are
new stable universe-propositions first appearing at every tower level.

**(Z2) Unbounded Witnessing.** The witnessing function $\nu: \text{HyperversalNuclearLanguage}
\to \mathbb{N}$ (§pointwise-uniform-convergence) is unbounded: for every $N \geq 0$,
there exists $\phi$ in HyperversalNuclearLanguage with $\nu(\phi) > N$.

**(Z3) Non-Uniform Convergence.** There is no single $N$ such that every formula of
HyperversalNuclearLanguage stabilizes by level $N$: $\sup_\phi \nu(\phi) = \infty$.

**Proof of equivalence.** (Z2) and (Z3) are equivalent by definition: $\nu$ is
unbounded iff its supremum is infinite. For (Z1) $\Leftrightarrow$ (Z2): a nonzero
class in $H^1_{\mathrm{tower}}(k)$ corresponds, via the connecting homomorphism
$\widetilde{\partial}_k$ (§hyperverse-step-cohomology), to a stable universe-proposition
first appearing at tower level $k+1$ — a formula with $\nu(\phi) = k+1$. Therefore:

- (Z1) holds iff for every $k$ there is a formula with $\nu(\phi) = k+1$, i.e., $\nu$
  takes the value $k+1$ for some formula.
- This is equivalent to: $\nu$ takes arbitrarily large values, i.e., $\nu$ is unbounded.
- That is (Z2). $\square$

#### The Second Equivalence: Permanent Gap ↔ Decidability Failure {#zeno-gap-second}

**Theorem.** The following are equivalent:

**(P1) Permanent Obstruction.** $H^1(\mathcal{H}, E_0^\mathcal{H}) \neq 0$ — some
cohomology class persists to the hyperverse colimit.

**(P2) Decidability Failure.** The Decidability Colimit Conjecture fails: there exists
$\phi$ in HyperversalNuclearLanguage with $\mathcal{H} \models \phi$ but $\nu(\phi) = \infty$
— the formula is true in $\mathcal{H}$ but has no finite tower witness.

**Proof.** By §hyperverse-step-cohomology:
$$
H^1(\mathcal{H},\, E_0^\mathcal{H}) \;\cong\; \varinjlim_k\, H^1_{\mathrm{tower}}(k).
$$
A class in the colimit is the image of a class in $H^1_{\mathrm{tower}}(k)$ for some
$k$ that does not become zero in any $H^1_{\mathrm{tower}}(k')$ for $k' > k$. Such a
persistent class is a stable universe-proposition that has no finite witness level —
it is "true in $\mathcal{H}$" (it is a global section of $E_0^\mathcal{H}$) but is not
the restriction of any section from any finite level $R^{(k)}$. This is precisely (P2). $\square$

**Corollary.** The Decidability Colimit Conjecture (§decidability-colimit) holds iff
$H^1(\mathcal{H}) = 0$.

#### The Two Conditions Are Independent {#zeno-gap-independence}

(Z1)/(Z2)/(Z3) and (P1)/(P2) are logically independent. Both the Zeno gap and the
decidability colimit can hold simultaneously:

| Scenario | Zeno Gap (Z1) | Decidability Colimit ($\neg$P2) |
|---|---|---|
| **Expected** | $H^1_\text{tower}(k) \neq 0$ for all $k$ — new formulas at every level | $H^1(\mathcal{H}) = 0$ — every formula has a finite witness |
| **Z1 fails** | Tower stabilizes at some finite $K$ — impossible under §step-cohomology-decay | — |
| **P1 holds** | — | Some formula has no finite witness — decidability fails |

The expected scenario (Z1 holds, $H^1(\mathcal{H}) = 0$): new classes appear at every
level but each individual class eventually dies in the colimit. This is pointwise
convergence: every formula stabilizes, but the LEVEL at which it stabilizes is unbounded.
This is the content of §pointwise-uniform-convergence.

Precisely: (Z1) asserts $H^1_\text{tower}(k) \neq 0$ for all $k$ (ν is unbounded).
$H^1(\mathcal{H}) = 0$ asserts every class in $H^1_\text{tower}(k)$ eventually dies
(ν is everywhere finite). These can hold simultaneously — unbounded but pointwise finite.

#### The Zeno Conjecture Reformulated {#zeno-gap-reformulation}

The Zeno Settling Conjecture (§zeno-settling) can now be stated in three equivalent forms:

1. **Cohomological.** $H^1_{\mathrm{tower}}(k) \neq 0$ for all $k \geq 0$.
2. **Function-theoretic.** The witnessing function $\nu$ is unbounded.
3. **Convergence-theoretic.** The tower $R^{(0)} \hookrightarrow R^{(1)} \hookrightarrow
   \cdots$ does not uniformly converge to $\mathcal{H}$: no single finite prefix settles
   all formulas simultaneously.

The Zeno identity (§zeno-phi-identity) $\sum_{k=1}^\infty \varphi^{-k} = \varphi$
quantifies (2): under §golden-stability, the density of formulas with $\nu(\phi) = k$
decays as $\varphi^{-k}$, and the total density sums to $\varphi$.

**Status.** All three forms of the Zeno Settling Conjecture are equivalent — proved
above. The conjecture itself (that they hold) depends on §golden-stability (for the
quantitative form) or on an explicit construction of formulas with unbounded witness
depth (for the existential form). The permanence question — whether $H^1(\mathcal{H})
\neq 0$ (P1) — remains separate and is equivalent to decidability failure.
