---
kind: theorem
status: sketch
depends-on: [aperiodic-classifying-invariant, mutually-locally-derivable, settling-morphism, settling-cohomology, settling-associated-sheaf, anderson-putnam-direct-limit, fibered-coinduction, four-regime-dichotomy, closure-2-monad-lax-idempotence]
---

# Aperiodic-regime classification

Let $v, v'$ be [aperiodic-regime](four-regime-dichotomy.md) [knowledge presheaves](../objects/spatiotemporal-knowledge-presheaf.md) over a common base $(\mathbf{L}, \mathcal{C}, E, \lambda)$ with $|E| \geq \omega_1$ and closure ordinals $\kappa, \kappa' \leq \omega_1$. Then

$$v \sim_{\mathrm{MLD}} v' \;\iff\; \mathrm{cl}\text{-}\mathrm{inv}(v) \,=\, \mathrm{cl}\text{-}\mathrm{inv}(v') \;\text{ in } H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U^{\mathrm{univ}}),$$

where $\mathcal{F}_U^{\mathrm{univ}} := \mathcal{F}_U \oplus \mathcal{F}_{U'}$ is the universal [settling-associated sheaf](../objects/settling-associated-sheaf.md) on $\mathbf{T}^*_{\leq \omega_1}$ taken as ambient for the joint comparison, and $\sim_{\mathrm{MLD}}$ is [mutually-locally-derivable](../concepts/mutually-locally-derivable.md) equivalence.

## Proof

**Step 1 — direct-limit computation.** [Settling cohomology](../objects/settling-cohomology.md) at $\omega_1$ is the direct limit of bounded cohomologies:

$$H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U^{\mathrm{univ}}) \;=\; \varinjlim_{\tau < \omega_1} H^1(\mathbf{T}^*_{\leq \tau}, \mathcal{F}_U^{\mathrm{univ}}),$$

with directed-system transitions induced by [settling-morphisms](../morphisms/settling-morphism.md) $v|_{[0, \tau]} \hookrightarrow v|_{[0, \tau+1]}$ and their limit analogues. This is the [Anderson–Putnam direct-limit](../objects/anderson-putnam-direct-limit.md) template applied to the bitopological-site settling setting.

**Step 2 — finite-stage cohomology.** For each $\tau < \omega_1$, the truncated settling $v|_{[0, \tau]}$ has closure ordinal $\leq \tau + 1 < \omega_1$ and countable state space, hence falls in [the Scott-continuous or transfinite-bounded regime](four-regime-dichotomy.md). The truncation's $H^1$ is

$$H^1(\mathbf{T}^*_{\leq \tau}, \mathcal{F}_U) \;\cong\; \mathbb{Z}^{|L(\tau)|}$$

where $L(\tau) := \{\mu \leq \tau : \mu \text{ countable limit ordinal at which the settling fires non-Scott-continuously}\}$, with each generator corresponding to the new cell introduced at such a firing. The transition map $H^1(\mathbf{T}^*_{\leq \tau}) \to H^1(\mathbf{T}^*_{\leq \tau+1})$ is the natural inclusion of generators, with a new generator added exactly when $\tau + 1$ is a non-Scott-continuous firing ordinal.

**Step 3 — MLD implies equal cohomology.** Let $(\phi, \delta)$ be an invertible settling-morphism $v \to v'$. The homomorphism $\phi$ induces a sheaf isomorphism $\phi_* : \mathcal{F}_U \to \mathcal{F}_{U'}[\delta]$ on $\mathbf{T}^*_{\leq \omega_1}$. Under the canonical identification of $\mathcal{F}_{U'}[\delta]$ with $\mathcal{F}_{U'}$ in the direct limit, $\phi_*(\mathbf{1}_{\mathcal{F}_U}) = \mathbf{1}_{\mathcal{F}_{U'}}$, hence $\mathrm{cl}\text{-}\mathrm{inv}(v) = \mathrm{cl}\text{-}\mathrm{inv}(v')$ in $H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U^{\mathrm{univ}})$.

**Step 4 — equal cohomology implies MLD.** Suppose $\mathrm{cl}\text{-}\mathrm{inv}(v) = \mathrm{cl}\text{-}\mathrm{inv}(v')$. Unwinding the direct-limit equality: there exists $\tau^* < \omega_1$ such that the classes agree in $H^1(\mathbf{T}^*_{\leq \tau^*}, \mathcal{F}_U^{\mathrm{univ}})$.

At each truncation $\tau \leq \tau^*$, the equality of $H^1$-classes corresponds to the existence of a 1-cochain $\psi_\tau$ making $\mathrm{cl}\text{-}\mathrm{inv}(v) - \mathrm{cl}\text{-}\mathrm{inv}(v')$ a coboundary. By [fibered coinduction](fibered-coinduction.md) ([@hermida-jacobs1998] applied to $F_U, F_{U'}$ as fibered coalgebras, the family of coboundary witnesses $(\psi_\tau)_{\tau \leq \tau^*}$ extends to a settling-morphism $\phi : v \to v'$ provided the two coalgebras admit a bisimulation lifting the cochain-coboundary relation.

The bisimulation lifting is supplied by Bonchi–Petrişan–[@bonchi-et-al2014]'s coinduction-up-to-closure: because the [closure 2-monad](../morphisms/closure-2-monad.md) is [lax-idempotent](closure-2-monad-lax-idempotence.md) and both settlings share the same underlying closure structure, the closure-equivalence of coboundary-related states extends to a settling-morphism in the up-to-closure sense.

Extending from $\tau^*$ to $\omega_1$: by $\leq_k$-monotonicity of the settling and direct-limit compatibility, $\phi$ defined at $\tau^*$ extends uniquely to the full settling up to $\omega_1$. The inverse exists by symmetry. Thus $v \sim_{\mathrm{MLD}} v'$. $\square$

## Substantive direction

Step 4 — equal cohomology implies MLD — is the substantive direction. Cohomological equivalence is a priori weaker than MLD; the Hermida–Jacobs + Bonchi et al. coinductive machinery is the technical backbone that turns a cochain-level coboundary equality into a bisimulation between settling orbits. Without it one would have only a weak-MLD notion (equivalence up to finite coboundary perturbations) rather than the full MLD.

## Coinduction-independent companion

[Aperiodic classification via combinatorial firing-ordinal bijection](aperiodic-classification-via-firing-ordinal-bijection.md) gives the same result via direct cell-bijection on a common base, avoiding the Hermida–Jacobs + Bonchi coinductive machinery entirely. That path is more elementary but restricted to the common-base case; for base-changing extensions, the coinductive proof above is the framework. With the combinatorial path proved (`status: proved`), the corpus's standard aperiodic instances no longer load-bear on the coinductive sketch.

## Cardinality scope

The hypothesis $|E| \geq \omega_1$ ensures that a settling reaching closure ordinal $\omega_1$ has $\omega_1$-many distinct cells to add. For $|E| < \omega_1$ with $\kappa = \omega_1$, the settling re-enters previously-populated cells via non-trivial morphisms; the classification still applies but with a refined MLD-equivalence allowing settling-shifted coincidence — not pursued here.

## Corollary — distinguishing power

Two aperiodic settlings $v, v'$ over a common base with the same closure ordinal $\kappa$ but structurally different closure rules — so that no invertible settling-morphism exists — have distinct classes $\mathrm{cl}\text{-}\mathrm{inv}(v) \neq \mathrm{cl}\text{-}\mathrm{inv}(v')$.

## Reading

The classification matches the foundational result for substitution tilings ([@anderson-putnam1998]; [@sadun2008] Ch. 4): two substitution tilings are MLD-equivalent iff their Čech cohomology agrees. The proofs have parallel structure — both use direct limits of finite-stage cohomologies — but the technical content differs: tilings use branched-manifold inverse limits, the present setting uses bitopological-site direct limits on bilattice Priestley duals.

## Co-classification via cosheaf homology

With [Verdier duality on the bitopological settling site](verdier-duality-bitopological-site.md) now established (at draft level, uniformly across all four regimes via the cellular extension plan), the classifying invariant admits a *dual* presentation as a cosheaf homology class — the [aperiodic co-classifying invariant](../objects/aperiodic-co-classifying-invariant.md). The corresponding [aperiodic co-classification theorem](aperiodic-co-classification.md) gives the same MLD-classification via cosheaf homology $H_1$ rather than sheaf cohomology $H^1$.

The two presentations encode the same firing-ordinal data, related by Verdier duality. The corpus thus has *two* parallel classifying invariants for aperiodic settlings — paired by the Verdier equivalence.
