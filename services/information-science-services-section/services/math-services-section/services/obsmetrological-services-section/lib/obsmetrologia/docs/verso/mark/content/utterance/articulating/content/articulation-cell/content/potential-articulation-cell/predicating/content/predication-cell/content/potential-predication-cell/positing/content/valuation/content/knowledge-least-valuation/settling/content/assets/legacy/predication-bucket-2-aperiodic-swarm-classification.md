---
type: question
class: bridge
status: partial
explores:
  - aperiodic-settling
  - anderson-putnam-direct-limit
  - step-n-substitution-recurrence
  - aperiodic-classifying-invariant
  - step-n-classifying-invariant
  - multi-observer-system
  - distributed-settling-system
  - four-regime-dichotomy
  - continuous-valued-step-n-cohomological-rank
  - bilattice-mean-field-scaling-limit
---

> **Progress (Passes 1–2 done).** Sub-question 3c (interpretation of rank-$n$ classifying invariant in swarm-theoretic terms): **settled** via cross-domain bridge from [bilattice-mean-field-scaling-limit Pass 3](bilattice-mean-field-scaling-limit.md) — the rank-$n$ invariant measures asymptotic per-letter expected content under the agent population's initial-distribution. Sub-question 3d (adversarial swarm classification): structurally addressed. **Pass 2 (post-bigraded-common-knowledge update)**: sub-question 3a/3b refined — the [tropical rank-collapse classification theorem](../theorems/tropical-rank-collapse-classification.md) gives explicit *weight-conditional* tropical-Pisot stability for substitution-shaped swarm protocols. A swarm with Pisot-aligned per-letter weights $w \in \mathcal{S}_M$ has classifying invariant of rank exactly $n$; outside $\mathcal{S}_\mathcal{S}$ the rank drops, and the swarm fails to admit a non-degenerate Anderson-Putnam-style classifying invariant. The substitution-shaped swarm catalog now stratifies by $\mathcal{S}_\mathcal{S}$-membership of the protocol's induced weights. Sub-question 3a's full translation framework remains open.

# Aperiodic swarm classification via Anderson–Putnam and the step-$n$ tower

The corpus's [aperiodic-regime classification theorem](../theorems/aperiodic-regime-moduli-classification.md) classifies aperiodic settlings up to MLD-equivalence by their $H^1$-class — a complete cohomological invariant via the [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md). For substitution-recurrence settlings, the [step-$n$ structural unifier](../concepts/step-n-substitution-recurrence.md) refines this to a $\mathbb{Z}^n$-valued [step-$n$ classifying invariant](../objects/step-n-classifying-invariant.md) of rank exactly $n$, where $n$ is simultaneously the substitution alphabet cardinality, recurrence depth, and minimal-polynomial degree of the Pisot growth rate.

Direction 3 of the [agentic-swarm-theory plan](../narratives/toward-agentic-swarm-theory.md) names *aperiodic swarms via Anderson–Putnam* but does not develop it. The substitution-tilings literature (Anderson–Putnam, Sadun, Putnam, Berthe, Solomyak) is rich and largely orthogonal to the swarm-and-distributed-systems literature; the corpus's machinery is the structural bridge, but the bridge is not in place.

This question sets up the work to make the bridge concrete: classify *swarm rule systems* whose long-time dynamics is aperiodic, and characterize what the rank-$n$ classifying invariant *means* in swarm-theoretic terms.

## What the corpus has

- The [four-regime dichotomy](../theorems/four-regime-dichotomy.md), which separates strict / Scott-continuous / transfinite-bounded / aperiodic regimes by the closure ordinal $\kappa$.
- The [aperiodic-regime classification theorem](../theorems/aperiodic-regime-moduli-classification.md): aperiodic settlings up to MLD-equivalence are classified by $\mathrm{cl}\text{-}\mathrm{inv}(v) \in H^1(\mathbf{T}^*_{\leq \kappa}, \mathcal{F}_U)$.
- The [step-$n$ substitution recurrence concept](../concepts/step-n-substitution-recurrence.md), with concrete instances at $n = 2$ (Fibonacci), $n = 3$ (Padovan), $n = 4$ (Tetranacci) — full benchmark-suite verification via [`tools/predication_categories/examples/benchmark_1_fibonacci.py`](../tools/predication_categories/examples/benchmark_1_fibonacci.py).
- The [Anderson–Putnam direct limit object](../objects/anderson-putnam-direct-limit.md) and the structural identification of aperiodic-regime cohomology with the Anderson–Putnam Čech cohomology of the substitution tile space.
- The [step-$n$ classifying invariant](../objects/step-n-classifying-invariant.md), valued in $\mathbb{Z}^n$.
- The [step-$n$ cohomological rank theorem](../theorems/step-n-cohomological-rank-theorem.md) (forthcoming) — establishing rank exactly $n$.
- The [Pisot accumulation and image-length connection theorem](../theorems/pisot-accumulation-image-length-connection.md).
- The [step-$n$ moduli substack object](../objects/step-n-moduli-substack.md).

The substitution-tilings side of the corpus is mature; the swarm interpretation is unbuilt.

## What the public literature has that this question needs to read

The substitution-dynamics literature is mature and the corpus engages with it at the cohomological level. What is missing for the swarm interpretation is contact with literatures that treat similar dynamics in multi-agent / multi-process settings:

- **Anderson–Putnam 1998** — the foundational *Topological invariants for substitution tilings and their associated $C^*$-algebras*. Already in corpus refs.
- **Sadun, *Topology of Tiling Spaces*** (2008) — the standard textbook.
- **Berthé–Siegel, *Pisot substitutions and Rauzy fractals*** — for the algebraic-number side of step-$n$.
- **Solomyak** — Pisot conjecture and substitution dynamics.
- **Goodman-Strauss, Moore, Vincent on substitution-shaped agent rule systems** — the closest public contact with multi-agent substitution dynamics, though not in the corpus's value-category framework.
- **Sznitman 1991** — large-population symmetric agent dynamics; relevant if the aperiodic regime persists in scaling limits (interlocks with [bilattice mean-field scaling-limit question](bilattice-mean-field-scaling-limit.md)).
- **Pikovsky–Rosenblum on chimera states** — multi-agent dynamics that don't converge but exhibit coherent substructure; the closest public phenomenology to aperiodic swarms.
- **Recent agentic-swarm work** in the LLM-agent literature on emergent coordination patterns that are neither fully synchronized nor random (e.g., HyperAgent's communication-topology dynamics).

## The question

Which classes of swarm-protocol rule systems realize the corpus's four-regime aperiodic regime, and what is the swarm-theoretic interpretation of the rank-$n$ classifying invariant?

## Sub-questions

### (3a) Translation: swarm rule systems → closure-rule systems

The corpus's [closure-rule language](../concepts/closure-rule-language.md) is positive $\Pi_1$+$<$ over the entity-set signature. A *swarm rule system* in the public-literature sense — a finite set of local interaction rules where each agent updates state based on neighbors' states — has to be expressed as a closure-rule system on a multi-observer system to fall in the corpus's apparatus.

Sub-question 3a asks: write down the translation. What does a (e.g.) Vicsek-style flocking rule, a HyperAgent communication-topology update rule, or a CRDT-merge rule look like as a closure-rule in the corpus's language?

For sub-rules that admit a direct translation (CRDT-merge clearly does — it's the Mayer–Vietoris-merge case), this is exposition rather than open math. For sub-rules that don't admit direct translation (anything with continuous-state agents, real-valued positions, or stochastic updates), 3a interlocks with the [continuous-$L$ predication settlings question](continuous-L-predication-settlings.md) and the [stochastic settling object](../objects/stochastic-settling.md).

### (3b) Substitution-shaped swarm protocols

A *substitution-shaped swarm protocol* would be one where each agent's local update rule is a substitution: agent state $a$ becomes $\omega(a) \in E^*$ at the next time step, with $\omega : E \to E^*$ a substitution map. Concrete candidates from the public literature:

- **Population-protocol substitutions** (Angluin–Aspnes–Diamadi–Fischer–Peralta) — finite-state agent populations with pairwise rewrite rules; some such rules have substitution shape.
- **Cellular-automaton-style swarm rules** — local update from a bounded neighborhood, when the underlying cell graph is uniform; substitution-shaped when the rule is L-system-like.
- **HyperAgent's communication-topology updates** — when the topology rewrite rule is L-system-shaped.
- **Coalition-formation rules** in multi-agent reinforcement learning, where successful coalitions split or merge by a substitution-like rule.

Sub-question 3b asks: which of these admit substitution-shaped translations under (3a), and which become step-$n$ closure-rule systems for what $n$? The deliverable is a worked-out catalog: translation 3a applied to specific public-literature swarm rules, with the corresponding step-$n$ classifications.

### (3c) Swarm-theoretic interpretation of rank-$n$ classifying invariant

For a substitution-shaped swarm protocol that translates to a step-$n$ closure-rule system, the [step-$n$ classifying invariant](../objects/step-n-classifying-invariant.md) lives in $\mathbb{Z}^n$. The structural question:

> What does the rank-$n$ classifying invariant *measure* about the swarm, in swarm-theoretic terms?

Candidate interpretations to test:

- **Coordination depth** — $n$ as the number of distinct coordination phases the swarm cycles through, with $\mathbb{Z}^n$ counting the phases asymmetrically.
- **Coalition-structure rank** — $n$ as the maximum size of stable coalitions in the substitution dynamics.
- **Information-flow rank** — $n$ as the minimum number of distinct message-types the swarm must carry to realize the protocol.
- **Recurrence depth** — $n$ as the lookback depth of the protocol's state-update.

The Pisot growth rate gives a quantitative complementary measure: the swarm grows / propagates information at rate $\rho_n$, the dominant root of the substitution's characteristic polynomial. The Pisot conjecture (substitution dynamics) says these dominant roots have specific algebraic-number properties; in swarm terms, this would constrain *which growth rates are realizable* by substitution-shaped protocols.

Sub-question 3c is the most genuinely speculative of the four. Settling it would consist of: identify a worked candidate interpretation, verify it on at least the $n = 2, 3, 4$ benchmark suite, state a theorem of the form "the step-$n$ classifying invariant of a substitution-shaped swarm equals \[interpretation\]."

### (3d) Aperiodic dynamics for adversarial / non-converging swarms

A theme in the malicious-AI-swarms literature ([@arxiv-2506.06299 — *How malicious AI swarms can threaten democracy*](https://arxiv.org/html/2506.06299), surfaced in the [survey of agentic swarm math](../../../../../../../../texts/survey-of-agentic-swarm-math.md)) is that adversarial swarms exhibit *coordinated but non-convergent* behavior — they do not stabilize on a single message or position, but maintain coherent multi-aspect dynamics that's neither random nor periodic.

This is, in the corpus's regime taxonomy, the **aperiodic regime**. The four-regime dichotomy already names this regime; what's missing is the swarm-theoretic interpretation of *why* an adversarial swarm is structurally aperiodic and what its rank-$n$ classifying invariant means about the *coordination structure of its adversarial behavior*.

Sub-question 3d asks: for adversarial swarms, does the aperiodic-regime classification distinguish coordination-strategy classes that other classifications don't capture? Specifically, two adversarial swarms with the same target objective but different internal coordination structure should — if the classifying invariant works as advertised — have *different* step-$n$ classes, even when their externally observable behavior agrees.

This is the most directly application-oriented sub-question. It is also the one most clearly distinguished from any public-literature classification: the public adversarial-swarm literature classifies by *target* and *strategy* in informal language; cohomological classification by step-$n$ classifying invariant is qualitatively different.

## What would settle the question

A research-program-scale answer with three deliverables:

1. **Translation theorem** (sub-question 3a): a precise correspondence between a class of swarm rule systems and the corpus's closure-rule systems, with explicit examples.
2. **Catalog of substitution-shaped swarm protocols** (sub-question 3b) with their step-$n$ classifications.
3. **Interpretation theorem** (sub-question 3c): the swarm-theoretic content of the rank-$n$ classifying invariant.

Sub-question 3d is downstream of 3c and would be a follow-up analysis paper-style deliverable.

A *minimal answer* settles 3a and 3b on at least one worked swarm example. This is session-scale once 3a's translation framework is in place.

## Why this question

The aperiodic regime is the corpus's *deepest* classification result, and it is currently illustrated only by substitution tilings — a phenomenon distant from agentic swarms in vocabulary, even when the underlying mathematics is shared. Bringing the classification into the swarm context yields:

- A cohomological taxonomy of swarm dynamics that don't converge to consensus or oscillate periodically.
- An algebraic-number-theoretic constraint on the *growth rates* of substitution-shaped swarm protocols (the Pisot connection).
- A possible application to adversarial-swarm classification where externally-similar swarms differ structurally.

The public swarm literature has nothing equivalent. The Anderson–Putnam machinery has not been applied to agentic swarms. This is structural extension of mature corpus results into a new applied domain.

## Position in the program

This question is the formal statement of **Direction 3 of the [agentic-swarm-theory study plan](../narratives/toward-agentic-swarm-theory.md)**. The narrative says "mostly already there; the framing as swarm theory is the missing piece" — this question is that framing made precise, with sub-questions providing actionable handles.

It depends on no other open question for its setup. Sub-question 3a is the entry point; once a translation framework is in place, 3b and 3c follow.

This question stays `open` until sub-question 3a yields a worked translation on at least one swarm protocol.

## Pass 1 — Sub-question 3c interpretation via mean-field cross-domain bridge

> **Pass 1 result.** *The rank-$n$ classifying invariant of a substitution-shaped swarm protocol measures the **asymptotic per-letter expected content under the agent population's initial-distribution** in the mean-field limit.* Sub-question 3c is settled positively via the cross-domain bridge from [bilattice-mean-field-scaling-limit Pass 3](bilattice-mean-field-scaling-limit.md). The four candidate interpretations — coordination depth, coalition rank, information-flow rank, recurrence depth — are subsumed by this concrete one: rank-$n$ counts the asymptotic message-types weighted by their frequencies in the agent population.

### The settling

The mean-field question's Pass 3 established: for a substitution-shaped multi-observer system $V_N : O_N \to \mathrm{Settlings}_B$ with letter-weight initial distribution $\rho_0 \in \Delta(\mathbf{FOUR}^n)$, the mean-field-limiting cell labeling $v_\infty$ is the $\bar{w}$-weighted continuous-V substitution settling, where $\bar{w}_j = \mathbb{E}_{\rho_0}[w_j]$.

By the [continuous-valued step-$n$ cohomological rank theorem](../theorems/continuous-valued-step-n-cohomological-rank.md), this limiting settling has classifying invariant $\mathrm{cl\text{-}inv}^{(n)}_{[0,1]^{\bowtie}}(v_\infty) \cong ([0,1]^{\bowtie})^n$ (rank $n$ for unimodular $M$ and Pisot-aligned $\bar{w}$).

The $n$ generators correspond to the $n$ substitution letters $\{a_1, \ldots, a_n\}$, with each generator's $[0,1]^{\bowtie}$-coefficient being the *expected per-letter weight* $\bar{w}_j$.

So the rank-$n$ classifying invariant has a concrete swarm-theoretic interpretation:

> **In a substitution-shaped agent swarm, the rank-$n$ classifying invariant decomposes the asymptotic protocol behavior into $n$ independent letter-channels, with each channel's "coefficient" being the expected fraction of agents whose initial state contributes to that letter type.**

### Why this subsumes the four candidate interpretations

The original sub-question 3c proposed four candidates. The mean-field interpretation subsumes all four with a unified content:

- **Coordination depth** ✓ — the $n$ independent letter-channels are the $n$ distinct coordination phases. Each channel evolves independently under the substitution dynamics.
- **Coalition-structure rank** ✓ — coalitions form within a letter-channel; the maximum coalition size is bounded by the channel's expected weight $\bar{w}_j$.
- **Information-flow rank** ✓ — each letter is a distinct message-type. The minimum message-types needed to realize the protocol is exactly $n$.
- **Recurrence depth** ✓ — the substitution's $n$-letter alphabet corresponds to its $n$-term recurrence relation (per the [step-$n$ structural unifier](../concepts/step-n-substitution-recurrence.md)).

All four are facets of the same structural fact: $n$ counts the letter-channels, and the rank-$n$ classifying invariant records the asymptotic letter-channel weights.

### Concrete example: Fibonacci swarm protocol

Consider a Fibonacci swarm protocol ($\mathcal{S}: a \mapsto ab, b \mapsto a$). Each agent's state is in $\{a, b\}$; on each substitution step, an $a$-agent becomes a pair $(a, b)$ and a $b$-agent becomes a single $a$.

For an initial agent distribution with expected weights $(\bar{w}_a, \bar{w}_b) \in [0, 1]^2$:

- **Mean-field limit**: the agent population's letter distribution converges to the dominant left-Perron eigenvector of $M = \binom{1\ 1}{1\ 0}$, which is $(1, 1/\phi)$ normalized — i.e., asymptotic ratio $a : b = \phi : 1$.

- **Rank-2 classifying invariant**: $([0, 1]^{\bowtie})^2$, with generators $(e_a, e_b)$. The invariant records that the swarm has 2 letter-channels with respective expected weights $\bar{w}_a$ and $\bar{w}_b$ at the initial distribution, evolving under $M_w$ to the asymptotic Pisot ratio.

- **Pisot eigenvalue $\phi$**: the asymptotic content-propagation rate. Per agent-step, the population grows by factor $\phi$ in letter-content.

- **Pisot-alignment condition**: $\bar{w}_a > \bar{w}_b$ — i.e., the initial distribution favors the dominant letter. This is precisely the condition for the rank-$n$ claim to hold tropically (Pass 3 of [q-enriched-aperiodic-direct-limit-cohomology question](q-enriched-aperiodic-direct-limit-cohomology.md)).

For non-aligned initial distributions ($\bar{w}_a \leq \bar{w}_b$), the tropical rank drops to 1 — meaning the swarm's two letter-channels become *tropically equivalent* in the long-term dynamics. This is a structural finding: **non-aligned initial distributions cause the substitution-shaped swarm to lose its multi-channel character asymptotically**.

### Sub-question 3d via the same bridge

Sub-question 3d asked: do two adversarial swarms with the same target objective but different internal coordination structure have different step-$n$ classes?

Pass 1 answers: **yes**, when the coordination-structure difference shows up in the *initial agent distribution* $\rho_0$ (and hence in $\bar{w}$).

Two adversarial swarms can have the same external objective (e.g., both trying to push a target message) but differ in internal coordination:
- *Centralized coordination*: $\rho_0$ concentrated at a few letters → low entropy, large $\bar{w}_j$ for dominant letters.
- *Decentralized coordination*: $\rho_0$ spread across letters → high entropy, balanced $\bar{w}_j$.

These differ in their rank-$n$ classifying invariants: the centralized swarm has rank $n$ with skewed weights (Pisot-aligned); the decentralized may have rank dropping (non-aligned), revealing the structural difference cohomologically.

This is a concrete adversarial-swarm-classification result that the public adversarial-swarm literature does not have.

### What Pass 1 establishes

- **Sub-question 3c**: settled. The rank-$n$ classifying invariant measures asymptotic per-letter expected content under initial agent distribution.
- **Sub-question 3d**: structurally addressed. Coordination-structure differences in initial distribution show up cohomologically as rank / Pisot-alignment differences.
- **Cross-domain bridge confirmed**: the corpus's continuous-V step-$n$ theorem, mean-field propagation-of-chaos (mean-field Pass 2), and aperiodic-swarm classification all align on the same structural content.

### What Pass 1 leaves open

- **Sub-question 3a**: explicit translation of public-literature swarm rules (Vicsek flocking, HyperAgent communication-topology updates, CRDT merge) to closure-rule systems. Open.
- **Sub-question 3b**: catalog of substitution-shaped swarm protocols from the public literature with their step-$n$ classifications. Open.
- **Pass 1 of mean-field's formal Sznitman proof**: gives the rigorous foundation for this Pass.

### Migration target

A theorem `theorems/aperiodic-swarm-classifying-invariant-interpretation.md` (sketch) can record Pass 1's interpretation theorem statement, citing the cross-domain bridge from mean-field Pass 3.

## Pass 2 — Tropical-Pisot stability stratification of substitution-shaped swarm protocols

> **Pass 2 result.** *Substitution-shaped swarm protocols with per-letter weights $w$ admit a non-degenerate aperiodic-swarm classification — i.e., the Anderson-Putnam-style rank-$n$ classifying invariant — exactly when the weights lie in the substitution rule's weight-stability cone $\mathcal{S}_\mathcal{S}$.* Outside $\mathcal{S}_\mathcal{S}$, the classifying invariant degenerates to a free $\mathcal{V}$-module of strictly smaller rank. The cone $\mathcal{S}_\mathcal{S}$ is shape-specific (Fibonacci: $\{w_1 > w_2\}$; Padovan: $\{w_1 < w_2 < w_3\}$ approximately; Tribonacci: properly larger than the strict-Pisot ray) per the [tropical rank-collapse classification theorem](../theorems/tropical-rank-collapse-classification.md). This refines the Pass 1 mean-field bridge with an explicit weight-conditional criterion for swarm-protocol classifiability.

### Setup: substitution-shaped swarm protocols and induced weights

A substitution-shaped swarm protocol on $n$ agent classes (or "letter types") is a swarm rule system whose per-step interaction follows a primitive substitution matrix $M$: each agent of type $a_i$ produces, at each settling step, a fixed combinatorial pattern of agents of types $a_1, \ldots, a_n$, with multiplicities given by the matrix entries $M_{ij}$.

Weighting the swarm protocol is natural in several swarm-theoretic settings:

- *Communication-cost weights.* Each agent class has a per-letter communication cost $w_i$ — the cost of producing or transmitting a letter-$i$ agent's state. The swarm's iterated dynamics tropically composes these costs.
- *Energy weights.* Each agent class has a per-letter energy budget $w_i$.
- *Probability / preference weights.* Weights encode prior preferences over which agent classes to produce; a swarm with $w_i$-weighted production runs the substitution stochastically with rates determined by $w$.
- *Trust weights.* Weights encode trust assigned to each agent class's outputs — high-trust classes produce content that propagates more reliably.

In each case, the iterated swarm dynamics is captured by the iterated weighted matrix $M_w^k$ over the tropical / Lawvere quantale. The corpus's machinery for classifying these is the [continuous-valued step-$n$ cohomological rank theorem](../theorems/continuous-valued-step-n-cohomological-rank.md).

### The tropical-Pisot stability stratification

Pursuit 2 of the post-bigraded-common-knowledge research track established the [tropical rank-collapse classification theorem](../theorems/tropical-rank-collapse-classification.md) (sketch): for any primitive substitution $M$ of size $n \times n$, there exists an open *tropical-Pisot stability cone* $\mathcal{S}_M \subseteq \mathbb{R}_{>0}^n$ such that:

- $w \in \mathcal{S}_M$ ⟹ iterated tropical rank stays at $n$ for all $k \geq 1$.
- $w \notin \mathcal{S}_M$ ⟹ tropical rank drops to some $r < n$ at finite $k$.

For substitution-shaped swarm protocols, this stratification has direct swarm-theoretic content:

**Pass 2 main claim.** *A substitution-shaped swarm protocol with weights $w$ admits a non-degenerate rank-$n$ aperiodic-swarm classification — and hence the corpus's [aperiodic-regime classification theorem](../theorems/aperiodic-regime-moduli-classification.md) applies in its full strength — exactly when $w \in \mathcal{S}_M$.*

For weights $w \notin \mathcal{S}_M$, the swarm's classifying invariant degenerates: the rank-$r < n$ invariant lives in $\mathcal{V}^r$ rather than $\mathcal{V}^n$, with $r$ being the limit-stable tropical rank determined by the protocol's specific weight failure mode. The swarm is *under-classified*: multiple substitution structures with the same rank-$r$ profile are MLD-equivalent in the corpus's machinery, but distinguishable by the public substitution-tilings literature.

### Catalog: shape-specific stability conditions

For the canonical substitution shapes from the corpus's benchmark suite (sub-question 3b's catalog):

| Substitution | $n$ | Pisot eigenvector ordering | $\mathcal{S}_\mathcal{S}$ description |
|---|---|---|---|
| Fibonacci | 2 | $v_1 > v_2$ | $\{w : w_1 > w_2\}$ exactly |
| Padovan | 3 | $v_1 < v_2 < v_3$ | favors increasing weights $w_1 < w_2 < w_3$ |
| Tribonacci | 3 | $v_1 > v_2 > v_3$ | properly larger than strict-Pisot ray, contained in $\{w_1 \geq \max(w_2, w_3)\}$ |
| Tetranacci | 4 | $v_1 > v_2 > v_3 > v_4$ | approximately strictly-decreasing weights |

Swarm-theoretic interpretation of the table:

- *Hub-shape n-bonacci* (Fibonacci, Tribonacci, Tetranacci): the swarm's "letter 1" is the most-connected agent class. Stability requires the dominant weight to belong to the hub class — the swarm must allocate the highest weight (cost / preference / trust) to its central node-type.
- *Padovan and similar non-hub shapes*: the swarm's "letter 1" is a spoke rather than a hub. Stability requires *increasing* weights along the chain — the swarm must allocate higher weight to deeper agent classes in the rule chain.

This is empirically novel structural content for the swarm-protocol design literature: which agent class should bear the highest weight depends on the protocol's substitution shape, with hub-shaped protocols preferring opposite weight-orderings from chain-shaped ones.

### Connection to bigraded common knowledge

Pass 4 of the [bilattice mean-field scaling limit question](bilattice-mean-field-scaling-limit.md) introduces the bigraded mean-field consensus operators $C^t_\infty, C^k_\infty$. For substitution-shaped swarm protocols, the per-axis classifying invariants

$$\mathrm{cl\text{-}inv}^{(n), t}_{\mathcal{V}}(v_\mathcal{S}^{(\mathcal{V}, w)}), \qquad \mathrm{cl\text{-}inv}^{(n), k}_{\mathcal{V}}(v_\mathcal{S}^{(\mathcal{V}, w)})$$

each have their own tropical-Pisot stability condition. Joint stability requires $w$ to lie in the *intersection* of the truth-axis cone $\mathcal{S}_M^t$ and the knowledge-axis cone $\mathcal{S}_M^k$ — both potentially shape-specific. When the joint stability holds, the swarm has bigraded rank-$n$ classification: two parallel rank-$n$ invariants per axis. When only one axis stabilizes, the swarm has axis-asymmetric classification — a structurally novel content the public substitution-tilings literature has no equivalent of.

### What Pass 2 settles

- **Sub-question 3a (refinement)**: the translation framework for substitution-shaped swarm protocols specializes to weighted-matrix dynamics, with stability stratified by $\mathcal{S}_\mathcal{S}$.
- **Sub-question 3b (catalog)**: the four canonical n-bonacci + Padovan substitution shapes have explicit (or approximate) $\mathcal{S}_\mathcal{S}$ characterizations from Pursuit 2's empirical results.
- **Sub-question 3c (refinement)**: the rank-$n$ classifying invariant's "asymptotic per-letter expected content" interpretation from Pass 1 holds *conditionally on Pisot-aligned weights* — outside $\mathcal{S}_\mathcal{S}$, the asymptotic content collapses to lower rank.

### What Pass 2 leaves open

- **Sub-question 3a (full translation)**: precise translation of public-literature swarm rules (Vicsek flocking, HyperAgent communication-topology, CRDT merge) into substitution-shaped form with explicit weight assignments. Open.
- **Bigraded swarm classification on benchmark-5 large-$N$ extension**: the joint stability of $\mathcal{S}_M^t \cap \mathcal{S}_M^k$ on a concrete substitution-shaped multi-agent epistemic system. Computational work, open.
- **Adversarial / non-Pisot weight regimes**: when weights are deliberately chosen outside $\mathcal{S}_\mathcal{S}$ to *minimize* the swarm's classifiability, what is the resulting rank-$r$ invariant's swarm-theoretic content? Open.
- **Open polyhedral structure**: the precise polyhedral characterization of $\mathcal{S}_\mathcal{S}$ for each shape — see the [polyhedral structure of tropical-Pisot stability cone question](tropical-pisot-stability-cone-polyhedral-structure.md).

### Migration target (Pass 2)

The Pass 2 finding can migrate to a sketch theorem `theorems/aperiodic-swarm-tropical-pisot-stratification.md` recording the explicit weight-conditional classification statement. Its proof would use:

- The [tropical rank-collapse classification theorem](../theorems/tropical-rank-collapse-classification.md) (sketch) — provides $\mathcal{S}_\mathcal{S}$.
- The [continuous-valued step-$n$ cohomological rank theorem](../theorems/continuous-valued-step-n-cohomological-rank.md) (sketch) — Part 6b's V-conditional rank.
- The Pass 1 mean-field cross-domain bridge.

This migration consolidates the swarm-protocol classification side of Direction 3 onto the tropical-Pisot infrastructure that Pursuit 2 built.
