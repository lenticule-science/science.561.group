## Introduction

The ledger now unfolds in six sections: Introduction; Calculus of Relational Language; Algebra of Relational Structure; Dynamics of Relational Geometry; Mechanics of Relational Physics; and Appendices (Style Guide, RES DSL). Every later section must point back to the calculus, so we begin by reminding ourselves that no algebraic carrier exists before the calculus earns it.

#### TODO: Expand this introduction with reader guidance once each section stabilizes

## Calculus of Relational Language

The calculus precedes all algebra: it records how recognitions may be formed, how binders introduce terms, and how reductions unfold before any quotienting. We start in relationlessness, acquire contexts only through formation rules, and postpone algebraic laws until the calculus earns them.

### Relationlessness

***Relationlessness.*** There is no carrier, no term, and no context prior to formation. The calculus begins from silence: only the empty sequent (call it `EmptyJudgment`) is meaningful, and it is meaningful precisely because we can later derive something from it.

Every recognition that follows will be a binding of an earlier recognition. To keep the ledger explicit, each definition below states which symbol inherits the recognition earned so far.

### Empty Context Formation

We bind the silent recognition to the symbol `EmptyContext`, ensuring we can talk about the lone context that contains nothing else.

```
(fn FormEmptyContext ()
  (Context (EmptyContext)))
```

### Structural Constructors from Relationlessness

Before Typing exists we still need a way to build syntax and contexts. We therefore bind Relationlessness to two structural recognitions: `ContextTerm` for context sequences and `RawTerm` for term syntax.

```
(fn ContextConstructor ()
  (BindRelationlessness "ContextTerm"
    StructuralContextBody StructuralContextResult))

(fn TermConstructor ()
  (BindRelationlessness "RawTerm"
    StructuralTermBody StructuralTermResult))
```

Here `StructuralContextBody` and `StructuralTermBody` are purely structural descriptions (no Typing) that produce the corresponding results. They give us the raw objects that Typing will later relate.

### Context Sequence Base

We explicitly earn that `EmptyContext` is the base of the context sequence predicate.

```
(fn ContextSequenceBase ()
  (ContextSequence (EmptyContext)))
```

### Context Sequence Step

Whenever `Gamma` is already a context sequence, extending it with a new `(symbol, recognition)` pair keeps it a context sequence.

```
(fn ContextSequenceStep (Gamma x phi)
  (Implies
    (ContextSequence Gamma)
    (ContextSequence (Extend Gamma x phi))))
```

### Context Sequence Covers Context

To connect this inductive definition to the earlier `Context` predicate we assert that every `ContextSequence` instance is a `Context`.

```
(fn ContextSequenceCoversContext (Gamma)
  (Implies
    (ContextSequence Gamma)
    (Context Gamma)))
```

#### TODO Context Sequence Coverage
- Prove the converse (that every `Context` arises from `ContextSequence`) once substitution/lookup rules are formalized

### Term Constructors

To make typing derivations internal we declare the core term constructors of the calculus: variables, function abstractions, and applications. Each will later receive full typing rules.

```
(fn VarTerm (x)
  (Term (VarTerm x)))

(fn FunctionTerm (x phi body)
  (Term (FunctionTerm x phi body)))

(fn ApplyTerm (fn-term arg-term)
  (Term (ApplyTerm fn-term arg-term)))

(fn LeastFixTerm (X phi body)
  (Term (LeastFixTerm X phi body)))

(fn GreatestFixTerm (X phi body)
  (Term (GreatestFixTerm X phi body)))
```

#### TODO Term Constructors
- Flesh out the remaining constructors (flow-indexed terms, recursors, etc.) once their binders are earned

### Typing Rules from First Principles

Instead of assuming meta-level Γ/φ symbols, we define typing inductively on the context sequences themselves. A typing judgment is now a record tying a context sequence, a term, and a recognition together.

```
(fn TypingBase (context term recog)
  (Typing context term recog))
```

### Typing Variable Constructor

Extending a context sequence with a fresh recognition makes the corresponding variable term well-typed.

```
(fn TypingVar (context recognition term)
  (Implies
    (ContextSequence context)
    (Typing (Extend context term recognition)
            (VarTerm term)
            recognition)))
```

### Typing Function Constructor

If a body term is typable in a context extended with a new recognition, then `FunctionTerm` reifies that derivation as an arrow-type recognition in the original context.

```
(fn TypingFunction (context param recog body result)
  (Implies
    (Typing (Extend context param recog) body result)
    (Typing context
            (FunctionTerm param recog body)
            (Arrow recog result))))
```

### Typing Application Constructor

Applications are derived when both the function term and the argument term are typable in the same context.

```
(fn TypingApply (context fn-term arg-term domain codomain)
  (Implies
    (Meet
      (Typing context fn-term (Arrow domain codomain))
      (Typing context arg-term domain))
    (Typing context
            (ApplyTerm fn-term arg-term)
            codomain)))
```

#### TODO Typing Constructors
- Extend these inductive clauses to cover least/greatest fixed-point terms, substitution, and flow-specific constructs

### Weakening from Empty Context

With sequences available we can formulate a concrete weakening lemma: typing in the empty context lifts to any context built via repeated `Extend`.

```
(fn WeakeningFromEmptyContext (context term recog)
  (Implies
    (ContextSequence context)
    (Implies
      (Typing (EmptyContext) term recog)
      (Typing context term recog))))
```

#### TODO Weakening from Empty Context
- Derive this lemma structurally by induction on `ContextSequence Gamma`, using substitution for the Var/Function/Apply rules once those constructors are fully encoded

### Weakening Step

To carry out that induction we also record the one-step weakening rule: if a term is typable in `Gamma`, it remains typable after extending `Gamma` with any fresh binding.

```
(fn WeakeningStep (Gamma term phi y psi)
  (Implies
    (Meet
      (ContextSequence Gamma)
      (Typing Gamma term phi))
    (Typing (Extend Gamma y psi) term phi)))
```

#### TODO Weakening Step
- Prove this lemma by induction on `Typing Gamma term phi`, handling the Var/Function/Apply constructors explicitly

### Weakening Case — VarTerm

The base case of the weakening proof ensures that freshly added bindings do not disturb the most recent variable typing.

```
(fn WeakeningVarCase (context name recog fresh freshRecog)
  (Implies
    (ContextSequence context)
    (Typing (Extend (Extend context fresh freshRecog) name recog)
            (VarTerm name)
            recog)))
```

This constructor now directly mirrors `TypingVar`, so the weakening base case is earned immediately.

### Weakening Case — FunctionTerm

Function abstractions require recursively weakening their bodies before rewrapping the function term.

```
(fn WeakeningFunctionCase (context param recog body result fresh freshRecog)
  (Implies
    (Meet
      (ContextSequence context)
      (Typing (Extend context param recog) body result))
    (Typing (Extend context fresh freshRecog)
            (FunctionTerm param recog body)
            (Arrow recog result))))
```

This lemma now directly applies the TypingFunction constructor after weakening the body derivation.

### Weakening Case — ApplyTerm

Applications weaken pointwise: both the function and the argument must remain typable after extending the context, and then the application typing follows.

```
(fn WeakeningApplyCase (context fn-term arg-term domain codomain fresh freshRecog)
  (Implies
    (Meet
      (ContextSequence context)
      (Typing context fn-term (Arrow domain codomain))
      (Typing context arg-term domain))
    (Typing (Extend context fresh freshRecog)
            (ApplyTerm fn-term arg-term)
            codomain)))
```

Once we prove WeakeningStep for function and argument terms individually, this constructor will discharge immediately from TypingApply.

### Reflex Formation

We bind the `EmptyContext` recognition to the symbol `Reflex`, earning our first non-trivial judgment.

```
(fn FormReflex (Gamma)
  (Implies (Context Gamma)
           (Typing Gamma Reflex Recog)))
```

### Bind Transport

To apply binding inside an arbitrary recognized context we must transport the relationlessness binder along any earned recognition. `BindTransport` witnesses this ability: whenever `rho` is recognized in `Gamma`, binding against `rho` behaves like the primitive binder transported into that context. Its proof will ultimately cite both `BindRelationlessness` and `WeakeningFromEmptyContext`.

```
(fn BindTransport (Gamma rho x phi body psi)
  (Implies
    (Meet
      (Typing Gamma rho Recog)
      (Typing (Extend Gamma x phi) body psi))
    (Typing Gamma
            (Bind rho x phi body)
            (Arrow phi psi))))
```

#### TODO Bind Transport
- Derive this transport law from `BindRelationlessness` by explicitly invoking `WeakeningFromEmptyContext` and the structural substitution rules

### Bind Formation

With transport (and the needed weakening) in place we promote `Bind` itself: any recognized `rho` now admits parameterization, not just the relationless case.

```
(fn BindFormation (Gamma rho x phi body psi)
  (Implies
    (Meet
      (Typing Gamma rho Recog)
      (Typing (Extend Gamma x phi) body psi))
    (Typing Gamma
            (Bind rho x phi body)
            (Arrow phi psi))))
```

#### TODO Bind Formation
- Extend this rule to multiple parameters by formalizing `ExtendParams` and the resulting arrow type

### Function Formation

BindFormation (and therefore BindTransport plus ContextWeakening) lets us specialize the general binder to `Reflex`, yielding the `Function` constructor: any term depending on one recognized parameter can be reified as a recognizer arrow.

```
(fn FunctionFormation (Gamma x phi t psi)
  (Implies
    (Typing (Extend Gamma x phi) t psi)
    (Typing Gamma (Function x phi t)
            (Arrow phi psi))))
```

#### TODO Function Formation
- Show explicitly that `Function` is the `Bind` constructor specialized to the `Reflex` recognition

### Function Equals Bind

We now bind the syntactic symbol `Function` directly to `Bind Reflex`, making the identification explicit so later algebra can treat them interchangeably.

```
(fn FunctionEqualsBind (x phi t)
  (Equals (Function x phi t)
          (Bind Reflex x phi t)))
```

#### TODO Function Equals Bind
- Derive this equality from the encoding of function abstractions in the RES calculus rather than postulating it

### LeastFix Formation

We bind `Reflex` to the symbol `LeastFix`, equipping the calculus with the least fixed-point binder over recognitions. As with `Function`, this ultimately depends on the general Bind machinery once multi-parameter bindings are available.

```
(fn LeastFixFormation (Gamma X phi body)
  (Implies
    (Typing (Extend Gamma X (Arrow phi phi)) body phi)
    (Typing Gamma (LeastFix X body) phi)))
```

#### TODO LeastFix Formation
- Re-express `LeastFix` as an instance of `Bind` once multi-parameter and higher-order bindings are available

### GreatestFix Formation

We bind `Reflex` to the symbol `GreatestFix`, giving the dual greatest fixed-point binder once the generalized Bind rules can handle the necessary higher-order parameterizations.

```
(fn GreatestFixFormation (Gamma X phi body)
  (Implies
    (Typing (Extend Gamma X (Arrow phi phi)) body phi)
    (Typing Gamma (GreatestFix X body) phi)))
```

#### TODO GreatestFix Formation
- Provide the analogous universal binder formation once dependent contexts are introduced
- Re-express `GreatestFix` as a `Bind` once the fixed-point binder is earned from the proto-parameterization

### Judgment Reading

We bind every recognition back to the generic sequent symbol `Sequent`, so writing `Sequent Gamma t phi` always means “context Gamma recognizes that term t enacts phi.” No algebraic equation is assumed yet; we only record derivability.

### Substitute Term

We bind the recognitions `t` and `u` to the symbol `Substitute`, ensuring capture-avoiding substitution remains total precisely when both source derivations are well-formed.

```
(fn SubstituteTerm (Gamma x phi t psi u)
  (Implies
    (Meet
      (Typing (Extend Gamma x phi) t psi)
      (Typing Gamma u phi))
    (Typing Gamma (Substitute t x u) psi)))
```

#### TODO Substitute Term
- Internalize `Extend` and `Substitute` directly in RES once explicit context encodings are available

### Substitution Constructors

To pay down that TODO we introduce the raw substitution operator and its evaluation rule: substituting `u` for `x` inside term `t` is another term in the calculus.

```
(fn SubstituteRaw (t x u)
  (Term (SubstituteRaw t x u)))
```

```
(fn SubstituteTyping (Gamma x phi t psi u)
  (Implies
    (Meet
      (Typing (Extend Gamma x phi) t psi)
      (Typing Gamma u phi))
    (Typing Gamma
            (SubstituteRaw t x u)
            psi)))
```

#### TODO Substitution Constructors
- Reconcile `SubstituteRaw` with the earlier `Substitute` notation and ensure both reduce to the same RES definition

### Substitution Case — VarTerm

We note explicitly how substitution behaves on variables: replacing `x` with `u` inside `VarTerm y` yields `u` when `x` and `y` coincide and leaves the variable untouched otherwise.

```
(fn SubstituteVarCase (x y u)
  (Equals
    (SubstituteRaw (VarTerm y) x u)
    (If (Equals x y) u (VarTerm y))))
```

### Substitution Case — FunctionTerm

For function abstractions we only substitute inside the body when the bound variable differs from the one we are substituting.

```
(fn SubstituteFunctionCase (x y phi body u)
  (Equals
    (SubstituteRaw (FunctionTerm y phi body) x u)
    (If (Equals x y)
        (FunctionTerm y phi body)
        (FunctionTerm y phi (SubstituteRaw body x u)))))
```

### Substitution Case — ApplyTerm

Applications substitute recursively into both the function and argument positions.

```
(fn SubstituteApplyCase (x fn-term arg-term u)
  (Equals
    (SubstituteRaw (ApplyTerm fn-term arg-term) x u)
    (ApplyTerm
      (SubstituteRaw fn-term x u)
      (SubstituteRaw arg-term x u))))
```

#### TODO Substitution Cases
- Prove these equalities directly in RES once substitution is encoded as an explicit structural recursion on terms

Dynamics precede equations: first we define `Step`, then we bind it through evaluation contexts, and only afterward do we talk about normalization.

### Beta Step

We bind the recognitions earned from substitution to the symbol `Step`, so β-reduction is merely the observation that applying a bound recognizer to an argument is equivalent to substituting that argument.

```
(fn BetaStep (Gamma x phi t psi u)
  (Implies
    (Meet
      (Typing (Extend Gamma x phi) t psi)
      (Typing Gamma u phi))
    (Step Gamma
          (Apply (Function x phi t) u)
          (Substitute t x u))))
```

### Contextual Step

We bind evaluation contexts to `Step`, allowing reductions to percolate outward through any recognition that was already proven evaluative.

```
(fn ContextualStep (Gamma C t u)
  (Implies
    (Meet
      (EvaluationContext C Gamma)
      (Step Gamma t u))
    (Step Gamma (Plug C t) (Plug C u))))
```

### Normalizes

We bind the reducibility evidence for `t` and the value witness `v` to the symbol `Normalizes`, recording that normalization is partial but proof-relevant.

```
(fn Normalizes (Gamma t v)
  (Meet
    (Value v)
    (Reduces Gamma t v)))
```

#### TODO Normalizes
- Classify `Value`, `EvaluationContext`, and `Reduces` explicitly once Function_Profile is formalized

### Observational Equivalence

By binding every earned observation to the symbol `ContextualEquivalence`, we say two terms are equal precisely when no recognized evaluation context can tell them apart after normalization.

```
(fn ContextualEquivalence (Gamma t u)
  (ForAll C
    (Implies
      (EvaluationContext C Gamma)
      (Equals (Observation (Plug C t))
              (Observation (Plug C u))))))
```

This definition now lives in the calculus; the algebraic carrier references it as an invariant rather than assuming it axiomatically.

#### TODO Contextual Equivalence
- Define `Observation` and `EvaluationContext` concretely for each calculus fragment

### TODO Evaluation Context

We still owe the recognition bound to `EvaluationContext`, namely the shapes of contexts that permit plugging and preserve typing.

#### TODO Evaluation Context
- Specify the RES constructors for context frames and prove they respect typing

### TODO Value Classification

`Value` currently appears only as a placeholder inside `Normalizes`; we must bind it to the actual canonical forms of the calculus.

#### TODO Value Classification
- Enumerate function abstractions and other constructors that count as values and encode them in RES

### TODO Reduction Witness

`Reduces` packages multi-step reduction evidence but lacks an explicit definition inside RES.

#### TODO Reduction Witness
- Present `Reduces` as the reflexive-transitive closure of `Step` with explicit constructors

### TODO Observation Judgment

`Observation` should state how evaluation contexts report outcomes; for now it is a reminder that we still need a calculus-level observation semantics.

#### TODO Observation Judgment
- Define how observations are produced from normalized terms (e.g., values, divergence markers, or traces)

## Algebra of Relational Structure

Algebra now summarizes the recognitions that the calculus cannot tell apart under any experiment. Carriers are contextual-equivalence classes of well-typed terms; operations are images of formation/elimination rules under this quotient; identities are equations preserved by all contexts and reductions. Every algebraic statement must therefore cite the calculus directly: when we say “recognition,” we mean the contextual equivalence class minted by `ContextualEquivalence` in the previous section.

### Observational Carriers

We bind the contextual equivalence earned in the calculus to the symbol `RecognitionCarrier`, so algebra can talk about recognitions without re-deriving every term.

```
(fn RecognitionCarrier (Gamma phi)
  (Set class
    (Exists term
      (Meet (Typing Gamma term phi)
            (Element class (ContextualEquivalence Gamma term))))))
```

#### TODO Recognition Carrier
- Prove that `RecognitionCarrier` does not depend on which representative term witnesses each class, using the calculus definition of `ContextualEquivalence`
## Dynamics of Relational Geometry

### Relational Nucleus

We bind the symbol `RelationalNucleus` to any recognition endomap `nu` that keeps earlier orderings intact, stops changing results after one application, and consistently moves recognitions either forward or backward along the order.

```
(fn RelationalNucleus (nu)
  (Meet
    (ForAll x y
      (Implies (Order x y)
               (Order (nu x) (nu y))))
    (ForAll x
      (Equals (nu (nu x)) (nu x)))
    (Join
      (ForAll x
        (Order x (nu x)))
      (ForAll x
        (Order (nu x) x)))))
```

### Fixed-Point Carriers

Once `nu` is recognized as a RelationalNucleus, we bind its fixed recognitions to `NucleusFixedCarrier`, inheriting every previously earned carrier operation for that active region.

#### TODO Fixed-Point Carrier
- Spell out the inherited carrier operations that `RelationalCarrier` packages for these fixed points

```
(fn NucleusFixedCarrier (nu)
  (RelationalCarrier (Set x (Equals (nu x) x))))
```

### Relational Flow

RelationalFlow binds an endomap `F` that respects the recognition order and is guaranteed either to push recognitions forward (inflationary) or pull them backward (deflationary).

```
(fn RelationalFlow (F)
  (Meet
    (ForAll x y
      (Implies (Order x y)
               (Order (F x) (F y))))
    (Join
      (ForAll x
        (Order x (F x)))
      (ForAll x
        (Order (F x) x)))))
```

### Inflationary Flow

An inflationary flow always returns recognitions that follow or equal the originals in the order.

```
(fn Inflationary (F)
  (ForAll x
    (Order x (F x))))
```

### Deflationary Flow

A deflationary flow always returns recognitions that precede or equal the originals in the order.

```
(fn Deflationary (F)
  (ForAll x
    (Order (F x) x)))
```

### Flow–Nucleus Compatibility

Flow–Nucleus Compatibility binds the interplay between `F` and `nu`: reducing with one and then the other must equal doing the operations in the opposite order.

```
(fn FlowNucleusCompatibility (F nu)
  (ForAll x
    (Equals (F (nu x))
            (nu (F x)))))
```

### Closure Absorption

With a RelationalGeometry in hand we can internalize the connective-like behavior hinted earlier. Whenever `nu` acts like a closure and `x` and `y` are recognitions, the meet of `x` with `nu y` stays below applying `nu` to the meet of `x` and `y`, and the join of `nu x` with `y` stays below applying `nu` to their join. If `y` is already fixed by `nu`, both comparisons sharpen to equalities.

```
(fn ClosureAbsorption (nu)
  (Meet
    (ForAll x y
      (Meet
        (Order (Meet x (nu y))
               (nu (Meet x y)))
        (Order (Join (nu x) y)
               (nu (Join x y)))))
    (ForAll x y
      (Implies (Equals (nu y) y)
               (Meet
                 (Equals (nu (Meet x y)) (Meet x y))
                 (Meet
                   (Equals (nu (Join x y)) (Join x y))
                   (Order y (nu (Join x y)))))))))
```

#### TODO Closure Absorption
- Earn these inequalities directly from the definition of closure-like nuclei rather than appealing to prose

### Interior Distribution

InteriorDistribution tells the dual story: if `nu` behaves like an interior and `x` and `y` are recognitions, then `nu` applied to their meet equals the meet of their images, and `nu` applied to their join sits below the join of their images. When both `x` and `y` are already `nu`-open, the join statement becomes an equality.

```
(fn InteriorDistribution (nu)
  (Meet
    (ForAll x y
      (Meet
        (Equals (nu (Meet x y))
                (Meet (nu x) (nu y)))
        (Order (nu (Join x y))
               (Join (nu x) (nu y)))))
    (ForAll x y
      (Implies (Meet (Equals (nu x) x)
                     (Equals (nu y) y))
               (Equals (nu (Join x y))
                       (Join x y))))))
```

#### TODO Interior Distribution
- Derive these equalities using the interior compatibility axioms once they are formalized inside the calculus

### Nucleus Distributive Equalities

Closure-like nuclei also satisfy precise distributive equalities: applying `nu` after inserting a `nu`-closed argument matches applying `nu` once after the meet or join is formed. The dual statements follow for interior-like nuclei.

```
(fn NucleusDistributiveEqualities (nu)
  (Meet
    (ForAll x y
      (Equals (nu (Meet x (nu y)))
              (nu (Meet x y))))
    (ForAll x y
      (Equals (nu (Join (nu x) y))
              (nu (Join x y))))))
```

#### TODO Nucleus Distributive Equalities
- Show how these equalities arise from monotonicity and idempotence within the calculus

### Flow Distributes over Meets

Monotone flows respect connective structure. When `F` is inflationary, applying `F` to the meet of `x` and `y` lands below the meet of their images; when `F` is deflationary, that relation reverses. The same reasoning applies to joins.

```
(fn FlowDistributesOverMeets (F)
  (Meet
    (Implies (Inflationary F)
      (ForAll x y
        (Order (F (Meet x y))
               (Meet (F x) (F y)))))
    (Implies (Deflationary F)
      (ForAll x y
        (Order (Meet (F x) (F y))
               (F (Meet x y)))))
    (Implies (Inflationary F)
      (ForAll x y
        (Order (Join (F x) (F y))
               (F (Join x y)))))
    (Implies (Deflationary F)
      (ForAll x y
        (Order (F (Join x y))
               (Join (F x) (F y)))))))
```

#### TODO Flow Distribution
- Replace these order-theoretic proofs with explicit RES derivations once extremal machinery is internalized
### Temporal Closure

TemporalClosureOperators describe how an inflationary, idempotent flow produces modal-style operations. The boxed operator takes the meet of the fixed set of `F` with `x`, while the diamond operator takes the least upper bound of the iterates of `F` on `x` when that bound exists. Both operators commute with any compatible nucleus.

```
(fn TemporalClosureOperators (F x)
  (Tuple2
    (Box (Meet (Fix F) x))
    (Diamond (LeastUpperBound (Set n (Iterate F n x))))))
```

#### TODO Temporal Closure
- Earn the fixed-point machinery (`Fix`, `Iterate`, `LeastUpperBound`) before using these operators

### Principal Closure

Principal closures bind any recognition `k` to the operation that joins inputs with `k`. This operation is monotone, extensive, and idempotent; a recognition is fixed precisely when it already lies above `k` in the order.

```
(fn PrincipalClosure (k x)
  (Join x k))
```

#### TODO Principal Closure
- Verify directly in RES that `PrincipalClosure` satisfies `RelationalNucleus`

### Dual Interior from Closure

Given an antitone negation that respects the meet and join laws, any closure-like `nu` produces an interior-like operation by applying negation, `nu`, then negation again. This dualization reuses the earlier closure machinery without inventing new primitives.

```
(fn DualInteriorFromClosure (negate nu x)
  (negate (nu (negate x))))
```

#### TODO Dual Interior
- Prove inside RES that this dual operator satisfies the interior axioms once negation is formally earned

### Dynamic Residuation Along Flow

### Flow‑Indexed Implication

FlowIndexedImplication assigns to a flow `F` and recognitions `a` and `b` the greatest witness `z` that makes the flow-compatible order condition hold. This avoids infix implication notation while keeping the extremal requirement explicit.

```
(fn FlowIndexedImplication (F a b)
  (Greatest z
    (Join (Order (F (Meet z a)) b)
        (Order (Meet z (F a)) b))))
```

### Dynamic Residuation Law

DynamicResiduationLaw characterizes FlowIndexedImplication: recognition `c` orders below the implication exactly when either of the flow-shaped order statements holds.

```
(fn DynamicResiduationLaw (F a b c)
  (Equals (Order c (FlowIndexedImplication F a b))
          (Join (Order (F (Meet c a)) b)
              (Order (Meet c (F a)) b))))
```

### Dynamic Residuation

DynamicResiduation packages the FlowIndexedImplication with the residuation law so we can reason internally about flow-shaped Heyting behavior.

```
(fn DynamicResiduation (F a b c)
  (Meet
    (Order (F (Meet a (FlowIndexedImplication F a b))) b)
    (Equals (Order c (FlowIndexedImplication F a b))
            (Join (Order (F (Meet c a)) b)
                (Order (Meet c (F a)) b)))))
```

#### TODO Dynamic Residuation
- Rebuild this section once the extremal machinery (`Greatest`, `LeastUpperBound`) is fully derived inside the calculus

### General Unary Structures

Relational Geometry introduces several unary endomaps on recognitions (e.g., nuclei and flow) that share a common internal behavior: each induces a stable region of recognitions and an inherited RelationalStructure. This section abstracts that pattern into general concepts that unify these constructions and prepare the ground for later developments (e.g., specializations, multi-map composites, and higher-level operational structures).

### Discipline

***Discipline*** (`Discipline`) is a unary endomap D : R → R satisfying monotonicity, stability, algebraic compatibility, and compatibility with every nucleus and flow.

```
(fn Discipline (D)
  (Meet
    (ForAll x y
      (Implies (Order x y)
               (Order (D x) (D y))))
    (ForAll x
      (Equals (D (D x)) (D x)))
    (AlgebraicCompatibility D)
    (ForAll nu x
      (Equals (D (nu x)) (nu (D x))))
    (ForAll F x
      (Equals (D (F x)) (F (D x))))))
```

### Regime

***Regime*** (`Regime`) of a Discipline D is the set of recognitions fixed by D.

```
(fn Regime (D)
  (Set x
    (Equals (D x) x)))
```

### Regime is a RelationalStructure

***Regime is a RelationalStructure*** (`RegimeIsRelationalStructure`) asserts that Regime(D) inherits all RelationalStructure operations.

```
(fn RegimeIsRelationalStructure (D)
  (RelationalStructure (Regime D)))
```

### Composite Discipline

***Composite Discipline*** (`CompositeDiscipline`) is defined for commuting Disciplines via composition.

```
(fn CompositeDiscipline (D1 D2)
  (If (ForAll x (Equals (D1 (D2 x)) (D2 (D1 x))))
      (Compose D1 D2)
      Undefined))
```

### Composite Regime

***Composite Regime*** (`CompositeRegime`) intersects the Regimes of a commuting family of Disciplines.

```
(fn CompositeRegime (Disciplines)
  (IntersectionList (MapRegime Disciplines)))
```

Here `MapRegime` converts each Discipline into its Regime carrier and `IntersectionList` forms their finite intersection via the list encoding introduced earlier.

### Composite Regime is a RelationalStructure

***Composite Regime is a RelationalStructure*** (`CompositeRegimeIsRelationalStructure`) confirms that any CompositeRegime inherits the RelationalStructure axioms.

```
(fn CompositeRegimeIsRelationalStructure (Disciplines)
  (Meet
    (CompositeRegime Disciplines)
    (RelationalStructure (CompositeRegime Disciplines))))
```
```

Disciplines that commute with all nuclei and with the flow carve out active carriers called Profiles. Each Profile inherits the full RelationalStructure, making the geometric recursion explicit.

### Filter

We bind the symbol `Filter` to any discipline on a RelationalGeometry that preserves the order, stabilizes after one application, respects the meet/join/implication structure, commutes with every nucleus already earned for that geometry, and commutes with the distinguished flow.

```
(fn Filter (Geom FilterFn)
  (Meet
    (ForAll x y
      (Implies (Order x y)
               (Order (FilterFn x) (FilterFn y))))
    (ForAll x
      (Equals (FilterFn (FilterFn x)) (FilterFn x)))
    (ForAll x y
      (Equals (FilterFn (Meet x y))
              (Meet (FilterFn x) (FilterFn y))))
    (ForAll x y
      (Equals (FilterFn (Join x y))
              (Join (FilterFn x) (FilterFn y))))
    (ForAll x y
      (Order (FilterFn (Implication x y))
             (Implication (FilterFn x) (FilterFn y))))
    (ForAll nu
      (Implies (Element nu (Nuclei Geom))
               (ForAll x
                 (Equals (FilterFn (nu x))
                         (nu (FilterFn x))))))
    (ForAll x
      (Equals (FilterFn ((Flow Geom) x))
              ((Flow Geom) (FilterFn x))))))
```

### Profile Carrier

We bind each Filter to the symbol `Profile`, picking out the recognitions that remain unchanged after one application of the Filter. These recognitions are the Filter-active witnesses inside the ambient geometry.

```
(fn Profile (FilterFn)
  (Set x
    (Equals (FilterFn x) x)))
```

### Profile Subset Carrier

We record that every Profile recognition still lies inside the original carrier of the geometry.

```
(fn ProfileSubsetCarrier (Geom FilterFn)
  (ForAll x
    (Implies (Element x (Profile FilterFn))
             (Element x (Carrier Geom)))))
```

### Profile as RelationalStructure

Applying the Regime machinery to `Filter` shows that the Profile inherits the full RelationalStructure operations.

```
(fn ProfileIsRelationalStructure (FilterFn)
  (RelationalStructure (Profile FilterFn)))
```

#### TODO: Use `ProfileSubsetCarrier` inside this proof once carrier lemmas are formalized

### Reflex Restriction on Profiles

Assume the ambient carrier already earned a designated reflex endomap `ReflexFn`. When a Filter commutes with this endomap, we bind their interaction to `RhoProfile`, which simply reuses the original reflex action but restricts it to Profile recognitions.

```
(fn RhoProfile (ReflexFn x)
  (ReflexFn x))
```

The commuting condition itself is captured by `RhoProfileIsReflex`.

```
(fn RhoProfileIsReflex (FilterFn ReflexFn)
  (ForAll x
    (Equals (FilterFn (ReflexFn x))
            (ReflexFn (FilterFn x)))))
```

### Reflex Stability

Whenever a recognition already lies in Profile(Filter), applying the ambient reflex keeps it there.

```
(fn ProfileReflexStability (FilterFn ReflexFn)
  (ForAll x
    (Implies (Equals (FilterFn x) x)
             (Equals (FilterFn (ReflexFn x))
                     (ReflexFn x)))))
```

#### TODO: Tie `RhoProfileIsReflex` and `ProfileReflexStability` together in RES once context handling is available

### ProfileStructure with Reflex

Under these hypotheses we bind `ProfileStructureWithReflex`, which states that the Profile carrier together with its restricted reflex continues to satisfy the RelationalStructure requirements.

```
(fn ProfileStructureWithReflex (FilterFn ReflexFn)
  (Meet
    (ProfileIsRelationalStructure FilterFn)
    (RhoProfileIsReflex FilterFn ReflexFn)))
```

### ProfileLanguage

#### TODO: Provide a formal RES encoding of Function_Profile once binder machinery is available

ProfileLanguage binds the original Function_R calculus to the Profile RelationalStructure: types become Profile recognitions, contexts are formed from their finite meets, and terms act as monotone operations that respect the inherited constructors.

#### TODO: Define `profile-term` constructors explicitly once higher-order syntax is introduced

### Profile Function Term

```
(fn ProfileFunction (param body)
  (Function param body))
```

### Profile Apply Term

```
(fn ProfileApply (fn-term arg)
  (ApplyTerm fn-term arg))
```

### Profile Substitute Term

```
(fn ProfileSubstitute (term var replacement)
  (SubstituteTerm term var replacement))
```

### ProfileLanguage Soundness

We bind `ProfileLanguageSoundness` to the statement that every ProfileLanguage derivation interprets as an order-respecting recognition in the Profile RelationalStructure.

```
(fn ProfileLanguageSoundness (FilterFn Gamma t A)
  (Implies (Typing Gamma t A)
           (Order (Interpret Gamma)
                  (Interpret A))))
```

#### TODO: Replace `Interpret` with an explicit RES interpretation once Function_Profile terms are defined
```

Proof.  
This is an instance of the Soundness Theorem for Function_R, since ProfileRStruct(Filter) is a RelationalStructure.

### ProfileGeometry

#### TODO: Encode the restriction construction inside RES once dependent function types are available

ProfileGeometry binds each Filter to the RelationalGeometry carried by its Profile: the carrier is Profile(Filter), the operations are those inherited from the ambient geometry, and both the nuclei and the flow are restricted along the commuting equations earned earlier.

### Restricted Flow on Profiles

```
(fn RestrictedFlow (Geom FilterFn x)
  ((Flow Geom) x))
```

### Restricted Nucleus on Profiles

```
(fn RestrictedNucleus (nu FilterFn x)
  (nu x))
```

### Restricted Flow Stays in Profile

```
(fn RestrictedFlowInProfile (Geom FilterFn)
  (ForAll x
    (Implies (Equals (FilterFn x) x)
             (Equals (FilterFn (RestrictedFlow Geom FilterFn x))
                     (RestrictedFlow Geom FilterFn x)))))
```

### Restricted Nucleus Stays in Profile

```
(fn RestrictedNucleusInProfile (nu FilterFn)
  (ForAll x
    (Implies (Equals (FilterFn x) x)
             (Equals (FilterFn (RestrictedNucleus nu FilterFn x))
                     (RestrictedNucleus nu FilterFn x)))))
```

#### TODO Restricted Actions
- Derive these stability predicates directly from the Filter compatibility clauses rather than axiomatizing them

### ProfileGeometry is a RelationalGeometry

ProfileGeometry satisfies the RelationalGeometry axioms because every restricted nucleus and the restricted flow preserve the Profile carrier, and the remaining structure was already inherited.

```
(fn ProfileGeometryIsRelationalGeometry (Geom FilterFn)
  (Meet
    (RestrictedFlowInProfile Geom FilterFn)
    (ForAll nu in (Nuclei Geom)
      (RestrictedNucleusInProfile nu FilterFn))
    (RelationalGeometry (ProfileGeom FilterFn))))
```

Proof.  
Closure of Profile(Filter) under the restricted nuclei and flow follows from the Nucleus Compatibility and Flow Compatibility clauses in the Filter definition. The remaining axioms are inherited from Geom.

### ProfilePhysics

Let RPhys := (Geom, Obs) be a RelationalPhysicalSystem.  
Given a Filter on Geom, define the ProfilePhysics of that Filter as

```
(fn ProfilePhysics (Geom FilterFn ObsProfile)
  (RelationalPhysicalSystem
    (ProfileGeom FilterFn)
    ObsProfile))
```

where Obs_Profile is any chosen family of observables restricted to Profile(Filter)
(or newly declared observables internal to ProfileGeom(Filter)).

States are recognitions in Profile(Filter);  
evolution is given by F|_Profile;  
measurement and idealisation are provided by the family of restricted nuclei derived from the ambient geometry.

### ProfilePhysics Soundness

#### TODO: Once Function_Profile typing is encoded, restate this soundness theorem in RES form

Interpreting Function_Profile in ProfilePhys(Filter) yields:

Any judgment derivable inside ProfileLanguage remains valid inside ProfilePhysics: under the restricted flow and any restricted nucleus, interpretations preserve the previously earned order relation and maintain every invariant declared by ProfileGeometry.

```
(fn ProfilePhysicsSoundness (Geom FilterFn ObsProfile Gamma t A)
  (SoundnessOfPhysicalSemantics
    (ProfilePhysics Geom FilterFn ObsProfile)
    Gamma t A))
```

Proof.  
This is an instance of the Soundness of Physical Semantics Theorem, applied to ProfileGeom(Filter). All required compatibility properties hold by restriction from Geom.

### Filter-Induced Reflexive Reconstruction

#### TODO: Package this reconstruction chain into explicit RES theorems once the intermediate machinery is available

Let Geom be a RelationalGeometry with RelationalLanguage Function_R and RelationalPhysics as defined in this text.  
Let Filter be a Filter that commutes with Reflex.

Then Profile(Filter) supports:

1. a RelationalStructure (ProfileStructure),  
2. an internal function-like language Function_Profile (ProfileLanguage),  
3. a RelationalGeometry (ProfileGeometry),  
4. a RelationalPhysicalSystem (ProfilePhysics),

such that the entire chain

  Relational Structure →  
  Relational Language →  
  Relational Geometry →  
  Relational Physics

is reconstructed internally on Profile(Filter), with the induced Reflex replacing the global Reflex.

```
(fn FilterInducedReflexiveReconstruction (Geom FilterFn ObsProfile)
  (Tuple3
    (ProfileIsRelationalStructure FilterFn)
    (ProfileGeometryIsRelationalGeometry Geom FilterFn)
    (ProfilePhysics Geom FilterFn ObsProfile)))
```

Proof.  
Combine the previously established ProfileStructure, Reflex Stability, ProfileLanguage Soundness, ProfileGeometry, and ProfilePhysics Soundness statements. Each step of the text lifts to Profile(Filter) because Filter is a Discipline commuting with all nuclei, with the flow, and with Reflex.

### Composite Filters and Multi-Profile Domains

Filters admit simultaneous action when they commute. The constructions below describe the joint stable domains (“Composite Profiles”) induced by multiple Filters and show that these domains again support the full four-part chain of this text.

### Composite Filter

Let Filter₁, Filter₂ : R → R be Filters on Geom.  
They **commute** when

  Filter₁(Filter₂(x)) = Filter₂(Filter₁(x))

for all x ∈ R.

In this case define the **Composite Filter**

  Filter₁₂ := Filter₁ ∘ Filter₂ = Filter₂ ∘ Filter₁.

#### TODO: Extend this definition to explicit finite compositions rather than relying on prose

```
(fn CompositeFilter (Filter1 Filter2)
  (If (ForAll x
        (Equals (Filter1 (Filter2 x))
                (Filter2 (Filter1 x))))
      (Compose Filter1 Filter2)
      Undefined))
```

The same definition applies to any finite family `{Filter_i}` that commute pairwise.

### Composite Profile

For any commuting family `{Filter_i}`, the Composite Profile is the set of recognitions that every Filter_i fixes. Equivalently, it is the Profile of the finite composite Filter built by composing the family.

```
(fn CompositeProfile (Filters)
  (Set x
    (ForAll FilterFn in Filters
      (Equals (FilterFn x) x))))
```

### Composite Profile as RelationalStructure

This Composite Profile inherits every operation previously earned for recognitions, so it is again a RelationalStructure.

```
(fn CompositeProfileIsRelationalStructure (Filters)
  (RelationalStructure (CompositeProfile Filters)))
```

*Proof.*  
Each Profile(Filter_i) is a RelationalCarrier; finite intersections of such carriers remain carriers.

#### TODO: Justify this claim internally once finite intersections are encoded

### Composite ProfileGeometry

#### TODO: Formalize the restricted nuclei and flow on composite profiles, not just in prose

Whenever each Filter_i commutes with every nucleus in the geometry and with the flow, we may restrict those nuclei and the flow to the Composite Profile. These restrictions satisfy the same axioms as before, so the Composite Profile inherits a full RelationalGeometry structure.

```
(fn CompositeProfileGeometry (Filters)
  (ProfileGeom Filters))
```

#### TODO: Prove this satisfies `RelationalGeometry` via the restriction lemmas once available
### Composite ProfilePhysics

#### TODO: Formalize the restricted observables and mechanics for composite profiles

The Composite Profile supports an internal RelationalPhysicalSystem whose dynamics and measurements are the inherited restrictions of the flow and the nucleus family.

```
(fn CompositeProfilePhysics (Filters ObsProfile)
  (RelationalPhysicalSystem
    (ProfileGeom Filters)
    ObsProfile))
```

### Nested Profile

Let Filter be a Filter on Geom and let GFilter be a Filter on ProfileGeom(Filter).  
Then GFilter is a Filter on ProfileGeom(Filter), and

  Profile(GFilter)

is called a **Nested Profile** within Profile(Filter).

#### TODO: Show within RES that GFilter indeed satisfies `Filter` on `ProfileGeom(Filter)`

```
(fn NestedProfile (FilterFn GFilterFn)
  (Profile GFilterFn))
```

### Profile Tower

Given Filters acting on Profiles of Filters, the iterated construction

  Profile → ProfileStructure → ProfileLanguage → ProfileGeometry → ProfilePhysics

reconstructs at every level.  
Nested Profiles and Composite Profiles both inherit the full text chain.

#### TODO: Capture the entire tower recursively once higher-order encodings are available

```
(fn ProfileTowerStep (FilterFn NextFilterFn)
  (Profile NextFilterFn))
```
*Proof.*  
Immediate from the Profile and Composite Profile propositions and from the fact that restrictions of nuclei, flow, Reflex, and the carrier operations satisfy all axioms on each stable domain.

### Remark — Recursive Profiles

Filters on ProfileGeom(Filter) yield further Profiles.  
Thus Filters induce a recursive hierarchy of internal relational universes, each carrying its own Structure, Language, Geometry, and Physics, all defined purely in the relational vocabulary of this text.

## Mechanics of Relational Physics

The goal of this section is to provide a frame-agnostic physical interpretation: systems as geometries, states as recognitions, observables as distinguished recognitions/operations, and flow as dynamics.

### Observable

***Observable*** (`Observable`) is a designated recognition or operator on recognitions whose evaluation on a state yields an outcome term in Function_R.

#### TODO: Formalize `Evaluates` and the observation semantics; currently just a placeholder

```
(fn Observable (obs state)
  (Evaluates obs state RelationalLanguage))
```

```
(fn Evaluates (obs state language)
  (Apply language obs state))
```

#### TODO: Define `Apply`/evaluation contexts for observables

### RelationalPhysicalSystem

***RelationalPhysicalSystem*** (`RelationalPhysicalSystem`) is a tuple RPhys = (Geom, Obs) with Geom a RelationalGeometry and Obs a family of observables.

```
(fn RelationalPhysicalSystem (Geom Obs)
  (Meet
    (RelationalGeometry Geom)
    (ForAll obs in Obs (Observable obs))))
```

### States, Evolution, Measurement

#### TODO: Elaborate this record into explicit semantic laws (state space, evolution, measurement proofs)

***States, Evolution, Measurement*** (`StatesEvolutionMeasurement`) summarize that states are recognitions, evolution follows the flow F of Geom, and measurement corresponds to applying the nuclei family.

```
(fn StatesEvolutionMeasurement (Geom Obs)
  (Record
    (States (Carrier Geom))
    (Evolution (Flow Geom))
    (Measurement (Nuclei Geom))
    (Observables Obs)))
```

### Invariants

***Invariants*** (`Invariants`) note that recognitions already fixed by the flow remain fixed under evolution, and recognitions fixed by a nucleus remain conserved whenever that nucleus commutes with the flow.

```
(fn Invariants (Geom)
  (Tuple2
    (ForAll x
      (Implies (Equals ((Flow Geom) x) x)
               (Equals ((Flow Geom) x) x)))
    (ForAll nu x
      (Implies (Meet (FlowNucleusCompatibility (Flow Geom) nu)
                     (Equals (nu x) x))
               (Equals (nu ((Flow Geom) x))
                       ((Flow Geom) x))))))
```

### Reachability

#### TODO: Rebuild Least/Greatest fixed-point clauses once fixed points are internalized

***Reachability*** (`Reachability`) describes forward and backward reachable closures via least/greatest fixed points.

```
(fn Reachability (F x)
  (Tuple2
    (If (Inflationary F)
        (LeastFixedPoint F x))
    (If (Deflationary F)
        (GreatestFixedPoint F x))))

#### TODO: Justify these fixed points using the completeness properties of the carrier
```

### Soundness of Physical Semantics

#### TODO: Provide a detailed derivation from the operational semantics once reduction rules are formalized

***Soundness of Physical Semantics*** (`SoundnessOfPhysicalSemantics`) states that interpreting Function_R in a RelationalPhysicalSystem preserves order along evolution and measurement.

```
(fn SoundnessOfPhysicalSemantics (RPhys Gamma t A)
  (Implies (Typing Gamma t A)
           (Order (Evolve (Geom RPhys) Gamma)
                  (Evolve (Geom RPhys) A))))
```

### RelationalPhysics

***RelationalPhysics*** (`RelationalPhysics`) packages the canonical physical semantics: states as recognitions, evolution via the flow, measurement via nuclei, and observables given by Obs.

```
(fn RelationalPhysics (Geom Obs)
  (RelationalPhysicalSystem Geom Obs))
```

### TODO Mechanics Alignment

We still owe a calculus-level account of how Observables, States, Evolution, and Measurement are earned from the small-step semantics; this section currently assumes those structures rather than deriving them.

### Provability Preorder

Inside Function_R we define the predicate `PreorderType Gamma A B` to mean that there exists a derivation of a term witnessing an arrow from `A` to `B` under context `Gamma` (equivalently, extending the context with a term of type `A` allows us to derive `B`). Define `EquivalentType Gamma A B` when both `PreorderType Gamma A B` and its converse hold.

### Syntactic Recognitions

Let `R_Gamma` denote the set of equivalence classes of types under `EquivalentType`. The meet, join, implication, bottom, and top operations on classes are induced by forming the corresponding Function_R types and then taking their classes. The order relation on classes is induced by `PreorderType`.

### Well‑Defined Operations

These induced operations are well defined with respect to `EquivalentType` and remain monotone in each argument.  
Proof. Congruence of Function_R typing under substitution and the introduction/elimination rules ensures that mutual derivability is preserved by forming meet, join, and implication terms.

### Syntactic Structure

`R_Gamma` together with the induced operations and order forms a RelationalStructure, and the previously earned residuation law applies to the induced implication, so `R_Gamma` behaves as a Heyting algebra.  
Proof. Well‑Defined Operations ensures the constructors respect equivalence classes; entailment interprets the induced order; the Function_R rules provide distributive and residuation properties; and the reflex action remains monotone when interpreted via the designated reflex endomap.

## Appendices

### Style Guide

In text, *Relational Terms* are written in ***Strong Emphasized Title Case*** when they are being defined, and *Emphasize Title Case* when they are being referenced, with a parentheticized `MonospacePascalCase` representation of how they will be used in our Relational Expression Syntax. For example, “A ***Relational Term*** (`RelationalTerm`) is symbol used to represent a *Recognition*.” After being defined in prose, the term must be given concretely in a code block, e.g.

### RES DSL

Formally, relational expressions are represented as S-expressions formed from parentheses and atoms. Atoms may be bare or quoted; the only binding form is `(fn name? (parameters) body)`, which optionally names the resulting closure and introduces its parameters as unary binders. The evaluation rules (atom lookup, list application, closure binding) are those of ordinary prefix function-calculus.

#### Augmented Backus Naur Form

```abfn
program        = 1*sexpr

sexpr          = atom / list

list           = "(" 1*sexpr ")"

atom           = bare-atom / quoted-atom

bare-atom      = 1*bare-char
bare-char      = bare-ascii / utf8-non-ascii

bare-ascii     = %x21 / %x23-27 / %x2A-7E

quoted-atom    = DQUOTE *quoted-char DQUOTE

quoted-char    = escaped / unescaped

escaped        = %x5C ( WS / VCHAR / unicode-non-ascii )

unescaped      = WS / unescaped-ascii / unicode-non-ascii

unescaped-ascii = %x21 / %x23-5B / %x5D-7E

unicode-non-ascii = %x80-D7FF / %xE000-10FFFF

WS             = WSP / %x0A / %x0D
```
```
