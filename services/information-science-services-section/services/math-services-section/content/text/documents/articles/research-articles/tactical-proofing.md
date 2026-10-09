---
title: "Tactical Proofing: Proof Strategy as a Compositional Technology"
date: 2026-07-12
lang: en-US
abstract: “Tactical proofing” is not a settled term of art, but it names a coherent tradition more commonly described as tactical proof, tactic-based proving, or tactical theorem proving. This paper argues that the defining achievement of that tradition is not merely the automation of routine deductions. It is the architectural separation of proof discovery from proof certification. A tactic may search, fail, backtrack, invoke external procedures, or embody domain-specific mathematical judgment, while a small trusted kernel certifies only the derivation ultimately produced. This separation turns formal proof construction into a programmable process over proof states. The paper reconstructs the conceptual genealogy of tactics from LCF and ML through Isabelle, Rocq, and Lean; surveys their contemporary use in formal mathematics, software verification, hybrid systems, and proof engineering; and examines current mathematical frontiers concerning the semantics, algebra, synthesis, verification, and representation of tactics. Tactical proofing emerges as a general theory of machine-mediated reasoning in which inference, search, and abstraction are distinct but composable layers.keywords:
  - tactical-proof
  - tactics-and-tacticals
  - interactive-theorem-proving
  - proof-search
  - proof-assistants
  - formal-verification
  - proof-engineering
  - automated-reasoning
references:
  - id: gordon-milner-wadsworth-1979
    type: book
    title: "Edinburgh LCF: A Mechanised Logic of Computation"
    author:
      - family: Gordon
        given: Michael J. C.
      - family: Milner
        given: Arthur J.
      - family: Wadsworth
        given: Christopher P.
    issued:
      date-parts: [[1979]]
    collection-title: "Lecture Notes in Computer Science"
    collection-number: "78"
    publisher: Springer
    publisher-place: Berlin
    DOI: "10.1007/3-540-09724-4"
  - id: milner-1984
    type: article-journal
    title: "The Use of Machines to Assist in Rigorous Proof"
    author:
      - family: Milner
        given: Robin
    issued:
      date-parts: [[1984]]
    container-title: "Philosophical Transactions of the Royal Society of London. Series A, Mathematical and Physical Sciences"
    volume: "312"
    issue: "1522"
    page: "411-422"
    DOI: "10.1098/rsta.1984.0067"
  - id: gordon-2015
    type: article-journal
    title: "Tactics for Mechanized Reasoning: A Commentary on Milner (1984) ‘The Use of Machines to Assist in Rigorous Proof’"
    author:
      - family: Gordon
        given: Michael J. C.
    issued:
      date-parts: [[2015]]
    container-title: "Philosophical Transactions of the Royal Society A"
    volume: "373"
    issue: "2039"
    page: "20140234"
    DOI: "10.1098/rsta.2014.0234"
  - id: paulson-1987
    type: book
    title: "Logic and Computation: Interactive Proof with Cambridge LCF"
    author:
      - family: Paulson
        given: Lawrence C.
    issued:
      date-parts: [[1987]]
    publisher: Cambridge University Press
    publisher-place: Cambridge
    ISBN: "9780521346320"
  - id: paulson-1989
    type: article-journal
    title: "The Foundation of a Generic Theorem Prover"
    author:
      - family: Paulson
        given: Lawrence C.
    issued:
      date-parts: [[1989]]
    container-title: "Journal of Automated Reasoning"
    volume: "5"
    issue: "3"
    page: "363-397"
    DOI: "10.1007/BF00248324"
  - id: paulson-2019
    type: article-journal
    title: "From LCF to Isabelle/HOL"
    author:
      - family: Paulson
        given: Lawrence C.
    issued:
      date-parts: [[2019]]
    container-title: "Formal Aspects of Computing"
    DOI: "10.1007/s00165-019-00492-1"
  - id: wenzel-2002
    type: thesis
    title: "Isabelle/Isar—A Versatile Environment for Human-Readable Formal Proof Documents"
    author:
      - family: Wenzel
        given: Makarius
    issued:
      date-parts: [[2002]]
    genre: "PhD thesis"
    publisher: Technical University of Munich
    URL: "https://isabelle.in.tum.de/Isar/isar-thesis-Isabelle2002.pdf"
  - id: delahaye-2000
    type: paper-conference
    title: "A Tactic Language for the System Coq"
    author:
      - family: Delahaye
        given: David
    issued:
      date-parts: [[2000]]
    container-title: "Logic for Programming and Automated Reasoning"
    collection-title: "Lecture Notes in Computer Science"
    collection-number: "1955"
    page: "85-95"
    publisher: Springer
    DOI: "10.1007/3-540-44404-1_7"
  - id: martin-gardiner-woodcock-1996
    type: article-journal
    title: "A Tactic Calculus—Abridged Version"
    author:
      - family: Martin
        given: Andrew P.
      - family: Gardiner
        given: Philip H. B.
      - family: Woodcock
        given: Jim C. P.
    issued:
      date-parts: [[1996]]
    container-title: "Formal Aspects of Computing"
    volume: "8"
    issue: "4"
    page: "479-489"
    DOI: "10.1007/BF01213535"
  - id: martin-gibbons-2002
    type: manuscript
    title: "A Monadic Interpretation of Tactics"
    author:
      - family: Martin
        given: Andrew P.
      - family: Gibbons
        given: Jeremy
    issued:
      date-parts: [[2002]]
    URL: "https://www.cs.ox.ac.uk/jeremy.gibbons/publications/tactics.pdf"
  - id: jedynak-biernacka-biernacki-2013
    type: paper-conference
    title: "An Operational Foundation for the Tactic Language of Coq"
    author:
      - family: Jedynak
        given: Wojciech
      - family: Biernacka
        given: Małgorzata
      - family: Biernacki
        given: Dariusz
    issued:
      date-parts: [[2013]]
    container-title: "Proceedings of the 15th Symposium on Principles and Practice of Declarative Programming"
    page: "25-36"
    publisher: ACM
    DOI: "10.1145/2505879.2505890"
  - id: aspinall-denney-luth-2010
    type: article-journal
    title: "Tactics for Hierarchical Proof"
    author:
      - family: Aspinall
        given: David
      - family: Denney
        given: Ewen
      - family: Lüth
        given: Christoph
    issued:
      date-parts: [[2010]]
    container-title: "Mathematics in Computer Science"
    volume: "3"
    issue: "3"
    page: "309-330"
    DOI: "10.1007/s11786-010-0025-6"
  - id: kaiser-et-al-2018
    type: article-journal
    title: "Mtac2: Typed Tactics for Backward Reasoning in Coq"
    author:
      - family: Kaiser
        given: Jan-Oliver
      - family: Ziliani
        given: Beta
      - family: Krebbers
        given: Robbert
      - family: Régis-Gianas
        given: Yann
      - family: Dreyer
        given: Derek
    issued:
      date-parts: [[2018]]
    container-title: "Proceedings of the ACM on Programming Languages"
    volume: "2"
    issue: "ICFP"
    page: "78:1-78:30"
    DOI: "10.1145/3236773"
  - id: de-moura-ullrich-2021
    type: paper-conference
    title: "The Lean 4 Theorem Prover and Programming Language"
    author:
      - family: de Moura
        given: Leonardo
      - family: Ullrich
        given: Sebastian
    issued:
      date-parts: [[2021]]
    container-title: "Automated Deduction—CADE 28"
    collection-title: "Lecture Notes in Computer Science"
    collection-number: "12699"
    page: "625-635"
    publisher: Springer
    DOI: "10.1007/978-3-030-79876-5_37"
  - id: lean-reference-2026
    type: webpage
    title: "Lean Language Reference: Custom Tactics"
    author:
      - literal: "Lean Project"
    issued:
      date-parts: [[2026]]
    URL: "https://lean-lang.org/doc/reference/latest/Tactic-Proofs/Custom-Tactics/"
    accessed:
      date-parts: [[2026, 7, 12]]
  - id: rocq-ltac2-2026
    type: webpage
    title: "The Rocq Prover Reference Manual: Ltac2"
    author:
      - literal: "Rocq Development Team"
    issued:
      date-parts: [[2026]]
    URL: "https://rocq-prover.org/refman/proof-engine/ltac2.html"
    accessed:
      date-parts: [[2026, 7, 12]]
  - id: limperg-from-2023
    type: paper-conference
    title: "Aesop: White-Box Best-First Proof Search for Lean"
    author:
      - family: Limperg
        given: Jannis
      - family: From
        given: Asta Halkjær
    issued:
      date-parts: [[2023]]
    container-title: "Proceedings of the 12th ACM SIGPLAN International Conference on Certified Programs and Proofs"
    page: "253-266"
    publisher: ACM
    DOI: "10.1145/3573105.3575671"
  - id: gauthier-et-al-2021
    type: article-journal
    title: "TacticToe: Learning to Prove with Tactics"
    author:
      - family: Gauthier
        given: Thibault
      - family: Kaliszyk
        given: Cezary
      - family: Urban
        given: Josef
      - family: Kumar
        given: Ramana
      - family: Norrish
        given: Michael
    issued:
      date-parts: [[2021]]
    container-title: "Journal of Automated Reasoning"
    volume: "65"
    issue: "2"
    page: "257-286"
    DOI: "10.1007/s10817-020-09580-x"
  - id: blaauwbroek-urban-geuvers-2020
    type: paper-conference
    title: "The Tactician: A Seamless, Interactive Tactic Learner and Prover for Coq"
    author:
      - family: Blaauwbroek
        given: Lasse
      - family: Urban
        given: Josef
      - family: Geuvers
        given: Herman
    issued:
      date-parts: [[2020]]
    container-title: "Intelligent Computer Mathematics"
    page: "271-277"
    publisher: Springer
    URL: "https://arxiv.org/abs/2008.00120"
  - id: fulton-et-al-2017
    type: paper-conference
    title: "Bellerophon: Tactical Theorem Proving for Hybrid Systems"
    author:
      - family: Fulton
        given: Nathan
      - family: Mitsch
        given: Stefan
      - family: Bohrer
        given: Rose
      - family: Platzer
        given: André
    issued:
      date-parts: [[2017]]
    container-title: "Interactive Theorem Proving"
    collection-title: "Lecture Notes in Computer Science"
    collection-number: "10499"
    page: "207-224"
    publisher: Springer
    DOI: "10.1007/978-3-319-66107-0_14"
  - id: leroy-2009
    type: article-journal
    title: "A Formally Verified Compiler Back-End"
    author:
      - family: Leroy
        given: Xavier
    issued:
      date-parts: [[2009]]
    container-title: "Journal of Automated Reasoning"
    volume: "43"
    issue: "4"
    page: "363-446"
    DOI: "10.1007/s10817-009-9155-4"
  - id: gonthier-et-al-2013
    type: paper-conference
    title: "A Machine-Checked Proof of the Odd Order Theorem"
    author:
      - family: Gonthier
        given: Georges
      - family: Asperti
        given: Andrea
      - family: Avigad
        given: Jeremy
      - family: Bertot
        given: Yves
      - family: Cohen
        given: Cyril
      - family: Garillot
        given: François
      - family: Le Roux
        given: Stéphane
      - family: Mahboubi
        given: Assia
      - family: O'Connor
        given: Russell
      - family: Ould Biha
        given: Sidi
      - family: Pasca
        given: Ioana
      - family: Rideau
        given: Laurence
      - family: Solovyev
        given: Alexey
      - family: Tassi
        given: Enrico
      - family: Théry
        given: Laurent
    issued:
      date-parts: [[2013]]
    container-title: "Interactive Theorem Proving"
    collection-title: "Lecture Notes in Computer Science"
    collection-number: "7998"
    page: "163-179"
    publisher: Springer
    DOI: "10.1007/978-3-642-39634-2_14"
  - id: commelin-topaz-2023
    type: article
    title: "Abstraction Boundaries and Spec Driven Development in Pure Mathematics"
    author:
      - family: Commelin
        given: Johan
      - family: Topaz
        given: Adam
    issued:
      date-parts: [[2023]]
    URL: "https://arxiv.org/abs/2309.14870"
    DOI: "10.48550/arXiv.2309.14870"
  - id: gheorghiu-pym-2023
    type: article
    title: "Proof-Theoretic Semantics and Tactical Proof"
    author:
      - family: Gheorghiu
        given: Alexander V.
      - family: Pym
        given: David J.
    issued:
      date-parts: [[2023]]
    URL: "https://arxiv.org/abs/2301.02302"
    DOI: "10.48550/arXiv.2301.02302"
  - id: xin-et-al-2025
    type: article-journal
    title: "Automated Discovery of Tactic Libraries for Interactive Theorem Proving"
    author:
      - family: Xin
        given: Yutong
      - family: Xin
        given: Jimmy
      - family: Poesia
        given: Gabriel
      - family: Goodman
        given: Noah
      - family: Chen
        given: Qiaochu
      - family: Dillig
        given: Isil
    issued:
      date-parts: [[2025]]
    container-title: "Proceedings of the ACM on Programming Languages"
    volume: "9"
    issue: "OOPSLA2"
    page: "343"
    DOI: "10.1145/3763121"
  - id: shen-shi-2026
    type: article
    title: "Keep the Proof State Live: Snapshotting for Efficient Tactic Search in Lean 4"
    author:
      - family: Shen
        given: Austin
      - family: Shi
        given: Yunong
    issued:
      date-parts: [[2026]]
    URL: "https://arxiv.org/abs/2605.25556"
    DOI: "10.48550/arXiv.2605.25556"
type: research-article

date-created: 2026-07-12
description: “Tactical proofing” is not the conventional name of a single mathematical doctrine.
---

# Introduction

“Tactical proofing” is not the conventional name of a single mathematical doctrine. The established literature speaks instead of *tactics*, *tacticals*, *tactical proof*, *tactic-based proving*, and *tactical theorem proving*. Nevertheless, the phrase is useful because it foregrounds an activity rather than a software feature: the organization of proof construction through programmable, goal-directed interventions. Tactical proofing is the practice of turning a conjecture into a certified theorem by repeatedly transforming an explicit proof state, while preserving a rigorous distinction between the procedures that *search for* a proof and the mechanism that *certifies* the resulting derivation. Its canonical setting is the interactive proof assistant, but its conceptual reach is broader. It offers a general account of how formal reasoning may be divided among inference rules, strategic control, reusable abstractions, automated search, and human judgment.

The decisive achievement of tactical proofing is therefore not automation by itself. Automated theorem proving existed before tactics, and many automated procedures do not expose a tactical interface. The distinctive contribution of the tactical tradition is an architectural separation between **logical authority** and **strategic freedom**. The trusted logical kernel implements a small collection of primitive rules or checks explicit proof objects. Above that kernel, tactics may be arbitrarily complicated programs: they may simplify expressions, select lemmas, introduce witnesses, invoke decision procedures, branch nondeterministically, consult databases, call external provers, learn from previous proofs, or fail. Provided that every successful tactic application ultimately yields an object accepted by the kernel, the tactic need not itself belong to the trusted computing base. Robin Milner’s LCF methodology made this separation technically robust by representing theorems through an abstract type whose values could be created only by sound primitive inference operations [@gordon-milner-wadsworth-1979; @milner-1984; @gordon-2015].

In its classical LCF form, a tactic acts on a goal and returns a list of subgoals together with a *validation*. If a goal is written as \(G\), an idealized tactic has the form

\[
  t(G) = \bigl([G_1,\ldots,G_n],v\bigr),
\]

where \(v\) is a function that converts proofs of the subgoals into a proof of the original goal. If \(\mathrm{Thm}(G_i)\) denotes certified evidence for \(G_i\), then

\[
  v : \mathrm{Thm}(G_1) \times \cdots \times \mathrm{Thm}(G_n)
      \longrightarrow \mathrm{Thm}(G).
\]

A tactic is *valid* when every successful result satisfies this condition. The tactic may reduce a goal to no subgoals, in which case its validation directly constructs the theorem, or it may fail because it is inapplicable. A *tactical* is a higher-order operator that combines tactics into new tactics: sequential composition sends the subgoals produced by one tactic into another; alternation tries one tactic and then another on failure; repetition iterates a tactic until it no longer applies. Tactics thus supply local deductive moves, while tacticals supply the control structure of proof search [@paulson-1987; @martin-gardiner-woodcock-1996].

Modern dependent-type systems frequently implement the same idea through metavariables and proof-term elaboration rather than through the exact LCF validation type. A tactic manipulates a proof state containing local hypotheses, unsolved goals, unification constraints, and partially constructed terms. Completion means that every metavariable has been solved and the resulting term type-checks. Lean 4, for example, interprets tactic syntax in a tactic monad layered over its term elaborator, while Rocq’s Ltac2 treats proof manipulation as an effectful computation in a monadic metalanguage [@de-moura-ullrich-2021; @lean-reference-2026; @rocq-ltac2-2026]. These systems differ substantially in foundations and implementation, yet they preserve the tactical division of labor: the user or automation controls search at a comparatively high level, and the kernel controls admissibility at the foundational level.

This paper advances three connected claims. First, tactical proofing should be understood as a *technology of proof refinement*: it operates backward from a desired conclusion, replacing one obligation with others whose satisfaction is sufficient for the original. Second, it is a *compositional theory of proof strategy*: tacticals, tactic languages, reflection procedures, hammers, and learned policies all organize the order in which deductive possibilities are explored. Third, its current frontier is mathematical as much as computational. Open problems concern the denotational and operational semantics of tactic languages, the algebra of search effects, the equivalence and refactoring of proof scripts, the discovery of reusable tactical abstractions, the formal verification of tactic implementations, and the representation of proof states for machine learning. Tactical proofing is consequently neither a thin interface over deduction nor a mere collection of convenience commands. It is the layer in which proof becomes programmable without surrendering the distinction between finding a derivation and knowing that the derivation is correct.

# Conceptual Genealogy of Tactical Proof

The genealogy of tactical proof begins in the tension between two ambitions of early automated reasoning. One ambition sought procedures that would discover proofs autonomously: resolution, decision procedures, rewriting systems, and heuristic search were evaluated by the classes of problems they could solve with minimal intervention. The other ambition sought a dependable computational medium in which a mathematician or computer scientist could construct large derivations interactively. The first treats proof primarily as a search problem; the second treats it as a disciplined collaboration between human judgment and machine bookkeeping. Tactics arose when these ambitions were reorganized rather than simply combined. Search procedures became programmable components inside an interactive environment, while logical soundness was protected independently of their complexity.

The immediate origin is LCF, the “Logic for Computable Functions” lineage developed by Robin Milner and collaborators from Dana Scott’s logic of computation. LCF was intended for rigorous reasoning about recursive programs and denotational semantics. Its crucial engineering problem was extensibility: users needed to add sophisticated proof procedures without modifying or re-verifying the trusted logical core. The LCF solution used the type system of ML to hide the representation of the theorem datatype. Primitive inference functions could create values of type `thm`; arbitrary user programs could combine those values, but could not fabricate them directly. Soundness therefore depended on the implementation of the abstract theorem type, its primitive inference operations, and the language/runtime mechanisms enforcing abstraction—not on the correctness of every tactic program [@gordon-milner-wadsworth-1979; @gordon-2015].

This “LCF approach” altered the topology of trust. A monolithic prover attempts to make the entire search engine correct. An LCF-style prover instead permits an untrusted or lightly trusted search layer to propose derivations that a small kernel certifies. The importance of this move is easily underestimated because the contemporary proof assistant makes it appear natural. At the time, it answered a foundational software problem: how can users program new reasoning procedures without allowing a bug in those procedures to certify a false theorem? The abstract theorem type supplied one answer. Later systems supplied another by constructing explicit proof terms and checking them with a small type checker. Both instantiate the same principle of de Bruijn-style checking: proof production may be elaborate, but proof checking should be comparatively simple and independently trustworthy.

Tactics supplied the operational form of backward reasoning inside this architecture. Primitive kernel rules are naturally read forward: given theorems matching the premises of a rule, construct a theorem matching its conclusion. Human proving, however, often proceeds backward: begin with the desired conclusion, choose a rule whose conclusion matches it, and accept the rule’s premises as new obligations. The validation attached to an LCF tactic reconciles these directions. Search proceeds backward over goals, while validation later replays the corresponding inference forward over certified subtheorems. A tactic is thus more than a state transformer. It is a refinement step equipped with a continuation from future subproofs to the present proof. This continuation structure is why tactics compose and why their soundness can be localized.

The term *tactical* names the second major innovation. A tactic such as introduction, rewriting, induction, or resolution expresses a proof operation. A tactical expresses how operations are coordinated. Sequential composition, alternative choice, repetition, focus, progress tests, and bounded search transform a collection of local procedures into a proof strategy. Milner emphasized that tactics could be programmed in ML precisely because fixed menus of proof commands were inadequate for serious formalization [@milner-1984]. The proof engineer could create a domain-specific automation layer suited to a theory, then apply it interactively while retaining access to lower-level goals when automation failed. The resulting method avoided a false choice between fully manual derivation and opaque full automation.

Cambridge LCF and the HOL family generalized and stabilized this style. Lawrence Paulson’s account of Cambridge LCF systematized the relationship among inference rules, conversions, tactics, tacticals, and rewriting [@paulson-1987]. HOL inherited the LCF kernel discipline and used Standard ML as its extension language, making tactical proof a durable methodology for higher-order logic and hardware verification. The theorem prover became not just a decision engine but a programmable laboratory: new proof procedures could be prototyped at the meta-level, combined interactively, and relied upon without entering the trusted kernel.

Isabelle changed the level at which generality was pursued. Rather than fixing one object logic and supplying tactics over it, Isabelle represented logical rules within a meta-logic and used higher-order unification and resolution to support multiple object logics. Paulson’s generic theorem prover retained the LCF trust discipline while making the inference framework itself programmable [@paulson-1989; @paulson-2019]. This shift clarified that tactics belong neither exclusively to a particular foundation nor to a particular syntax. They operate over an abstract relation between goals, rules, and justifications. Isabelle could therefore support tactical reasoning in higher-order logic, first-order logic, set theory, and constructive type theories while sharing substantial infrastructure.

Constructive type theory introduced a complementary interpretation. In systems such as Nuprl and Coq—now Rocq—a proposition is represented as a type and a proof as a term inhabiting that type. Backward proof becomes the incremental construction of a term with holes. Applying a tactic refines a hole into a term containing new holes; solving all goals produces a complete term that the kernel checks. Tactics here are elaborators of proof terms. They need not expose the low-level term being built, but their success is ultimately grounded in type checking. Rocq’s Ltac made tactic programming into a language of its own, with pattern matching over goals, backtracking, recursion, and dynamic manipulation of proof states [@delahaye-2000]. The tactic language became sufficiently expressive to support large automation frameworks, but that expressiveness also made its semantics, debugging behavior, and maintenance properties difficult to understand. Work on operational semantics for Ltac and on typed successors such as Mtac2 and Ltac2 responded to these limitations [@jedynak-biernacka-biernacki-2013; @kaiser-et-al-2018; @rocq-ltac2-2026].

The maturation of tactical proving produced a reaction against its own success. Dense tactic scripts could be concise and executable yet obscure the mathematical argument. Their meaning could depend on ambient simplification sets, search order, elaborator heuristics, or the exact state of a library. A small change in definitions or automation might break a script whose human-readable structure was never explicit. Mizar had long emphasized declarative, line-oriented proofs. Isabelle/Isar brought a similar concern into the LCF tradition by offering a structured proof language in which intermediate claims, contexts, and calculational steps could be stated explicitly [@wenzel-2002]. Isar did not eliminate tactics; it placed local automation inside a declarative document structure. This hybrid became a recurring design pattern: tactical automation is strongest when bounded by explicit propositions and abstraction boundaries.

Theoretical work in the 1990s and 2000s attempted to isolate the mathematical structure implicit in practical tactic languages. A tactic calculus treated tactics and tacticals as objects with formal composition laws rather than as ad hoc ML programs [@martin-gardiner-woodcock-1996]. Monadic interpretations identified proof search with effectful computation: failure, nondeterminism, state, exceptions, output, and backtracking could be modeled by suitable monadic structure [@martin-gibbons-2002]. Hierarchical proof systems examined how low-level tactical execution could preserve a higher-level account of proof structure, enabling visualization, transformation, and provenance [@aspinall-denney-luth-2010]. These developments shifted attention from the soundness of individual derived rules to the semantics of the proof-construction process itself.

Lean represents a further convergence of these lines. Its kernel checks dependent type-theoretic terms; its elaborator manages implicit arguments, coercions, type-class search, metavariables, and unification; its tactic framework is implemented in the same extensible programming language used for ordinary development. Tactic syntax may expand through hygienic macros or execute custom elaborators in `TacticM`, a stateful layer over term elaboration [@de-moura-ullrich-2021; @lean-reference-2026]. This design makes the tactical layer unusually permeable: mathematical libraries can define new syntax, procedures, simplifiers, decision tactics, and domain-specific proof languages without leaving Lean. It also intensifies foundational questions. The practical proof state is no longer merely a list of formulas. It includes elaboration state, metavariable assignments, synthetic opaque terms, local instances, reducibility settings, and environment extensions. The mathematical abstraction “tactic as a transformation of goals” remains valid, but the computational object realizing it has become substantially richer.

By the 2020s, tactical proof had become the default action space for machine-learning systems in interactive theorem proving. TacticToe learned tactic selection from HOL4 proofs and combined prediction with Monte Carlo tree search [@gauthier-et-al-2021]. Tactician learned from Rocq proof scripts and offered both next-step suggestions and automated search [@blaauwbroek-urban-geuvers-2020]. Aesop exposed a configurable, white-box best-first search procedure within Lean, allowing users to register safe and unsafe rules and inspect the resulting proof search [@limperg-from-2023]. These systems did not supersede the LCF insight. They depended on it. Statistical models and search algorithms could be admitted into the proof-production layer precisely because their outputs remained subject to kernel checking. The genealogy of tactical proof is therefore cumulative: abstract theorem types, backward refinement, tacticals, generic logics, proof-term elaboration, structured proof, monadic semantics, extensible metaprogramming, and learned search are successive answers to the same problem of making rigorous reasoning programmable without making correctness hostage to the strategy program.

# Practical Applications of Tactical Proof Today

The contemporary use of tactical proofing is best understood as a layered workflow. At the lowest level, a kernel recognizes primitive derivations or type-checks proof terms. Above it, an elaborator translates surface syntax into foundational expressions and manages implicit structure. Above elaboration, tactics transform proof states and generate terms. Libraries then package recurring tactics, decision procedures, rewrite systems, theorem-search tools, and domain-specific automation. Finally, users organize these components into proofs whose visible text may range from explicit declarative arguments to compact tactic programs. Practical effectiveness depends less on any single layer than on the stability of the interfaces among them.

In routine interactive work, tactics serve first as an ergonomic language for natural deduction and equational reasoning. Introduction tactics move universally quantified variables or hypotheses into the local context. Application tactics match a theorem’s conclusion against the current target and generate its premises as subgoals. Rewriting tactics replace equals by equals under controlled orientations and locations. Constructor tactics reduce a goal involving an inductive type to the obligations associated with a chosen constructor. Induction tactics create base and step cases while managing motives and generalized variables. Simplifiers repeatedly apply oriented equations from a curated database. Arithmetic tactics invoke normalizers or decision procedures. The proof engineer alternates between semantic decisions—what lemma, invariant, induction principle, or representation is appropriate—and mechanical transformations that the tactic layer performs reliably.

The most important practical distinction is between *proof-producing* and merely *answer-producing* automation. A computer algebra system may report that a polynomial identity is true; a tactical decision procedure integrated into a proof assistant must also provide evidence the kernel can check. Reflection is a standard method. A mathematical expression is reified as syntax inside the logic, a verified algorithm computes a normal form or decision, and a correctness theorem transports that computation back to the original proposition. Reflection can turn long sequences of primitive rewrites into efficient computation while preserving kernel-level certification. In Rocq’s Mathematical Components tradition, small-scale reflection made boolean decision procedures and canonical structures central to large formal proofs. The machine-checked proof of the Feit–Thompson odd-order theorem depended not simply on a large number of tactics but on a proof-engineering methodology in which reusable representations, computational reflection, and carefully controlled automation compressed extensive finite reasoning [@gonthier-et-al-2013].

Tactical proofing also organizes large-scale formal mathematics. A project such as the Liquid Tensor Experiment cannot be reduced to running a powerful automatic prover against a research theorem. The work requires definitions, interfaces, intermediate theorems, instance synthesis, library search, normalization, and a division of the argument into components that can be developed independently. Commelin and Topaz describe this process in terms of abstraction boundaries and specification-driven development: contributors can prove against a stable interface even when the implementation beneath that interface is incomplete or later replaced [@commelin-topaz-2023]. Tactics are essential within each local proof, but the larger achievement is architectural. Tactical automation becomes sustainable when propositions and APIs delimit its scope.

In software verification, tactics mediate between semantic models and repetitive proof obligations. A verified compiler proof contains recurring simulations, inversions of operational semantics, preservation lemmas, arithmetic side conditions, and data-structure invariants. Tactical automation can discharge the local obligations while the human supplies the global simulation relation and decomposition of compiler passes. CompCert’s verified back end illustrates the scale of this division: Rocq was used both to define executable components and to prove semantic preservation from an intermediate language to assembly [@leroy-2009]. The crucial guarantee is not that the tactic scripts are transparent or bug-free, but that the generated proof terms establish the claimed refinement when checked by the kernel.

Domain-specific tactic languages are especially valuable where the logic has a recognizable proof calculus but general automation is either undecidable or poorly aligned with expert reasoning. Bellerophon, the tactic language of the KeYmaera X ecosystem, supports proofs about hybrid systems combining discrete programs with continuous differential equations. Verification in differential dynamic logic requires choices about invariants, differential cuts, symbolic execution, arithmetic, and decomposition of control modes. Bellerophon lets users encode these choices as tactics while retaining a small foundational prover core [@fulton-et-al-2017]. The tactic language here is not a generic convenience layer. It is a formal medium for communicating domain expertise to a prover.

The same pattern appears in separation logic, concurrency verification, hardware reasoning, cryptographic protocol analysis, and program synthesis. A domain-specific tactic packages a recurring semantic argument: symbolic execution through a command, cancellation in a resource model, application of a frame rule, normalization of a circuit expression, discharge of a side condition, or refinement of a specification into executable code. When this packaging is successful, the tactic becomes a reusable unit of disciplinary knowledge. It does not merely shorten a proof. It stabilizes a method by fixing what counts as the relevant state, what transformations are permitted, which search order is effective, and what evidence must be returned.

Hammers occupy a related but distinct practical niche. A hammer translates the current proof state and a selected set of library lemmas into the input language of external automated theorem provers or SMT solvers. If an external prover finds a proof, the assistant reconstructs or rechecks sufficient evidence internally. This arrangement exploits mature automation without enlarging the foundational trust base to include the external solver. In Isabelle, Sledgehammer became a routine bridge between interactive higher-order reasoning and external first-order automation. The tactic user need not choose every intermediate lemma manually; premise selection and external search propose a route, while reconstruction produces an Isabelle proof. Hammers demonstrate the modularity of tactical architecture: the search engine may use a different logic, representation, and implementation, provided that the final result can be translated back into certified inferences.

Modern proof search tactics increasingly expose their strategy rather than presenting automation as a black box. Aesop in Lean performs best-first search over a user-configured collection of rules and distinguishes “safe” rules, which should not lose provability, from “unsafe” rules, which create speculative branches [@limperg-from-2023]. This design makes proof search an extensible library component. A mathematical domain can register constructors, forward rules, simplification procedures, and terminal tactics. The resulting automation is stronger than a fixed general-purpose `auto`, yet more inspectable than an opaque learned prover. The practical lesson is that tactic quality depends on the granularity and organization of the action space. Effective proof search uses abstractions that correspond to mathematical methods rather than only to primitive inference steps.

Proof maintenance is another central application. Formal developments evolve: definitions are generalized, namespaces are reorganized, theorem statements change, simplification lemmas are added, and elaboration heuristics improve. Tactic scripts can be robust when they depend on stable semantic properties, but brittle when they depend on accidental syntactic forms, goal ordering, automatically generated names, or a global search database. Structured proofs and hierarchical proof representations mitigate this problem by preserving intermediate claims and proof provenance [@wenzel-2002; @aspinall-denney-luth-2010]. Typed tactic languages mitigate a different class of failures by checking the tactic program’s own data flow. Proof engineering increasingly treats tactics as software artifacts requiring modularity, tests, documentation, interfaces, and refactoring.

Tactical proofing also supports pedagogy, although with an important ambiguity. Tactics can make formal deduction concrete: each command visibly transforms the local context and target, allowing a student to inspect the exact obligations created by implication introduction, case analysis, induction, or existential instantiation. Yet high-level automation can conceal the same structure. A curriculum based only on “try tactics until the goal disappears” teaches interface manipulation rather than proof. The productive pedagogical use of tactics keeps the refinement relation explicit. Students should be able to explain why the produced subgoals suffice, what inference rule or theorem justifies the step, and how the completed subproofs compose into the original result.

Machine-learning assistance has become a practical extension of this interactive workflow. A learned tactic predictor maps a representation of the proof state to a distribution over tactic applications. Search explores the resulting branches, and the proof assistant provides exact feedback: a tactic either parses, elaborates, changes the state, closes a goal, fails, or exceeds resource limits. TacticToe and Tactician showed that tactic-level learning can exploit existing proof corpora [@gauthier-et-al-2021; @blaauwbroek-urban-geuvers-2020]. Contemporary language-model systems intensify this pattern by generating tactics, premises, auxiliary lemmas, or whole proof fragments. Their reliability still comes from the old architecture. A model’s confidence is not evidence of theoremhood; acceptance by the kernel is.

The practical limits of tactics are as important as their successes. A tactic may close the wrong formal statement because the specification itself is inadequate. It may rely on inconsistent axioms, classical principles, quotient soundness, or unsafe foreign code admitted by the environment. It may generate a huge proof term whose checking cost is prohibitive. It may terminate unpredictably, become exponentially expensive under a minor goal change, or hide a mathematically important dependency inside a global automation database. It may produce a script that is correct today but impossible for a future maintainer to understand. Tactical proofing does not remove the need for specification, modeling, review, and mathematical exposition. It reallocates those responsibilities: correctness of derivation is mechanized, while correctness of formalization and adequacy of abstraction remain substantive human tasks.

The best present practice therefore combines tactical and declarative modes. A proof document states the theorem, introduces named intermediate results, explains the conceptual decomposition, and uses tactics to discharge bounded obligations. Large tactic invocations are justified by their specifications and controlled inputs. Domain-specific automation is factored into reusable libraries rather than copied across scripts. Search procedures emit replayable proofs rather than unverifiable success flags. The kernel remains small, but the proof-engineering culture around it treats the entire path from statement to certificate as a maintainable artifact. Tactical proofing is practically mature when it makes the routine invisible without making the argument unintelligible.

# Mathematical Frontiers of Tactical Proofing

The mathematical frontier of tactical proofing begins with a deceptively simple question: *what is a tactic?* The textbook LCF answer—`goal -> goal list × validation`—captures the essential soundness discipline but abstracts away failure, nondeterminism, state, metavariables, resource bounds, messages, asynchronous computation, and interaction with a mutable theory environment. The common modern answer—“a function transforming proof states”—is too permissive unless the relevant notion of state and the evidential relation between input and output are specified. A serious semantics must distinguish at least four objects: the formal judgment to be established, the partial proof object under construction, the operational state of the prover, and the search process by which successor states are chosen.

One frontier is therefore the **semantics of tactic languages**. A tactic may diverge, fail recoverably, fail fatally, produce one successor, enumerate many successors lazily, commit to a choice, or alter global state. Sequential composition interacts with the number and ordering of goals. Alternation interacts with side effects and backtracking. Repetition requires a notion of progress to avoid trivial divergence. Pattern matching may be intensional, depending on syntax, or extensional up to definitional equality. Operational work on Ltac showed that these distinctions are not implementation trivia: without a formal account, even apparently simple tactic expressions can have surprising behavior [@jedynak-biernacka-biernacki-2013].

Monadic accounts provide one family of abstractions. If a tactic is interpreted as a Kleisli arrow

\[
  t : S \longrightarrow M(S),
\]

then the monad \(M\) can encode computational effects such as partiality, nondeterminism, state, exceptions, logging, or combinations thereof. Sequential tactical composition is Kleisli composition; a failing tactic may be represented by a zero of a `MonadPlus`-like structure; alternative choice may be represented by an addition operation; repetition may be a fixed point. This approach explains why practical tactic languages resemble effectful functional languages and why Rocq’s Ltac2 explicitly treats proof manipulation as monadic [@martin-gibbons-2002; @rocq-ltac2-2026]. The unresolved problem is that ordinary monadic semantics does not by itself express *proof relevance*: a transition must carry or preserve a justification that successor obligations suffice for the predecessor. The semantic object should combine effects with a refinement relation or proof-producing continuation.

A second frontier is the **proof-theoretic meaning of tactics**. Traditional model-theoretic semantics evaluates formulas in structures. Proof-theoretic semantics treats inferential role and proof as primary. Tactical proof introduces a further layer: it concerns not only completed derivations but reductive procedures for finding them. Gheorghiu and Pym use proof-theoretic validity to relate arguments, inference, and search, suggesting that tactical systems can receive a semantics in which valid reductions preserve the possibility of constructing a canonical argument [@gheorghiu-pym-2023]. This line raises foundational questions. Under what conditions does a reduction procedure preserve validity? How should failed or branching searches be interpreted? Can tactical equivalence be defined independently of implementation traces? How do structural rules, substructural contexts, or nonclassical logics alter the admissible algebra of tactics? A general theory would treat tactics as semantic objects across logics rather than as commands tied to one prover.

A third frontier is the **algebra of tactic composition**. Existing tacticals form recognizable structures—sequencing, choice, iteration, focusing—but their equations are often only conditionally valid. `THEN` is associative only relative to conventions about goal distribution and failure. `ORELSE` is generally noncommutative because search order matters. Repetition is sensitive to whether success without progress is permitted. Parallel search introduces races and cancellation. Memoization changes intensional behavior while ideally preserving extensional results. A useful algebra must therefore separate at least three equivalences: equality of accepted theorem sets, equality of generated proof objects, and equality of operational behavior. Two tactics may prove the same goals but produce proof terms with different size, dependencies, transparency, or checking cost. They may be extensionally equivalent yet have radically different search complexity.

The connection to rewriting strategy is especially fertile. A simplifier is not merely a set of equations; it is an orientation, traversal order, congruence policy, termination discipline, and treatment of conditional rules. Likewise, a tactic library is not merely a set of admissible inferences; it is a strategy for exposing and prioritizing them. Techniques from term rewriting, focused proof systems, abstract interpretation, game semantics, and control theory may each illuminate different parts of tactical behavior. Focusing, for example, separates invertible from noninvertible proof phases, reducing irrelevant nondeterminism. Aesop’s distinction between safe and unsafe rules is an engineering analogue of this proof-theoretic idea [@limperg-from-2023]. A deeper account could derive search policies from the logical polarity and structural properties of rules rather than assigning heuristic priorities manually.

A fourth frontier is **typed and verified metaprogramming**. Traditional tactic languages maximize flexibility by exposing syntax trees, unification, environments, and proof-state mutation. This flexibility shifts errors to runtime. A tactic may construct ill-typed intermediate terms, assume a nonexistent goal shape, mishandle binders, or fail after performing expensive work. Mtac2 demonstrates that dependent types can move some of these obligations into the tactic language itself, while still permitting backward reasoning over the proof state [@kaiser-et-al-2018]. Yet fully typed tactic programming remains difficult because the type of a tactic can depend on the precise current context, target, and effects it may perform. The frontier is not merely “make tactics typed,” but identify a tractable type theory of proof-state transformations that captures useful invariants without making routine metaprogramming impossible.

Verification can also occur by reflection or by proving the tactic implementation correct. A reflective tactic reduces trust by proving a generic soundness theorem for an internal decision procedure. But many tactics mix verified components with untrusted orchestration, foreign solvers, optimized native computation, or compiler-generated code. The resulting trust chain may include the kernel, elaborator, virtual machine, compiler, operating system, and hardware. A mature theory of tactical proof should make these trust boundaries explicit. It should distinguish a proof term checked by reduction from a theorem introduced by an oracle, a certificate checked by a verified procedure, and a result accepted through an unsafe extension. “Kernel-checked” is not a single implementation property but a family of evidence pathways.

A fifth frontier is **proof representation and invariance**. Machine-learning systems usually treat the tactical proof state as an observation and tactics as actions. But proof states contain many accidental choices: names of local hypotheses, ordering of assumptions, elaborated constants, universe levels, inserted coercions, syntactic sugar, and library-specific encodings. A robust prover should recognize states that are mathematically equivalent despite such variation. The challenge is to construct representations invariant under alpha-renaming, definitional equality, harmless reordering, and changes of presentation, while retaining enough structure to predict useful actions. This is not simply a feature-engineering problem. It asks for a quotient of operational proof states by an appropriate semantic equivalence.

Tactic Dependence Graphs provide one recent answer at the level of completed scripts. They represent tactic applications as nodes and logical dependencies among proof states as edges, abstracting away some syntactic variation and goal-order artifacts. TacMiner uses these graphs to discover recurring higher-level tactics and to refactor proof corpora [@xin-et-al-2025]. The mathematical significance lies in the shift from sequence to dependency structure. A tactic script is written linearly because a machine executes it in time, but the proof it constructs may have a partial order of dependencies. Mining that partial order can reveal commutations, independent branches, reusable subprocedures, and latent abstractions. This suggests a general research program in which proof scripts are compiled into causal or dependency graphs before equivalence, compression, or learning is attempted.

A sixth frontier is **automatic tactic synthesis**. Most learned theorem provers select among tactics already supplied by humans. Yet the useful action vocabulary of a mature formalization is itself a historical product. Experts identify repeated proof patterns and package them as new tactics. TacMiner shows that tactic libraries can be mined from proof corpora, producing higher-level abstractions that improve compression and downstream automation [@xin-et-al-2025]. The open mathematical problem is to characterize when such an abstraction is legitimate and useful. Compression alone may discover macros that are frequent but conceptually accidental. A strong synthesized tactic should have a stable domain of applicability, predictable failure behavior, intelligible parameters, and a semantics that supports compositional reasoning. It should correspond to a reusable proof method, not merely a repeated token sequence.

This problem resembles library learning and program synthesis but differs because tactic programs manipulate implicit logical state. Anti-unification can generalize syntax, yet two proof traces with different syntax may realize the same strategy, while superficially similar traces may depend on incompatible invariants. Dependency graphs, proof terms, theorem statements, and local contexts must therefore be analyzed together. One promising objective is *minimum description length under semantic constraints*: discover a tactic library that compresses a corpus while preserving replayability, exposing stable interfaces, and limiting dependence on incidental syntax. Such a criterion would connect proof engineering to formal language theory, graph compression, and statistical model selection.

A seventh frontier is **search complexity and persistent proof states**. Tactical search branches over partially elaborated proofs. In many current systems, exploring a branch requires reconstructing the environment and replaying earlier elaboration. This mismatch between the tree structure of search and the execution model of the prover can dominate runtime. Recent work on snapshotting Lean proof states reports large speedups by capturing an elaborated state once and reusing it across branches [@shen-shi-2026]. Beneath the engineering result lies a mathematical question about persistence: what is the minimal sufficient state of a proof branch, and which components can be shared safely? A proof state may contain references to mutable caches, generated names, delayed constraints, and environment extensions. Persistent branching requires a principled account of identity, immutability, and rollback in elaboration.

Parallel tactical proof search sharpens this issue. Independent branches can be evaluated concurrently, but tactic effects, global caches, and resource limits complicate determinism. If two branches produce different valid proofs, which should be retained? The shortest term, smallest dependency set, fastest replay, clearest script, or most stable abstraction may each be preferable under different objectives. Tactical theorem proving is therefore naturally multi-objective. Success is not exhausted by finding any proof. The frontier includes optimization over proof quality: term size, kernel-checking time, axiom footprint, maintainability, explanatory structure, and robustness under library change.

An eighth frontier concerns **the relation between tactical and declarative proof**. Tactical scripts record how a proof was found; declarative proofs record why the conclusion follows through named intermediate propositions. Neither description is complete. A purely declarative text may omit the computational work needed to verify local steps, while a purely tactical text may omit the mathematical invariants that made search tractable. Hierarchical proof objects attempt to preserve both levels [@aspinall-denney-luth-2010]. The open problem is to define transformations between them that preserve meaning. Can a successful tactic trace be reconstructed into a stable declarative argument? Can a declarative skeleton generate tactical obligations automatically? Can refactoring preserve a proof’s explanatory commitments rather than only its theorem statement?

This question becomes urgent in AI-assisted proving. Language models can propose informal plans, tactic sequences, lemmas, and proof repairs, but their internal reasoning is not itself a certificate. A promising architecture alternates between declarative planning and tactical verification: the model proposes intermediate claims; the prover checks them and returns exact subgoals; search fills routine gaps; failures revise the plan. The mathematical challenge is to make the interface between these levels explicit. An informal sentence must be translated into a formal proposition; a formal subgoal must be related back to its intended role; and auxiliary lemmas must not distort the theorem’s assumptions or introduce unrecognized axioms. Tactical proofing supplies the verification loop, but a theory of *proof intent* is still missing.

The broadest frontier is to understand tactical proof as a general mathematics of **reductive problem solving**. A goal is reduced to obligations; obligations may branch; strategies control the reductions; successful leaves are composed into a certificate. This pattern appears beyond theorem proving in type inhabitation, program synthesis, constraint solving, planning, symbolic execution, and verification-condition generation. What distinguishes proof is the requirement that reductions be linked to an explicit validity relation. Tactical proofing may therefore provide a unifying formalism for systems in which search is heuristic but solutions are certifiable. The LCF insight becomes a general design principle: permit rich, revisable, and even unreliable strategies above a narrow evidential interface.

The future of tactical proofing will not be determined solely by stronger automation. It will depend on whether tactics become mathematically better understood as objects of semantics, algebra, synthesis, and verification. The central invariant must remain the separation of discovery from certification, but that separation can be refined. Discovery has internal structure: local deduction, domain strategy, global planning, statistical guidance, and computational search. Certification has internal structure: proof terms, certificates, reflection theorems, reconstruction procedures, and trust assumptions. Tactical proofing is the study of the interfaces among these structures. Its mature form would let mathematicians and verification engineers program proof strategy at the level of their actual concepts, transform and analyze those strategies formally, and delegate search to machines without confusing a machine’s success with the reason a theorem is true.
