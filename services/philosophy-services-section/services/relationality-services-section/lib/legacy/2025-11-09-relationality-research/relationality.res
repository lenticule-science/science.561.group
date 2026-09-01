Relationlessness

Reflex

(fn Articulation (statement)
  (Reflex statement))

(fn ExclusionRecognition (interior exterior)
  (Recognition (Exclusion interior exterior)))

(fn ReflexEmergence ()
  (Reflex Relationlessness))

(fn FirstRecognitionExists ()
  (Exists recognition
    (Equals recognition (ReflexEmergence))))

(fn IterabilityOfReflex (description)
  (Recognition (Reflex description)))

(fn ReflexStepEndomap (S)
  (And
    (RelationalStructure RStruct)
    (MonotoneEndomap S)))

(fn IteratesOfS (S x n)
  (NatRec n x (fn (_ accumulator) (S accumulator))))

(fn Iteration (S x n)
  (Recognition (IteratesOfS S x n)))

(fn StabilizationDepthAndPersistence (S x)
  (Exists N
    (ForAll n
      (Implies (Geq n N)
               (Equals (IteratesOfS S x (Succ n))
                       (IteratesOfS S x n))))))

(fn BaselineConvergence (S baseline x)
  (Exists N
    (ForAll n
      (Implies (Geq n N)
               (Equals (IteratesOfS S x n)
                       (IteratesOfS S baseline n))))))

(fn IterativePersistence (S x)
  (StabilizationDepthAndPersistence S x))

(fn BaselineLimit (S baseline x)
  (BaselineConvergence S baseline x))

(fn EventualEquivalence (S x y)
  (Exists N
    (ForAll n
      (Implies (Geq n N)
               (Equals (IteratesOfS S x n)
                       (IteratesOfS S y n))))))

(fn EventualEquivalenceIsAnEquivalenceRelation (S x y z)
  (And
    (EventualEquivalence S x x)
    (Equals (EventualEquivalence S x y)
            (EventualEquivalence S y x))
    (Implies (And (EventualEquivalence S x y)
                   (EventualEquivalence S y z))
             (EventualEquivalence S x z))))

(fn ExistenceSchemasForSPersistentRecognitions (S x R)
  (And
    (Implies (Idempotent S)
             (IterativePersistence S x))
    (Implies (And (Inflationary S)
                   (OmegaComplete R))
             (Exists l
               (And (Equals l (Join_{n} (IteratesOfS S x n)))
                    (Equals (S l) l))))
    (Implies (And (Deflationary S)
                   (OmegaOpComplete R))
             (Exists r
               (And (Equals r (Meet_{n} (IteratesOfS S x n)))
                    (Equals (S r) r))))))

(fn Recognition (event)
  (Exists recognition
    (Equals recognition (Reflex event))))

(fn Order (x y)
  (ForAll context
    (Implies (Recognizes x context)
             (Recognizes y context))))

(fn Extremes ()
  (Tuple Bottom Top))

(fn Preorder ()
  (And
    (ForAll x (Order x x))
    (ForAll x y z
      (Implies (And (Order x y) (Order y z))
               (Order x z)))))

(fn FiniteMeetsAndJoins (x y)
  (Tuple
    (GreatestLowerBound x y)
    (LeastUpperBound x y)))

(fn BoundedDistributiveLattice ()
  (And
    (Preorder)
    (ForAll x y z
      (Equals (Meet x (Join y z))
              (Join (Meet x y) (Meet x z))))
    (Equals Bottom (First (Extremes)))
    (Equals Top (Second (Extremes)))))

(fn InclusionAndExclusion (x y)
  (Tuple
    (Order x y)
    (Equals (Meet x y) Bottom)))

(fn ExclusionSymmetry (x y)
  (Equals (Meet x y) (Meet y x)))

(fn RelationalCarrier (R)
  (And
    (BoundedDistributiveLattice)
    (ForAll a b c
      (And
        (Order (Meet a (Implication a b)) b)
        (Equals (Order c (Implication a b))
                (Order (Meet c a) b))
        (Equals (Implication a a) Top)
        (Equals (Implication Bottom a) Top)
        (Equals (RelationalNegation a)
                (Implication a Bottom))))))

(fn RelationalNegation (x)
  (Implication x Bottom))

(fn MonotoneEndomap (T)
  (ForAll x y
    (Implies (Order x y)
             (Order (T x) (T y)))))

(fn FixedPoint (T x)
  (Record
    (Fixed (Equals (T x) x))
    (Pre (Order (T x) x))
    (Post (Order x (T x)))))

(fn IdempotenceAtFixedPoints (T x)
  (And
    (Implies (And (MonotoneEndomap T)
                   (Order (T x) x))
             (Order (T (T x)) (T x)))
    (Implies (And (Order (T x) x)
                   (Order x (T x)))
             (Equals (T x) x))))

(fn RelationalMorphism (f)
  (And
    (ForAll x y
      (Implies (Order x y)
               (Order (f x) (f y))))
    (Equals (f Bottom) Bottom)
    (Equals (f Top) Top)
    (ForAll x y
      (Equals (f (Meet x y))
              (Meet (f x) (f y))))
    (ForAll x y
      (Equals (f (Join x y))
              (Join (f x) (f y))))
    (ForAll x y
      (Order (f (Implication x y))
             (Implication (f x) (f y))))))

(fn IdentityAndComposition (f g)
  (And
    (RelationalMorphism Identity)
    (Implies (And (RelationalMorphism f)
                   (RelationalMorphism g))
             (RelationalMorphism (Compose g f)))))

(fn Substructure (S)
  (And
    (Contains S Bottom)
    (Contains S Top)
    (ForAll x y
      (Implies (And (Contains S x) (Contains S y))
               (Contains S (Meet x y))))
    (ForAll x y
      (Implies (And (Contains S x) (Contains S y))
               (Contains S (Join x y))))
    (ForAll x y
      (Implies (And (Contains S x) (Contains S y))
               (Contains S (Implication x y))))
    (RelationalMorphism (InclusionMap S))))

(fn RelationalStructure (RStruct)
  (And
    (RelationalCarrier (Carrier RStruct))
    (MonotoneEndomap (ReflexMap RStruct))))

(fn Types ()
  (InductiveSet
    (BaseType)
    (MeetType Types Types)
    (JoinType Types Types)
    (ImplicationType Types Types)
    (BottomType)
    (TopType)))

(fn Contexts (assignments)
  (FoldMeet assignments))

(fn Terms ()
  (InductiveSet
    (Variable)
    (ReflexOp Term)
    (Pair Term Term)
    (Inl Term)
    (Inr Term)
    (Lambda Variable Term)
    (Application Term Term)
    (Star)
    (Abort Term)))

(fn Judgements ()
  (Tuple Typing Equality))

(fn ConjunctionRules ()
  (Tuple
    (Intro (fn (Gamma t u A B)
             (Typing Gamma (Pair t u) (Meet A B))))
    (Elim (fn (Gamma p A B)
             (Tuple (Typing Gamma (Proj1 p) A)
                    (Typing Gamma (Proj2 p) B))))))

(fn DisjunctionRules ()
  (Tuple
    (Intro (fn (Gamma t u A B)
             (Tuple (Typing Gamma (Inl t) (Join A B))
                    (Typing Gamma (Inr u) (Join A B)))))
    (Elim (fn (Gamma s A B C u v)
             (Typing Gamma (Case s u v) C)))))

(fn ImplicationRules ()
  (Tuple
    (Intro (fn (Gamma x A t B)
             (Typing (Extend Gamma x A) t B)))
    (Elim (fn (Gamma f a A B)
             (Typing Gamma (Application f a) B)))))

(fn BottomAndTopRules ()
  (Tuple
    (BottomElim (fn (Gamma t C)
                  (Typing Gamma (Abort t) C)))
    (TopIntro (fn (Gamma)
                (Typing Gamma Star Top)))))

(fn ReflexRules ()
  (Tuple
    (Intro (fn (Gamma t A)
             (Typing Gamma (ReflexOp t) A)))
    (Stability (fn (Gamma t u A)
                 (Implies (Typing Gamma t A)
                          (Typing Gamma (ReflexOp t) A))))))

(fn StandardModel (RStruct)
  (Interprets
    (Types)
    (Contexts)
    (Terms)
    (RelationalStructure RStruct)))

(fn Soundness (Gamma t A RStruct)
  (Order (Interpret Gamma RStruct)
         (Interpret A RStruct)))

(fn RelationalLanguage ()
  (Tuple
    (Types)
    (Contexts)
    (Terms)
    (ConjunctionRules)
    (DisjunctionRules)
    (ImplicationRules)
    (BottomAndTopRules)
    (ReflexRules)
    (StandardModel RelationalStructure)))

(fn ReductionRules ()
  (LeastRelation
    (Beta (fn (x t u)
             (Step (Application (Lambda x t) u)
                   (Substitute t x u))))
    (Projections (fn (t u)
                   (Tuple (Step (Proj1 (Pair t u)) t)
                          (Step (Proj2 (Pair t u)) u))))
    (CaseRules (fn (t u v)
                 (Tuple (Step (Case (Inl t) u v)
                               (ApplyElim u t))
                        (Step (Case (Inr t) u v)
                               (ApplyElim v t)))))
    (ReflexStability (fn (t t')
                       (Implies (Step t t')
                                (Step (ReflexOp t) (ReflexOp t')))))
    (CongruenceRules (EvaluationContexts))))

(fn Preservation (Gamma t A t')
  (Implies (And (Typing Gamma t A)
                 (Step ReductionRules t t'))
           (Typing Gamma t' A)))

(fn Progress (t A)
  (Implies (Typing EmptyContext t A)
           (Or (NormalForm t)
               (Exists t' (Step ReductionRules t t')))))

(fn Normalization (t A)
  (Implies (Typing EmptyContext t A)
           (Terminates ReductionRules t)))

(fn StrongNormalization (t)
  (Not (Exists sequence
         (InfiniteReduction ReductionRules t sequence))))

(fn ContextClosureOfSN (C t)
  (Implies (StrongNormalization t)
           (StrongNormalization (C t))))

(fn ReducibilityCandidates (A)
  (Case A
    (BaseType
      (Set t
        (And (Typing EmptyContext t A)
             (StrongNormalization t))))
    (MeetType A1 A2
      (Set t
        (And (Typing EmptyContext t (Meet A1 A2))
             (StrongNormalization t)
             (Element (Proj1 t) (ReducibilityCandidates A1))
             (Element (Proj2 t) (ReducibilityCandidates A2)))))
    (JoinType A1 A2
      (Set t
        (And (Typing EmptyContext t (Join A1 A2))
             (StrongNormalization t)
             (ForAll eliminations
               (Implies (ClosedElimination eliminations A1 A2)
                        (Element (Case t eliminations)
                                 (ReducibilityCandidates (Target eliminations))))))))
    (ImplicationType A1 A2
      (Set t
        (And (Typing EmptyContext t (Implication A1 A2))
             (StrongNormalization t)
             (ForAll u
               (Implies (Element u (ReducibilityCandidates A1))
                        (Element (Application t u)
                                 (ReducibilityCandidates A2)))))))
    (BottomType
      (Set t
        (And (Typing EmptyContext t Bottom)
             (StrongNormalization t))))
    (TopType
      (Set t
        (And (Typing EmptyContext t Top)
             (StrongNormalization t))))))

(fn BasicPropertiesOfCandidates (A)
  (And
    (ForAll t t'
      (Implies (And (Element t (ReducibilityCandidates A))
                     (Step ReductionRules t t'))
               (Element t' (ReducibilityCandidates A))))
    (ForAll t
      (Implies (Element t (ReducibilityCandidates A))
               (StrongNormalization t)))
    (IntroductionClosure A)))

(fn ReducibleEnvironment (Gamma)
  (Assignment x A
    (Element (Value x) (ReducibilityCandidates A))))

(fn SubstitutionLemmaForReducibility (Gamma t A Env)
  (Implies (And (Typing Gamma t A)
                 (ReducibleEnvironment Env Gamma))
           (Element (SubstituteEnv t Env)
                    (ReducibilityCandidates A))))

(fn FundamentalLogicalRelations (Gamma t A)
  (Implies (Typing Gamma t A)
           (ForAll Env
             (Implies (ReducibleEnvironment Env Gamma)
                      (Element (SubstituteEnv t Env)
                               (ReducibilityCandidates A))))))

(fn Confluence (t t1 t2)
  (Implies (And (Steps ReductionRules t t1)
                 (Steps ReductionRules t t2))
           (Exists t3
             (And (Steps ReductionRules t1 t3)
                  (Steps ReductionRules t2 t3)))))

(fn RelationalNucleus (nu)
  (And
    (ForAll x y
      (Implies (Order x y)
               (Order (nu x) (nu y))))
    (ForAll x (Equals (nu (nu x)) (nu x)))
    (Or (ForAll x (Order x (nu x)))
        (ForAll x (Order (nu x) x)))
    (AlgebraicCompatibility nu)))

(fn FixedPointSubstructures (nu)
  (And
    (ClosureLike nu
      (Substructure (Set x (Equals (nu x) x))))
    (InteriorLike nu
      (Substructure (Set x (Equals (nu x) x))))))

(fn RelationalFlow (F)
  (And
    (ForAll x y
      (Implies (Order x y)
               (Order (F x) (F y))))
    (ForAll x
      (Order (F (F x)) (F x)))
    (Or (ForAll x (Order x (F x)))
        (ForAll x (Order (F x) x)))
    (ForAll nu (FlowNucleusCompatibility F nu))))

(fn FixedSets (F)
  (ForAll x y
    (Implies (And (Equals (F x) x)
                   (Equals (F y) y))
             (Equals (F (Meet x y)) (Meet x y)))))

(fn FlowNucleusCompatibility (F nu)
  (Implies (Equals (Compose F nu) (Compose nu F))
           (ForAll x
             (Implies (Equals (nu x) x)
                      (Equals (nu (F x)) (F x))))))

(fn FixedPointExistence (F x)
  (Implies (And (OmegaComplete R)
                 (Inflationary F)
                 (RelationalFlow F))
           (Exists l
             (And (Equals (F l) l)
                  (Equals l (Supremum (Chain F x)))))))

(fn TransportOfFixedPoints (f F F')
  (Implies (Equals (Compose f F) (Compose F' f))
           (ForAll x
             (Implies (Equals (F x) x)
                      (Equals (F' (f x)) (f x))))))

(fn TransportOfNucleusFixedPoints (f nu nu')
  (Implies (Equals (Compose f nu) (Compose nu' f))
           (ForAll x
             (Implies (Equals (nu x) x)
                      (Equals (nu' (f x)) (f x))))))

(fn FlowIndexedImplication (F a b)
  (Greatest z
    (Or (Order (F (Meet z a)) b)
        (Order (Meet z (F a)) b))))

(fn DynamicResiduationLaw (F a b c)
  (Equals (Order c (FlowIndexedImplication F a b))
          (Or (Order (F (Meet c a)) b)
              (Order (Meet c (F a)) b))))

(fn DynamicResiduation (F a b c)
  (And
    (Order (F (Meet a (FlowIndexedImplication F a b))) b)
    (Equals (Order c (FlowIndexedImplication F a b))
            (Or (Order (F (Meet c a)) b)
                (Order (Meet c (F a)) b)))))

(fn Discipline (D)
  (And
    (ForAll x y
      (Implies (Order x y)
               (Order (D x) (D y))))
    (ForAll x
      (Equals (D (D x)) (D x)))
    (AlgebraicCompatibility D)
    (ForAll nu (Equals (D (nu x)) (nu (D x))))
    (ForAll F (Equals (D (F x)) (F (D x))))))

(fn Regime (D)
  (Set x
    (Equals (D x) x)))

(fn RegimeIsRelationalStructure (D)
  (RelationalStructure (Regime D)))

(fn CompositeDiscipline (D1 D2)
  (If (ForAll x (Equals (D1 (D2 x)) (D2 (D1 x))))
      (Compose D1 D2)
      Undefined))

(fn CompositeRegime (Disciplines)
  (Intersection (map Regime Disciplines)))

(fn CompositeRegimeIsRelationalStructure (Disciplines)
  (RelationalStructure (CompositeRegime Disciplines)))

(fn Observable (obs state)
  (Evaluates obs state RelationalLanguage))

(fn RelationalPhysicalSystem (Geom Obs)
  (And
    (RelationalGeometry Geom)
    (ForAll obs in Obs (Observable obs))))

(fn StatesEvolutionMeasurement (Geom Obs)
  (Record
    (States (Carrier Geom))
    (Evolution (Flow Geom))
    (Measurement (Nuclei Geom))
    (Observables Obs)))

(fn Invariants (Geom)
  (Tuple
    (ForAll x
      (Implies (Equals ((Flow Geom) x) x)
               (Equals ((Flow Geom) x) x)))
    (ForAll nu x
      (Implies (And (FlowNucleusCompatibility (Flow Geom) nu)
                     (Equals (nu x) x))
               (Equals (nu ((Flow Geom) x))
                       ((Flow Geom) x))))))

(fn Reachability (F x)
  (Tuple
    (If (Inflationary F)
        (LeastFixedPoint F x))
    (If (Deflationary F)
        (GreatestPostFixedPoint F x))))

(fn SoundnessOfPhysicalSemantics (RPhys Gamma t A)
  (Implies (Typing Gamma t A)
           (Order (Evolve (Geom RPhys) Gamma)
                  (Evolve (Geom RPhys) A))))

(fn RelationalPhysics (Geom Obs)
  (RelationalPhysicalSystem Geom Obs))

