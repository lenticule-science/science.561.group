---
title: "Derivation"
type: "page"
date-created: 2026-03-20
description: A Derivation is a pair (π, L) — a finite labeled tree π whose nodes carry formulas (or sequents) and a proof system L = (F, R) — such that every leaf carries an axiom or open hypothesis and every internal node carries the conclusion of…
---

A Derivation is a pair (π, L) — a finite labeled tree π whose nodes carry formulas (or sequents) and a proof system L = (F, R) — such that every leaf carries an axiom or open hypothesis and every internal node carries the conclusion of some rule r ∈ R applied to its children. The defining structure: a derivation is a mechanically checkable certificate that a conclusion follows from hypotheses by a finite sequence of licensed rule applications. Its execution path is rule-governed, not guard-governed (unlike a procedure) and not state-transition-governed (unlike a process). The derivation emerges from proof search but is not the search itself — it is the finite witness the search produces.

Table of contents

- [Formal definition](#formal-definition)

- [Gentzen: natural deduction and sequent calculus](#gentzen-natural-deduction-and-sequent-calculus)

- [Prawitz: normalization](#prawitz-normalization)

- [Curry-Howard: derivations as programs](#curry-howard-derivations-as-programs)

- [Proof trees as directed graphs](#proof-trees-as-directed-graphs)

- [Open questions](#open-questions)

# Derivation

## Formal definition

A **Derivation** is a pair $(\pi, \mathcal{L})$:

(π:Tree(F),  L=(F,R):ProofSystem)(\pi : \mathrm{Tree}(\mathcal{F}),\; \mathcal{L} = (\mathcal{F}, \mathcal{R}) : \mathrm{ProofSystem})

where:

- $\mathcal{F}$ is the **formula set** (or sequent set) of the proof system — the universe of propositions that can appear as nodes of $\pi$; formulas are built from a vocabulary of atomic propositions and logical connectives by the grammar of $\mathcal{L}$

- $\mathcal{R}$ is the **rule set** — a collection of **inference rules**, each of the form φ1⋯φnψ\frac{\varphi_1 \quad \cdots \quad \varphi_n}{\psi} expressing that conclusion $\psi$ follows from premises $\varphi_1, \ldots, \varphi_n$ by one licensed step; a rule with zero premises is an **axiom scheme**

- $\pi$ is a **finite labeled tree** with nodes labeled by elements of $\mathcal{F}$, satisfying:

Every **leaf** of $\pi$ carries either an axiom $\alpha \in \mathcal{F}$ licensed by a zero-premise rule of $\mathcal{R}$, or an **open hypothesis** $\gamma$ from a designated hypothesis set $\Gamma$

- Every **internal node** of $\pi$ carries a formula $\psi$ that is the conclusion of some rule $r \in \mathcal{R}$ whose premises match the labels of that node&rsquo;s children (in order)

- The **root** of $\pi$ carries the **conclusion** of the derivation

The derivation relation $\Gamma \vdash_\mathcal{L} \varphi$ holds iff there exists a derivation $\pi : \Gamma \vdash_\mathcal{L} \varphi$.

**Two invariants.** $(\pi, \mathcal{L})$ is a derivation iff:

- **Rule-licensedness**: every inference step in $\pi$ is licensed. For each internal node labeled $\psi$ with children labeled $\psi_1, \ldots, \psi_n$, there exists $r \in \mathcal{R}$ of the form ψ1  ⋯  ψnψ\frac{\psi_1 \; \cdots \; \psi_n}{\psi}. No step proceeds by fiat; every inference is justified by an applicable rule. This invariant makes the derivation mechanically checkable — a verifier need not understand the proof to confirm it is correct. This is what distinguishes derivation from argument: a well-formed argument persuades; a derivation certifies.

- **Finite witnessing**: $\pi$ is finite. A derivation is a concrete, finite object that exhibits the derivation relation rather than merely asserting it. The derivability relation $\vdash_\mathcal{L}$ is defined as the existence of such a finite witness — not as an infinite limit or a semantic condition. This is the invariant that gives derivations their computational character: a derivation can be stored, transmitted, and verified in finite time.

**Derivation identity.** Two derivations $\pi_1$ and $\pi_2$ of the same conclusion from the same hypotheses are **equal** when they are identical as labeled trees. This is too fine: it distinguishes derivations that differ only in the order of independent subderivations or in computational detours. The standard coarser notions:

- **Normal-form equality**: $\pi_1 \equiv \pi_2$ iff they reduce to the same normal form under normalization; the canonical form identifies derivations up to all computational detours

- **Proof-net identity** (for multiplicative linear logic): derivations are the same iff their proof nets are identical — the graphical canonical form eliminating sequencing arbitrariness

The identity of derivations is a deep open problem (see Open questions).

## Gentzen: natural deduction and sequent calculus

Gerhard Gentzen introduced two complementary proof systems in *Untersuchungen über das logische Schließen* (1935):

**Natural deduction** (systems NJ for intuitionistic logic, NK for classical logic) organizes inference rules in **introduction/elimination pairs** for each connective:

ABA∧B∧IA∧BA∧E1A∧BB∧E2\frac{A \quad B}{A \wedge B} \wedge\mathrm{I} \qquad \frac{A \wedge B}{A} \wedge\mathrm{E_1} \qquad \frac{A \wedge B}{B} \wedge\mathrm{E_2}

The $\to$-introduction rule involves **hypothesis discharge**:

[A]u⋯BA→B→Iu\frac{[A]^u \quad \cdots \quad B}{A \to B} \to\mathrm{I}^u

This introduces $A \to B$ and simultaneously discharges open hypothesis $A$ at leaves labeled $u$. The discharge mechanism makes natural deduction structurally closer to actual mathematical proof practice than axiom systems.

**Sequent calculus** (LJ for intuitionistic, LK for classical) uses sequents $\Gamma \vdash \Delta$ as the basic judgment. The **cut rule**:

Γ⊢A,ΔΓ′,A⊢Δ′Γ,Γ′⊢Δ,Δ′Cut\frac{\Gamma \vdash A, \Delta \quad \Gamma&#x27;, A \vdash \Delta&#x27;}{\Gamma, \Gamma&#x27; \vdash \Delta, \Delta&#x27;} \mathrm{Cut}

is the formal analogue of lemma application.

**Gentzen&rsquo;s Hauptsatz** (*cut-elimination theorem*): every derivation in LK or LJ containing cut can be transformed into a cut-free derivation of the same endsequent. Cut-free derivations satisfy the **subformula property**: every formula in the derivation is a subformula of the conclusion. This makes cut-free derivations analytic — they introduce no information beyond what is present in the conclusion. Cut elimination is the primary tool for proving consistency and decidability.

## Prawitz: normalization

Dag Prawitz (*Natural Deduction: A Proof-Theoretical Study*, 1965) proved the **normalization theorem** for NJ: every derivation can be reduced to **normal form** by a terminating rewrite system.

A derivation contains a **detour** (redex) when a connective is introduced and immediately eliminated:

ABA∧B∧IA∧E1  ⇝  A\frac{\dfrac{A \quad B}{A \wedge B} \wedge\mathrm{I}}{A} \wedge\mathrm{E_1} \;\leadsto\; A

The normalization step removes the introduction-elimination pair, replacing it with the direct derivation of the component formula. Prawitz proved:

- **Weak normalization**: every derivation has at least one normalization sequence to a normal form

- **Strong normalization** (for NJ): every normalization sequence from any derivation terminates

A **normal derivation** contains no detours: no introduction rule&rsquo;s conclusion is the major premise of the corresponding elimination. Normal derivations are the canonical proof objects — minimal witnesses, containing no logically superfluous steps.

Normalization and cut elimination are the same operation viewed from different formal presentations: the translations between natural deduction and sequent calculus are inverse operations that commute with normalization/cut-elimination.

## Curry-Howard: derivations as programs

The Curry-Howard isomorphism (Curry 1934, implicit; Howard 1969, formulated; published 1980) identifies:

Logic (NJ)
Type theory ($\lambda$-calculus)

Formula $A$
Type $A$

Derivation $\pi : \Gamma \vdash A$
Term $e : \Gamma \vdash e : A$

$\wedge$-introduction
Pair formation $\langle e_1, e_2 \rangle$

$\to$-introduction (discharge)
$\lambda$-abstraction $\lambda x.e$

$\to$-elimination (modus ponens)
Function application e1  e2e_1\; e_2

Normalization step
$\beta$-reduction (λx.e1)  e2⇝e1[e2/x](\lambda x.e_1)\; e_2 \leadsto e_1[e_2/x]

Normal form
$\beta$-normal form

Per Martin-Löf (*An Intuitionistic Theory of Types*, 1975; *Intuitionistic Type Theory*, 1984) extended Curry-Howard to **dependent types**: types that depend on values. In Martin-Löf type theory (MLTT), the proposition-as-types reading is exact: universal quantification $\forall x : A. B(x)$ is the dependent function type $\Pi_{x:A} B(x)$; a proof is a function that for each $a : A$ produces a proof of B(a)B(a).

**Homotopy type theory** (Voevodsky, Awodey et al., *HoTT Book* 2013) interprets MLTT geometrically: types are spaces, terms are points, identity proofs are paths, and higher-dimensional proofs are homotopies. A derivation of $\mathrm{Id}_A(a, b)$ is a path between $a$ and $b$ in the space $A$.

The **Curry-Howard-Lambek correspondence** adds a fourth vertex: the derivation $\pi : \Gamma \vdash A$ is simultaneously a logical proof (natural deduction), a program (typed lambda calculus), and a morphism $\Gamma \to A$ in a cartesian closed category. The three presentations are equi-expressive, making derivation the organizing concept of this three-way identification.

## Proof trees as directed graphs

A derivation $\pi$ is a **finite directed acyclic graph** (DAG) when sharing is allowed; in natural deduction without sharing, $\pi$ is a tree. In **proof nets** (Girard 1987, *Linear Logic*, TCS) for multiplicative linear logic, the derivation is a bipartite graph — the sequent calculus&rsquo;s rule-ordering arbitrariness is factored out, leaving only the essential logical connectivity.

The **reduction graph** of derivations in $\mathcal{L}$: nodes are derivations, edges are normalization steps π⇝π′\pi \leadsto \pi&#x27;. Properties of this graph determine the proof theory:

- **Strong normalization**: every path in the reduction graph is finite (no infinite reduction sequences)

- **Confluence** (Church-Rosser): every pair of reductions from $\pi$ eventually converge to a common reduct; together with strong normalization, this guarantees unique normal forms

**Proof complexity** (Cook 1975; Ben-Sasson & Wigderson 1999): the study of how the minimum-length derivation of $\varphi$ grows as a function of ∣φ∣|\varphi|. Different proof systems can require exponentially different derivation lengths for the same theorems (propositional proof complexity). The question of whether the Frege system has polynomial-size proofs for all tautologies is equivalent to NP ≠ coNP.

## Open questions

- Whether there is a satisfactory notion of **proof identity** — when are two derivations of the same theorem the same proof? Kosta Došen and Peter Schroeder-Heister&rsquo;s program identifies this as the central open problem of structural proof theory. The issue: derivations contain not just logical content but also rule-ordering, which seems irrelevant to proof meaning. No complete axiomatization of proof identity (up to permutation equivalence) is known for full classical logic.

- Whether normalization in dependent type theories (MLTT, Calculus of Constructions) scales to full homotopy type theory — whether the univalence axiom is compatible with a decision procedure for derivation equality, or whether derivation identity in HoTT is fundamentally undecidable.

- Whether Girard&rsquo;s proof-net construction for linear logic — eliminating spurious sequencing — has an analogue for classical logic; or whether canonical graphical proof objects are intrinsically limited to the multiplicative fragment.

- Whether the depth of a derivation (the length of the longest branch from root to leaf) corresponds to a level in the relational history tower — making the tower stratification the depth stratification of the proof-theoretic hierarchy.

- Whether every morphism in the sheaf topos $\mathbf{Sh}(T, J)$ of the relational universe is the image of a derivation in some proof system — making every relational universe morphism the proof-theoretic witness of a history-relative proposition.
