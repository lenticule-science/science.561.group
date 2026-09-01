import Obsmetrologia.Closure.Monad.KZ

/-!
# The lax-idempotence slack is exactly antisymmetry failure

The contradiction-dynamics frontier (a stable "told-both" `⊤` charge, the non-settling aperiodic
regime, the continuum that accretes from it) all need the closure 2-monad's multiplication `μ` to
be a *non-identity 2-cell* — the **lax slack** `Cl(Cl v) <ₖ Cl v` with `Cl(Cl v) ≠ Cl v`.
`Closure2MonadKZ` records that over the corpus's value carriers this slack collapses: on the
*antisymmetric* knowledge order, the Kock–Zöberlein inequality forces strict idempotence
(`Charge.kz_iff_strict`, `closureOp_kz_iff_strict`). This module isolates **why**: it abstracts the
collapse away from any particular order and shows the obstruction is *exactly antisymmetry*.

## Main results

* `kz_strict_of_antisymm` / `kz_iff_strict_of_antisymm` — for any inflationary `f` on a relation,
  **antisymmetry** turns the KZ inequality into strict idempotence (and conversely strictness gives
  the KZ inequality by reflexivity). Antisymmetry is the whole content.
* `lax_slack_witnesses_antisymmetry_failure` — the contrapositive diagnosis: a lax cell
  (KZ holds, strictness fails) **is** a witnessed failure of antisymmetry — a pair `Cl(Cl v)`,
  `Cl v` with `le` both ways but `≠`. So stable contradiction can live only on a non-thin
  (non-antisymmetric) carrier.
* `closureOp_no_lax_slack` — the concrete consequence on the corpus's thin valuation poset: the
  modal closure has **no** lax slack at any valuation. The contradiction-dynamics red frontier is
  therefore not merely "needs reals" — it needs the value carrier to stop being antisymmetric.

## Implementation notes

The abstract lemmas take the order as a bare relation `le` with antisymmetry / reflexivity / the
inflation law as hypotheses; they are the order-parametric form of `Charge.kz_iff_strict`, which
bakes the (antisymmetric) knowledge order in. Nothing here introduces data — the abstract facts are
one-line term proofs and the concrete instance reuses `closureOp_idem`.

## References

* `…/settling/content/closure-2-monad/closure-2-monad.md` (lax-idempotence; the `μ` carries
  content only where antisymmetry fails — the transfinite/aperiodic regimes).
-/

namespace Obsmetrologia

/-! ## Abstract: antisymmetry is exactly what collapses the KZ slack -/

/-- **KZ inequality + antisymmetry ⟹ strict idempotence.** For an inflationary `f`
(`∀ a, le a (f a)`) on a relation with antisymmetry, the Kock–Zöberlein inequality
`le (f (f a)) (f a)` and the inflation `le (f a) (f (f a))` pin `f (f a) = f a`. The collapse uses
*only* antisymmetry. -/
theorem kz_strict_of_antisymm {α : Type} (le : α → α → Prop)
    (hanti : ∀ x y, le x y → le y x → x = y)
    (f : α → α) (hinfl : ∀ a, le a (f a)) (a : α)
    (hkz : le (f (f a)) (f a)) : f (f a) = f a :=
  hanti _ _ hkz (hinfl (f a))

/-- **KZ inequality ⟺ strict idempotence, under antisymmetry + reflexivity.** The forward
direction is `kz_strict_of_antisymm`; the converse is reflexivity. This is the order-parametric form
of `closureOp_kz_iff_strict`: antisymmetry is the entire reason the lax `μ` collapses. -/
theorem kz_iff_strict_of_antisymm {α : Type} (le : α → α → Prop)
    (hanti : ∀ x y, le x y → le y x → x = y) (hrefl : ∀ x, le x x)
    (f : α → α) (hinfl : ∀ a, le a (f a)) (a : α) :
    le (f (f a)) (f a) ↔ f (f a) = f a := by
  constructor
  · intro hkz; exact kz_strict_of_antisymm le hanti f hinfl a hkz
  · intro hs; rw [hs]; exact hrefl (f a)

/-- **A lax cell witnesses antisymmetry failure.** If `f` is inflationary and at `a` the KZ
inequality holds but strictness *fails* (`f (f a) ≠ f a` — a non-identity `μ`, the home of
stable `⊤`), then `f (f a)` and `f a` are `le` both ways yet unequal: a witnessed failure of
antisymmetry. So the lax slack the contradiction dynamics need cannot exist on a thin
(antisymmetric) carrier. -/
theorem lax_slack_witnesses_antisymmetry_failure {α : Type} (le : α → α → Prop)
    (f : α → α) (hinfl : ∀ a, le a (f a)) (a : α)
    (hkz : le (f (f a)) (f a)) (hlax : f (f a) ≠ f a) :
    le (f (f a)) (f a) ∧ le (f a) (f (f a)) ∧ f (f a) ≠ f a :=
  ⟨hkz, hinfl (f a), hlax⟩

/-! ## Concrete: the corpus's thin valuation poset has no lax slack -/

namespace Valuation
namespace ModalFrame

open Charge

variable (M : ModalFrame)

/-- **The modal closure's collapse is the antisymmetry instance.** `closureOp_kz_iff_strict` is
exactly `kz_iff_strict_of_antisymm` instantiated at the (antisymmetric) knowledge order `leK` with
`f = closureOp M`: the KZ inequality becomes strict idempotence *because* `leK` is antisymmetric. -/
theorem closureOp_kz_strict_is_antisymmetry_instance (v : Valuation)
    (hkz : leK (closureOp M (closureOp M v)) (closureOp M v)) :
    closureOp M (closureOp M v) = closureOp M v :=
  kz_strict_of_antisymm leK (fun _ _ h1 h2 => leK_antisymm h1 h2)
    (closureOp M) (closureOp_infl M) v hkz

/-- **No lax slack on the thin valuation poset.** At every valuation the modal closure is 
idempotent, so there is no lax cell: never `Cl(Cl v) <ₖ Cl v` with `Cl(Cl v) ≠ Cl v`. By
`lax_slack_witnesses_antisymmetry_failure` such a cell would witness a failure of antisymmetry, and
`leK` is antisymmetric — hence the contradiction-dynamics slack is structurally absent here, and the
aperiodic stable-`⊤` frontier requires a non-thin carrier, not merely the reals. -/
theorem closureOp_no_lax_slack (v : Valuation) :
    ¬ (leK (closureOp M (closureOp M v)) (closureOp M v)
        ∧ closureOp M (closureOp M v) ≠ closureOp M v) := by
  rintro ⟨_, hne⟩
  exact hne (closureOp_idem M v)

/-- **The lax-idempotence obstruction is antisymmetry (bundled, concrete).** At every valuation:
the KZ inequality is *equivalent* to strict idempotence (`closureOp_kz_iff_strict`), and there is no
lax slack (`closureOp_no_lax_slack`). Both hold for one reason — the valuation carrier `leK`
is antisymmetric. Lifting the contradiction dynamics off this collapse is precisely the move to a
non-antisymmetric carrier. -/
theorem lax_idempotence_obstruction_is_antisymmetry (v : Valuation) :
    (leK (closureOp M (closureOp M v)) (closureOp M v)
        ↔ closureOp M (closureOp M v) = closureOp M v)
    ∧ ¬ (leK (closureOp M (closureOp M v)) (closureOp M v)
          ∧ closureOp M (closureOp M v) ≠ closureOp M v) :=
  ⟨closureOp_kz_iff_strict M v, closureOp_no_lax_slack M v⟩

end ModalFrame
end Valuation
end Obsmetrologia
