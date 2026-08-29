---

title: "Formalizing the Semiotic Universe in Lean"
  - "formalizing the semiotic universe in Lean"
date-created: 2026-03-06T00:00:00
keywords:
  - lean
  - mathematical-universe
requires:
  - ../../../posets/curricula/heyting-algebras.md
  - ../../../posets/curricula/closure-operators.md
  - ../../../categories/ordinary-categories/curricula/monads-and-comonads.md
  - ../../../../../technology/disciplines/computing/software/lean/curricula/types-and-propositions-in-lean.md
  - ../../../../../technology/disciplines/computing/software/lean/curricula/tactics-in-lean.md
  - ./semantic-ambient.md
teaches:
  - "formalizing the semiotic universe in Lean"
  - "SemioticUniverse typeclass"
  - "ModalClosure typeclass"
  - "HeytingComonad typeclass"
  - "Lean formalization strategy for the semiotic universe"
---

## What this lesson covers

How to translate the formal specification of the
[semiotic universe](../semiotic-universe.md) into verified Lean 4
proofs. The specification has ten sections of mathematics. This lesson
maps each section to a Lean formalization target: what typeclass or
theorem it becomes, what Mathlib infrastructure it uses, and what
needs to be proved.

The Lean formalization lives at `../formalization/`. Step 1 (the
ambient structure: H, j, G, and their interaction axioms) is
implemented across four atomic files. This lesson maps the
remaining spec sections to Lean formalization targets.

## Prerequisites

You need:

- The
  [semantic domain](./semantic-ambient.md)
  lesson (what H, j, G are mathematically)
- The
  [Heyting algebras](../../../posets/curricula/heyting-algebras.md)
  curriculum (meets, joins, implication, the residuation adjunction)
- The
  [closure operators](../../../posets/curricula/closure-operators.md)
  curriculum (extensive, monotone, idempotent)
- The
  [monads and comonads](../../../categories/ordinary-categories/curricula/monads-and-comonads.md)
  curriculum (counit, comultiplication, Heyting-comonadic coherence)
- The Lean curricula:
  [types and propositions](../../../../../technology/disciplines/computing/software/lean/curricula/types-and-propositions-in-lean.md)
  and
  [tactics](../../../../../technology/disciplines/computing/software/lean/curricula/tactics-in-lean.md)

---

## The formalization strategy

The semiotic universe specification has ten sections. They decompose
into five Lean formalization steps, each building on the last. The
steps can be grouped into three layers:

**Layer A (the ambient structure):** Section 1 of the spec — the
complete Heyting algebra H with modal closure j and trace comonad G.
This is Lean Step 1.

**Layer B (syntax and fragments):** Sections 2-3 of the spec — the
typed lambda calculus generating operators, and fragments as finitely
generated modal-temporal subalgebras. These are Lean Steps 2-3.

**Layer C (closure and initiality):** Sections 4-9 of the spec — the
interpretation, fusion, semantic/syntactic/fusion closure operators,
the global closure S, and the least fixed point. These are Lean
Steps 4-5.

Each step produces a compilable Lean file that imports the previous
step's results.

---

## Step 1: the ambient structure (H, j, G)

### What the spec says

Section 1 defines:

- **Axiom 1.1**: H is a complete Heyting algebra.
- **Section 1.2**: j is a modal closure operator (extensive, monotone,
  idempotent, join-continuous). The stable fragment H^st = {a : j(a) = a}
  is a complete Heyting subalgebra (Lemma 1.1).
- **Axiom 1.2**: G is a comonad AND a complete Heyting algebra
  endomorphism (preserves joins, meets, implication, top, bottom).
- **Axiom 1.3**: j(G(a)) <= G(j(a)) for all a.
- **Axiom 1.4**: G(a) in H^st iff a in H^st.
- **Lemma 1.5**: G restricted to H^st is a comonad and Heyting
  endomorphism on the modal fragment.

### What the Lean file should contain

**Status: implemented.** See `../formalization/SemioticUniverse/`.

The implementation uses four atomic files:

- `HeytingDomain.lean` — the `HeytingDomain` typeclass (thin wrapper
  over Mathlib's `HeytingAlgebra`)
- `ModalClosure.lean` — the `ModalClosure` typeclass with `j` and
  all derived lemmas (habitual fragment is Heyting subalgebra)
- `TraceComonad.lean` — the `TraceComonad` typeclass with `G` and
  derived properties (monotonicity, idempotence, coassociativity)
- `Ambient.lean` — the `SemioticAmbient` mixin combining all three
  with the interaction axioms

### What to prove

1. **Lemma 1.1** (modal fragment is Heyting subalgebra): Define
   `IsStable (a : R) := j a = a` as a predicate. Prove that if
   `IsStable a` and `IsStable b`, then `IsStable (a ⊓ b)`,
   `IsStable (a ⊔ b)`, `IsStable (a ⇨ b)`, `IsStable ⊤`,
   `IsStable ⊥`. These follow from `join_continuous` and the
   Heyting algebra laws.

2. **Monotonicity of G**: Derive `a ≤ b → G a ≤ G b` from
   `pres_inf` (since `a ≤ b` iff `a ⊓ b = a`).

3. **Coassociativity**: In the poset setting, coassociativity
   reduces to `G(G(G(a))) ≥ G(G(a))`, which follows from `comult`
   applied to `G(a)`.

4. **Counit laws**: Similarly reduce to inequalities that follow
   from `counit` composed with `comult`.

5. **Lemma 1.5** (G restricts to H^st): Given `IsStable a`, prove
   `IsStable (G a)` using `stable_iff_trace_stable`. Then show G
   restricted to stable elements is still a comonad and Heyting
   endomorphism.

### Mathlib resources

- `HeytingAlgebra` and all its lemmas (`le_himp_iff`, `inf_comm`,
  `sup_comm`, `himp_inf_le`, etc.)
- `Monotone`, `Closure` — Mathlib has `ClosureOperator` in
  `Order.Closure` but it may not match exactly; the typeclass above
  is more explicit.
- `inf_le_left`, `inf_le_right`, `le_sup_left`, `le_sup_right` for
  lattice reasoning.

### Estimated size

200-400 lines. The typeclasses are ~50 lines; the lemmas and their
proofs are the bulk.

---

## Step 2: the typed lambda calculus

### What the spec says

Section 2 defines:

- **Section 2.1**: A type language (base type P, function types,
  product types), a lambda calculus, typing judgments, operators as
  closed terms of type P^n -> P.
- **Section 2.2**: Definable operators Op^def as the smallest set
  containing primitives, closed under lambda abstraction, application,
  and composition.

### What the Lean file should contain

An inductive type for the type language and terms:

```lean
-- The type language.
inductive SemTy where
  | base : SemTy               -- P
  | fn : SemTy → SemTy → SemTy -- A → B
  | prod : SemTy → SemTy → SemTy -- A × B

-- Terms (intrinsically typed or extrinsically typed).
-- For simplicity, extrinsic with a typing judgment:
inductive SemTerm where
  | var : Nat → SemTerm
  | lam : SemTy → SemTerm → SemTerm
  | app : SemTerm → SemTerm → SemTerm
  | pair : SemTerm → SemTerm → SemTerm
  | fst : SemTerm → SemTerm
  | snd : SemTerm → SemTerm
  | prim : String → Nat → SemTerm  -- primitive operator, name + arity
```

Operators are closed terms of type `base^n → base`. Definable
operators form an inductively defined set.

### Design choice

Intrinsically typed terms (where the type is part of the inductive
definition) are more work upfront but prevent ill-typed terms by
construction. Extrinsically typed terms with a separate typing
judgment are simpler to define but require proving preservation
lemmas. For the semiotic universe, the extrinsic approach is
likely sufficient — the specification does not depend on strong
normalization or other properties that benefit from intrinsic typing.

### Estimated size

300-500 lines for the syntax, typing judgment, and definitional
equality.

---

## Step 3: fragments

### What the spec says

Section 3 defines:

- **Definition 3.1**: Modal-temporal subalgebra — a subset closed
  under Heyting operations, j, and G.
- **Definition 3.2**: Fragment — a finitely generated
  modal-temporal subalgebra.
- **Definition 3.3**: Fragment-preserving operator.
- **Definition 3.4**: Fragmentwise equality.
- **Definition 3.5**: Hereditarily extensional family.

### What the Lean file should contain

```lean
-- A modal-temporal subalgebra.
structure ModalTemporalSubalgebra (R : Type*)
    [SemioticAmbient R] where
  carrier : Set R
  closed_inf : ∀ a b, a ∈ carrier → b ∈ carrier →
    a ⊓ b ∈ carrier
  closed_sup : ∀ a b, a ∈ carrier → b ∈ carrier →
    a ⊔ b ∈ carrier
  closed_himp : ∀ a b, a ∈ carrier → b ∈ carrier →
    (a ⇨ b) ∈ carrier
  closed_top : ⊤ ∈ carrier
  closed_bot : ⊥ ∈ carrier
  closed_j : ∀ a, a ∈ carrier → ModalClosure.j a ∈ carrier
  closed_G : ∀ a, a ∈ carrier → HeytingComonad.G a ∈ carrier

-- A fragment is a finitely generated modal-temporal subalgebra.
structure Fragment (R : Type*) [SemioticAmbient R]
    extends ModalTemporalSubalgebra R where
  generators : Finset R
  generated : ∀ x, x ∈ carrier ↔
    x ∈ closure generators  -- needs precise definition
```

### Key difficulty

The "finitely generated" condition requires defining the closure of
a finite set under Heyting operations, j, and G. This is an inductive
construction — the smallest set containing the generators and closed
under all operations. In Lean, this is naturally an `inductive`
predicate or `Set.iInter` over all containing subalgebras.

### Estimated size

200-300 lines.

---

## Step 4: the three closure operators

### What the spec says

Sections 4-7 define:

- **Section 4**: Interpretation of definable operators into H, with
  seven coherence conditions (monotone, Heyting-compatible, modal
  homomorphism, trace-compatible, equality-preserving,
  fragment-preserving, hereditarily extensional).
- **Section 5**: Fusion — congruence by fragmentwise equality, naming
  of admissible behaviors. S_fus as a closure operator.
- **Section 6**: Fusion as a reflection (left adjoint to inclusion of
  fusion-saturated structures).
- **Section 7**: S_sem (semantic closure), S_syn (syntactic closure
  with finitary justification), S = S_fus . S_syn . S_sem.

### What the Lean file should contain

The partial semiotic structure `X = (H_X, Op_X)` as a structure.
Each closure operator as a function on partial structures, with
proofs of monotonicity and inflationarity.

The key theorem: **Theorem 7.6** — S has a least fixed point by
Knaster-Tarski.

```lean
-- Partial semiotic structure.
structure PartialSemiotic (R : Type*) [SemioticAmbient R] where
  semantic : Set R
  syntactic : Set SemOp  -- definable operators

-- The ordering on partial structures.
instance : LE (PartialSemiotic R) where
  le X Y := X.semantic ⊆ Y.semantic ∧
    X.syntactic ⊆ Y.syntactic

-- Each closure operator.
def S_sem (X : PartialSemiotic R) : PartialSemiotic R := ...
def S_syn (X : PartialSemiotic R) : PartialSemiotic R := ...
def S_fus (X : PartialSemiotic R) : PartialSemiotic R := ...

-- The composite.
def S (X : PartialSemiotic R) : PartialSemiotic R :=
  S_fus (S_syn (S_sem X))

-- Theorem 7.6: S has a least fixed point.
theorem S_has_lfp : ∃ X, S X = X ∧
    ∀ Y, S Y = Y → X ≤ Y := by
  -- By Knaster-Tarski on the complete lattice of
  -- partial structures.
  sorry  -- the real proof invokes OrderIso or
         -- CompleteLattice.fixedPoints
```

### Mathlib resources

- `OrderHom.lfp` or `CompleteLattice` fixed-point theorems
- `GaloisConnection` for the fusion reflection

### Estimated size

400-600 lines. This is the mathematical heart.

---

## Step 5: initiality

### What the spec says

Sections 8-9 define:

- **Definition 8.1**: The semiotic universe as the least fixed point
  X* of S.
- **Section 8.3**: Semiotic structures and morphisms.
- **Theorem 8.2**: Initiality — X* is initial among semiotic
  structures.
- **Section 9**: The 2-category structure (fragmentwise equality as
  2-cells).

### What the Lean file should contain

```lean
-- The semiotic universe.
def SemioticUniverse (R : Type*) [SemioticAmbient R]
    (prims : PartialSemiotic R) : PartialSemiotic R :=
  -- The least fixed point of S above prims.
  sorry

-- Initiality: for any semiotic structure Y over the same
-- primitives, there is a unique morphism from X* to Y.
theorem initiality (Y : SemioticStructure R) :
    ∃! f : Morphism SemioticUniverse Y, IsStructureMap f :=
  sorry
```

The uniqueness is "up to fragmentwise extensional equality,"
which means the 2-categorical formulation is the honest statement.
For the Lean formalization, proving existence of the morphism is
the primary target; uniqueness modulo equivalence is secondary.

### Estimated size

200-400 lines.

---

## The formalization and where Steps 2-5 attach

The Lean formalization lives at `../formalization/`. Step 1 is
implemented across four atomic files under `SemioticUniverse/`:

- `HeytingDomain.lean` — `HeytingDomain` typeclass (wraps Mathlib's
  `HeytingAlgebra`)
- `ModalClosure.lean` — `ModalClosure` typeclass with `j`, plus
  derived lemmas (habitual fragment is Heyting subalgebra)
- `TraceComonad.lean` — `TraceComonad` typeclass with `G`, plus
  derived properties (monotonicity, idempotence)
- `Ambient.lean` — `SemioticAmbient` mixin with interaction axioms

Steps 2-5 import `SemioticAmbient` and build on it without changing
what is already proved.

---

## Common pitfalls

- **Completeness vs. finiteness.** The spec requires a *complete*
  Heyting algebra (arbitrary joins and meets). Mathlib provides
  `CompleteHeytingAlgebra`. The current `HeytingDomain`
  only assumes a (bounded) `HeytingAlgebra`. The pragmatic choice: work with
  `HeytingAlgebra` first, prove what can be proved, and add
  completeness when the proof requires it (join-continuity of j
  over arbitrary families).

- **Comonad in a poset.** On a poset, a comonad simplifies because
  all diagrams commute automatically (at most one morphism between
  any two objects). The coassociativity and counit laws reduce to
  inequalities. Do not import a general category-theoretic comonad
  library — define the poset version directly.

- **sorry is honest.** Use `sorry` for steps that need more work,
  and document what the sorry represents. A file with 10 sorry-free
  theorems and 3 sorries for hard steps is more useful than a file
  that avoids all difficulty by restricting scope.

- **Typeclass vs. structure.** Use `class` for `ModalClosure` and
  `HeytingComonad` so that Lean's instance resolution finds them
  automatically. Use `structure` for `Fragment` and
  `PartialSemiotic` since these are data, not ambient assumptions.

## What comes next

After completing these five steps, the formalization becomes Layer 2
of the
[verification infrastructure](../../../../../../technology/specifications/agential-semioverse-repository/theory/operational-closure.md).
The Python tools (predicate-graph.py, validate-content.py) continue as
Layer 0/0.5 scaffolding. The Lean proofs are the real verification:
they prove that the mathematical structures the repository claims to
instantiate are coherent.

The practical path: complete Step 1, verify it compiles, then assess
which of Steps 2-5 to tackle next based on what the repository most
needs verified.
