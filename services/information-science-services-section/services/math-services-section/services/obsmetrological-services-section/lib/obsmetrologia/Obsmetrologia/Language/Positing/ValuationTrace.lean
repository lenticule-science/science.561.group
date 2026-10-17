import Obsmetrologia.Articulation.Articulating.Trace
import Obsmetrologia.Language.Positing.Meme
import Obsmetrologia.Language.Positing.Valuation

/-!
# Positing.ValuationTrace — the corpus's named "trace" of valuations

`valuation.md` names the object directly: *"A knowledge-monotone family
`v_σ ≤ₖ v_τ` is a trace — the Scott-continuous dynamic object [that] settling
iterates... until the last valuation stops changing."* This module realizes
that named-but-unformalized object, in the strict-finite regime, as a concrete
`Trace Meme Valuation` (`Articulation.Articulating.Trace`): seeded at
`Valuation.knowledgeLeast`, folding a finite word of `Meme`s by
`memeAdvance` — one asserted claim's reading, knowledge-joined in at a time.

The load-bearing fact is `memeAdvance_leK`: every fold step only climbs the
knowledge order, so any `valuationTrace`'s carrier really is the
knowledge-monotone family the corpus names — not by construction fiat, but
proved from `Reading.leK_joinK_left`.
-/

namespace Obsmetrologia

/-- Fold one meme into a valuation: knowledge-join the meme's reading in at its
own claim, leaving every other claim's reading as `v` already had it (joining
`kBot` there, the knowledge-join identity). -/
def memeAdvance (v : Valuation) (m : Meme) : Valuation :=
  Valuation.joinK v (fun φ => if φ = m.cell then m.reading else Reading.kBot)

/-- One `memeAdvance` step only climbs the knowledge order — the fold never
retracts evidence. This is the proof, not the definition, of why a
`valuationTrace` is knowledge-monotone. -/
theorem memeAdvance_leK (v : Valuation) (m : Meme) : Valuation.leK v (memeAdvance v m) := by
  intro φ
  exact Reading.leK_joinK_left (v φ) _

/-- The valuation trace: seeded at the knowledge-least valuation, folding `n`
memes — sliced from the ordinal `n`, per `Trace` — by `memeAdvance`. The
concrete, strict-finite realization of `valuation.md`'s named trace object. -/
def valuationTrace (n : Nat) (memes : Fin n → Meme) : Trace Meme Valuation where
  seed := Valuation.knowledgeLeast
  len := n
  move := memes
  advance := memeAdvance

/-- Every prefix of a valuation trace is knowledge-below the next: folding one
more meme in only climbs `≤ₖ`. The concrete witness that `valuationTrace`
produces a knowledge-monotone family, as `valuation.md` requires of a trace. -/
theorem valuationTrace_snoc_leK (n : Nat) (memes : Fin n → Meme) (m : Meme) :
    Valuation.leK (valuationTrace n memes).carrier
      ((valuationTrace n memes).snoc m).carrier := by
  rw [Trace.carrier_snoc]
  exact memeAdvance_leK _ m

end Obsmetrologia
