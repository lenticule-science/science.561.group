import ObsmetrologiaPhysicalScience.CausalSets.Causal.Cohomology.H2

/-!
# Causal Hⁿ — the cochain complex in every degree

`CausalCohomology` / `CausalCohomologyH2` built the causal order complex degree by degree (`δ⁰`,
`δ¹`, `δ²`). This module supplies the **general** coboundary `δ` in one stroke, for all degrees at
once, and proves `δ ∘ δ = 0` — so `Hⁿ = ker δ / im δ` is well-defined in every degree `n`.

The standard route to general `δ² = 0` (the simplicial alternating sum `δφ(σ) = Σᵢ(−1)ⁱφ(dᵢσ)` with
the `Fin.succAbove` simplicial identity and a sign-reversing involution) needs machinery Obsmetrologia does
not have. Working instead through the incidence-algebra reading (`CausalMobius`), the coboundary has a
clean **recursive (cone-contraction) form**: a simplex is a list, and

  `δφ(a ∷ τ) = φ(τ) − δ(a·φ)(τ)`,  where  `(a·φ)(l) = φ(a ∷ l)`,

removing the head with `+` and recursing into the tail with the prepend-shift. From this, `δ ∘ δ = 0`
is **induction on the chain length** — `δ²φ(a∷τ) = δ²(a·φ)(τ)`, vanishing by the inductive hypothesis
— with no `eraseIdx` commutation, no `Fin.succAbove`, no involution. Pure core Lean.

The simplices are causal **chains** (lists `[x₀,…,xₙ]` with `xᵢ ≺ xᵢ₊₁`); a degree-`n` cochain is an
integer function on `(n+1)`-chains. `δ` raises degree by one, and `δ² = 0` gives the full graded
complex `C⁰ → C¹ → C² → ⋯` whose `H¹` is the `cl-inv` / chromatic obstruction
(`thm:causal-cochain-complex`) and `H²` the symplectic-form home (`thm:causal-cohomology-h2`).

## Main definitions

* `delta` — the general simplicial coboundary (recursive cone form), all degrees.
* `Cocycle` / `Coboundary` — closed and exact cochains in any degree; `Hⁿ` their quotient.

## Main results

* `delta_cons` — the cone-contraction recursion `δφ(a∷τ) = φ(τ) − δ(a·φ)(τ)`.
* `delta_sub` — `δ` is additive (linear): `δ(f − g) = δf − δg`.
* `delta_delta` — **`δ ∘ δ = 0` in every degree**, by induction on chain length.
* `coboundary_cocycle` — every coboundary is a cocycle (`im δ ⊆ ker δ`), so `Hⁿ` is well-defined.
* `causal_cohomology_n` — the bundled headline.

## References

`content/.../lorentzian-causal-settling`; the all-degree continuation of `thm:causal-cohomology-h2`,
read through the incidence algebra of `Obsmetrologia.CausalSets.Incidence.Mobius`.

## Tags

causal cohomology, Hn, cochain complex, simplicial coboundary, cone contraction, incidence algebra
-/

namespace Obsmetrologia
namespace CausalSets.Causal.Cohomology.N

variable {E : Type}

/-! ## (A) The general coboundary -/

/-- A **cochain**: an integer function on simplices (lists of events). A degree-`n` cochain is read
on the `(n+1)`-element chains. -/
abbrev Cochain (E : Type) : Type := List E → Int

/-- The **general simplicial coboundary** `δ`, in cone-contraction form: removing the head vertex
with `+`, recursing into the tail with the prepend-shift `a·φ`. On a list of length `k` this is the
alternating face sum `δφ(σ) = Σᵢ(−1)ⁱ φ(σ.eraseIdx i)`; the recursion is the same map without the
`Fin`/sign bookkeeping. -/
def delta : Cochain E → Cochain E
  | _, [] => 0
  | φ, a :: τ => φ τ - delta (fun l => φ (a :: l)) τ

/-- **The cone-contraction recursion** `δφ(a ∷ τ) = φ(τ) − δ(a·φ)(τ)`, the defining equation. -/
theorem delta_cons (φ : Cochain E) (a : E) (τ : List E) :
    delta φ (a :: τ) = φ τ - delta (fun l => φ (a :: l)) τ := rfl

/-! ## (B) Linearity -/

/-- **`δ` is additive on differences.** `δ(f − g) = δf − δg` — linearity of the alternating sum,
by induction on the chain. -/
theorem delta_sub (f g : Cochain E) (σ : List E) :
    delta (fun l => f l - g l) σ = delta f σ - delta g σ := by
  induction σ generalizing f g with
  | nil => rfl
  | cons a τ ih =>
    simp only [delta_cons]
    rw [ih (fun l => f (a :: l)) (fun l => g (a :: l))]
    omega

/-! ## (C) The cochain identity `δ ∘ δ = 0` -/

/-- **`δ ∘ δ = 0` in every degree.** The cone recursion gives `δ²φ(a∷τ) = δ²(a·φ)(τ)`: the head term
`δφ(τ)` cancels against itself, leaving the prepend-shifted `δ²` on the strictly shorter tail, which
vanishes by induction. No simplicial identity, no involution — just chain-length induction. -/
theorem delta_delta (φ : Cochain E) (σ : List E) : delta (delta φ) σ = 0 := by
  induction σ generalizing φ with
  | nil => rfl
  | cons a τ ih =>
    have hstep : delta (delta φ) (a :: τ) = delta (delta (fun l => φ (a :: l))) τ := by
      rw [delta_cons]
      have hfun : (fun l => delta φ (a :: l))
          = (fun l => φ l - delta (fun m => φ (a :: m)) l) := by
        funext l; rw [delta_cons]
      rw [hfun, delta_sub]
      omega
    rw [hstep]
    exact ih (fun l => φ (a :: l))

/-! ## (D) Cocycles, coboundaries, and Hⁿ -/

/-- A cochain is a **cocycle** (closed) when `δ` annihilates it — a class in `ker δ`. -/
def Cocycle (φ : Cochain E) : Prop := delta φ = fun _ => 0

/-- A cochain is a **coboundary** (exact) when it is `δ` of another — a class in `im δ`. -/
def Coboundary (φ : Cochain E) : Prop := ∃ ψ : Cochain E, φ = delta ψ

/-- **Every coboundary is a cocycle** (`im δ ⊆ ker δ`), so `Hⁿ = ker δ / im δ` is well-defined in
every degree — the full graded cohomology of the causal order complex. -/
theorem coboundary_cocycle {φ : Cochain E} (h : Coboundary φ) : Cocycle φ := by
  obtain ⟨ψ, rfl⟩ := h
  funext σ
  exact delta_delta ψ σ

/-! ## (E) The bundled headline -/

/-- **Causal Hⁿ.** The causal order complex carries a single coboundary `δ` raising degree by one,
in cone-contraction form (`delta_cons`), additive (`delta_sub`), and satisfying **`δ ∘ δ = 0` in
every degree** (`delta_delta`) — so `im δ ⊆ ker δ` and `Hⁿ = ker δ / im δ` is well-defined for all
`n` (`coboundary_cocycle`). This subsumes the degreewise complex (`H¹` the `cl-inv`/chromatic
obstruction, `H²` the symplectic-form home) into one graded object, proved without the simplicial
`Fin.succAbove` / involution machinery — by chain-length induction off the incidence-algebra reading
of `CausalMobius`. -/
theorem causal_cohomology_n :
    (∀ (φ : Cochain E) (a : E) (τ : List E),
        delta φ (a :: τ) = φ τ - delta (fun l => φ (a :: l)) τ)
    ∧ (∀ (f g : Cochain E) (σ : List E),
        delta (fun l => f l - g l) σ = delta f σ - delta g σ)
    ∧ (∀ (φ : Cochain E) (σ : List E), delta (delta φ) σ = 0)
    ∧ (∀ (φ : Cochain E), Coboundary φ → Cocycle φ) :=
  ⟨delta_cons, delta_sub, delta_delta, fun _ h => coboundary_cocycle h⟩

/-! ## (F) The mod-two reduction at every degree

The degree-one reduction `CausalSets.Causal.Cohomology.reduced_coboundary_is_parity_gradient`
sends the `ℤ` causal gradient to the `ℤ/2` merge gradient. Because `δ` is `ℤ`-linear
(`delta_sub`) and defined by subtraction, reduction mod two is a chain map in *every*
degree (`delta_mod_two`): two cochains agreeing mod two have `δ`'s agreeing mod two.
So the `ℤ/2` reconciliation currency is graded — it reduces consistently up the whole
`Hⁿ` tower. A purely-even obstruction (a `2`-divisible cochain, pure multiplicity) is
mod-two trivial at every degree (`even_obstruction_mod_two_trivial`): the multiplicity
the counting merge carries and the idempotent merge discards
(`QuantumContextuality.two_spread_ledger`) vanishes in the parity currency at every
energy level, not only at one loop. -/

/-- **The coboundary of the zero cochain is zero in every degree.** -/
theorem delta_zero (σ : List E) : delta (fun _ : List E => (0 : Int)) σ = 0 := by
  induction σ with
  | nil => rfl
  | cons a τ ih => rw [delta_cons, ih]; simp

/-- **Reduction mod two is a chain map in every degree.** If two cochains agree mod
two on every simplex, their coboundaries agree mod two on every simplex: `δ` descends
to the `ℤ/2` complex at all degrees. The graded lift of the degree-one causal-to-merge
reduction. -/
theorem delta_mod_two (f g : Cochain E) (hfg : ∀ l, f l % 2 = g l % 2) :
    ∀ σ, delta f σ % 2 = delta g σ % 2 := by
  intro σ
  induction σ generalizing f g with
  | nil => rfl
  | cons a τ ih =>
    rw [delta_cons, delta_cons]
    have := hfg τ
    have := ih (fun l => f (a :: l)) (fun l => g (a :: l)) (fun l => hfg (a :: l))
    omega

/-- **A purely-even obstruction is mod-two trivial in every degree.** The coboundary
of a `2`-divisible cochain vanishes mod two everywhere: pure multiplicity — the record
mass beyond the idempotent support — carries no parity reading at any degree. -/
theorem even_obstruction_mod_two_trivial (ψ : Cochain E) (σ : List E) :
    delta (fun l => 2 * ψ l) σ % 2 = 0 := by
  rw [delta_mod_two (fun l => 2 * ψ l) (fun _ => 0) (fun l => by omega) σ, delta_zero]
  rfl

end CausalSets.Causal.Cohomology.N
end Obsmetrologia
