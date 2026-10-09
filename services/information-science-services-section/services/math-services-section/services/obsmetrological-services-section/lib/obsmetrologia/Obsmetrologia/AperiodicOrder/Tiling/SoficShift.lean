import Obsmetrologia.Calculus.Order.GraphColoring

/-!
# Sofic shifts: factors of shifts of finite type

A **shift of finite type (SFT)** is given by finitely many local constraints. The 1-step case is a
transition predicate `step : A → A → Bool` — and that is exactly a `Graph A`: the SFT's admissible
words are the **directed walks** of the transition graph (`Path`). A **sofic shift** is a 1-block
factor (a letter map `π : A → B`) image of an SFT (`SoficImage`); equivalently, the alphabet projection
of a finite-type system. This is the symbolic-dynamics half of the coloring memo (§4,
Goodman-Strauss / Vereshchagin: *every finite-local-complexity substitution subshift is sofic — the
forgetful image of a decorated finite-type tiling*).

The structural payload mirrors `GraphColoring` exactly, because both are **factor-map** statements:
* `SoficImage.factor` — sofic shifts are closed under 1-block factors (factor maps compose), the same
  functoriality as `ProperColoring.comp` (colourings pull back along factor maps). Coloring and sofic
  covers are one idea — *factor maps to finite objects* — seen from two sides.
* `sft_is_sofic` — every SFT is sofic (factor = identity), so SFT ⊆ sofic.

The canonical instance is the **golden-mean shift**: the alphabet `{a, b}` with `bb` forbidden — the
1-block follower SFT of the Fibonacci substitution, i.e. the subshift of the golden (`n = 1`) metallic
mean. `golden_forbids_bb` is its single defining local rule.

## Main results
* `SoficImage.factor` — sofic is closed under 1-block factors.
* `sft_is_sofic` — every admissible SFT word is sofic.
* `golden_forbids_bb` — the golden-mean shift forbids `bb` (its one finite-type constraint).

## References
Corpus aperiodic-settling line; the coloring-aperiodic-tiles memo §4 (sofic substitution tilings).
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling

open Obsmetrologia.Discrete (Graph)

/-- An **admissible word** of the SFT `step` — a *directed walk* of the transition graph: each letter
may be followed by the next (`step a b = true`). The finite-type constraint is purely local (adjacent
pairs), so an SFT is exactly a `Graph A` read as transitions. -/
def Path {A : Type} (step : Graph A) : List A → Prop
  | [] => True
  | [_] => True
  | a :: b :: r => step a b = true ∧ Path step (b :: r)

/-- The **sofic shift** of `(step, π)`: the 1-block factor image of the SFT — the `B`-words obtained by
relabelling an admissible `A`-word letter-by-letter through `π`. "Sofic = alphabet-projection of a
finite-type system." -/
def SoficImage {A B : Type} (step : Graph A) (π : A → B) (w : List B) : Prop :=
  ∃ p, Path step p ∧ p.map π = w

/-- **Every SFT is sofic** (the factor is the identity relabelling): an admissible word is its own
1-block image. So SFT ⊆ sofic. -/
theorem sft_is_sofic {A : Type} (step : Graph A) (p : List A) (hp : Path step p) :
    SoficImage step (fun a => a) p :=
  ⟨p, hp, List.map_id p⟩

/-- The **forgetful decoration factor** `A × D → A`: drop the decoration coordinate. The canonical
1-block factor of a *decorated* cover, where the extra coordinate `D` carries the supertile/hierarchy
label that forces the constraint. This is the non-trivial factor (vs. the identity of
`sft_is_sofic`) that the Goodman-Strauss form of soficity uses. -/
def forgetDecoration {A D : Type} : A × D → A := Prod.fst

/-- **Forgetting the decoration of a decorated SFT yields a sofic shift.** The base-alphabet projection
of any decorated finite-type system is sofic. This is the *easy* direction of "sofic = forget
decoration": the forgetful image is always sofic. The hard direction — constructing a decoration whose
forgetful image is *exactly* a given substitution subshift (the recoverability / recognizability of the
supertile hierarchy) — is the frontier; the forgetful map is not what is hard. -/
theorem sofic_of_decorated {A D : Type} (dstep : Graph (A × D)) (p : List (A × D)) (hp : Path dstep p) :
    SoficImage dstep forgetDecoration (p.map forgetDecoration) :=
  ⟨p, hp, rfl⟩

/-- **Sofic shifts are closed under 1-block factors.** Relabelling a sofic word by `ρ` keeps it sofic
(via the composed factor `ρ ∘ π`). This is the symbolic twin of `ProperColoring.comp`: both say a
factor of a factor is a factor — the functoriality that makes "coloring = factor map to a finite shift"
one principle. -/
theorem SoficImage.factor {A B C : Type} (step : Graph A) (π : A → B) (ρ : B → C)
    (w : List B) (h : SoficImage step π w) :
    SoficImage step (fun a => ρ (π a)) (w.map ρ) := by
  obtain ⟨p, hp, hpw⟩ := h
  refine ⟨p, hp, ?_⟩
  rw [← hpw]
  exact List.map_map.symm

/-- The **golden-mean transition rule** on the alphabet `Bool` (`false = a`, `true = b`): every pair is
allowed except `b` after `b`. The 1-block follower SFT of the Fibonacci substitution. -/
def goldenStep : Graph Bool := fun a b => !(a && b)

/-- **The golden-mean shift forbids `bb`.** No admissible word contains two consecutive `b`s — the
single local constraint that defines the golden (`n = 1`) metallic-mean subshift as an SFT. -/
theorem golden_forbids_bb (r : List Bool) : ¬ Path goldenStep (true :: true :: r) := by
  rintro ⟨h1, -⟩
  exact absurd h1 (by decide)

/-! ## Substitutions land in their follower SFT (the sofic cover, general form) -/

/-- **Compositional admissibility.** A concatenation `u ++ v` is admissible when each part is and the
boundary letter-pair (last of `u`, first of `v`) is an allowed transition. The engine of the sofic
cover: a substitution image is a concatenation of block-images, admissible block-by-block plus
boundaries. -/
theorem path_append_of {A : Type} (step : Graph A) (v : List A) (hv : Path step v) :
    ∀ u, Path step u → (∀ x y, u.getLast? = some x → v.head? = some y → step x y = true) →
      Path step (u ++ v)
  | [], _, _ => hv
  | [a], _, hb => by
      cases v with
      | nil => exact trivial
      | cons b r => exact ⟨hb a b rfl rfl, hv⟩
  | a :: a' :: u'', hu, hb => by
      obtain ⟨haa', hrest⟩ := hu
      refine ⟨haa', ?_⟩
      exact path_append_of step v hv (a' :: u'') hrest
        (fun x y hx hy => hb x y (by rw [List.getLast?_cons_cons]; exact hx) hy)

/-- **Word substitution**: apply `σ` letterwise and concatenate.
`substitute σ (a :: w) = σ a ++ substitute σ w`. -/
def substitute {A : Type} (σ : A → List A) (w : List A) : List A := (w.map σ).flatten

@[simp] theorem substitute_nil {A : Type} (σ : A → List A) : substitute σ [] = [] := rfl

@[simp] theorem substitute_cons {A : Type} (σ : A → List A) (a : A) (w : List A) :
    substitute σ (a :: w) = σ a ++ substitute σ w := by
  simp [substitute]

/-- The **Fibonacci substitution** `a ↦ ab, b ↦ a` on `Bool` (`false = a`, `true = b`) — the `n = 1`
metallic substitution. -/
def fibSub : Bool → List Bool
  | false => [false, true]
  | true => [false]

/-- Every Fibonacci-substituted word is empty or starts with `a` (`false`): both images start with
`false`. The boundary fact that keeps concatenated images golden-admissible. -/
theorem fib_head : ∀ w, substitute fibSub w = [] ∨ ∃ r, substitute fibSub w = false :: r
  | [] => Or.inl rfl
  | (c :: w) => by
      right
      cases c
      · exact ⟨true :: substitute fibSub w, rfl⟩
      · exact ⟨substitute fibSub w, rfl⟩

/-- **The Fibonacci substitution lands in the golden-mean SFT.** For *every* word `w`,
`substitute fibSub w` is golden-admissible (no `bb`) — each image starts with `a`, so the only `b`
(inside `σ a = ab`) is always followed by an `a`. So the Fibonacci substitution subshift is covered by
the golden-mean shift: the canonical case of "a substitution subshift is sofic," with `path_append_of`
as the general engine and `goldenStep` the follower SFT. -/
theorem fib_substitute_golden : ∀ w, Path goldenStep (substitute fibSub w)
  | [] => trivial
  | (c :: w) => by
      have ih := fib_substitute_golden w
      rw [substitute_cons]
      cases c
      · rcases fib_head w with h | ⟨r, h⟩
        · rw [h]; exact ⟨by decide, trivial⟩
        · rw [h] at ih ⊢; exact ⟨by decide, by decide, ih⟩
      · rcases fib_head w with h | ⟨r, h⟩
        · rw [h]; exact trivial
        · rw [h] at ih ⊢; exact ⟨by decide, ih⟩

/-- The head of `substitute σ (b :: w)` is the head of `σ b`, when `σ b` is nonempty. -/
theorem head?_substitute_cons {A : Type} (σ : A → List A) (b : A) (w : List A) (hb : σ b ≠ []) :
    (substitute σ (b :: w)).head? = (σ b).head? := by
  rw [substitute_cons]
  obtain ⟨c, rest, hσb⟩ := List.exists_cons_of_ne_nil hb
  rw [hσb]; rfl

/-- **A follower-compatible substitution lands in the SFT (general form).** If every image `σ a` is a
nonempty admissible word, and across every allowed transition `a → b` the image boundary (last of
`σ a`, first of `σ b`) is itself allowed, then `substitute σ` carries admissible words to admissible
words. Hence the substitution subshift is contained in the SFT `step` — the **follower-set** form of
"a substitution subshift is sofic": weaker than the decorated Goodman-Strauss cover with its forgetful
factor (here the factor is the identity and the cover is over the same alphabet), but it holds for *any*
substitution and *any* compatible finite-type `step`, the minimal one being the follower SFT. -/
theorem substitute_preserves_path {A : Type} (step : Graph A) (σ : A → List A)
    (hne : ∀ a, σ a ≠ []) (himg : ∀ a, Path step (σ a))
    (hbound : ∀ a b, step a b = true → ∀ x y, (σ a).getLast? = some x → (σ b).head? = some y →
        step x y = true) :
    ∀ w, Path step w → Path step (substitute σ w)
  | [], _ => trivial
  | [a], _ => by
      rw [substitute_cons, substitute_nil, List.append_nil]; exact himg a
  | (a :: b :: w'), hw => by
      obtain ⟨hab, hrest⟩ := hw
      rw [substitute_cons]
      have hvpath : Path step (substitute σ (b :: w')) :=
        substitute_preserves_path step σ hne himg hbound (b :: w') hrest
      refine path_append_of step _ hvpath (σ a) (himg a) (fun x y hx hy => ?_)
      rw [head?_substitute_cons σ b w' (hne b)] at hy
      exact hbound a b hab x y hx hy

/-! ## The deep sofic cover: a decorated SFT whose forgetful image *is* the Fibonacci subshift

The previous section gave the easy half (a substitution lands in its follower SFT, identity factor).
The Goodman-Strauss form of soficity is the **hard** half (`sofic_of_decorated` left it open): a
*decorated* finite-type system over `A × D` whose `forgetDecoration`-image is **exactly** a given
substitution subshift. The decoration `D` records the supertile role of each letter, and the local SFT
rules on `A × D` encode the substitution hierarchy; forgetting `D` recovers the substitution words, and
— the recognizability content — every substitution word lifts back to a decorated-admissible word. -/

/-- **Cross-alphabet substitution** `A → List B`, applied letterwise and concatenated — the
decorating map (changes alphabet, unlike the endo `substitute`). -/
def substMap {A B : Type} (σ : A → List B) (w : List A) : List B := (w.map σ).flatten

@[simp] theorem substMap_nil {A B : Type} (σ : A → List B) : substMap σ [] = [] := rfl

@[simp] theorem substMap_cons {A B : Type} (σ : A → List B) (a : A) (w : List A) :
    substMap σ (a :: w) = σ a ++ substMap σ w := by simp [substMap]

theorem head?_substMap_cons {A B : Type} (σ : A → List B) (b : A) (w : List A) (hb : σ b ≠ []) :
    (substMap σ (b :: w)).head? = (σ b).head? := by
  rw [substMap_cons]
  obtain ⟨c, rest, hσb⟩ := List.exists_cons_of_ne_nil hb
  rw [hσb]; rfl

/-- **A cross-alphabet substitution lifts admissible words.** If `σ : A → List B` sends each letter to a
nonempty `stepB`-admissible block, and across every `stepA`-allowed transition the decorated block
boundary is `stepB`-allowed, then `substMap σ` carries `stepA`-admissible words to `stepB`-admissible
words. The cross-alphabet form of `substitute_preserves_path`, the engine of the decorated cover. -/
theorem substMap_preserves_path {A B : Type} (stepA : Graph A) (stepB : Graph B) (σ : A → List B)
    (hne : ∀ a, σ a ≠ []) (himg : ∀ a, Path stepB (σ a))
    (hbound : ∀ a b, stepA a b = true → ∀ x y, (σ a).getLast? = some x → (σ b).head? = some y →
        stepB x y = true) :
    ∀ w, Path stepA w → Path stepB (substMap σ w)
  | [], _ => trivial
  | [a], _ => by rw [substMap_cons, substMap_nil, List.append_nil]; exact himg a
  | (a :: b :: w'), hw => by
      obtain ⟨hab, hrest⟩ := hw
      rw [substMap_cons]
      have hvpath : Path stepB (substMap σ (b :: w')) :=
        substMap_preserves_path stepA stepB σ hne himg hbound (b :: w') hrest
      refine path_append_of stepB _ hvpath (σ a) (himg a) (fun x y hx hy => ?_)
      rw [head?_substMap_cons σ b w' (hne b)] at hy
      exact hbound a b hab x y hx hy

/-- The **decorated transition SFT** on `Bool × Bool`. The three live decorated letters are `(a,0)` =
`(false,false)` (start of a block `σ(a)=ab`), `(b,0)` = `(true,false)` (its end), `(a,1)` =
`(false,true)` (a lone `σ(b)=a`). Rules: `(a,0)→(b,0)` (the `ab` block is contiguous);
`(b,0)→(a,0)|(a,1)` and `(a,1)→(a,0)` (block boundaries — `(a,1)→(a,1)` is forbidden, encoding the
preimage's no-`bb` rule). -/
def decoStep : Graph (Bool × Bool) := fun p q =>
  (p == (false, false) && q == (true, false)) ||
  (p == (true, false) && (q == (false, false) || q == (false, true))) ||
  (p == (false, true) && q == (false, false))

/-- The **decorated Fibonacci substitution** `a ↦ (a,0)(b,0)`, `b ↦ (a,1)`. Composing with
`forgetDecoration` gives back `fibSub`. -/
def decoSub : Bool → List (Bool × Bool)
  | false => [(false, false), (true, false)]
  | true => [(false, true)]

/-- Each decorated image is nonempty. -/
theorem decoSub_ne : ∀ a, decoSub a ≠ [] := by decide

/-- Each decorated image is `decoStep`-admissible. -/
theorem decoSub_img : ∀ a, Path decoStep (decoSub a) := by
  intro a; cases a
  · exact ⟨by decide, trivial⟩
  · exact trivial

/-- Across every golden-allowed preimage transition, the decorated block boundary is `decoStep`-allowed
(and the forbidden `b→b` is vacuous). -/
theorem decoSub_bound : ∀ a b, goldenStep a b = true → ∀ x y,
    (decoSub a).getLast? = some x → (decoSub b).head? = some y → decoStep x y = true := by
  intro a b hab x y hx hy
  cases a <;> cases b <;> simp_all [decoSub, decoStep, goldenStep]

/-- **Forgetting the decoration of `decoSub` recovers `fibSub`**: `decoForget ∘ decoSub = fibSub`,
lifted to words. -/
theorem decoForget_substitute : ∀ w,
    (substMap decoSub w).map forgetDecoration = substitute fibSub w
  | [] => rfl
  | (c :: w) => by
      rw [substMap_cons, substitute_cons, List.map_append, decoForget_substitute w]
      congr 1
      cases c <;> rfl

/-- **The deep sofic cover (recognizability), golden case.** Every Fibonacci-substituted word
`substitute fibSub w` over a golden-admissible preimage `w` is the `forgetDecoration`-image of a `decoStep`-admissible decorated word — namely `substitute decoSub w`. So the Fibonacci substitution
subshift is *exactly* the forgetful image of the decorated finite-type system `decoStep`: the
Goodman-Strauss form of soficity, the hard direction `sofic_of_decorated` left open. The decoration is
recoverable (recognizable) because `substitute_preserves_path` lifts the preimage's admissibility
through the decorated block boundaries. -/
theorem fib_deep_sofic (w : List Bool) (hw : Path goldenStep w) :
    SoficImage decoStep forgetDecoration (substitute fibSub w) :=
  ⟨substMap decoSub w,
    substMap_preserves_path goldenStep decoStep decoSub decoSub_ne decoSub_img decoSub_bound w hw,
    decoForget_substitute w⟩

end AperiodicOrder.Tiling
end Obsmetrologia
