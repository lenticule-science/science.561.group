---
type: question
class: bridge
status: partial
explores:
  - benchmark-5-epistemic-kripke
  - multi-agent-epistemic-settling
  - predication-hyperdoctrine
  - modal-necessity-operator
  - modal-possibility-operator
  - twist-modal-translation
  - aperiodic-classifying-invariant
  - mutually-locally-derivable
---

> **Progress (Pass 1 + Pass 2 done).** Sub-task 5a (K-axiom variant): **settled** — bigraded K = K-truth ⊕ K-knowledge, derived from the [predication hyperdoctrine](../objects/predication-hyperdoctrine.md)'s two parallel adjoint systems. Sub-task 5f (two-axis epistemic split): **settled by elevation to common knowledge** — the [bigraded common-knowledge theorem](../theorems/bigraded-common-knowledge.md) (sketch) constructs $C^t \phi$ and $C^k \phi$ as independent greatest fixed points using the [KZ-diamond strict commutation theorem](../theorems/kz-diamond-strict-commutation.md) (sketch). On benchmark-5, the two fixed points are computed to have *different bottoms*: $C^t p = (\mathbf{f}, \mathbf{f}, \mathbf{f})$ (truth-axis bottom), $C^k p = (\bot, \bot, \bot)$ (knowledge-axis bottom). For positioning relative to the public common-knowledge literature, see the [bigraded common knowledge position narrative](../narratives/bigraded-common-knowledge-position.md). Sub-tasks 5b–5e remain open at the soundness/completeness/MLD-equivalence level.

# Bilattice K-axiom soundness and completeness for paraconsistent multi-agent epistemic logic

The corpus has [benchmark-5: epistemic Kripke](../examples/benchmark-5-epistemic-kripke.md) — three agents (Alice, Bob, Carol), one paraconsistent witness world, with 6 ⊤-firings from paraconsistency propagation. The [multi-agent epistemic settling object](../objects/multi-agent-epistemic-settling.md) underlies it. The corpus also has [modal necessity and possibility operators](../morphisms/modal-necessity-operator.md), the [twist-modal translation](../objects/twist-modal-translation.md) into modal calculus on bilattice fibers, and the [non-normality theorem](../theorems/modal-non-normality.md) that distinguishes the corpus's modal logic from classical S5.

What the corpus *does not* have is the headline theorem that Direction 4 of the [agentic-swarm-theory plan](../narratives/toward-agentic-swarm-theory.md) names: **bilattice K-axiom soundness and completeness for a class of paraconsistent multi-agent Kripke frames**. The benchmark verifies that one specific frame admits paraconsistent epistemic content; the move from one frame to a class — and the soundness/completeness machinery that pins it down — is unwritten.

Meanwhile, an active research stream in the public paraconsistent / fuzzy modal logic literature (Bílková, Frittella, Kozhemiachenko, Ferguson, Majer) has produced parallel machinery the corpus would build on rather than reinvent.

## What the corpus has

- [Benchmark-5: epistemic Kripke](../examples/benchmark-5-epistemic-kripke.md) — three-agent paraconsistent epistemic frame, fully computed.
- [Multi-agent epistemic settling](../objects/multi-agent-epistemic-settling.md) — the object underlying the benchmark.
- [Modal necessity operator](../morphisms/modal-necessity-operator.md) and [modal possibility operator](../morphisms/modal-possibility-operator.md) — the corpus's modal operators, defined via the residuated structure on the bilattice.
- [Modal necessity basic properties](../theorems/modal-necessity-basic-properties.md) and [modal complexity bounds](../theorems/modal-complexity-bounds.md), [modal finite model property](../theorems/modal-finite-model-property.md) — the modal-calculus-on-bilattice-fibers theorems.
- [Modal non-normality theorem](../theorems/modal-non-normality.md) — the corpus's modal logic is not normal.
- [Twist-modal translation](../objects/twist-modal-translation.md) — translation into a calculus on the twist product.
- [Bilattice accessibility relation](../objects/bilattice-accessibility-relation.md) — the relational semantics ingredient.
- The [predication hyperdoctrine](../objects/predication-hyperdoctrine.md) with its **two parallel adjoint systems** ($\leq_k$ and $\leq_t$) — this is the structurally distinctive feature for multi-agent epistemic logic, since it gives two derived equality predicates and would correspond to two parallel notions of "knowledge agreement" between agents.
- The [strong-MLD machinery](../theorems/strong-mld-via-composed-duality.md) (sketch) — orbit-type classification that, in epistemic terms, classifies refined epistemic equivalence.

## What the public literature has that this question needs to read

A coordinated parallel research stream on paraconsistent / fuzzy / multi-valued modal and epistemic logics:

- **Bílková, Frittella, Kozhemiachenko 2022** — *Paraconsistent Gödel modal logic* ([HAL hal-03825253](https://hal.science/hal-03825253), [Springer chapter](https://link.springer.com/chapter/10.1007/978-3-031-10769-6_26)). Paraconsistent expansion of Gödel logic with De Morgan negation and modalities; Kripke semantics on frames with two relations $R^+$ and $R^-$ representing trust in affirmations and denials.
- **Bílková, Frittella, Kozhemiachenko 2023** — *Crisp bi-Gödel modal logic and its paraconsistent expansion* ([arXiv 2211.01882](https://arxiv.org/abs/2211.01882)).
- **Bílková, Frittella, Kozhemiachenko 2025** — *Fuzzy bi-Gödel modal logic and its paraconsistent relatives* ([Journal of Logic and Computation 35:2](https://academic.oup.com/logcom/article-abstract/35/2/exae011/7634382), [arXiv 2309.16250](https://arxiv.org/abs/2309.16250)). Establishes Kripke completeness for fuzzy bi-Gödel modal logic and its paraconsistent variant.
- **Bílková, Ferguson, Kozhemiachenko, *Tableaux for Epistemic Gödel Logic*** (PRIMA 2025). Multi-agent epistemic logic with degrees of plausibility, S5-like modalities. *Direct closest neighbor.*
- **Bílková, Ferguson, Kozhemiachenko, *Modal Logic for Reasoning About Uncertainty and Confusion*** (TARK 2025). Epistemic modal logic explicitly addressing inconsistency.
- **Bílková, Frittella, Kozhemiachenko, Majer, *Two-layered logics for probabilities and belief functions over Belnap–Dunn logic*** (Mathematical Structures in Computer Science, 2025).
- **Jung–Rivieccio, *Kripke semantics for modal bilattice logic*** ([paper](https://achimjungbham.github.io/pub/papers/Jung-Rivieccio-2013-Kripke-semantics-for-modal-bilattice-logic.pdf)) — the closest existing duality-and-Kripke-semantics paper for modal bilattice logic; the corpus's [Jung–Rivieccio duality theorem](../theorems/jung-rivieccio-duality.md) is the algebraic side, but Kripke semantics for the modal extension is the missing direct connection.
- **Goré, Postniece on bilattice-and-modal proof theory.**
- **BEAK** — *Bilattice logic of Epistemic Actions and Knowledge*; modal expansion of Belnap-Dunn four-valued logic for inconsistent / conflicting information. The closest *epistemic actions* parallel.
- **Fagin, Halpern, Moses, Vardi 1995** — *Reasoning About Knowledge* (already a corpus reference). Standard textbook for multi-agent epistemic logic (S5 axioms, common knowledge, distributed knowledge).
- **Baltag, Moss, Solecki on dynamic epistemic logic** — public-announcement variants and the dynamic axiomatization.
- **Belnap 1977** — *How a computer should think* (already a corpus reference). The foundational paraconsistent four-valued source.

The Bílková-Frittella-Kozhemiachenko line is the directly engageable parallel. Their machinery is *fuzzy* / Gödel-based, relational with $R^+/R^-$ split frames; the corpus's machinery is *bilattice* / twist-product-based, with the Jung–Rivieccio duality giving paired-Priestley spaces dual to fibers.

## The question

State and prove the bilattice K-axiom soundness and completeness theorem with respect to a class of paraconsistent multi-agent Kripke frames, in a way compatible with the corpus's predication-hyperdoctrine machinery and complementary to the Bílková-Frittella-Kozhemiachenko parallel program.

## Sub-questions

### (5a) Choose the K-axiom variant

The classical multi-agent S5 axioms are K, T, 4, 5. K alone is the *normal modal logic* axiom $\Box(\phi \to \psi) \to (\Box \phi \to \Box \psi)$. In the corpus's bilattice setting, several variants are candidates:

- **K-truth**: the truth-axis version, with $\to$ replaced by $\leq_t$-implication on the twist product.
- **K-knowledge**: the knowledge-axis version, with $\to$ replaced by $\leq_k$-implication.
- **K-fusion**: the residuated version using the twist-product fusion $\odot$ and right residual $\Rightarrow$.
- **K-bigraded**: a pair of axioms K-truth ⊕ K-knowledge, exploiting the [bigraded cohomology](../objects/bigraded-settling-cohomology.md) structure.

The [modal non-normality theorem](../theorems/modal-non-normality.md) already establishes that classical K fails in the corpus's setting; the question is which *modified K* the corpus's modal operators *do* satisfy. Sub-question 5a asks for a precise statement.

The Bílková-Frittella-Kozhemiachenko line's K-analog operates on Gödel-residuated implication; the corpus's twist-product residuation $\odot \dashv \Rightarrow$ is the structural analog. The K-fusion variant is the natural starting candidate.

### (5b) The class of paraconsistent multi-agent Kripke frames

Multi-agent Kripke frames in the classical setting are tuples $(W, R_1, \ldots, R_n, V)$ with worlds $W$, agent accessibility relations $R_i$, valuation $V$. The paraconsistent extension splits each $R_i$ into $R_i^+$ (positive accessibility) and $R_i^-$ (negative accessibility) per the Bílková et al pattern — or, equivalently in the corpus's framing, each $R_i$ is bilattice-valued.

Sub-question 5b asks: define the class of *bilattice-valued multi-agent Kripke frames* in the corpus's apparatus. Specifically:

- $W$ is an [entity set](../objects/entity-set.md).
- For each agent $i$, $R_i$ is a [predication valuation](../objects/predication-valuation.md) on $W \times W$, valued in $\mathbf{L}^{\bowtie}$.
- The valuation $V$ is a predication settling on a base whose entity set includes $W$.

The accessibility-relation-as-predication-valuation framing is natural; the corpus's [bilattice accessibility relation object](../objects/bilattice-accessibility-relation.md) starts this work. The remaining question is: what additional structure (frame conditions like reflexivity, transitivity, or their bilattice-paraconsistent analogs) defines the *class* relevant for soundness/completeness?

### (5c) Soundness direction

Soundness asks: every formula derivable from the chosen K-axioms is valid in every frame in the class. This is the easier direction in classical modal logic and should be similarly tractable here. The corpus's existing [modal necessity basic properties theorem](../theorems/modal-necessity-basic-properties.md) provides building blocks.

Sub-question 5c is concretely actionable: identify the K-axiom variant (5a) and frame class (5b), prove that derivability ⊆ validity. This is in the corpus's standard pattern of theorem-proving and should produce a `theorems/bilattice-k-axiom-soundness.md` at sketch then proved status.

### (5d) Completeness direction

Completeness asks: every formula valid in every frame in the class is K-axiom-derivable. Classically this is the harder direction, typically proved via canonical model construction. In the bilattice setting, the canonical model construction is non-obvious because of the four-valued / paraconsistent semantics.

The Bílková-Frittella-Kozhemiachenko 2025 fuzzy bi-Gödel paper establishes completeness for the fuzzy variant; their proof technique should transfer with adaptation. The structural question: does the corpus's twist-product framework give a *direct* completeness via Jung–Rivieccio duality (the canonical-frame construction is then the Priestley-dual-of-the-Lindenbaum-algebra, à la Goldblatt's approach), or does it require the relational-semantics-via-$R^+/R^-$ machinery?

Sub-question 5d asks: settle the proof technique, then prove completeness. This is the deepest sub-question; settling it would be a research-program-scale deliverable.

### (5e) Strong-MLD orbit-type as refined epistemic equivalence

The corpus's distinctive content beyond the Bílková line is the [strong-MLD orbit-type classification](../theorems/strong-mld-via-composed-duality.md): two settlings are MLD-equivalent iff they have the same orbit-type invariant under the Klein-four symmetry group plus entity-permutation stabilizers. In epistemic terms, two multi-agent Kripke frames being MLD-equivalent should mean: they represent the *same epistemic situation up to refined symmetry*.

Sub-question 5e asks: state the precise epistemic interpretation of MLD-equivalence in the multi-agent paraconsistent Kripke setting. Two frames $(W, R_i, V)$ and $(W', R_i', V')$ are MLD-equivalent iff [characterization in epistemic terms]. This is the corpus's novel contribution to the epistemic-logic literature: a strictly finer equivalence than the standard "elementary equivalence" of frames, refined by orbit-type.

### (5f) Two-axis epistemic split: knowledge-of-truth vs knowledge-of-knowledge

The corpus's predication hyperdoctrine has *two parallel adjoint systems*. In epistemic terms, this should give two derived equality predicates and correspondingly two notions of "agent-agreement":

- $\leq_t$-equality: agents agree on what is true.
- $\leq_k$-equality: agents agree on what is known.

These are *not the same* in a paraconsistent setting — two agents can know the same content while disagreeing about its truth-value (one knows $\phi$, the other knows $\neg\phi$, both are aware of the disagreement = $\top$-cell). Classical multi-agent epistemic logic collapses these because it's two-valued.

Sub-question 5f asks: state and prove a soundness/completeness theorem for the *bigraded* multi-agent K-axioms — separating $\Box^t$ (truth-knowledge) from $\Box^k$ (knowledge-knowledge), with the corresponding two-axis frame conditions.

This is the most ambitious sub-question and the one most clearly distinguished from the Bílková-Frittella-Kozhemiachenko parallel program (which has Gödel-fuzzy single-axis structure).

## What would settle the question

The K-axiom soundness/completeness theorem decomposes into a graduated set of deliverables:

1. **K-axiom statement** (sub-question 5a) — pick a variant and write down the formal axioms.
2. **Frame-class definition** (sub-question 5b) — bilattice-valued multi-agent Kripke frames with explicit conditions.
3. **Soundness theorem** (sub-question 5c) — proved.
4. **Completeness theorem** (sub-question 5d) — proved or characterized as obstruction.
5. **MLD-as-refined-equivalence theorem** (sub-question 5e) — the corpus's novel contribution.
6. **Two-axis bigraded extension** (sub-question 5f) — the structurally most ambitious deliverable.

Deliverables 1–3 are session-scale once 5a and 5b are decided. Deliverable 4 is research-program-scale. Deliverables 5–6 are research-program-scale and depend on 1–4.

## Why this question

The corpus's modal calculus on bilattice fibers and paraconsistent epistemic content is technically present but lacks a headline theorem. Stating the bilattice K-axiom soundness/completeness theorem:

- Connects the corpus to the active Bílková-Frittella-Kozhemiachenko research program, which has built parallel Gödel-fuzzy machinery and is the natural collaborative neighbor.
- Gives the corpus a precise multi-agent-epistemic-logic deliverable that the standard FHMV textbook framework lacks (paraconsistency, bilattice values, two-axis split).
- Establishes the corpus's strong-MLD machinery as a refined-epistemic-equivalence classifier — content the public epistemic-logic literature has nothing equivalent to.

What the corpus's machinery would give specifically:

- *Bilattice* K-axiom (truth, knowledge, fusion, bigraded variants) — distinct from the Bílková-Frittella-Kozhemiachenko Gödel-fuzzy K.
- *Two-axis* knowledge / truth split — the corpus's predication hyperdoctrine is uniquely positioned for this; no other framework has parallel adjoint systems on truth and knowledge orders.
- *MLD-orbit-type* refined equivalence — the corpus's substitution-tilings-style classification machinery applied to epistemic Kripke frames.

## Position in the program

This question is the formal statement of **Direction 4 of the [agentic-swarm-theory study plan](../narratives/toward-agentic-swarm-theory.md)** — *paraconsistent multi-agent epistemic logic*. The plan flagged it as having "the cleanest existing entry point (the benchmark) and the most-developed adjacent literature (standard epistemic logic)."

It depends on no other open question for setup. Sub-question 5a is the immediate next move — pick a K-axiom variant and write it down.

The natural order of work:

1. Read Bílková-Frittella-Kozhemiachenko 2025 (fuzzy bi-Gödel modal logic) and Bílková-Ferguson-Kozhemiachenko 2025 (Tableaux for Epistemic Gödel Logic, Modal Logic for Reasoning About Uncertainty and Confusion) in detail.
2. Read Jung-Rivieccio 2013 Kripke semantics for modal bilattice logic.
3. Settle sub-question 5a (K-axiom variant) with reference to the corpus's twist-product residuation.
4. Settle sub-question 5b (frame class) with reference to the corpus's bilattice-accessibility-relation.
5. State and prove soundness (sub-question 5c).
6. Attempt completeness (sub-question 5d) using either canonical-frame-via-Jung–Rivieccio or relational-semantics-via-$R^+/R^-$.
7. Once 1–6 are in place, state MLD-as-refined-equivalence (5e) and the bigraded extension (5f).

This question stays `open` until at least sub-question 5a is settled.

## Pass 1 — K-axiom variant: bigraded K = K-truth ⊕ K-knowledge (sub-task 5a)

> **Pass 1 result.** *The natural K-axiom for the corpus's bilattice modal logic is the bigraded K = K-truth ⊕ K-knowledge — a pair of single-axis K-axioms applied separately to the truth-axis residual ($\to_t$) and the knowledge-axis residual ($\to_k$), exploiting the [predication hyperdoctrine](../objects/predication-hyperdoctrine.md)'s two parallel adjoint systems.* This is structurally distinctive vs the Bílková-Frittella-Kozhemiachenko single-axis Gödel-residuated K — it doubles the modal apparatus, with K-truth handling truth-axis modal closure and K-knowledge handling knowledge-axis modal closure, both parameterized by the same modal operator $\Box$. The bigraded K-axiom is the corpus's distinctive contribution: no public paraconsistent modal logic has the two-axis modal-closure structure that the corpus's hyperdoctrine machinery provides natively.

### The four candidate K-axioms recapped

The classical K-axiom is $\Box(\phi \to \psi) \to (\Box \phi \to \Box \psi)$. For the corpus's bilattice, the implication $\to$ has multiple V-Cat-natural candidates:

1. **K-truth**: $\Box(\phi \to_t \psi) \to_t (\Box \phi \to_t \Box \psi)$, where $\to_t$ is the residual of $\wedge_t$ (truth-axis Heyting-like implication).
2. **K-knowledge**: $\Box(\phi \to_k \psi) \to_k (\Box \phi \to_k \Box \psi)$, where $\to_k$ is the residual of $\wedge_k$.
3. **K-fusion**: $\Box(\phi \Rightarrow \psi) \Rightarrow (\Box \phi \Rightarrow \Box \psi)$, where $\Rightarrow$ is the right residual of the [twist-product fusion](../morphisms/twist-product-fusion.md) $\odot$.
4. **K-bigraded**: a pair $(K_t, K_k)$ — both K-truth AND K-knowledge required.

### Why bigraded is the natural choice

The [predication hyperdoctrine](../objects/predication-hyperdoctrine.md) has *two parallel adjoint systems*: $\exists_f^k \dashv f^* \dashv \forall_f^k$ in the knowledge order AND $\exists_f^t \dashv f^* \dashv \forall_f^t$ in the truth order. The [@kelly-lack1997] property-like-ness theorem makes both of these *properties* of the underlying fibration, not added structure.

The modal operator $\Box$ in the corpus's [modal calculus on bilattice fibers](../objects/twist-modal-translation.md) is built from these adjoint systems. Its action on the bilattice respects *both* orders simultaneously, not just one.

A K-axiom involving only $\to_t$ (K-truth) ignores the knowledge-axis structure. A K-axiom involving only $\to_k$ ignores the truth-axis. The corpus's modal operator naturally interacts with both — so the natural K-axiom is the *bigraded* version that asserts the modal closure separately on each axis.

### The bigraded K-axiom: precise statement

For the corpus's bilattice modal calculus with modal operator $\Box$:

**K-truth axiom (K_t)**: For all formulas $\phi, \psi$:
$$\vdash \Box(\phi \to_t \psi) \to_t (\Box \phi \to_t \Box \psi).$$

**K-knowledge axiom (K_k)**: For all formulas $\phi, \psi$:
$$\vdash \Box(\phi \to_k \psi) \to_k (\Box \phi \to_k \Box \psi).$$

**Bigraded K**: $\{K_t, K_k\}$ — both axioms simultaneously.

A bilattice-modal frame is *bigraded-K-sound* iff every model on it validates both $K_t$ and $K_k$.

### Why bigraded K is structurally distinctive within the framework

The corpus's bigraded K is genuinely doubled across the bilattice's two orders: it has two K-axioms, K_t (truth-axis) and K_k (knowledge-axis), each using its order's own residual ($\to_t$ as the residual of $\wedge_t$, $\to_k$ as the residual of $\wedge_k$). This is a finer structural commitment than any K-axiom that uses only one of the bilattice's orders: two systems satisfying the same single-axis K can differ on bigraded K.

The bigrading is forced by the predication hyperdoctrine's two parallel adjoint systems (axiom (B1k) and (B1t)). Single-axis K commits to only one of the adjoint systems' modal closure; bigraded K commits to both, respecting the framework's full structure. By the property-like-ness of (B1) per [@kelly-lack1997], the two-adjoint-systems structure is itself a property of the underlying predication fibration — bigraded K therefore tracks a property of the framework, not added structure.

For positioning relative to single-axis Gödel modal logic, bi-Gödel modal logic, and other public-literature K-axiom variants, see the [bigraded common knowledge position narrative](../narratives/bigraded-common-knowledge-position.md).

### Why the K-fusion variant is *not* the right choice

K-fusion uses the residuated $\odot \dashv \Rightarrow$ pair from the [twist-product fusion](../morphisms/twist-product-fusion.md). This is the linear-logic-style modal axiom.

The [Frobenius-for-fusion-fails theorem](../theorems/frobenius-for-fusion-fails.md) (proved in the corpus) shows: $\leq_k$-Frobenius reciprocity for $\odot$ fails for three of the four predicate-category generator classes. This means the fusion-residual $\Rightarrow$ does *not* satisfy the modal-closure-style identity in the corpus's hyperdoctrine.

So K-fusion is not provable from the hyperdoctrine axioms — it's a stronger commitment that the corpus's structure does not naturally support. The bigraded K, by contrast, decomposes into two axioms each of which IS supported by the hyperdoctrine's two adjoint systems.

### Why the K-truth-only and K-knowledge-only variants are insufficient

K-truth alone: validated by frames where $\Box$ respects the truth-axis but not the knowledge-axis. Such frames exist (e.g., classical Kripke frames with bilattice values where $\Box$ acts trivially on the negative-evidence component). They miss the corpus's distinctive content.

K-knowledge alone: validated by frames where $\Box$ respects the knowledge-axis but not the truth-axis. Useful for *agent knowledge propagation* but not for *truth claims about agent knowledge*.

The bigraded K captures both: agents reason about both truth (what's the case) and knowledge (what other agents know) using the same modal operator, with both axes of bilattice content respected.

### Soundness intuition for bigraded K

For a *bilattice-valued multi-agent Kripke frame* $(W, R_1, \ldots, R_n, V)$ where each accessibility $R_i$ is bilattice-valued and the valuation $V$ is bilattice-valued:

- **K_t soundness**: in every model, if $\Box(\phi \to_t \psi)$ has truth-value $\geq_t$ "true" at world $w$, then $(\Box\phi \to_t \Box\psi)$ does too. This is the truth-axis modal closure.
- **K_k soundness**: same but with $\leq_k$ in place of $\leq_t$.

Both follow from the modal operator $\Box$ being defined component-wise: $\Box \phi$'s truth-value at $w$ is the V-meet over $w$-accessible worlds of $\phi$'s value. Truth-axis V-meet ($\wedge_t$) and knowledge-axis V-meet ($\wedge_k$) both satisfy the modal-closure identity in their respective orders.

### What Pass 1 settles

- **Sub-task 5a**: settled. The natural K-axiom for the corpus is bigraded K = K-truth ⊕ K-knowledge.
- **Structural source**: the predication hyperdoctrine's two parallel adjoint systems (axioms (B1k), (B1t)) directly support the bigraded K's two K-axioms.
- **K-fusion ruled out**: failed Frobenius for $\odot$ means the fusion-residual K-axiom isn't supported by the corpus's existing structure.

### What Pass 1 leaves open

- **Sub-task 5b (frame class)**: define the precise class of bilattice-valued multi-agent Kripke frames that bigraded K is sound on. Pass 2 territory.
- **Sub-task 5c (soundness theorem)**: prove bigraded K is sound on the chosen frame class. Pass 2 or Pass 3.
- **Sub-task 5d (completeness)**: harder — needs canonical-frame construction in the bilattice setting. Research-program-scale.
- **Sub-task 5e (MLD as refined equivalence)**: connection to corpus's strong-MLD machinery. Pass 4+ territory.

### Migration target

A theorem `theorems/bigraded-k-axiom-corpus-natural.md` (sketch) records Pass 1's structural argument that bigraded K is the corpus's natural K-axiom. The full soundness theorem `theorems/bigraded-k-axiom-soundness.md` will follow once the frame class (sub-task 5b) is defined.

## Pass 2 — Bigraded common knowledge: $C^t$ and $C^k$ as independent fixed points (sub-task 5f)

> **Pass 2 result.** *The bigraded K-axiom of Pass 1 elevates cleanly to a bigraded **common-knowledge** construction. Define per-axis everyone-knows operators $E^t \phi := \bigwedge_t^i \Box^t_i \phi$ and $E^k \phi := \bigwedge_k^i \Box^k_i \phi$, and per-axis common-knowledge fixed points $C^t \phi := \mathrm{gfp}_{\leq_t} \psi.\phi \wedge_t E^t \psi$ and $C^k \phi := \mathrm{gfp}_{\leq_k} \psi.\phi \wedge_k E^k \psi$. On benchmark-5, the two fixed points have **different bottoms** — $C^t p = (\mathbf{f}, \mathbf{f}, \mathbf{f})$ and $C^k p = (\bot, \bot, \bot)$ uniformly. This is the corpus's structurally distinctive contribution to the public common-knowledge literature.* Sub-task 5f is settled at the structural-statement level; soundness/completeness for the bigraded common-knowledge logic is downstream work.

### Setup: per-axis modal necessity, everyone-knows, common knowledge

For a [bilattice-valued multi-agent Kripke frame](../objects/bilattice-accessibility-relation.md) $(W, R_1, \ldots, R_n, V)$:

**Per-axis modal necessity.** For each agent $i$:
$$
(\Box^t_i u)_w := \textstyle\bigwedge_t \{R_i(w, w') \to_t u_{w'} : w' \in W\}, \qquad (\Box^k_i u)_w := \textstyle\bigwedge_k \{R_i(w, w') \to_k u_{w'} : w' \in W\}.
$$

**Per-axis everyone-knows.**
$$
E^t u := \textstyle\bigwedge_t^{\,i = 1, \ldots, n} \Box^t_i u, \qquad E^k u := \textstyle\bigwedge_k^{\,i = 1, \ldots, n} \Box^k_i u.
$$

**Per-axis common knowledge** (Knaster–Tarski greatest fixed point on the respective complete lattice):
$$
C^t \phi := \mathrm{gfp}_{\leq_t}\, \psi.\, \phi \wedge_t E^t \psi, \qquad C^k \phi := \mathrm{gfp}_{\leq_k}\, \psi.\, \phi \wedge_k E^k \psi.
$$

The KZ-diamond strict-commutation property (Pass 1 of the [KZ-diamond hierarchical swarm coordination question](kz-diamond-hierarchical-swarm-coordination.md)) makes the iteration order immaterial — the fixed point equals the limit $\bigwedge_n (E^\bullet)^n \phi$ in the respective order.

### Computational verification on benchmark-5

The benchmark-5 frame: 3 agents (Alice, Bob, Carol), 3 worlds ($w_1, w_2, w_3$), Boolean accessibility:
- Alice: $w_1 \sim w_2$ (cannot distinguish), $w_3$ isolated.
- Bob: $w_1 \sim w_3$ (cannot distinguish), $w_2$ isolated.
- Carol: identity.

Initial valuation: $v(w_1, p) = \mathbf{t}$, $v(w_2, p) = \mathbf{f}$, $v(w_3, p) = \top$ (paraconsistent witness).

Computed in `tools/predication_categories/examples/bigraded_common_knowledge.py`:

**Single-step modal necessity.** $\Box^t_i$ and $\Box^k_i$ already differ on at least one world per agent:

| Agent | $\Box^t p$ | $\Box^k p$ |
|---|---|---|
| Alice | $(\mathbf{f}, \mathbf{f}, \top)$ | $(\mathbf{f}, \mathbf{f}, \mathbf{t})$ |
| Bob | $(\top, \mathbf{f}, \top)$ | $(\top, \bot, \top)$ |
| Carol | $(\mathbf{t}, \mathbf{f}, \top)$ | $(\top, \bot, \mathbf{t})$ |

**Everyone-knows.** $E^t p = (\mathbf{f}, \mathbf{f}, \top)$, $E^k p = (\mathbf{f}, \bot, \mathbf{t})$ — divergence at every world.

**Common knowledge** (after iterating to fixed point):
- $C^t p = (\mathbf{f}, \mathbf{f}, \mathbf{f})$ — uniformly $\mathbf{f}$.
- $C^k p = (\bot, \bot, \bot)$ — uniformly $\bot$.

**Different bottoms entirely.** $C^t p$ collapses to truth-axis bottom ($\mathbf{f}$), $C^k p$ to knowledge-axis bottom ($\bot$). The two fixed points are not just different at one world — they are uniformly distinct across all of $W$.

### Why different bottoms?

In the bilattice $\mathbf{FOUR}$:
- Truth-axis meet: $\bot \wedge_t \top = \mathbf{f}$ (the two middle elements have truth-glb at the truth-bottom).
- Knowledge-axis meet: $\mathbf{t} \wedge_k \mathbf{f} = \bot$ (the two middle elements in $\leq_k$ have knowledge-glb at the knowledge-bottom).

Iterating the $E^t$ operator pulls everything toward $\mathbf{f}$ when the meet incorporates a $\top$-cell (because $\top$ in truth-meet collapses with anything but $\mathbf{t}$ to give $\mathbf{f}$). Iterating $E^k$ pulls everything toward $\bot$ when the meet incorporates a Boolean disagreement (because the knowledge-meet of incompatible Boolean values is $\bot$).

The benchmark-5 frame contains both $\top$-cells (at $w_3$) and Boolean disagreements (Alice's accessibility joins $w_1$ with $w_2$ where $p$ has different Boolean values). So both pulling-mechanisms fire, sending each fixed point to its own axis's bottom.

### Position relative to the public literature

For positioning relative to Halpern–Moses, FHMV, BEAK, Bílková–Frittella–Kozhemiachenko, and Gonczarowski–Moses 2024, see the [bigraded common knowledge position narrative](../narratives/bigraded-common-knowledge-position.md). The narrative records the structural relationships between the corpus's bigraded construction and these public lines without importing them into the theorem statement.

The corpus's bigraded common knowledge is the only framework with two independent common-knowledge fixed points on the same paraconsistent multi-agent frame, with explicitly computed divergence on a benchmark.

### What Pass 2 settles

- **Sub-task 5f (two-axis epistemic split)**: settled at the structural-statement level. The bigraded common-knowledge construction exists, has two independent fixed points, and computationally diverges on benchmark-5.
- **Connection to KZ-diamond Pass 1**: the strict commutation makes the per-axis common-knowledge construction structurally clean (no pseudo-coherence overhead).
- **Migration target deliverable**: [bigraded-common-knowledge theorem](../theorems/bigraded-common-knowledge.md) (sketch) records the construction; [kz-diamond-strict-commutation theorem](../theorems/kz-diamond-strict-commutation.md) (sketch) provides the underlying KZ infrastructure.

### What Pass 2 leaves open

- **Sub-task 5b (frame class for soundness/completeness)**: which frame conditions (paraconsistent S5-analog, etc.) define the relevant class. Pass 3+ territory.
- **Sub-task 5c (soundness theorem)**: prove the bigraded K-axioms (and the bigraded common-knowledge fixed-point equations) are sound on the chosen frame class. Pass 3+ territory.
- **Sub-task 5d (completeness theorem)**: research-program-scale; needs canonical-frame construction.
- **Sub-task 5e (MLD as refined epistemic equivalence)**: open, depends on completeness machinery.
- **Symbolic proof of Knaster–Tarski for $\mathbf{L}^\bowtie$**: the computational verification is in place; the symbolic proof is bookkeeping.

### Why the bottom-divergence matters for swarm coordination

The bigraded common-knowledge bottom-divergence has a direct interpretation in swarm coordination:

- $C^t p = \mathbf{f}$ at every world means: under truth-axis common-knowledge dynamics, the agents collectively *commit to falsity* — they decide that $p$ is not the case. This is the "consensus by majority truth-vote, with paraconsistent cells voting against the majority" outcome.
- $C^k p = \bot$ at every world means: under knowledge-axis common-knowledge dynamics, the agents collectively *commit to no-info* — they decide they cannot know whether $p$ holds because of disagreement. This is the "consensus by epistemic humility, where any disagreement collapses to suspended judgment" outcome.

These are different swarm-coordination strategies. The bigraded common-knowledge framework gives both as natural mathematical structures, where classical single-axis common knowledge can give only one (and arbitrarily, depending on the chosen value semantics).

### Migration target (Pass 2)

Two new theorem files in the corpus:

- [theorems/bigraded-common-knowledge.md](../theorems/bigraded-common-knowledge.md) (sketch) — the bigraded common-knowledge theorem with explicit divergence on benchmark-5.
- [theorems/kz-diamond-strict-commutation.md](../theorems/kz-diamond-strict-commutation.md) (sketch) — the KZ-diamond strict-commutation theorem from Pass 1 of the KZ-diamond question, now formally stated.

One new computational verification module:

- `tools/predication_categories/examples/bigraded_common_knowledge.py` — 6 tests, all passing. Verifies Knaster-Tarski existence, axis-collapse on Boolean frames, and divergence on benchmark-5.

The next pass (Pass 3) would either (a) extend to soundness on a precisely defined frame class (sub-task 5b/5c), or (b) explore the swarm-coordination interpretation of bottom-divergence in more depth on additional benchmarks.
