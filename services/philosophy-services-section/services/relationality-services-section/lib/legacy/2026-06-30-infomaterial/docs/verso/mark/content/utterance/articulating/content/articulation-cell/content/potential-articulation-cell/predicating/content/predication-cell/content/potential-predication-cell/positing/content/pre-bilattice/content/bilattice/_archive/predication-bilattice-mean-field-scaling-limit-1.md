---
type: question
class: bridge
status: partial
explores:
  - multi-observer-system
  - distributed-settling-system
  - predication-fiber-algebra
  - residuated-lattice
  - continuous-L-predication-settlings
  - continuous-valued-step-n-cohomological-rank
  - stochastic-settling
  - sznitman1991
---

> **Progress (Passes 1–4 complete).** Sub-task 1a (target category): settled — $\mathcal{V} = [0, 1]^{\bowtie}$ continuous bilattice, leveraging the Pass 1–8 q-enriched-aperiodic infrastructure. Sub-task 1b (paraconsistency persistence): settled positively — paraconsistency persists in the mean-field limit, unlike real-valued MFG. Sub-task 1c (graphon analog): structurally addressed; precise theorem open. Sub-task 1d (MF-OML polynomial complexity): structurally addressed via the rank-$n$ classifying invariant cross-domain bridge in Pass 3. **Pass 4 (post-bigraded-common-knowledge update)**: the bilattice mean-field limit is itself *bigraded*, with truth-axis and knowledge-axis mean-field equations evolving independently and converging to potentially-distinct fixed points; the benchmark-5 finite-$N$ bottom-divergence ($C^t p = (\mathbf{f},\mathbf{f},\mathbf{f})$ vs $C^k p = (\bot, \bot, \bot)$) is the finite shadow of this mean-field separation. Question status remains `partial`. Full closure requires formal Sznitman propagation-of-chaos proof at corpus rigor + sparse-graphon Fabian et al extension + game-theoretic primitives for MF-OML analog + Pass-4-conjecture verification on benchmark-5 large-$N$ extension.

# Bilattice mean-field and scaling-limit theory for multi-observer systems

The corpus's multi-observer / distributed-settling apparatus is purely finite. Direction 5 of the [agentic-swarm-theory plan](../narratives/toward-agentic-swarm-theory.md) names the scaling-limit extension as research-program-scale and does not pursue it. Meanwhile, the public mean-field-game (MFG) and graphon-MFG literatures have moved substantially in 2024–26 — large-population symmetric games, sparse-graph graphons via local weak convergence, polynomial-time RL for Nash equilibria, convex-duality for terminal-distribution shaping. The corpus's distinctive content (bilattice values, paraconsistent disagreement, $\leq_k$-monotone settling) sits orthogonally to all of this.

This question sets up the work needed to bring the scaling limit into the corpus.

## What the corpus has

- [Multi-observer system](../objects/multi-observer-system.md): functor $V : O \to \mathrm{Settlings}_B$ from a generic small observer category to settlings on a common base. Consensus is the limit; disagreement is $H^1$.
- [Distributed settling system](../objects/distributed-settling-system.md): finite presheaf-of-replicas with cellwise $\vee_k$-merge.
- [Stochastic settling](../objects/stochastic-settling.md) (object exists; little theorem-content built on it).
- The [continuous-$L$ predication settlings question](continuous-L-predication-settlings.md) — the open problem of replacing the discrete residuated lattice $\mathbf{L}$ with a continuous-valued analog.
- The [Sznitman 1991 reference annotation](../references/sznitman1991.md) — annotated, no theorem dependencies yet.
- Bilattice / d-frame value category, transferable through the limit if a transfer theorem can be stated.

## What the public literature has that this question needs to read

The mean-field / graphon-mean-field frontier has accumulated a body of machinery the corpus does not yet engage:

- **Sznitman 1991** — propagation-of-chaos for symmetric exchangeable interacting particle systems; the foundational scaling-limit theorem.
- **Carmona–Delarue, *Probabilistic Theory of Mean Field Games* (2018)** — the standard reference for analytical MFG.
- **MF-OML** ([Springer, 2025](https://link.springer.com/article/10.1007/s00245-025-10328-5)) — first fully-polynomial multi-agent RL algorithm with provable Nash-equilibrium convergence, via occupation measures.
- **Fabian et al, *Learning Mean Field Control on Sparse Graphs*** ([PMLR 2025; arXiv 2501.17079](https://arxiv.org/abs/2501.17079)) — extends graphon-MFC to power-law / sparse networks via local weak convergence; the structurally-relevant breakthrough on heterogeneity.
- **Aurell–Gomes 2025** — graphon convex-duality terminal-distribution shaping ([Springer J. Sys. Sci. Complexity](https://link.springer.com/article/10.1007/s11424-025-4507-7)).
- **Cui–Koeppl, *Learning Sparse Graphon Mean Field Games*** ([arXiv 2209.03880](https://arxiv.org/abs/2209.03880)) and the *Graphex* extension ([arXiv 2401.12686](https://arxiv.org/abs/2401.12686)).

These are the inputs. The math the corpus would do takes them as starting state, not as priority claims.

## The question

What is the natural scaling limit of a bilattice-valued multi-observer system as $|O| \to \infty$, and what limit theorem characterizes consensus, disagreement, and paraconsistency-from-disagreement in the limit?

## Sub-questions

### (1a) What ambient category hosts the limit?

The discrete residuated lattice $\mathbf{L}$ is the structural obstacle: pointwise $\vee_k$-merge of finitely many bilattice-valued valuations is well-defined, but the empirical-measure limit asks for an integral structure $\mathbf{L}$ does not natively carry. Three plausible target categories:

- **Continuous residuated lattices** — the unit-interval $[0, 1]$ as an integral commutative residuated lattice (with Łukasiewicz, Gödel, or product fusion). The twist product $[0, 1]^{\bowtie}$ is then a continuous distributive bilattice.
- **MV-algebras / Riesz MV-algebras** — Mundici's MV-algebra is the natural continuous Boolean analog; a Riesz-MV bilattice would carry both a continuous truth axis and a knowledge axis.
- **Lawvere-quantale enrichment** — the corpus's [Q-enriched cohomology](../objects/q-enriched-cohomology.md) machinery is already valued in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$. Extending to *probability-valued* $\mathcal{Q}$ — the unit-interval as a Lawvere quantale — gives a probabilistic bilattice limit naturally.

Sub-question 1a asks: which of these is the right target, or do they coincide structurally? A theorem of the form "the empirical-measure limit of bilattice-valued multi-observer systems is a Q-enriched continuous bilattice valuation" would settle this.

### (1b) Does paraconsistency-from-disagreement persist in the limit?

The finite multi-observer-disagreement benchmark exhibits $\top$-firings at off-diagonal swap-symmetric cells (two observers with bilattice-negated initial states; the join produces $\top$ at the disagreed cell). Whether this $\top$-firing persists in the $|O| \to \infty$ limit, or smooths into a continuous-valued "level of disagreement," determines whether the limit is genuinely paraconsistent or only paraconsistent-in-the-finite-fluctuations.

The bilattice analog of Sznitman's propagation-of-chaos would say: as $|O| \to \infty$ along a sequence of $\mathrm{Sym}(O)$-symmetric multi-observer systems, the empirical disagreement converges to a deterministic limiting valuation $v_\infty$ with explicit $\top$-cell support. The structural question is whether $v_\infty$'s $\top$-support is open, dense, full-measure, or has a non-trivial regime decomposition mirroring the four-regime dichotomy.

### (1c) Graphon-MFG analog on heterogeneous agent graphs

When $O$ is a graph rather than a discrete set, the appropriate scaling-limit object is a *graphon*: a measurable kernel $W : [0, 1]^2 \to [0, 1]$ encoding pairwise interaction strengths in the dense limit, or a graphex / sparse-graphon analog in the sparse limit per Fabian et al's local-weak-convergence framework. The corpus's [network-sheaf-consensus-on-agent-graphs theorem](../theorems/network-sheaf-consensus-on-agent-graphs.md) is finite-graph-only.

A bilattice-graphon mean-field theorem would state: there is a limiting object — a *bilattice graphon* $W_{\mathbf{B}} : [0, 1]^2 \to A$ valued in a continuous bilattice $A$ — such that the bilattice-network-sheaf consensus structure on a finite-graph approximation converges to a corresponding continuous structure on $W_{\mathbf{B}}$.

The Fabian sparse-graph result is the structurally-load-bearing input here: it shows the right dense / sparse split, and the local-weak-convergence framework is what would survive the bilattice extension.

### (1d) Polynomial-complexity bilattice analog of MF-OML

MF-OML achieves polynomial sample complexity for Nash equilibria of large symmetric games. The bilattice analog would be: polynomial sample complexity for *consensus-or-paraconsistency* in large symmetric multi-observer systems. Whether this is achievable depends on (1a) — without a continuous bilattice structure, occupation-measure techniques don't apply.

This sub-question is downstream of 1a. If 1a resolves to a continuous bilattice with measure-theoretic structure, MF-OML's machinery transfers; if 1a resolves to a strictly order-theoretic / fixed-point limit (Lawvere-Laplacian style), MF-OML doesn't transfer and the corpus would need its own complexity bound from the Tarski–Lawvere fixed-point side (linking back to [Pass 4 of the Hansen–Ghrist engagement question](hansen-ghrist-spectral-engagement.md)).

## What would settle the question

A scaling-limit theorem of the shape:

> **(Conjecture).** Let $(V_n : O_n \to \mathrm{Settlings}_B)_{n \in \mathbb{N}}$ be a $\mathrm{Sym}(O_n)$-symmetric sequence of bilattice-valued multi-observer systems with $|O_n| \to \infty$ and empirical-measure compatibility. Then $V_n$ converges in [a topology to be determined] to a limiting bilattice-valued *empirical settling* $V_\infty$ on a continuous bilattice $A_\infty$, and the consensus / paraconsistency invariants of $V_n$ converge to corresponding invariants of $V_\infty$.

The work to settle it decomposes into:

1. Establish the continuous-bilattice target category (sub-question 1a).
2. Define the empirical-settling object on the continuous bilattice (object-construction).
3. State and prove the convergence theorem (theorem-construction).
4. Verify on a worked example — typically a two-state or three-state bilattice with explicit graphon, computing the limit by hand.

Steps 1–2 are session-scale once the target category is chosen. Step 3 is research-program-scale. Step 4 requires the object machinery from 1–2 plus access to the Sznitman-style propagation-of-chaos technique.

## What this would yield beyond the literature

The public mean-field / graphon-MFG literature is uniformly real-valued (vector-space-valued, Hilbert-valued, or unit-interval-valued for probabilities). It does not host paraconsistent values, contradictory designation as a designated state, or two-axis (truth × knowledge) limit structure. The bilattice extension would:

- Give a limit theorem for systems where agents disagree fundamentally, with the disagreement persisting (not averaging out) into the limit.
- Reformulate "convergence to consensus" as a binary "convergence to consensus or to a paraconsistent equilibrium" — a richer asymptotic taxonomy than the public literature has.
- Establish whether the four-regime dichotomy persists in the limit; if it does, an aperiodic-regime mean-field theorem would classify limiting bilattice-valued systems by a continuous-bilattice analog of the aperiodic classifying invariant.

These are not "novel relative to publication priorities"; they are mathematical content the corpus's distinctive structure produces, that the real-valued literature cannot derive on its own.

## Position in the program

This question is the formal statement of **Direction 5 of the [agentic-swarm-theory study plan](../narratives/toward-agentic-swarm-theory.md)** — *mean-field / scaling limits of bilattice-valued swarms*. It depends on the [continuous-$L$ predication settlings question](continuous-L-predication-settlings.md) being substantively addressed first; without a continuous $\mathbf{L}$, the scaling limit has no target category.

The natural order of work:

1. Resolve sub-question 1a (target category) by reading Mundici on MV-algebras and the Lawvere-quantale literature; choose the working candidate.
2. Construct the continuous-bilattice object and the empirical-settling functor.
3. Read Sznitman 1991 in full, Fabian et al for the sparse-graph case, MF-OML for the complexity side.
4. Pass-by-pass analog of the Hansen–Ghrist engagement: reconstruct the public scaling-limit results in the corpus's framework, then state the bilattice extension.

This question stays `open` until a target category is chosen and the empirical-settling object is constructed.

## Pass 1 — Target category for the scaling limit (sub-task 1a)

> **Pass 1 result.** *The natural target category for the bilattice mean-field scaling limit is $\mathcal{V} = [0, 1]^{\bowtie}$ — the continuous bilattice, viewed as the **marginal projection** of the full empirical-measure space $\Delta(\mathbf{FOUR})$.* The full empirical measure (3-simplex of probability distributions over the four Belnap states) projects to $[0, 1]^2$ via expected-evidence coordinates; the projection is a continuous distributive bilattice that the corpus's [continuous-V step-n cohomological rank theorem](../theorems/continuous-valued-step-n-cohomological-rank.md) already covers. Pass 1 establishes that the continuous-V infrastructure built in [q-enriched-aperiodic-direct-limit-cohomology](q-enriched-aperiodic-direct-limit-cohomology.md) (Passes 1–8) is exactly the right target for this question's mean-field theorem.

### The empirical measure of $\mathrm{Sym}(O_N)$-symmetric multi-observer systems

For an $\mathrm{Sym}(O_N)$-symmetric multi-observer system $V_N : O_N \to \mathrm{Settlings}_B$ with $|O_N| = N$, the empirical-measure structure at each cell $(s, o) \in E \times E$ is:

$$\mu_N^{(s, o)} := \frac{1}{N} \sum_{i \in O_N} \delta_{V_N(i)(s, o)} \;\in\; \Delta(\mathbf{FOUR}).$$

This is a probability measure on the four Belnap states $\{\bot, \mathbf{t}, \mathbf{f}, \top\}$, parameterized by 4 non-negative reals summing to 1 — a 3-simplex.

For Sznitman-style propagation-of-chaos: as $N \to \infty$ along a $\mathrm{Sym}$-symmetric sequence with empirical-measure compatibility, $\mu_N^{(s, o)} \to \mu_\infty^{(s, o)} \in \Delta(\mathbf{FOUR})$ in weak topology.

So **the *full* limiting object is a $\Delta(\mathbf{FOUR})$-valued cell labeling**: $\mu_\infty : E \times E \to \Delta(\mathbf{FOUR})$.

### The marginal projection to $[0, 1]^{\bowtie}$

A measure $\mu \in \Delta(\mathbf{FOUR})$ projects to a pair of *expected evidence values*:

$$\pi(\mu) := \big(\mathbb{E}_\mu[a_+],\; \mathbb{E}_\mu[a_-]\big) \;\in\; [0, 1]^2.$$

For Belnap with twist-product coordinates ($\bot = (0,0), \mathbf{t} = (1,0), \mathbf{f} = (0,1), \top = (1,1)$):

- $\mathbb{E}_\mu[a_+] = \mu(\mathbf{t}) + \mu(\top)$ (probability that positive evidence is present)
- $\mathbb{E}_\mu[a_-] = \mu(\mathbf{f}) + \mu(\top)$ (probability that negative evidence is present)

The projection $\pi : \Delta(\mathbf{FOUR}) \to [0, 1]^2$ is:

- **Surjective**: every $(p_+, p_-) \in [0, 1]^2$ is achieved by some measure on Belnap.
- **Not injective**: many measures share the same marginal. The kernel $\pi^{-1}(p_+, p_-)$ is a 1-parameter family parameterized by $\mu(\top)$ (with constraints $\mu(\top) \in [\max(0, p_+ + p_- - 1), \min(p_+, p_-)]$).

The image $[0, 1]^2 = [0, 1]^{\bowtie}$ is the **continuous bilattice** with the natural continuous-twist-product structure. It carries the full bilattice operations $\wedge_t, \vee_t, \wedge_k, \vee_k, \sim$ pointwise.

### Why the marginal is the right target

For the mean-field scaling limit, the marginal $[0, 1]^{\bowtie}$-valued labeling captures the swarm's *aggregate evidence state* at each cell — what fraction of agents report positive evidence, what fraction report negative, and (implicitly) the disagreement rate $\mathbb{E}[a_+] + \mathbb{E}[a_-] - 1$ when both exceed individual values.

The full $\Delta(\mathbf{FOUR})$ labeling carries finer information (the joint distribution of $(a_+, a_-)$, not just their marginals), but for the bilattice-cohomology purposes the marginal suffices:

- **Consensus** corresponds to $(p_+, p_-) \in \{(0, 0), (1, 0), (0, 1)\}$ — agents agree on a single Belnap state.
- **Paraconsistency** corresponds to $(p_+, p_-)$ with $p_+ + p_- > 1$ — net excess agents reporting both, equivalent to non-zero $\mu(\top)$ in the marginal.
- **Disagreement** corresponds to $0 < p_+ < 1$ and $0 < p_- < 1$ — agents split between supporting and opposing.

The *bilattice cohomology* of the marginal $[0, 1]^{\bowtie}$-valued labeling captures all three of these structural features, which are the swarm-theoretic content of interest. The full $\Delta(\mathbf{FOUR})$ adds joint-distribution information (e.g., correlation between $a_+$ and $a_-$ within agents) that's beyond the bilattice apparatus.

### How $[0, 1]^{\bowtie}$ fits the corpus's continuous-V infrastructure

The continuous bilattice $[0, 1]^{\bowtie}$ is exactly the example targeted by the [continuous-valued step-$n$ cohomological rank theorem](../theorems/continuous-valued-step-n-cohomological-rank.md), Part 6b (idempotent V case). Specifically:

- $[0, 1]^{\bowtie}$ is the twist product of $[0, 1]$ Łukasiewicz over itself.
- Pass 1 of [q-enriched-aperiodic-direct-limit-cohomology question](q-enriched-aperiodic-direct-limit-cohomology.md) settled V-Cat AB5\* for Łukasiewicz $[0, 1]_L$.
- Pass 5/6 of the same question settled Lawvere-Laplacian $H^k_V$ for the constant V-sheaf case, producing classical-matching answers V-uniformly.
- Pass 7/8 sketched the aperiodic direct-limit theorem for V-Cat in the Lawvere-Laplacian framework.

So the **continuous-V infrastructure built for the foundational question is exactly the V-Cat target the mean-field question needs**. Sub-task 1a is settled positively: target = $[0, 1]^{\bowtie}$, leveraging the Łukasiewicz V-Cat AB5* and Lawvere-Laplacian framework.

### Three candidates revisited

The original sub-task 1a posed three candidates:

1. **Continuous residuated lattices** ($[0, 1]$ Łukasiewicz): selected.
2. **MV-algebras** (Mundici-style): subsumed by (1) — Łukasiewicz $[0, 1]_L$ *is* an MV-algebra; the Mundici equivalence with $\ell u$-groups provides an alternative concrete realization but doesn't add structure beyond what Łukasiewicz $[0, 1]_L$ already gives for our purposes.
3. **Lawvere-quantale enrichment** ($\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$): the Q-enriched cohomology framework that the corpus uses for $H^k$ computation — *this is the cohomological framework on top of the value-category target*. Compatible with (1).

The three candidates were not in tension; they layer:

- **Value category**: $\mathcal{V} = [0, 1]^{\bowtie}$ (continuous bilattice, candidate 1).
- **Cohomology framework**: Lawvere-Laplacian fixed-point cohomology (candidate 3 applied to candidate 1).
- **Algebraic structure**: Łukasiewicz MV-algebra (candidate 2, providing the residuated-lattice structure on each twist coordinate).

All three layer cleanly. Pass 1 settles 1a as: the answer is "all of them, layered."

### What Pass 1 settles

- **Target category for the scaling limit**: $\mathcal{V} = [0, 1]^{\bowtie}$ (continuous bilattice).
- **Cohomology framework**: Lawvere-Laplacian fixed-point on V-Cat (per [q-enriched-cohomology object](../objects/q-enriched-cohomology.md)).
- **Foundational support**: V-Cat AB5\* (Pass 1 of q-enriched question), continuous-V step-$n$ rank theorem (Parts 1-5 of [continuous-valued step-$n$ cohomological rank theorem](../theorems/continuous-valued-step-n-cohomological-rank.md)), Lawvere-Laplacian framework (Pass 5/6/8).
- **Marginal vs full**: the $\Delta(\mathbf{FOUR})$-valued labeling carries finer information; the $[0, 1]^{\bowtie}$ marginal captures the bilattice-cohomologically-relevant content (consensus, paraconsistency, disagreement).

### What Pass 1 leaves open

- **The convergence theorem** (sub-task 1c equivalent): does $\mu_N \to \mu_\infty$ in some appropriate topology? Pass 2 will state this.
- **Joint-distribution information lost in projection**: the marginal $[0, 1]^{\bowtie}$ ignores correlations between $(a_+, a_-)$. For applications needing finer joint structure (e.g., Bayesian analysis of agent correlation), a $\Delta(\mathbf{FOUR})$-valued framework is needed. This is sub-task 1b territory.
- **Polynomial-complexity bilattice MF-OML analog** (sub-task 1d): downstream of the convergence theorem.

### Migration target

When this question is fully settled (sub-tasks 1a–1d), the resolving theorem `theorems/bilattice-mean-field-scaling-limit.md` (sketch then proved) records: **for $\mathrm{Sym}(O_N)$-symmetric bilattice-valued multi-observer systems with $|O_N| \to \infty$ and empirical-measure compatibility, the empirical $[0, 1]^{\bowtie}$-valued labeling converges (in weak topology) to a continuous-bilattice-valued limiting labeling, with consensus / paraconsistency / disagreement content preserved.**

## Pass 2 — Bilattice propagation-of-chaos (sub-tasks 1b + 1c)

> **Pass 2 result.** *Sznitman-style propagation-of-chaos transfers cleanly to bilattice-valued multi-observer systems via the marginal projection $\pi : \Delta(\mathbf{FOUR}) \to [0, 1]^{\bowtie}$ established in Pass 1.* For $\mathrm{Sym}(O_N)$-symmetric sequences, the empirical $[0, 1]^{\bowtie}$-valued cell labeling converges weakly to a continuous-bilattice-valued limit, **and paraconsistency persists in the limit when the per-observer settlings have non-trivial $\top$-mass with positive limiting frequency.** This is the corpus's distinctive content: the limit is *not* the same as the public mean-field-game limit, because paraconsistent disagreement is a *designated feature* in the corpus's bilattice, not averaged away as it would be in real-valued MFG.

### Statement (sketch theorem)

**Theorem (bilattice propagation-of-chaos sketch).** *Let $(V_N : O_N \to \mathrm{Settlings}_B)_{N \in \mathbb{N}}$ be an $\mathrm{Sym}(O_N)$-symmetric sequence of bilattice-valued multi-observer systems with $|O_N| \to \infty$ and empirical-measure compatibility (i.e., joint $k$-marginals are asymptotically product-measure-like for every fixed $k$).*

*Then for each cell $(s, o) \in E \times E$, the empirical $\Delta(\mathbf{FOUR})$-valued measure*

$$\nu_N^{(s, o)} := \frac{1}{|O_N|} \sum_{i \in O_N} \delta_{V_N(i)(s, o)} \;\in\; \Delta(\mathbf{FOUR})$$

*converges weakly to a deterministic limit $\nu_\infty^{(s, o)} \in \Delta(\mathbf{FOUR})$ as $N \to \infty$. The corresponding marginal projection*

$$\pi(\nu_N^{(s, o)}) = (\mathbb{E}_{\nu_N}[a_+], \mathbb{E}_{\nu_N}[a_-]) \;\in\; [0, 1]^{\bowtie}$$

*converges to $\pi(\nu_\infty^{(s, o)}) \in [0, 1]^{\bowtie}$ in the standard topology on $[0, 1]^2$, defining a limiting **continuous-bilattice-valued cell labeling***

$$v_\infty : E \times E \to [0, 1]^{\bowtie}, \qquad v_\infty(s, o) := \pi(\nu_\infty^{(s, o)}).$$

*Furthermore, the bilattice operations $\wedge_t, \vee_t, \wedge_k, \vee_k, \sim$ on $[0, 1]^{\bowtie}$ are preserved under the limit: $\pi(\nu_N) \wedge_t \pi(\nu_N') \to \pi(\nu_\infty) \wedge_t \pi(\nu_\infty')$, etc.*

### Proof sketch

The proof is Sznitman's classical propagation-of-chaos argument applied componentwise per cell. The four key steps:

**Step 1: weak convergence of $\nu_N^{(s, o)}$.** For each fixed cell $(s, o)$, the sequence of empirical measures $\{\nu_N^{(s, o)}\}_N$ is a sequence of probability measures on the finite (4-element) space $\mathbf{FOUR}$. By compactness of $\Delta(\mathbf{FOUR})$ and the symmetry hypothesis, every subsequence has a further weakly-convergent subsequence. By empirical-measure compatibility (the propagation-of-chaos hypothesis), all subsequential limits coincide. Hence $\nu_N^{(s, o)} \to \nu_\infty^{(s, o)}$ weakly.

**Step 2: continuity of $\pi$.** The marginal projection $\pi : \Delta(\mathbf{FOUR}) \to [0, 1]^2$ is continuous (it's a linear map between simplices). Hence $\pi(\nu_N) \to \pi(\nu_\infty)$ in the standard topology.

**Step 3: bilattice-operation preservation.** The bilattice operations on $[0, 1]^{\bowtie}$ are continuous in the standard topology. So:
- $(p_+^N, p_-^N) \wedge_t (q_+^N, q_-^N) = (\min(p_+^N, q_+^N), \max(p_-^N, q_-^N)) \to (\min(p_+^\infty, q_+^\infty), \max(p_-^\infty, q_-^\infty))$.
- Same for $\vee_t, \wedge_k, \vee_k, \sim$ — all pointwise continuous on $[0, 1]^2$.

Hence the limiting labeling $v_\infty$ inherits the bilattice structure from the empirical sequence.

**Step 4: paraconsistency persistence (sub-task 1b).** $\nu_\infty^{(s, o)}$ has $\nu_\infty(\top) > 0$ iff a positive fraction of agents in the limit hold $\top$-values at cell $(s, o)$. Equivalently, $\pi(\nu_\infty)(s, o) = (p_+^\infty, p_-^\infty)$ satisfies $p_+^\infty + p_-^\infty > 1$ — net excess agents reporting both positive and negative evidence.

For $\mathrm{Sym}$-symmetric sequences with non-trivial initial $\top$-content (e.g., the corpus's [multi-observer-disagreement benchmark](../examples/benchmark-multi-observer-disagreement.md) extended to $N$ observers), paraconsistency persists: $\nu_\infty(\top)$ converges to a positive fraction reflecting the asymptotic disagreement rate.

The corpus's [bilattice network-sheaf consensus theorem](../theorems/bilattice-network-sheaf-consensus.md) (proved) gives, on the $N$-th finite multi-observer system, a paraconsistent-when-disagreement structure that the marginal $\pi(\nu_N)$ inherits and the limit preserves. $\square$

### What this theorem distinguishes from public MFG

The public mean-field-game literature is uniformly real-valued (vector-space-valued, Hilbert-valued, or unit-interval-valued for probabilities). The Sznitman propagation-of-chaos theorem says: empirical measures converge to deterministic limits.

**For real-valued state spaces, "disagreement" is a transient fluctuation that averages out in the limit.** The mean-field limit is a deterministic function of position; agents don't "disagree with themselves" in the limit because the state space doesn't host disagreement as a designated state.

**For the corpus's bilattice state spaces**, $\top$ is a *designated state*, not a fluctuation. The limit measure $\nu_\infty$ can have $\nu_\infty(\top) > 0$ — a positive fraction of agents hold contradictory states in the limit. The marginal projection $\pi(\nu_\infty)$ then has $p_+^\infty + p_-^\infty > 1$, encoding *asymptotic paraconsistency*.

This is the corpus's distinctive content: the bilattice mean-field limit hosts a richer asymptotic taxonomy than the real-valued case — consensus, disagreement, paraconsistent equilibria all distinguishable in the limit's marginal structure.

### Sub-task 1c — graphon analog on heterogeneous agent graphs

When $O_N$ is a graph (not a discrete set), the limiting structure becomes a *bilattice graphon*: a measurable kernel $W : [0, 1]^2 \to [0, 1]^{\bowtie}$ encoding both the graph topology and the per-pair bilattice value in the dense $|O_N| \to \infty$ limit.

The Fabian et al sparse-graph extension ([arXiv 2501.17079](https://arxiv.org/abs/2501.17079)) gives the structurally-relevant local-weak-convergence framework for sparse graphons. The bilattice analog: a *sparse bilattice graphon* on a power-law network has the bilattice mean-field structure with sparse interaction patterns.

For Pass 2, the structural framework is in place; the precise statement of bilattice-graphon-mean-field requires extending the propagation-of-chaos argument to graph-indexed sequences, which is more delicate. **This is the natural Pass 3 content.**

### Connection to the corpus's existing distributed-systems theorems

For $|O_N|$ finite, the corpus's [bilattice network-sheaf consensus theorem](../theorems/bilattice-network-sheaf-consensus.md) (proved, 6 claims) gives:

1. Consensus space $\Gamma = \lim V$ is the bilattice's V-Cat limit.
2. Disagreement is captured by $H^1$ obstruction.
3. Coordination-freeness via Mayer–Vietoris vanishing.
4. CRDT-merge-convergence (corpus's CRDT theorem applied).
5. Higher-degree vanishing.
6. Paraconsistency-from-disagreement at $\top$-witness cells.

Pass 2's mean-field theorem extends this to the limiting case: as $|O_N| \to \infty$, claims 1, 4, 6 persist (consensus, CRDT-merge, paraconsistency); claims 2, 3, 5 acquire continuum-valued analogs via the marginal-bilattice structure.

### What Pass 2 settles

- **Sub-task 1b (paraconsistency in the limit)**: settled positively. Paraconsistency persists in the limit when initial $\top$-mass is positive; this is the corpus's distinctive content vs real-valued MFG.
- **Sub-task 1c (graphon analog) at the structural level**: bilattice graphons $W : [0, 1]^2 \to [0, 1]^{\bowtie}$ are the natural target; precise convergence theorem is Pass 3 territory.
- **The bilattice propagation-of-chaos theorem** (sketch): stated explicitly with proof sketch.

### What Pass 2 leaves open

- **The graphon-mean-field convergence theorem** (sub-task 1c precise statement): pass 3.
- **Polynomial sample complexity** (sub-task 1d MF-OML analog): pass 3.
- **The full $\Delta(\mathbf{FOUR})$-valued limit** (vs marginal projection): the marginal suffices for bilattice cohomology, but joint-distribution-structure analyses need the full simplex-valued labeling. Open downstream.

### Migration target

When Passes 1–3 are complete and the structural framework is verified, the resolving theorem `theorems/bilattice-propagation-of-chaos.md` (sketch then proved) records the Pass 2 statement formally. Cross-references: corpus's bilattice network-sheaf consensus theorem, continuous-V step-n cohomological rank theorem, q-enriched-aperiodic-direct-limit-cohomology theorem.

## Pass 3 — Substitution-shaped mean-field limits and the rank-$n$ classifying invariant

> **Pass 3 result.** *For aperiodic substitution-shaped multi-observer systems (where each observer's settling is generated by a primitive step-$n$ substitution rule with shared substitution matrix $M$), the bilattice mean-field limit's classifying invariant is precisely the rank-$n$ continuous-V step-$n$ classifying invariant of the new theorem.* This is a triple cross-domain result, connecting: (i) the bilattice mean-field scaling limit (Pass 1+2), (ii) the [continuous-valued step-$n$ cohomological rank theorem](../theorems/continuous-valued-step-n-cohomological-rank.md), and (iii) the [aperiodic-swarm-classification question](aperiodic-swarm-classification.md). The corpus's distinctive content — paraconsistent disagreement classified by step-$n$ Pisot eigenvalue — extends to the asymptotic mean-field regime.

### Setup: substitution-shaped multi-observer systems

A **substitution-shaped multi-observer system** is a multi-observer system $V_N : O_N \to \mathrm{Settlings}_B$ where:

- Each observer $i \in O_N$ has a settling $V_N(i) = v_{\mathcal{S}, w_i}$ generated by the same primitive step-$n$ [substitution rule $\mathcal{S}$](../objects/step-n-substitution-rule.md) on alphabet of size $n$.
- Per-observer letter weights $w_i \in \mathbf{FOUR}^n$ are drawn from an exchangeable initial distribution $\rho_0 \in \Delta(\mathbf{FOUR}^n)$.
- The substitution matrix $M$ is shared across observers; it determines the *structural* dynamics. Per-observer weights determine the *content* contributed at each cell-substitution event.

This setup is the natural mean-field analog of the corpus's existing single-observer aperiodic settling: many observers each running the same substitution dynamics, with random initial weights.

### The mean-field limit's structure

By Pass 2's bilattice propagation-of-chaos:

- Each cell $(s, o) \in E \times E$ has a $\Delta(\mathbf{FOUR})$-valued limiting empirical measure $\nu_\infty^{(s, o)}$.
- The marginal projection $\pi(\nu_\infty^{(s, o)}) \in [0, 1]^{\bowtie}$ gives a continuous-bilattice cell labeling $v_\infty : E \times E \to [0, 1]^{\bowtie}$.

For substitution-shaped systems, the limiting labeling has additional structure: $v_\infty$ is a $[0, 1]^{\bowtie}$-weighted version of the substitution settling, with weights given by the *expected per-letter content* under $\rho_0$.

Specifically: for substitution rule $\mathcal{S}$ with letters $\{a_1, \ldots, a_n\}$, define expected weights:

$$\bar{w}_j := \mathbb{E}_{w \sim \rho_0}[w_j] \;\in\; [0, 1]^{\bowtie}, \qquad j = 1, \ldots, n.$$

These are the *mean-field weights* — the asymptotic average per-letter content across the agent population.

### Pass 3 main claim

**Claim (Pass 3, sketch).** *For an aperiodic substitution-shaped multi-observer system with limiting weights $\bar{w} = (\bar{w}_1, \ldots, \bar{w}_n) \in ([0, 1]^{\bowtie})^n$, the limiting cell labeling $v_\infty$ is exactly the $\bar{w}$-weighted continuous-V lift $v_{\mathcal{S}}^{([0, 1]^{\bowtie}, \bar{w})}$ from the [continuous-valued step-$n$ cohomological rank theorem](../theorems/continuous-valued-step-n-cohomological-rank.md). Hence the mean-field limit's classifying invariant is exactly the rank-$n$ continuous-V step-$n$ classifying invariant:*

$$\mathrm{cl\text{-}inv}^{(n)}_{[0, 1]^{\bowtie}}(v_\infty) \;\cong\; ([0, 1]^{\bowtie})^n \qquad \text{(unimodular } M, \text{ tropical-rank-preserving } \bar{w}\text{)}.$$

### Why the claim holds (proof sketch)

The proof has three structural pieces:

**Step 1: marginal-projection commutes with substitution dynamics.** The substitution rule $\mathcal{S}$ acts on each observer's settling $v_{\mathcal{S}, w_i}$ by the substitution endomorphism — a specific cell-by-cell update. The marginal projection $\pi$ commutes with this:

$$\pi\big(\nu_N \circ \sigma^*\big) = \sigma^*\big(\pi(\nu_N)\big)$$

because $\pi$ is linear (intertwines with the bilattice-valued cell update).

**Step 2: limiting labeling is the expected-weighted substitution settling.** As $N \to \infty$, the empirical mean weights $\bar{w}_j^N := \frac{1}{N} \sum_i w_{i, j}$ converge to $\bar{w}_j = \mathbb{E}_{\rho_0}[w_j]$ by the law of large numbers (extended to bilattice values via the corpus's [stochastic settling object](../objects/stochastic-settling.md)).

The $\bar{w}^N$-weighted substitution settling $v_{\mathcal{S}}^{(B, \bar{w}^N)}$ converges to $v_{\mathcal{S}}^{(B, \bar{w})}$ by continuity of the substitution-endomorphism action in weights.

**Step 3: classifying invariant via continuous-V step-n theorem.** Apply the [continuous-valued step-$n$ cohomological rank theorem](../theorems/continuous-valued-step-n-cohomological-rank.md), Parts 4–6:

- *Part 4*: post-shift-quotient classifying invariant is a free $[0, 1]^{\bowtie}$-module of rank exactly $n$, with generators corresponding to the $n$ substitution letters.
- *Part 5*: substitution endomorphism is the weighted matrix $M_{\bar{w}}$ with $(M_{\bar{w}})_{ij} = M_{ij} \cdot \bar{w}_j$.
- *Part 6b*: for unimodular $M$ + tropical-rank-preserving $\bar{w}$ (e.g., Fibonacci with $\bar{w}_a > \bar{w}_b$), rank-$n$ holds; otherwise rank may drop tropically (Pass 3 of [q-enriched-aperiodic question](q-enriched-aperiodic-direct-limit-cohomology.md)).

Hence the mean-field limit's classifying invariant equals the rank-$n$ continuous-V step-$n$ invariant of the expected-weighted substitution settling. $\square$

### What this gives: a swarm-research bridge

The Pass 3 claim is **the structural bridge between**:

1. **Bilattice mean-field scaling-limit theory** (this question's main subject).
2. **The continuous-V step-$n$ cohomological rank theorem** (foundational corpus theorem we built, sketch).
3. **Aperiodic-swarm classification** (the [aperiodic-swarm-classification question](aperiodic-swarm-classification.md)).

In one sentence: **the corpus's continuous-V step-$n$ machinery classifies the asymptotic behavior of substitution-shaped agent swarms via the rank-$n$ Pisot eigenvalue of the substitution matrix, with paraconsistent disagreement preserved in the mean-field limit.**

### Concrete example: Fibonacci-shaped mean-field swarm

For a Fibonacci-shaped multi-observer system ($\mathcal{S} = \{a \mapsto ab, b \mapsto a\}$, $M = \begin{pmatrix} 1 & 1 \\ 1 & 0 \end{pmatrix}$) with mean weights $(\bar{w}_a, \bar{w}_b) \in ([0, 1]^{\bowtie})^2$:

1. **Mean-field limit**: $v_\infty$ is the $\bar{w}$-weighted Fibonacci substitution settling on $[0, 1]^{\bowtie}$.
2. **Classifying invariant rank**: 2 if $\bar{w}_a > \bar{w}_b$ (tropical-rank-preserving); 1 if $\bar{w}_a \leq \bar{w}_b$ (rank-collapse per Pass 3 of q-enriched question).
3. **Pisot growth rate**: the dominant eigenvalue of $M_{\bar{w}}$, which is $\phi = (1 + \sqrt{5})/2 \approx 1.618$ in the bilattice case ($\bar{w}_a = \bar{w}_b = 1$) and a $[0, 1]^{\bowtie}$-graded analog otherwise.
4. **Paraconsistency rate**: $\bar{w}_a + \bar{w}_b - 1$ excess at cells with $\top$-content (where both positive and negative evidence are reported by an asymptotically positive fraction of agents).

The corpus's existing Fibonacci [benchmark-1-fibonacci.md](../examples/benchmark-1-fibonacci.md) (proved end-to-end) gives the bilattice-case results; Pass 3's claim extends them to the mean-field regime with $[0, 1]^{\bowtie}$-valued weights.

### Public-literature comparison

The public mean-field-game literature gives:

- *MFG without internal disagreement*: Lasry-Lions, Carmona-Delarue. Real-valued state spaces; agents converge to a deterministic mean-field strategy.
- *Graphon MFG*: Cui-Koeppl, Fabian et al. Heterogeneous interaction patterns; still real-valued.
- *MF-OML*: polynomial-time RL for Nash equilibria. Real-valued.

**None of these have**:

- *Paraconsistent equilibria* — limiting states where agents persistently disagree as a designated state.
- *Substitution-shaped swarm protocols with cohomological classification* — Pisot eigenvalues classifying coordination structure.
- *Bilattice-graded mean-field limits* — the corpus's twist-product structure on $[0, 1]^{\bowtie}$ encodes simultaneous truth-axis and knowledge-axis information that real-valued MFG collapses to a single axis.

Pass 3's claim is precisely the corpus's distinctive content brought into the mean-field regime.

### What Pass 3 settles

- **The cross-domain bridge**: the rank-$n$ classifying invariant of the [continuous-V step-$n$ theorem](../theorems/continuous-valued-step-n-cohomological-rank.md) is the mean-field-limit invariant of substitution-shaped multi-observer systems.
- **Sub-task 1d (MF-OML analog) at the structural level**: the bilattice mean-field's polynomial-complexity content lives in the rank-$n$ classifying invariant; specifically, computing $\mathrm{cl\text{-}inv}^{(n)}_{[0, 1]^{\bowtie}}$ is polynomial in $n$ and the substitution matrix size, reusing the [`tools/predication_categories/examples/tropical_v_linear_independence.py`](../tools/predication_categories/examples/tropical_v_linear_independence.py) machinery.
- **Aperiodic-swarm-classification interpretation** (sub-question 3c of that question): the rank-$n$ classifying invariant *measures*, in swarm-theoretic terms, **the asymptotic per-letter expected content under the agent population's initial-distribution**. This is a concrete swarm-theoretic interpretation of what was previously open.

### What Pass 3 leaves open

- **The full proof of bilattice propagation-of-chaos** at corpus rigor: Pass 2's argument is structural but the formal Sznitman-style argument needs careful verification with bilattice-valued empirical measures.
- **Polynomial sample complexity for Nash-equilibrium analog**: requires game-theoretic primitives the corpus doesn't have (see [utility-driven-closure-dynamics question](utility-driven-closure-dynamics.md)). Cross-references to that question would need to be developed.
- **Sparse-graphon bilattice mean-field**: Fabian et al sparse-graph extension applied to bilattice values. Open.

### What Passes 1–3 collectively establish

1. **Target category for bilattice mean-field scaling**: $[0, 1]^{\bowtie}$ continuous bilattice.
2. **Propagation-of-chaos analog**: bilattice empirical measures converge to deterministic continuous-bilattice-valued limits.
3. **Paraconsistency persists in the limit**: the corpus's distinctive content survives mean-field scaling, unlike real-valued MFG.
4. **Substitution-shaped systems classified by rank-$n$ invariant**: the cross-domain bridge to the continuous-V step-$n$ theorem.
5. **Pisot eigenvalues control asymptotic growth**: in the bilattice mean-field regime, the substitution's Pisot eigenvalue measures the rate at which content propagates.

These together substantially settle the question's main question: *what is the natural scaling limit of a bilattice-valued multi-observer system, and what limit theorem characterizes consensus, disagreement, paraconsistency-from-disagreement?*

Answer: $[0, 1]^{\bowtie}$-valued empirical labeling, propagation-of-chaos preserves bilattice operations, paraconsistency persists, and substitution-shaped swarms are classified by rank-$n$ continuous-V step-$n$ invariants.

### Status of the question

After Passes 1–3, the question has:

- Sub-task 1a: **settled** (Pass 1).
- Sub-task 1b: **settled positively** (Pass 2 — paraconsistency persists).
- Sub-task 1c (graphon analog): **structurally addressed**, precise theorem open.
- Sub-task 1d (MF-OML polynomial complexity): **structurally addressed via Pass 3**; precise theorem requires utility-driven dynamics.

The question can move from `open` to `partial` with three substantive passes done. Full closure requires:

- Formal Sznitman propagation-of-chaos proof at corpus rigor.
- Sparse-graphon bilattice extension (Fabian et al engagement).
- Game-theoretic primitives for MF-OML analog (depends on [utility-driven-closure-dynamics question](utility-driven-closure-dynamics.md)).
- Pass 4's bigraded mean-field conjecture verified at large-$N$ — see Pass 4 below.

## Pass 4 — Bigraded structure of the mean-field limit: $C^t_\infty$ and $C^k_\infty$ as independent corpus consensus operators

> **Pass 4 result.** *The bilattice mean-field limit, set up by Passes 1–3 in the corpus's continuous-V apparatus, is itself bigraded along the [predication hyperdoctrine](../objects/predication-hyperdoctrine.md)'s two parallel adjoint systems: the truth-axis and knowledge-axis [bigraded common-knowledge fixed points](../theorems/bigraded-common-knowledge.md) lift to two parallel large-$N$ consensus operators $C^t_\infty$ and $C^k_\infty$ that converge independently, by the [KZ-diamond strict commutation theorem](../theorems/kz-diamond-strict-commutation.md). For substitution-shaped multi-observer systems (Pass 3's setting), this gives two parallel rank-$n$ [classifying invariants](../objects/step-n-classifying-invariant.md) — one per bilattice order — with axis-collapse matching the bigraded common-knowledge axis-collapse criterion. The finite-$N$ bigraded-common-knowledge bottom-divergence on benchmark-5 is the structural shadow of this large-$N$ separation.*

### Setup: the two finite-$N$ consensus operators

Pass 1 of the [bilattice K-axiom multi-agent epistemic question](bilattice-k-axiom-multi-agent-epistemic.md) introduced the *bigraded K-axiom* (K-truth ⊕ K-knowledge) — two parallel modal-closure axioms, one per bilattice order. Pass 2 of the same question (the [bigraded common knowledge theorem](../theorems/bigraded-common-knowledge.md)) elevated this to the common-knowledge fixed-point level: $C^t \phi$ and $C^k \phi$ as independent greatest fixed points of the per-axis everyone-knows operator.

For a finite-$N$ bilattice-valued multi-observer system $V_N : O_N \to \mathrm{Settlings}_B$, the per-axis consensus operators are:

$$\mathrm{Cons}^t_N(\phi) := \mathrm{gfp}_{\leq_t}\, \psi.\, \phi \wedge_t E^t_N \psi, \qquad \mathrm{Cons}^k_N(\phi) := \mathrm{gfp}_{\leq_k}\, \psi.\, \phi \wedge_k E^k_N \psi,$$

where $E^t_N, E^k_N$ are the $N$-observer per-axis everyone-knows operators (truth-axis meet over observers' modal-necessity, knowledge-axis meet over observers' modal-necessity).

These coincide on consistent (Boolean) frames per the [bigraded common knowledge theorem](../theorems/bigraded-common-knowledge.md) part (c) — axis-collapse criterion. They diverge on frames with $\top$-witness or $\bot$-witness cells, with explicit divergence verified on benchmark-5.

### The mean-field conjecture

**Conjecture (Pass 4).** *Let $\{V_N\}_{N \geq 1}$ be a sequence of bilattice-valued multi-observer systems on a common base $B$, with per-observer initial valuations sampled iid from a $\mathcal{V} = [0, 1]^\bowtie$-valued probability measure $\mu_0$. Under Pass 2's propagation-of-chaos hypotheses, the empirical-measure trajectories of the truth-axis and knowledge-axis consensus operators converge weakly to deterministic limits:*

$$\mathrm{Cons}^t_N(\phi) \;\xrightarrow{N \to \infty}\; C^t_\infty(\phi; \mu_0), \qquad \mathrm{Cons}^k_N(\phi) \;\xrightarrow{N \to \infty}\; C^k_\infty(\phi; \mu_0),$$

*where $C^t_\infty, C^k_\infty$ are deterministic continuous-bilattice-valued functions of the input formula $\phi$ and the initial measure $\mu_0$. These two limits are in general distinct, with the difference determined by:*

1. *(Truth-axis collapse direction.) $C^t_\infty(\phi; \mu_0)$ collapses toward the truth-bottom $\mathbf{f}$-side of the bilattice along observer-disagreements in the truth order.*

2. *(Knowledge-axis collapse direction.) $C^k_\infty(\phi; \mu_0)$ collapses toward the knowledge-bottom $\bot$-side along observer-disagreements in the knowledge order.*

3. *(Synchronicity with finite-$N$ divergence.) For $\mu_0$ supported on Boolean values $\{\mathbf{t}, \mathbf{f}\}$ with no $\top$-witness, the two limits coincide: $C^t_\infty = C^k_\infty$. For $\mu_0$ assigning positive mass to $\{\top, \bot\}$, the two limits genuinely differ, with $|C^t_\infty - C^k_\infty|$ proportional to the $\mu_0$-mass on $\{\top, \bot\}$ at first order.*

### Why bigraded mean-field is structurally distinctive within the framework

The corpus's mean-field-limit setup (Passes 1–3) is built on the bilattice value category $\mathcal{V} = [0, 1]^\bowtie$ with two parallel orders. The bigraded common-knowledge construction (Pursuit 1 result) shows that on finite multi-observer systems, the per-axis common-knowledge fixed points generically diverge to different bilattice bottoms. Pass 4 records the framework-internal claim: this two-axis structure lifts to the large-$N$ limit cleanly, with the [KZ-diamond strict commutation theorem](../theorems/kz-diamond-strict-commutation.md) providing the structural ingredient that makes the per-axis large-$N$ limits independent.

For positioning relative to the public mean-field-game literature (Sznitman propagation-of-chaos, Lasry-Lions MFG, Lacker graphon MFG, Fabian-Stebler-Caines sparse graphons), see the [bigraded common knowledge position narrative](../narratives/bigraded-common-knowledge-position.md) and "What the public literature has..." section above. The comparative material there positions the corpus's two-axis content relative to the public literature's single-axis content; the framework-internal claim above does not depend on that positioning.

### Connection to Pass 3's substitution-shaped systems

For substitution-shaped multi-observer systems (Pass 3's setting), the per-axis consensus operators specialize to per-axis classifying invariants:

$$\mathrm{cl\text{-}inv}^{(n), t}_{\mathcal{V}}(v_\mathcal{S}^{(\mathcal{V}, w)}) \;\neq\; \mathrm{cl\text{-}inv}^{(n), k}_{\mathcal{V}}(v_\mathcal{S}^{(\mathcal{V}, w)})$$

in general — two independent classifying invariants per substitution. The Pisot growth-rate analog from Pass 3 specializes to per-axis growth rates: truth-axis Pisot eigenvalue $\lambda_w^t$ and knowledge-axis Pisot eigenvalue $\lambda_w^k$, with $\lambda_w^t = \lambda_w^k$ exactly when the weight choice makes the substitution operate uniformly across both bilattice orders.

### What Pass 4 settles

- **Conjecture-level statement of the bigraded mean-field limit.** The two-axis structure of bilattice-valued empirical measures lifts cleanly to the mean-field limit; the structural prediction is that the two consensus equations evolve and converge independently.
- **Cross-domain bridge to bigraded common knowledge.** The benchmark-5 finite-$N$ divergence (uniformly different bottoms for $C^t p$ and $C^k p$) is the structural shadow of the mean-field separation predicted here.
- **Refinement of Pass 2's paraconsistency-persistence.** Pass 2 settled that paraconsistency survives the mean-field limit. Pass 4 refines: not only does paraconsistency survive, but the bilattice's two-axis structure manifests as two parallel mean-field consensus equations, with the limit-divergence bottom-locations matching the finite-$N$ bigraded common-knowledge fixed points.

### What Pass 4 leaves open

- **Formal proof of the bigraded propagation-of-chaos.** Pass 2's propagation-of-chaos argument needs extension to handle the per-axis empirical measures separately. The two parallel arguments should run independently, given the [KZ-diamond strict commutation theorem](../theorems/kz-diamond-strict-commutation.md) ensuring the per-axis closure operators commute strictly with the limit-taking. Open: write the formal proof.
- **Computational verification on a benchmark-5 large-$N$ extension.** Build a scaled-up multi-agent epistemic Kripke frame ($N \to \infty$ extension of benchmark-5's three agents to $N$ agents with iid initial valuations from the appropriate $\mu_0$). Verify the per-axis consensus operators converge to the predicted limits as $N$ grows. Computational module: a new `mean_field_bigraded_consensus.py` extending the Pursuit 1 module.
- **Connection to the graphon analog (sub-task 1c).** When the agent population structure is a graphon rather than complete-graph, the per-axis mean-field equations should each carry a graphon-dependent kernel. Stating this precisely is open.
- **Synchronicity-violation regime.** For asymmetric $\mu_0$ where $C^t_\infty \neq C^k_\infty$ but the difference is *not* simply proportional to the $\{\top, \bot\}$-mass (e.g., when $\mu_0$ has fractional support on the bilattice middle elements with order-dependent geometry), the conjecture's first-order claim may need refinement. Open whether a precise asymptotic expansion exists.

### Migration target

This Pass's findings, if formalized, would migrate to a sketch theorem `theorems/bigraded-mean-field-limit.md` stating the two-axis mean-field convergence. Its proof would use:

- The [bigraded common knowledge theorem](../theorems/bigraded-common-knowledge.md) (sketch) — defines the per-axis consensus operators.
- The [KZ-diamond strict commutation theorem](../theorems/kz-diamond-strict-commutation.md) (sketch) — ensures the per-axis closure operators commute with the mean-field limit.
- Pass 2's propagation-of-chaos argument — applied separately to each axis.
- Pass 3's continuous-$V$ step-$n$ rank theorem — for substitution-shaped specializations.

The migration would also justify a new computational module verifying the bigraded mean-field limit on a large-$N$ benchmark-5 extension.

### Position in predication categories

Pass 4 connects three corpus structural findings into a single mean-field framework:

- The bigraded common knowledge construction (modal-operator-level bigrading, per-axis fixed points).
- The continuous-V step-$n$ rank theorem (substitution-shape-specific mean-field invariant).
- The KZ-diamond strict commutation (axis-orthogonality between iteration and closure).

It is the most-ambitious Pass of the bilattice mean-field question, and the most-distinctive vs the public MFG literature. Its formalization is research-program-scale; the structural statement at conjecture level is settled here.
