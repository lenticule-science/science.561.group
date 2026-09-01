import RelationalHyperverse.UniverseMorphisms
import RelationalHyperverse.SyntacticRelationalUniverse

-- Establishes: initiality

/-!
# Initiality: H_syn V is the initial BiNucleus Heyting algebra

Corresponds to `math/initiality.md`.

## Fiber-level initiality (proved)

`H_syn V` is the initial object in the category of Heyting algebras with BiNucleus
and a fixed valuation from `V`:
- **Existence**: `H_syn.eval bn ρ` is an HA + BiNucleus morphism extending any
  valuation `ρ : V → H`. Proved in `SyntacticRelationalUniverse.lean`.
- **Uniqueness**: `H_syn.eval_unique` shows `eval bn ρ` is the unique such morphism.
  Proved in `SyntacticRelationalUniverse.lean`.

Both are packaged here as `fiber_initiality_existence` and `fiber_initiality_unique`.

## Universe-level initiality (existence proved; uniqueness open)

`H_syn V` is the fiber of the **syntactic relational universe** `synRelUniv V`:
a constant presheaf over the unit history system `Unit`. Every RelationalUniverse `S`
receives a unique `RelationalUniverseMor S (synRelUniv V)` once a compatible family
of valuations is given.

The existence is proved here as `universe_initiality_exists`. The key step
(`fiberMap_nat`) uses `H_syn.eval_unique` to show that `S.restrict h ∘ eval t'`
agrees with `eval t` by uniqueness of the evaluation morphism.

**Uniqueness (open)**: relies on the Axiom of Relational Faithfulness
(see `math/initiality.md §relational-faithfulness`). Cannot close until
that axiom is added to `RelationalUniverse`.

## Open items
- `universe_initiality_unique` : uniqueness (requires relational faithfulness axiom)
-/

universe u

-- ── §1: HistorySystem on Unit ─────────────────────────────────────────────────
-- The trivial history system: one history `()`, prefix order is equality.
-- (Unit has PartialOrder from Mathlib.Order.Heyting.Basic but no Mul/Monoid.
--  We define them here: the only sensible operation is () * () = ().)

private instance : One Unit := ⟨()⟩
private instance : Mul Unit := ⟨fun _ _ => ()⟩
private instance unitMonoid : Monoid Unit where
  mul_assoc := fun _ _ _ => rfl
  one_mul   := fun _ => rfl
  mul_one   := fun _ => rfl

/-- The prefix order on `Unit` is trivial: `() ≤ ()` always. -/
private instance : PrefixOrdering Unit where
  le_iff_prefix := fun () () => ⟨fun _ => ⟨(), rfl⟩, fun _ => le_refl ()⟩

/-- `Unit` forms a history system (extends `PrefixOrdering Unit`). -/
private instance : HistorySystem Unit := ⟨⟩

-- ── §2: The syntactic RelationalUniverse ─────────────────────────────────────

/-- The syntactic relational universe over variable set `V`.

    Constant presheaf over the unit history: `T = Unit`, every fiber is `H_syn V`,
    every restriction map is the identity. The BiNucleus at each fiber is the
    canonical `H_syn.instBiNucleus`.

    This is the RelationalUniverse structure promised by the OPEN note at the
    bottom of `SyntacticRelationalUniverse.lean`. -/
@[reducible] noncomputable def synRelUniv (V : Type u) : RelationalUniverse where
  T            := Unit
  FiberCarrier := fun _ => H_syn V
  fiberAlg     := fun _ => H_syn.instBiNucleus
  restrict     := fun _ a => a
  restrict_id  := fun _ _ => rfl
  restrict_comp  := fun _ _ _ => rfl
  restrict_inf   := fun _ _ _ => rfl
  restrict_sup   := fun _ _ _ => rfl
  restrict_σ     := fun _ _ => rfl
  restrict_Δ     := fun _ _ => rfl
  restrict_himp  := fun _ _ _ => rfl
  restrict_bot   := fun _ => rfl
  restrict_top   := fun _ => rfl

-- ── §3: Fiber-level initiality ────────────────────────────────────────────────

/-- Fiber-level initiality — existence.

    For any Heyting algebra `H` with BiNucleus `bn` and valuation `ρ : V → H`,
    the map `H_syn.eval bn ρ` extends `ρ` and is an HA + BiNucleus morphism.

    Proof: direct from the definitional reductions in `SyntacticRelationalUniverse`. -/
theorem fiber_initiality_existence {V : Type u} {H : Type u} [HeytingAlgebra H]
    (bn : BiNucleus H) (ρ : V → H) :
    ∃ f : H_syn V → H,
      (∀ (x : V), f (Quotient.mk (Proposition.synSetoid V) (Proposition.var x)) = ρ x) ∧
      (f ⊤ = ⊤) ∧ (f ⊥ = ⊥) ∧
      (∀ a b, f (a ⊓ b) = f a ⊓ f b) ∧
      (∀ a b, f (a ⊔ b) = f a ⊔ f b) ∧
      (∀ a b, f (a ⇨ b) = f a ⇨ f b) ∧
      (∀ a, f (H_syn.satFun a) = bn.σ.toFun (f a)) ∧
      (∀ a, f (H_syn.ktrFun a) = bn.Δ.toFun (f a)) :=
  ⟨H_syn.eval bn ρ,
   fun _x => rfl,
   H_syn.eval_top bn ρ,
   H_syn.eval_bot bn ρ,
   H_syn.eval_inf bn ρ,
   H_syn.eval_sup bn ρ,
   H_syn.eval_himp bn ρ,
   H_syn.eval_sat bn ρ,
   H_syn.eval_ktr bn ρ⟩

/-- Fiber-level initiality — uniqueness.

    `H_syn.eval bn ρ` is the **unique** HA + BiNucleus morphism `H_syn V → H`
    extending the valuation `ρ`.

    Proof: direct application of `H_syn.eval_unique`. -/
theorem fiber_initiality_unique {V : Type u} {H : Type u} [HeytingAlgebra H]
    (bn : BiNucleus H) (ρ : V → H)
    (f : H_syn V → H)
    (hvar  : ∀ x, f (Quotient.mk (Proposition.synSetoid V) (Proposition.var x)) = ρ x)
    (htop  : f ⊤ = ⊤)
    (hbot  : f ⊥ = ⊥)
    (hinf  : ∀ a b, f (a ⊓ b) = f a ⊓ f b)
    (hsup  : ∀ a b, f (a ⊔ b) = f a ⊔ f b)
    (hhimp : ∀ a b, f (a ⇨ b) = f a ⇨ f b)
    (hsat  : ∀ a, f (H_syn.satFun a) = bn.σ.toFun (f a))
    (hktr  : ∀ a, f (H_syn.ktrFun a) = bn.Δ.toFun (f a)) :
    ∀ a, f a = H_syn.eval bn ρ a :=
  H_syn.eval_unique bn ρ f hvar htop hbot hinf hsup hhimp hsat hktr

-- ── §4: Universe-level initiality — existence ─────────────────────────────────

/-- Universe-level initiality — existence.

    Given any RelationalUniverse `S` and a family of valuations
    `ρ : ∀ t : S.T, V → S.FiberCarrier t` compatible with the restriction maps
    (i.e. `S.restrict h (ρ t' x) = ρ t x` for every `t ≤ t'`),
    there exists a `RelationalUniverseMor S (synRelUniv V)` whose fiber map at
    each `t : S.T` is `H_syn.eval (S.fiberAlg t) (ρ t)`.

    **Key step** (`fiberMap_nat`): since `synRelUniv`'s restriction maps are `id`,
    the naturality condition reduces to
      `eval (fiberAlg t) (ρ t) a = S.restrict h (eval (fiberAlg t') (ρ t') a)`.
    Both sides are HA + BiNucleus morphisms `H_syn V → S.FiberCarrier t` extending
    `ρ t`; by `H_syn.eval_unique` they are equal. -/
theorem universe_initiality_exists {V : Type u} (S : RelationalUniverse)
    (ρ : ∀ t : S.T, V → S.FiberCarrier t)
    (ρ_nat : ∀ {t t' : S.T} (h : t ≤ t') (x : V),
               S.restrict h (ρ t' x) = ρ t x) :
    ∃ _ : RelationalUniverseMor S (synRelUniv V),
      ∀ (t : S.T) (x : V),
        H_syn.eval (S.fiberAlg t) (ρ t)
          (Quotient.mk (Proposition.synSetoid V) (Proposition.var x)) = ρ t x :=
  ⟨{ traceMap     := fun _ => ()
     traceMap_le  := fun _ => le_refl _
     traceMap_mul := fun _ _ => rfl
     fiberMap     := fun t => H_syn.eval (S.fiberAlg t) (ρ t)
     fiberMap_inf := fun t => H_syn.eval_inf (S.fiberAlg t) (ρ t)
     fiberMap_sup := fun t => H_syn.eval_sup (S.fiberAlg t) (ρ t)
     fiberMap_σ   := fun t => H_syn.eval_sat (S.fiberAlg t) (ρ t)
     fiberMap_Δ   := fun t => H_syn.eval_ktr (S.fiberAlg t) (ρ t)
     fiberMap_himp := fun t => H_syn.eval_himp (S.fiberAlg t) (ρ t)
     fiberMap_bot  := fun t => H_syn.eval_bot (S.fiberAlg t) (ρ t)
     fiberMap_top  := fun t => H_syn.eval_top (S.fiberAlg t) (ρ t)
     fiberMap_nat  := fun {t t'} h a => by
       -- (synRelUniv V).restrict = id, so LHS simplifies to eval (fiberAlg t) (ρ t) a.
       -- Goal: eval (fiberAlg t) (ρ t) a = S.restrict h (eval (fiberAlg t') (ρ t') a).
       -- Proof: apply eval_unique to S.restrict h ∘ eval (fiberAlg t') (ρ t'),
       -- showing it is an HA+BiNucleus morphism extending ρ t (using ρ_nat).
       -- By uniqueness, it equals eval (fiberAlg t) (ρ t). Then take symm.
       symm
       apply H_syn.eval_unique (S.fiberAlg t) (ρ t)
             (S.restrict h ∘ H_syn.eval (S.fiberAlg t') (ρ t'))
       · -- hvar: the composite sends var x to ρ t x (via ρ_nat).
         intro x
         simp only [Function.comp, H_syn.eval_mk, Proposition.interp]
         exact ρ_nat h x
       · -- htop
         simp only [Function.comp, H_syn.eval_top]
         exact S.restrict_top h
       · -- hbot
         simp only [Function.comp, H_syn.eval_bot]
         exact S.restrict_bot h
       · -- hinf
         intro a b
         simp only [Function.comp, H_syn.eval_inf]
         exact S.restrict_inf h _ _
       · -- hsup
         intro a b
         simp only [Function.comp, H_syn.eval_sup]
         exact S.restrict_sup h _ _
       · -- hhimp
         intro a b
         simp only [Function.comp, H_syn.eval_himp]
         exact S.restrict_himp h _ _
       · -- hsat: composite commutes with σ via eval_sat then restrict_σ.
         intro a
         simp only [Function.comp, H_syn.eval_sat]
         exact S.restrict_σ h _
       · -- hktr: composite commutes with Δ via eval_ktr then restrict_Δ.
         intro a
         simp only [Function.comp, H_syn.eval_ktr]
         exact S.restrict_Δ h _ },
   fun _t _x => rfl⟩

-- ── §5: Universe-level initiality — uniqueness (open) ────────────────────────

/-- Universe-level initiality — uniqueness.

    The `RelationalUniverseMor S (synRelUniv V)` constructed in
    `universe_initiality_exists` is the **unique** such morphism extending
    the given family of valuations.

    OPEN (math gap): uniqueness requires the Axiom of Relational Faithfulness,
    which asserts that the nuclear pair (σ_t, Δ_t) varies faithfully across fibers.
    Without this axiom, multiple non-isomorphic morphisms may exist with identical
    modal behavior on fixed propositions. See `math/initiality.md §relational-faithfulness`.
    This axiom is not yet included in `RelationalUniverse` — it must be added there
    before this theorem can be closed. -/
theorem universe_initiality_unique : True := by
  -- OPEN: math gap. Requires relational faithfulness axiom in RelationalUniverse.
  -- See math/initiality.md for the argument.
  trivial
