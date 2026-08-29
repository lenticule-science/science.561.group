---

name: fiber-binarity
description: "Fiber Binarity — H_U^H ≅ 2 for every relational universe U; the hyperverse-level fiber algebra has exactly the two elements {⊥,⊤}; strictly stronger than Fiber Booleanness (§modal-collapse) and Nuclear Triviality."
---

### Conjecture — Fiber Binarity {#fiber-binarity}

**Conjecture (Fiber Binarity).** For every relational universe
$\mathbf{U} \in \mathbf{RU}^{(n)}$, the hyperverse-level fiber algebra satisfies:
$$
H_\mathbf{U}^\mathcal{H} \;\cong\; \mathbf{2},
$$
where $\mathbf{2} = \{\bot, \top\}$ is the two-element Boolean algebra.

#### Position in the Collapse Hierarchy {#fiber-binarity-hierarchy}

Fiber Binarity is the strongest of three distinct claims about the hyperverse-level
fiber algebras:

| Claim | Statement | Status |
|---|---|---|
| Nuclear Triviality | $\sigma^\mathcal{H} = \Delta^\mathcal{H} = \mathrm{id}$ | Proved conditional on §decidability-colimit |
| Fiber Booleanness | $\neg\neg a = a$ in every $H_\mathbf{U}^\mathcal{H}$ | Conjecture (§modal-collapse) |
| **Fiber Binarity** | $H_\mathbf{U}^\mathcal{H} \cong \mathbf{2}$ | **Conjecture** (this file) |

The implications are one-directional: Fiber Binarity $\Rightarrow$ Fiber Booleanness
$\Rightarrow$ Nuclear Triviality. None of the converses holds in general.

Nuclear Triviality says every element of $H_\mathbf{U}^\mathcal{H}$ is settled (no
further nucleus action). Fiber Booleanness adds excluded middle: every element either
holds or fails. Fiber Binarity adds that $\bot$ and $\top$ are the only elements — no
intermediate stable proposition survives at the hyperverse level.

#### What Fiber Binarity Means {#fiber-binarity-meaning}

At every finite tower level $n$, the universe fiber $H_\mathbf{U}^{(n)*}$ has
Fibonacci-growing rank: $\dim_K K^{H_\mathbf{U}^{(n)*}} = d_n$ satisfies
$d_{n+1} = d_n + d_{n-1}$ (§nuclear-fibonacci-recurrence, §tower-fiber-seeding).
The fiber has $d_n$ active elements.

Fiber Binarity says this growth reverses at the hyperverse colimit: the infinite
sequence of growing fiber algebras converges to the minimal Boolean algebra
$\mathbf{2}$.

**Interpretation.** From the hyperverse's perspective, every universe-proposition
is decidable and binary — it either holds for $\mathbf{U}$ or it does not, with no
remaining indeterminacy. The Fibonacci-many intermediate stable values present at
finite tower levels are approximation artifacts; at the colimit only $\bot$ and $\top$
survive.

This is the precise formulation of the informal claim: from the hyperverse's
vantage point, every universe evaluates as True or False, even though the universe
itself has richer internal structure (§hyperverse-fixed-universe, §modal-collapse).

#### The Growth-to-Collapse Inversion {#fiber-binarity-inversion}

Fiber Binarity requires a mechanism by which $d_n \to \infty$ at finite levels yet
$d_\infty = 2$. This is not a contradiction in the categorical sense: the colimit of
an increasing sequence of algebras is not the colimit of their underlying sets. The
carrier rank $d_n$ counts stable elements at each finite level; the colimit algebra
$H_\mathbf{U}^\mathcal{H}$ is determined by the morphisms in the diagram, not by
taking a set-theoretic limit of the $d_n$.

**Open question — Growth-to-Collapse Inversion.** What is the mechanism by which
the Fibonacci-growing finite fiber algebras collapse to $\mathbf{2}$ in the colimit?
Specifically: which elements of $H_\mathbf{U}^{(n)*}$ become identified with $\bot$
or $\top$ under the colimit morphisms $H_\mathbf{U}^{(n)*} \to H_\mathbf{U}^\mathcal{H}$?

#### What Fiber Binarity Requires {#fiber-binarity-requires}

**(a) Fiber Booleanness** (§modal-collapse, conditions (a)–(e)): excluded middle holds
in $H_\mathbf{U}^\mathcal{H}$.

**(b) No intermediate stable elements.** Every $a \in H_\mathbf{U}^\mathcal{H}$ with
$\bot < a < \top$ must be absent. Combined with Nuclear Triviality ($\sigma = \Delta =
\mathrm{id}$, so every element is stable), the only elements in
$H_\mathbf{U}^\mathcal{H}$ are $\bot$ and $\top$.

**(c) The growth-to-collapse mechanism.** An account of how $d_n \to \infty$ at finite
levels is compatible with $|H_\mathbf{U}^\mathcal{H}| = 2$ at the colimit. No such
account exists yet.

**Status.** Conjecture. Fiber Booleanness (condition (a)) is already conjecture
(§modal-collapse). The growth-to-collapse mechanism (condition (c)) has no existing
file. The user's claim that Fiber Binarity is proved rather than modeled is not yet
located in the existing unit files.
