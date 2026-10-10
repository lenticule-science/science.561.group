---
description: Survey of the moduli theory of predication settlings — the settling fiber groupoid and its visible quotient, the coarse settling moduli, the settling moduli prestack and stack, the meta-moduli prestack of closure-rule systems, and the aperiodic classifying invariant in $H^1$.
status: draft
session-date: 2026-05-19
---

## Scope

This survey records the moduli theory of predication settlings as it stands in the library at `theories/.../predication-categories/code/structures/`. It covers the settling fiber groupoid $\mathrm{KP}^\simeq(B)$ over a fixed base; its visible quotient by the invisible-automorphism subgroup; the coarse settling moduli $|\mathrm{KP}^{\mathrm{vis}}(B)|$ as the set of MLD-classes; the settling moduli prestack $\mathscr{M}^{\mathrm{pre}}$ as a pseudo-functor $\mathbf{B}^{\mathrm{op}} \to \mathbf{Gpd}$; the meta-moduli prestack $\mathscr{M}^{\mathrm{meta}}_{\mathrm{pre}}$ classifying closure-rule systems up to closure-equivalence; and the aperiodic classifying invariant $\mathrm{cl}\text{-}\mathrm{inv}(v) \in H^1(\mathbf{T}^*_{\leq \kappa}, \mathcal{F}_U)$ that classifies aperiodic-regime settlings up to MLD-equivalence. It defers cohomological apparatus (the underlying $H^n(\mathbf{T}^*, F)$) to the cohomology survey, and the step-$n$ substack tower to the regime-classification survey.

## Content

### The settling fiber groupoid $\mathrm{KP}^\simeq(B)$

For a fixed base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$, the settling fiber groupoid has 0-cells the predication settlings over $B$, 1-cells the invertible settling-morphisms (equivalently the biequivalences in the 2-category of settlings over $B$, including those with non-zero ordinal shift $\delta$), and 2-cells all identities by the settling-automorphism 1-truncation theorem. The 2-cells being identities means $\mathrm{KP}^\simeq(B)$ is effectively a 1-groupoid despite living in a 2-category.

Connected components are MLD-classes: $\pi_0(\mathrm{KP}^\simeq(B)) = \mathrm{KP}(B) / \sim_{\mathrm{MLD}}$. Components are isomorphism classes; 1-cells are biequivalences, and biequivalence coincides with MLD-equivalence on this 2-category.

Endo-automorphisms $\phi : v \to v$ are forced to ordinal shift $\delta = 0$ — a shift-$\delta$ self-morphism is not invertible because $v_{\tau - \delta}$ is undefined for $\tau < \delta$. So $\mathrm{Aut}^\simeq(v)$ consists of $\delta = 0$ settling-automorphisms only, even though 1-cells *between* distinct settlings may carry $\delta > 0$.

The settling fiber groupoid carries a normal subgroupoid of *invisible automorphisms* — automorphisms acting trivially on the settling-associated sheaf. Quotienting by this subgroupoid gives the visible settling fiber groupoid $\mathrm{KP}^{\mathrm{vis}}(B)$, the primary moduli object.

### The coarse settling moduli $|\mathrm{KP}^{\mathrm{vis}}(B)|$

The coarse settling moduli is the set of components of the visible settling fiber groupoid,

$$|\mathrm{KP}^{\mathrm{vis}}(B)| := \pi_0(\mathrm{KP}^{\mathrm{vis}}(B)) = \mathrm{KP}(B) / \sim_{\mathrm{MLD}}.$$

A point of the coarse moduli is an MLD-equivalence class of settlings over $B$. The 0-truncation functor $|\cdot| : \mathrm{Gpd} \to \mathrm{Set}$ — sending a groupoid to its set of connected components — produces the underlying point-set.

Living on the coarse moduli: the moduli classifying function $\mathcal{I}_B : |\mathrm{KP}^{\mathrm{vis}}(B)| \to \{\text{sheaf-iso classes}\}$ sending each MLD-class to its settling-associated sheaf's isomorphism class; the regime decomposition $|\mathrm{KP}^{\mathrm{vis}}(B)| = \bigsqcup_X |\mathrm{KP}^{\mathrm{vis}}(B)|_X$ partitioning by regime label; the rigid/orbifold substratification within each regime stratum by visible-automorphism symmetry. Automorphism data is lost when passing to the coarse moduli — that data lives in the visible settling fiber groupoid above.

### The settling moduli prestack $\mathscr{M}^{\mathrm{pre}}$

The settling moduli prestack is the pseudo-functor $\mathbf{B}^{\mathrm{op}} \to \mathbf{Gpd}$ sending each base $(\mathbf{L}, \mathcal{C}, E, \lambda)$ to its visible settling fiber groupoid:

$$\mathscr{M}^{\mathrm{pre}} : \mathbf{B}^{\mathrm{op}} \to \mathbf{Gpd}, \qquad (\mathbf{L}, \mathcal{C}, E, \lambda) \mapsto \mathrm{KP}^{\mathrm{vis}}(\mathbf{L}, \mathcal{C}, E, \lambda).$$

Equivalently, the fibered category $\int \mathscr{M}^{\mathrm{pre}} \to \mathbf{B}$ whose fiber over $B$ is $\mathrm{KP}^{\mathrm{vis}}(B)$. A base-change $(\ell, e, \pi, \phi_\lambda) : B \to B'$ in $\mathbf{B}$ induces a base-change functor $(\ell, e, \pi, \phi_\lambda)^* : \mathrm{KP}^{\mathrm{vis}}(B') \to \mathrm{KP}^{\mathrm{vis}}(B)$ by fiberwise pullback along the 4-tuple base-change — cellwise on the predication fiber algebras, settling-stage-wise on $\lambda$, etc.

A prestack is a pseudo-functor valued in groupoids whose Hom-presheaves are sheaves (local-Hom-condition); a stack additionally satisfies effective descent for objects. The prestack property is established in the settling-moduli-prestack-property theorem. The full stack property — effective descent — is the settling-moduli-stack-theorem: $\mathscr{M}^{\mathrm{pre}}$ is *already* a stack, no further stackification is needed; $\mathscr{M} := \mathscr{M}^{\mathrm{pre}}$.

The moduli prestack uses the visible settling fiber groupoid, not the unquotiented one. The fine moduli — retaining the full $\mathrm{Aut}^\simeq(v)$ including the invisible-automorphism subgroup — is recorded as a secondary structure; the relation is structurally an $N$-gerbe of the visible over fine.

### The meta-moduli prestack $\mathscr{M}^{\mathrm{meta}}_{\mathrm{pre}}$

One level up: the meta-moduli prestack classifies closure-rule systems up to closure-equivalence — the Lindenbaum-Tarski move from "models" to "theories" at the moduli level. It is the pseudo-functor

$$\mathscr{M}^{\mathrm{meta}}_{\mathrm{pre}} : \mathbf{B}^{\mathrm{op}} \to \mathbf{Gpd}, \qquad (\mathbf{L}, \mathcal{C}, E, \lambda) \mapsto \mathrm{Sys}^{\sim}(\mathbf{L}, \mathcal{C}, E, \lambda),$$

with $\mathrm{Sys}^{\sim}(B)$ the groupoid whose objects are closure-rule systems $\mathcal{S}$ over $B$ — finite or countable sets of closure rules in the closure-rule language over $\mathcal{C}$ with $\mathbf{L}$-valued formulas — and whose morphisms are *rule-derivation maps* (assignments sending each rule $r \in \mathcal{S}_1$ to a derivation of $r$ from $\mathcal{S}_2$, composition by concatenation). Isomorphisms are *closure-equivalences*: pairs of rule-derivation maps $\mathcal{S}_1 \rightleftarrows \mathcal{S}_2$ exhibiting that the generated closure operators agree,

$$\mathcal{S}_1 \cong \mathcal{S}_2 \iff \mathrm{cl}^{\mathcal{S}_1} = \mathrm{cl}^{\mathcal{S}_2}.$$

This is genuinely a groupoid: closure-equivalences are reflexive, symmetric, and transitive. Formally $\mathrm{Sys}^{\sim}(B)$ is the *core* of the rule-derivation category (the maximal subgroupoid). The MLD-style structural equivalence at the settling level is finer than closure-equivalence; for the meta-moduli, closure-equivalence is the natural fiber-groupoid relation.

A base-change $(\ell, e, \pi, \phi_\lambda) : B \to B'$ pulls a rule system $\mathcal{S}'$ back rule-by-rule, with each rule's formulas pulled back via the residuated-lattice morphism $\ell$, the predicate-functor $\pi$, the entity-set map $e$, and the ordinal-map $\phi_\lambda$. Functoriality on rule-derivation maps follows because derivations are themselves expressed in the closure-rule language, which pulls back along the 4-tuple base-change.

The prestack property — Hom-presheaves are sheaves — follows because a rule-derivation map is determined by its action on individual rules, which is in turn determined by formulas in the fiber algebra, and predication fiber algebras descend along covers by their sheaf-of-equational-algebras structure on $(\mathbf{B}, J_\mathbf{B})$. The full stack property is the meta-moduli-stack-theorem (forthcoming in the library).

Two notions of equivalence on closure-rule systems are relevant. *Closure-equivalence:* $\mathcal{S}_1 \cong_{\mathrm{cl}} \mathcal{S}_2$ iff the generated closure operators agree pointwise. *Structural-equivalence:* $\mathcal{S}_1 \cong_{\mathrm{str}} \mathcal{S}_2$ iff the settling moduli of $\mathcal{S}_1$ agrees with that of $\mathcal{S}_2$. Closure-equivalence implies structural-equivalence; the converse may fail. The meta-moduli prestack uses closure-equivalence — the strictly finer notion — by default.

The meta-moduli prestack sits in a paired tower with the settling moduli prestack via the realizability map sending each rule system $\mathcal{S}$ to its associated settling moduli (the settling fiber groupoid as the increment sequence $U$ varies):

$$\mathscr{M}^{\mathrm{meta}}_{\mathrm{pre}}(B) = \text{rule systems} \xrightarrow{\text{realizability}} \mathscr{M}^{\mathrm{pre}}(B) = \text{settlings up to MLD}.$$

### The aperiodic classifying invariant $\mathrm{cl}\text{-}\mathrm{inv}(v)$

For an aperiodic settling $v$ over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ with closure ordinal $\kappa$ and increment sequence $U$, the aperiodic classifying invariant is

$$\mathrm{cl}\text{-}\mathrm{inv}(v) := [\mathbf{1}_{\mathcal{F}_U}] \in H^1(\mathbf{T}^*_{\leq \kappa}, \mathcal{F}_U),$$

the cohomology class of the canonical identity cochain on the settling-associated sheaf — the cochain assigning to each $(q, \tau, U)$ the sum of generator elements indexed by newly-added designated cells at stage $\tau$.

The invariant lives in $H^1$ for a structural reason: settling cohomology vanishes above degree 1, so all obstruction content sits in $H^0$ and $H^1$; $H^0$ counts converged-state cells (quantitative, not structural); $H^1$ carries the obstructions that distinguish structurally inequivalent aperiodic orbits. For strict and Scott-continuous-regime settlings, cohomology stabilizes at the closure ordinal and $\mathrm{cl}\text{-}\mathrm{inv}$ is forced to be zero. For aperiodic-regime settlings, cohomology does not stabilize at any countable ordinal — non-Scott-continuous firings at countable limit ordinals continually contribute new $H^1$-generators — and $\mathrm{cl}\text{-}\mathrm{inv}$ can be non-zero.

By the aperiodic-regime classification, $\mathrm{cl}\text{-}\mathrm{inv}$ is the *complete* invariant for aperiodic settlings up to MLD: $v \sim_{\mathrm{MLD}} v'$ iff $\mathrm{cl}\text{-}\mathrm{inv}(v) = \mathrm{cl}\text{-}\mathrm{inv}(v')$. Two settlings with the same closure ordinal but structurally different closure rules — so that no invertible settling-morphism between them exists — have distinct classes.

For aperiodic settlings arising from substitution-recurrence rules, the classifying invariant has additional structure refined by a step-$n$ parameter; that refinement is recorded in the regime-classification survey.

## Synthesis-flags

The phrase "paired tower of moduli" describing the meta-moduli/settling-moduli relation reflects the exact phrasing in `meta-moduli-prestack.md`. The reading of the realizability map as the bridge between the two prestacks comes from the same source. The claim "$\mathscr{M}^{\mathrm{pre}}$ is already a stack, no further stackification is needed" reproduces source language; the surveyor did not verify the proof of the settling-moduli-stack-theorem cited in source.

## Provenance

Read in full this session:

- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/settling-moduli-prestack.md`
- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/meta-moduli-prestack.md`
- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/settling-fiber-groupoid.md`
- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/aperiodic-classifying-invariant.md`
- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/coarse-settling-moduli.md`

Cross-referenced theorems named in source material (not directly read this session):

- `settling-moduli-prestack-property`, `settling-moduli-stack-theorem` — the prestack and stack property results.
- `meta-moduli-stack-theorem`, `meta-realizability-map` — meta-level analogs (forthcoming per source).
- `settling-automorphism-1-truncation` — justifies treating $\mathrm{KP}^\simeq(B)$ as a 1-groupoid.
- `aperiodic-regime-classification` — establishes $\mathrm{cl}\text{-}\mathrm{inv}$ as a complete invariant.
- `settling-cohomology-vanishes-above-degree-1` — used to argue why the classifying invariant lives in $H^1$.
