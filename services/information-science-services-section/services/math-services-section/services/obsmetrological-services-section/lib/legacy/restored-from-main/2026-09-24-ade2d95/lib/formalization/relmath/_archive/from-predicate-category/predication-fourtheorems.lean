import PredicationCategories.Homebrew.Algebra.FOUR
import PredicationCategories.Homebrew.Algebra.Bilattice

/-!
# Theorems on the four-element bilattice

A handful of FOUR-specific algebraic identities. All are provable by direct
case enumeration on the elements of `Two` (4 cases per FOUR variable, so
≤ 16 cases per identity).

- **Nelson identity** (`theorems/nelson-identity.md`)
- **Residuation properties** of `⊙` and `⇒` (`theorems/four-bilattice-residuation-properties.md`)

Per the corpus, these identities hold on FOUR but typically *fail* on
non-idempotent residuated lattices `L⋈`. They are FOUR-specific facts,
not generic bilattice identities.
-/

open scoped TwistProduct PreBilattice Bilattice

namespace FOUR

/-! ## Nelson identity -/

/-- **Nelson identity on FOUR.**
$$(x \Rightarrow (x \Rightarrow y)) \wedge_k (\sim y \Rightarrow (\sim y \Rightarrow \sim x)) = x \Rightarrow y.$$

A FOUR-specific conservation law: implication is invariant under the joint
action of "apply twice" and "negate and swap arguments". The corpus proves
this fails on non-idempotent `L⋈` (e.g., Łukasiewicz MV-algebras). -/
theorem nelson (x y : FOUR) :
    (x ⇒ (x ⇒ y)) ⊓ₖ (~y ⇒ (~y ⇒ ~x)) = x ⇒ y := by
  obtain ⟨a, b⟩ := x
  obtain ⟨c, d⟩ := y
  cases a <;> cases b <;> cases c <;> cases d <;> rfl

/-! ## Residuation properties of `⊙` and `⇒` on FOUR -/

/-- `⊤` is the `⊙`-identity on FOUR. -/
theorem top_fusion_id (a : FOUR) : (⊤ : FOUR) ⊙ a = a := by
  obtain ⟨x, y⟩ := a
  cases x <;> cases y <;> rfl

/-- `f` is `⊙`-absorbing on FOUR. -/
theorem f_fusion_absorb (a : FOUR) : FOUR.f ⊙ a = FOUR.f := by
  obtain ⟨x, y⟩ := a
  cases x <;> cases y <;> rfl

/-- `t ⊙ t = t`: `t` is `⊙`-idempotent. -/
theorem t_fusion_idem : FOUR.t ⊙ FOUR.t = FOUR.t := rfl

/-- `f ⊙ f = f`: `f` is `⊙`-idempotent. -/
theorem f_fusion_idem : FOUR.f ⊙ FOUR.f = FOUR.f := rfl

/-- `⊤ ⊙ ⊤ = ⊤`: `⊤` is `⊙`-idempotent. -/
theorem top_fusion_idem : (⊤ : FOUR) ⊙ (⊤ : FOUR) = (⊤ : FOUR) := rfl

/-- **`⊥` is *not* `⊙`-idempotent on FOUR**: `⊥ ⊙ ⊥ = f`. -/
theorem bot_fusion_eq_f : (⊥ : FOUR) ⊙ (⊥ : FOUR) = FOUR.f := rfl

/-- Self-implication: `⊥ ⇒ ⊥ = t`. -/
theorem bot_self_imp : (⊥ : FOUR) ⇒ (⊥ : FOUR) = FOUR.t := rfl

/-- Self-implication: `t ⇒ t = t`. -/
theorem t_self_imp : FOUR.t ⇒ FOUR.t = FOUR.t := rfl

/-- Self-implication: `f ⇒ f = t`. -/
theorem f_self_imp : FOUR.f ⇒ FOUR.f = FOUR.t := rfl

/-- Self-implication: `⊤ ⇒ ⊤ = ⊤` — `⊤` is its own implication-fixed-point. -/
theorem top_self_imp : (⊤ : FOUR) ⇒ (⊤ : FOUR) = (⊤ : FOUR) := rfl

/-! ## Contrapositive failure (`theorems/contrapositive-failure.md`)

Per the corpus: neither `⊙` nor `⇒` commutes with `~` in general. The
specific counterexamples below — `(t, f)` for `⊙` and `(⊥, t)` for `⇒` —
are taken straight from the corpus proof. The structural reason these
fail (and that the Nelson identity above succeeds) is the same: twist-
product residuation interacts non-trivially with negation. -/

/-- **`⊙` does not commute with `~`** at `(t, f)`:
`~(t ⊙ f) = t` but `~t ⊙ ~f = f`. -/
theorem fusion_not_commute_negation :
    ~ (FOUR.t ⊙ FOUR.f) ≠ ~ FOUR.t ⊙ ~ FOUR.f := by decide

/-- **`⇒` does not commute with `~`** at `(⊥, t)`:
`~(⊥ ⇒ t) = f` but `~⊥ ⇒ ~t = ⊥`. -/
theorem twResiduum_not_commute_negation :
    ~ ((⊥ : FOUR) ⇒ FOUR.t) ≠ ~ (⊥ : FOUR) ⇒ ~ FOUR.t := by decide

/-- **Existential form:** there exist `a, b ∈ FOUR` for which `⊙` fails to
commute with `~`. -/
theorem exists_fusion_not_commute_negation :
    ∃ a b : FOUR, ~ (a ⊙ b) ≠ ~ a ⊙ ~ b :=
  ⟨FOUR.t, FOUR.f, fusion_not_commute_negation⟩

/-- **Existential form:** there exist `a, b ∈ FOUR` for which `⇒` fails to
commute with `~`. -/
theorem exists_twResiduum_not_commute_negation :
    ∃ a b : FOUR, ~ (a ⇒ b) ≠ ~ a ⇒ ~ b :=
  ⟨(⊥ : FOUR), FOUR.t, twResiduum_not_commute_negation⟩

/-! ## Left-multiplication and left-residuation orbit convergence

Per `theorems/four-bilattice-residuation-convergence.md`: the orbits
`(L_aⁿ(x))` and `(R_aⁿ(x))` defined by `L_a(x) := a ⊙ x` and
`R_a(x) := a ⇒ x` both stabilize at step 2 on FOUR — for any `(a, x)`,
`L_a²(x) = L_a³(x)` and `R_a²(x) = R_a³(x)`. This is a strengthening of
the abstract Knaster–Tarski bound for the specific case of FOUR. -/

/-- The left-multiplication orbit `(a ⊙ ·)ⁿ(x)` on FOUR stabilizes at step 2:
applying `a ⊙ ·` a third time changes nothing past the second. -/
theorem fusion_orbit_step2 (a x : FOUR) :
    a ⊙ (a ⊙ (a ⊙ x)) = a ⊙ (a ⊙ x) := by
  obtain ⟨p, q⟩ := a
  obtain ⟨r, s⟩ := x
  cases p <;> cases q <;> cases r <;> cases s <;> rfl

/-- The left-residuation orbit `(a ⇒ ·)ⁿ(x)` on FOUR stabilizes at step 2. -/
theorem twResiduum_orbit_step2 (a x : FOUR) :
    a ⇒ (a ⇒ (a ⇒ x)) = a ⇒ (a ⇒ x) := by
  obtain ⟨p, q⟩ := a
  obtain ⟨r, s⟩ := x
  cases p <;> cases q <;> cases r <;> cases s <;> rfl

end FOUR
