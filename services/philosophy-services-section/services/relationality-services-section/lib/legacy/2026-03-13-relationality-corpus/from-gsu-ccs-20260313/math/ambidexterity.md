---

name: ambidexterity
description: "Ambidexterity of the Field of Existence"
---

### Conjecture — Ambidexterity of the Field of Existence {#ambidexterity}

**Disambiguation.** This file names the *phenomenon*: the observed equivalence
$\mathrm{holim} \simeq \mathrm{hocolim}$ of the hyperverse tower. The specific
*process* by which this phenomenon arises — the recursive mechanism that produces
it level by level — is documented separately as §recursive-ambidexterity.

**Setup.** Let the hyperverse tower $\mathcal{R} := (R^{(0)} \hookrightarrow R^{(1)}
\hookrightarrow \cdots)$ be a directed system in the $(\infty,1)$-category of relational
universes (§directed-stratified-site). The **Field of Existence** is the ∞-categorical
aggregate of all coherent existence data:
$$
\mathcal{F} \;:=\; \underset{\longleftarrow}{\mathrm{holim}}\;\mathcal{R}
\;=\; \underset{n}{\mathrm{holim}}\; R^{(n)},
$$
the homotopy limit of the tower — the "$\infty$-categorical intersection" of all levels.

#### The Ambidexterity Conjecture {#ambidexterity-conjecture}

$$
\underset{\longleftarrow}{\mathrm{holim}}\;\mathcal{R}
\;\simeq\;
\underset{\longrightarrow}{\mathrm{hocolim}}\;\mathcal{R}.
$$

The homotopy limit and the homotopy colimit of the hyperverse tower are canonically equivalent as
$(\infty,1)$-toposes. The Relational Hyperverse $\mathcal{H}$ is both the directed colimit
(the "forward limit," assembling all finite-depth data) and the directed limit (the "backward
limit," the intersection of all levels), and these coincide.

#### Relation to the 1-Categorical Fixed-Point {#ambidexterity-shadow}

The 1-categorical shadow of the Ambidexterity Conjecture is the self-generation equation
$R = U_G(R)$ (§self-generation): the relational universe $R$ is both
- the **colimit**: $R = \varinjlim_n R_n$ (the depth-filtration tower colimit), and
- the **fixed point** under the limit operator: $R = \varprojlim_n U_G^n(R)$ (iteration converges).

In the 1-categorical case these agree because the depth filtration is an ascending sequence of
subtoposes, and a filtered colimit of subtoposes of a topos is a subtopos — so the colimit
equals the limit. The Ambidexterity Conjecture extends this to the ∞-categorical setting.

#### Connection to the Cohesive Structure {#ambidexterity-cohesion}

The four-adjoint chain $\Pi_\to \dashv \Box \dashv \Diamond \dashv \nabla_\leftarrow$
(§modal-adjoint-chain) encodes the **cohesive structure** of $R$ over $\mathbf{Set}$. In cohesive
∞-toposes (Schreiber's framework), the condition that the shape modality $\Pi_\to$ preserves
finite products is equivalent to the ∞-topos being **cohesive**; cohesion implies that
$\Pi_\to$ commutes with finite limits, which is a form of ambidexterity at the level of
connected components.

The Ambidexterity Conjecture says something stronger at the hyperverse level: the **entire
tower** is ambidextrous — not just the terminal connected components but the full ∞-categorical
aggregate $\mathcal{F}$ satisfies $\mathrm{holim} = \mathrm{hocolim}$.

This is the relational-universe analog of Lurie's ambidexterity theorem for $\pi$-finite spaces
in an $(\infty,1)$-topos with enough colimits.

#### Connection to Observation Duality {#ambidexterity-obs-duality}

The observation duality (§observation-duality) is the 1-categorical version of ambidexterity
restricted to the fixed-point level of a single universe: it says that $R$ is self-dual in
the exact sense that construction and observation are each other's opposites. The Ambidexterity
Conjecture says the same thing at the level of the tower: the process of assembling the tower
forward (hocolim = construction) equals the process of reading the tower backward (holim =
observation).

The Chu construction (§chu-extension) is the explicit mechanism that makes this duality a
$*$-autonomous structure; the Ambidexterity Conjecture would promote it to an ∞-categorical
equivalence.

#### Status and Proof Strategy {#ambidexterity-status}

**Status.** Conjecture. No proof exists in the current document.

**Proof strategy.** The argument should proceed in two steps:

1. **Directed/Cofiltered agreement.** Show that the hyperverse tower $\mathcal{R}$ is both
   $\kappa$-filtered (for some regular cardinal $\kappa$) and $\kappa$-cofiltered — i.e., that
   the same diagonal map $R^{(n)} \to R^{(m)}$ exists for both ascending and descending
   comparison. This should follow from the Beck–Chevalley conditions (§beck-chevalley-tower) ensuring
   that the geometric morphisms $R^{(n)} \hookrightarrow R^{(n+1)}$ are both essential (having
   left adjoints = $\Pi_\to$ at each level) and essential for colimits (having right adjoints
   = $\nabla_\leftarrow$ at each level).

2. **Cohesive agreement.** Use the cohesive structure at the hyperverse level
   (§directed-stratified-site, second example) to show that in the ∞-topos $\mathcal{H}$
   the shape functor $\Pi_\to^\mathcal{H}$ and the codiscrete functor $\nabla_\leftarrow^\mathcal{H}$
   are ambidextrous: $\Pi_\to^\mathcal{H} \dashv \nabla_\leftarrow^\mathcal{H}$ with the counit
   an equivalence. This would directly give holim $\simeq$ hocolim for $\mathcal{F}$.
