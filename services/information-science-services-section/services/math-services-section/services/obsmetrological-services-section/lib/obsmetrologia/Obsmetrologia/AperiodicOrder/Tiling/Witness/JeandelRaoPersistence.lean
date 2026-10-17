import Obsmetrologia.AperiodicOrder.Tiling.Witness.JeandelRaoSubstitutionTower

/-!
# Jeandel–Rao persistence: the witness class survives the substitution tower

`JeandelRaoSubstitution.jr_substitution_pullback` proves one rung of persistence. The open
frontier `thm:jeandel-rao-persistence` is the whole tower: that `[φ]` is nonzero at every
stage of the Anderson–Putnam substitution direct limit. `φ` is already a nonzero `H¹` class
(`phi_closed` + `phi_nonzero`), so the tower persists iff the substitution self-map carries
nonzero classes to nonzero classes; given that one property, persistence through all
iterates is a clean induction (`jeandel_rao_persistence`).

That property is not discharged here — pinning the specific marker-domino endomorphism
needs the substitution tower of complexes, which is the frontier itself — so it is taken
as a named hypothesis rather than `sorry`. An unconditional statement over an arbitrary
cocycle-preserving self-map would be false (a map collapsing `[φ]` is a counterexample);
one over an arbitrary class-preserving map would be trivial (witnessed by `id`).

Corpus `thm:jeandel-rao-persistence`. Remaining frontier: construct the marker-domino
substitution endomorphism on the JR AP complex and prove it preserves the nonzero class.

## The instance witness `sigmaEdge`

`JeandelRaoSubstitutionTower` builds a concrete, unconditionally proved substitution
endomorphism `sigma` on `markerRingComplex` cochains that fixes the nonzero class `b3` at
every iterate (`sigmaIter_b3`, `b3_nonzero_in_direct_limit`), via the chain maps
`subPull : (QEdge → ℤ) → (Edge → ℤ)` (`subPull_b3 : subPull b3 = phi`) and
`recPull : (Edge → ℤ) → (QEdge → ℤ)` (`recPull_phi : recPull phi = b3`). Composing all three
pieces gives a concrete `jrComplex`-level self-map

`sigmaEdge := subPull ∘ sigma ∘ recPull`

which is cocycle-preserving *unconditionally* (`sigmaEdge_cocycle`, since it factors through
`subPull`, which lands in cocycles whenever its argument does, and `sigma` always produces a
cocycle) and fixes `φ` on the nose (`sigmaEdge_phi : sigmaEdge phi = phi`), hence at every
iterate (`sigmaEdge_iter_phi`). This instantiates the abstract `hpreserve` hypothesis of
`jeandel_rao_persistence` at the single class `φ` — not for an arbitrary nonzero class, only
along the orbit of `φ` itself, which is all persistence of `φ` needs — giving a genuinely
unconditional persistence theorem for the concrete witness
(`jeandel_rao_persistence_instance`). `jeandel_rao_persistence` itself is kept unweakened, as
the strictly more general statement (an arbitrary class-preserving self-map, not just this
one witness orbit). The residual scope of `thm:jeandel-rao-persistence` — identifying
`sigmaEdge` with the literal Labbé recognizable substitution matrix — is untouched.
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling
namespace Witness

/-- `n`-fold composition of an endomap (the core `f^[n]` notation is Mathlib-only). -/
def iterate {α : Type} (f : α → α) : Nat → α → α
  | 0, x => x
  | n + 1, x => iterate f n (f x)

/-- **Jeandel–Rao persistence (reduced to one frontier hypothesis).** If the marker-domino substitution
endomorphism `sigma` on JR 1-cochains carries nonzero `H¹` classes to nonzero `H¹` classes, then the
decorated witness `φ` is a nonzero `H¹` class at *every* iterate `sigma^[n]` — its class survives the
entire substitution tower. The base case is the finite witness (`phi_closed`, `phi_nonzero`); the step
is the hypothesis. The hypothesis itself — that the substitution preserves the nonzero class —
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

/-! ## An unconditional instance: `sigmaEdge` discharges `hpreserve` along `φ`'s own orbit -/

/-- **The concrete `jrComplex`-level substitution endomorphism.** The marker-domino rung
`subPull`, the marker-ring substitution `sigma` (from `JeandelRaoSubstitutionTower`), and the
recognizability return `recPull` compose to a self-map of `jrComplex` 1-cochains:
`sigmaEdge χ = subPull (sigma (recPull χ))`. -/
def sigmaEdge (χ : jrComplex.Edge → Int) : jrComplex.Edge → Int :=
  subPull (sigma (recPull χ))

/-- **`sigmaEdge` lands in cocycles unconditionally**, for *every* input, not just cocycles: it
factors through `subPull`, and `sigma` always produces a `markerRingComplex` cocycle
(`sigma_cocycle`), which `subPull` carries to a `jrComplex` cocycle (`subPull_cocycle`). -/
theorem sigmaEdge_cocycle (χ : jrComplex.Edge → Int) : jrComplex.IsCocycle (sigmaEdge χ) :=
  subPull_cocycle (sigma (recPull χ)) (sigma_cocycle (recPull χ))

/-- **`sigmaEdge` fixes `φ` on the nose.** Chasing the three pieces: `recPull φ = b3`
(`recPull_phi`), `sigma b3 = b3` (`sigma_b3`), `subPull b3 = φ` (`subPull_b3`). -/
theorem sigmaEdge_phi : sigmaEdge phi = phi := by
  simp only [sigmaEdge, recPull_phi, sigma_b3, subPull_b3]

/-- **Every iterate of `sigmaEdge` fixes `φ`.** By induction on `sigmaEdge_phi`. -/
theorem sigmaEdge_iter_phi : ∀ n, iterate sigmaEdge n phi = phi
  | 0 => rfl
  | n + 1 => by
    show iterate sigmaEdge n (sigmaEdge phi) = phi
    rw [sigmaEdge_phi]
    exact sigmaEdge_iter_phi n

/-- **Jeandel–Rao persistence, unconditionally, for the concrete witness `sigmaEdge`.** The
composite `sigmaEdge := subPull ∘ sigma ∘ recPull` of the already-proved marker-domino rung and
substitution-tower pieces fixes `φ` at every iterate (`sigmaEdge_iter_phi`), and `φ` is a
nonzero `H¹` class (`phi_closed`, `phi_nonzero`); so `φ`'s class survives the entire `sigmaEdge`
tower with no hypothesis left open — an instance of `jeandel_rao_persistence` discharged along
`φ`'s own orbit (not the fully general statement over an arbitrary class-preserving self-map,
which `jeandel_rao_persistence` remains, unweakened, as the strictly more general fact; and not
a claim that `sigmaEdge` is the literal Labbé recognizable substitution matrix, which stays the
residual scope of `thm:jeandel-rao-persistence`). -/
theorem jeandel_rao_persistence_instance :
    ∀ n : Nat, jrComplex.NonzeroH1Class (iterate sigmaEdge n phi) := by
  intro n
  rw [sigmaEdge_iter_phi n]
  exact ⟨phi_closed, ⟨Edge.e2, phi_nonzero⟩⟩

/-! ## Extending preservation beyond `φ`'s orbit: a characterized subfamily

`sigmaEdge` was shown to fix `φ` on the nose, along `φ`'s own orbit only. In fact `sigmaEdge`'s
action on *every* cochain — not just cocycles — is determined by exactly two coordinates: chasing
the composite `subPull ∘ sigma ∘ recPull` through its case splits (`subEdge`, `recEdge`, and
`sigma`'s own two-coordinate read-out `sigma ψ q = if q ∈ {q1,q2,q5} then ψ q1 else ψ q0`) shows
`sigmaEdge χ` reads out `χ e0` on the four edges `{e0,e1,e4,e5}` and `χ e2` on the two edges
`{e2,e3}` (`sigmaEdge_eq`), unconditionally. Consequently `sigmaEdge χ` is the zero cochain iff
`χ e0 = 0 ∧ χ e2 = 0` (`sigmaEdge_zero_iff`), and `sigmaEdge` is idempotent (`sigmaEdge_idem`):
applying it a second time changes nothing, since the second application only ever re-reads the
`e0`/`e2` coordinates it already fixed. So the whole `sigmaEdge` tower stabilizes after one step
(`iterate_sigmaEdge_succ`), and *every* cocycle `χ` with `χ e0 ≠ 0 ∨ χ e2 ≠ 0` — not only `φ` —
survives the entire tower (`sigmaEdge_persistence_subfamily`), instantiating `hpreserve` on this
whole two-coordinate subfamily rather than at the single point `φ`. (`φ e2 = 1 ≠ 0`, so
`jeandel_rao_persistence_instance` is the special case `χ = φ` of this wider theorem.)

This does not close `thm:jeandel-rao-persistence` at the fully general nonzero-class level: a
cocycle with `χ e0 = χ e2 = 0` but nonzero elsewhere (e.g. supported only on `e1`, forced
`e1 = e3` by the `f0`-boundary and free otherwise) is a nonzero class annihilated by `sigmaEdge`,
so the unconditional `hpreserve` over *all* nonzero classes remains open — consistent with the
module header's note that an unconditional statement over an arbitrary cocycle-preserving self-map
would be false. -/

/-- **`sigmaEdge` reads out only two coordinates of its argument.** On the four edges
`{e0,e1,e4,e5}` it returns `χ e0`; on the two edges `{e2,e3}` it returns `χ e2`. Proved by chasing
the definitions `sigmaEdge = subPull ∘ sigma ∘ recPull` through `subEdge`/`recEdge`/`sigma` on each
of the six edges. -/
theorem sigmaEdge_eq (χ : jrComplex.Edge → Int) :
    sigmaEdge χ = fun e => match e with
      | Edge.e2 => χ Edge.e2
      | Edge.e3 => χ Edge.e2
      | _       => χ Edge.e0 := by
  funext e
  cases e <;> rfl

/-- **`sigmaEdge` fixes the `e0`-coordinate.** -/
theorem sigmaEdge_at_e0 (χ : jrComplex.Edge → Int) : sigmaEdge χ Edge.e0 = χ Edge.e0 := by
  rw [sigmaEdge_eq]

/-- **`sigmaEdge` fixes the `e2`-coordinate.** -/
theorem sigmaEdge_at_e2 (χ : jrComplex.Edge → Int) : sigmaEdge χ Edge.e2 = χ Edge.e2 := by
  rw [sigmaEdge_eq]

/-- **`sigmaEdge χ` vanishes identically iff both read-out coordinates vanish.** An unconditional
characterization (no cocycle hypothesis needed): `sigmaEdge`'s image only ever takes the two
values `χ e0` and `χ e2` (`sigmaEdge_eq`), so it is the zero cochain exactly when both are zero. -/
theorem sigmaEdge_zero_iff (χ : jrComplex.Edge → Int) :
    sigmaEdge χ = (fun _ => (0 : Int)) ↔ χ Edge.e0 = 0 ∧ χ Edge.e2 = 0 := by
  constructor
  · intro h
    exact ⟨by rw [← sigmaEdge_at_e0 χ, h], by rw [← sigmaEdge_at_e2 χ, h]⟩
  · intro h
    rw [sigmaEdge_eq]
    funext e
    cases e <;> simp [h.1, h.2]

/-- **`sigmaEdge` is idempotent.** Applying it twice only re-reads the `e0`/`e2` coordinates it
already fixed on the first pass, so the second pass changes nothing. -/
theorem sigmaEdge_idem (χ : jrComplex.Edge → Int) : sigmaEdge (sigmaEdge χ) = sigmaEdge χ := by
  have h0 := sigmaEdge_at_e0 χ
  have h2 := sigmaEdge_at_e2 χ
  funext e
  cases e <;> simp [sigmaEdge_eq, h0, h2]

/-- **The `sigmaEdge` tower stabilizes after one step.** For every `n`, the `(n+1)`-fold iterate
from any starting cochain `χ` already equals the single-step image `sigmaEdge χ`: by induction on
`n`, using that the first application lands on a fixed point of `sigmaEdge` (`sigmaEdge_idem`). -/
theorem iterate_sigmaEdge_succ : ∀ (n : Nat) (χ : jrComplex.Edge → Int),
    iterate sigmaEdge (n + 1) χ = sigmaEdge χ := by
  intro n
  induction n with
  | zero => intro χ; rfl
  | succ n ih =>
      intro χ
      show iterate sigmaEdge (n + 1) (sigmaEdge χ) = sigmaEdge χ
      rw [ih (sigmaEdge χ)]
      exact sigmaEdge_idem χ

/-- **Jeandel–Rao persistence on a characterized subfamily, unconditionally.** Every `jrComplex`
cocycle `χ` with `χ e0 ≠ 0 ∨ χ e2 ≠ 0` survives the entire `sigmaEdge` tower: at stage `0` this is
`χ` itself (a nonzero cocycle by hypothesis); at every later stage the tower has already stabilized
at `sigmaEdge χ` (`iterate_sigmaEdge_succ`), which is a cocycle unconditionally (`sigmaEdge_cocycle`)
and nonzero because one of its two read-out coordinates is nonzero (`sigmaEdge_at_e0`,
`sigmaEdge_at_e2`). This instantiates `hpreserve` along the whole two-coordinate subfamily rather
than only at `φ` — `jeandel_rao_persistence_instance` is the case `χ = φ`. -/
theorem sigmaEdge_persistence_subfamily (χ : jrComplex.Edge → Int) (hc : jrComplex.IsCocycle χ)
    (h : χ Edge.e0 ≠ 0 ∨ χ Edge.e2 ≠ 0) :
    ∀ n : Nat, jrComplex.NonzeroH1Class (iterate sigmaEdge n χ) := by
  intro n
  match n with
  | 0 =>
      refine ⟨hc, ?_⟩
      rcases h with h0 | h2
      · exact ⟨Edge.e0, h0⟩
      · exact ⟨Edge.e2, h2⟩
  | n + 1 =>
      rw [iterate_sigmaEdge_succ n χ]
      refine ⟨sigmaEdge_cocycle χ, ?_⟩
      rcases h with h0 | h2
      · exact ⟨Edge.e0, by rw [sigmaEdge_at_e0]; exact h0⟩
      · exact ⟨Edge.e2, by rw [sigmaEdge_at_e2]; exact h2⟩

end Witness
end AperiodicOrder.Tiling
end Obsmetrologia
