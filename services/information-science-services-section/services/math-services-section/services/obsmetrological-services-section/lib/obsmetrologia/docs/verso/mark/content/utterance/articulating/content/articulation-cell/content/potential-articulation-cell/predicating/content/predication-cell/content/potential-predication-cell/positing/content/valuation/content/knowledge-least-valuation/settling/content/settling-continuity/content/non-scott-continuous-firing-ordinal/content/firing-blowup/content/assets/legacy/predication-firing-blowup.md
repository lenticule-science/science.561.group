---
type: concept
status: stable
class: local-structure
symbol: "\\mathrm{Bl}_\\mu"
depends-on: [non-scott-continuous-firing-ordinal, closure-operator, settling-endofunctor, four-bilattice, predication-cell, d-frame-verdier-composition]
see-also: [blowup-classification, model-singularity, closure-flow-singularity-formation, closure-flow-curvature-regime-correspondence, strong-mld-via-composed-duality]
---

# Firing blowup

The **blowup** of a firing $\mu$ in a settling $v$ is the local structure of the closure flow at $\mu$ — specifically, the morphism that compares the *predecessor value* (what the value was just before $\mu$) with the *actual value* at $\mu$. Trivial firings have identity blowup; non-trivial firings have non-identity blowup, encoding the bilattice "jump" produced by the firing. The [non-Scott-continuous (NSC) firings](non-scott-continuous-firing-ordinal.md) are the special class of non-trivial firings that occur at *limit* ordinals — these are the ones that genuinely violate Scott-continuity. Successor-ordinal firings can also be non-trivial; their blowups capture single-step closure increments.

This makes precise the geometric-flow analogy from [closure-flow-singularity-formation](questions/closure-flow-singularity-formation.md): the closure flow has discrete events (the non-trivial firings) and the blowup is the local model of each event.

## Definitions

### Firing predecessor

Let $v : \kappa \to \mathrm{Val}(\mathcal{C})$ be a settling with closure ordinal $\kappa$, and let $\mu \leq \kappa$ be any non-zero ordinal in the trajectory. The **firing predecessor** $v^{\to\mu}$ at $\mu$ is:

- If $\mu$ is a **successor ordinal** $\mu = \alpha + 1$: $v^{\to\mu} := v_\alpha$ (the immediate predecessor in the trajectory).

- If $\mu$ is a **limit ordinal**: $v^{\to\mu} := \mathrm{colim}_{\sigma < \mu}\, v_\sigma$ — the directed colimit in the category $\mathrm{Val}(\mathcal{C})$ of cell-valuations (computed pointwise: $v^{\to\mu}(c) = \sup_{\sigma < \mu} v_\sigma(c)$ in the [knowledge-order](knowledge-order.md) on $\mathbf{FOUR}$).

Both cases are unified: $v^{\to\mu}$ is "the value the trajectory is approaching from below at $\mu$." For successors, this is just the immediate predecessor; for limits, it is the directed-colimit predecessor.

### Firing morphism

There is a canonical morphism in $\mathrm{Val}(\mathcal{C})$:
$$\iota_\mu \;:\; v^{\to \mu} \;\longrightarrow\; v_\mu,$$

defined cell-wise:
- For successor $\mu = \alpha + 1$: $\iota_\mu(c)$ is the closure-rule increment at cell $c$ from stage $\alpha$ to stage $\mu$.
- For limit $\mu$: $\iota_\mu(c)$ is the unique morphism induced by the colimit cocone $(v_\sigma \to v_\mu)_{\sigma < \mu}$ and the universal property of $v^{\to\mu}$.

In both cases, $\iota_\mu(c) : v^{\to\mu}(c) \to v_\mu(c)$ is a knowledge-order increment in $\mathbf{FOUR}$.

### Trivial vs. non-trivial firings

The firing $\mu$ is:
- **Trivial** iff $\iota_\mu$ is an isomorphism (i.e., $\iota_\mu(c)$ is the identity on every cell). For trivial firings, $v_\mu = v^{\to\mu}$ — the firing is a "no-op" stage of the closure dynamics.
- **Non-trivial** iff $\iota_\mu$ is not an isomorphism — at least one cell $c$ has $v^{\to\mu}(c) \neq v_\mu(c)$.

For limit ordinals, "non-trivial" is exactly the [non-Scott-continuous firing ordinal](non-scott-continuous-firing-ordinal.md) condition. NSC firings are precisely the non-trivial limit-ordinal firings.

For successor ordinals, "non-trivial" means the closure rule applied at that stage genuinely increments at least one cell's value. (Trivial successor firings can occur as bookkeeping stages — e.g., a stage where no rule applies.)

### Firing blowup

The **blowup** of $\mu$ is the firing morphism $\iota_\mu$, considered as an object of the arrow category:
$$\mathrm{Bl}_\mu(v) \;:=\; \bigl(v^{\to\mu} \xrightarrow{\iota_\mu} v_\mu\bigr) \;\in\; \mathrm{Arr}(\mathrm{Val}(\mathcal{C})).$$

Two firings $\mu, \mu'$ in possibly different settlings have **isomorphic blowups** if there exist isomorphisms $v^{\to\mu} \cong v^{\to\mu'}$ and $v_\mu \cong v_{\mu'}$ making the square commute:

$$\begin{array}{ccc} v^{\to\mu} & \xrightarrow{\iota_\mu} & v_\mu \\ \cong \downarrow & & \cong \downarrow \\ v^{\to\mu'} & \xrightarrow{\iota_{\mu'}} & v_{\mu'} \end{array}$$

This is isomorphism in the arrow category $\mathrm{Arr}(\mathrm{Val}(\mathcal{C}))$.

### Model singularity

A **model singularity** is an isomorphism class of non-trivial firing blowups. Equivalently: an isomorphism class of non-iso morphisms in $\mathrm{Val}(\mathcal{C})$ whose source and target differ by a pattern of bilattice-knowledge-order increments.

The set of model singularities (modulo isomorphism in $\mathrm{Arr}(\mathrm{Val}(\mathcal{C}))$) is the **moduli of singularity types** referenced in [closure-flow-singularity-formation](questions/closure-flow-singularity-formation.md).

## The local data of a firing

For each non-trivial firing $\mu$, three pieces of combinatorial data extract from the blowup:

### (1) Incidence pattern $\pi_\mu$

The **incidence pattern** is the set of cells where the firing morphism is non-trivial:
$$\pi_\mu \;:=\; \{c \in \mathcal{C} : \iota_\mu(c) \text{ is not the identity}\}.$$

These are the cells that *acquire new value* at $\mu$. The cardinality $|\pi_\mu|$ measures how "broad" the firing is. Single-cell firings ($|\pi_\mu| = 1$) are the simplest; multi-cell firings can be more complex.

### (2) Firing-type function $\tau_\mu$

For each $c \in \pi_\mu$, the cell-wise **firing type** $\tau_\mu(c) \in \{\mathrm{T}, \mathrm{F}, \top\}$ records the kind of bilattice increment:

| Initial $v^{\to\mu}(c)$ | Final $v_\mu(c)$ | Cell-wise type |
|---|---|---|
| $\bot$ | $\mathbf{t}$ | $\mathrm{T}$ (truth-side firing) |
| $\bot$ | $\mathbf{f}$ | $\mathrm{F}$ (falsity-side firing) |
| $\bot$ | $\top$ | $\top$ (full $\top$-firing) |
| $\mathbf{t}$ | $\top$ | $\top$ (consistency failure from truth-side) |
| $\mathbf{f}$ | $\top$ | $\top$ (consistency failure from falsity-side) |

(The $\bot$ "firing type" doesn't appear in cell-wise increments — $\bot$ is the *initial* state, not a result of firing in the predication-categories closure dynamics.)

The **firing type of $\mu$** (in the strong-MLD sense from [d-frame-verdier-composition](../theorems/d-frame-verdier-composition.md)) is determined by the cell-wise types: $\mu$ is truth-only iff every $c \in \pi_\mu$ has $\tau_\mu(c) = \mathrm{T}$; falsity-only iff every cell-wise type is $\mathrm{F}$; $\top$-firing iff at least one cell-wise type is $\top$.

### (3) Consistency-failure pattern $\gamma_\mu$

For $\top$-firings, the **consistency-failure pattern** records the source of the consistency failure at each cell that becomes $\top$:

$$\gamma_\mu \;:=\; \{(c, s) : c \in \pi_\mu,\; \tau_\mu(c) = \top,\; s = v^{\to\mu}(c) \in \{\bot, \mathbf{t}, \mathbf{f}\}\}.$$

If $s = \bot$: the cell becomes $\top$ from a previously-undefined state — full firing.
If $s = \mathbf{t}$: the cell becomes $\top$ from a previously-true state — falsity-side acquired, consistency failed.
If $s = \mathbf{f}$: the cell becomes $\top$ from a previously-false state — truth-side acquired, consistency failed.

For non-$\top$ firings, $\gamma_\mu = \emptyset$.

## The local structural data is complete

The triple $(\pi_\mu, \tau_\mu, \gamma_\mu)$ — the **local data of $\mu$** — completely determines the blowup $\mathrm{Bl}_\mu(v)$ up to isomorphism in $\mathrm{Arr}(\mathrm{Val}(\mathcal{C}))$. This is the content of the [blowup classification theorem](../theorems/blowup-classification.md).

## Position in predication categories

The firing blowup is the local-structure refinement of the global classifications already in the corpus:

| Classification | Records | Granularity |
|---|---|---|
| [Four-regime dichotomy](four-regime-dichotomy.md) | Total NSC count and cofinality | Global, settling-level |
| [Strong-MLD orbit type](../theorems/strong-mld-via-composed-duality.md) | Firing-type function $\tau$ across all firings | Per-firing (single-cell type) |
| [Equivariant cohomology decomposition](../theorems/equivariant-cohomology-decomposition.md) | $H^1$ ranks per gauge sector | Per-firing (gauge-sector) |
| **Firing blowup** | Local triple $(\pi_\mu, \tau_\mu, \gamma_\mu)$ | Per-firing (full local data) |

Each row refines the previous. The blowup is the finest classification: it records all the local combinatorial structure of each firing — applicable to NSC and successor firings uniformly — from which the coarser classifications can be reconstructed.

The downstream stability question (whether small deformations of $v$ produce small deformations of each $\mathrm{Bl}_\mu$) is addressed by [singularity-type-stability-under-deformation](questions/singularity-type-stability-under-deformation.md), which depends on the deformation theory of [SKHs](skh.md). The blowup classification provides the "fixed-base" data; stability addresses how that data varies under deformation.
