/-!
# Inverse systems over `(Nat, ≤)` and their limit of threads

An inverse system of finite-stage data with restriction maps going down, and
its inverse limit realized as the type of coherent families (threads). The
stage projections are jointly injective, so the limit is separated by its
finite stages. Downstream instances: the Anderson–Putnam hull
(`AperiodicOrder.Tiling` — the constant `H1Class` system) and the two-adic
residue tower (`AperiodicOrder.Tiling.CollatzTwoAdicLock`).

Corpus: `…/aperiodic-settling/commutating/content/aperiodic-nuclear-quartet-category/content/anderson-putnam-direct-limit/anderson-putnam-direct-limit.md`.
-/

namespace Obsmetrologia

/-- An **inverse system of finite-stage data** over `(Nat, ≤)`. `stage τ` is
the data at stage `τ`; `proj h : stage n → stage m` for `m ≤ n` is the
**restriction** (bonding) map from a later stage to an earlier one. The
functor laws make it an inverse system; its limit is the type of threads. -/
structure InverseSystem where
  /-- The data at stage `τ`. -/
  stage : Nat → Type
  /-- The restriction (bonding) map `stage n → stage m` for `m ≤ n`. -/
  proj : ∀ {m n : Nat}, m ≤ n → stage n → stage m
  /-- Functoriality at reflexivity: restricting along `n ≤ n` is the identity. -/
  proj_id : ∀ {n : Nat} (h : n ≤ n) (x : stage n), proj h x = x
  /-- Functoriality of composition: restricting `k → n → m` equals restricting `k → m`. -/
  proj_comp : ∀ {m n k : Nat} (hmn : m ≤ n) (hnk : n ≤ k) (hmk : m ≤ k) (x : stage k),
    proj hmn (proj hnk x) = proj hmk x

namespace InverseSystem
variable (S : InverseSystem)

/-- A **thread** of the inverse system: a coherent family `at_ : ∀ n, stage n`
whose values are compatible under restriction (`proj h (at_ n) = at_ m` for
`m ≤ n`). The threads are the inverse limit `lim← stage`. -/
structure Thread where
  /-- The value of the thread at each stage. -/
  at_ : ∀ n, S.stage n
  /-- Coherence: the value at a later stage restricts to the value at an earlier one. -/
  coh : ∀ {m n : Nat} (h : m ≤ n), S.proj h (at_ n) = at_ m

/-- **The limit** `lim← stage`, realized as the type of threads. -/
def Hull : Type := S.Thread

/-- **A thread is determined by its values.** Two threads with the same value
at every stage are equal (the coherence fields are propositions), so the limit
is well defined. -/
theorem Thread.ext {t t' : S.Thread} (h : ∀ n, t.at_ n = t'.at_ n) : t = t' := by
  cases t with
  | mk a ca =>
    cases t' with
    | mk a' ca' =>
      have haa : a = a' := funext h
      subst haa
      rfl

/-- **The stage projection** `Hull → stage k`: read a thread at stage `k` —
the cone leg of the inverse limit. -/
def projAt (k : Nat) (t : S.Thread) : S.stage k := t.at_ k

/-- **The cone commutes.** Restricting the stage-`n` reading of a thread to
stage `m` gives the stage-`m` reading. -/
theorem projAt_coh {m n : Nat} (h : m ≤ n) (t : S.Thread) :
    S.proj h (S.projAt n t) = S.projAt m t := t.coh h

/-- **Separation by finite stages.** The stage projections are jointly
injective: two threads agreeing at every finite stage are equal — the
inverse-limit dual of a colimit's eventual-equality identification, stated as
joint injectivity to stay constructive. -/
theorem hull_separated_by_stages {t t' : S.Thread}
    (h : ∀ k, S.projAt k t = S.projAt k t') : t = t' :=
  Thread.ext (S := S) (fun k => h k)

end InverseSystem

end Obsmetrologia
