import Obsmetrologia.Closure.Monad.KZ
import Obsmetrologia.Closure.LaxSlackDiagnosis
import Obsmetrologia.Closure.Regime
import Obsmetrologia.Language.Positing.Record
import Obsmetrologia.Language.Positing.Value.PreCategory
import Obsmetrologia.Dynamics.Flow.NSCFiring

/-!
# The KZ converse — `μ` carries content exactly where the gate is charged

`ClosureMonadKZ` proved the *strict* half of the weld: `mu_identity_of_cohomologyVanishes`
collapses the closure-2-monad's multiplication `μ` to the identity wherever
`cohomologyVanishes (classify d) = true` (the strict/Scott regimes). `LaxSlackDiagnosis`
proved *why*: on any antisymmetric carrier the KZ inequality forces strict idempotence
(`kz_strict_of_antisymm` / `kz_iff_strict_of_antisymm`), so `μ` can only ever be a
non-identity 2-cell where antisymmetry fails. `Positing.Value.PreCategory` built the
non-thin carrier this needs (`PreValueCategory`, `LaxVClosure`, `HasLaxSlack`) and
`Record`'s germ-carrier section exhibited the **first inhabited `HasLaxSlack` in the
tree**: `tally_lax_slack`, sitting at the tower's aperiodic corner (`regime_tower`).

This module closes the converse: it packages the antisymmetric-carrier impossibility at
maximal (`PreValueCategory`) generality, welds it to the regime/cohomology gate via the
tower's inhabitants, and locates precisely how far the connection to `Flow.NSCFiring.IsNSC`
(the directed-family commutation failure) can honestly be pushed — `IsNSC`'s equation is
stated against `Closure.Scott.sup`, a *deterministic* fold that is well-posed on `Charge`
only because `Charge.kle_antisymm` pins down least upper bounds uniquely; the germ carrier's
`DomBy` order has no such pin, and we prove exactly that (`germ_upper_bound_not_unique`)
rather than force a fake bridge.

## Main results

* `no_laxSlack_of_antisymm` — the maximally general form of part (1): on **any**
  antisymmetric `PreValueCategory`, no `LaxVClosure` has lax slack anywhere. Subsumes
  `Charge.kz_iff_strict` and `closureOp_kz_iff_strict`, phrased once at the level the
  germ carrier's `PreValueCategory` itself lives at.
* `mu_content_exactly_at_charged_gate` — the biconditional-shaped bundle of part (2): the
  antisymmetric `ModalFrame` valuation carrier has identity `μ` at the vanishing-cohomology
  spine regime *and* can never realize lax slack at any regime (the gate is causally inert
  there), while the non-antisymmetric germ carrier has genuinely non-identity `μ`
  (`tally_lax_slack`) sitting exactly at the cohomology-non-vanishing aperiodic gate,
  witnessed by the same antisymmetry failure (`germ_order_not_antisymm`) that
  `no_laxSlack_of_antisymm`'s contrapositive demands.
* `germ_upper_bound_not_unique` / `tally_lax_slack_is_sup_nonuniqueness` — part (3): the
  germ carrier's lax slack at the seed *is* a witnessed failure of upper-bound uniqueness —
  the directed-family-commutation-failure shape `IsNSC` needs — but `IsNSC` cannot be
  literally instantiated there because its `sup` is a `Charge`-specific deterministic fold
  whose good behaviour depends on `Charge.kle_antisymm`, which the germ carrier's `DomBy`
  order does not have. Documented precisely rather than faked.

## References

`Obsmetrologia.Closure.Monad.KZ`, `Obsmetrologia.Closure.LaxSlackDiagnosis`,
`Obsmetrologia.Language.Positing.Value.PreCategory`, `Obsmetrologia.Language.Positing.Record`
(germ-carrier lax-slack section, `thm:germ-lax-slack`), `Obsmetrologia.Dynamics.Flow.NSCFiring`.
-/

namespace Obsmetrologia

/-! ## (1) Antisymmetric carriers never carry lax slack — maximal generality

`kz_strict_of_antisymm`/`kz_iff_strict_of_antisymm` (`LaxSlackDiagnosis`) already generalize
`Charge.kz_iff_strict` to a bare relation. `Positing.Value.laxClosure_idem_of_antisymm`
restates the antisymmetric-collapse direction at the `PreValueCategory` level (the exact
level the germ carrier's non-antisymmetric counterexample lives at). We record the direct
corollary: on an antisymmetric `PreValueCategory`, `HasLaxSlack` is never inhabited,
anywhere. This is the maximally general form of the KZ-inequality-forces-strictness fact —
one level more general than `closureOp_no_lax_slack`, which is the `ModalFrame`/`leK`
instance. -/

/-- **No lax slack on any antisymmetric pre-value carrier.** If `V.le` is antisymmetric,
no `LaxVClosure` on `V` has lax slack at any value: the KZ inequality and inflation pin
`T.op (T.op v) = T.op v` (`Positing.Value.laxClosure_idem_of_antisymm`), directly
contradicting the second conjunct of `HasLaxSlack`. This subsumes `Charge.kz_iff_strict`,
`closureOp_kz_iff_strict`, and `closureOp_no_lax_slack` as the one `PreValueCategory`-level
statement they all specialize. -/
theorem no_laxSlack_of_antisymm {V : Positing.Value.PreValueCategory}
    (hanti : ∀ x y, V.le x y → V.le y x → x = y) (T : Positing.Value.LaxVClosure V)
    (v : V.carrier) : ¬ Positing.Value.HasLaxSlack T v := by
  rintro ⟨_, hne⟩
  exact hne (Positing.Value.laxClosure_idem_of_antisymm hanti T v)

/-- **Contrapositive form.** Lax slack at `v` forces the carrier to fail antisymmetry —
restated from `Positing.Value.genuine_lax_cone_needs_non_thin_carrier` for direct use
alongside `no_laxSlack_of_antisymm`; the two are logically the same fact read both ways. -/
theorem antisymm_of_no_laxSlack_everywhere {V : Positing.Value.PreValueCategory}
    (T : Positing.Value.LaxVClosure V) (v : V.carrier)
    (h : Positing.Value.HasLaxSlack T v) :
    ¬ (∀ x y, V.le x y → V.le y x → x = y) := by
  intro hanti
  exact no_laxSlack_of_antisymm hanti T v h

/-! ## (2) The gate bundle — `μ` carries content exactly where the gate is charged

The `ModalFrame` valuation carrier's `leK` is always antisymmetric (`Valuation.leK_antisymm`),
so by `no_laxSlack_of_antisymm`'s instance `closureOp_no_lax_slack` it can *never* realize lax
slack, regardless of which regime datum is fed to `classify` — the gate is causally inert on
this carrier. The germ carrier is the converse witness: `germ_order_not_antisymm` exhibits the
antisymmetry failure `no_laxSlack_of_antisymm` needs to be absent, and `tally_lax_slack`
exhibits the lax slack it licenses, sitting exactly at the tower's aperiodic (cohomology
`false`) corner. Bundled, these four facts are the biconditional-shaped weld: the strict
spine regime (gate `true`) forces identity `μ` on the (always-antisymmetric) `ModalFrame`
carrier and forbids slack there *at every* regime; the aperiodic corner (gate `false`) is
realized as genuine non-identity `μ` on the (non-antisymmetric) germ carrier. -/

open Valuation Valuation.ModalFrame in
/-- **`μ` carries content exactly where the gate is charged.** Four conjuncts, welding
`ClosureMonadKZ`'s strict half to `LaxSlackDiagnosis`/`Record`'s germ witness:

1. at the vanishing-cohomology spine regime (`cohomologyVanishes (classify spineData) = true`),
   the `ModalFrame` carrier's `μ` is the identity everywhere (`closureOp_idem`);
2. on that same (always-antisymmetric) carrier, lax slack is impossible *at every* valuation,
   independent of which regime is fed in — the gate cannot ever charge there
   (`closureOp_no_lax_slack`, an instance of `no_laxSlack_of_antisymm`);
3. at the cohomology-non-vanishing aperiodic corner (`cohomologyVanishes aperiodic = false`),
   the germ carrier's `μ` (the tally closure) is genuinely non-identity at the seed
   (`Record.tally_lax_slack`);
4. and that is possible *because* the germ carrier's order fails antisymmetry
   (`Record.germ_order_not_antisymm`) — the exact obstruction `no_laxSlack_of_antisymm`
   identifies as necessary.

So the lax `μ` is non-identity only where the carrier both sits at a cohomology-charged
regime corner *and* has stopped being antisymmetric — and every antisymmetric carrier in the
corpus (`ModalFrame`'s valuations, `Charge`, `Record`) is immune to the gate regardless of
regime. -/
theorem mu_content_exactly_at_charged_gate (M : ModalFrame) :
    (cohomologyVanishes (classify spineData) = true
      ∧ ∀ v : Valuation, closureOp M (closureOp M v) = closureOp M v)
    ∧ (∀ v : Valuation,
        ¬ (leK (closureOp M (closureOp M v)) (closureOp M v)
            ∧ closureOp M (closureOp M v) ≠ closureOp M v))
    ∧ (cohomologyVanishes ClosureRegime.aperiodic = false
        ∧ Positing.Value.HasLaxSlack Record.tallyLaxClosure Record.germPreValue.bot)
    ∧ (∃ s t : Nat → Record, Record.DomBy s t ∧ Record.DomBy t s ∧ s ≠ t) :=
  ⟨⟨spine_cohomology_vanishes, fun v => closureOp_idem M v⟩,
   closureOp_no_lax_slack M,
   ⟨rfl, Record.tally_lax_slack⟩,
   Record.germ_order_not_antisymm⟩

/-! ## (3) Connecting non-identity `μ` to `IsNSC` — and where the connection stops

`Flow.NSCFiring.IsNSC op S` compares `op (Closure.Scott.sup S.elems)` against
`Closure.Scott.sup (S.elems.map op)` — a genuine equation between two applications of the
*same* deterministic function `Closure.Scott.sup : List Charge → Charge`. That function is
well-posed as "the" supremum (not merely *an* upper bound) because `Charge.kle_antisymm`
forces any two mutual upper bounds of a family to coincide.

The germ carrier's `DomBy` order does not have that. We prove the precise failure: a bounded
family on the germ carrier can have **two distinct** upper bounds — so no order-theoretic
selection of "the" supremum can be canonical there the way `Charge.kle_antisymm` makes
`Closure.Scott.sup` canonical on `Charge`. `IsNSC` therefore has no honest instantiation at
the germ carrier's type `Nat → Record`: not merely because the type differs from `Charge`,
but because the *shape* of equation it states — comparing two evaluations of a single
deterministic sup-selecting function — presupposes exactly the antisymmetry the germ carrier
lacks. What *does* transport is the underlying phenomenon: the germ closure's failure of
idempotence at the seed is itself an instance of the same mutual-upper-bound
(non-unique-supremum) failure, proved directly below. -/

/-- **The germ carrier has no unique upper bound — the reason `IsNSC`'s `sup` cannot be
canonically transported.** The two witnesses of `Record.germ_order_not_antisymm` are both
upper bounds (via `DomBy`) of the two-element family containing them, yet distinct: unlike
`Closure.Scott.sup` on `Charge` (canonical by `Charge.kle_antisymm`), no order-theoretic
selection of "the" bound of a germ family is forced. -/
theorem germ_upper_bound_not_unique :
    ∃ (S : List (Nat → Record)) (u v : Nat → Record),
      (∀ x ∈ S, Record.DomBy x u) ∧ (∀ x ∈ S, Record.DomBy x v) ∧ u ≠ v := by
  obtain ⟨s, t, hst, hts, hne⟩ := Record.germ_order_not_antisymm
  refine ⟨[s, t], s, t, ?_, ?_, hne⟩
  · intro x hx
    rcases List.mem_cons.mp hx with heq | hx
    · rw [heq]; exact Record.domBy_refl s
    · rcases List.mem_cons.mp hx with heq | hx
      · rw [heq]; exact hts
      · exact absurd hx List.not_mem_nil
  · intro x hx
    rcases List.mem_cons.mp hx with heq | hx
    · rw [heq]; exact hst
    · rcases List.mem_cons.mp hx with heq | hx
      · rw [heq]; exact Record.domBy_refl t
      · exact absurd hx List.not_mem_nil

/-- **The germ carrier's lax slack at the seed is an `IsNSC`-shaped fact.** The tally
closure's double and single iterate at the seed mutually dominate (`DomBy` both ways) yet
differ — restating `tally_lax_slack` via `laxSlack_witnesses_nonantisymmetry`. This is
exactly the failure-of-commutation-with-a-would-be-join shape `IsNSC` isolates on `Charge`
(two mutually-bounding, non-equal candidates for "the" settled value at a stage), instanced
on the one carrier in the corpus where it survives past the strict/Scott collapse. -/
theorem tally_lax_slack_is_sup_nonuniqueness :
    Record.DomBy (Record.tallyLaxClosure.op (Record.tallyLaxClosure.op Record.germPreValue.bot))
        (Record.tallyLaxClosure.op Record.germPreValue.bot)
    ∧ Record.DomBy (Record.tallyLaxClosure.op Record.germPreValue.bot)
        (Record.tallyLaxClosure.op (Record.tallyLaxClosure.op Record.germPreValue.bot))
    ∧ Record.tallyLaxClosure.op (Record.tallyLaxClosure.op Record.germPreValue.bot)
        ≠ Record.tallyLaxClosure.op Record.germPreValue.bot :=
  Positing.Value.laxSlack_witnesses_nonantisymmetry Record.tallyLaxClosure
    Record.germPreValue.bot Record.tally_lax_slack

/-- **Why `Flow.NSCFiring.IsNSC` stops at the germ carrier, precisely.** Bundles the
boundary: `Charge`'s order is antisymmetric (`Charge.kle_antisymm`, imported transitively;
recorded here via `no_laxSlack_of_antisymm`'s hypothesis being satisfiable there — every
`Charge.Closure` has no NSC firing over the finite carrier, `no_nsc_firing_of_closure`), so
`Closure.Scott.sup` is a canonical deterministic fold and `IsNSC`'s equation is well-posed;
the germ carrier's order is *not* antisymmetric and provably has non-unique upper bounds
(`germ_upper_bound_not_unique`), so no canonical `sup : List (Nat → Record) → (Nat → Record)`
exists for an `IsNSC`-shaped equation to compare against — yet the same underlying
phenomenon (mutual, non-equal boundedness at a stage) is what the germ carrier's realized
lax slack witnesses (`tally_lax_slack_is_sup_nonuniqueness`). The connection to `IsNSC` is
real at the level of phenomenon and blocked at the level of literal type instantiation. -/
theorem laxSlack_is_nsc_shaped_not_nsc_typed :
    (∀ (cl : Charge.Closure) (S : Closure.Scott.DirectedFamily), ¬ Flow.NSCFiring.IsNSC cl.op S)
    ∧ (∃ (S : List (Nat → Record)) (u v : Nat → Record),
        (∀ x ∈ S, Record.DomBy x u) ∧ (∀ x ∈ S, Record.DomBy x v) ∧ u ≠ v)
    ∧ (Record.DomBy
          (Record.tallyLaxClosure.op (Record.tallyLaxClosure.op Record.germPreValue.bot))
          (Record.tallyLaxClosure.op Record.germPreValue.bot)
        ∧ Record.DomBy (Record.tallyLaxClosure.op Record.germPreValue.bot)
          (Record.tallyLaxClosure.op (Record.tallyLaxClosure.op Record.germPreValue.bot))
        ∧ Record.tallyLaxClosure.op (Record.tallyLaxClosure.op Record.germPreValue.bot)
            ≠ Record.tallyLaxClosure.op Record.germPreValue.bot) :=
  ⟨Flow.NSCFiring.no_nsc_firing_of_closure, germ_upper_bound_not_unique,
   tally_lax_slack_is_sup_nonuniqueness⟩

end Obsmetrologia
