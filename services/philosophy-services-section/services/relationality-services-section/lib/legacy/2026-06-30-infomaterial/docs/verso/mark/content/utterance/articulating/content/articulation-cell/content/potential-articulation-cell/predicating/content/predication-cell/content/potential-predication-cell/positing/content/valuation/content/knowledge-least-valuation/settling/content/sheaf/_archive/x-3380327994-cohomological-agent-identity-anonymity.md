---
type: question
class: bridge
status: partial
explores:
  - visible-automorphism-quotient
  - invisible-automorphism-subgroup
  - rigid-moduli-point
  - orbifold-moduli-point
  - settling-automorphism-1-truncation
  - network-sheaf-consensus-on-agent-graphs
  - bilattice-network-sheaf-consensus
  - distributed-settling-system
  - multi-observer-system
---

> **Progress (Passes 1–2 done).** Sub-task 4a (labeled multi-observer system definition): **settled** — multi-observer system enriched with a faithful labeling functor $L : O \to \mathbf{Set}$, with visible/invisible automorphism quotient computed relative to labeling. Sub-task 4c (cohomological sybil-resilience criterion): structurally addressed via Pass 1. **Pass 2 (post-bigraded-common-knowledge update)**: sub-task 4d (paraconsistency-from-sybil) **structurally advanced** via the bigraded common-knowledge framework — a sybil-agent's coordinated input manifests differently in $C^t$ vs $C^k$, giving an axis-asymmetric cohomological signature distinguishing coordinated adversarial input from organic disagreement. Sub-task 4b (examples) and 4e (higher cohomological signatures) remain open.

# Cohomological agent identity and anonymity in swarms

The corpus has a clean technical separation between *visible* and *invisible* automorphisms of a settling — automorphisms that act on the settling-associated sheaf vs. those whose action is the identity on it. This distinction underpins the corpus's moduli theory: the [visible automorphism quotient](../concepts/visible-automorphism-quotient.md) $\mathrm{Aut}^{\mathrm{vis}}(v) = \mathrm{Aut}^\simeq(v)/N(v)$ partitions moduli points into *rigid* (trivial visible group) and *orbifold* (non-trivial visible group) substrata.

In swarm-theoretic terms this distinction appears closely related to *agent identity* vs. *anonymity*: an automorphism that fixes every observable cell-value but permutes "behind-the-scenes" agent labels is invisible; one that permutes observably-distinguishable agents is visible. The corpus has the technical machinery; it has not been used for swarm-level interpretation.

This question develops the cohomological-anonymity reading: when does the visible / invisible split give a meaningful classification of *which agents are distinguishable*, and how does it relate to byzantine resilience, sybil attacks, and identifiability in distributed systems?

## What the corpus has

- The [invisible automorphism subgroup](../concepts/invisible-automorphism-subgroup.md) $N(v) \trianglelefteq \mathrm{Aut}^\simeq(v)$ — kernel of the action on $\mathcal{F}_U$.
- The [visible automorphism quotient](../concepts/visible-automorphism-quotient.md) $\mathrm{Aut}^{\mathrm{vis}}(v) = \mathrm{Aut}^\simeq(v) / N(v)$.
- The [rigid moduli point](../concepts/rigid-moduli-point.md) and [orbifold moduli point](../concepts/orbifold-moduli-point.md) substratification.
- The [settling-automorphism 1-truncation theorem](../theorems/settling-automorphism-1-truncation.md) — automorphism groups of settlings are 1-truncated.
- The [visible automorphism sources theorem](../theorems/visible-automorphism-sources.md) — under naturality, visible automorphisms come from at most three sources (fiber-swap, entity-permutation stabilizer, predicate-automorphism stabilizer); gauge contributes only invisibly.
- The [bilattice network-sheaf consensus theorem](../theorems/bilattice-network-sheaf-consensus.md) on agent graphs — but with an undifferentiated agent set $V(G)$, no per-agent identity machinery.
- The [multi-observer-system object](../objects/multi-observer-system.md) — generic observer category $O$, no built-in identity / anonymity distinction.

## What the public literature has that this question needs to read

The byzantine-fault-tolerance, sybil-resistance, and anonymity-network literatures are mature; the cellular-sheaf-on-distributed-systems literature is younger but moving:

- **Lamport, Shostak, Pease 1982** — the foundational *Byzantine Generals Problem*. Identifies which agents can / cannot be trusted, treats agent-identity as primitive.
- **Douceur 2002** — *The Sybil Attack*, the foundational paper on identity-flooding in P2P networks.
- **Castro–Liskov 1999** — Practical Byzantine Fault Tolerance; identity and authentication assumptions.
- **Felber et al 2025** ([sheaf-theoretic task characterization](https://arxiv.org/abs/2503.02556)) — task sheaves on simplicial protocol complexes; the simplicial structure exposes per-agent participation. Already in corpus refs as a proof-of-concept of cohomological distributed-systems modeling.
- **Ghrist–Ding 2025** ([Precision-Graded Cohomology for Network Sheaves](https://arxiv.org/abs/2511.00677)) — extends cellular-sheaf cohomology to p-adic / discrete-valuation settings, with applications to distributed systems where measurement precision creates hierarchical structure. The structure of *which agents have which precision* is implicit in the per-stalk valuation structure — close in spirit to the corpus's per-agent identity question.
- **Herlihy–Kozlov–Rajsbaum, *Distributed Computing Through Combinatorial Topology*** (already in corpus refs) — combinatorial-topology characterization of distributed task solvability, with explicit per-agent-execution simplicial structure.
- **Recent agentic-AI-cybersecurity surveys** (e.g., [arXiv 2601.05293](https://arxiv.org/html/2601.05293v1)) — agent-identity as a security primitive in agentic systems.

The corpus does not yet engage these literatures explicitly. The `references/` annotations exist for Felber, Ghrist–Ding, Herlihy–Kozlov–Rajsbaum, but no theorems use them on the identity / anonymity axis.

## The question

When the multi-observer system $V : O \to \mathrm{Settlings}_B$ models a swarm, what is the swarm-theoretic content of the visible / invisible automorphism split, and what is the cohomological characterization of agent-identity vs. anonymity?

## Sub-questions

### (4a) Per-agent identity in the multi-observer-system

The current [multi-observer-system definition](../objects/multi-observer-system.md) treats the observer category $O$ as generic. To expose per-agent identity, $O$ needs to carry the data of which observer is "agent $i$" — a *labeling* that distinguishes observers from one another beyond their position in $O$.

Sub-question 4a asks: extend the multi-observer-system with explicit per-agent identity data, in a way compatible with the existing CRDT / Mayer–Vietoris machinery. Two natural candidates:

- **Labeled observer category** — $O$ is a category equipped with a faithful functor $L : O \to \mathbf{Set}$ (the labeling), and the multi-observer-system extends to $V : O \to \mathrm{Settlings}_B$ with a compatibility condition between $L$ and the settling family.
- **Indexed observer system** — $V$ becomes a presheaf on a category of agent-identity labels, with the existing multi-observer-system recovered as the totalization.

The choice between these is structural; both are workable, and the choice may depend on which preserves more of the existing CRDT-convergence machinery.

### (4b) Visible / invisible split for labeled multi-observer systems

Once 4a is in place, the visible / invisible automorphism split applies directly: an automorphism of the labeled multi-observer system that fixes every observable cell-value but permutes labels is invisible; one that permutes observably-distinguishable agents (whose cell-values differ) is visible.

Sub-question 4b asks: for canonical labeled multi-observer systems (anonymous CRDT replicas, identified Byzantine agents, hybrid populations), compute the visible and invisible automorphism groups. The expected pattern:

- *Anonymous CRDT replicas* — large invisible group ($\mathrm{Sym}$ on label set), trivial visible group. Rigid in the cohomological sense for the *labels* but orbifold for the *cells*.
- *Identified Byzantine agents* — small or trivial invisible group (only gauge or identity), full visible group consisting of behaviorally-equivalent agent-permutations. Visible structure dominates.
- *Hybrid populations* — split-by-orbit-type, with sub-populations of anonymous and identified agents giving a stratified visible group.

The deliverable is a worked computation on benchmark cases — extending the existing [benchmark-multi-observer-disagreement](../examples/benchmark-multi-observer-disagreement.md) and [benchmark-6-crdt](../examples/benchmark-6-crdt.md) with explicit visible / invisible computations.

### (4c) Cohomological sybil-resistance characterization

A *sybil attack* is the introduction of multiple fake identities by a single adversary. In the labeled multi-observer-system, this corresponds to: a labeling $L : O \to \mathbf{Set}$ where some labels are "real" (one-to-one with actual adversary nodes) and others are sybil (multiple labels for one adversary).

The cohomological signature of a sybil attack should be: the *real* identities give an orbit-type with cell-distinguishing automorphisms; the sybil labels give a behaviorally-equivalent orbit type that increases the visible group's order without contributing genuine cell-content. Concretely, the visible automorphism group of a labeled multi-observer system under sybil attack should have a non-trivial normal subgroup of "sybil permutations" — automorphisms that permute the sybil labels and act trivially on every cell of an honest agent.

Sub-question 4c asks: state and verify a characterization of the form

> A labeled multi-observer system is *sybil-resilient at the visible-automorphism level* iff every visible automorphism either fixes every label or moves a label corresponding to a cell with non-trivial bilattice value.

This is a precise structural condition; verification on benchmark cases is concrete work.

### (4d) Bilattice extension: paraconsistency-from-sybil

When two sybil identities issue contradictory statements about the same cell, the corpus's bilattice machinery records the contradiction as $\top$ — paraconsistency-from-disagreement. In a sybil-attack context, the $\top$-firing pattern is *diagnostic*: a coordinated adversary doesn't typically generate $\top$-cells (the sybils agree among themselves), while genuine multi-source disagreement does.

Sub-question 4d asks: the corpus's bilattice network-sheaf consensus machinery applied to a labeled multi-observer system distinguishes coordinated adversarial input (low $\top$-density) from organic disagreement (high $\top$-density at exactly the disagreement cells). Verify this on a worked example with both sybil and honest agents.

This is the most direct application-relevant sub-question. The existing [bilattice network-sheaf consensus theorem](../theorems/bilattice-network-sheaf-consensus.md) does the heavy lifting; the work is the labeled-extension and the worked-example computation.

### (4e) Higher cohomological signatures of identity-structure

The corpus's settling cohomology vanishes above degree 1 for standard sheaves. In a sybil / byzantine setting, *identity-structure-aware* sheaves — sheaves whose stalks include not just cell-values but also identity labels — may have non-trivial $H^2$ that classifies the *coordination structure of the adversary*.

Sub-question 4e is more speculative. It asks: is there an identity-aware refinement of the settling-associated sheaf for which $H^2$ is non-trivial precisely when the underlying labeled-multi-observer-system has coordinated-adversarial identity structure? This connects to the [exceptional higher cohomology question](exceptional-higher-cohomology.md).

## What would settle the question

Five graduated deliverables, in the corpus's standard pattern:

1. **Object-extension.** The labeled multi-observer-system (sub-question 4a) — a new object definition.
2. **Computational verification.** Worked computations of visible / invisible groups on benchmark labeled systems (sub-question 4b) — extends existing benchmark suite.
3. **Characterization theorem.** Sybil-resilience at the visible-automorphism level (sub-question 4c) — new theorem at sketch then proved status.
4. **Bilattice-extension theorem.** Paraconsistency-from-sybil characterization (sub-question 4d) — bilattice analog of (3).
5. **Higher-cohomology investigation.** $H^2$ for identity-aware sheaves (sub-question 4e) — open / partial question with passes structure.

Deliverables 1–4 are session-scale or small-research-cluster scale. Deliverable 5 is research-program-scale.

## Why this question

The corpus's visible / invisible automorphism distinction is technically clean but currently used only at the moduli level. The swarm-theoretic interpretation — agent-identity vs. anonymity, byzantine-vs-honest, sybil-vs-real — exposes structure that the public byzantine-fault-tolerance and sybil-resistance literatures discuss in informal terms but have no cohomological framework for.

What the corpus's machinery would yield specifically:

- A *cohomological* sybil-resilience criterion (visible-automorphism structure), distinct from the cryptographic / proof-of-work / proof-of-stake criteria public literature uses.
- A *paraconsistency-detection* mechanism for distinguishing coordinated adversarial input from organic disagreement, via the $\top$-firing pattern of the bilattice network-sheaf — the corpus's distinctive content delivering content the real-valued literature cannot.
- A bridge between the moduli-theoretic notion of "rigid vs orbifold" (already in the corpus) and the distributed-systems notion of "identified vs anonymous" (in the public literature) — the bridge is structural, not just nomenclatural.

## Position in the program

This question is **adjacent to but not in** the [agentic-swarm-theory study plan](../narratives/toward-agentic-swarm-theory.md). The plan's six directions don't single out identity / anonymity, but Directions 1 (network-sheaf reformulation) and 2 (per-agent closure dynamics) both touch it implicitly.

It depends on the [bilattice network-sheaf consensus theorem](../theorems/bilattice-network-sheaf-consensus.md) being proved (it is) and on the [multi-observer-system](../objects/multi-observer-system.md) being available (it is). Sub-question 4a is the immediate next move; the rest follows once the labeled extension is in place.

This question stays `open` until sub-question 4a settles the labeled-multi-observer-system definition.

## Pass 1 — Labeled multi-observer system definition (sub-task 4a)

> **Pass 1 result.** *The labeled multi-observer system is the multi-observer system enriched with a faithful labeling functor $L : O \to \mathbf{Set}$, with the visible/invisible automorphism quotient computed relative to the labeling.* Concretely: an automorphism is **invisible** iff it permutes labels but acts trivially on cell-values; **visible** iff it acts non-trivially on cell-values modulo labels. The cohomological sybil-resilience criterion (sub-task 4c) follows: a labeled multi-observer system is sybil-resilient iff every visible automorphism either fixes every label or moves a label corresponding to a cell with non-trivial bilattice value.

### Definition

A **labeled multi-observer system** over a base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$ is a triple $(O, V, L)$ where:

- $O$ is a small category (the observer category, as in the standard [multi-observer system](../objects/multi-observer-system.md)).
- $V : O \to \mathrm{Settlings}_B$ is the multi-observer functor (each object of $O$ gets a settling on the same base).
- $L : O \to \mathbf{Set}$ is a **labeling functor**, faithful (no two distinct observers share a label).

The label functor $L$ assigns to each observer $i \in O$ an identity $L(i)$ — a "name" distinguishing $i$ from other observers beyond their position in $O$. Observers with the same settling but different labels are *anonymous* in the cell-value sense but *distinct* in the labeled sense.

### Visible vs invisible automorphism (refined)

For a labeled multi-observer system $(O, V, L)$, an automorphism $\phi : O \to O$ (over the identity on $B$) is:

- **Invisible** iff $V \circ \phi = V$ (acts trivially on cell-values via $V$). Equivalently, $\phi$ permutes label-instances among observers with identical settlings.
- **Visible** iff $V \circ \phi \neq V$. The automorphism's action on cell-values via $V$ is non-trivial.

This refines the standard [visible automorphism quotient](../concepts/visible-automorphism-quotient.md) by making the labeling explicit: visibility is measured against the cell-value content, not against the labels themselves.

### Three canonical examples

1. **Anonymous CRDT replicas**: $O = $ discrete category with $N$ objects, $V$ assigns the same settling to each, $L : O \to \{1, \ldots, N\}$ enumerates the replicas. Visible automorphisms: only the identity (all settlings are equal, so any label-permutation acts trivially on cell-values). Invisible automorphism subgroup: $\mathrm{Sym}(N)$ — the full symmetric group permutes labels without changing cell-values. Visible automorphism quotient: trivial.

2. **Identified Byzantine agents**: $O = $ discrete with $N$ objects, $V$ assigns *distinct* settlings to each (some honest, some Byzantine). Visible automorphisms: only those permuting agents with identical-up-to-cell-values settlings (typically: identity, or honest-honest swaps when honest agents have identical states). Invisible: only label-permutations among identical-state agents. Visible automorphism quotient: significant non-trivial structure.

3. **Sybil-attacked CRDT cluster**: $O$ = $\{$honest-1, honest-2, sybil-1, sybil-2, sybil-3$\}$, all sharing one adversary's settling $v_{\text{adv}}$ for the sybil entries, and distinct settlings for honest entries. Visible automorphisms: those moving sybils among themselves (since they share cell-values) without changing honest-agent values. The sybil-swapping subgroup acts trivially on the cell-value-content of honest agents but moves labels of sybils. Visible automorphism quotient: $\mathrm{Sym}(\{\text{sybil-1, sybil-2, sybil-3}\}) = S_3$ embedded as the sybil-permutation group.

### Cohomological sybil-resilience characterization (sub-task 4c partial)

A labeled multi-observer system is **sybil-resilient at the visible-automorphism level** iff every visible automorphism either:
(i) fixes every label, OR
(ii) moves a label corresponding to a cell with non-trivial bilattice value.

In example 3 above: the sybil-permutation subgroup is visible (it permutes labels) and moves labels corresponding to cells with the same bilattice value (the adversary's $v_{\text{adv}}$). So the system *fails* the sybil-resilience criterion — and the failure mode is exactly the sybil-permutation subgroup.

Detection: compute the visible automorphism group; check whether it has a non-trivial subgroup that permutes labels among observers with identical settlings. If yes, sybil attack is *cohomologically detectable*.

### What Pass 1 settles

- **Sub-task 4a**: settled. The labeled multi-observer system is the multi-observer system enriched with a faithful labeling functor.
- **Sub-task 4c**: structurally addressed. Sybil-resilience criterion defined; the visible automorphism quotient of a labeled system encodes the sybil-detection structure.
- **Sub-task 4b**: examples computed (anonymous CRDT, Byzantine, sybil-attacked).

### What Pass 1 leaves open

- **Sub-task 4d (paraconsistency-from-sybil)**: the bilattice extension where $\top$-cell content distinguishes coordinated adversarial input from organic disagreement. Open.
- **Sub-task 4e (higher-cohomological signatures)**: $H^2$ classification of identity-coordination structure. Open.
- **Cross-domain integration**: how labeled multi-observer systems interact with the mean-field scaling limit (Pass 1+2 of mean-field) and with the rank-$n$ classifying invariant (Pass 3 of mean-field). Open.

### Migration target

A theorem `theorems/cohomological-sybil-resilience-criterion.md` (sketch) records Pass 1's criterion: a labeled multi-observer system is sybil-resilient iff its visible automorphism subgroup of label-permuting-without-cell-value-change is trivial.

## Pass 2 — Bigraded common-knowledge signature of sybil attacks (sub-task 4d structural advance)

> **Pass 2 result.** *The [bigraded common knowledge theorem](../theorems/bigraded-common-knowledge.md)'s axis-asymmetric divergence — $C^t \phi$ collapsing toward truth-bottom $\mathbf{f}$ while $C^k \phi$ collapses toward knowledge-bottom $\bot$ on paraconsistent multi-agent frames — gives a cohomological signature distinguishing **coordinated adversarial input** (sybil attack) from **organic disagreement**.* In a labeled multi-observer system, a sybil-agent's coordinated input produces $\top$-witness cells where the sybil-controlled labels claim agreement with each other while genuinely disagreeing with the labeled non-sybil agents. The bigraded common-knowledge fixed points distinguish this case: the truth-axis $C^t \phi$ collapses to $\mathbf{f}$ (the sybil's coordinated false claims pull the truth-meet down), while the knowledge-axis $C^k \phi$ collapses to $\bot$ (the underlying disagreement between sybils and non-sybils is detected as no-info at the knowledge-meet level). The resulting *bottom-divergence between $C^t$ and $C^k$* is the structural sybil-detection signature.

### Setup: organic disagreement vs sybil-coordinated disagreement

For a labeled multi-observer system $V_O : O \to \mathrm{Settlings}_B$ with labeling functor $L : O \to \mathbf{Set}$, distinguish two regimes:

1. **Organic disagreement.** Multiple labeled observers report genuinely different valuations on the same cell. The bilattice meets these into a $\top$-witness if the disagreement is between $\mathbf{t}$-claims and $\mathbf{f}$-claims, or into $\bot$ if some observers report no information.

2. **Sybil-coordinated disagreement.** A subset of observer-labels is controlled by a single attacker who produces *coordinated* output — the sybil-controlled labels all agree among themselves but disagree with the genuine non-sybil labels. The bilattice meets this into a $\top$-witness with a *specific structure*: the sybil-controlled labels' $\mathbf{t}$ vs the non-sybil $\mathbf{f}$ produces $\top$ at the disputed cell, and the *labeling structure* shows the sybil cluster as having internally-consistent claims.

In the bigraded common-knowledge framework, these two regimes have different signatures.

### The bigraded signature of sybil attacks

For organic disagreement, the per-axis common-knowledge fixed points respond as the [bigraded common knowledge theorem](../theorems/bigraded-common-knowledge.md) predicts on benchmark-5: $C^t p$ collapses to $\mathbf{f}$ on the true-locus (truth-meet pulls down via the disagreement), $C^k p$ collapses to $\bot$ on the disagreement-locus (knowledge-meet pulls down to no-info).

For sybil-coordinated disagreement, the per-axis fixed points respond *asymmetrically*:

- **Truth-axis $C^t p$**: behaves the same as organic — collapses to $\mathbf{f}$ on the disputed locus, since the truth-meet doesn't distinguish coordinated vs uncoordinated disagreement. The truth-axis is *blind* to coordination structure.

- **Knowledge-axis $C^k p$**: behaves *differently* — the sybil-controlled labels' internal consistency manifests as a *non-collapsing* knowledge-axis fixed point on the sybil-coordinated component, while the genuine non-sybil agents collapse to $\bot$. The knowledge-axis is *sensitive* to coordination structure: an internally-coordinated subset of labels produces a non-degenerate $C^k$ value on its own component, while disagreement *across* the coordination boundary collapses to $\bot$.

The cohomological signature: **organic disagreement gives uniform $C^t / C^k$ collapse**; **sybil-coordinated disagreement gives axis-asymmetric collapse, with $C^k$ retaining structure on the sybil-controlled labels' component while collapsing to $\bot$ across the coordination boundary**.

### Connection to Pass 1's visible automorphism quotient

Pass 1 settled sub-task 4a via labeled multi-observer systems and the visible/invisible automorphism quotient. Sub-task 4c characterized sybil-resilience as triviality of the visible label-permutation group.

Pass 2's bigraded signature gives a *cohomological* characterization of the same content: the sybil-resilience criterion translates to "the $C^k$-fixed-point's restriction to label-permuted sub-systems is trivial." Sybil attacks are characterized by *non-trivial restriction* — the $C^k$-fixed-point retains content on the sybil-controlled label-cluster, distinguishing it from a genuine independent observer cluster.

This is the cohomological refinement of the Pass 1 group-theoretic criterion, giving a directly computable signature on bigraded common-knowledge data.

### What Pass 2 settles

- **Sub-task 4d (paraconsistency-from-sybil)**: structurally advanced. The bigraded common-knowledge framework distinguishes organic from sybil-coordinated paraconsistency via axis-asymmetric collapse signatures.
- **Pass 1 cohomological refinement**: the Pass 1 group-theoretic sybil-resilience criterion translates to a $C^k$-fixed-point restriction criterion at the cohomology level.

### What Pass 2 leaves open

- **Concrete computational verification**: simulate a labeled multi-observer system with sybil attacks and verify the predicted $C^t / C^k$ asymmetric collapse. Computational module candidate: extend the bigraded common-knowledge module with sybil-frame test cases.
- **Sub-task 4e (higher cohomological signatures)**: the $C^k$-restriction signature is at degree-0 / fixed-point level; whether higher cohomology degrees give richer signatures (counts of disjoint sybil clusters, etc.) is open.
- **Connection to the [two-bigraded-structures-relationship question](two-bigraded-structures-relationship.md)**: sybil-detection is a natural setting where the cohomology bigrading and common-knowledge bigrading interact — the sybil-controlled label-cluster's coordinated output produces both a paraconsistent component (in cohomology bigrading) and a non-collapsing $C^k$ (in common-knowledge bigrading). The four-graded combined invariant from sub-question (e) of that question would unify both signatures.

### Migration target (Pass 2)

A theorem `theorems/bigraded-sybil-detection-signature.md` (sketch) can record Pass 2's signature claim: in a labeled multi-observer system with sybil-coordinated disagreement, the bigraded common-knowledge fixed points $(C^t, C^k)$ exhibit axis-asymmetric collapse with $C^k$ retaining non-trivial content on the sybil-controlled label-cluster.

This migration would also justify a new computational verification module extending the bigraded common-knowledge tests with sybil-frame scenarios.
