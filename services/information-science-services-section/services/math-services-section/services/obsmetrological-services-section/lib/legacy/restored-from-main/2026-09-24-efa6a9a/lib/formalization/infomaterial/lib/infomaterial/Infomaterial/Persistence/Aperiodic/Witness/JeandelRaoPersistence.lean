import Infomaterial.Persistence.Aperiodic.Witness.JeandelRaoSubstitution

/-!
# Jeandel–Rao persistence: the witness class survives the substitution tower

`JeandelRaoSubstitution` proves the **one rung** of persistence: the marker-domino substitution pullback
`subPull` sends the marker-ring class `b3` to the decorated witness `φ` (`subPull_b3`), preserves
cocycles (`subPull_cocycle`), and the pullback is nonzero (`jr_substitution_pullback`). The open
frontier `thm:jeandel-rao-persistence` is the **whole tower**: that `[φ]` is nonzero at *every* stage of
the Anderson–Putnam substitution direct limit, not just one.

The decisive structural fact is recorded here. The cochain `φ` is *already* a nonzero `H¹` class
(`phi_closed` + `phi_nonzero`). So the tower persists **iff the substitution self-map carries nonzero
classes to nonzero classes** — and given that single property, persistence through all iterates is a
clean induction (`jeandel_rao_persistence`). The genuine open content is therefore isolated to one
hypothesis: that the marker-domino substitution endomorphism preserves the nonzero-`H¹` property. That
hypothesis is *not* discharged here — it is the frontier — but everything downstream of it is proven, so
the frontier is reduced to exactly one statement.

Why the hypothesis, not a bare `sorry`: an *unconditional* statement quantifying over an arbitrary
cocycle-preserving self-map is **false** (a map collapsing `[φ]` is a counterexample), and one
quantifying over an arbitrary class-preserving map is **trivially** witnessed by `id`; neither is the
real claim. Pinning the *specific* marker-domino endomorphism requires the substitution tower of
complexes — the infrastructure that *is* the frontier. So the honest reduction is the conditional
theorem below, with the substitution's nonzero-class-preservation as the named open hypothesis.

## Main results
* `jeandel_rao_persistence` — if the substitution self-map preserves nonzero `H¹` classes, then `[φ]`
  is a nonzero class at every iterate (persists through the whole tower).

## References
Corpus `thm:jeandel-rao-persistence`; builds on `JeandelRaoSubstitution.jr_substitution_pullback` (the
one-rung step). The remaining frontier: construct the marker-domino substitution endomorphism on the JR
AP complex and prove it preserves the nonzero class (its primitivity/Pisot content).

## Tags
Jeandel–Rao, Anderson–Putnam, direct limit, persistence, aperiodic cohomology, frontier
-/

namespace Infomaterial
namespace Persistence.Aperiodic
namespace Witness

/-- `n`-fold composition of an endomap (the core `f^[n]` notation is Mathlib-only). -/
def iterate {α : Type} (f : α → α) : Nat → α → α
  | 0, x => x
  | n + 1, x => iterate f n (f x)

/-- **Jeandel–Rao persistence (reduced to one frontier hypothesis).** If the marker-domino substitution
endomorphism `sigma` on JR 1-cochains carries nonzero `H¹` classes to nonzero `H¹` classes, then the
decorated witness `φ` is a nonzero `H¹` class at *every* iterate `sigma^[n]` — its class survives the
entire substitution tower. The base case is the finite witness (`phi_closed`, `phi_nonzero`); the step
is the hypothesis. The hypothesis itself — that the genuine substitution preserves the nonzero class —
is the open frontier `thm:jeandel-rao-persistence`. -/
theorem jeandel_rao_persistence
    (sigma : (jrComplex.Edge → Int) → (jrComplex.Edge → Int))
    (hpreserve : ∀ ψ, jrComplex.NonzeroH1Class ψ → jrComplex.NonzeroH1Class (sigma ψ)) :
    ∀ n : Nat, jrComplex.NonzeroH1Class (iterate sigma n phi) := by
  have key : ∀ (n : Nat) (x : jrComplex.Edge → Int),
      jrComplex.NonzeroH1Class x → jrComplex.NonzeroH1Class (iterate sigma n x) := by
    intro n
    induction n with
    | zero => intro x hx; exact hx
    | succ k ih => intro x hx; exact ih (sigma x) (hpreserve x hx)
  intro n
  exact key n phi ⟨phi_closed, ⟨Edge.e2, phi_nonzero⟩⟩

end Witness
end Persistence.Aperiodic
end Infomaterial
