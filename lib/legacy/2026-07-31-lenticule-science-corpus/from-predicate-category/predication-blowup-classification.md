---
type: theorem
status: proved
depends-on: [firing-blowup, non-scott-continuous-firing-ordinal, d-frame-verdier-composition, strong-mld-via-composed-duality, four-bilattice, predication-cell, settling-endofunctor]
see-also: [firing-blowup, closure-flow-singularity-formation, closure-flow-curvature-regime-correspondence, equivariant-cohomology-decomposition, strict-regime-top-firing-blowup]
---

# Blowup classification

The local structure of every non-trivial firing — the [firing blowup](teaching/explanations/firing-blowup.md) — is completely determined by a finite triple of combinatorial data: the incidence pattern (which cells fire), the firing-type function (how each cell increments in the bilattice), and the consistency-failure pattern (the source state for $\top$-firings). This gives a finite classification of "model singularities" of the closure flow, applying to both NSC firings (limit ordinals) and non-trivial successor firings.

## Statement

**Theorem (blowup classification).** *Let $v$ be a predication settling with closure ordinal $\kappa$, and let $\mu \leq \kappa$ be a non-trivial firing ordinal (limit-ordinal NSC firing or successor-ordinal non-trivial firing). Then:*

1. *(Local data is complete.) The blowup $\mathrm{Bl}_\mu(v)$ is determined up to canonical isomorphism in $\mathrm{Arr}(\mathrm{Val}(\mathcal{C}))$ by the local triple $(\pi_\mu, \tau_\mu, \gamma_\mu)$.*

2. *(Finite model class.) Fix a finite incidence pattern $\pi$ (i.e., a finite set of cells). The set of isomorphism classes of non-trivial blowups with incidence pattern $\pi$ is finite, with cardinality bounded by:*
$$|\mathrm{Mod}(\pi)| \;\leq\; 5^{|\pi|}.$$

   *(There are at most 5 cell-wise increment types per cell: $\bot \to \mathbf{t}$, $\bot \to \mathbf{f}$, $\bot \to \top$, $\mathbf{t} \to \top$, $\mathbf{f} \to \top$. Hence the bound $5^{|\pi|}$. The actual count may be smaller because not all combinations are realizable in a settling — bilattice-axiom and closure-rule constraints rule some out.)*

3. *(Refinement of strong-MLD.) The blowup classification refines the [strong-MLD orbit type](../theorems/strong-mld-via-composed-duality.md) (defined for NSC firings): for NSC firings $\mu, \mu'$ with isomorphic blowups, the strong-MLD orbit types agree; firings with the same orbit type can have non-isomorphic blowups (differing in incidence pattern or consistency-failure pattern).*

4. *(Refinement of equivariant cohomology sector.) The blowup classification refines the [equivariant cohomology gauge sector](equivariant-cohomology-decomposition.md): each NSC firing's gauge sector is determined by its local triple, but firings in the same gauge sector can have non-isomorphic blowups.*

5. *(Single-cell firings — atomic case.) For incidence pattern $\pi = \{c\}$ (single-cell firing), there are exactly 5 isomorphism classes of non-trivial blowups, corresponding to the 5 possible cell-wise increments. These are the "atomic" model singularities — every multi-cell non-trivial firing decomposes cell-wise into these 5 atomic types.*

## Proof

### Part 1: local data is complete

Let $\mu, \mu'$ be non-trivial firings with the same local triple $(\pi_\mu, \tau_\mu, \gamma_\mu) = (\pi_{\mu'}, \tau_{\mu'}, \gamma_{\mu'})$. We construct an isomorphism $\mathrm{Bl}_\mu \cong \mathrm{Bl}_{\mu'}$ in $\mathrm{Arr}(\mathrm{Val}(\mathcal{C}))$.

The blowup $\mathrm{Bl}_\mu(v) = (\iota_\mu : v^{\to\mu} \to v_\mu)$ has, as a morphism in $\mathrm{Val}(\mathcal{C})$, the cell-wise data $\iota_\mu(c)$ for each $c \in \mathcal{C}$. The isomorphism class of this morphism in $\mathrm{Arr}(\mathrm{Val}(\mathcal{C}))$ is determined by:
- The set of cells where $\iota_\mu(c)$ is non-identity: $\pi_\mu$.
- For each $c \in \pi_\mu$: the source and target values, $(v^{\to\mu}(c), v_\mu(c))$.

The first datum is exactly $\pi_\mu$. The second is the pair $(\gamma_\mu(c), \tau_\mu(c))$ for each $c \in \pi_\mu$ (where $\gamma$ records source, $\tau$ records target type — encoded as one of the 5 cell-wise increment types). So the local triple completely determines the morphism's isomorphism class. The cells outside $\pi_\mu$ contribute identity morphisms in both blowups, which match canonically. $\square$ (Part 1)

### Part 2: finite model class

For a fixed incidence pattern $\pi$ of cardinality $|\pi|$, the cell-wise increment data ranges over the 5 possible non-trivial bilattice increments:
$$\mathcal{I}_\mathrm{cell} \;:=\; \{(\bot, \mathbf{t}), (\bot, \mathbf{f}), (\bot, \top), (\mathbf{t}, \top), (\mathbf{f}, \top)\}.$$

Each cell $c \in \pi$ independently chooses one of these 5 increments. The total number of cell-wise assignments is $5^{|\pi|}$, giving the bound. The actual count $|\mathrm{Mod}(\pi)|$ may be less due to constraints. $\square$ (Part 2)

### Part 3: refinement of strong-MLD

The [strong-MLD orbit type](../theorems/strong-mld-via-composed-duality.md) of an NSC firing $\mu$ is determined by the firing-type function $\tau_\mu$: orbit type "truth-only" iff every $\tau_\mu(c) = \mathrm{T}$ for $c \in \pi_\mu$; orbit type "$\top$" iff at least one $\tau_\mu(c) = \top$; etc.

Two NSC firings with isomorphic blowups have the same triple $(\pi, \tau, \gamma)$ (up to relabeling), so the same orbit type.

Conversely, two NSC firings can share an orbit type (say, both "$\top$-firings") but differ in:
- Incidence pattern size: $|\pi_\mu| = 1$ vs. $|\pi_{\mu'}| = 3$ (single-cell vs. three-cell $\top$-firing).
- Consistency-failure pattern: $\gamma_\mu = \{(c, \bot)\}$ vs. $\gamma_{\mu'} = \{(c, \mathbf{t})\}$ (full $\top$-firing vs. consistency-failure-from-truth-side).

So the blowup is strictly finer than the orbit type. $\square$ (Part 3)

### Part 4: refinement of gauge sector

By [equivariant cohomology decomposition](equivariant-cohomology-decomposition.md), the gauge sector of an NSC firing $\mu$ is determined by the firing-type function modulo the $K_4$ action on $\mathbf{FOUR}$. The gauge sector is a coarsening of the firing-type function (which is a coarsening of the local triple), so the blowup refines the gauge sector. $\square$ (Part 4)

### Part 5: single-cell atomic case

For $|\pi_\mu| = 1$, the local data reduces to a single cell-wise increment, giving 5 atomic blowup types:

| Atom | Source | Target | Strong-MLD type (NSC case) | Gauge sector (NSC case) |
|---|---|---|---|---|
| $\mathrm{T}_\bot$ | $\bot$ | $\mathbf{t}$ | Truth-only | $\chi_\sim$ |
| $\mathrm{F}_\bot$ | $\bot$ | $\mathbf{f}$ | Falsity-only | $\chi_\sim$ |
| $\top_\bot$ | $\bot$ | $\top$ | $\top$-firing (full) | $\chi_-$ |
| $\top_\mathbf{t}$ | $\mathbf{t}$ | $\top$ | $\top$-firing (from-truth) | $\chi_{\sim\circ-}$ |
| $\top_\mathbf{f}$ | $\mathbf{f}$ | $\top$ | $\top$-firing (from-falsity) | $\chi_{\sim\circ-}$ |

(The strong-MLD type and gauge sector columns are defined for NSC firings; for non-trivial successor firings the same atomic-type assignment applies but the strong-MLD/gauge interpretations specialize to the trivial cases.)

Every multi-cell non-trivial firing is a *product* of these atomic blowups, indexed by the incidence pattern. The blowup classification thus reduces to: (i) specify the incidence pattern, (ii) for each cell in the pattern, specify which of the 5 atomic types occurs.

This is a complete, finite classification at fixed incidence pattern size. $\square$ (Part 5) $\blacksquare$

## What the classification gives

**Finite singularity-type taxonomy.** The closure flow has finitely many "model singularities" (per fixed incidence pattern size). This is the corpus's analog of the finite list of model singularities in Ricci flow (cylindrical, neckpinch, type-I) — except the corpus's list is more elementary (just bilattice increments) and exhaustively classified.

**Per-firing local invariant.** Each non-trivial firing $\mu$ now has a complete local invariant — the local triple $(\pi_\mu, \tau_\mu, \gamma_\mu)$. This is the finest per-firing data available, refining all coarser classifications (strong-MLD, gauge sector, four-regime).

**Atom-of-curvature interpretation.** In the [curvature-regime correspondence](closure-flow-curvature-regime-correspondence.md) language, NSC firings are the "curvature events" of the closure flow. The blowup classification identifies the **atomic curvature types**: each curvature event decomposes into a multiset of 5 elementary atoms. This is the corpus's discrete analog of "Ricci tensor decomposition" — the curvature has irreducible components, and each NSC firing is a finite combination of those components.

**Connection to deformation theory.** The blowup is the "fixed-base" data for the open question [singularity-type-stability-under-deformation](questions/singularity-type-stability-under-deformation.md). Stability would assert that small deformations of $v$ produce small deformations of each $\mathrm{Bl}_\mu(v)$ — i.e., the local triple varies semicontinuously under deformation. With the local triple in hand as a discrete invariant, "small deformation" can now be made precise (e.g., locally constant in some sense), and stability becomes a tractable question.

## Concrete example

The [strict-regime ⊤-firing example](../examples/strict-regime-top-firing-blowup.md) works out the blowup explicitly for a single non-trivial $\top$-firing on a 2-stage settling, illustrating:
- Incidence pattern: $\pi = \{c_0\}$ (single cell).
- Firing type: $\tau(c_0) = \top$.
- Consistency-failure pattern: $\gamma(c_0) = \mathbf{t}$ (cell becomes $\top$ from a previously-true state).

This identifies the blowup as the atomic type $\top_\mathbf{t}$ — a $\top$-firing arising from consistency failure on the truth-side. (The example is at a successor ordinal in the strict regime, illustrating that the blowup machinery applies uniformly to non-NSC successor firings as well as to true NSC firings.)
