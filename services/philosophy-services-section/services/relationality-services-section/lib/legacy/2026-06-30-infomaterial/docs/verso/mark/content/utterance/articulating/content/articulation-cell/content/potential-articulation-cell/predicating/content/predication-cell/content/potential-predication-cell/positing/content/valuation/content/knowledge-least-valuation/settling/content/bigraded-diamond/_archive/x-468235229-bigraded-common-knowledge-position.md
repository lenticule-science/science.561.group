---
type: narrative
discusses:
  - bigraded-common-knowledge
  - bilattice-k-axiom-multi-agent-epistemic
  - kz-diamond-hierarchical-swarm-coordination
  - halpern-moses1992
  - fagin-halpern-moses-vardi1995
---

# Position of bigraded common knowledge relative to the public common-knowledge literature

The corpus's [bigraded common knowledge theorem](../theorems/bigraded-common-knowledge.md) (sketch) constructs two independent greatest-fixed-point operators $C^t \phi$ and $C^k \phi$ on bilattice-valued multi-agent Kripke frames, derived from the [predication hyperdoctrine](../objects/predication-hyperdoctrine.md)'s two parallel adjoint systems. The construction sits adjacent to several lines of work in the public common-knowledge / multi-agent epistemic logic literature; this narrative records the relationship for readers familiar with that literature.

The theorem itself is stated in framework-internal terms — it derives from the predication hyperdoctrine's structure and uses corpus operators on corpus objects throughout. The comparative material below is positioning, not theorem-internal content.

## Halpern–Moses common knowledge

[@halpern-moses1992] introduced common knowledge in distributed-system epistemic logic as the greatest fixed point of the iterated everyone-knows operator on a Boolean Kripke frame. The classical formulation:

$$C\phi := \mathrm{gfp}\,\psi.\,\phi \wedge E\psi$$

where $E\phi := \bigwedge_i K_i \phi$ aggregates per-agent knowledge $K_i$ over the agent population. The fixed point exists by Knaster–Tarski on the Boolean lattice and is single-valued.

The corpus's bigraded common knowledge specializes to Halpern–Moses common knowledge when the bilattice $\mathbf{L}^\bowtie$ degenerates to a Boolean chain (e.g., $\mathbf{L} = \mathbf{2}$ collapses $\mathbf{FOUR}$ to its truth-only sub-chain) — this is the bilattice-degeneracy condition under which the two corpus fixed points coincide. On non-degenerate bilattices, the corpus produces two fixed points where Halpern–Moses produces one.

The structural reason is internal to the predication hyperdoctrine: condition (B1) gives two parallel adjoint systems (knowledge-axis and truth-axis), each supporting its own modal calculus. Halpern–Moses operate on a single adjoint system (Boolean implication and Boolean meet). The corpus's two-axis structure is therefore not an extension of Halpern–Moses by added axioms; it is the natural form modal closure takes when the underlying fibration has two parallel adjoint systems.

## Fagin–Halpern–Moses–Vardi

[@fagin-halpern-moses-vardi1995] is the standard textbook treatment of multi-agent epistemic logic, with K, T, 4, 5 axioms for S5 (knowledge) and KD45 (belief), common knowledge as the greatest fixed point, and distributed knowledge as a separate aggregation. The framework is single-axis throughout — Boolean values, Boolean implication, single common-knowledge fixed point.

The corpus's modal calculus (per the [modal calculus opener](modal-calculus-opener.md)) is non-normal in the FHMV sense: the [modal non-normality theorem](../theorems/modal-non-normality.md) shows that classical $K$-axiom $\Box(\phi \to \psi) \to (\Box\phi \to \Box\psi)$ fails on bilattice frames with paraconsistent ($\top$) accessibility values. The K-axiom Pass 1 finding (Pass 1 of the [bilattice K-axiom multi-agent epistemic question](../questions/bilattice-k-axiom-multi-agent-epistemic.md)) replaces classical K with bigraded K = K_t ⊕ K_k, which respects the framework's two-adjoint-systems structure. The bigraded common-knowledge theorem extends this pattern to common knowledge.

## Gonczarowski–Moses 2024 — Common Knowledge Regained

[Gonczarowski–Moses 2024](https://economics.princeton.edu/wp-content/uploads/2025/02/Common-Knowledge-Regained-Gonczarowski.pdf) resolves the Halpern–Moses paradox (common knowledge is unattainable in dynamic settings due to temporal imprecision) by introducing a temporally-coarse definition of common knowledge that coincides with the classical one in static settings. Their work is single-axis (Boolean values) and addresses temporal dynamics rather than value-category structure.

The corpus's contribution is orthogonal: bigraded common knowledge is about the framework's two-axis structure on the value side, not about temporal dynamics. The two contributions could in principle compose — a temporally-coarse bigraded common knowledge — though no such combination is in the corpus.

## BEAK — Bilattice logic of Epistemic Actions and Knowledge

Bakhtiari–van Ditmarsch–Rivieccio 2020 ([BEAK](https://arxiv.org/abs/2003.05462)) is the closest existing bilattice-modal precedent in the public literature. It extends dynamic epistemic logic's action-update apparatus to the four-valued Belnap–Dunn setting, with bilattice-valued modal necessity and possibility per agent.

BEAK has bilattice-valued modal operators but does not define a *common-knowledge fixed point* in the corpus's bigraded sense. Where BEAK has single-agent epistemic actions and knowledge updates, the corpus's bigraded common-knowledge construction is specifically about the *aggregated* fixed point across agents, computed per axis.

The corpus's bigraded common knowledge is therefore an extension of the BEAK lineage at the common-knowledge level: BEAK gives bilattice-valued $K_i$ per agent; the corpus gives the bilattice-valued aggregated $C^t$ and $C^k$ across agents. The structural source is the predication hyperdoctrine's two-adjoint-systems structure, which BEAK does not invoke.

## Bílková–Frittella–Kozhemiachenko paraconsistent Gödel modal logic

The Bílková–Frittella–Kozhemiachenko series (2022 [Paraconsistent Gödel Modal Logic](https://hal.science/hal-03825253), 2023 [Crisp bi-Gödel modal logic and its paraconsistent expansion](https://arxiv.org/abs/2211.01882), 2025 [Fuzzy bi-Gödel modal logic and its paraconsistent relatives](https://academic.oup.com/logcom/article-abstract/35/2/exae011/7634382)) develops paraconsistent modal logics with Gödel-residuated implication and split $R^+/R^-$ Kripke frame semantics encoding "trust in affirmations" vs "trust in denials."

The two-dimensionality in their framework is *internal to the modal semantics* — split accessibility relations $R^+/R^-$ within a single-axis Gödel-Heyting frame structure — not a bigraded K-axiom or bigraded common-knowledge construction. Their K-axiom uses single-axis Gödel implication; if extended to multi-agent, their common knowledge would be a single-axis fixed point.

The corpus's bigraded K and bigraded common knowledge sit at a structurally different layer: doubling across the bilattice's two orders, not splitting accessibility within one order. The K-axiom Pass 1 result records the structural distinction explicitly.

The Bílková–Frittella–Kozhemiachenko line and the corpus's modal calculus are parallel programs with complementary structural commitments. The corpus's framework would benefit from importing their soundness/completeness proof techniques (canonical-frame constructions on bilattice settings, adapted from their Gödel-fuzzy proofs) for sub-questions 5b–5d of the K-axiom question.

## Recent monad-based formalization of common knowledge

The 2025 [MDPI Mathematics paper on monad-based common knowledge](https://www.mdpi.com/2227-7390/14/6/958) formalizes knowledge hierarchies as presheaves over a category of agent sequences. This is single-axis (Boolean values, classical Kripke frames) but adopts a categorical perspective.

The corpus's bigraded common knowledge similarly uses a categorical perspective (the predication hyperdoctrine's adjoint structure, the closure 2-monad), but with the two-axis bilattice structure that the MDPI work does not have.

## What the corpus contributes

To consolidate: the corpus's bigraded common knowledge is novel content relative to all of the lines above. The structural source — the predication hyperdoctrine's two parallel adjoint systems — is itself novel (it is the corpus's distinctive use of bilattice-valued fibers as the natural setting for paraconsistent multi-agent reasoning). The bigraded K-axiom Pass 1 result establishes the structural shape; the bigraded common knowledge theorem extends it from the K-axiom to the common-knowledge fixed point.

The contribution is **not** "extension of Halpern–Moses with paraconsistent values." It is the natural form common knowledge takes in a framework with two parallel adjoint systems on bilattice-valued fibers, derived from the framework's primitives. Where Halpern–Moses gets a single fixed point because they work in a single-adjoint-system Boolean lattice, the corpus gets two fixed points because the predication hyperdoctrine's structure provides two adjoint systems independently.

The bottom-divergence on benchmark-5 (truth-axis $\to \mathbf{f}$, knowledge-axis $\to \bot$) is the empirical verification that the two adjoint systems are genuinely independent — that the bigrading is not collapsible. This is the corpus's distinctive empirical content.

## Reading order

For readers approaching from the public literature: read Halpern–Moses 1990 and FHMV 1995 first for the classical framework, then the [modal calculus opener](modal-calculus-opener.md) for the corpus's modal calculus on bilattice fibers, then the K-axiom question's Pass 1 for the bigraded K finding, then the [bigraded common knowledge theorem](../theorems/bigraded-common-knowledge.md) itself, and finally [benchmark-5 epistemic Kripke](../examples/benchmark-5-epistemic-kripke.md) for the worked computational example.

For readers approaching from the predication-categories framework: the theorem statement and proof are self-contained, deriving from the predication hyperdoctrine's two-adjoint-systems structure and the bilattice's framework-internal complete-lattice structure. This narrative is supplementary commentary, not theorem-internal content.
