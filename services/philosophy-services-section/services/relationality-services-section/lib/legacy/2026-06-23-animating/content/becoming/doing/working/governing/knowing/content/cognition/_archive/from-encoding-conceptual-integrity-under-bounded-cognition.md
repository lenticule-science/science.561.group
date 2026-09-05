---
title: "Conceptual Integrity Under Bounded Cognition: Why Concept Stabilization for Language-Model Agents Requires In-Place Iteration of a Single Document"
description: "An essay arguing that an LLM agent stabilizing a concept into training material must fully load, reason over, and edit one document in place — grounded in three convergent constraints: the context-bounded epistemics of transformers (the loaded artifact IS the agent's knowledge), conceptual-integrity/single-source-of-truth (DRY) results, and cognitive-load/split-attention findings — and formalized as reduction to a normal form, where document proliferation is a divergent operator with no fixed point."
keywords: ["conceptual-integrity", "bounded-cognition", "language-model-agent", "single-source-of-truth", "in-place-iteration", "normal-form", "rewriting-system", "cognitive-load", "split-attention", "concept-stabilization", "single-document-discipline"]
date: 2026-06-15
---

## Conceptual Integrity Under Bounded Cognition: Why Concept Stabilization for Language-Model Agents Requires In-Place Iteration of a Single Document

**Abstract.** This essay argues that when an autonomous language-model agent is charged with stabilizing a concept into training material, the procedure of fully loading one document, reasoning over it, and editing it in place is not a stylistic preference but a requirement entailed by three independently sufficient constraints: the context-bounded epistemic architecture of transformer agents, the conceptual-integrity and single-source-of-truth results from software engineering, and the empirical findings of cognitive load theory governing how instructional artifacts are learned. The convergence dynamics of the task are then formalized through the theory of rewriting systems, where in-place editing is reduction toward a normal form and document proliferation is a divergent operator that admits no fixed point.

### 1. The problem and its terms

A distinction must precede the argument. *Implementing* a specified artifact and *stabilizing* a still-forming concept are different epistemic activities. The former admits decomposition and parallel artifacts because the interfaces are fixed in advance; the latter is a search for a statement of the concept that further reasoning ceases to revise. Training material is the canonical product of the second activity, because its purpose is not to record but to render a concept *internalizable* by a subsequent reader. The claim under examination is that, for an agent, this second activity converges only under in-place iteration of one document.

### 2. The agent as a context-bounded epistemic system

A transformer language model computes a function of the tokens currently in its context window (Vaswani et al., 2017); it possesses no persistent state across invocations beyond what is re-presented to it, a property made explicit by the in-context-learning paradigm in which all task-relevant knowledge must be resident in the prompt (Brown et al., 2020). For such a system the operative identity holds that *the loaded artifact is not a record of the agent's knowledge but its knowledge*. This is the agentic instantiation of the extended-mind thesis (Clark & Chalmers, 1998) and of distributed cognition (Hutchins, 1995): cognition is realized partly in external structures, and what is not currently coupled into the processing loop does not participate in cognition at all. An unloaded file is therefore not low-salience but epistemically absent.

Two consequences follow. First, full loading is mandatory because coherence is a global property and edits are local acts; an edit made over a partially loaded state cannot preserve invariants the agent never perceived, and the agent has no reliable means of detecting its own omission. The pathology is aggravated by the empirical *lost-in-the-middle* phenomenon, whereby models attend unevenly across long contexts and systematically underweight material not at the boundaries (Liu et al., 2023); even nominal loading degrades unless the artifact is small enough to be attended in full, which itself bounds the document's length and argues against accretion. Second, fragmentation across N files renders memory reconstitution nondeterministic: the agent must decide which files to load from an already impoverished state, and any omission silently substitutes a fragment for the whole. A single document collapses reconstitution to one deterministic act whose completeness is guaranteed by construction — there being no other file about which the question "was it loaded?" can arise.

### 3. Conceptual integrity and the single source of truth

Brooks (1975) advanced conceptual integrity as the paramount property of a designed system: a system is comprehensible and usable to the degree that it proceeds from one coherent set of ideas, and integrity is more important than the inclusion of any individual good idea. Training material is subject to this principle in its strongest form, since its sole function is to transmit a coherent conception. Fragmentation is the mechanism by which conceptual integrity is lost: a concept distributed across artifacts acquires as many slightly divergent renderings as there are artifacts, and the divergences are invisible to any reader who holds only one rendering at a time — exactly the agent's condition (§2).

The engineering counterpart is the principle that every piece of knowledge should have a single, authoritative representation, violated whenever knowledge is duplicated across locations (Hunt & Thomas, 1999, the DRY principle; cf. Parnas, 1972, on confining a design decision to one module). Duplication is the precondition of divergence, and the only categorical defense against divergence is to make duplication structurally impossible. Within one document there is one site at which any definition can reside; revision is therefore propagated by the topology of the artifact rather than by an act of synchronization that nothing compels. Across documents the synchronization debt accrues silently and compounds, since K renderings must be checked pairwise for the contradictions that fragmentation breeds — a quadratic obligation that no agent reliably discharges. The accumulation is a species of technical debt in Cunningham's (1992) sense: a deferred reconciliation cost that accrues interest until it dominates the work.

### 4. Convergence: stabilization as reduction to a normal form

The stabilization task is, formally, the search for a fixed point — a statement S of the concept such that the agent's revision operator R satisfies R(S) = S. Two results from the theory of rewriting systems make precise why only in-place editing reaches such a point (Baader & Nipkow, 1998). First, in-place editing is a reduction relation on the space of document states: each pass maps a state to a more reduced state, and the process *terminates* exactly when a full read followed by reasoning yields no edit — an operationally checkable normal-form condition. Document creation is not a reduction but a *branching* of the state space; it multiplies the candidate normal forms the knowledge may take and thereby moves away from, not toward, a fixed point. Second, the value of a single document is that confluence becomes attainable: the Church–Rosser property (Church & Rosser, 1936) and Newman's lemma (Newman, 1942) guarantee that a terminating, locally confluent system has unique normal forms, whereas a disjoint collection of artifacts has no joint normal form for divergent edits to be reconciled into. The existence of the fixed point that stabilization seeks is itself guaranteed only over a single monotone structure (Tarski, 1955; the Kleene fixed-point construction). A divergent operator cannot reach a fixed point by any number of applications; proliferation is therefore not slow progress toward stabilization but motion in the wrong space.

This formalization coincides with the broader programme of deriving a rule and rewriting a corpus toward conformance with it: the stabilized document stands to its concept as a normal form stands to a term, and a rewriting system is not said to compute a result until it reaches one. There is no notion of reducing a term to *several* normal forms.

### 5. Compression as the operational definition of understanding

The minimum-description-length principle (Rissanen, 1978), grounded in algorithmic information theory (Solomonoff; Kolmogorov; see Li & Vitányi, 1997) and ultimately in Shannon (1948), identifies the best model of a body of data with the shortest description that regenerates it. Understanding, on this account, is compression: to understand a domain is to hold a representation shorter than an enumeration of its facts. A bounded single document *forces* the search for that representation, because each incoming insight must be sited within fixed walls — which compels the agent to locate what the insight subsumes, delete what it renders redundant, and re-derive the through-line so the whole still reads as one argument. That act of integration is the cognitive work of understanding, and it leaves the document shorter or sharper precisely when the underlying model has improved.

Permitting a new file removes the forcing function. The insight is appended elsewhere; nothing is subsumed, reconciled, or deleted; the relational structure that constitutes understanding — which exists only through proximity and integration — is never written, because integration occurs only where all material shares one container. The result is accretion without comprehension, a corpus whose growth is mistaken for its progress. The disposition to proliferate is explicable by the principle of least effort (Zipf, 1949): for an agent, "create a file" is a low-friction action that produces a visible artifact, whereas "reload the whole and restructure it to absorb one idea" is costly and yields no new object, only a better one. The single-document discipline exists to overrule a bias toward the cheap action precisely when the expensive action is the only one that produces the good.

### 6. The learning-science case specific to training material

The strongest pillar is empirical and pertains uniquely to material intended to instruct. Cognitive load theory holds that working memory is severely capacity-limited (Miller, 1956; Baddeley & Hitch, 1974) and that instructional design succeeds or fails by its management of extraneous load (Sweller, 1988; Sweller, van Merriënboer, & Paas, 1998). The directly applicable result is the *split-attention effect*: when learners must integrate information distributed across multiple physically separated sources, the integration itself imposes extraneous load and measurably impairs learning, relative to material that is spatially and structurally unified (Chandler & Sweller, 1991). Distributing a concept across files is the documentary realization of split attention and is contraindicated by the evidence. The coherence and redundancy principles of multimedia learning concur: extraneous and duplicated material depress learning outcomes (Mayer, 2009), which is precisely what fragmentation generates as renderings multiply and drift.

A learner — human or agentic — forms a model by following one through-line at a controlled progression of altitude. That spine *is* the ordering and the transitions between sections, and ordering and transitions are structure that exists within a single document and nowhere among separate ones. The spine is achievable only by iterating one artifact until the sequence is correct, an operation with no expression as "create another file." For the agentic reader the §2 condition recurs at the point of use: deterministic retrieval — the standard that the material be unambiguously usable by a future agent — requires exactly one authoritative location, guaranteed complete and self-consistent and loadable in a single act, the only configuration for which "is the current, complete understanding now loaded?" is unconditionally affirmative.

### 7. The read–reason–edit loop as enforced expert revision

Studies of revision distinguish novices, who treat writing as transcription and edit only locally, from experts, who treat a manuscript as a provisional whole to be repeatedly re-seen and globally restructured (Sommers, 1980). The prescribed loop — load in full, reason, edit, repeat to a fixed point — is the operationalization of expert revision. A human expert sustains it through persistent attachment to a single manuscript held in memory; the agent lacks that attachment and defaults to producing fresh artifacts (§5). The procedure must therefore be imposed externally, supplying by rule the continuity of manuscript that the agent does not natively possess.

### 8. Conclusion

The three pillars are individually sufficient and jointly decisive. The agent's knowledge is its loaded context, so the artifact must be loadable whole, which mandates full reads and one file. Conceptual integrity survives only where duplication is structurally impossible, which is within a single document. Convergence to a stable statement is reachable only by a convergent operator over a structure that admits a unique normal form, which in-place editing supplies and file creation destroys. And the learning sciences specifically condemn the fragmentation of instructional material as an extraneous-load pathology. The procedure specified — read in full, reason, study, edit, repeat — is consequently not one workflow among several for stabilizing a concept into training material with an agent. It is the only one that terminates at a usable result.

---

### References

Baader, F., & Nipkow, T. (1998). *Term Rewriting and All That*. Cambridge University Press.
Baddeley, A. D., & Hitch, G. (1974). Working memory. *Psychology of Learning and Motivation*, 8.
Brooks, F. P. (1975). *The Mythical Man-Month*. Addison-Wesley.
Brown, T. B., et al. (2020). Language models are few-shot learners. *NeurIPS 33*.
Chandler, P., & Sweller, J. (1991). Cognitive load theory and the format of instruction. *Cognition and Instruction*, 8(4).
Church, A., & Rosser, J. B. (1936). Some properties of conversion. *Transactions of the AMS*, 39(3).
Clark, A., & Chalmers, D. (1998). The extended mind. *Analysis*, 58(1).
Cunningham, W. (1992). The WyCash portfolio management system. *OOPSLA Experience Report*.
Hunt, A., & Thomas, D. (1999). *The Pragmatic Programmer*. Addison-Wesley. (The DRY principle.)
Hutchins, E. (1995). *Cognition in the Wild*. MIT Press.
Li, M., & Vitányi, P. (1997). *An Introduction to Kolmogorov Complexity and Its Applications*. Springer.
Liu, N. F., et al. (2023). Lost in the middle: How language models use long contexts. *TACL*.
Mayer, R. E. (2009). *Multimedia Learning* (2nd ed.). Cambridge University Press.
Miller, G. A. (1956). The magical number seven, plus or minus two. *Psychological Review*, 63(2).
Newman, M. H. A. (1942). On theories with a combinatorial definition of equivalence. *Annals of Mathematics*, 43(2).
Parnas, D. L. (1972). On the criteria to be used in decomposing systems into modules. *CACM*, 15(12).
Rissanen, J. (1978). Modeling by shortest data description. *Automatica*, 14(5).
Shannon, C. E. (1948). A mathematical theory of communication. *Bell System Technical Journal*, 27.
Sommers, N. (1980). Revision strategies of student writers and experienced adult writers. *College Composition and Communication*, 31(4).
Sweller, J. (1988). Cognitive load during problem solving. *Cognitive Science*, 12(2).
Sweller, J., van Merriënboer, J., & Paas, F. (1998). Cognitive architecture and instructional design. *Educational Psychology Review*, 10(3).
Tarski, A. (1955). A lattice-theoretical fixpoint theorem and its applications. *Pacific Journal of Mathematics*, 5(2).
Vaswani, A., et al. (2017). Attention is all you need. *NeurIPS 30*.
Zipf, G. K. (1949). *Human Behavior and the Principle of Least Effort*. Addison-Wesley.
