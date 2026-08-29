---
title: "Combinatorial Scent Mereology"
description: "Odor percepts as mereological composites of olfactory receptor activation subsets, situated within a hyperbolic manifold."
date-created: 2026-03-03
type: paper
authors:
  - emsenn
keywords:
  - olfaction
  - mereology
  - hyperbolic-geometry
  - neuroscience
  - research
status: draft
aliases:
  - "Combinatorial Scent Mereology"
  - "CSM"
defines:
  - odor-percept-as-mereological-composite-of-receptor-activation-subsets
  - hyperbolic-embedding-of-olfactory-receptor-similarity-graph
  - fantasy-odor-as-perceivable-but-chemically-unreachable-region-of-hyperbolic-manifold
  - accord-design-as-optimization-in-hyperbolic-activation-space
extends:
  - gromov-hyperbolic-groups
  - classical-mereology
requires:
  - olfactory-receptor-binding-profile-data
  - psychophysical-odor-similarity-judgments
  - poincare-embedding-methods
acts-on: geometry-of-olfactory-perceptual-space
produces:
  - explanation-of-non-metric-similarity-via-negative-curvature
  - prediction-of-fantasy-odors-in-sparse-regions-of-hyperbolic-manifold
  - computational-framework-for-algorithmic-scent-design
contrasts-with: euclidean-odor-feature-space-models
references:
  gromov1987:
    authors: ["M. Gromov"]
    title: "Hyperbolic Groups"
    publication: "Springer"
    year: 1987
  keller2017:
    authors: ["A. Keller", "R. C. Gerkin"]
    title: "Predicting Human Olfactory Perception from Chemical Features of Odor Molecules"
    publication: "Science"
    year: 2017
  mainland2014:
    authors: ["J. D. Mainland"]
    title: "The Missense of Smell: Functional Variability in the Human Odorant Receptor Repertoire"
    publication: "Nature Neuroscience"
    year: 2014
  haddad2008:
    authors: ["R. Haddad"]
    title: "A Metric for Odorant Comparison"
    publication: "Nature Methods"
    year: 2008
  haddad2010:
    authors: ["R. Haddad"]
    title: "Global Features of Similarity Between Odors"
    publication: "PNAS"
    year: 2010
  nickel2017:
    authors: ["M. Nickel", "D. Kiela"]
    title: "Poincaré Embeddings for Learning Hierarchical Representations"
    publication: "NeurIPS"
    year: 2017
  sanchez-lengeling2019:
    authors: ["B. Sanchez-Lengeling"]
    title: "Machine Learning for Scent Design Through the Mapping of Odor"
    publication: "PNAS"
    year: 2019
  rossiter1996:
    authors: ["K. J. Rossiter"]
    title: "Structure-Odor Relationships"
    publication: "Chemical Reviews"
    year: 1996
cites:
  - gromov1987
  - keller2017
  - mainland2014
  - haddad2008
  - haddad2010
  - nickel2017
  - sanchez-lengeling2019
  - rossiter1996
---

Combinatorial Scent Mereology (CSM) is a framework for modeling olfactory perception. Its central claim: odor percepts aren't point-like features in a Euclidean space — they're *mereological wholes* composed from overlapping subsets of olfactory receptor activations, situated within a manifold of negative curvature.

The framework connects three bodies of work: the neuroscience of olfactory receptor (OR) binding, the mathematics of hyperbolic geometry, and classical [mereology](../../../../../../../../philosophy-services-section/services/western-services-section/services/metaphysics-services-section/services/ontology-services-section/content/text/glossary/terms/mereology.md). What emerges is a model that explains several puzzling features of smell — categorical boundaries, non-metric similarity, and the existence of "fantasy odors" that no molecule produces — while opening a computational approach to synthetic scent design.

## The problem with Euclidean odor-space

Most models of olfactory perception attempt to place odors in a Euclidean feature space: each odorant is a point, and perceptual similarity corresponds to Euclidean distance. This approach struggles with three well-documented phenomena.

**Non-metric similarity judgments.** Human odor similarity ratings violate the triangle inequality. For percepts $A$, $B$, $C$, psychophysical data regularly show patterns where $A$ is similar to $B$ and $B$ is similar to $C$, but $A$ is dissimilar to $C$ — a relationship that can't hold in Euclidean space but arises naturally in negatively curved geometries (Keller et al. 2017; Haddad et al. 2010).

**Category discontinuities.** Small changes in molecular structure — a shift in chain length, a branching position — can produce disproportionately large perceptual changes (Rossiter 1996). This categorical behavior suggests the underlying geometry has sharp boundaries, not the smooth gradients of a Euclidean manifold.

**Sparse manifold occupation.** Computational work shows that only a small fraction of the theoretical OR activation space is occupied by known molecules, natural or synthetic (Sanchez-Lengeling et al. 2019). The space is mostly empty — but that emptiness isn't perceptually empty.

## Hyperbolic odor-manifolds

### OR tuning graphs are tree-like

Mammalian olfactory receptors don't bind a single molecule each. They display broad, overlapping ligand-binding profiles organized in branching similarity hierarchies (Mainland et al. 2014; Haddad et al. 2008). Receptor $R_1$ might bind molecules $\{a, b, c\}$, receptor $R_2$ might bind $\{b, c, d\}$, and these overlapping profiles form tree-like structures when represented as a graph.

Tree-like metric graphs embed quasi-isometrically in hyperbolic space — this is a consequence of Mikhail Gromov's work on hyperbolic groups (Gromov 1987). The key property: in a hyperbolic space $\mathbb{H}^n$, the volume of a ball grows exponentially with its radius. This accommodates the branching, hierarchical structure of OR binding far more naturally than a flat Euclidean space, where volume grows polynomially.

**Proposition.** The OR similarity graph $G_{OR}$ admits a low-distortion embedding into a hyperbolic space $\mathbb{H}^n$ for small $n$.

This means distances in the OR binding landscape grow exponentially from any reference point — which is consistent with the empirical finding that odor similarity judgments are non-metric.

### Evidence from psychophysics

Andreas Keller and colleagues showed that odor similarity judgments exhibit triangle inequality violations: for percepts $A$, $B$, $C$, data often show

$$d_H(A, C) \not\leq d_H(A, B) + d_H(B, C)$$

where $d_H$ is the distance function (Keller et al. 2017). Hyperbolic embeddings achieve lower distortion than Euclidean ones when reconstructing olfactory perceptual maps (Haddad et al. 2010). Rafi Haddad and colleagues' work on global features of odor similarity provides further evidence that the metric structure of odor-space is negatively curved.

## Mereological structure of percepts

### Activation subsets as parts

Let $OR$ be the set of olfactory receptors. An odorant induces an activation subset $A \subseteq OR$. Odor percepts are functions

$$P: \mathcal{P}(OR) \to \Omega$$

from the power set of receptors to perceptual space $\Omega$. The key claim of CSM:

> Percepts are mereological composites of activation subsets — not atomic features associated with individual molecules.

This means the relevant unit of analysis isn't the molecule but the *activation pattern*. Two structurally different molecules that produce the same activation subset smell the same. Two applications of the same molecule that produce different activation subsets (because of concentration, adaptation, or context) smell different.

### Three mereological operations

CSM defines three operations on activation subsets:

**Fusion** ($\sqcup$): combining activation subsets. When odorants are blended, their activation subsets fuse. This models accords — the perfumer's technique of blending molecules to produce a percept that none of the components produces individually. Formally: $A_1 \sqcup A_2 = A_1 \cup A_2$ at the receptor level, but $P(A_1 \sqcup A_2)$ need not equal any simple combination of $P(A_1)$ and $P(A_2)$ in perceptual space, because the mapping $P$ is nonlinear.

**Fission** ($\sqcap$): extracting shared activation. The intersection of two activation patterns picks out the receptors they have in common — the "common notes" between two odorants. Formally: $A_1 \sqcap A_2 = A_1 \cap A_2$.

**Deletion** ($\neg$): inhibitory removal of receptor contributors. Some receptor activations suppress others through lateral inhibition in the olfactory bulb. Deletion models this: $A \setminus B$ removes the contribution of subset $B$ from the percept generated by $A$.

These operations give the space of activation subsets a mereological algebra. Percepts aren't just "present" or "absent" — they're composed, decomposed, and modified through operations that have direct neural and chemical correlates.

### Similarity as hyperbolic geodesics

Within this framework, perceptual similarity between two percepts corresponds to the hyperbolic geodesic distance between their activation patterns:

$$d(P(A), P(B)) \approx d_{\mathbb{H}}(A, B)$$

Similarity isn't a Hamming distance over OR activations. It's the geodesic in a negatively curved space, which means:
- Nearby percepts in the same branch of the hierarchy can be very similar
- Percepts in different branches are exponentially distant, even if they share some activated receptors
- Small changes in activation can cross categorical boundaries, producing the discontinuities observed in psychophysics

## Fantasy odors and non-realizable percepts

### The emptiness of activation space

Define two sets:
- $V_{real}$: activation vectors that are realizable — meaning some stable molecule exists whose binding profile produces that pattern
- $V_{poss}$: theoretically possible activation vectors — all subsets of $OR$ that could in principle be activated simultaneously

Computational and empirical work shows that $|V_{real}| \ll |V_{poss}|$ (Sanchez-Lengeling et al. 2019). The activation space is vast; chemistry fills only a small corner of it. The regions between occupied clusters are "mereological holes" — combinations of receptor activations that no molecule produces.

### Accords as projections onto empty regions

These empty regions aren't perceptually empty. When no single molecule activates the right subset, a *blend* of molecules can approximate it through mereological fusion:

$$A_{fantasy} \approx A_1 \sqcup A_2 \sqcup A_3$$

This is exactly what perfumers do when they construct accords. Examples of molecules and accords that occupy low-density regions of the hyperbolic manifold:

- **Hedione** — an "airy, transparent floral" quality that doesn't correspond to any natural flower. Its activation pattern falls in a sparsely occupied region of $\mathbb{H}^n$.
- **Iso E Super** — produces a "velvety," almost anti-scent effect. It activates a receptor pattern that natural organic chemistry rarely produces.
- **Calone** — a "sea-like" quality with no natural analog. Marine environments produce complex olfactory signatures, but Calone's specific activation profile has no single molecular origin in nature.

These aren't approximations of natural smells. They're *genuine occupants* of regions of perceptual space that chemistry left empty. The framework predicts their existence: a vast hyperbolic manifold with sparse chemical coverage must contain perceptible but unrealized coordinates.

### Algorithmic scent design

Given a target point $T \in \mathbb{H}^n$ in an unoccupied region, accord design becomes an optimization problem: find real activation vectors $A_i$ (producible by available molecules) that minimize

$$\sum_i d_{\mathbb{H}}(A_i, T)$$

subject to chemical feasibility constraints. This connects CSM to computational methods:

- **Poincaré embeddings** (Nickel & Kiela 2017) can represent the receptor space in a hyperbolic model
- A **mereological graph calculus** with nodes as receptor subsets, edges as mereological relations ($\sqcup$, $\sqcap$, $\neg$), and weights as hyperbolic distances provides the computational substrate
- **Accord optimization** over this graph, constrained by molecular availability, yields candidate blends for approaching any target coordinate

## Implications

### For neuroscience

CSM predicts that non-metric perceptual transitions, odor illusions, and categorical boundaries emerge from the negative curvature of the receptor-binding manifold rather than from higher-level cortical processing. If the geometry is hyperbolic at the receptor level, the nonlinearities are structural, not learned.

### For perfumery

The framework predicts where "fantasy" regions lie in the manifold and how accords can approach them. It explains why accords feel more "conceptual" than single molecules: they're literally occupying regions of perceptual space that no single molecule can reach.

### For geometry

The framework suggests that the geometry of sensory spaces may be negatively curved more generally — wherever receptor systems have branching, hierarchical binding profiles, Gromov's theorem implies hyperbolic structure. Vision and audition have more regular receptor organization; olfaction's combinatorial, overlapping binding landscape may make it the clearest biological case of hyperbolic perceptual geometry.

## References

- Gromov, M. (1987). "Hyperbolic Groups." In *Essays in Group Theory*, 75–263. Springer.
- Haddad, R., et al. (2008). "A Metric for Odorant Comparison." *Nature Methods*, 5(5), 425–429.
- Haddad, R., et al. (2010). "Global Features of Similarity Between Odors." *PNAS*, 107(29), 12940–12945.
- Keller, A., Gerkin, R. C., et al. (2017). "Predicting Human Olfactory Perception from Chemical Features." *Science*, 355(6327), 820–826.
- Mainland, J. D., et al. (2014). "The Missense of Smell." *Nature Neuroscience*, 17, 114–120.
- Nickel, M., & Kiela, D. (2017). "Poincaré Embeddings for Learning Hierarchical Representations." *NeurIPS 2017*.
- Rossiter, K. J. (1996). "Structure-Odor Relationships." *Chemical Reviews*, 96(8), 3201–3240.
- Sanchez-Lengeling, B., et al. (2019). "Machine Learning for Scent Design." *PNAS*, 116(22), 11247–11252.
- Schiffman, S. S. (1974). "Physicochemical Correlates of Olfactory Quality." *Science*, 185(4151), 112–117.
- Zhuang, H., & Matsunami, H. (2007). "Synergism of Accessory Factors in Functional Expression of Mammalian Odorant Receptors." *Journal of Biological Chemistry*, 282(23), 15281–15288.
