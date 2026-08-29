---
id: lean
description: "Lean is a formal proof assistant whose three proof modalities correspond to three distinct nuclear phenomena over the relational history fiber. Term-mode (syntactic) proof provides a direct construction of a fixed-fiber element: the proof term inhabiting type P is an explicit witness that P belongs to Fix(saturation-nucleus) ∩ Fix(transfer-nucleus) by construction rather than by closure, and Lean's kernel confirms this by reducing the term to its normal form under beta, delta, eta, and iota rules. Tactic-mode proof provides a goal-directed nuclear closure sequence: the initial proof obligation G is a free proposition in the fiber Heyting algebra; each tactic step applies a nuclear operator — intro and apply advance toward the transfer-nucleus or saturation-nucleus fixed sets respectively; the proof is complete exactly when all goals are discharged, meaning G has been admitted to the fixed fiber by a finite sequence of nuclear steps, verified by the same kernel. Inductive-mode proof applies the CarrierInduction axiom of the RelationalOrder: the base case establishes fixed-fiber membership at the minimum carrier position (zero or the empty carrier); the inductive step shows that fixed-fiber membership propagates under the Extend function; the ExtendIsExtension axiom guarantees strict extension at each step, making the induction well-founded. Ten external traditions ground the structure: Curry-Howard (Howard 1980: propositions as types, proofs as terms — term mode is direct fixed-fiber element construction); Martin-Löf intuitionistic type theory (1984: judgment-forms as fiber propositions, derivability as nuclear closure reaching the fixed fiber); Gentzen natural deduction (1935: introduction rules are saturation-nucleus applications settling the meaning of connectives, elimination rules are transfer-nucleus applications extracting committed consequences); BHK interpretation (Brouwer-Heyting-Kolmogorov constructive logic: a constructive proof is a function producing witnesses, realized in Lean as a term-mode fixed-fiber construction with explicit extraction); LCF tactical theorem proving (Milner 1972; Gordon, Milner, and Wadsworth 1979: a tactic is a nuclear step function from proof states to proof states, a tactical is a combinator over nuclear step functions, and the LCF theorem type is the fixed-fiber element unforgeable outside the kernel); Calculus of Constructions (Coquand and Huet 1988: the type universe stratification is the fiber Heyting algebra hierarchy, dependent types are fiber-relative propositions whose meaning is indexed by a carrier position); cut elimination (Gentzen 1936: redundant nuclear steps can be removed from any derivation without changing fixed-fiber membership — normalization is nuclear-path simplification to the shortest closure); realizability (Kleene 1945: a realizer of a proposition is a program computing a witness, corresponding to a term-mode fixed-fiber element that the Lean kernel can evaluate); structural induction (Burstall 1969: well-founded recursion on an inductively defined type is exactly the CarrierInduction axiom applied to the history type); and definitional equality (two Lean terms that reduce to the same normal form under Lean's reduction rules occupy the same fixed-fiber position — reduction is nuclear idempotence applied to the term-formation operator, and the kernel decides equality by running both sides to normal form)."
defines: Lean
related: Assertion, Machine, System
minimum-math: relational-history-carrier-induction-nuclear-heyting-doctrine
date-created: 2026-03-22
date-modified: 2026-03-22
params:
  term-mode: relational-history-fiber-fixed-proposition
  tactic-mode: relational-history-fiber-nuclear-closure-sequence
  inductive-mode: relational-history-carrier-induction
output: relational-history-fiber-fixed-proposition
---

# Lean

## What it is

**Lean** is a formal proof assistant with three proof modalities, each corresponding to a distinct nuclear phenomenon. The three modalities are not stylistic choices — they are structurally distinct paths from a free proposition in the fiber Heyting algebra to a fixed-fiber element:

- **Term-mode** — direct fixed-fiber construction: the proof term is the element
- **Tactic-mode** — nuclear closure sequence: a sequence of nuclear steps drives a free proposition to the fixed fiber
- **Inductive-mode** — carrier traversal: the CarrierInduction axiom propagates fixed-fiber membership across all carrier positions

All three modalities produce the same kind of output — a fixed-fiber element, a proposition doubly stable under both the saturation nucleus and the transfer nucleus — by structurally different paths. Lean's kernel is the single verification authority for all three: it reduces every proof to a term, then type-checks the term, confirming fixed-fiber membership by construction.

### Term-mode (syntactic proof)

A **term-mode proof** of proposition `P` is a Lean term `t` of type `P`. The term `t` is a direct construction of `P` as a fixed-fiber element: it provides `P ∈ Fix(saturation-nucleus) ∩ Fix(transfer-nucleus)` without requiring nuclear closure steps to be applied at verification time. Lean's kernel accepts `t` by checking that it type-checks under the reduction rules (beta, delta, eta, iota) — normalization is the kernel's only operation.

Example: to prove `P ∧ Q → Q ∧ P`, the term-mode proof is

```lean
fun h => ⟨h.2, h.1⟩
```

The lambda constructs a function (the implication is entered by transfer-nucleus); the anonymous constructor `⟨_, _⟩` assembles the conjunction (the connective is assembled by saturation-nucleus); `h.2` and `h.1` are projections extracting the components (elimination by transfer-nucleus). The term is fully explicit — the kernel does not search; it checks.

**Definitional equality**: Two terms `t₁` and `t₂` that normalize to the same term under Lean's reduction rules are **definitionally equal** — they occupy the same fixed-fiber position. The kernel treats them as identical without proof. This is not propositional equality (which requires an explicit proof term of type `t₁ = t₂`); it is the kernel's judgment that two expressions compute to the same normal form. Definitional equality is nuclear idempotence: applying the reduction rules to a term already in normal form produces no change, exactly as applying a nucleus to a fixed-fiber element produces no change.

### Tactic-mode (goal-directed proof)

A **tactic-mode proof** begins with a **proof state**: a local context of named hypotheses and a **goal** proposition `G`. The goal `G` is a free proposition in the fiber Heyting algebra at the current history — not yet admitted to the fixed fiber. Each tactic step transforms the proof state by applying a nuclear operator:

| Tactic | Nuclear operation | What changes |
|---|---|---|
| `intro h` | Transfer-nucleus: enter implication | Goal `A → B` becomes goal `B` with hypothesis `h : A` |
| `apply f` | Saturation-nucleus: reduce by lemma | Goal `B` becomes the antecedents of `f : A → B` |
| `exact t` | Direct fixed-fiber admission | Goal `G` is closed by term `t : G` |
| `constructor` | Saturation-nucleus: conjunction introduction | Goal `A ∧ B` splits into goals `A` and `B` |
| `cases h` | Transfer-nucleus: disjunction elimination | Hypothesis `h : A ∨ B` splits into two sub-goals |
| `rw [h]` | Saturation-nucleus: definitional rewriting | Goal is restated using equality `h : a = b` |
| `simp` | Saturation-nucleus closure | Applies a battery of simplification lemmas to exhaustion |
| `linarith` | Transfer-nucleus: arithmetic closure | Closes the goal by linear arithmetic over hypotheses |
| `omega` | Transfer-nucleus: integer arithmetic closure | Closes the goal by the Omega decision procedure |
| `decide` | Fixed-fiber oracle for decidable propositions | Evaluates the proposition by computation and closes the goal |

The proof is **complete** when the proof state is empty — all goals discharged. At that point, Lean assembles the tactic proof into a term and the kernel type-checks it. The tactic sequence is a nuclear closure path; the assembled term is the fixed-fiber element that path produces.

**Tacticals** are combinators over tactic functions: `<;>` (apply to all remaining goals), `first | t1 | t2` (try `t1`, fall back to `t2`), `repeat t` (apply until failure), `try t` (apply without failing if it fails). These are nuclear composition operators — they determine how nuclear steps are sequenced and branched across the proof state.

The proof state at any intermediate point classifies the goal proposition by nuclear position:

| Proof state | Nuclear position of goal | What it means |
|---|---|---|
| Goal not yet attempted | Free — in fiber Heyting algebra, not in either fixed set | No nucleus has been applied |
| After `intro` on `A → B` | Transfer-nucleus applied: `B` partially advanced | Transfer-nucleus extracted the hypothesis |
| After `apply f` | Saturation-nucleus applied: goal reduced to antecedents | Saturation-nucleus partial closure complete |
| After `simp` with no remaining goals | Fixed fiber — in Fix(saturation-nucleus) ∩ Fix(transfer-nucleus) | Saturation-nucleus closure reached doubly-stable; element is settled |
| Goal closed by `exact t` | Fixed fiber — doubly active | Term `t` is the direct fixed-fiber witness; path complete |

### Inductive-mode (carrier induction proof)

An **inductive-mode proof** uses Lean's `induction` tactic or the recursive eliminator of an inductive type. The structure mirrors the CarrierInduction axiom of the RelationalOrder:

```
CarrierInduction : ∀ (P : Carrier → Prop),
  P empty →
  (∀ c e, P c → P (Extend c e)) →
  ∀ c, P c
```

A Lean inductive proof of `∀ n : Nat, P n` via `induction n` produces two sub-goals:

1. **Base case** (`n = 0`): establish `P 0` — fixed-fiber membership at the minimum carrier position
2. **Inductive step** (`n = k + 1`): given the induction hypothesis `ih : P k`, establish `P (k + 1)` — fixed-fiber membership propagates under Extend

The **ExtendIsExtension** axiom guarantees that `Extend(c, e)` strictly extends `c` in the carrier order, so the induction is well-founded: the base case is reached in finitely many unfoldings.

Lean encodes this via the **recursor** generated for each inductive type. For `Nat`, the recursor is:

```lean
Nat.rec : {motive : Nat → Sort u} →
  motive 0 →
  ((n : Nat) → motive n → motive (n + 1)) →
  (n : Nat) → motive n
```

The `motive` is the predicate `P`; the first argument is the base case; the second is the step; the result is `P n` for all `n`. This is the CarrierInduction schema with `Nat` as the carrier and `Nat.succ` as the Extend function.

An inductive proof of `∀ n : Nat, 0 + n = n` by `induction n` in tactic mode:

```lean
theorem zero_add (n : Nat) : 0 + n = n := by
  induction n with
  | zero      => rfl
  | succ n ih => simp [Nat.add_succ, ih]
```

The `zero` case: `0 + 0 = 0` holds by definitional equality, closed by `rfl` (a direct term-mode fixed-fiber element). The `succ` case: the induction hypothesis `ih : 0 + n = n` is a saturation-nucleus-fixed proposition in the local context; `simp` applies saturation-nucleus closure using `Nat.add_succ` and `ih` to settle the goal.

**Mutual induction** allows two predicates to be established simultaneously. Lean handles this via the `mutual` block, generating a joint recursor — two correlated CarrierInductions with a shared inductive step, establishing fixed-fiber membership for both predicates at once.

**Well-founded recursion** (`termination_by`, `WellFoundedRelation`) generalizes structural induction to any relation `r` for which the accessibility predicate `Acc r a` holds for all `a` — asserting that every descending chain is finite. This replaces the ExtendIsExtension axiom with an arbitrary well-founded order on the carrier.

## Correspondence table

Ten external traditions, each with a precise internal rendering:

| External tradition | Source | Internal construct |
|---|---|---|
| **Curry-Howard correspondence** (proofs as programs, propositions as types) | Howard, "The Formulae-as-Types Notion of Construction," in *To H.B. Curry: Essays on Combinatory Logic, Lambda Calculus, and Formalism* (Academic Press, 1980), pp. 479–490; Curry, *Combinatory Logic* (1958) | Term-mode proof is direct fixed-fiber element construction. The type `P` is the fiber proposition; the term `t : P` is the fixed-fiber witness. There is no gap between "the proposition holds" and "a term of that type exists": they are definitionally the same condition. The kernel's type-checker is the fixed-fiber membership oracle. |
| **Martin-Löf intuitionistic type theory** (dependent types, judgment forms) | Martin-Löf, *Intuitionistic Type Theory* (Bibliopolis, 1984); "An Intuitionistic Theory of Types" (1975) | The four judgment forms — `A type`, `A = B`, `a : A`, `a = b : A` — correspond to: a fiber proposition, definitional equality (same fixed-fiber position), a fixed-fiber witness, and witness equality at the same position. Derivability is nuclear closure: a judgment is derivable iff it is reachable from the axioms by a finite sequence of inference rules, exactly the saturation-nucleus closure applied to the base propositions. |
| **Gentzen natural deduction** (introduction and elimination rules) | Gentzen, "Untersuchungen über das logische Schließen," *Mathematische Zeitschrift* 39 (1935), pp. 176–210, 405–431 | Introduction rules are saturation-nucleus applications: they settle the meaning of a connective by constructing a proof of the whole from proofs of the parts (`∧-I`, `→-I`, `∨-I`). Elimination rules are transfer-nucleus applications: they extract committed consequences from a proof of the whole (`∧-E`, `→-E`, `∨-E`). Every natural deduction derivation is a finite sequence of nuclear applications; normalization reduces the derivation to the shortest nuclear closure path. |
| **BHK interpretation** (constructive proof as computation) | Brouwer (1907, 1908); Heyting, *Intuitionism: An Introduction* (1956); Kolmogorov, "Zur Deutung der intuitionistischen Logik" (1932) | A BHK proof of `A → B` is a function converting any proof of `A` into a proof of `B` — the term-mode proof `fun h : A => _ : B`. A proof of `A ∧ B` is a pair — the anonymous constructor `⟨a, b⟩`. A proof of `∃ x, P x` is a witness together with a proof of `P x` — the dependent pair `⟨w, h⟩`. Every BHK clause corresponds to a term-mode construction inhabiting the given type. |
| **LCF tactical theorem proving** (tactic as nuclear step, theorem type as fixed-fiber guarantee) | Milner, "Logic for Computable Functions" (Stanford Technical Report, 1972); Gordon, Milner, and Wadsworth, *Edinburgh LCF* (Springer, 1979) | The LCF architecture makes the `thm` type abstract — only the kernel's primitive inference rules can construct values of type `thm`. A `thm` value cannot be forged outside the kernel, exactly as a fixed-fiber element cannot be manufactured without applying the nuclei. Tactics are functions from proof states to proof states — nuclear step functions. Tacticals are higher-order functions over tactics — nuclear composition operators. The theorem that every tactic proof assembles to a kernel-verifiable term is the nuclear path-to-element correspondence. |
| **Calculus of Constructions** (type universes, dependent types) | Coquand and Huet, "The Calculus of Constructions," *Information and Computation* 76 (1988), pp. 95–120; extended in Luo, *Computation and Reasoning* (1994) | The type universe hierarchy `Prop : Type 0 : Type 1 : ...` is the fiber Heyting algebra hierarchy: `Prop` is the base layer of propositional content; `Type u` is the layer of data and structure at universe level `u`. Dependent types `(x : A) → B x` are fiber-relative propositions: the type of the conclusion `B x` is indexed by the value `x : A`, corresponding to a proposition whose meaning varies across carrier positions. |
| **Cut elimination** (normalization as nuclear-path simplification) | Gentzen, "Die Widerspruchsfreiheit der reinen Zahlentheorie," *Mathematische Annalen* 112 (1936), pp. 493–565; Prawitz, *Natural Deduction* (1965) | The cut rule introduces a lemma `A` proved separately and then used to prove `B`. Cut elimination removes such lemmas: the derivation of `B` is reconstructed without the mediary. In nuclear terms: a cut is a composition of two nuclear closure paths; cut elimination simplifies the composition to a direct path. The resulting cut-free derivation is the normalized term-mode proof — the shortest nuclear closure, with no redundant intermediate fixed-fiber elements used and then discarded. |
| **Realizability** (realizers as term-mode constructions) | Kleene, "On the Interpretation of Intuitionistic Number Theory," *Journal of Symbolic Logic* 10 (1945), pp. 109–124; Troelstra, *Realizability* (1998) | A realizer of a proposition `P` is a program that produces a witness of `P` when given any required inputs. In Lean, the realizer is the term `t : P` — a fixed-fiber construction that the kernel can evaluate. Kleene's number-realizability (`e ⊩ A`) corresponds to: a natural number coding a Turing machine that computes a fixed-fiber element of `A`. Lean's term-mode proof is a typed, kernel-verified realizer: the type system ensures the realizer produces the right kind of witness. |
| **Structural induction** (well-founded recursion on carrier structure) | Burstall, "Proving Properties of Programs by Structural Induction," *Computer Journal* 12 (1969), pp. 41–48 | Structural induction proves properties of inductively defined structures by induction on the structure itself: the base case handles atomic structures; the inductive step handles compound structures built from smaller ones. This is the CarrierInduction axiom applied to Lean's inductive types: the Lean type `Nat` is the simplest carrier; each inductive type defines its own Extend function (constructors); the recursor is the induction principle. |
| **Definitional equality** (same fixed-fiber position by reduction) | Church, "A Formulation of the Simple Theory of Types," *Journal of Symbolic Logic* 5 (1940); de Bruijn, "Lambda Calculus Notation with Nameless Dummies," *Indagationes Mathematicae* 34 (1972) | Two Lean expressions `t₁` and `t₂` are definitionally equal if they reduce to the same normal form under beta (function application), delta (definition unfolding), eta (function extensionality), and iota (recursor computation) rules. Definitionally equal terms occupy the same fixed-fiber position: the kernel treats them as interchangeable without proof. This is nuclear idempotence applied to the term-formation operator: applying the reduction rules to a term already in normal form produces no change. |

## The type-theoretic tradition

**Howard (1980)** made explicit what Curry had observed in the 1930s: the correspondence between proofs in intuitionistic propositional logic and terms of the simply-typed lambda calculus. The key table:

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

In nuclear terms: the **left column** is the proposition as a fiber Heyting algebra element; the **right column** is the fixed-fiber construction that witnesses it. The Curry-Howard correspondence is the statement that fixed-fiber membership (the proof exists) and inhabited type (the term exists) are the same condition. Lean enforces this via its kernel: the only way to produce a value of type `P : Prop` is to construct a fixed-fiber element for that proposition.

**Martin-Löf (1984)** extends this to dependent types, where the type of the conclusion can depend on the value of the argument. The dependent function type `(x : A) → B x` is a fiber-relative proposition: at each carrier position `x : A`, there is a distinct fiber proposition `B x`. A proof is a function that for each `x` produces a fixed-fiber element of `B x`. This allows quantification not just over propositions but over data, making the type system simultaneously a logic and a programming language.

Lean 4 uses a predicative universe hierarchy (no `Type : Type`) to avoid Girard's paradox, maintaining consistency. The hierarchy `Prop`, `Type 0`, `Type 1`, ... is the fiber Heyting algebra stratification: propositions at the base layer (`Prop`), sets of data at `Type 0`, collections of sets at `Type 1`, and so on. **Proof irrelevance** holds in `Prop`: any two proofs of the same proposition in `Prop` are definitionally equal — all fixed-fiber elements for a `Prop`-valued proposition occupy the same position, with no distinction between witnesses.

**Coquand and Huet (1988)** add the dependent product and dependent sum to the simply-typed system, producing a full Calculus of Constructions. The type `(x : A) → B x` ranges over all values `x` of type `A`; the term `⟨w, hw⟩ : Σ x : A, B x` provides a witness `w` and a proof `hw : B w`. These are the existential and universal quantifiers of the logic expressed as type-theoretic constructs. Lean 4's type theory (the Calculus of Inductive Constructions) is the Calculus of Constructions extended with inductive types, universe polymorphism, and a `Prop` impredicative bottom level.

## The tactical tradition

**Milner (1972)** introduced the LCF (Logic for Computable Functions) methodology: rather than requiring users to write full formal proofs, provide primitive inference rules and a meta-language (ML) for combining them into larger derivations. The key architectural innovation is the **abstract theorem type**: the type `thm` (or `Thm`) is made opaque so that values can only be constructed by applying the kernel's primitive inference rules. The ML type system then enforces that every tactic, no matter how complex, ultimately decomposes into primitive applications the kernel can check.

**Gordon, Milner, and Wadsworth (1979)** (Edinburgh LCF) operationalized this into a working system. The **tactic** is a function of type:

```
tactic = goal → (goal list × validation)
```

A tactic takes a goal, returns a list of sub-goals (the obligations remaining), and a **validation function** that assembles the sub-goal proofs into a proof of the original goal. This is the nuclear structure: the tactic is a nuclear step function; the validation assembles the nuclear path into a fixed-fiber element; the sub-goals are intermediate positions in the fiber Heyting algebra not yet in the fixed fiber.

In Lean 4, the tactic monad state is a `TacticM` computation threading a `TacticState` — a list of `MVarId` (metavariable identifiers, one per open goal) plus a `LocalContext` (the hypotheses). Each `MVarId` is an unsettled proposition: a placeholder for a fixed-fiber element not yet provided. Tactic execution fills in these placeholders by constructing terms. The proof is complete when all `MVarId`s are assigned — all placeholders filled, all goals closed.

**The `conv` tactic** is a focused nuclear step: instead of applying a tactic to the whole goal, `conv` selects a sub-term of the goal and applies rewriting rules to that sub-term alone. This is a saturation-nucleus application restricted to a sub-fiber: meaning-settlement is applied locally, and the result is integrated back into the full goal. The `conv` sub-language (`lhs`, `rhs`, `ext`, `rw`) navigates the term structure, selecting which sub-propositions to settle.

**`Simp` as saturation-nucleus closure**: the `simp` tactic applies a set of rewrite lemmas (the simp set) repeatedly until no more apply. This is saturation-nucleus closure: each lemma application is a saturation-nucleus step, and the process terminates when a fixpoint of the saturation-nucleus is reached. The `simp` lemmas are the generators of the saturation nucleus; the normal form produced by `simp` is the saturation-nucleus-fixed representative of the goal.

## The inductive tradition

**Burstall (1969)** introduced structural induction as a systematic method for proving properties of programs defined by recursive equations over inductively defined data. The method: prove the property for base cases, then prove it for compound cases assuming it holds for the immediate sub-structures. This is the first explicit formulation of the principle now expressed as CarrierInduction in the RelationalOrder.

**Gentzen (1936)** proves the consistency of Peano arithmetic by transfinite induction up to the ordinal epsilon-zero. The key insight: induction on the structure of proofs (cut elimination) shows that every proof can be put in a normal (cut-free) form. This is the prototype for Lean's normalization theorem: every tactic proof assembles to a kernel-verifiable term, and every term reduces to a unique normal form.

In Lean, every inductive type comes with a **recursor** generated automatically. For a type `T` with constructors `c₁ : A₁ → T`, ..., `cₙ : Aₙ → T`, the recursor has type:

```lean
T.rec : {motive : T → Sort u} →
  (case₁ : ...) → ... → (caseₙ : ...) →
  (t : T) → motive t
```

Each `case_i` provides the proof obligation for the `i`-th constructor. The recursor is definitionally equal to pattern-matching on `t`: for any specific constructor `cᵢ a`, `T.rec _ ... case_i ... (cᵢ a)` reduces by the iota rule to `case_i a`. This reduction is the iota rule — CarrierInduction applied to a specific carrier element to produce the fixed-fiber value at that position.

**Recursive definitions** (`def` with pattern matching) use the same recursor mechanism. A function `f : Nat → α` defined by

```lean
def f : Nat → α
  | 0     => base
  | n + 1 => step n (f n)
```

is definitionally equal to `Nat.rec base (fun n ih => step n ih)`. The function `f` is a fixed-fiber element at every carrier position: `f n` is the value at carrier position `n`, and the definition by recursion establishes this value simultaneously for all positions via the recursor.

**The positivity condition**: Lean requires that constructor arguments contain the inductive type only in **strictly positive** positions — the inductive type cannot appear as the argument of a function type to the left of an arrow within its own definition. This condition ensures that the recursor is well-typed and that the induction principle does not lead to inconsistency (the Coquand-Paulin positivity criterion, *COLOG-88*, 1988). Without positivity, the inductive type can encode a fixed-point combinator, collapsing the logic to inconsistency and making every proposition a fixed-fiber element vacuously.

## Nuclear reading

The nuclear structure of the relational history fiber classifies every Lean proof entity by where it stands relative to the two nuclei:

| Proof entity | Nuclear position | What it means |
|---|---|---|
| **Open goal** `⊢ G` | Free — in fiber Heyting algebra, fixed by neither nucleus | G is a proposition awaiting nuclear closure; no tactic has been applied |
| **Hypothesis** `h : A` in local context | Saturation-nucleus-fixed: A is meaning-settled | A has been admitted to Fix(saturation-nucleus) in this local context |
| **Term proof** `t : P` | Fixed-fiber element: in Fix(saturation-nucleus) ∩ Fix(transfer-nucleus) | P is doubly stable — the kernel accepts `t`; no further nuclear application needed |
| **Tactic in progress** (incomplete proof state) | Partially advanced — some goals saturation-fixed, others transfer-fixed, others free | Nuclear closure has been applied to some goals but not yet to all |
| **Completed tactic proof** | Fixed-fiber element (assembled by kernel from tactic path) | The full closure path from free goal to fixed fiber has been executed; kernel assembled the term |
| **Definitionally equal terms** `t₁ ≡ t₂` | Same fixed-fiber position | Beta-delta-eta-iota reduction reaches the same normal form; nuclear idempotence |
| **Propositionally equal terms** `h : t₁ = t₂` | Fixed-fiber element with equality type | A separate proof that two fixed-fiber witnesses coincide; strictly stronger than definitional equality |
| **Metavariable** `?m : G` | Unsettled placeholder | A slot for a fixed-fiber element not yet constructed; goal is open at this position |
| **`sorry`** | False fixed-fiber admission | Lean admits any goal by `sorry` without nuclear closure; the resulting term is a fixed-fiber element by axiom, not by construction — consistency is not maintained |

### The four nuclear positions and proof search

The four nuclear positions of the fiber Heyting algebra correspond to four stages of tactic proof development:

| Nuclear position | Proof state | Tactic action needed |
|---|---|---|
| **Free** — not fixed by either nucleus | Open goal `⊢ G` | Both nuclear applications needed; maximum tactic work |
| **Saturation-nucleus-fixed** — in Fix(saturation-nucleus) | `simp` succeeded; goal meaning-settled but not transfer-settled | Transfer-nucleus application needed: `intro`, `apply`, or exact |
| **Transfer-nucleus-fixed** — in Fix(transfer-nucleus) | Hypotheses introduced; goal execution-stable | Saturation-nucleus application needed: `simp`, `rw`, or `constructor` |
| **Fixed fiber** — in Fix(saturation-nucleus) ∩ Fix(transfer-nucleus) | All goals closed | Proof complete; kernel assembles term |

## Key propositions

**Proposition 1 — Term-mode proof is a direct fixed-fiber construction.**
Every well-typed Lean term `t : P` is a fixed-fiber element for proposition `P`. The kernel confirms this without applying any nuclear closure: it reduces `t` to normal form and type-checks the normal form directly. Term-mode proof is the only modality where the proof IS the fixed-fiber element without requiring path-assembly: the term carries its own justification.

**Proposition 2 — Tactic proof decomposes into term proof.**
Every complete tactic proof in Lean assembles to a kernel-verifiable term. The `by` block is syntactic sugar: at elaboration time, Lean converts the tactic proof into a term by filling in the metavariable placeholders the tactics assigned. The assembled term is the fixed-fiber element that the tactic nuclear closure path produced. No tactic proof remains as a tactic at kernel-verification time — all paths reduce to elements.

**Proposition 3 — Cut elimination is nuclear-path simplification.**
Any proof containing a `have h : A := ...` that introduces a lemma used only once can be simplified by substituting the proof of `A` wherever `h` appears, eliminating the intermediate fixed-fiber element `h`. The resulting proof is shorter; the fixed-fiber membership of the final proposition is unchanged. Redundant intermediate fixed-fiber elements can be removed from any nuclear closure path without changing the fixed-fiber membership of the endpoint. This is Gentzen's cut elimination rendered as a property of nuclear paths.

**Proposition 4 — Inductive proofs are closed under well-foundedness.**
An inductive proof of `∀ t : T, P t` is valid iff the recursion order is well-founded — equivalently, iff every descending chain in the carrier order is finite. Lean checks this automatically for structural recursion (constructors strictly reduce the term) and via `termination_by` and `decreasing_by` for well-founded recursion. Without well-foundedness, the induction does not reach the base case in finitely many steps; fixed-fiber membership at the base position is never used, and the entire induction is unsound.

**Proposition 5 — Definitional equality is free at the kernel.**
Two definitionally equal terms `t₁ ≡ t₂` require no proof: the kernel treats them as identical. Propositionally equal terms `h : t₁ = t₂` require a proof term `h` of the equality type. Definitional equality is nuclear idempotence: the reduction rules applied to a term already in normal form produce no change, exactly as the saturation nucleus applied to a saturation-nucleus-fixed element produces no change. Propositional equality is strictly stronger: it asserts that two fixed-fiber elements coincide, which may require a non-trivial nuclear closure to establish.

**Proposition 6 — Lean's kernel is a fixed-fiber membership oracle.**
Lean's kernel implements exactly one operation: given a term `t` and a type `P`, check whether `t : P` holds under the reduction rules. This is the fixed-fiber membership check. The kernel is small (a few thousand lines of code) and constitutes the entire trusted computing base; all other Lean components (elaboration, tactics, macros, the simp lemma database) are untrusted code that assembles candidate terms for the kernel to verify. The kernel corresponds to the characteristic morphism of the fixed fiber: the function mapping any proposition-with-candidate-witness to settled (in the fixed fiber) or rejected (not in the fixed fiber), decidable by reduction to normal form.

## Open questions

**1. Does every fixed-fiber proposition have a minimal term-mode proof?**
Every tactic proof assembles to a term, but that term may be large and contain redundant subterms (eliminated lemmas, unnecessary abstractions). Cut elimination produces a shorter term, but the shortest term-mode proof — the unique normal form with no redundant subterms — may be exponentially larger or smaller than the tactic-assembled term. Whether every proposition in the fixed fiber has a unique shortest term-mode proof, and whether this shortest proof is always produced by tactic-to-term assembly, is not determined by the nuclear structure alone; it requires analysis of the reduction order and the proof complexity of the proposition.

**2. What is the nuclear cost of tactic search?**
Automated tactics (`decide`, `omega`, `simp`, `linarith`) perform search over the nuclear closure space — they apply nuclear steps in sequence until a fixed-fiber witness is found. The cost of this search is measured in the number of nuclear steps tried and discarded. Whether the Landauer cost applies to discarded intermediate nuclear steps — steps that produce unsettled propositions then abandoned — is not established. If discarding a partial nuclear closure path pays thermodynamic cost, then automated proof search has a Landauer lower bound proportional to the branching factor of the search space.

**3. Is the induction principle for an inductive type uniquely determined by its constructors?**
Given an inductive type `T` with constructors `c₁, ..., cₙ`, Lean generates a specific recursor. But the constructors determine the type, not the elimination principle: there are multiple elimination strategies (dependent elimination, non-dependent elimination, large elimination vs. small elimination) with different universe levels and different strengths. Whether the strongest possible elimination principle (large elimination, universe-polymorphic) is always consistent is not a consequence of the CarrierInduction axiom alone — it depends on the universe stratification and the positivity condition on the constructors.

**4. Do the three proof modalities yield the same fixed-fiber elements?**
For any proposition `P`, a term-mode proof, a tactic-mode proof, and an inductive-mode proof of `P` all produce elements of the fixed fiber for `P`. But they produce potentially different terms — different fixed-fiber witnesses. Whether these witnesses are always propositionally equal (there exists a proof of their equality) or merely definitionally equal depends on proof irrelevance: for propositions in `Prop`, Lean's kernel enforces proof irrelevance by definitional equality of all proofs of the same proposition, collapsing all three witnesses to the same fixed-fiber position. For data types in `Type u`, distinct proofs are not proof-irrelevant and may occupy distinct fixed-fiber positions.

**5. Can tactic failures be classified by nuclear position?**
When a tactic fails, the proof state is abandoned: the goal has not been advanced to the fixed fiber. Different failure modes correspond to different nuclear positions of the failed goal: a goal that `simp` closes but `exact` cannot finalize is saturation-nucleus-fixed but not transfer-nucleus-fixed; a goal where `intro` succeeds but no subsequent `apply` closes it is transfer-nucleus-advanced but saturation-nucleus-free. Whether the four nuclear positions give a complete classification of tactic failure modes — a diagnostic taxonomy for proof search — has not been established. If they do, tactic failure messages could report which nucleus failed to close the goal, giving the user a structural diagnosis rather than a syntactic error.
