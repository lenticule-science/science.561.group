---
type: narrative
status: current
discusses:
  - multi-observer-system
  - distributed-settling-system
  - multi-observer-settlings
  - crdt-convergence-via-cohomological-calm
  - cohomological-calm
  - crdts-and-calm
  - benchmark-5-epistemic-kripke
  - n-ary-predication
  - quantale-enriched-sheaf
  - q-enriched-curry-finite-graph
  - ghrist-riess2022
  - ghrist-et-al2025
  - ghrist-ding2025
  - hansen-ghrist2019
  - lopez2024
  - halpern-moses1992
title: "Toward agentic swarm theory: a study plan"
description: The corpus has substantial foundational machinery that intersects with agentic swarm theory as a research area in the contemporary mathematical literature — the bilattice / d-frame value category, the multi-observer system, the…
---

# Toward agentic swarm theory: a study plan

The corpus has substantial foundational machinery that intersects with agentic swarm theory as a research area in the contemporary mathematical literature — the bilattice / d-frame value category, the multi-observer system, the distributed settling system, the CRDT convergence and CALM theorems, the multi-agent epistemic Kripke benchmark, and the Q-enriched cellular sheaf framework that connects to Hansen–Ghrist–Riess–Lopez's network-sheaf consensus theory. None of this is yet *agentic swarm theory in the literature's sense* — a theory of collective behavior in finite or scaling families of agents, with explicit communication structure, per-agent dynamics, and emergent collective invariants. Reaching that requires earning it: by literature review against the standard accounts, by reconstruction within predication categories' framework of what is already known there, and by novel proofs extending predication categories' distinctive content (paraconsistency, bilattice values, settling cohomology) into the swarm regime.

This narrative lays out the study plan. The work decomposes into a foundational inventory, a literature alignment, six research directions earned in sequence, and the first concrete tasks each direction generates.

## Foundational inventory: what the corpus has that is swarm-relevant

The corpus's existing material that bears directly on multi-agent / collective settings:

**Objects.**

- [Multi-observer system](../../../../glossary/terms/multi-observer-system.md): a functor $V : O \to \mathrm{Settlings}_B$ from an observer category to settlings on a common base. Consensus is the limit; disagreement is $H^1$. The current definition treats $O$ as a generic small category — making it a graph or topological space is a natural extension that hasn't been done.
- [Distributed settling system](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/distributed-settling-system.md): finite family of presheaves merging via cellwise $\vee_k$. CRDT-shaped, but anonymous — replicas have indices, not identities or capabilities.
- [N-ary predication](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/objects/n-ary-predication.md): predications on $n$-tuples of entities rather than pairs. Relevant for swarm settings where collective actions involve multiple agents simultaneously.
- [Quantale-enriched sheaf](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/bitopological-settling-site/content/quantale-enriched-sheaf/quantale-enriched-sheaf.md): the foundational object underlying Q-enriched cohomology, including the d-frame-valued case. Already specialized to graphs in the [finite-graph Curry equivalence theorem](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/theorems/q-enriched-curry-finite-graph.md).

**Theorems (proved).**

- [CRDT convergence](../../../../glossary/concepts/crdt-convergence.md): replicas evolving independently and merging cellwise via $\vee_k$ converge to a common limit state without coordination.
- [CRDT convergence via Mayer–Vietoris](../../../../glossary/concepts/crdt-convergence-via-mayer-vietoris.md): cohomological reformulation — the connecting Mayer–Vietoris homomorphism $\delta^0$ on the settling-associated sheaf is identically zero on every replica cover. CRDT convergence becomes "no obstruction to gluing."
- [CRDT convergence via cohomological CALM](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/crdt-convergence-via-cohomological-calm.md): the strict and Scott-continuous regimes admit a more conceptual proof via $H^1 = 0$.
- [Cohomological CALM](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/cohomological-calm.md): generalizes Hellerstein–Alvaro CALM to the cohomological setting — CALM-compatibility ⇔ vanishing of all Mayer–Vietoris obstructions.
- [Settling-CALM corollary](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/formalization/infomaterial/lib/infomaterial/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/settling-calm-corollary.md): instantiates CALM at the primal level for knowledge presheaves.
- [Replica Mayer–Vietoris](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/replica-mayer-vietoris.md): the underlying Mayer–Vietoris sequence on replica covers.
- [Q-enriched Curry equivalence on finite graphs](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/theorems/q-enriched-curry-finite-graph.md): per-fiber Curry on graphs, Q-enriched.

**Examples (verified end-to-end).**

- [Benchmark 5: epistemic Kripke frame](benchmark-5-epistemic-kripke.md): three agents (Alice, Bob, Carol), one paraconsistent witness world. 6 ⊤-firings from paraconsistency propagation.
- [Benchmark 6: CRDT conflict](benchmark-6-crdt.md): CRDT system with concurrent contradictory updates; 3-of-3 ⊤-firings; fully self-dual paraconsistent stratum.
- [Multi-observer disagreement benchmark](benchmark-multi-observer-disagreement.md): two observers with bilattice-negated initial states; consensus is trivially $\bot$ everywhere; the join produces $\top$ at the disagreed cell — *paraconsistency arises naturally from two-observer disagreement*.
- [Three-replica Mayer–Vietoris computation](three-replica-mayer-vietoris.md): explicit verification of the Mayer–Vietoris obstruction structure on a three-replica cover.
- [Multi-agent epistemic settling](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/examples/multi-agent-epistemic-settling.md): the multi-agent settling object underlying benchmark 5.

**Narratives (positioning predication categories in the swarm-adjacent literature).**

- [CRDT applications opener](crdt-applications-opener.md): chapter-opening narrative establishing predication categories' CRDT / Mayer–Vietoris / CALM trio as a unified distributed-systems-cohomology contribution.
- [CRDTs and CALM](crdts-and-calm.md): positions settling machinery as a structurally-enriched CRDT class, cites Shapiro et al. and Hellerstein–Alvaro.
- [Distributed-systems topology relation](distributed-systems-topology-relation.md): explicit positioning of predication categories relative to Herlihy–Kozlov–Rajsbaum (combinatorial-topology distributed computing), Felber et al. 2025 (task sheaves), Ghrist–Ding 2025 (precision-graded network-sheaf cohomology).
- [Tunneling and agential dynamics](tunneling-and-agential-dynamics.md): classifies agents as continuous (within-class evolution) vs transition (regime jumps, increment events, rule perturbations); includes a multi-observer extension and a "swarm-level phase transitions" frontier.

**Open questions already in the corpus.**

- [Multi-observer settlings](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/questions/multi-observer-settlings.md) — status partial; the multi-observer-system definition partially answers it.
- [Unified distributed-systems cohomology](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/questions/unified-distributed-systems-cohomology.md) — open with three sub-questions: (1) common enriching category for settling-cohomology and Felber's task-sheaves (d-frames as candidate), (2) cohomological-CALM generalization to task-sheaf side, (3) mixed-system frameworks combining state-evolution with discrete tasks.

**References (annotated in corpus).**

- [@hansen-ghrist2019] — spectral theory of cellular sheaves; *currently a secondary reference*, the corpus's CRDT theorems use derived-functor / Čech methods rather than spectral methods.
- [@ghrist-riess2022], [@ghrist-et-al2025] — Tarski / Lawvere Laplacian on quantale-enriched cellular sheaves.
- [@lopez2024] — fuzzy-adjoint network-sheaf framework.
- [@halpern-moses1992] — common knowledge in multi-agent epistemic logic.
- [@ghrist-ding2025] — precision-graded cohomology for network sheaves.
- [@herlihy-et-al2013] — *Distributed Computing Through Combinatorial Topology* (foundational reference).
- [@felber-et-al2025] — task sheaves on simplicial protocol complexes, the closest modern parallel to the corpus's CRDT / Mayer–Vietoris framework.
- [@belnap1977] — "How a computer should think" (the four-valued bilattice's foundational paper).
- [@priestley1970] — Priestley duality.

What's missing structurally — the genuine remaining gaps:

1. **Network-sheaf-on-agent-graph reformulation.** The corpus's CRDT / Mayer–Vietoris / CALM trio lives on the bitopological settling site, not explicitly on agent graphs. Reformulating these results in network-sheaf-on-agent-graph form (the standard Hansen–Ghrist setting) is undone.
2. **Engagement with Hansen–Ghrist's spectral theory.** The reference is annotated as "secondary" because the corpus uses Čech / derived-functor methods. A reconstruction showing the corpus's methods recover Hansen–Ghrist's spectral-theory results (or characterizing the differences) is not in the corpus.
3. **Per-agent closure dynamics.** The multi-observer-system has a generic observer category; the distributed-settling-system has anonymous replicas with a shared closure rule. A combination — observers with distinct closure rule systems — is undone.
4. **Bilattice extension of standard network-sheaf consensus.** Hansen–Ghrist consensus is for vector-space-valued sheaves; the bilattice analog is undone.
5. **The three sub-questions of [unified-distributed-systems-cohomology](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/questions/unified-distributed-systems-cohomology.md).** All open; substantive research-program-scale questions.

## The literature this connects to

Agentic swarm theory in the contemporary literature spans several adjacent communities, each with established results the corpus would need to engage with:

**Network-sheaf consensus theory.** Hansen–Ghrist 2019 and follow-ups establish that opinion dynamics on a graph of agents converge iff the harmonic sections of an associated cellular sheaf give the consensus value. The corpus's Q-enriched cellular sheaf machinery (via Lopez 2024 and the Ghrist-team papers) puts the corpus *in* this literature; the missing piece is the explicit specialization to the agent-graph case with the bilattice value category.

**Multi-agent epistemic logic.** The Fagin–Halpern–Moses–Vardi framework (their 1995 textbook *Reasoning About Knowledge*) is the standard for multi-agent knowledge representation. The corpus's epistemic Kripke benchmark touches this; building it into a research program requires a literature review of the modal logic, the dynamic epistemic logic extensions (Baltag–Moss–Solecki), and the public-announcement variants. The corpus's distinctive content would be the bilattice extension, where agents' knowledge can be paraconsistent.

**Distributed reasoning and multi-context systems.** Brewka–Eiter's multi-context systems (2007) and the broader DLP / answer-set-programming literature treat distributed reasoning where each context has its own theory, with bridge rules for inter-context inference. Adjacent: Bonatti–Eiter on description logic distributed knowledge bases. The corpus's per-agent-rule extension (currently unwritten) lands here.

**Argumentation frameworks.** Dung's 1995 "On the acceptability of arguments" and the abstract argumentation literature handle multi-agent settings where agents make defeating arguments, with semantics for which arguments are jointly acceptable. The corpus's bilattice machinery is a natural fit (paraconsistency = unresolved argumentation conflict), but explicit connection has not been made.

**Mean-field and interacting particle systems.** Sznitman's 1991 mean-field limit theory and the broader interacting-particle-systems literature (Liggett, Kipnis–Landim) handle the large-$N$ limit of agent populations. The corpus's existing material is purely finite; a scaling-limit theory would be a substantial extension.

**Sheaf-theoretic distributed systems.** Goguen's institutional approach, Kock's synthetic differential geometry, and more recent work (Ghrist–Hansen–Riess) provide categorical / sheaf-theoretic foundations. The corpus is in this neighborhood already.

## Six research directions, organized by what they earn

Restating the directions identified earlier, now organized by what literature they engage with and what the corpus would contribute beyond the standard:

1. **Bilattice-valued network sheaves on agent graphs.** Lit: Hansen–Ghrist 2019, Riess et al on network sheaves; Lopez 2024 fuzzy-adjoint extension. Corpus contribution: bilattice / d-frame value category instead of vector spaces or join-semilattices, treating contradictory information as first-class.

2. **Per-agent closure dynamics in multi-observer systems.** Lit: Brewka–Eiter on multi-context systems; distributed reasoning broadly. Corpus contribution: per-observer rule systems within predication categories' closure-2-monad framework.

3. **Aperiodic swarms via Anderson–Putnam direct limits.** Lit: Anderson–Putnam 1998 on substitution tile spaces; Sadun, Putnam on aperiodic dynamics. Corpus contribution: substitution-shaped agent-rule systems whose long-time behavior predication categories' aperiodic-regime classification already classifies.

4. **Paraconsistent multi-agent epistemic logic.** Lit: Fagin–Halpern–Moses–Vardi; Baltag–Moss–Solecki dynamic epistemic logic; Belnap "How a computer should think." Corpus contribution: bilattice-valued knowledge with predication categories' strong-MLD orbit-type machinery as the classification of refined epistemic equivalence.

5. **Mean-field / scaling limits of bilattice-valued swarms.** Lit: Sznitman, Liggett, mean-field game theory. Corpus contribution: large-$N$ behavior of bilattice-valued multi-observer systems, with the bilattice's distinctive content potentially giving qualitatively different limits than the standard real-valued case.

6. **Higher-categorical agent organization.** Lit: Lurie *Higher Topos Theory*; 2-categorical models of computation. Corpus contribution: lifting the predication-fibration's 2-category structure to model organizational hierarchies (offices, skills, runbooks, governance).

These six are not all of comparable scope. Directions 1, 2, 3 extend existing corpus machinery in well-defined ways and have clear adjacent literatures. Direction 4 is conceptually substantial but methodologically standard. Directions 5 and 6 are research-program-scale projects.

## What "earning" each direction looks like

For each direction, predication categories' standard pattern (visible in the [realizability program](realizability-program.md), the [cellular extension plan](cellular-extension-plan.md), the [d-frame cohomology framework narrative](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/narratives/d-frame-cohomology-framework.md)) is: literature review + within-corpus reconstruction of standard results + novel theorems extending the standard. Concretely, the work in each direction decomposes into stages:

**Direction 1: bilattice-valued network sheaves on agent graphs.**

- *Literature review.* Reference annotations exist for [@hansen-ghrist2019], [@lopez2024], [@ghrist-riess2022], [@ghrist-et-al2025], [@ghrist-ding2025]. Hansen–Ghrist's annotation explicitly notes the spectral theory is "currently a secondary reference" because the corpus uses Čech / derived-functor methods. The literature-review work that remains: extract Hansen–Ghrist's actual consensus theorem statement and the role its spectral methods play, so the corpus can engage rather than only adjacent-cite.
- *Reconstruction.* Two pieces: (a) reformulate the corpus's existing CRDT Mayer–Vietoris / cohomological CALM / consensus content explicitly as network-sheaf-on-agent-graph theorems, taking $O$ in the multi-observer-system as a graph; (b) state and prove (or identify obstruction to proving) Hansen–Ghrist's spectral consensus theorem in the corpus's Čech / derived-functor framework on the agent-graph case. (b) is the harder piece — the corpus may not naturally produce spectral characterizations, and identifying what it produces instead would itself be a contribution.
- *Novel.* The bilattice extension: a consensus / disagreement theorem on bilattice-valued network sheaves on agent graphs, with the corpus's distinctive paraconsistent content. Two concrete sub-deliverables: (i) state the bilattice analog of Hansen–Ghrist consensus for an agent-graph setting; (ii) extend the multi-observer-disagreement benchmark from 2 observers to a graph of $n$ observers, computing how paraconsistency-from-disagreement scales with graph topology.
- *Earned by.* Existing CRDT Mayer–Vietoris theorem; existing multi-observer-system; existing Q-enriched Curry on graphs; existing multi-observer-disagreement benchmark. The reformulation step is mostly notational rebracketing of existing results in network-sheaf language; the spectral-engagement step is the novel reconstruction work; the bilattice analog is the substantive new theorem.

**Direction 2: per-agent closure dynamics.**

- *Literature review.* Brewka–Eiter multi-context systems; distributed knowledge base reasoning; the broader distributed reasoning literature. None of these are currently in predication categories' reference set.
- *Reconstruction.* Reformulate the standard "per-context theory + bridge rules" framework as multi-observer-system + per-observer rule systems + settling-morphisms-as-bridge-rules. This requires extending the multi-observer-system definition to carry per-observer rule data.
- *Novel.* Theorem: the joint settling of a per-observer-rule multi-observer system (as a colimit / limit construction in a suitable category) exists and is well-behaved (CRDT-convergent under appropriate conditions). This generalizes the existing CRDT convergence theorem (which assumes a shared rule system) to the per-agent case.
- *Earned by.* The existing CRDT convergence theorems plus the multi-observer-system object provide most of the machinery; the gap is the per-observer rule extension.

**Direction 3: aperiodic swarms via Anderson–Putnam.**

- *Literature review.* Anderson–Putnam 1998 (already in corpus refs); the broader substitution-shift / tiling literature (Sadun's textbook, Putnam's papers).
- *Reconstruction.* The corpus's aperiodic-regime classification already establishes the connection between aperiodic settlings and Anderson–Putnam direct limits. What's missing for the swarm interpretation is recognizing substitution-shaped swarm-rule systems as a specific class of aperiodic settlings.
- *Novel.* Theorem: a swarm rule system with substitution-shaped local interaction has an aperiodic settling in predication categories' regime classification, with classifying invariant given by the Anderson–Putnam direct limit of the substitution. Concrete deliverable: a worked example (a small swarm with a specific substitution-shaped rule, computed end-to-end via the existing benchmark suite tooling extended to multi-agent rules).
- *Earned by.* Mostly already there; the framing as swarm theory is the missing piece.

**Direction 4: paraconsistent multi-agent epistemic logic.**

- *Literature review.* Fagin–Halpern–Moses–Vardi 1995 *Reasoning About Knowledge* (the standard textbook); Baltag–Moss–Solecki dynamic epistemic logic; Belnap on four-valued logic; paraconsistent epistemic logic literature (Priest, da Costa specifically as it bears on knowledge representation). **Updated:** Bílková-Frittella-Kozhemiachenko paraconsistent Gödel modal series (2022, 2023, 2025) are the corpus's directly engageable parallel program; Bakhtiari-van-Ditmarsch-Rivieccio 2020 BEAK is the closest bilattice-modal precedent; Gonczarowski-Moses 2024 ("Common Knowledge Regained") is the recent classical-side common-knowledge work.
- *Reconstruction.* State the standard S5 epistemic axioms (K, T, 4, 5) and recover their semantics in predication categories' bilattice framework on the four-element bilattice. Verify predication categories' epistemic-Kripke benchmark satisfies the axioms in the appropriate paraconsistent sense.
- *Novel.* Theorem: bilattice-valued K-axioms (the modal axioms with bilattice semantics) are sound and complete with respect to a class of paraconsistent multi-agent Kripke frames. Concrete deliverable: a new theorem stating the soundness/completeness, with the strong-MLD orbit-type machinery as the classification of equivalent epistemic states.
- *Earned by.* The benchmark-5 example is the start; the framework needs lifting from one specific frame to a class.

> **Direction 4 progress (May 2026, post-bigraded-common-knowledge).** Sub-task 5a (K-axiom variant) **settled**: the corpus's natural K-axiom is the *bigraded K = K-truth ⊕ K-knowledge* — a pair of single-axis K-axioms, one per bilattice order, derived from the [predication hyperdoctrine](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/objects/predication-hyperdoctrine.md)'s two parallel adjoint systems. Sub-task 5f (two-axis epistemic split) **settled at the structural-statement level** by the [bigraded common knowledge theorem](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/theorems/bigraded-common-knowledge.md) (sketch): $C^t \phi$ and $C^k \phi$ are two independent greatest fixed points; on benchmark-5 they have different bottoms ($C^t p = (\mathbf{f},\mathbf{f},\mathbf{f})$, $C^k p = (\bot,\bot,\bot)$). For positioning relative to the public common-knowledge literature, see the [bigraded common knowledge position narrative](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/narratives/bigraded-common-knowledge-position.md). **Open downstream:** sub-tasks 5b (frame class), 5c (soundness), 5d (completeness), 5e (MLD as refined epistemic equivalence). The headline framework-internal content the direction was positioning toward now exists at sketch; the soundness/completeness wrapper remains research-program-scale.

**Direction 5: mean-field / scaling limits.**

- *Literature review.* Sznitman 1991 mean-field limits; Liggett interacting particle systems; mean-field games (Lasry–Lions); large deviation theory for interacting systems.
- *Reconstruction.* Set up predication categories' multi-observer-system in the large-$|O|$ limit. What's the natural metric / topology on the space of multi-observer systems that lets sequences converge?
- *Novel.* Conjecture: bilattice-valued multi-observer systems have a non-trivial mean-field limit characterized by a continuous-valued analog of the bilattice (likely an MV-algebra or a Lawvere-quantale extension). The limit's behavior is qualitatively different from the standard real-valued case in regimes where paraconsistency dominates.
- *Earned by.* Substantial work; this is research-program-scale rather than session-scale.

**Direction 6: higher-categorical agent organization.**

- *Literature review.* Lurie *Higher Topos Theory* and the higher-categorical models of distributed computing literature; the predication-hyperdoctrine's 2-categorical structure already in the corpus.
- *Reconstruction.* Identify predication categories' existing 2-categorical structure on settlings (closure-2-monad, predication-fibration) as a natural home for organizational hierarchies.
- *Novel.* Conjecture: organizational hierarchies (the office / skill / runbook / governance hierarchy of an agentic orchestration platform) have a classifying 2-stack in the predication-fibration's higher-categorical structure. Speculative.
- *Earned by.* Substantial; depends on the predication-fibration's higher structure being more developed than the corpus currently has.

> **Direction 6 progress (May 2026, post-bigraded-common-knowledge).** Sub-task 6a (pseudo-distributive law for the KZ-diamond) **settled positively in the strict-commutation form**: the [KZ-diamond strict commutation theorem](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/theorems/kz-diamond-strict-commutation.md) (sketch) shows that the closure 2-monad $\mathrm{Cl}$ and the Emmenegger fibration 2-comonad $\mathbb{N}$ commute strictly on the temporal 2-category. The composite is a strict 2-monad-2-comonad pair. Sub-task 6c (common knowledge as fixed point of the diamond) **partially advanced** through the bigraded common knowledge construction. **Open downstream:** sub-tasks 6b (lax-idempotent iterated-knowledge reframing), 6d (stratified diamond for hierarchical observers), 6e (dual diamond), 6f (higher-categorical extension). Direction 6's foundational pseudo-distributive law turns out to be strict, structurally cleaner than the pre-pursuit expectation.

## Sequencing

The work has an order of dependency. Direction 1 is the most-immediate (extends per-fiber Curry already done) and most-load-bearing (Hansen–Ghrist's network sheaves are the standard the corpus most directly extends). Directions 2, 3, 4 are independent of each other but each builds on Direction 1's framework being in place. Directions 5 and 6 are speculative continuations that depend on Directions 1–4 being substantively developed first.

A natural sequence:

1. **Direction 1** (network sheaves) first: literature review, reconstruction, novel bilattice extension. Produces a theorem `theorems/bilattice-network-sheaf-consensus.md` (status sketch, then proved) plus a worked example.

2. **Direction 4** (paraconsistent epistemic logic) second: extends the existing benchmark-5 to a research program, with the bilattice K-axioms theorem as the concrete deliverable. This direction has the cleanest existing entry point (the benchmark) and the most-developed adjacent literature (standard epistemic logic).

3. **Direction 2** (per-agent closure dynamics) third: extends the multi-observer-system with per-observer rules. This is conceptually substantial and produces the foundational object-extension that enables further directions.

4. **Direction 3** (aperiodic swarms) fourth: applies the Direction 2 framework with substitution-shaped rules, connects to the existing aperiodic-regime classification.

5. **Direction 5** (mean-field) fifth: scaling-limit theory built on the now-established finite-swarm framework.

6. **Direction 6** (higher-categorical organization) last: speculative continuation.

Within each direction, predication categories' standard pattern applies: a research-program narrative, a sequence of question files for sub-pieces, computational verifications via Python tools where applicable, theorems graduating from sketch to proved, and worked examples consolidating findings.

## First concrete tasks

The plan generates these immediately-actionable pieces of work, in priority order. Each is genuine mathematics or substantive corpus contribution, not metadata-spawning.

1. **Network-sheaf reformulation of CRDT Mayer–Vietoris.** Take the existing [CRDT convergence via Mayer–Vietoris theorem](../../../../glossary/concepts/crdt-convergence-via-mayer-vietoris.md) (proved) and the existing [multi-observer-system](../../../../glossary/terms/multi-observer-system.md) (defined for generic observer category $O$) and write a theorem stating the consensus / disagreement structure when $O$ is a graph $G$ of agents — the standard network-sheaf setting in the literature. This is reconstruction in network-sheaf language; the math is mostly already there. Concrete deliverable: a new theorem `network-sheaf-consensus-on-agent-graphs.md` (status: proved at structural-rigor level, citing the existing Mayer–Vietoris theorem as input).

2. **Engagement with Hansen–Ghrist spectral methods.** The Hansen–Ghrist annotation originally flagged the spectral theory as "currently a secondary reference." Genuine mathematical work: state Hansen–Ghrist's spectral consensus theorem precisely, then identify what predication categories' Čech-method machinery produces in the same setting. Either recover the spectral characterization, or characterize the obstruction. This is substantive research, not session-scale; it would produce a question file with passes (analogous to the per-fiber Curry working question) plus eventually a theorem or refined open question. **Status: in progress** via [hansen-ghrist-spectral-engagement question](../../learning-articles/questions/hansen-ghrist-spectral-engagement.md). Passes 1+2 settled the session-scale piece — both frameworks agree on the consensus space; they characterize it via complementary machinery; Hansen–Ghrist's spectral apparatus structurally cannot extend to bilattice / d-frame values (no canonical inner product on the bilattice). Migration done: the engagement question's findings have updated the [Hansen–Ghrist 2019 reference annotation](../../bibliographies/hansen-ghrist2019.md), the [bilattice network-sheaf consensus theorem](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/theorems/bilattice-network-sheaf-consensus.md)'s "what this theorem does not establish" section, and the [network-sheaf consensus on agent graphs theorem](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/theorems/network-sheaf-consensus-on-agent-graphs.md)'s comparison-to-literature section. Open continuations: Pass 3 (Lopez 2024 fuzzy-adjoint as quantale-graded analog) and Pass 4 (Lawvere Laplacian fixed-point as the corpus-side substitute for spectral content) — both substantial research-program-scale.

3. **Bilattice extension of network-sheaf consensus.** Once (1) is in place: state the bilattice / d-frame analog of standard network-sheaf consensus on agent graphs, using the corpus's existing CRDT machinery + the per-fiber d-frame Curry equivalence (already verified for the simplest Belnap placement). Concrete deliverable: a new theorem `bilattice-network-sheaf-consensus.md` (status: sketch initially; promote as the bilattice extension is computed on small examples).

4. **Engagement with `unified-distributed-systems-cohomology` Sub-question 1.** The corpus's existing question asks whether d-frames is a common host for both settling-cohomology and Felber et al's task-sheaves. Direct mathematical work: study Felber's task-sheaf construction in detail, identify its value-category structure, attempt to express it as a d-frame specialization. Concrete deliverable: a progress note attached to the existing question, with either positive evidence (a candidate translation) or a structural obstruction.

5. **Per-agent closure dynamics extension of multi-observer-system.** The current [multi-observer-system](../../../../glossary/terms/multi-observer-system.md) has $V : O \to \mathrm{Settlings}_B$ but doesn't carry per-observer closure-rule data explicitly. Concrete deliverable: extend the object with per-observer rule systems, plus a theorem extending the existing CRDT convergence to the per-observer-rule case. **Status: done** — see the [ruled multi-observer system object](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/objects/multi-observer-system-with-rules.md) and the [CRDT convergence with per-observer rules theorem](crdt-convergence-with-per-observer-rules.md). The extension distinguishes evidence-layer disagreement (handled by the bilattice $\vee_k$, rule-independent) from inferential-layer disagreement (handled by per-observer rule joins, captured at $\sup_o \kappa_o$). With this in place, the chapter has the foundational object-extension that enables Direction 2 (Brewka–Eiter multi-context-systems engagement) and downstream agent-graph work that depends on per-agent rule heterogeneity.

6. **References for literature not yet in corpus.** Brewka–Eiter 2007 (multi-context systems, for Direction 2); Sznitman 1991 (mean-field, for Direction 5); Dung 1995 (argumentation frameworks, for Direction 4); Fagin–Halpern–Moses–Vardi 1995 textbook (multi-agent epistemic logic, for Direction 4). Each gets a reference annotation in `references/` matching the corpus's existing format. Roughly one page each.

Tasks 1, 4, and 6 are session-scale. Task 2 is a substantial research-program piece in the same shape as the per-fiber Curry working question. Tasks 3 and 5 each generate a working question and a target theorem; substantive work spread across multiple sessions.

The natural first action is task 1 — the network-sheaf reformulation — because the corpus has all the pieces; the work is assembling them in network-sheaf language explicitly. The other tasks naturally follow.

## What this narrative does not do

- It does not commit the corpus to any particular research direction. The six directions are options, not commitments. The first concrete tasks set up infrastructure to pursue any of them; choosing which to push on substantively is a separate decision.
- It does not introduce new mathematics. Every theorem and example referenced is already in the corpus or in the cited literature.
- It does not establish frontmatter conventions, framework annotations, or other metadata schemes (per the lessons of the [cohomological-framework concept](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/content/cohomological-framework/cohomological-framework.md) — that concept itself names the framework structure, but does not add machine-checkable annotations).

## Position in predication categories

This narrative is the agentic-swarm-theory analog of the [cellular extension plan](cellular-extension-plan.md): it identifies the foundational pieces, the literature the corpus enters, the work needed to earn each direction, and the sequencing. As with the cellular extension plan, the test of this narrative is whether the next layer of work (the question files and reconstructions in the "First concrete tasks" section) actually gets written and the directions get earned.

The corpus's existing strengths — bilattice / d-frame value category, multi-observer-system, CRDT machinery, Q-enriched cellular sheaves, the per-fiber Curry investigation — give the program a non-trivial starting position. The sequence above describes how to convert that starting position into agentic swarm theory contributions over time.
