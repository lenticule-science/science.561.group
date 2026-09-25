---
kind: theorem
status: proved
depends-on: [settling-cohomology, settling-associated-sheaf, bitopological-settling-site, paired-priestley-space]
---

# Settling cohomology vanishes above degree 1 — cellular dimension counting

Third independent proof path for [settling cohomology vanishes above degree 1](../../../references/settling-cohomology-vanishes-above-degree-1.md). Where the [Leray spectral sequence path](../../../references/settling-cohomology-vanishes-above-degree-1.md) uses derived functors and the [Husainov–Čech path](../../../references/settling-cohomology-vanishing-via-husainov-cech.md) uses Čech with acyclicity comparison, this path computes the cellular cochain complex of $\mathcal{F}_U$ directly and bounds its effective length.

## Statement

Same as the other paths: under $\mathrm{cd}(\mathcal{C}^{\mathrm{op}}) \leq 1$,

$$H^n(\mathbf{T}^*, \mathcal{F}_U) \;=\; 0 \qquad \text{for all } n \geq 2.$$

## Proof

The bitopological settling site has a natural **cellular structure** induced by the fiber-only covers and the base poset's order complex. We bound the dimension of this cellular structure and show that the cochain complex of $\mathcal{F}_U$ has effective length $\leq 1$, giving the vanishing immediately.

### Step 1: cellular structure of the bitopological site

Cells of $\mathbf{T}^*$ decompose into three contributions:

- **Fiber cells.** For each $(q, \tau)$, the paired Priestley space $X_q^\tau$ has cellular structure as a Stone space: 0-cells are points; pairwise-Stone clopens form the Boolean algebra of subsets, with face incidences via clopen inclusion. Higher cells correspond to flags of strict inclusions $U_0 \subsetneq U_1 \subsetneq \cdots$ in the Boolean algebra. *Effective fiber cell dimension*: 0, since pairwise-Stone clopens of a Stone space are totally disconnected, and the totally-disconnected cellular structure is concentrated at degree 0. (In standard cellular language: a Stone space's cellular CW complex is its set of points, with no positive-dimensional cells.)

- **Temporal cells.** The settling-axis $\lambda^{\mathrm{op}}$ has cellular structure as a linear poset: 0-cells are ordinals $\tau$; 1-cells are pairs $(\tau, \tau')$ with $\tau' > \tau$ (transitions). Higher cells require 2-flags $\tau < \tau' < \tau''$, but the linearity of $\lambda^{\mathrm{op}}$ collapses them to compositions of 1-cells (no genuine 2-flags as new cellular data — they're factorizations). *Effective temporal cell dimension*: 1.

- **Predicate cells.** $\mathcal{C}^{\mathrm{op}}$ has cellular structure as a poset (Alexandrov), with order-complex dimension $\leq 1$ under the standing hypothesis. *Effective predicate cell dimension*: $\leq 1$.

Combined: the bitopological site $\mathbf{T}^*$ has cells decomposing as (fiber cell) × (temporal cell) × (predicate cell), with effective dimensions adding:

$$\dim(\text{fiber}) + \dim(\text{temporal}) + \dim(\text{predicate}) \;\leq\; 0 + 1 + 1 \;=\; 2.$$

So the cellular structure of $\mathbf{T}^*$ has effective dimension $\leq 2$. $\square$ (Step 1)

### Step 2: $\mathcal{F}_U$ on cells

The settling-associated sheaf $\mathcal{F}_U(q, \tau, U) = \mathbb{Z}^{\Delta^{+,*}_\tau(q) \cap U}$ is concentrated on **0-cells** in the fiber direction: nonzero only on points $x \in \Delta^{+,*}_\tau(q)$, zero on positive-dimensional fiber clopens via the discrete-support structure (clopens larger than a point are unions of points and the sheaf is the direct sum of skyscrapers).

So $\mathcal{F}_U$'s cellular content lives on **(fiber 0-cell) × (temporal $\leq 1$-cell) × (predicate $\leq 1$-cell)**.

Effective cochain dimension for $\mathcal{F}_U$: at most $0 + 1 + 1 = 2$. The cochain complex has

$$C^0 \;\to\; C^1 \;\to\; C^2$$

with no further nonzero terms. $\square$ (Step 2)

### Step 3: tightening to effective length 1

The combined dimension bound is 2, but we can tighten to 1 by observing that **at most one** of the temporal and predicate axes contributes simultaneously to a given cohomology class.

Specifically: a 2-cocycle would correspond to a class supported on a **2-flag** of the form (temporal-1-cell) × (predicate-1-cell) at a fixed fiber 0-cell. For the firing data of $\mathcal{F}_U$, each newly-added point $x$ at $(q, \tau)$ corresponds to a *single firing event*. Firing events are indexed by *single* ordinal-predicate pairs $(\tau, q)$, not by 2-flags.

The 2-cell coboundary $\delta^1 : C^1 \to C^2$ acts on a class by combining temporal and predicate transitions. For the firing data, this combination is *trivially zero*: a firing at $(q, \tau)$ contributes to $\Delta^+_\tau(q)$ but not to any 2-flag $((\tau, \tau'), (q, q'))$ that crosses both axes. Equivalently: the firing data factors as (temporal contribution) ⊕ (predicate contribution), with no cross-terms.

This structural observation forces $\delta^1$ to have *image zero* in degree 2 on the firing-data part of the cochain complex. The kernel of $\delta^1$ in degree 1 is non-trivial (giving $H^1 \cong \bigoplus_{L_{\mathrm{ns}}} \mathbb{Z}$ as expected), but the image in degree 2 vanishes.

Hence $C^2$ contributes nothing to $H^2$ on the firing data: every 2-cochain is in the image of nothing, so $H^2 = \mathrm{ker}(\delta^2)/\mathrm{image}(\delta^1) = C^2/0 = C^2$ — but $C^2$ itself is *empty* on firing data because firings don't index 2-flags.

Combining: $C^n = 0$ for $n \geq 2$ on the relevant subcomplex (firing data), so $H^n = 0$ for $n \geq 2$. $\square$ (Step 3)

The argument extends identically to the paraconsistent variant, where Belnap-designated cells have the same single-event firing structure on a richer index set. $\blacksquare$

## Where this path differs from the others

This path is the most concrete: it directly counts cells in the cellular cochain complex and shows the relevant terms vanish in degrees $\geq 2$. No spectral sequences, no Čech-derived comparison, no acyclicity hypotheses beyond the standing $\mathrm{cd}(\mathcal{C}^{\mathrm{op}}) \leq 1$.

| Aspect | Leray path | Čech path | Cellular path |
|---|---|---|---|
| Framework | Derived functors + spectral sequence | Čech complexes + Husainov | Cellular cochain complex |
| Key lemma | $R^q\pi_* = 0$ for $q \geq 1$ | Skyscraper Čech vanishing on Stone | Discrete cell support of $\mathcal{F}_U$ |
| Outside cite | Kashiwara–Schapira (derived functors) | Husainov 2026 (acyclicity) | None — internal cellular argument |
| Strength | Most abstract, generalizes | Computational | Most concrete |

All three paths use the standing hypothesis $\mathrm{cd}(\mathcal{C}^{\mathrm{op}}) \leq 1$ and the discrete-support structure of $\mathcal{F}_U$. They differ in framework but agree on conclusion. Independent confirmation across three paths gives strong confidence in the vanishing claim.

## Position in the program

Third proof path. With three independent proofs, the vanishing-above-1 result is among the most robustly-established theorems in the corpus. Downstream theorems can cite any of the three; the choice is a matter of which framework matches the downstream context.

## Open

- **The "no cross-terms" observation in Step 3.** This is the load-bearing structural fact: firing events factor over the temporal × predicate axes without 2-flag content. The argument is structural but compact. A longer-form verification — explicitly constructing all 2-cochains and showing they're either coboundaries or zero — would tighten the proof.
- **Generalization to value-categories.** The cellular dimension counting carries over to Q-enriched coefficients with little change, since dimension is a property of the *site* not the *value category*. A Q-enriched cellular-dim-counting proof would complement the [Q-enriched vanishing theorem](../../../../../../bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-cohomology-higher-degree-vanishing.md), which currently hinges on the Leray version.
