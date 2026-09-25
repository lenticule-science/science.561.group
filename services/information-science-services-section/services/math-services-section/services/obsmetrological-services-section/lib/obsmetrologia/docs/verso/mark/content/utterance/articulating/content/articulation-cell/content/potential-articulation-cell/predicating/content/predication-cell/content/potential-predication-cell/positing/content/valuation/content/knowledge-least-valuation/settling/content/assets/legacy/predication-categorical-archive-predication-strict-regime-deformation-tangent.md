---
type: example
status: verified
depends-on: [skh-deformation-ext-classification, settling-cohomology-vanishes-above-degree-1, strict-regime-d-frame-computation, strict-regime-top-firing-verdier-self-dual, trivial-settling, four-bilattice]
instantiates: [skh-deformation-ext-classification]
lineage: 1
---

# Deformation tangent of the strict-regime ⊤-firing settling

A worked deformation-theoretic computation on the **Lineage 1** base — the simplest case where the [Ext-classification of SKH deformations](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/skh-deformation-ext-classification.md) can be exhibited concretely. The L1 base ($E = \{a\}$, single $P$, $\lambda = 2$, ⊤-firing increment per [strict-regime ⊤-firing self-dual](strict-regime-top-firing-verdier-self-dual.md)) is **rigid**: $\mathrm{Ext}^1(\mathcal{F}_v, \mathcal{F}_v) = 0$, $\mathrm{Ext}^2(\mathcal{F}_v, \mathcal{F}_v) = 0$. The deformation tangent space is zero-dimensional.

This is the L1 base case for the deformation-theoretic comparison across lineages. Richer lineages (L2 social-network with finite-discrete tangent, L4 transfinite-bounded with countable tangent, L5 aperiodic with uncountable tangent) exhibit progressively richer deformation structure.

## Setup

Take the L1 ⊤-firing settling: $E = \{a\}$, $\Pi = \{P\}$, $\lambda = 2$, increment $u_1 = (\text{told } P(a, a) = \top)$. The settled state is $v_1(P)(a, a) = \top$ — a single paraconsistent cell.

The associated d-frame-valued sheaf $\mathbb{F}_v$ has stalks computed in [strict-regime-top-firing-verdier-self-dual](strict-regime-top-firing-verdier-self-dual.md): rank-1 $L_+$, rank-1 $L_-$, consistency relation excluding the inconsistent total pair, totality requiring exactly that pair.

## $\mathrm{Ext}^1$ computation

A first-order deformation of $v$ is a settling $v_\epsilon$ over the dual numbers $k[\epsilon]/(\epsilon^2)$ that restricts to $v$ at $\epsilon = 0$. Concretely: a perturbation of the increment $u_1$ that returns $u_1 = \top$ at $\epsilon = 0$ but nearby values at first order.

For Boolean d-frame data, the value space at the cell $(a, a)$ is the **discrete** four-element bilattice $\mathbf{FOUR} = \{\bot, \mathbf{t}, \mathbf{f}, \top\}$. There is no continuous infinitesimal direction: the cell value is one of four discrete states, and any "deformation" is a discrete jump to a different state, not an $\epsilon$-perturbation.

Hence: **no first-order deformations exist**. The deformation space at $v$ is the zero space:

$$\mathrm{Ext}^1(\mathcal{F}_v, \mathcal{F}_v) \;=\; 0.$$

## $\mathrm{Ext}^2$ computation

By the [vanishing-above-degree-1 theorem](../../sheaf/content/settling-cohomology/references/settling-cohomology-vanishes-above-degree-1.md), $H^{\geq 2}(\mathcal{F}_v) = 0$. Since $\mathrm{Ext}^k(F, F) = H^k(\mathcal{H}om(F, F))$ and the closed-monoidal structure on $\mathbb{F}_v$ inherits the vanishing:

$$\mathrm{Ext}^2(\mathcal{F}_v, \mathcal{F}_v) \;=\; 0.$$

This is consistent with — but stronger than — the **unobstructedness** consequence: vacuously, every first-order deformation extends, because there are no first-order deformations to extend.

## What this exhibits

Three observations about the L1 deformation theory:

**1. The L1 base is *rigid*.** No infinitesimal deformations exist; the moduli stack at $[v]$ is locally a discrete point. This matches the broader observation that strict-regime / Boolean settings collapse predication categories' q-fuzzy / continuous machinery to discrete cases — already noted at the Verdier-duality level (where $q^{\mathrm{glob}} = 1$ throughout L1).

**2. Discrete deformations exist but aren't first-order.** The settling $v$ has discrete neighbors: $v_\bot$ (no firing), $v_\mathbf{t}$ (truth-only firing), $v_\mathbf{f}$ (falsity-only firing). These are *separate* points in the moduli stack, not infinitesimal perturbations of $v$. Discrete deformations are the moduli stack's *connected-component* structure, not its tangent structure.

**3. Comparison setup.** This rigid base case is the structural anchor for the deformation-rank progression across lineages:
- L1 (this file): $\dim \mathrm{Ext}^1 = 0$ — rigid.
- L2 (forthcoming, [social-network-deformation-tangent](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/social-network-deformation-tangent.md)): $\dim \mathrm{Ext}^1 = $ finite-discrete — multi-cell.
- L4 (forthcoming, [transfinite-induction-deformation-tangent](transfinite-induction-deformation-tangent.md)): $\dim \mathrm{Ext}^1 = |L_{\mathrm{ns}}|$ — countable.
- L5 (forthcoming, [fibonacci-deformation-tangent](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/fibonacci-deformation-tangent.md)): $\dim \mathrm{Ext}^1 = 2^{\aleph_0}$ — uncountable.

Each lineage's deformation tangent has different cardinality, with the rank growing with the regime's complexity. The L1 base is where the rank is zero; later lineages establish the rank progression.

## Position in Lineage 1

The L1 lineage's terminal example for the deformation theory chapter. With this in hand, L1 has been carried through:

- Settling structure ([trivial-settling](trivial-settling.md), [strict-regime-d-frame-computation](strict-regime-d-frame-computation.md))
- d-frame cohomology ([strict-regime-d-frame-computation](strict-regime-d-frame-computation.md))
- Verdier duality and orbit type ([strict-regime-verdier-dual](strict-regime-verdier-dual.md), [strict-regime-top-firing-verdier-self-dual](strict-regime-top-firing-verdier-self-dual.md))
- Moduli ([single-entity-moduli](single-entity-moduli.md))
- Meta-classifier ([trivial-base-meta-classification](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/trivial-base-meta-classification.md))
- Deformation tangent (this file)

L1 is now complete as the lineage's intended role: the *minimal benchmark* against which richer lineages display structural distinctness.
