import Mathlib.Order.Heyting.Basic
import Mathlib.Order.Lattice
import RelationalHyperverse.Histories
import RelationalHyperverse.FiberAlgebras

-- Establishes: reindexing

/-!
# Reindexing: the presheaf structure of the Relational Universe

Corresponds to `math/reindexing.md`.

The **reindexing** structure packages the contravariant presheaf data of the
Relational Universe R: a history category T, a fiber algebra at each history, and
restriction maps H_{t'} → H_t for each prefix t ≤ t'.

The restriction maps are morphisms in the category HA_nucl: they preserve the
full Heyting algebra structure and commute with both nuclei σ and Δ.

## Main definitions
- `RelationalUniverse` : the full presheaf data for R

## Axiom schema (presheaf laws)
- `restrict_id` : H(id) = id
- `restrict_comp` : H(h' ∘ h) = H(h) ∘ H(h')  (contravariance)
- `restrict_inf`, `restrict_sup` : lattice morphism
- `restrict_σ`, `restrict_Δ` : commutation with nuclei
- `restrict_himp`, `restrict_bot`, `restrict_top` : full HA_nucl morphism

## Open items
- Grothendieck topology J on T and the sheaf condition (see `math/relational-universe.md`)
- Comonad / Day convolution structure (see `math/directed-comonad.md`)
-/

/-- The full presheaf data of the Relational Universe R.
    Does not yet include the sheaf condition (Grothendieck topology J).
    Fibers are Heyting algebras, matching `math/fiber-algebra.md` and `math/nuclear-heyting-algebra.md`.

    OPEN: add HeytingAlgebra instance for fixedFiber (sub-HA structure).
    OPEN: sheaf condition (Grothendieck topology J and amalgamation axiom).
    OPEN: comonad / Day convolution structure. -/
structure RelationalUniverse where
  -- ── Trace category ───────────────────────────────────────────────────────
  /-- The history type. -/
  T : Type*
  [T_order  : PartialOrder T]
  [T_monoid : Monoid T]
  [T_sys    : HistorySystem T]

  -- ── Fiber algebras ────────────────────────────────────────────────────────
  /-- The carrier of the fiber algebra at each history.
      Each fiber is a finite Heyting algebra: ⊓, ⊔, ⇨, ⊥, ⊤ as required by
      `math/fiber-algebra.md` (§fiber-algebra-propositional) and `math/nuclear-heyting-algebra.md`. -/
  FiberCarrier : T → Type*
  [FiberHA : ∀ t, HeytingAlgebra (FiberCarrier t)]

  /-- The BiNucleus (σ_t, Δ_t) structure on each fiber. -/
  fiberAlg : ∀ t, BiNucleus (FiberCarrier t)

  -- ── Restriction maps ─────────────────────────────────────────────────────
  /-- The restriction map H_{t'} → H_t for each t ≤ t' in T.
      (Contravariant: longer history → shorter history.) -/
  restrict : ∀ {t t' : T}, t ≤ t' → FiberCarrier t' → FiberCarrier t

  /-- H(id_t) = id: the identity morphism gives the identity map. -/
  restrict_id : ∀ (t : T) (a : FiberCarrier t),
    restrict (le_refl t) a = a

  /-- H(h' ∘ h) = H(h) ∘ H(h'): functoriality (note contravariance). -/
  restrict_comp : ∀ {t t' t'' : T} (h : t ≤ t') (h' : t' ≤ t'') (a : FiberCarrier t''),
    restrict (le_trans h h') a = restrict h (restrict h' a)

  /-- H(f) preserves meets. -/
  restrict_inf : ∀ {t t' : T} (h : t ≤ t') (a b : FiberCarrier t'),
    restrict h (a ⊓ b) = restrict h a ⊓ restrict h b

  /-- H(f) preserves joins. -/
  restrict_sup : ∀ {t t' : T} (h : t ≤ t') (a b : FiberCarrier t'),
    restrict h (a ⊔ b) = restrict h a ⊔ restrict h b

  /-- H(f) commutes with σ: H(f)(σ_{t'}(a)) = σ_t(H(f)(a)). -/
  restrict_σ : ∀ {t t' : T} (h : t ≤ t') (a : FiberCarrier t'),
    restrict h ((fiberAlg t').σ.toFun a) = (fiberAlg t).σ.toFun (restrict h a)

  /-- H(f) commutes with Δ: H(f)(Δ_{t'}(a)) = Δ_t(H(f)(a)). -/
  restrict_Δ : ∀ {t t' : T} (h : t ≤ t') (a : FiberCarrier t'),
    restrict h ((fiberAlg t').Δ.toFun a) = (fiberAlg t).Δ.toFun (restrict h a)

  -- ── Heyting structure ─────────────────────────────────────────────────────

  /-- H(f) preserves Heyting implication. -/
  restrict_himp : ∀ {t t' : T} (h : t ≤ t') (a b : FiberCarrier t'),
    restrict h (a ⇨ b) = restrict h a ⇨ restrict h b

  /-- H(f) preserves ⊥. -/
  restrict_bot : ∀ {t t' : T} (h : t ≤ t'),
    restrict h (⊥ : FiberCarrier t') = ⊥

  /-- H(f) preserves ⊤. -/
  restrict_top : ∀ {t t' : T} (h : t ≤ t'),
    restrict h (⊤ : FiberCarrier t') = ⊤

  -- ── OPEN: Sheaf condition ─────────────────────────────────────────────────
  -- A Grothendieck topology J on T and amalgamation axiom.
  -- The coverage is: t is covered by the set of one-step extensions {t*a | a ∈ Σ}.
  -- Blocked on: formalizing the coverage and compatible families.

  -- ── OPEN: Comonad / Day convolution ──────────────────────────────────────
  -- The directed comonad D giving the monoidal structure.
  -- Blocked on: the counit ε_t and comultiplication δ_t.
