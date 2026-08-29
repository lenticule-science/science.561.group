---

name: address-entropy
description: "Definition and conjecture: the address entropy of the nucleus sorter at depth n is S_addr(n) = log|Shuf(T_n)| ~ n·log(φ), where φ is the golden ratio. This is the minimum information required to identify a history position at depth n."
defines: AddressEntropy
---

### Definition — Address Entropy {#address-entropy}

#### Definition {#address-entropy-def}

The **address entropy** at depth $n$ is the Shannon entropy of the uniform distribution
over the set $\mathrm{Shuf}(T_n)$ of distinct shuffle-equivalence classes of histories of
length $n$ in the history monoid $T = \mathbb{M}(\Sigma, I)$ (§history, §commutation):
$$
S_{\mathrm{addr}}(n) \;:=\; \log_2 |\mathrm{Shuf}(T_n)|.
$$

This is the minimum number of bits required to distinguish all fiber positions at depth
$n$. A nucleus sorter $(\sigma_t, \Delta_t)$ operating at a history $t$ of length $n$
must carry an address drawn from a set of size $|\mathrm{Shuf}(T_n)|$.

#### Theorem — Golden Growth {#address-entropy-golden}

**Theorem** (from §golden-stability). For a non-trivial aperiodic history monoid
$(T, I)$, the number of shuffle-equivalence classes at depth $n$ satisfies:
$$
|\mathrm{Shuf}(T_n)| \;\sim\; C \cdot \phi^n,
$$
where $\phi = (1 + \sqrt{5})/2$ is the golden ratio and $C > 0$ is a constant depending
on $(\Sigma, I)$.

**Corollary.** The address entropy grows linearly in depth:
$$
S_{\mathrm{addr}}(n) \;\sim\; n \log_2 \phi \;\approx\; 0.694 \cdot n \;\text{ bits}.
$$

Each additional depth level requires approximately $\log_2 \phi \approx 0.694$ bits more
to identify a fiber position. This is the per-depth cost of position distinguishability
in the history monoid.

#### Interpretation {#address-entropy-interpretation}

The address entropy is not the entropy of a proposition *in* a fiber — it is the entropy
of the *index* locating which fiber. It measures the complexity of the history structure
itself, not the complexity of the algebras sitting over it.

Two consequences:

1. **Cumulative address cost.** The total address entropy carried by a nucleus sorter
   that has visited all fibers up to depth $n$ is:
   $$
   \sum_{k=0}^{n} S_{\mathrm{addr}}(k) \;\sim\; \frac{n^2}{2} \log_2 \phi.
   $$
   This grows quadratically while the total sorting benefit — the sum of
   $\log_2 |H_t|$ over all $t$ with $|t| \leq n$ — grows at most polynomially
   (§nucleus-sorting, §nucleus-sorting-spectral).

2. **Per-fiber rate.** The address entropy per fiber is not uniform: at depth $n$,
   each fiber position carries $\log_2 \phi$ bits more address entropy than the previous
   depth. The golden ratio is the per-depth information rate of the history structure.

#### Relation to Other Entropy Measures {#address-entropy-relation}

The address entropy is the zeroth-order term in a richer entropy decomposition of the
Relational Universe:

- $S_{\mathrm{addr}}(n)$: entropy of history position (this file).
- $S_{\mathrm{fiber}}(t)$: entropy of a proposition drawn uniformly from $H_t$ — the
  fiber entropy. Governed by $|H_t|$, bounded by the Axiom of Finite Generation (§generative-basis).
- $S_{\mathrm{settled}}(t)$: entropy of the settled layer $H_t^*$ — the entropy
  remaining after the nucleus sorter has acted. Governed by $|H_t^*|$.
- $S_{\mathrm{defect}}(t)$: entropy of the unsettled modes — the defect entropy.
  Governed by $M_t(\delta) = \mathrm{Tr}(\delta_t)$ (§spectral-decomposition).

The address entropy dominates all fiber-level terms at large $n$ (quadratic vs.
polynomial cumulative growth), establishing that the cost of *position* in the relational
universe outgrows the benefit of *sorting* within any single position.

**Status.** The golden growth theorem is in §golden-stability; the corollary here follows
directly. The entropy decomposition in §address-entropy-relation is a framework — the
precise definitions of $S_{\mathrm{settled}}$ and $S_{\mathrm{defect}}$ as
sheaf-theoretic entropy measures internal to $R$ remain to be formalized.
