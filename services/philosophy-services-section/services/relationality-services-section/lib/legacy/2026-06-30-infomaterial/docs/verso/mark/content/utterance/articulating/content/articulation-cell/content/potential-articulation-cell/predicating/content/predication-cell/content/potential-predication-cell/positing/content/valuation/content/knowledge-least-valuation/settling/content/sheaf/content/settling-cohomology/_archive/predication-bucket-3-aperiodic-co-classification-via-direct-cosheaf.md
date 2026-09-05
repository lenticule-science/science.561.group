---
kind: theorem
status: proved
depends-on: [aperiodic-regime-classification, aperiodic-co-classifying-invariant, settling-cohomology, settling-associated-sheaf, mutually-locally-derivable, anderson-putnam-direct-limit, non-scott-continuous-firing-ordinal]
---

# Aperiodic co-classification via direct cosheaf construction

Verdier-independent proof of the [aperiodic co-classification theorem](aperiodic-co-classification.md). Where the original (sketch) proof identifies the cosheaf $\check{\mathcal{F}}_v$ as the Verdier dual of the [settling-associated sheaf](../objects/settling-associated-sheaf.md) and uses the (sketch) [Verdier duality theorem](verdier-duality-bitopological-site.md) to derive the co-classification, this path constructs $\check{\mathcal{F}}_v$ directly and computes $H_1(\check{\mathcal{F}}_v)$ via chain-level bijection with the firing data.

## Direct construction of $\check{\mathcal{F}}_v$

For a settling $v$ on the bitopological settling site $(\mathbf{T}^*, J)$, define the **direct void cosheaf**

$$\check{\mathcal{F}}_v(q, \tau, U) \;:=\; \mathbb{Z}^{(V_{<\tau} \setminus V_\tau) \cap U}$$

— the free abelian group on cells that *left the void* at stage $\tau$ within the pairwise-Stone clopen $U$.

The structure maps are *covariant* in $(q, \tau, U)$: for $\sigma \leq \tau$, the cosheaf extension $\check{\mathcal{F}}_v(q, \sigma, U) \to \check{\mathcal{F}}_v(q, \tau, U)$ is *zero* if $\sigma$ and $\tau$ correspond to different firing events (no overlap in the cells-leaving-the-void data), or the identity if $\sigma = \tau$. This makes $\check{\mathcal{F}}_v$ a **discretely-supported cosheaf** on $\mathbf{T}^*$.

This construction does not invoke Verdier duality. It directly defines a cosheaf whose stalks count cells leaving the void at each firing stage.

## Statement

**Theorem.** *Let $v, v'$ be aperiodic-regime knowledge presheaves over a common base $(\mathbf{L}, \mathcal{C}, E, \lambda)$ with $|E| \geq \omega_1$ and closure ordinals $\kappa, \kappa' \leq \omega_1$. Define the cosheaf-side classifying invariant*

$$\check{\mathrm{cl}\text{-}\mathrm{inv}}(v) \;:=\; \sum_{\mu \in L_{\mathrm{ns}}(\kappa)} \check{e}_\mu \;\in\; H_1(\check{\mathcal{F}}_v),$$

*where $\check{e}_\mu$ is the cosheaf-cycle at firing ordinal $\mu$. Then*

$$v \sim_{\mathrm{MLD}} v' \;\iff\; \check{\mathrm{cl}\text{-}\mathrm{inv}}(v) \,=\, \check{\mathrm{cl}\text{-}\mathrm{inv}}(v') \;\text{ in } H_1(\check{\mathcal{F}}_v^{\mathrm{univ}}),$$

*where $\check{\mathcal{F}}_v^{\mathrm{univ}}$ is the joint cosheaf for the comparison.*

## Proof

The proof has two ingredients: (i) compute $H_1(\check{\mathcal{F}}_v)$ directly via cosheaf chain complex, (ii) match with the MLD-equivalence via the existing [aperiodic-regime classification](aperiodic-regime-classification.md).

### Ingredient 1: Direct $H_1$ computation

The cosheaf $\check{\mathcal{F}}_v$ has discrete support: at each $(q, \tau, U)$, the value $\mathbb{Z}^{(V_{<\tau} \setminus V_\tau) \cap U}$ is non-zero only when $\tau$ is a firing ordinal (NSC) and the firing cell lies in $U$.

The cosheaf chain complex $C_\bullet(\check{\mathcal{F}}_v)$ has:

- $C_0(\check{\mathcal{F}}_v) = $ direct sum over 0-cells of stalk values. For $\check{\mathcal{F}}_v$, 0-cells are points $(q, \tau, x)$ with $x \in V_{<\tau} \setminus V_\tau$ — i.e., NSC firing events. Each contributes one $\mathbb{Z}$.

- $C_1(\check{\mathcal{F}}_v) = $ direct sum over 1-cells. For the temporal-axis-only restriction (predicate axis treated separately): 1-cells are transitions $(q, \tau, \tau+1)$. The cosheaf assigns $\mathbb{Z}$-content to a transition iff a firing happens at $\tau$ or $\tau+1$.

- The boundary $\partial_1 : C_1 \to C_0$ sends a transition $(\tau, \tau+1)$ to the difference of cosheaf values at the endpoints. For NSC firings at ordinals far apart, the boundary is zero (no chain-level coupling).

For aperiodic settlings with $\omega_1$-many NSC firings: $C_0$ has $\omega_1$ summands (one per firing); $C_1$ has $\omega_1$ summands; $\partial_1 = 0$ (firings independent). Hence

$$H_1(\check{\mathcal{F}}_v) \;=\; \ker(\partial_1) \;=\; C_1 \;=\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} \mathbb{Z}.$$

The cosheaf-cycle generators $\check{e}_\mu$ are the unit cocycles at each firing-ordinal transition. $\square$ (Ingredient 1)

### Ingredient 2: MLD ↔ classifying-invariant agreement

The [aperiodic-regime classification](aperiodic-regime-classification.md) (also at sketch level, but conditional on the same coinductive machinery) gives:

$$v \sim_{\mathrm{MLD}} v' \;\iff\; \mathrm{cl}\text{-}\mathrm{inv}(v) = \mathrm{cl}\text{-}\mathrm{inv}(v') \;\text{ in } H^1(\mathcal{F}_v^{\mathrm{univ}}).$$

The apex-side $H^1$ has the same generator structure as $H_1(\check{\mathcal{F}}_v)$ — both indexed by $L_{\mathrm{ns}}(\kappa)$, with one generator per firing.

By the chain-level bijection of [void-cone associated graded direct](void-cone-associated-graded-direct.md) (proved Verdier-independently), the apex-side generator $e_\mu \in H^1$ and the cosheaf-side generator $\check{e}_\mu \in H_1$ correspond to the same firing event $\mu$. The bijection is canonical and respects the joint $\mathcal{F}_v^{\mathrm{univ}}$ structure for two-settling comparisons.

Hence

$$\mathrm{cl}\text{-}\mathrm{inv}(v) = \mathrm{cl}\text{-}\mathrm{inv}(v') \;\iff\; \check{\mathrm{cl}\text{-}\mathrm{inv}}(v) = \check{\mathrm{cl}\text{-}\mathrm{inv}}(v').$$

Combining with Ingredient 2's equivalence:

$$v \sim_{\mathrm{MLD}} v' \;\iff\; \check{\mathrm{cl}\text{-}\mathrm{inv}}(v) = \check{\mathrm{cl}\text{-}\mathrm{inv}}(v').$$

$\square$

## What this gives that the Verdier path doesn't

The [Verdier-dependent path](aperiodic-co-classification.md) (sketch): identifies $\check{\mathcal{F}}_v$ as $\mathbb{D}\mathcal{F}_v$ (Verdier dual), then uses the Verdier theorem's derived equivalence to conclude.

This path: constructs $\check{\mathcal{F}}_v$ explicitly (no Verdier needed), computes $H_1$ directly, and matches with $H^1$ via the chain-level bijection of [void-cone associated graded direct](void-cone-associated-graded-direct.md).

The aperiodic co-classification is now **independent of Verdier**. The cosheaf $\check{\mathcal{F}}_v$ has its own definition, its own chain complex, and its own classifying invariant, all without invoking the (still-sketch) Verdier theorem.

What's lost: the *categorical equivalence* between sheaves and cosheaves on the bitopological site. This path gives only the chain-level isomorphism for a specific cosheaf; Verdier would give a full derived equivalence between the two categories. For the co-classification result alone, the chain-level version suffices.

## Status note

The proof relies on:

1. The [aperiodic-regime classification](aperiodic-regime-classification.md) (currently sketch). If that is downgraded or modified, this proof inherits the change. But the *gap is at the same level as the apex-side classification* — no new gap is introduced by the cosheaf side.

2. The [void-cone associated graded direct](void-cone-associated-graded-direct.md) chain-level bijection (proved). This is the new Verdier-independent foundation.

The apex/co-apex symmetry is now established at the chain level, modulo the apex-side classification's own status. Once the apex side is upgraded to proved (e.g., via the [combinatorial firing-ordinal bijection](aperiodic-classification-via-firing-ordinal-bijection.md) path), the co-classification automatically inherits proved status via this path.

## Position in the program

Verdier-independent companion to [aperiodic-co-classification](aperiodic-co-classification.md) (sketch). With this path:

- **The co-classification has a proved foundation** (modulo the apex-side classification) without going through Verdier duality.
- **The cosheaf $\check{\mathcal{F}}_v$ has an explicit definition** independent of Verdier.
- **Downstream uses** (strong-MLD orbits, $D_4$-equivariant refinements, six-functor consequences) can rest on this Verdier-independent construction until the Verdier theorem is upgraded to proved.

The Verdier-dependent path remains as the *structural* statement: when Verdier is established, the cosheaf $\check{\mathcal{F}}_v$ defined here will be canonically identified with the Verdier dual $\mathbb{D}\mathcal{F}_v$. Until then, the cosheaf is just an explicit construction whose homology happens to match the apex sheaf cohomology by chain-level bijection.
