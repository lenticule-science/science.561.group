# Research memo: automation, agentics, neural Lean proving, and sheaf Laplacians

## Core framing

“Lean proofing” is best understood as a **verified proof-production workflow**. The user or machine writes proof terms or tactic scripts; Lean elaborates them; a small trusted kernel checks the resulting proof object. This means automation can be aggressive, heuristic, or even neural without becoming part of the trusted base, because final acceptance still depends on kernel checking. Lean’s reference manual describes Lean as an interactive theorem prover based on dependent type theory, with tactics that synthesize terms later checked by a small kernel; the *Theorem Proving in Lean 4* book also frames Lean as bridging interactive proof, automation, and metaprogramming. ([lean-lang.org](https://lean-lang.org/doc/reference/latest/))

The four topics form a stack:

| Layer | Role in Lean proofing | Maturity |
|---|---|---|
| **Automation** | Symbolic tactics close local goals, rewrite, solve arithmetic, search obvious proof paths. | Mature and used daily. |
| **Agentics** | A controller repeatedly observes proof states, chooses actions, calls tools, verifies, backtracks, repairs. | Rapidly maturing. |
| **Neural Lean proving** | Models propose tactics, premises, proof sketches, or decompositions; Lean verifies them. | Active frontier with strong benchmark progress. |
| **Sheaf Laplacians** | A possible mathematical/ML structure for heterogeneous proof graphs and consistency-guided retrieval/search. | Speculative for Lean proofing; established in graph/sheaf ML, not yet standard in Lean proving. |

My main conclusion: **the strongest near-term architecture is neuro-symbolic-agentic Lean proving**: symbolic tactics for local closure, neural retrieval/proposal for global guidance, and an agent loop that uses Lean as the verifier. Sheaf Laplacians are not yet a known standard method for Lean proofing, but they are an interesting research direction for modeling proof libraries as heterogeneous relational spaces.

---

## 1. Automation in Lean proofing

Lean automation is already substantial. At the basic level, tactics such as `simp`, `rw`, `exact`, `apply`, `constructor`, `linarith`, `omega`, `ring`, `aesop`, and `grind` help users transform or close goals. The trust model is important: a tactic may search heuristically, but the resulting proof term is checked by Lean’s kernel, so successful automation does not require trusting the tactic implementation in the same way one trusts the kernel. ([lean-lang.org](https://lean-lang.org/doc/reference/latest/))

There are several important automation families:

**Rewriting and simplification.** `simp` uses curated rewrite lemmas to normalize expressions. It is probably the most important everyday automation in Lean. `rw` performs targeted rewriting. Much of Lean proof engineering consists of choosing definitions and lemmas that make `simp` powerful.

**Arithmetic and algebraic automation.** `linarith` solves many linear arithmetic goals using contradiction/certificate-style reasoning; mathlib documents it as a tactic for goals involving linear arithmetic over ordered algebraic structures. ([leanprover-community.github.io](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Tactic/Linarith/Frontend.html)) `omega` targets Presburger-like linear arithmetic over natural numbers and integers, including equalities, inequalities, and divisibility, though Lean’s documentation notes that it is not a complete decision procedure for every such problem. ([lean-lang.org](https://lean-lang.org/doc/reference/latest/Tactic-Proofs/Tactic-Reference/))

**Search automation.** Aesop is a proof-search tactic: users tag rules with attributes such as `[aesop]`, and Aesop performs a best-first search over rule applications, with mechanisms for safe rules, unsafe rules, normalization, and proof-script reconstruction. ([github.com](https://github.com/leanprover-community/aesop)) This is “classical” automation in the sense that it searches over symbolic tactic/rule applications, not over neural generations.

**SMT-inspired automation.** Lean’s newer `grind` tactic combines congruence closure, E-matching, case analysis, constraint propagation, and theory solvers for domains such as linear integer arithmetic and commutative rings. Its documentation explicitly describes it as SMT-inspired automation integrated into Lean. ([lean-lang.org](https://lean-lang.org/doc/reference/latest/The--grind--tactic/))

**Library-level automation.** Mathlib is not just a repository of theorems; it is also an automation substrate. It contains powerful tactics, rich typeclass hierarchies, simplification lemmas, algebraic structures, order theory, topology, analysis, number theory, and many other libraries that make automation possible in practice. ([lean4.dev](https://lean4.dev/tactics/mathlib/intro))

The key limitation of automation is **global search**. Local tactics can close many goals once the right lemma, induction principle, normalization, or intermediate statement has been found. But they often struggle with the high-level question: *what should I try next?* That is where agentic and neural systems enter.

---

## 2. Agentics in Lean proofing

Agentic Lean proofing means wrapping Lean in a loop:

1. Observe the current proof state.
2. Retrieve relevant definitions, lemmas, examples, and prior proof traces.
3. Propose a next tactic, proof block, lemma, or decomposition.
4. Run it in Lean.
5. Inspect the new proof state or error.
6. Backtrack, repair, branch, or continue.

This is not just “ask an LLM for a proof.” It is closer to a **closed-loop theorem-proving system** where Lean is the environment and verifier.

The most important infrastructure shift is that Lean is increasingly exposed as an environment for machine agents. LeanDojo extracts proof states, tactics, abstract syntax trees, dependencies, and premise annotations from Lean projects, and provides a gym-like environment in which an agent observes proof states, runs tactics, and receives feedback from Lean. Its benchmark includes tens of thousands of Lean theorems/proofs and hundreds of thousands of tactic steps and premises. ([leandojo.org](https://leandojo.org/leandojo.html))

Pantograph is another important interface layer. It is designed as a machine-to-machine interaction interface for Lean 4, aimed at proof-search agents rather than human-facing editor use. The paper emphasizes efficient search, support for high-level proof structures, handling Lean inference issues, and extracting before/after tactic states for training and evaluation. ([arxiv.org](https://arxiv.org/pdf/2410.16429))

LeanAgent illustrates the “lifelong agent” direction: it searches Lean repositories, extracts data through LeanDojo, maintains a dynamic database, trains retrievers progressively, and attempts proofs of previously unproved `sorry` theorems. Its authors report automatically generating proofs for 155 theorem statements across 23 Lean repositories that previously lacked proofs. ([leandojo.org](https://leandojo.org/leanagent.html))

The agentic viewpoint changes the proofing problem. Instead of asking for one perfect proof script, the system can use:

- **Best-first search** over tactics.
- **Monte Carlo tree search** over proof states.
- **Retrieval-augmented generation** for lemma selection.
- **Repair loops** driven by Lean errors.
- **Curriculum learning** over easy-to-hard theorem families.
- **Tool use**, where symbolic tactics such as `simp`, `linarith`, `omega`, `aesop`, and `grind` are callable tools.

A useful analogy is software engineering agents: the model writes code, runs tests, reads errors, patches, and repeats. In Lean, the “tests” are stronger: the kernel either accepts the proof or rejects it.

---

## 3. Neural Lean proofing

Neural Lean proofing uses machine learning to guide proof construction. The core promise is not that neural models replace Lean’s logic, but that they help find the proof terms that Lean will later verify.

There are several neural subproblems.

**Premise retrieval.** Given a proof state, find relevant lemmas. This is crucial because mathlib is too large for naive search. LeanSearch v2, for example, studies global premise retrieval and reports that better retrieval improves downstream proof success; its “reasoning mode” uses a sketch-retrieve-reflect pipeline and improves proof success compared with no retrieval. ([arxiv.org](https://arxiv.org/abs/2605.13137))

**Tactic prediction.** Given a proof state, predict the next tactic. LeanDojo’s ReProver line is emblematic: extract proof traces, train retrieval-augmented models, then search over generated tactics with Lean feedback. LeanDojo’s dataset design also explicitly includes a “novel premise” split, which tests whether a prover can use premises absent from training proofs. ([leandojo.org](https://leandojo.org/leandojo.html))

**In-editor assistance.** Lean Copilot integrates LLM inference into Lean itself. It supports proof-step suggestion, goal completion, and premise selection, and its paper reports that it automated a substantially larger fraction of proof steps than Aesop in its evaluation setting. ([proceedings.mlr.press](https://proceedings.mlr.press/v288/song25a.html))

**Whole-proof generation and decomposition.** Recent prover models increasingly generate proof sketches, decompose difficult goals into subgoals, and then recursively prove the subgoals. DeepSeek-Prover-V2 is an example: its authors describe an open-source Lean 4 prover built around recursive theorem-proving, subgoal decomposition, and reinforcement learning, reporting 88.9% on MiniF2F-test and nontrivial performance on PutnamBench and AIME-style benchmarks. ([arxiv.org](https://arxiv.org/abs/2504.21801)) Kimina-Prover Preview reports an approach based on structured formal reasoning patterns and gives strong MiniF2F pass-rate results, including open distilled model variants. ([arxiv.org](https://arxiv.org/html/2504.11354v1)) Goedel-Prover-V2 similarly reports strong MiniF2F and PutnamBench results using scaffolded data synthesis, verifier-guided self-correction, and model averaging. ([arxiv.org](https://arxiv.org/abs/2508.03613))

Benchmarks need careful interpretation. MiniF2F was introduced as a benchmark of 488 formal olympiad-level problem statements across systems including Lean, intended to evaluate neural theorem proving. ([arxiv.org](https://arxiv.org/abs/2109.00110)) But later work on MiniF2F-Lean Revisited found serious end-to-end issues: informal-to-formal-to-proof pipelines can perform much worse than component-wise numbers suggest, and the authors identified many statement discrepancies and corrected over 300 Lean 4 statements. ([arxiv.org](https://arxiv.org/html/2511.03108v1))

So neural Lean proofing is real and advancing quickly, but the robust target is not “generate impressive-looking Lean.” The target is **produce maintainable, kernel-checking proofs in real libraries under realistic dependencies**.

---

## 4. Sheaf Laplacians in Lean proofing

There are two distinct meanings of “sheaf Laplacians in Lean proofing.”

The first is **formalizing sheaf Laplacian theory in Lean**. This is a conventional formalization project: define cellular sheaves, coboundaries, sheaf cohomology, sheaf Laplacians, kernels/global sections, spectra, normalized variants, and applications. Spectral sheaf theory extends spectral graph theory by replacing the ordinary graph Laplacian with a Hodge-style Laplacian on a cellular sheaf, relating spectra to cohomological and combinatorial structure. ([arxiv.org](https://arxiv.org/abs/1808.01513?utm_source=chatgpt.com)) This would likely build on mathlib’s category theory, topology, linear algebra, matrices, finite-dimensional vector spaces, and graph-like combinatorics.

The second is **using sheaf Laplacians as machinery for proof search or premise retrieval**. This is much more speculative, but potentially interesting.

A cellular sheaf on a graph assigns vector spaces to vertices and edges, together with linear maps that say how vertex data restricts or compares along edges. The associated sheaf Laplacian is typically of the form \(L_{\mathcal F} = \delta^\top \delta\), where \(\delta\) is a coboundary operator; its kernel corresponds to globally consistent sections. In graph ML, sheaf neural networks generalize graph convolution by replacing the ordinary graph Laplacian with a sheaf Laplacian, allowing nontrivial, asymmetric, signed, or varying-dimensional relationships between nodes. ([gebhartom.com](https://www.gebhartom.com/assets/pdf/sheafnn.pdf)) Neural Sheaf Diffusion further frames ordinary GNNs as implicitly assuming a trivial sheaf, and uses learned sheaf structure to improve performance in heterophilic graph settings where neighboring nodes may not have similar labels. ([arxiv.org](https://arxiv.org/abs/2202.04579))

Why might this matter for Lean? Because proof libraries are not ordinary homogeneous graphs. A Lean proof ecosystem has many node and edge types:

| Proof object | Possible graph role |
|---|---|
| Theorem statement | Goal or reusable premise |
| Definition | Semantic anchor |
| Lemma | Rewriting/search resource |
| Tactic state | Local proof-search state |
| Tactic | Transition operator |
| Typeclass instance | Implicit inference resource |
| Namespace/file/module | Context boundary |
| Import edge | Dependency relation |
| Proof-use edge | “Theorem A used theorem B” |
| Rewrite edge | Equality or iff transformation |
| Elaboration edge | Term-to-type or metavariable relation |

Ordinary graph embeddings tend to flatten these relations. A sheaf model could instead attach different vector spaces to different proof-object types and learn maps that translate between them. For example, the representation space for theorem statements need not be the same as the representation space for tactics or typeclass instances. A restriction map could learn how a lemma’s statement should align with a goal state, or how a tactic transforms the semantic representation of a goal.

A possible sheaf-Laplacian objective for Lean proofing would be:

\[
E(x) = x^\top L_{\mathcal F} x = \|\delta x\|^2.
\]

Here \(x\) assigns embeddings or features to proof objects in a candidate proof neighborhood. Low energy means the local pieces are mutually compatible under the learned restriction maps. High energy means there is tension: perhaps a retrieved lemma is semantically close but type-incompatible, a tactic is locally plausible but globally unhelpful, or a missing auxiliary lemma is needed to make two proof regions cohere.

This gives three research uses:

**Sheaf-guided premise retrieval.** Instead of retrieving lemmas only by text or embedding similarity, retrieve a small subgraph of lemmas, definitions, examples, and tactics whose sheaf energy is low relative to the current goal. This could be tested against LeanSearch-style premise retrieval benchmarks. LeanSearch v2 is a useful comparator because it directly evaluates premise retrieval and proof success with and without retrieval. ([arxiv.org](https://arxiv.org/abs/2605.13137))

**Sheaf-guided proof search.** In an agentic prover, the search state is a partial proof tree. The agent could score candidate moves by a mixture of neural log-probability, symbolic tactic success, and sheaf-consistency energy. Lean would still be the final verifier; the sheaf Laplacian would only guide search.

**Missing-lemma discovery.** High-energy cycles or failure modes in a proof graph might reveal places where local proof routes almost connect but require an intermediate abstraction. This could suggest auxiliary lemmas: not as accepted facts, but as conjectures to be separately proved by Lean.

The biggest caveat is that this is not yet a standard Lean-proving method. The sheaf ML literature itself notes that choosing or learning the right sheaf can be difficult, and learned sheaves can introduce overfitting or computational cost. ([arxiv.org](https://arxiv.org/abs/2206.08702)) Proof graphs are even harder than many ML graphs because they are typed, dynamic, higher-order, and affected by elaboration and typeclass inference.

---

## 5. A plausible research program

A credible project connecting these four themes would look like this.

**Phase 1: Build the proof graph.** Use LeanDojo or Pantograph-style extraction to build a heterogeneous graph from mathlib or selected Lean repositories. Include theorem statements, proof states, tactics, used premises, imports, definitions, typeclass instances, and local context features. LeanDojo already extracts proof states, tactics, dependencies, and premise annotations, which makes it a natural substrate. ([leandojo.org](https://leandojo.org/leandojo.html))

**Phase 2: Establish non-sheaf baselines.** Compare against BM25/text retrieval, dense embedding retrieval, LeanSearch-style retrieval, ReProver-style retrieval-augmented tactic prediction, and agentic search with symbolic tactics. This prevents the sheaf machinery from becoming mathematically elegant but empirically unnecessary.

**Phase 3: Add sheaf structure.** Define stalks by object type: goals, lemmas, definitions, tactics, files, and typeclass instances may live in different spaces. Learn restriction maps along relation types: “uses,” “rewrites,” “imports,” “elaborates-to,” “unifies-with,” “same namespace,” “same typeclass family,” and “tactic transition.”

**Phase 4: Train on proof traces.** Use successful proof traces as low-energy examples and corrupted traces as high-energy negatives. Train the model to recover used premises, predict useful next tactics, and rank proof-neighborhood subgraphs.

**Phase 5: Plug into an agent.** The agent proposes tactics and lemmas; the sheaf module ranks candidate neighborhoods; Lean checks each move. Pantograph-style interfaces are especially relevant here because they are built for proof-search agents and can expose before/after tactic states. ([arxiv.org](https://arxiv.org/pdf/2410.16429))

**Phase 6: Evaluate realistically.** Use not only MiniF2F but also mathlib-style theorem proving, novel-premise splits, repository-level `sorry` filling, proof maintainability, and wall-clock search cost. The MiniF2F-Lean Revisited critique is important here: benchmark numbers can overstate real end-to-end proving ability when formalization quality, statement alignment, or pipeline assumptions are weak. ([arxiv.org](https://arxiv.org/html/2511.03108v1))

---

## 6. Practical interpretation

For current Lean users, “automation in Lean proofing” mostly means becoming fluent with symbolic tactics and structuring statements so they compose well with mathlib automation. The practical toolkit is `simp`, `rw`, `norm_num`, `linarith`, `omega`, `ring`, `aesop`, `grind`, typeclass inference, and good lemma design.

For researchers building Lean agents, the main stack is now clearer: use LeanDojo or Pantograph to interact with Lean; use retrieval to narrow mathlib; use LLMs or specialized provers to propose tactics; use symbolic tactics as tools; use Lean’s kernel as the verifier; and use search/repair loops to overcome single-shot model failures.

For neural proving, the frontier is moving from raw tactic prediction toward **retrieval, decomposition, verifier-guided self-correction, and agentic search**. Recent systems such as DeepSeek-Prover-V2, Kimina-Prover, Goedel-Prover-V2, Lean Copilot, and LeanSearch show different pieces of this pipeline, but real mathematical-library proving remains harder than leaderboard proof generation. ([arxiv.org](https://arxiv.org/abs/2504.21801))

For sheaf Laplacians, the conservative claim is: **formalizing them in Lean is a solid mathlib-style project; using them to improve Lean proof automation is a plausible but unproven research hypothesis.** The attractive idea is that proof corpora are heterogeneous relational objects, and sheaf Laplacians are designed for graphs where relationships are not all the same. The danger is that the added mathematical structure may be expensive or unnecessary unless it beats strong retrieval and agentic baselines.

The best single-sentence thesis is: **Lean proofing is becoming an agentic, neuro-symbolic search problem over a formally verified kernel; sheaf Laplacians may become useful if we can show that proof libraries behave less like ordinary graphs and more like typed, locally consistent sheaf-valued spaces.**
