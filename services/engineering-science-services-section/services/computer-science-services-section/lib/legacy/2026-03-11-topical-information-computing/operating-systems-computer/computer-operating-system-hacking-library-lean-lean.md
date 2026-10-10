---
title: "Lean"
description: "Lean is a formal proof assistant based on the Calculus of Inductive Constructions. Three proof modalities (term-mode, tactic-mode, inductive-mode) all produce kernel-verifiable proof terms via structurally distinct paths. The kernel is small and is the only trusted component; all other components produce candidate terms for the kernel to check."
date-created: 2026-03-22
date-modified: 2026-04-28
---

## What it is

**Lean** is a formal proof assistant whose underlying theory is the Calculus of Inductive Constructions (CIC) — a dependent type theory with inductive types, universe polymorphism, and an impredicative `Prop` universe.
Proofs in Lean are typed terms; a proof of proposition $P$ is a term $t$ of type $P$.
The proof assistant supports three proof modalities, each a different *path* to producing such a term:

- **Term-mode** — direct construction.
  The user writes the proof term explicitly.
- **Tactic-mode** — goal-directed construction.
  The user writes a sequence of tactics that build the term incrementally from the goal backward.
- **Inductive-mode** — proof by induction over an inductive type.
  The user supplies base case and step case; the recursor combines them.

All three modalities reduce, at verification time, to the same thing: a typed term that the kernel checks.
The kernel is the single point of trust; tactics, elaboration, macros, and libraries are untrusted code whose output is candidate terms for the kernel to verify.

### Term-mode (syntactic proof)

A **term-mode proof** of proposition `P` is a Lean term `t` of type `P`.
The kernel verifies `t` by reducing it to a normal form under beta (function application), delta (definition unfolding), eta (function extensionality), and iota (recursor computation) rules, and type-checking the normal form.

Example: a term-mode proof of `P ∧ Q → Q ∧ P`:

```lean
fun h => ⟨h.2, h.1⟩
```

The lambda constructs a function (introducing the implication); the anonymous constructor `⟨_, _⟩` assembles the conjunction; `h.
2` and `h.
1` are projections extracting the components.
The term is fully explicit — the kernel does not search; it checks.

**Definitional equality.** Two terms `t₁` and `t₂` that normalize to the same form are *definitionally equal* — the kernel treats them as identical without proof.
This is distinct from propositional equality (`h : t₁ = t₂`), which requires an explicit proof term of the equality type.
Definitional equality is decided by reduction to normal form.

### Tactic-mode (goal-directed proof)

A **tactic-mode proof** begins with a *proof state*: a local context of named hypotheses and one or more *goal* propositions to prove.
Each tactic transforms the proof state — closing goals, splitting goals, introducing hypotheses, rewriting using equalities.
The proof is complete when the proof state is empty (all goals discharged); at that point Lean assembles the tactic sequence into a term and the kernel verifies it.

Common tactics:

| Tactic | What it does |
|---|---|
| `intro h` | Introduces the antecedent of an implication: goal `A → B` becomes goal `B` with hypothesis `h : A` |
| `apply f` | Applies a function: goal `B` becomes the antecedents of `f : A → B` |
| `exact t` | Closes the goal with term `t` |
| `constructor` | Introduces a constructor of the goal's type: `A ∧ B` splits into `A` and `B` |
| `cases h` | Eliminates a hypothesis: `h : A ∨ B` produces two sub-goals |
| `rw [h]` | Rewrites using equality `h : a = b` |
| `simp` | Applies simplification lemmas to exhaustion |
| `linarith` | Closes the goal by linear arithmetic over hypotheses |
| `omega` | Closes the goal by the Omega decision procedure for linear integer arithmetic |
| `decide` | Evaluates the proposition computationally for decidable cases |

**Tacticals** are combinators over tactics: `<;>` (apply to all remaining goals), `first | t1 | t2` (try `t1`, fall back to `t2`), `repeat t` (apply until failure), `try t` (apply without failing if it fails).

Internally, the tactic state is a `TacticM` computation threading a list of `MVarId` (metavariable identifiers, one per open goal) plus a `LocalContext`.
Each `MVarId` is a placeholder for a term not yet provided; tactic execution fills in placeholders.
The proof is complete when all metavariables are assigned.

### Inductive-mode (structural induction)

An **inductive-mode proof** uses Lean's `induction` tactic or the recursor of an inductive type.
For `Nat`, the recursor is:

```lean
Nat.rec : {motive : Nat → Sort u} →
  motive 0 →
  ((n : Nat) → motive n → motive (n + 1)) →
  (n : Nat) → motive n
```

The `motive` is the predicate to be proved; the first argument is the base case; the second is the step.
A proof of `∀ n : Nat, P n` by `induction n` produces two sub-goals: `P 0` (base) and `∀ k, P k → P (k + 1)` (step).

Example:

```lean
theorem zero_add (n : Nat) : 0 + n = n := by
  induction n with
  | zero      => rfl
  | succ n ih => simp [Nat.add_succ, ih]
```

The `zero` case holds by definitional equality (closed by `rfl`); the `succ` case uses the induction hypothesis `ih`.

**Mutual induction** allows two predicates to be established simultaneously via a `mutual` block. **Well-founded recursion** (`termination_by`, `WellFoundedRelation`) generalizes structural induction to any well-founded relation: every descending chain is finite.

## Traditions

Ten traditions ground Lean's design.
Each has a precise rendering in the system.

| Tradition | Source | What Lean takes from it |
|---|---|---|
| **Curry–Howard correspondence** | Howard, *The Formulae-as-Types Notion of Construction* (1980); Curry, *Combinatory Logic* (1958) | Propositions are types; proofs are terms. The type system is simultaneously a logic. |
| **Martin-Löf intuitionistic type theory** | Martin-Löf, *Intuitionistic Type Theory* (1984); *An Intuitionistic Theory of Types* (1975) | Dependent types; the four judgment forms (`A type`, `A = B`, `a : A`, `a = b : A`); derivability as inference-rule application. |
| **Gentzen natural deduction** | Gentzen, *Untersuchungen über das logische Schließen* (1935) | Introduction and elimination rules for each connective; the cut rule and cut elimination. |
| **BHK interpretation** | Brouwer (1907, 1908); Heyting, *Intuitionism* (1956); Kolmogorov (1932) | Constructive proofs as functions producing witnesses. A proof of `A → B` is a function from proofs-of-`A` to proofs-of-`B`. |
| **LCF tactical theorem proving** | Milner, *Logic for Computable Functions* (1972); Gordon, Milner, Wadsworth, *Edinburgh LCF* (1979) | The abstract `thm` type and primitive inference rules; tactics as functions over proof states; tacticals as higher-order combinators. |
| **Calculus of Constructions** | Coquand and Huet, *The Calculus of Constructions* (1988); Luo, *Computation and Reasoning* (1994) | Dependent products and sums; type universe stratification; impredicative `Prop`. |
| **Cut elimination** | Gentzen, *Die Widerspruchsfreiheit der reinen Zahlentheorie* (1936); Prawitz, *Natural Deduction* (1965) | Normalization: every term reduces to a unique cut-free normal form. |
| **Realizability** | Kleene, *On the Interpretation of Intuitionistic Number Theory* (1945); Troelstra, *Realizability* (1998) | A realizer of a proposition is a program producing a witness; in Lean, the term `t : P` is a typed, kernel-verified realizer. |
| **Structural induction** | Burstall, *Proving Properties of Programs by Structural Induction* (1969) | Induction over inductively defined data structures; the recursor as the induction principle. |
| **Definitional equality** | Church, *A Formulation of the Simple Theory of Types* (1940); de Bruijn, *Lambda Calculus Notation with Nameless Dummies* (1972) | Reduction to normal form; beta-delta-eta-iota equivalence; the kernel as decidable equality oracle. |

## The Curry–Howard correspondence in Lean

Howard (1980) made explicit what Curry had observed in the 1930s: the correspondence between proofs in intuitionistic propositional logic and terms of the simply-typed lambda calculus.

| Logical operation | Type-theoretic construct | Lean term |
|---|---|---|
| Proposition `A` | Type `A : Prop` | any type in `Prop` |
| Proof of `A` | Term `t : A` | `t : A` |
| Implication `A → B` | Function type `A → B` | `fun h : A => _ : B` |
| Conjunction `A ∧ B` | Product type `A × B` | `⟨a, b⟩ : A ∧ B` |
| Disjunction `A ∨ B` | Sum type `A ⊕ B` | `Or.inl a` or `Or.inr b` |
| Falsehood `⊥` | Empty type `Empty` | (no term; any goal follows) |
| Universal `∀ x, P x` | Dependent function `(x : A) → P x` | `fun x => _ : P x` |
| Existential `∃ x, P x` | Dependent pair `Σ x, P x` | `⟨w, h⟩ : ∃ x, P x` |

Lean enforces the correspondence at the kernel level: the only way to produce a value of type `P : Prop` is to construct a term of that type.

## The dependent-type system

Martin-Löf (1984) extends Curry–Howard to dependent types: the type of the conclusion can depend on the value of the argument.
The dependent function type `(x : A) → B x` represents a family of types indexed by values of `A`.
A term of this type is a function that, for each `x : A`, produces a value of `B x`.

Lean 4 uses a predicative universe hierarchy `Prop`, `Type 0`, `Type 1`, ... to avoid Girard's paradox. **Proof irrelevance** holds in `Prop`: any two proofs of the same `Prop`-valued proposition are definitionally equal. **Definitional proof irrelevance** is what allows Lean to treat `Prop` as a logic without distinguishing between different proofs of the same fact.

The Calculus of Inductive Constructions adds inductive types, universe polymorphism, and impredicative `Prop` to the Calculus of Constructions.
Each inductive type comes with an automatically generated recursor that serves as both the elimination rule and the induction principle.

## The kernel and the trusted base

Lean's **kernel** implements a small, fixed set of operations: type-checking, normalization (beta, delta, eta, iota reduction), and primitive inference rules.
The kernel is approximately a few thousand lines of code and constitutes the entire trusted computing base.
All other components — elaboration, tactics, macros, the simp database, the Mathlib library — are untrusted code whose output is candidate terms.

The architectural pattern descends from LCF (Milner 1972; Gordon, Milner, Wadsworth 1979).
The `thm` type was made abstract so that values of that type could only be produced by the kernel's primitive inference rules.
Modern proof assistants generalize this: any term claimed to be a proof must be checkable by the kernel.

The **`sorry` tactic** is an explicit mechanism for asserting any goal without proof.
A term with `sorry` in it is admitted by the kernel as if proved, but Lean reports the use of `sorry` and excludes such proofs from the soundness guarantee.
Using `sorry` is sometimes useful during development; allowing it through to a finished proof is a soundness violation.

## Recursors and pattern matching

Every inductive type `T` with constructors `c₁ : A₁ → T`, ..., `cₙ : Aₙ → T` has an automatically generated recursor:

```lean
T.rec : {motive : T → Sort u} →
  (case₁ : ...) → ... → (caseₙ : ...) →
  (t : T) → motive t
```

The recursor is definitionally equal to pattern-matching on `t`: for each constructor `cᵢ a`, `T.rec _ ... case_i ...
(cᵢ a)` reduces by the iota rule to `case_i a`.
Recursive function definitions (`def` with pattern matching) are syntactic sugar over the recursor.

**The positivity condition** requires that the inductive type appears only in *strictly positive* positions in its own constructor arguments — never to the left of an arrow within its own definition (Coquand and Paulin, COLOG-88, 1988).
Without positivity, the type can encode a fixed-point combinator and the logic becomes inconsistent.

## Tactical infrastructure

Tactics in Lean 4 form a monad `TacticM` over a state containing the metavariable assignments and local contexts.
The fundamental tactic operations are:

- **Hypothesis introduction** (`intro`, `intros`) — moves the antecedent of an implication into the local context.
- **Goal application** (`apply`, `exact`) — closes a goal using a term whose type matches.
- **Equality rewriting** (`rw`, `subst`, `conv`) — transforms a goal or hypothesis using an equality.
- **Simplification** (`simp`, `dsimp`, `simp_rw`) — applies a normalization procedure using a configured set of rewrite lemmas.
- **Decision procedures** (`decide`, `omega`, `linarith`, `polyrith`) — close goals automatically when the goal falls in a decidable fragment.

The `conv` tactic provides focused rewriting: instead of operating on the whole goal, `conv` selects a sub-term (via navigation primitives `lhs`, `rhs`, `ext`) and applies rewriting locally.
The result is integrated back into the full goal.

The `simp` tactic applies a set of rewrite lemmas (the *simp set*) repeatedly until no more apply, producing a normal form with respect to that lemma set.
Simp's normal form is determined by the lemmas in its set; users can extend or override the default set.

## Key properties

**Proof terms verify in time linear in their normal form.** The kernel's verification is type-checking under reduction; the cost is dominated by reduction to normal form.
Large proof terms with many redundant subterms can be expensive to check; cut elimination produces shorter terms.

**Tactic proofs decompose into proof terms.** Every complete tactic proof, when the `by` block ends, is converted to a term.
Tactic proofs do not remain as tactics at verification time; the kernel sees only terms.

**Definitional equality is decidable but expensive.** Two terms are definitionally equal if they reduce to the same normal form.
The kernel decides this by running both sides to normal form and comparing.
For terms involving large reductions, this can be slow.

**Propositional equality is a separate, stronger notion.** A term `h : t₁ = t₂` is a proof that two terms are propositionally equal — the equality holds as a proposition in the logic, not just as a kernel judgment.
Propositional equality is strictly stronger than definitional equality.

## Open questions

**Minimal proof terms.** Every tactic proof assembles to a term, but the term may contain redundant subterms (eliminated lemmas, unnecessary abstractions).
Cut elimination produces shorter terms, but the *minimal* term-mode proof of a given proposition is not always produced by tactic-to-term assembly.
Whether every proposition has a unique shortest proof, and how to compute it, remains an active area in proof theory.

**Tactic search complexity.** Automated tactics (`decide`, `omega`, `simp`, `linarith`) search a space of possible proofs.
The cost of search depends on the structure of the proposition and the available lemmas.
Bounding the search cost in general — and giving useful estimates per problem class — is an open practical concern.

**Strongest elimination principle.** Each inductive type comes with a recursor, but several elimination strategies exist (dependent vs. non-dependent, large vs. small, universe-polymorphic vs. fixed-universe).
The strongest consistent elimination principle for an arbitrary inductive type depends on universe stratification and the positivity condition; the relationships among these design choices continue to be studied.

**Failure mode classification.** When a tactic fails, the proof state is abandoned.
A diagnostic taxonomy of failure modes — what kind of progress was made, what kind of step was needed — would let tactic-failure messages give structural diagnoses rather than syntactic errors.
The current Lean error messages are mostly syntactic; richer structural diagnostics are an area of ongoing tooling development.

**Proof irrelevance for `Type`-valued data.** Proof irrelevance holds for `Prop` but not for `Type u`: distinct proofs of the same `Type`-valued proposition can occupy distinct positions.
Whether some weaker form of irrelevance (homotopy-relevant equality, univalent identity) should be added to Lean's type theory is an active research question, with relevance to the integration of homotopy type theory and the foundations of mathematics.
