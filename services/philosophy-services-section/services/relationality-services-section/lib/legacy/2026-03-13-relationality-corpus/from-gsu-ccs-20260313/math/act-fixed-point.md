---

name: act-fixed-point
description: "Topic: Fixed Points of Acts: From active Fibers to the Hyperverse"
defines: ActFixedPoint
---

### Definition — Fixed Points of Acts {#act-fixed-point}

Every act in the relational universe has a **fixed-point layer**: the sublayer of
objects, propositions, or universes on which the act collapses to the identity. The
fixed-point layers across the four phases are not independent — they form a
vertical stack in which each level's fixed points become the atoms of the next.

#### The Parallel Structure {#act-fixed-point-parallel}

| Level | Act | Fixed-point layer | Characterization |
|---|---|---|---|
| Quality | Nuclei $\sigma_t$, $\Delta_t$ | $H_t^* = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$ | Doubly quiescent propositions |
| Act (ground) | $U_G$ on $R$ | $R$ itself: $U_G(R) = R$ | Self-generating universe |
| Act (meta) | $U_{\mathcal{H}}$ on universes | $\mathcal{H}$: $U_{\mathcal{H}}(\mathcal{H}) = \mathcal{H}$ | Self-generating hyperverse |

At the **quality level**, the fixed-point layer $H_t^*$ is the sub-Heyting algebra
of propositions that are already at their saturated and transfer-stable form:
neither nucleus moves them. These are the propositions that have "fully settled."

At the **act (ground) level**, the fixed-point layer is $R$ itself. The self-generation
theorem ($U_G(R) = R$, §self-generation) says that $R$ is already closed under
all its own constructive operations: no new object can be generated from $R$'s
resources. $R$ has "fully settled" at the universe level.

At the **act (meta) level**, the fixed-point layer is $\mathcal{H}$, characterized
by $U_{\mathcal{H}}(\mathcal{H}) = \mathcal{H}$. This is the definition of the
Relational Hyperverse: the least universe fixed by its own meta-generative act
(§relational-hyperverse).

#### $\mathcal{H}$ is to $R$ as $H_t^*$ is to $H_t$ {#act-fixed-point-analogy}

The analogy is precise:

- **Within $H_t$**: the nucleus $\sigma_t$ maps $H_t \to H_t$, inflating each
  proposition to its saturation. Iterating, every proposition eventually reaches
  $H_t^*$. The fixed-point layer is where the inflation ceases.

- **Within the tower $R \hookrightarrow R^{(1)} \hookrightarrow \cdots$**: the
  meta-operator $U_{\mathcal{H}}$ maps each universe to the next (larger) universe.
  Iterating, the tower converges to $\mathcal{H}$. The fixed-point layer is where
  the inflation ceases.

In both cases, the fixed-point layer is:
1. A **sub-object** of the ambient structure ($H_t^* \subset H_t$; $R \subset \mathcal{H}$ as the ground);
2. The **colimit** of the iteration ($H_t^* = \mathrm{colim}$ of the nuclear closure sequence; $\mathcal{H} = \mathrm{colim}_n R^{(n)}$);
3. **Minimal** among all sub-objects closed under the act.

#### The Fixed-Point Hierarchy {#act-fixed-point-hierarchy}

The vertical stack of fixed points:

$$
H_t^* \;\subset\; H_t \;\subset\; R \;\hookrightarrow\; R^{(1)} \;\hookrightarrow\; \cdots \;\hookrightarrow\; \mathcal{H}
$$

- $H_t^*$ is the stable layer **within a fiber** (quality level, being);
- $R$ is the stable universe **within a single turn** of the nuclear quartet (act level, becoming);
- $\mathcal{H}$ is the stable universe **across all turns** (spiral level).

Each fixed-point layer is the "most quotiented" version of the objects at its level:
the one where the relevant act can do no more work.

#### Remark — Fixed Points as Termination {#act-fixed-point-termination}

The fixed-point equation $U(X) = X$ is the categorical expression of **termination**:
the act $U$ has finished its work on $X$. In computation, a fixed point of a
rewriting system is a normal form. Here:

- $H_t^*$ is the normal form of the nuclear rewriting on propositions;
- $R$ is the normal form of the generative rewriting on universes (within one level);
- $\mathcal{H}$ is the normal form of the meta-level generative rewriting (across levels).

The conjecture (§hyperverse-terminality, if it exists) would be that
$\mathcal{H}$ is the **unique** fixed point of $U_{\mathcal{H}}$ that contains all
relational universes as sub-objects — the terminal object in the category of
self-generating universes.

**Status.** Draft. The analogy between $H_t^*$ and $\mathcal{H}$ is compelling but
not yet formalized as a theorem. The right framework is probably a 2-categorical
or $(\infty,1)$-categorical statement about fixed points of endofunctors at
different levels of a universe hierarchy. Left for future work.
