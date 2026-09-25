---
type: theorem
status: sketch
depends-on: [cohomological-framework-2category, cohomological-framework-comparison, anderson-putnam-direct-limit, strict-regime-d-frame-cohomology, scott-continuous-regime-d-frame-cohomology, strict-regime-cohomology-vanishing, scott-continuous-regime-cohomology-vanishing, aperiodic-regime-cohomology-via-direct-limit, paraconsistent-settling-associated-sheaf, negative-paraconsistent-settling-sheaf, four-regime-dichotomy]
see-also: [strong-mld-via-composed-duality, three-cohomological-frameworks, framework-2-3-strict-agreement]
---

# Framework 1↔2 agreement on substitution settlings (strict / Scott-continuous regime)

The comparison 1-cell $\mathbb F_1 \to \mathbb F_2$ in $\mathbf{CohFr}$ on the subdomain of substitution settlings in strict / Scott-continuous regime is an agreement comparison: its comparison transformation $\alpha_{12}$ is a natural isomorphism.

## Statement

Let $\mathbb F_1$ be the substitution-matrix Anderson-Putnam framework and $\mathbb F_2$ the Tarski-Laplacian-on-discrete-points-fiber framework, in the sense of [cohomological framework](../../settling-cohomology/content/cohomological-framework/cohomological-framework.md). Let

$$C_{12} \;=\; (\mathcal D^\circ_{12},\; \Phi^{12}_{\mathcal D},\; \Phi^{12}_{\mathcal V},\; \alpha_{12}) \;:\; \mathbb F_1 \to \mathbb F_2$$

be the comparison 1-cell with:

- $\mathcal D^\circ_{12}$ = substitution settlings $\Omega_\omega$ in the strict or Scott-continuous regime (i.e., with finite-distributive-bilattice fibers $\mathbf L$).
- $\Phi^{12}_{\mathcal D}$: send a substitution $\omega$ to the bitopological settling site of the substitution settling $\Omega_\omega$, equipped with $\mathbb F_2$'s discrete-points fiber reading.
- $\Phi^{12}_{\mathcal V}$: the **side-structure-completion functor** $\mathbf{Ab}_{\mathrm{AP}} \to \mathbf{dFrm}$. On a paraconsistent / negative-paraconsistent pair $(\mathbb Z^{N_k}, \mathbb Z^{N_{k,-}})$ with side cell-data $(\Delta^+, \Delta^-, \cap, \mathrm{tot})$ from the substitution-matrix output, it returns the d-frame $(\mathcal P(\Delta^+), \mathcal P(\Delta^-), \mathrm{con}, \mathrm{tot})$ obtained by replacing each free abelian basis with the powerset frame on its index set and recording the joint consistency / totality relations.
- $\alpha_{12}$: the natural transformation comparing $\Phi^{12}_{\mathcal V}(\check H^\bullet_{\mathrm{AP}}(\Omega_\omega))$ to the $\mathbb F_2$ output $H^\bullet_2(\Phi^{12}_{\mathcal D}(\omega))$.

**Claim.** $\alpha_{12}$ is a natural isomorphism on $\mathcal D^\circ_{12}$.

## Proof (substantial partial proof; status `sketch`)

The proof is organized by regime, then by degree. Both endpoint theorems on the F2 side ([strict-regime-d-frame-cohomology](../../settling-cohomology/references/strict-regime-d-frame-cohomology.md), [scott-continuous-regime-d-frame-cohomology](../../settling-cohomology/references/scott-continuous-regime-d-frame-cohomology.md)) are `proved`; the F1 side's regime-vanishing theorems ([strict-regime-cohomology-vanishing](../../settling-cohomology/references/strict-regime-cohomology-vanishing.md), [scott-continuous-regime-cohomology-vanishing](../../settling-cohomology/references/scott-continuous-regime-cohomology-vanishing.md)) are `proved`. The work is to verify that $\Phi^{12}_{\mathcal V}$ identifies the two sides as d-frame objects, and that this identification is natural.

### Lemma C1 (strict regime, degree 0)

Let $\omega$ be a substitution settling in the strict regime. Then

$$\Phi^{12}_{\mathcal V}\bigl(\check H^0_{\mathrm{AP}}(\Omega_\omega)\bigr) \;\cong\; H^0_{\mathbf{dFrm}}(\mathbf T^*, \mathbb F_v)$$

as objects of $\mathbf{dFrm}$, naturally in $\omega$.

**Proof.** Closure ordinal $\kappa < \omega$: the AP direct limit $\check H^0_{\mathrm{AP}}(\Omega_\omega) = \varinjlim_n \check H^0(\Gamma_\omega, \omega^{*n})$ stabilizes at the quiescence stage $\tau^* < \omega$, so it equals the finite-stage Čech $H^0$. By [strict-regime-cohomology-vanishing](../../settling-cohomology/references/strict-regime-cohomology-vanishing.md), this finite-stage value on the paraconsistent / negative-paraconsistent pair is the abelian pair $(\mathbb Z^{N_k}, \mathbb Z^{N_{k,-}})$, with the canonical basis indexed by the cells in the corresponding designation class — exactly the eventual sets $\Delta^{+,\mathrm{Belnap}}_{\tau^*}$ and $\Delta^{-,\mathrm{Belnap}}_{\tau^*}$ of [strict-regime-d-frame-cohomology](../../settling-cohomology/references/strict-regime-d-frame-cohomology.md).

Applying $\Phi^{12}_{\mathcal V}$ replaces each free abelian basis with the powerset frame on its index set, giving $(\mathcal P(\Delta^+_{\tau^*}), \mathcal P(\Delta^-_{\tau^*}))$, and assembles the side-data $(\cap, \mathrm{tot})$ from the joint cell configuration into the relations $(\mathrm{con}, \mathrm{tot})$. This is exactly the d-frame returned by [strict-regime-d-frame-cohomology](../../settling-cohomology/references/strict-regime-d-frame-cohomology.md). The identification is unconditional and elementwise on the cells of the truncated site; naturality in $\omega$ is naturality of the underlying basis-to-powerset assignment under substitution-induced cell maps. $\square$

### Lemma C2 (Scott-continuous regime, degree 0; conditional on C-G2)

Let $\omega$ be a substitution settling in the Scott-continuous regime (closure ordinal $\kappa \leq \omega$). Then, **conditional on gap C-G2 below**,

$$\Phi^{12}_{\mathcal V}\bigl(\check H^0_{\mathrm{AP}}(\Omega_\omega)\bigr) \;\cong\; H^0_{\mathbf{dFrm}}(\mathbf T^*, \mathbb F_v)$$

as objects of $\mathbf{dFrm}$, naturally in $\omega$.

**Argument.** Both sides are filtered colimits of their finite-stage values, and we want to identify the colimits via $\Phi^{12}_{\mathcal V}$.

- **F1 side.** $\check H^0_{\mathrm{AP}}(\Omega_\omega) = \varinjlim_n \check H^0(\Gamma_\omega, \omega^{*n})$ by definition of the Anderson-Putnam direct limit, with transition maps the substitution-induced $\omega^* : \check H^0(\Gamma_\omega) \to \check H^0(\Gamma_\omega)$.
- **F2 side.** $H^0_{\mathbf{dFrm}}(\mathbf T^*, \mathbb F_v) = \varinjlim_{n < \omega} H^0_{\mathbf{dFrm}}(\mathbb F_v|_{\leq n})$ by step 4 of [scott-continuous-regime-d-frame-cohomology](../../settling-cohomology/references/scott-continuous-regime-d-frame-cohomology.md), with transition maps the truncation-extension inclusions of cell-set indices.
- **Stagewise agreement.** At each finite stage $n$, the truncated settling is in the strict regime, and Lemma C1 gives $\Phi^{12}_{\mathcal V}(\check H^0(\Gamma_\omega, \omega^{*n})) \cong H^0_{\mathbf{dFrm}}(\mathbb F_v|_{\leq n})$.
- **Φ¹²_𝒱 commutes with directed unions.** The powerset-frame functor $\mathcal P : \mathbf{Set} \to \mathbf{Frm}$ is a left adjoint and preserves filtered colimits along inclusions: $\mathcal P(\bigcup_n S_n) = \varinjlim_n \mathcal P(S_n)$ — exactly the identity invoked in step 4 of [scott-continuous-regime-d-frame-cohomology](../../settling-cohomology/references/scott-continuous-regime-d-frame-cohomology.md). The consistency / totality relations under directed-union direct limit are the eventually-true relations, again as in F2's step 4.

Combining gives $\Phi^{12}_{\mathcal V}(\varinjlim_n \check H^0(\Gamma_\omega, \omega^{*n})) \cong \varinjlim_n H^0_{\mathbf{dFrm}}(\mathbb F_v|_{\leq n}) \cong H^0_{\mathbf{dFrm}}(\mathbf T^*, \mathbb F_v)$ — *provided the F1 transition maps* $\omega^*$ *act on the cell-index basis as the same inclusion-style cell-index maps that drive the F2 colimit*. This identification of the two transition systems is the substantive content of gap C-G2 below. $\square$ (modulo C-G2)

### Higher-degree vanishing

Both sides vanish in degrees $\geq 1$ throughout the subdomain $\mathcal D^\circ_{12}$:

- **F1 side.** [strict-regime-cohomology-vanishing](../../settling-cohomology/references/strict-regime-cohomology-vanishing.md) gives $H^{\geq 1} = 0$ on the paraconsistent and negative-paraconsistent sides in the strict regime; [scott-continuous-regime-cohomology-vanishing](../../settling-cohomology/references/scott-continuous-regime-cohomology-vanishing.md) extends this to the Scott-continuous regime (no non-Scott-continuous firing ordinals exist below $\omega$, so the $H^1$-generator set $L_{\mathrm{ns}}$ is empty).
- **F2 side.** Steps 4–5 of [strict-regime-d-frame-cohomology](../../settling-cohomology/references/strict-regime-d-frame-cohomology.md) and step 5 of [scott-continuous-regime-d-frame-cohomology](../../settling-cohomology/references/scott-continuous-regime-d-frame-cohomology.md) give $H^{\geq 1}_{\mathbf{dFrm}} = 0$ in their respective regimes.

$\Phi^{12}_{\mathcal V}$ sends the zero abelian pair to the trivial d-frame, so $\alpha_{12}$ is the (unique) iso $0 \to 0$ in degrees $\geq 1$.

### Naturality

Naturality of $\alpha_{12}$ in $\omega$ reduces to: (a) naturality of $\Phi^{12}_{\mathcal V}$ as a functor on $\mathbf{Ab}_{\mathrm{AP}}$, and (b) naturality of the AP direct limit under substitution morphisms (a known property of the construction, [@anderson-putnam1998]). Both Lemma C1 and Lemma C2 used the basis-to-powerset / side-data assembly elementwise, which is functorial on the substitution-induced cell maps; naturality is automatic from the elementwise construction.

## Identified gaps

**Gap C-G1: Φ¹²_𝒱 not yet formalized as a corpus object.** The above proof uses $\Phi^{12}_{\mathcal V} : \mathbf{Ab}_{\mathrm{AP}} \to \mathbf{dFrm}$ as an explicit construction. The construction is unambiguous — basis-to-powerset on each side, joint cell-configuration to (con, tot) — but the corpus has not yet written it as a formal functor with verified functoriality (preservation of identities and composition under substitution-induced morphisms). Promotion to `proved` requires:

1. A corpus file for $\Phi^{12}_{\mathcal V}$ in `morphisms/` (or `objects/` if treated as a definition), specifying $\mathbf{Ab}_{\mathrm{AP}}$ as an explicit category (objects = paired free abelian groups equipped with side cell-data; morphisms = pairs of group homomorphisms compatible with the side-data assembly).
2. Verification of functoriality on substitution-induced maps (likely a small calculation: substitution acts on cells, $\Phi^{12}_{\mathcal V}$ commutes with the induced powerset / con / tot transport).
3. A check that the "side cell-data" output of the substitution-matrix Anderson-Putnam computation is exactly what $\Phi^{12}_{\mathcal V}$ consumes — i.e., that the F1 framework's output landing-zone is $\mathbf{Ab}_{\mathrm{AP}}$ as so defined, not a strictly smaller subcategory.

This gap is structurally analogous to gap **G3** in [framework-2-3-strict-agreement](framework-2-3-strict-agreement.md) (the dFrm → QCat$_{\mathrm{cwl}}$ inclusion): a value-category bridging functor that is easy to describe pointwise but has not been written as a typed object.

**Gap C-G2: F1 transition maps not identified with F2 cell-index inclusions on the Scott-continuous subdomain.** Lemma C2 invokes commutation of $\Phi^{12}_{\mathcal V}$ with filtered colimits along *cell-index inclusions* — the form of colimit that the powerset-frame functor and the eventually-true (con, tot) construction provably preserve. The F2 colimit (step 4 of [scott-continuous-regime-d-frame-cohomology](../../settling-cohomology/references/scott-continuous-regime-d-frame-cohomology.md)) is exactly such an inclusion-style colimit on truncation-extending cell sets. The F1 colimit, however, is the Anderson-Putnam direct limit along the substitution-induced map $\omega^* : \check H^0(\Gamma_\omega) \to \check H^0(\Gamma_\omega)$; this is not a priori an inclusion of cell-index sets. To close C-G2, one of the following suffices:

1. Show that on the strict / Scott-continuous subdomain, $\omega^*$ on $\check H^0$ acts as a cell-index inclusion modulo basis change — i.e., the substitution-image cell set embeds into the next-stage cell set via a canonical inclusion that drives the colimit. The strict-regime collapse of the AP direct limit at quiescence (used in Lemma C1) is consistent with this; what is missing is the explicit identification at countable stages.
2. Strengthen $\Phi^{12}_{\mathcal V}$ to preserve filtered colimits along *all* AP-style transition maps (not just inclusions). This would require a more general colimit-preservation argument than the one currently cited from F2's step 4.

Closing either form of C-G2 is a small calculation within the substitution-dynamical-system structure already encoded by the [Anderson-Putnam direct limit](../objects/anderson-putnam-direct-limit.md) object; both gaps (C-G1 and C-G2) are independent of the F2 / F3 Curry-chain sketches that condition the F2↔F3 agreement, and both are pure value-category / colimit-compatibility work within already-proved F1 and F2 endpoints.

## Discussion

Compared to [framework-2-3-strict-agreement](framework-2-3-strict-agreement.md), this agreement is structurally simpler: both endpoint theorems are already `proved`, and the F2 Scott-continuous proof's filtered-colimit step provides the exact commutation argument needed on the F2 side of the colimit-identification. The two remaining gaps (C-G1, C-G2) are value-category formalization and AP-transition-map identification respectively — both small, both within already-proved F1 and F2 endpoints, neither a missing computation in the substantive sense.

The strong-MLD theorem and the d-frame cohomology comparison theorem both rely on $\alpha_{12}$ being a natural iso to bridge between the benchmark suite's $\mathbb F_1$ outputs and the strict-regime $\mathbb F_2$ proofs that name the d-frame structure. With Lemma C1 unconditional on the strict subdomain, Lemma C2 conditional on C-G2 over the Scott-continuous subdomain, and only C-G1 / C-G2 outstanding, this bridge is on much firmer footing than its prior `assumed` / `draft` status suggested.

This theorem does not address the F1↔F2 comparison in the transfinite-bounded or aperiodic regimes — there the $\mathbb F_2$ framework's discrete-points reading itself is not in scope, and the appropriate bridge is via $\mathbb F_3$ rather than $\mathbb F_2$.
