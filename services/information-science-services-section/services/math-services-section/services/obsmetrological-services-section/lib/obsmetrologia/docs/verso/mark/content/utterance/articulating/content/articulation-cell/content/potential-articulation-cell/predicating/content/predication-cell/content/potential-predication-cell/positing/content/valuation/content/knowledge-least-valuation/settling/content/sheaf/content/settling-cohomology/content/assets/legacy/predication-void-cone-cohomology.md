---
type: theorem
status: proved
depends-on: [aperiodic-regime-cohomology-via-direct-limit, settling-path, settling-cohomology, anderson-putnam-direct-limit, non-scott-continuous-firing-ordinal, verdier-duality-bitopological-site, void-cone-associated-graded-direct, void-cone-via-filtration-ss]
---

# Void-cone (co)homology theorem

The void cone of a settling carries a natural $\mathbb{Z}$-module — the **associated graded of the void filtration** — that is canonically isomorphic to the apex cohomology $H^1(\mathcal{F}_v)$ via [Verdier duality on the bitopological settling site](verdier-duality-bitopological-site.md). The duality identifies the apex's "cells gained" with the void's "cells lost," each indexed by the same firing ordinals.

## Statement

**Theorem (void-cone (co)homology).** *For a settling $v$ on the bitopological settling site with closure ordinal $\kappa$ and non-Scott-continuous firing ordinal set $L_{\mathrm{ns}}(\kappa)$:*

1. *(Associated graded of the void filtration.) The descending family $V_0 \supseteq V_1 \supseteq \cdots$ of void cells admits the associated graded*

   $$\mathrm{gr}(\mathrm{Void}_v) \;:=\; \bigoplus_{\tau < \kappa} \mathbb{Z}^{V_{<\tau} \setminus V_\tau} \;\cong\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} \mathbb{Z}$$

   *with one summand $\mathbb{Z}$ per non-Scott-continuous firing ordinal, recording the cell removed from the void at $\mu$.*

2. *(Cosheaf-homology identification.) Let $\check{\mathcal{F}}_v$ be the Verdier dual of the [settling-associated sheaf](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agentic-relation-engine/lib/relating/docs/settling-associated-sheaf.md), the* void cosheaf *whose stalks count cell-removal-from-void events. Then*

   $$H_1(\check{\mathcal{F}}_v) \;\cong\; \mathrm{gr}(\mathrm{Void}_v) \;\cong\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} \mathbb{Z}.$$

3. *(Apex-void Verdier pairing.) Via the [Verdier duality theorem](verdier-duality-bitopological-site.md), there is a canonical isomorphism*

   $$H^1(\mathcal{F}_v) \;\cong\; H_1(\check{\mathcal{F}}_v)$$

   *as $\mathbb{Z}$-modules, given by the firing-ordinal indexing on both sides. The two are related by Verdier duality: apex cohomology counts "cells acquired"; void cosheaf homology counts "cells lost from the void"; each firing ordinal contributes one generator on each side.*

## Notation

The earlier corpus notation "$H^0(\mathrm{Void}_v)$" was used for what is, in standard terms, the **cosheaf homology** $H_1(\check{\mathcal{F}}_v)$ — equivalently, the associated graded of the void filtration. The "$H^0$" label was suggestive but non-standard. Going forward, prefer $\mathrm{gr}(\mathrm{Void}_v)$ or $H_1(\check{\mathcal{F}}_v)$. Where legacy "$H^0(\mathrm{Void}_v)$" appears in older notes, read it as $H_1(\check{\mathcal{F}}_v)$ via this theorem.

## Proof

### Step 1: associated graded structure

The void filtration $V_0 \supseteq V_1 \supseteq \cdots$ is descending, with $V_{<\tau} := \bigcap_{\sigma < \tau} V_\sigma$ at limit ordinals.

The set-theoretic differences $V_{<\tau} \setminus V_\tau$ are the cells that left the void at stage $\tau$:

- At successor $\tau = \sigma + 1$: $V_{<\tau} \setminus V_\tau = V_\sigma \setminus V_{\sigma+1}$, the cells that fired at $\sigma$.
- At limit $\tau$: $V_{<\tau} \setminus V_\tau$ is non-empty iff the limit step adds a new firing not captured by any predecessor — this is precisely the [non-Scott-continuous firing ordinal](../../../../../../settling-continuity/content/non-scott-continuous-firing-ordinal/non-scott-continuous-firing-ordinal.md) condition.

For Scott-continuous firings (cells fired at successor ordinals only), each $V_{<\tau} \setminus V_\tau$ for limit $\tau$ is empty. For NSC firings, $V_{<\mu} \setminus V_\mu$ contains the cells fired *at the limit*, which by definition are those captured only at $\mu$ and not at any earlier stage.

In both cases, summing over $\tau$ gives one $\mathbb{Z}$-generator per firing ordinal $\mu$:

$$\mathrm{gr}(\mathrm{Void}_v) \;=\; \bigoplus_{\tau < \kappa} \mathbb{Z}^{V_{<\tau} \setminus V_\tau} \;=\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} \mathbb{Z}$$

(where the right-hand identification uses that NSC firings are exactly the firing ordinals contributing non-trivially to the graded). $\square$ (Step 1)

### Step 2: Verdier-dual identification

By [Verdier duality on the bitopological settling site](verdier-duality-bitopological-site.md), the settling-associated sheaf $\mathcal{F}_v$ has a Verdier dual cosheaf $\check{\mathcal{F}}_v$, with derived equivalence

$$\mathrm{Sh}_\mathbb{Z}(\mathbf{T}^*) \;\simeq\; \mathrm{coSh}_\mathbb{Z}(\mathbf{T}^*),$$

and degree-shifted (co)homology pairing $H^n(\mathcal{F}_v) \cong H_n(\check{\mathcal{F}}_v)$.

The Verdier dual of $\mathcal{F}_v$ at a point $(q, \tau, U)$ records "cells lost from the void up to stage $\tau$" — concretely, the assignment $(q, \tau, U) \mapsto \mathbb{Z}^{(V_{<\tau} \setminus V_\tau) \cap U}$. This is a cosheaf because the transitions $\check{\mathcal{F}}_v(q, \tau, U) \to \check{\mathcal{F}}_v(q, \tau', U')$ for $\tau' \geq \tau$ are *inclusions* of cell-loss data, contravariant in the natural settling direction.

The cosheaf homology $H_1(\check{\mathcal{F}}_v)$ is computed as the colimit of $\check{\mathcal{F}}_v$'s firing-event data over the site — which is exactly the associated graded of the void filtration:

$$H_1(\check{\mathcal{F}}_v) \;\cong\; \mathrm{gr}(\mathrm{Void}_v).$$

This identifies the cohomological object with the associated graded explicitly. $\square$ (Step 2)

### Step 3: apex-void Verdier pairing

By Verdier duality applied to the settling-associated sheaf in degree 1:

$$H^1(\mathcal{F}_v) \;\cong\; H_1(\check{\mathcal{F}}_v).$$

By Step 2, $H_1(\check{\mathcal{F}}_v) \cong \mathrm{gr}(\mathrm{Void}_v) \cong \bigoplus_\mu \mathbb{Z}$.

By the [aperiodic-regime cohomology via direct limit theorem](../../../../../../aperiodic-settling/references/aperiodic-regime-cohomology-via-direct-limit.md) (and its strict / Scott-continuous / transfinite-bounded counterparts), $H^1(\mathcal{F}_v) \cong \bigoplus_\mu \mathbb{Z}$ also.

The isomorphism is given by the firing-ordinal indexing on both sides, with apex generator $e_\mu^{\mathrm{apex}}$ ("cell acquired bilattice value $v(\mu)$ at firing $\mu$") corresponding to void generator $\bar e_\mu^{\mathrm{void}}$ ("cell at position $\mathrm{cell}(\mu)$ left the void at firing $\mu$"). These are the same firing event under Verdier duality. $\square$ (Step 3)

Combining: the Verdier dual of the settling-associated sheaf has $H_1$ canonically identified with the associated graded of the void filtration, and via Verdier duality this matches $H^1$ of the apex. $\blacksquare$

## What changed from the earlier framing

The earlier file *defined* $H^0(\mathrm{Void}_v) := \bigoplus_\mu \mathrm{coker}(V_\mu \hookrightarrow V_{<\mu})$ and asserted this as a cohomology, with the "$\cong \bigoplus_\mu \mathbb{Z}$" being immediate from the definition. That gave a name without identifying it as a derived-functor (or derived-colimit) object, and the "duality with apex $H^1$" was structural matching by indexing rather than a real isomorphism theorem.

The corrected framing identifies the void object as **cosheaf homology**, explicitly via Verdier duality. The associated-graded formula is now derived from the cosheaf-homology computation rather than stipulated as a definition. The apex/void pairing is then *literal Verdier duality*, not just indexed matching.

Scope note: the proof's load-bearing step is the [Verdier duality theorem](verdier-duality-bitopological-site.md), now `status: proved` via the cellular extension plan's Layers 1+2+3. Step 1 (associated-graded computation) is independently combinatorial; Steps 2–3 (cosheaf-homology identification and apex-void pairing) inherit firmness from Verdier. The theorem is also independently proved via two Verdier-independent paths (see "Verdier-independent proof paths" below): the chain-level associated-graded direct theorem and the void filtration spectral sequence. The Verdier route here gives the structural unification of those independent proofs as a derived equivalence.

## Concrete case: substitution-tilings

For a primitive non-singular substitution settling at $E = \omega_1$, $H^1$ of the apex is (per the [step-$n$ cohomological rank theorem](../../../../../../aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/step-n-cohomological-rank-theorem.md)) post-quotient $\mathrm{cl}\text{-}\mathrm{inv}^{(n)} \cong \mathbb{Z}^n$ (with appropriate localization for non-unimodular $M$).

By Verdier duality, the void's $H_1$ post-quotient is also $\mathbb{Z}^n$ (or its $\mathbb{Z}[1/d]$-localization). For unimodular $M$, the two sides are isomorphic $\mathbb{Z}$-modules. For non-unimodular $M$, the apex localizes while the void profinitely-completes — they're related by a (limit, colimit) duality, each carrying the same firing-ordinal generators with different ring-of-coefficients structure.

- **Fibonacci** ($n = 2$, $\det = -1$, unimodular): $H_1(\check{\mathcal{F}}) \cong \mathbb{Z}^2$.
- **Padovan** ($n = 3$, unimodular): $\mathbb{Z}^3$.
- **Thue-Morse** ($n = 2$, $\det = 0$): $\mathbb{Z}[1/2]$ (or its profinite completion).

## What's at the void cone's apex

Cells that *never* leave the void — $V_\infty := \bigcap_\tau V_\tau$ — form a separate invariant from the firing-counting graded:

$$H_0^{\mathrm{apex of Void}}(v) \;:=\; \mathbb{Z}^{V_\infty}.$$

This is **not** identified with apex $H^1$ — it counts cells that never fire, complementary to the firing data. For aperiodic substitution settlings on $E = \omega_1$, $V_\infty = \emptyset$. For non-aperiodic settlings (strict, Scott-continuous, transfinite-bounded with stuck cells), $V_\infty$ can be non-trivial.

This gives a discrete invariant orthogonal to the firing-ordinal-indexed $H_1$.

## Connection to no-tunneling

By the [no-tunneling theorem](cl-inv-locally-constant-on-paths.md), $\mathrm{cl}\text{-}\mathrm{inv}(v) = $ apex $H^1$ is locally constant on settling paths. By Verdier duality (Step 3 above), $\mathrm{gr}(\mathrm{Void}_v)$ is also locally constant. Hence:

**Corollary.** *The pair $(\mathrm{cl}\text{-}\mathrm{inv}, \mathrm{gr}(\mathrm{Void})) \in H^1 \times H_1(\check{\mathcal{F}})$ is locally constant on settling paths.*

Smooth deformations preserve both apex content and the void's associated graded jointly.

## Verdier-independent proof paths

Two independent proofs of the chain-level matching are available, alongside the Verdier route:

- [Void-cone associated-graded direct](void-cone-associated-graded-direct.md) — chain-level bijection between $\mathrm{gr}(\mathrm{Void}_v)$ and apex $H^1$ via firing-ordinal indexing. Verdier-independent.
- [Void-cone via filtration spectral sequence](void-cone-via-filtration-ss.md) — computes the (co)homology via the SS of the void filtration directly. Recovers the same answer through filtered-complex machinery.

Both are `status: proved`. With Verdier now also `status: proved`, all three paths give the same conclusion via different routes — chain-level bijection, spectral sequence, and derived equivalence respectively. The three together provide redundant verification: the result holds via the Verdier route as established here, and equally via either of the two independent routes.
