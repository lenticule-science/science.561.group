/-
# LinearAlgebra — the linear-algebra shadow over an abstract field

Received Western **linear algebra** — vector space, basis, dimension, linear map,
kernel/image, rank–nullity, eigenvalue — is, in the corpus, the degenerate shadow that
the algebra tower (`AlgebraHierarchy.lean`) throws once a `Field` of scalars acts on an
abelian group of vectors. There is no single `linear-algebra` corpus node any more than
there is one for the algebra tower; the in-chain anchors read for this module are the
nodes of the `…/field/scripts/scaling/content/vector-space` subtree of
`content/_archive/algebra/…`:

* `vector-space/vector-space.md` — *"`V` must form an abelian group under addition;
  scalar multiplication `F × V → V` must distribute over both vector addition and field
  addition, must be compatible with field multiplication (`a(b·v)=(ab)·v`), and must
  satisfy `1·v = v`. These eight axioms are all it takes."* — our `VectorSpace` bundle.
* `vector-space/scripts/spanning/content/basis/basis.md` — *spanning + linear
  independence; the representation is unique; the standard basis of `Rⁿ` is the unit
  vectors `eᵢ`.* — our `independent`, `spans`, `IsBasis`, `stdBasis`.
* `…/basis/scripts/counting/content/dimension/dimension.md` — *"Dimension is well-defined
  because all bases of a given vector space have the same cardinality. … In the
  finite-dimensional case, this is proved by the Steinitz exchange lemma."* — our
  `dimension_well_defined`, via the `independent ≤ spanning` size bound
  (`steinitz_bound`).
* `…/vector-space/scripts/mapping/content/linear-map/linear-map.md` — *linear maps
  preserve `+` and `·`; kernel `ker T`, image `im T`; "they are linked by the
  rank–nullity theorem `dim V = dim ker T + dim im T`."* — our `LinearMap`, `Ker`, and
  `rank_nullity`.
* `…/linear-map/scripts/spectralizing/content/eigenvalue/eigenvalue.md` — `T v = λ·v`. —
  our `IsEigenvalue` / `IsEigenvector` over `boolField`.

The abstract scalars are `RelMath.Algebra.Field` (reused verbatim from
`AlgebraHierarchy.lean`); the concrete instance is `F = boolField = 𝔽₂`. Dimensions are
`Nat` (`SetNumberGraphTheory.lean`'s number-theory shadow); coordinate vectors are
`Fin n → F.carrier` (`Fin`, `List`, `Nat` from Lean core only).
-/
import RelMath.AlgebraHierarchy
import RelMath.SetNumberGraphTheory
import RelMath.OrderInfra

namespace RelMath
namespace LinAlg

open RelMath.Algebra

/-! # =====================================================================
    # (A) The VectorSpace bundle (the eight axioms as fields)
    # ===================================================================== -/

/-- A **vector space over a field `F`** (`vector-space.md`): an abelian group of vectors
`(vadd, vzero, vneg)` together with a scalar action `smul : F.carrier → V → V`, carrying
the module axioms as fields — additive associativity/commutativity/identity/inverse, the
two distributivities, compatibility with field multiplication (`(ab)·v = a·(b·v)`), and
`1·v = v`. (`vector-space.md`: "these eight axioms are all it takes".) -/
structure VectorSpace (F : Field) where
  carrier : Type
  vadd : carrier → carrier → carrier
  vzero : carrier
  vneg : carrier → carrier
  smul : F.carrier → carrier → carrier
  vadd_assoc : ∀ a b c, vadd (vadd a b) c = vadd a (vadd b c)
  vadd_comm : ∀ a b, vadd a b = vadd b a
  vadd_zero : ∀ a, vadd a vzero = a
  vadd_left_neg : ∀ a, vadd (vneg a) a = vzero
  smul_add : ∀ (a : F.carrier) (u v), smul a (vadd u v) = vadd (smul a u) (smul a v)
  add_smul : ∀ (a b : F.carrier) (v), smul (F.add a b) v = vadd (smul a v) (smul b v)
  smul_smul : ∀ (a b : F.carrier) (v), smul (F.mul a b) v = smul a (smul b v)
  one_smul : ∀ v, smul F.one v = v

namespace VectorSpace
variable {F : Field} (V : VectorSpace F)

/-- The additive identity is a left identity for vector addition (from commutativity). -/
theorem vzero_vadd (a : V.carrier) : V.vadd V.vzero a = a := by
  rw [V.vadd_comm]; exact V.vadd_zero a

/-- `0 · v = 0`: the field zero scales every vector to the zero vector. Derived from the
distributive law `add_smul` and additive cancellation. -/
theorem zero_smul (v : V.carrier) : V.smul F.zero v = V.vzero := by
  have h : V.vadd (V.smul F.zero v) (V.smul F.zero v) = V.smul F.zero v := by
    rw [← V.add_smul]; rw [F.add_zero]
  -- from x + x = x conclude x = 0
  have h2 : V.vadd (V.vneg (V.smul F.zero v)) (V.vadd (V.smul F.zero v) (V.smul F.zero v))
      = V.vadd (V.vneg (V.smul F.zero v)) (V.smul F.zero v) := by rw [h]
  rw [← V.vadd_assoc, V.vadd_left_neg, V.vzero_vadd] at h2
  -- h2 : smul 0 v = vzero
  exact h2

end VectorSpace

/-! # =====================================================================
    # (B) The standard coordinate space  Fn F n = Fin n → F.carrier
    # ===================================================================== -/

/-- The **standard coordinate space** `Fⁿ`: functions `Fin n → F.carrier`, i.e. length-`n`
coordinate vectors (`vector-space.md`: "`ℝⁿ`, ordered `n`-tuples, with componentwise
addition and scaling"). -/
abbrev Vec (F : Field) (n : Nat) : Type := Fin n → F.carrier

namespace Vec
variable {F : Field} {n : Nat}

/-- Pointwise vector addition. -/
def add (u v : Vec F n) : Vec F n := fun i => F.add (u i) (v i)
/-- The zero coordinate vector. -/
def zero (F : Field) (n : Nat) : Vec F n := fun _ => F.zero
/-- Pointwise additive inverse. -/
def neg (u : Vec F n) : Vec F n := fun i => F.neg (u i)
/-- Componentwise scalar multiplication. -/
def smul (a : F.carrier) (v : Vec F n) : Vec F n := fun i => F.mul a (v i)

/-- Field additive left-inverse, exported pointwise. -/
theorem field_add_left_neg (a : F.carrier) : F.add (F.neg a) a = F.zero := F.add_left_neg a

end Vec

/-- **`Fn F n : VectorSpace F`** — the standard coordinate space as a genuine vector
space, every one of the eight axioms PROVEN pointwise from the field axioms via `funext`
(`vector-space.md`). This is the concrete instance the dimension and rank–nullity
headlines run on. -/
def Fn (F : Field) (n : Nat) : VectorSpace F where
  carrier := Vec F n
  vadd := Vec.add
  vzero := Vec.zero F n
  vneg := Vec.neg
  smul := Vec.smul
  vadd_assoc a b c := by funext i; exact F.add_assoc (a i) (b i) (c i)
  vadd_comm a b := by funext i; exact F.add_comm (a i) (b i)
  vadd_zero a := by funext i; exact F.add_zero (a i)
  vadd_left_neg a := by funext i; exact F.add_left_neg (a i)
  smul_add a u v := by funext i; exact F.left_distrib a (u i) (v i)
  add_smul a b v := by funext i; exact F.right_distrib a b (v i)
  smul_smul a b v := by funext i; exact F.mul_assoc a b (v i)
  one_smul v := by funext i; exact F.one_mul (v i)

/-! # =====================================================================
    # (C) Linear maps, kernel, image  (linear-map.md)
    # ===================================================================== -/

/-- A **linear map** `T : V →ₗ W` over a fixed field `F` (`linear-map.md`): a function
on carriers preserving vector addition (`map_add`) and scalar multiplication
(`map_smul`). The two laws together force preservation of every linear combination. -/
structure LinearMap {F : Field} (V W : VectorSpace F) where
  toFun : V.carrier → W.carrier
  map_add : ∀ u v, toFun (V.vadd u v) = W.vadd (toFun u) (toFun v)
  map_smul : ∀ (a : F.carrier) v, toFun (V.smul a v) = W.smul a (toFun v)

namespace LinearMap
variable {F : Field} {V W : VectorSpace F}

/-- A linear map sends the zero vector to the zero vector (`T 0 = 0`). -/
theorem map_zero (T : LinearMap V W) : T.toFun V.vzero = W.vzero := by
  have h : T.toFun V.vzero = T.toFun (V.smul F.zero V.vzero) := by
    rw [V.zero_smul]
  rw [h, T.map_smul, W.zero_smul]

/-- The **kernel** `ker T = { v : T v = 0 }` as a predicate (`linear-map.md`). -/
def Ker (T : LinearMap V W) (v : V.carrier) : Prop := T.toFun v = W.vzero

/-- The kernel contains the zero vector. -/
theorem ker_zero (T : LinearMap V W) : T.Ker V.vzero := T.map_zero

/-- The kernel is closed under addition (it is a subspace, part 1). -/
theorem ker_add (T : LinearMap V W) {u v : V.carrier} (hu : T.Ker u) (hv : T.Ker v) :
    T.Ker (V.vadd u v) := by
  show T.toFun (V.vadd u v) = W.vzero
  rw [T.map_add, hu, hv, W.vadd_zero]

/-- The kernel is closed under scalar multiplication (subspace, part 2). -/
theorem ker_smul (T : LinearMap V W) (a : F.carrier) {v : V.carrier} (hv : T.Ker v) :
    T.Ker (V.smul a v) := by
  show T.toFun (V.smul a v) = W.vzero
  rw [T.map_smul, hv]
  show W.smul a W.vzero = W.vzero
  -- a · 0 = 0
  have h : W.smul a W.vzero = W.vadd (W.smul a W.vzero) (W.smul a W.vzero) → True := fun _ => trivial
  -- prove a·0 = 0 from a·(0+0)=a·0
  have key : W.vadd (W.smul a W.vzero) (W.smul a W.vzero) = W.smul a W.vzero := by
    rw [← W.smul_add, W.vadd_zero]
  have h2 : W.vadd (W.vneg (W.smul a W.vzero))
        (W.vadd (W.smul a W.vzero) (W.smul a W.vzero))
      = W.vadd (W.vneg (W.smul a W.vzero)) (W.smul a W.vzero) := by rw [key]
  rw [← W.vadd_assoc, W.vadd_left_neg, W.vzero_vadd] at h2
  clear h
  exact h2

/-- The **image** predicate `im T = { w : ∃ v, T v = w }` (`linear-map.md`). -/
def Im (T : LinearMap V W) (w : W.carrier) : Prop := ∃ v, T.toFun v = w

/-- The zero vector lies in the image. -/
theorem im_zero (T : LinearMap V W) : T.Im W.vzero := ⟨V.vzero, T.map_zero⟩

/-- The image is closed under addition. -/
theorem im_add (T : LinearMap V W) {w₁ w₂ : W.carrier}
    (h₁ : T.Im w₁) (h₂ : T.Im w₂) : T.Im (W.vadd w₁ w₂) := by
  obtain ⟨v₁, hv₁⟩ := h₁; obtain ⟨v₂, hv₂⟩ := h₂
  exact ⟨V.vadd v₁ v₂, by rw [T.map_add, hv₁, hv₂]⟩

end LinearMap

/-! # =====================================================================
    # (D) Linear combinations over lists  (the engine for basis/dimension)
    # ===================================================================== -/

namespace Vec
variable {F : Field} {n : Nat}

/-- A **linear combination** `Σ cᵢ · sᵢ` of a list of vectors `S` with a coefficient
list `cs` (zipped pointwise, extra entries ignored): the engine behind span and
independence. We fold the scaled vectors with pointwise add starting from `0`. -/
def lcomb (cs : List F.carrier) (S : List (Vec F n)) : Vec F n :=
  match cs, S with
  | c :: cs', s :: S' => add (smul c s) (lcomb cs' S')
  | _, _ => zero F n

/-- `lcomb` on the empty vector list is the zero vector. -/
@[simp] theorem lcomb_nil_right (cs : List F.carrier) : lcomb cs ([] : List (Vec F n)) = zero F n := by
  cases cs <;> rfl

@[simp] theorem lcomb_nil_left (S : List (Vec F n)) : lcomb ([] : List F.carrier) S = zero F n := by
  cases S <;> rfl

theorem lcomb_cons (c : F.carrier) (cs : List F.carrier) (s : Vec F n) (S : List (Vec F n)) :
    lcomb (c :: cs) (s :: S) = add (smul c s) (lcomb cs S) := rfl

end Vec

/-! # =====================================================================
    # (E) Span, independence, basis  (basis.md)
    # ===================================================================== -/

/-- `S` **spans** `Fⁿ` when every vector is a linear combination of `S` (`basis.md`:
"every vector can be expressed as a linear combination"). -/
def spans {F : Field} {n : Nat} (S : List (Vec F n)) : Prop :=
  ∀ v : Vec F n, ∃ cs : List F.carrier, Vec.lcomb cs S = v

/-- A list `S` is **linearly independent** when the only coefficient list (of matching
length) producing the zero vector is the all-zero list — equivalently every coefficient
in such a list is zero (`basis.md`: "the only way to produce `0` is all coefficients
zero"). -/
def independent {F : Field} {n : Nat} (S : List (Vec F n)) : Prop :=
  ∀ cs : List F.carrier, cs.length = S.length → Vec.lcomb cs S = Vec.zero F n →
    ∀ c ∈ cs, c = F.zero

/-- A **basis** of `Fⁿ`: a list that both spans and is linearly independent
(`basis.md`). -/
structure IsBasis {F : Field} {n : Nat} (S : List (Vec F n)) : Prop where
  span : spans S
  indep : independent S

/-! ## The standard basis (the unit vectors `eᵢ`) -/

namespace Vec
variable {F : Field}

/-- The `i`-th **standard unit vector** `eᵢ` of `Fⁿ`: `1` in coordinate `i`, `0`
elsewhere (`basis.md`: "the standard basis of `ℝⁿ` is the unit vectors"). -/
def unit (F : Field) {n : Nat} (i : Fin n) : Vec F n :=
  fun j => if i = j then F.one else F.zero

/-- The standard basis of `Fⁿ` as the list of unit vectors `[e₀, …, e_{n-1}]`, obtained
by mapping `unit` over `List.finRange n`. -/
def stdBasis (F : Field) (n : Nat) : List (Vec F n) :=
  (List.finRange n).map (unit F)

theorem stdBasis_length (F : Field) (n : Nat) : (stdBasis F n).length = n := by
  unfold stdBasis; rw [List.length_map, List.length_finRange]

/-- The combination of unit vectors taken over an explicit index list `is`, with the
coefficient *function* `c`, evaluated at coordinate `j`: it equals `c j` summed over the
occurrences of `j` in `is`. For our use `is` lists each index once, so we get exactly
`c j` when `j ∈ is` and `0` otherwise. We phrase it as the pointwise master identity. -/
def combOver (F : Field) {n : Nat} (c : Fin n → F.carrier) (is : List (Fin n)) : Vec F n :=
  match is with
  | [] => zero F n
  | i :: is' => add (smul (c i) (unit F i)) (combOver F c is')

/-- **Coordinate extraction over an index list.** `(combOver c is) j` adds `c j` once for
each occurrence of `j` in `is` (and `0` for the others). When `is` contains `j` exactly
once we recover `c j`; this is the engine for both spanning and independence. -/
theorem combOver_apply (F : Field) {n : Nat} (c : Fin n → F.carrier)
    (is : List (Fin n)) (j : Fin n) :
    (combOver F c is) j = (is.filter (fun i => decide (i = j))).foldr (fun _ acc => F.add (c j) acc) F.zero := by
  induction is with
  | nil => rfl
  | cons i is' ih =>
    show F.add (F.mul (c i) (unit F i j)) (combOver F c is' j) = _
    rw [ih]
    by_cases h : i = j
    · subst h
      simp only [List.filter, if_pos rfl, List.foldr]
      show F.add (F.mul (c i) (unit F i i)) _ = F.add (c i) _
      have hu : unit F i i = F.one := by simp [unit]
      rw [hu, F.mul_one]
    · have hfilt : (i :: is').filter (fun x => decide (x = j))
          = is'.filter (fun x => decide (x = j)) := by
        simp only [List.filter]
        rw [decide_eq_false (by exact h)]
      rw [hfilt]
      show F.add (F.mul (c i) (unit F i j)) _ = _
      have hu : unit F i j = F.zero := by simp [unit, h]
      rw [hu, F.mul_zero, F.zero_add]

/-- `lcomb` of the coefficient list `is.map c` against the unit-vector list `is.map unit`
is exactly `combOver c is`. Bridges the list-based `lcomb` (used in `spans`/`independent`)
to the coordinate-friendly `combOver`. -/
theorem lcomb_map_eq_combOver (F : Field) {n : Nat} (c : Fin n → F.carrier)
    (is : List (Fin n)) :
    lcomb (is.map c) (is.map (unit F)) = combOver F c is := by
  induction is with
  | nil => rfl
  | cons i is' ih =>
    show add (smul (c i) (unit F i)) (lcomb (is'.map c) (is'.map (unit F))) = _
    rw [ih]; rfl

/-- `finRange n` is duplicate-free (core lacks the lemma here, so we derive it by the
`finRange (n+1) = 0 :: map Fin.succ (finRange n)` recurrence: `0` is absent from the
`Fin.succ`-image, and `Fin.succ` is injective). -/
theorem nodup_finRange (n : Nat) : (List.finRange n).Nodup := by
  induction n with
  | zero => simp
  | succ m ih =>
    rw [List.finRange_succ, List.nodup_cons]
    refine ⟨?_, ?_⟩
    · intro h
      obtain ⟨x, _, hx⟩ := List.mem_map.mp h
      exact absurd hx (Fin.succ_ne_zero x)
    · exact List.Pairwise.map _ (fun a b hab h => hab (Fin.succ_inj.mp h)) ih

/-- Choice-free: a `List.filter` whose predicate is `false` on every element is `[]`
(induction; the `Classical`-free replacement for `List.filter_eq_nil_iff`). -/
theorem filter_eq_nil_of_forall {α : Type} (p : α → Bool) :
    ∀ (l : List α), (∀ x ∈ l, p x = false) → l.filter p = [] := by
  intro l
  induction l with
  | nil => intro _; rfl
  | cons a l' ih =>
    intro h
    rw [List.filter_cons, h a (List.mem_cons_self ..)]
    exact ih (fun x hx => h x (List.mem_cons_of_mem a hx))

/-- For a duplicate-free index list `l` containing `j`, filtering by `(· = j)` leaves the
single-element list `[j]`. The nodup hypothesis kills the cons-case duplicate. -/
theorem filter_eq_self_singleton {n : Nat} (j : Fin n) (l : List (Fin n))
    (hnd : l.Nodup) (hmem : j ∈ l) :
    l.filter (fun i => decide (i = j)) = [j] := by
  induction l with
  | nil => exact absurd hmem (List.not_mem_nil)
  | cons a l' ih =>
    rw [List.nodup_cons] at hnd
    obtain ⟨hanl, hndl⟩ := hnd
    by_cases h : a = j
    · subst h
      -- j ∉ l', so filter of l' is empty
      have hfl : l'.filter (fun i => decide (i = a)) = [] := by
        apply filter_eq_nil_of_forall
        intro x hx
        apply decide_eq_false
        intro hxa; subst hxa; exact hanl hx
      rw [List.filter_cons]; rw [hfl]; simp
    · have hjl' : j ∈ l' := by
        rcases List.mem_cons.mp hmem with h' | h'
        · exact absurd h'.symm h
        · exact h'
      have hfa : decide (a = j) = false := decide_eq_false (by exact h)
      simp only [List.filter, hfa]
      exact ih hndl hjl'

/-- The filtered-foldr collapses to `c j` because `j` occurs exactly once in `finRange n`
(it is nodup and contains `j`): `combOver c (finRange n) j = c j`. -/
theorem combOver_finRange_apply (F : Field) {n : Nat} (c : Fin n → F.carrier) (j : Fin n) :
    (combOver F c (List.finRange n)) j = c j := by
  rw [combOver_apply]
  rw [filter_eq_self_singleton j (List.finRange n) (nodup_finRange n) (List.mem_finRange j)]
  show F.add (c j) F.zero = c j
  exact F.add_zero (c j)

/-! ## Coordinate extraction for `lcomb` against the standard basis -/

/-- **Spanning coordinate.** Choosing the coefficient list `(finRange n).map v` recovers
`v`: at each `j`, the combination over the standard basis reads off `v j`. -/
theorem lcomb_stdBasis_span (F : Field) {n : Nat} (v : Vec F n) :
    lcomb ((List.finRange n).map v) (stdBasis F n) = v := by
  funext j
  show (lcomb ((List.finRange n).map v) ((List.finRange n).map (unit F))) j = v j
  -- relabel coefficient list as map v; use lcomb_map_eq_combOver
  rw [lcomb_map_eq_combOver, combOver_finRange_apply]

/-- **Any length-`n` coefficient list is its own coordinate map.** A list `cs` of length
`n` equals `(finRange n).map (fun j => cs[j.val])` — position `p` carries `cs[p]` on both
sides. This lets us replace an arbitrary coefficient list by a coefficient *function*. -/
theorem eq_map_finRange_get (F : Field) {n : Nat} (cs : List F.carrier) (hlen : cs.length = n) :
    cs = (List.finRange n).map (fun j : Fin n => cs[j.val]'(by rw [hlen]; exact j.isLt)) := by
  apply List.ext_getElem
  · rw [List.length_map, List.length_finRange, hlen]
  · intro p hp hp2
    simp [List.getElem_map, List.getElem_finRange]

/-- **Independence coordinate.** If `cs` has length `n`, then at each coordinate `j` the
combination over the standard basis reads off `cs[j]`. So a zero combination forces every
coordinate of `cs` to be zero. -/
theorem lcomb_stdBasis_get (F : Field) {n : Nat} (cs : List F.carrier) (hlen : cs.length = n)
    (j : Fin n) :
    (lcomb cs (stdBasis F n)) j = cs[j.val]'(by rw [hlen]; exact j.isLt) := by
  have hcs := eq_map_finRange_get F cs hlen
  have hbridge :
      lcomb ((List.finRange n).map (fun k : Fin n => cs[k.val]'(by rw [hlen]; exact k.isLt)))
        ((List.finRange n).map (unit F))
      = combOver F (fun k : Fin n => cs[k.val]'(by rw [hlen]; exact k.isLt)) (List.finRange n) :=
    lcomb_map_eq_combOver F _ (List.finRange n)
  calc (lcomb cs (stdBasis F n)) j
      = (lcomb ((List.finRange n).map (fun k : Fin n => cs[k.val]'(by rw [hlen]; exact k.isLt)))
            (stdBasis F n)) j := by rw [← hcs]
    _ = (combOver F (fun k : Fin n => cs[k.val]'(by rw [hlen]; exact k.isLt)) (List.finRange n)) j := by
          rw [show stdBasis F n = (List.finRange n).map (unit F) from rfl, hbridge]
    _ = cs[j.val]'(by rw [hlen]; exact j.isLt) := combOver_finRange_apply F _ j

end Vec

/-! # =====================================================================
    # (F) The standard basis is a basis of size `n`
    # ===================================================================== -/

/-- The standard basis **spans** `Fⁿ`: every `v` is `Σ vᵢ eᵢ` (`basis.md`). -/
theorem stdBasis_spans (F : Field) (n : Nat) : spans (Vec.stdBasis F n) := by
  intro v
  exact ⟨(List.finRange n).map v, Vec.lcomb_stdBasis_span F v⟩

/-- The standard basis is **linearly independent**: a zero combination forces every
coefficient to be zero, because the `j`-th coordinate of the combination is exactly the
`j`-th coefficient (`basis.md`). -/
theorem stdBasis_independent (F : Field) (n : Nat) : independent (Vec.stdBasis F n) := by
  intro cs hlen hzero c hc
  -- find the position p of c in cs
  obtain ⟨p, hp, hpc⟩ := List.getElem_of_mem hc
  -- p < cs.length = stdBasis.length = n
  rw [Vec.stdBasis_length] at hlen
  have hpn : p < n := by rw [← hlen]; exact hp
  -- coordinate p of the zero combination is cs[p] = c
  have key := Vec.lcomb_stdBasis_get F cs hlen ⟨p, hpn⟩
  rw [hzero] at key
  -- key : Vec.zero F n ⟨p,hpn⟩ = cs[p]
  have hz : Vec.zero F n ⟨p, hpn⟩ = F.zero := rfl
  rw [hz] at key
  rw [← hpc]
  exact key.symm

/-- **The standard basis is a basis** of `Fⁿ`, of length `n` (`basis.md`, `dimension.md`:
"`ℝⁿ` has dimension `n`"). -/
theorem stdBasis_isBasis (F : Field) (n : Nat) : IsBasis (Vec.stdBasis F n) :=
  ⟨stdBasis_spans F n, stdBasis_independent F n⟩

/-! # =====================================================================
    # (G) The Steinitz bound: an independent set has at most `dim` vectors
    #     (the hard core of dimension invariance, dimension.md)
    # ===================================================================== -/

/-- A list of vectors is **dependent** when some coefficient list of matching length,
*not* all zero, combines them to the zero vector. The exact negation of `independent`,
stated existentially (`basis.md`: dependence = a nontrivial vanishing combination). -/
def dependent {F : Field} {n : Nat} (vs : List (Vec F n)) : Prop :=
  ∃ cs : List F.carrier, cs.length = vs.length ∧ (∃ c ∈ cs, c ≠ F.zero) ∧
    Vec.lcomb cs vs = Vec.zero F n

/-- Dependence refutes independence: a list cannot be both. -/
theorem not_independent_of_dependent {F : Field} {n : Nat} {vs : List (Vec F n)}
    (h : dependent vs) : ¬ independent vs := by
  obtain ⟨cs, hlen, ⟨c, hcmem, hcne⟩, hzero⟩ := h
  intro hindep
  exact hcne (hindep cs hlen hzero c hcmem)

-- ====================  NEW WORK APPENDED BELOW  ====================

/-! # =====================================================================
    # (G) Field arithmetic engine for the Steinitz pivot
    # ===================================================================== -/

namespace Field
variable {F : Field}

/-- **Right additive inverse** of the field: `a + (-a) = 0` (the left inverse
`add_left_neg` plus commutativity). -/
theorem add_right_neg (a : F.carrier) : F.add a (F.neg a) = F.zero := by
  rw [F.add_comm]; exact F.add_left_neg a

/-- **A field has no zero divisors.** If `a ≠ 0` and `b ≠ 0` then `a·b ≠ 0`: multiply a
hypothetical `a·b = 0` by `a⁻¹` to force `b = 0`. (Integral-domain shadow.) -/
theorem mul_ne_zero {a b : F.carrier} (ha : a ≠ F.zero) (hb : b ≠ F.zero) :
    F.mul a b ≠ F.zero := by
  intro hab
  apply hb
  have key : F.mul (F.inv a) (F.mul a b) = b := by
    rw [← F.mul_assoc, F.mul_comm (F.inv a) a, F.mul_inv_cancel a ha, F.one_mul]
  rw [hab, F.mul_zero] at key
  exact key.symm

/-- **Left inverse cancels.** `a⁻¹ · a = 1` for `a ≠ 0` (from the right form plus
commutativity). -/
theorem inv_mul_cancel {a : F.carrier} (ha : a ≠ F.zero) : F.mul (F.inv a) a = F.one := by
  rw [F.mul_comm]; exact F.mul_inv_cancel a ha

/-- `a⁻¹ ≠ 0` when `a ≠ 0`: else `a⁻¹·a = 0 ≠ 1`. -/
theorem inv_ne_zero {a : F.carrier} (ha : a ≠ F.zero) : F.inv a ≠ F.zero := by
  intro h
  have : F.mul (F.inv a) a = F.one := inv_mul_cancel ha
  rw [h, F.zero_mul] at this
  exact F.zero_ne_one this

/-- **From `u + v = 0` conclude `u = -v`.** Additive uniqueness of inverses. -/
theorem eq_neg_of_add_eq_zero {u v : F.carrier} (h : F.add u v = F.zero) : u = F.neg v := by
  calc u = F.add u F.zero := (F.add_zero u).symm
    _ = F.add u (F.add v (F.neg v)) := by rw [add_right_neg]
    _ = F.add (F.add u v) (F.neg v) := (F.add_assoc u v (F.neg v)).symm
    _ = F.add F.zero (F.neg v) := by rw [h]
    _ = F.neg v := F.zero_add (F.neg v)

/-- **Double negation `-(-a) = a`.** From `-a + a = 0` and inverse uniqueness. -/
theorem neg_neg (a : F.carrier) : F.neg (F.neg a) = a :=
  (eq_neg_of_add_eq_zero (add_right_neg a)).symm

/-- **`(-a)·b = -(a·b)`.** From `(-a)·b + a·b = (-a+a)·b = 0`. -/
theorem neg_mul (a b : F.carrier) : F.mul (F.neg a) b = F.neg (F.mul a b) := by
  apply eq_neg_of_add_eq_zero
  rw [← F.right_distrib, F.add_left_neg, F.zero_mul]

/-- **`a⁻¹·a = 1` rearranged: `a·(a⁻¹·c) = c`** for `a ≠ 0`. Used to recover a coordinate
after pivoting. -/
theorem mul_inv_mul {a c : F.carrier} (ha : a ≠ F.zero) : F.mul a (F.mul (F.inv a) c) = c := by
  rw [← F.mul_assoc, F.mul_inv_cancel a ha, F.one_mul]

end Field

/-! # =====================================================================
    # (H) Finite scalar sums (the engine for the exchange induction)
    # ===================================================================== -/

namespace FSum
variable {F : Field}

/-- **Finite scalar sum** `Σ_{i<k} f i` over a coefficient function on `Fin k`, folded as
a plain `List.foldr F.add` over `List.finRange k`. The dependency-free stand-in for
`Finset.sum`. -/
def ssum {k : Nat} (f : Fin k → F.carrier) : F.carrier :=
  ((List.finRange k).map f).foldr F.add F.zero

/-- The empty sum is `0`. -/
@[simp] theorem ssum_zero (f : Fin 0 → F.carrier) : ssum f = F.zero := rfl

/-- **Head split.** `Σ_{i<k+1} f i = f 0 + Σ_{i<k} f (i.succ)`: the `finRange (k+1)`
recurrence `0 :: map succ (finRange k)` unfolds the fold by one step. -/
theorem ssum_succ {k : Nat} (f : Fin (k+1) → F.carrier) :
    ssum f = F.add (f 0) (ssum (fun i : Fin k => f i.succ)) := by
  unfold ssum
  rw [List.finRange_succ]
  simp only [List.map_cons, List.foldr_cons, List.map_map]
  rfl

/-- **Sum of zeros is zero.** -/
theorem ssum_const_zero {k : Nat} : ssum (fun _ : Fin k => F.zero) = F.zero := by
  induction k with
  | zero => rfl
  | succ m ih =>
    rw [ssum_succ]; rw [ih]; exact F.add_zero F.zero

/-- **Additivity.** `Σ (f i + g i) = Σ f i + Σ g i`. The folded version of finite-sum
linearity in the summand, by induction on `k` with the field's add-assoc/comm. -/
theorem ssum_add {k : Nat} (f g : Fin k → F.carrier) :
    ssum (fun i => F.add (f i) (g i)) = F.add (ssum f) (ssum g) := by
  induction k with
  | zero => simp; rw [F.add_zero]
  | succ m ih =>
    rw [ssum_succ (fun i => F.add (f i) (g i)), ssum_succ f, ssum_succ g]
    rw [show (fun i : Fin m => F.add (f i.succ) (g i.succ))
          = (fun i : Fin m => F.add ((fun j => f j.succ) i) ((fun j => g j.succ) i)) from rfl]
    rw [ih (fun j => f j.succ) (fun j => g j.succ)]
    -- (f0+g0) + (Sf + Sg) = (f0 + Sf) + (g0 + Sg)
    rw [F.add_assoc, ← F.add_assoc (g 0), F.add_comm (g 0) (ssum (fun j => f j.succ)),
        F.add_assoc, ← F.add_assoc]

/-- **Pulling a scalar out of a sum.** `Σ (a · f i) = a · Σ f i`. -/
theorem ssum_smul {k : Nat} (a : F.carrier) (f : Fin k → F.carrier) :
    ssum (fun i => F.mul a (f i)) = F.mul a (ssum f) := by
  induction k with
  | zero => simp; rw [F.mul_zero]
  | succ m ih =>
    rw [ssum_succ (fun i => F.mul a (f i)), ssum_succ f]
    rw [show (fun i : Fin m => F.mul a (f i.succ))
          = (fun i : Fin m => F.mul a ((fun j => f j.succ) i)) from rfl]
    rw [ih (fun j => f j.succ), F.left_distrib]

/-- **Every summand zero ⟹ sum zero** (specialization used to lift a vanishing
combination back through a projection). -/
theorem ssum_eq_zero {k : Nat} (f : Fin k → F.carrier) (h : ∀ i, f i = F.zero) :
    ssum f = F.zero := by
  rw [show f = (fun _ : Fin k => F.zero) from funext h]; exact ssum_const_zero

/-- **Single-term sum picks the value at one index, the rest zero.** If `f j = a` and
`f i = 0` for `i ≠ j`, then `Σ f = a`. Proved by re-summing `f` as the indicator. -/
theorem ssum_single : ∀ {k : Nat} (f : Fin k → F.carrier) (j : Fin k) (a : F.carrier),
    f j = a → (∀ i, i ≠ j → f i = F.zero) → ssum f = a := by
  intro k
  induction k with
  | zero => intro _ j _ _ _; exact absurd j.isLt (by omega)
  | succ m ih =>
    intro f j a hj hrest
    rw [ssum_succ f]
    by_cases hj0 : j = 0
    · subst hj0
      have hzero : ssum (fun i : Fin m => f i.succ) = F.zero := by
        apply ssum_eq_zero
        intro i
        exact hrest i.succ (Fin.succ_ne_zero i)
      rw [hzero, F.add_zero, hj]
    · -- j = (j.pred hj0).succ
      have hjeq : (j.pred hj0).succ = j := Fin.succ_pred j hj0
      have hf0 : f 0 = F.zero := hrest 0 (fun h => hj0 h.symm)
      rw [hf0, F.zero_add]
      apply ih (fun i : Fin m => f i.succ) (j.pred hj0) a
      · show f (j.pred hj0).succ = a; rw [hjeq]; exact hj
      · intro i hi
        apply hrest i.succ
        intro h
        apply hi
        rw [← hjeq] at h
        exact Fin.succ_inj.mp h

end FSum

/-! # =====================================================================
    # (I) The exchange engine: more columns than rows ⟹ nontrivial kernel
    # ===================================================================== -/

namespace Vec
variable {F : Field}

/-- **Function-indexed scaled sum** `Σ_{j<k} x j · cols j` of `k` vectors in `Fᵖ`,
evaluated coordinatewise via `FSum.ssum`. This is the "matrix · vector" of the columns
`cols` against the coefficient function `x` — the object whose nontrivial kernel is the
Steinitz exchange. -/
def combF {p k : Nat} (x : Fin k → F.carrier) (cols : Fin k → Vec F p) : Vec F p :=
  fun coord => FSum.ssum (fun j => F.mul (x j) (cols j coord))

/-- `combF` is **additive in the coefficient vector**: `combF (x+y) = combF x + combF y`. -/
theorem combF_add {p k : Nat} (x y : Fin k → F.carrier) (cols : Fin k → Vec F p) :
    combF (fun j => F.add (x j) (y j)) cols = add (combF x cols) (combF y cols) := by
  funext coord
  show FSum.ssum (fun j => F.mul (F.add (x j) (y j)) (cols j coord))
      = F.add (combF x cols coord) (combF y cols coord)
  rw [show (fun j => F.mul (F.add (x j) (y j)) (cols j coord))
        = (fun j => F.add (F.mul (x j) (cols j coord)) (F.mul (y j) (cols j coord)))
        from funext (fun j => F.right_distrib (x j) (y j) (cols j coord))]
  exact FSum.ssum_add _ _

/-- `combF` is **homogeneous in the coefficient vector**: `combF (a·x) = a · combF x`. -/
theorem combF_smul {p k : Nat} (a : F.carrier) (x : Fin k → F.carrier)
    (cols : Fin k → Vec F p) :
    combF (fun j => F.mul a (x j)) cols = smul a (combF x cols) := by
  funext coord
  show FSum.ssum (fun j => F.mul (F.mul a (x j)) (cols j coord))
      = F.mul a (combF x cols coord)
  rw [show (fun j => F.mul (F.mul a (x j)) (cols j coord))
        = (fun j => F.mul a (F.mul (x j) (cols j coord)))
        from funext (fun j => F.mul_assoc a (x j) (cols j coord))]
  exact FSum.ssum_smul a _

end Vec

/-! # =====================================================================
    # (I.1) Sum reindexing under a Fin-bijection (for the exchange pivot)
    # ===================================================================== -/

namespace FSum
variable {F : Field}

/-- foldr-`add` is left-commutative, the hypothesis `List.Perm.foldr_eq'` needs. -/
private theorem add_left_comm_aux (x : F.carrier) (y : F.carrier) (z : F.carrier) :
    F.add y (F.add x z) = F.add x (F.add y z) := by
  rw [← F.add_assoc, F.add_comm y x, F.add_assoc]

/-- **Sum is permutation-invariant.** If the lists `l₁ ~ l₂` then their `add`-folds agree;
specialization of core `List.Perm.foldr_eq'` to the field's commutative addition. -/
theorem foldr_add_perm {l₁ l₂ : List F.carrier} (h : l₁.Perm l₂) :
    l₁.foldr F.add F.zero = l₂.foldr F.add F.zero :=
  List.Perm.foldr_eq' h (fun x _ y _ z => add_left_comm_aux x y z) F.zero

/-- **Two `Nodup` lists with the same membership are permutations.** Standard induction
that splits `l₂` at the head `a` (`mem_iff_append`) and reorders via `perm_middle`, using
only choice-free core lemmas — the dependency-free, `Classical`-free replacement for
`List.perm_of_nodup_nodup_toFinset_eq`. -/
theorem perm_of_nodup_mem {α : Type} [DecidableEq α] :
    ∀ {l₁ l₂ : List α}, l₁.Nodup → l₂.Nodup → (∀ a, a ∈ l₁ ↔ a ∈ l₂) → l₁.Perm l₂ := by
  intro l₁
  induction l₁ with
  | nil =>
    intro l₂ _ _ hmem
    cases l₂ with
    | nil => exact List.Perm.refl []
    | cons b l => exact absurd ((hmem b).mpr (List.mem_cons_self ..)) (by simp)
  | cons a t ih =>
    intro l₂ hnd1 hnd2 hmem
    have ha2 : a ∈ l₂ := (hmem a).mp (List.mem_cons_self ..)
    obtain ⟨pre, post, rfl⟩ := List.mem_iff_append.mp ha2
    rw [List.nodup_cons] at hnd1
    have hndapp := hnd2
    rw [List.nodup_append, List.nodup_cons] at hndapp
    obtain ⟨hpre, ⟨hanp, hpost⟩, hdis⟩ := hndapp
    refine List.Perm.trans ?_ (List.perm_middle (a := a) (l₁ := pre) (l₂ := post)).symm
    apply List.Perm.cons
    have hnd2' : (pre ++ post).Nodup := by
      rw [List.nodup_append]
      exact ⟨hpre, hpost, fun x hx y hy => hdis x hx y (List.mem_cons_of_mem a hy)⟩
    apply ih hnd1.2 hnd2'
    intro x
    constructor
    · intro hx
      have hxl2 : x ∈ pre ++ a :: post := (hmem x).mp (List.mem_cons_of_mem a hx)
      have hxne : x ≠ a := by intro he; subst he; exact hnd1.1 hx
      rw [List.mem_append] at hxl2 ⊢
      rcases hxl2 with h | h
      · exact Or.inl h
      · rcases List.mem_cons.mp h with h' | h'
        · exact absurd h' hxne
        · exact Or.inr h'
    · intro hx
      have hxl2 : x ∈ pre ++ a :: post := by
        rw [List.mem_append] at hx ⊢; rcases hx with h | h
        · exact Or.inl h
        · exact Or.inr (List.mem_cons_of_mem a h)
      have hxne : x ≠ a := by
        rw [List.mem_append] at hx
        rcases hx with h | h
        · exact fun he => (hdis x h a (List.mem_cons_self ..)) he
        · exact fun he => hanp (he ▸ h)
      have := (hmem x).mpr hxl2
      rcases List.mem_cons.mp this with h | h
      · exact absurd h hxne
      · exact h

/-- A `Fin`-bijection's image of `finRange` is `Nodup` (the map is injective). -/
theorem nodup_map_of_inv {k : Nat} (g g' : Fin k → Fin k)
    (hg'g : ∀ i, g' (g i) = i) : ((List.finRange k).map g).Nodup := by
  have hinj : ∀ x y, g x = g y → x = y := by
    intro x y h; have := congrArg g' h; rw [hg'g, hg'g] at this; exact this
  unfold List.Nodup
  rw [List.pairwise_map]
  have h := Vec.nodup_finRange k
  unfold List.Nodup at h
  exact List.Pairwise.imp (fun {a b} hab heq => hab (hinj a b heq)) h

/-- **Reindexing a sum along a Fin-bijection.** If `g : Fin k → Fin k` has a two-sided
inverse `g'`, then `Σ_i f (g i) = Σ_i f i`: `map (f∘g) (finRange k)` is a permutation of
`map f (finRange k)` (same elements, since `g` is a bijection), so the folds agree. -/
theorem ssum_reindex {k : Nat} (f : Fin k → F.carrier) (g g' : Fin k → Fin k)
    (hgg' : ∀ i, g (g' i) = i) (hg'g : ∀ i, g' (g i) = i) :
    ssum (fun i => f (g i)) = ssum f := by
  unfold ssum
  apply foldr_add_perm
  have hmap : (List.finRange k).map (fun i => f (g i)) = ((List.finRange k).map g).map f := by
    rw [List.map_map]; rfl
  rw [hmap]
  apply List.Perm.map
  -- (finRange k).map g ~ finRange k, both nodup with same membership
  apply perm_of_nodup_mem (nodup_map_of_inv g g' hg'g) (Vec.nodup_finRange k)
  intro a
  constructor
  · intro _; exact List.mem_finRange a
  · intro _; rw [List.mem_map]; exact ⟨g' a, List.mem_finRange _, hgg' a⟩

end FSum

/-! # =====================================================================
    # (I.2) Column reindexing of `combF`, row projection, and the pivot swap
    # ===================================================================== -/

namespace Vec
variable {F : Field}

/-- **`combF` is invariant under reindexing the columns by an involution** `σ`:
`Σ_j (x∘σ)_j (cols∘σ)_j = Σ_j x_j cols_j` (reorder the same summands). -/
theorem combF_reindex {p k : Nat} (x : Fin k → F.carrier) (cols : Fin k → Vec F p)
    (σ : Fin k → Fin k) (hσ : ∀ i, σ (σ i) = i) :
    combF (fun j => x (σ j)) (fun j => cols (σ j)) = combF x cols := by
  funext coord
  show FSum.ssum (fun j => F.mul (x (σ j)) (cols (σ j) coord))
      = FSum.ssum (fun j => F.mul (x j) (cols j coord))
  exact FSum.ssum_reindex (fun j => F.mul (x j) (cols j coord)) σ σ hσ hσ

/-- **Row projection** dropping coordinate `0`: `dropRow v i = v (i.succ)`, sending
`Fᵖ⁺¹ → Fᵖ`. The subspace `{first coord = 0}` is its faithful copy of `Fᵖ`. -/
def dropRow {p : Nat} (v : Vec F (p+1)) : Vec F p := fun i => v i.succ

/-- `combF` commutes with `dropRow` on the columns: projecting the combination equals the
combination of the projected columns (both read coordinate `i.succ`). -/
theorem dropRow_combF {p k : Nat} (x : Fin k → F.carrier) (cols : Fin k → Vec F (p+1)) :
    dropRow (combF x cols) = combF x (fun j => dropRow (cols j)) := by
  funext i
  rfl

/-- The pivot transposition on `Fin (k+1)` swapping index `0` with index `j₀`. -/
def swap0 {k : Nat} (j0 : Fin (k+1)) : Fin (k+1) → Fin (k+1) :=
  fun i => if i = 0 then j0 else if i = j0 then 0 else i

/-- `swap0 j₀` is an involution. -/
theorem swap0_invol {k : Nat} (j0 : Fin (k+1)) (i : Fin (k+1)) :
    swap0 j0 (swap0 j0 i) = i := by
  show (if (swap0 j0 i) = 0 then j0 else if (swap0 j0 i) = j0 then 0 else (swap0 j0 i)) = i
  simp only [swap0]
  by_cases h0 : i = 0
  · subst h0
    by_cases hj : j0 = 0 <;> simp [hj]
  · by_cases hj : i = j0
    · subst hj
      by_cases h : i = 0 <;> simp [h]
    · simp [h0, hj]

/-- `swap0 j₀` sends `0 ↦ j₀`. -/
theorem swap0_zero {k : Nat} (j0 : Fin (k+1)) : swap0 j0 0 = j0 := by
  simp [swap0]

/-- **Head split of `combF`** over `Fin (k+1)`: the `j = 0` column splits off, the rest
sums over `Fin k` via `Fin.succ` (the `ssum_succ` of the coordinatewise sum). -/
theorem combF_succ {p k : Nat} (x : Fin (k+1) → F.carrier) (cols : Fin (k+1) → Vec F p) :
    combF x cols
      = add (smul (x 0) (cols 0))
          (combF (fun i : Fin k => x i.succ) (fun i : Fin k => cols i.succ)) := by
  funext coord
  show FSum.ssum (fun j => F.mul (x j) (cols j coord))
      = F.add (F.mul (x 0) (cols 0 coord))
          (FSum.ssum (fun i : Fin k => F.mul (x i.succ) (cols i.succ coord)))
  rw [FSum.ssum_succ (fun j => F.mul (x j) (cols j coord))]

end Vec

/-! # =====================================================================
    # (I.3) THE EXCHANGE CORE: more columns than rows ⟹ nontrivial kernel
    # ===================================================================== -/

namespace Vec
variable {F : Field}

/-- **Pivot step of the exchange.** Columns `cols'` in `Fᵖ⁺¹` with a nonzero pivot at
index `0` (`cols' 0 0 ≠ 0`); given the `p`-row exchange result `ihp` and `p < k'`, produce
a nontrivial dependence of the `k'+1` columns. The eliminated columns
`wᵢ = dropRow(colsᵢ₊₁) - tᵢ·dropRow(cols₀)` (with `tᵢ = colsᵢ₊₁[0]·pivot⁻¹`) lie in `Fᵖ`;
the IH dependence `y` of the `wᵢ` lifts to `x'` (with `x'₀ = -Σ yᵢtᵢ`) on `cols'`. -/
theorem exists_dep_pivot {p k' : Nat} (cols' : Fin (k'+1) → Vec F (p+1))
    (hpivot : cols' 0 0 ≠ F.zero)
    (ihp : ∀ (w : Fin k' → Vec F p), p < k' →
      ∃ x : Fin k' → F.carrier, (∃ j, x j ≠ F.zero) ∧ combF x w = zero F p)
    (hpk'pred : p < k') :
    ∃ x : Fin (k'+1) → F.carrier, (∃ j, x j ≠ F.zero) ∧ combF x cols' = zero F (p+1) := by
  -- elimination coefficients and columns
  let t : Fin k' → F.carrier := fun i => F.mul (cols' i.succ 0) (F.inv (cols' 0 0))
  let w : Fin k' → Vec F p :=
    fun i => add (dropRow (cols' i.succ)) (neg (smul (t i) (dropRow (cols' 0))))
  obtain ⟨y, ⟨jy, hjy⟩, hwzero⟩ := ihp w hpk'pred
  let S : F.carrier := FSum.ssum (fun i => F.mul (y i) (t i))
  let x' : Fin (k'+1) → F.carrier := fun j => if h : j = 0 then F.neg S else y (j.pred h)
  have hx'succ : ∀ i : Fin k', x' i.succ = y i := by
    intro i
    show (if h : i.succ = 0 then F.neg S else y ((i.succ).pred h)) = y i
    rw [dif_neg (Fin.succ_ne_zero i)]; congr 1
  have hx'zero : x' 0 = F.neg S := by show (if h : (0:Fin (k'+1)) = 0 then F.neg S else _) = F.neg S; rw [dif_pos rfl]
  -- A d := Σ_i y_i · cols'(i.succ) d  (the tail combination)
  -- KEY: A d = S · cols' 0 d for every coordinate d.
  have hkey : ∀ d : Fin (p+1),
      combF y (fun i : Fin k' => cols' i.succ) d = F.mul S (cols' 0 d) := by
    intro d
    rcases Fin.eq_zero_or_eq_succ d with hd | ⟨c, rfl⟩
    · -- d = 0: use cols'(i.succ) 0 = t i · pivot
      subst hd
      show FSum.ssum (fun i => F.mul (y i) (cols' i.succ 0)) = F.mul S (cols' 0 0)
      have hcoef : ∀ i : Fin k', F.mul (y i) (cols' i.succ 0)
          = F.mul (F.mul (y i) (t i)) (cols' 0 0) := by
        intro i
        show F.mul (y i) (cols' i.succ 0)
            = F.mul (F.mul (y i) (F.mul (cols' i.succ 0) (F.inv (cols' 0 0)))) (cols' 0 0)
        symm
        calc F.mul (F.mul (y i) (F.mul (cols' i.succ 0) (F.inv (cols' 0 0)))) (cols' 0 0)
            = F.mul (y i) (F.mul (F.mul (cols' i.succ 0) (F.inv (cols' 0 0))) (cols' 0 0)) :=
              F.mul_assoc _ _ _
          _ = F.mul (y i) (F.mul (cols' i.succ 0) (F.mul (F.inv (cols' 0 0)) (cols' 0 0))) := by
              rw [F.mul_assoc]
          _ = F.mul (y i) (F.mul (cols' i.succ 0) F.one) := by rw [Field.inv_mul_cancel hpivot]
          _ = F.mul (y i) (cols' i.succ 0) := by rw [F.mul_one]
      rw [show (fun i => F.mul (y i) (cols' i.succ 0))
            = (fun i => F.mul (F.mul (y i) (t i)) (cols' 0 0)) from funext hcoef]
      -- Σ (y_i t_i) · pivot = (Σ y_i t_i) · pivot = S · pivot
      have := FSum.ssum_smul (cols' 0 0) (fun i => F.mul (y i) (t i))
      -- ssum (fun i => (y_i t_i) * pivot) ; need mul_comm to match ssum_smul (which pulls left factor)
      rw [show (fun i => F.mul (F.mul (y i) (t i)) (cols' 0 0))
            = (fun i => F.mul (cols' 0 0) (F.mul (y i) (t i)))
            from funext (fun i => F.mul_comm _ _)]
      rw [FSum.ssum_smul (cols' 0 0) (fun i => F.mul (y i) (t i))]
      exact F.mul_comm (cols' 0 0) S
    · -- d = c.succ: use combF y w c = 0
      have hwc := congrFun hwzero c
      -- combF y w c = A(c.succ) - S·cols'(0)(c.succ)
      show FSum.ssum (fun i => F.mul (y i) (cols' i.succ c.succ)) = F.mul S (cols' 0 c.succ)
      -- expand combF y w c
      have hexp : combF y w c
          = F.add (FSum.ssum (fun i => F.mul (y i) (cols' i.succ c.succ)))
              (F.neg (F.mul S (cols' 0 c.succ))) := by
        show FSum.ssum (fun i => F.mul (y i) (w i c))
            = F.add (FSum.ssum (fun i => F.mul (y i) (cols' i.succ c.succ)))
                (F.neg (F.mul S (cols' 0 c.succ)))
        have hwic : ∀ i : Fin k', F.mul (y i) (w i c)
            = F.add (F.mul (y i) (cols' i.succ c.succ))
                (F.neg (F.mul (F.mul (y i) (t i)) (cols' 0 c.succ))) := by
          intro i
          show F.mul (y i) (F.add (dropRow (cols' i.succ) c)
                (F.neg (F.mul (t i) (dropRow (cols' 0) c))))
              = F.add (F.mul (y i) (cols' i.succ c.succ))
                  (F.neg (F.mul (F.mul (y i) (t i)) (cols' 0 c.succ)))
          rw [F.left_distrib]
          congr 1
          -- y_i · (-(t_i · cols'0 c.succ)) = -(y_i t_i · cols'0 c.succ)
          show F.mul (y i) (F.neg (F.mul (t i) (cols' 0 c.succ)))
              = F.neg (F.mul (F.mul (y i) (t i)) (cols' 0 c.succ))
          calc F.mul (y i) (F.neg (F.mul (t i) (cols' 0 c.succ)))
              = F.mul (F.neg (F.mul (t i) (cols' 0 c.succ))) (y i) := F.mul_comm _ _
            _ = F.neg (F.mul (F.mul (t i) (cols' 0 c.succ)) (y i)) := Field.neg_mul _ _
            _ = F.neg (F.mul (y i) (F.mul (t i) (cols' 0 c.succ))) := by rw [F.mul_comm (F.mul (t i) (cols' 0 c.succ)) (y i)]
            _ = F.neg (F.mul (F.mul (y i) (t i)) (cols' 0 c.succ)) :=
                congrArg F.neg (F.mul_assoc (y i) (t i) (cols' 0 c.succ)).symm
        rw [show (fun i => F.mul (y i) (w i c))
              = (fun i => F.add (F.mul (y i) (cols' i.succ c.succ))
                  (F.neg (F.mul (F.mul (y i) (t i)) (cols' 0 c.succ)))) from funext hwic]
        rw [FSum.ssum_add]
        congr 1
        -- Σ -(y_i t_i · cols'0 c.succ) = -(S · cols'0 c.succ)
        rw [show (fun i => F.neg (F.mul (F.mul (y i) (t i)) (cols' 0 c.succ)))
              = (fun i => F.neg (F.mul (cols' 0 c.succ) (F.mul (y i) (t i))))
              from funext (fun i => by rw [F.mul_comm (F.mul (y i) (t i)) (cols' 0 c.succ)])]
        rw [show (fun i => F.neg (F.mul (cols' 0 c.succ) (F.mul (y i) (t i))))
              = (fun i => F.mul (F.neg (cols' 0 c.succ)) (F.mul (y i) (t i)))
              from funext (fun i => (Field.neg_mul (cols' 0 c.succ) (F.mul (y i) (t i))).symm)]
        rw [FSum.ssum_smul (F.neg (cols' 0 c.succ)) (fun i => F.mul (y i) (t i))]
        rw [Field.neg_mul, F.mul_comm (cols' 0 c.succ) S]
      rw [hwc] at hexp
      -- 0 = A + (-(S·cols'0 c.succ)) ⟹ A = S·cols'0 c.succ
      have := Field.eq_neg_of_add_eq_zero hexp.symm
      -- this : A = -(-(S·...)) ... actually eq_neg gives A = neg(neg ..)
      rw [this, Field.neg_neg]
  -- assemble: combF x' cols' = 0
  refine ⟨x', ⟨jy.succ, by rw [hx'succ jy]; exact hjy⟩, ?_⟩
  funext d
  rw [combF_succ x' cols']
  show F.add (F.mul (x' 0) (cols' 0 d))
        (combF (fun i : Fin k' => x' i.succ) (fun i : Fin k' => cols' i.succ) d) = F.zero
  rw [show (fun i : Fin k' => x' i.succ) = y from funext hx'succ, hx'zero, hkey d]
  -- (-S)·cols'0 d + S·cols'0 d = 0
  rw [Field.neg_mul, F.add_left_neg]

/-- **The Steinitz exchange core (`exists_dep_combF`).** Any family of `k` vectors
(`cols`) in `Fᵖ` with `p < k` has a **nontrivial linear dependence**: there is a
coefficient vector `x` with some nonzero entry and `Σ_j x_j · cols_j = 0`. This is the
Gaussian-elimination heart of dimension invariance (`dimension.md`: "proved by the
Steinitz exchange lemma"), proved by induction on the number of rows `p`:

* `p = 0`: every vector is the empty tuple; the indicator at index `0` is a nonzero
  dependence (`combF` lands in `F⁰`, trivially zero).
* `p+1`, **no pivot** (all first coordinates `0`): the columns live in the row-`0`-zero
  subspace `≅ Fᵖ`; drop row `0` and apply the IH; the lifted relation still kills row `0`.
* `p+1`, **pivot** `j₀` with `cols j₀ 0 ≠ 0`: transpose `j₀` to index `0` (`exists_dep_pivot`),
  eliminate, recurse, lift back through the transposition. -/
theorem exists_dep_combF [DecidableEq F.carrier] :
    ∀ {p k : Nat} (cols : Fin k → Vec F p), p < k →
    ∃ x : Fin k → F.carrier, (∃ j, x j ≠ F.zero) ∧ combF x cols = zero F p := by
  intro p
  induction p with
  | zero =>
    intro k cols hk
    obtain ⟨k', rfl⟩ : ∃ k', k = k' + 1 := ⟨k - 1, by omega⟩
    refine ⟨fun j => if j = 0 then F.one else F.zero, ⟨0, ?_⟩, ?_⟩
    · show (if (0 : Fin (k'+1)) = 0 then F.one else F.zero) ≠ F.zero
      rw [if_pos rfl]; intro h; exact F.zero_ne_one h.symm
    · funext coord; exact absurd coord.isLt (by omega)
  | succ p ih =>
    intro k cols hk
    obtain ⟨k', rfl⟩ : ∃ k', k = k' + 1 := ⟨k - 1, by omega⟩
    by_cases hpiv : ∃ j, cols j 0 ≠ F.zero
    · -- PIVOT CASE: transpose pivot to index 0, apply exists_dep_pivot, lift back
      obtain ⟨j0, hj0⟩ := hpiv
      have hpk'pred : p < k' := by omega
      have hpivot : (fun i => cols (swap0 j0 i)) 0 0 ≠ F.zero := by
        show cols (swap0 j0 0) 0 ≠ F.zero; rw [swap0_zero]; exact hj0
      obtain ⟨x', ⟨jx', hjx'⟩, hx'main⟩ :=
        exists_dep_pivot (fun i => cols (swap0 j0 i)) hpivot (fun w h => ih w h) hpk'pred
      refine ⟨fun j => x' (swap0 j0 j),
        ⟨swap0 j0 jx', by show x' (swap0 j0 (swap0 j0 jx')) ≠ F.zero; rw [swap0_invol]; exact hjx'⟩, ?_⟩
      show combF (fun j => x' (swap0 j0 j)) cols = zero F (p+1)
      have hCswap : cols = (fun j => (fun i => cols (swap0 j0 i)) (swap0 j0 j)) :=
        funext (fun j => by show cols j = cols (swap0 j0 (swap0 j0 j)); rw [swap0_invol])
      rw [hCswap]
      rw [combF_reindex x' (fun i => cols (swap0 j0 i)) (swap0 j0) (swap0_invol j0)]
      exact hx'main
    · -- NO-PIVOT CASE: all first coords zero
      have hpiv : ∀ j, cols j 0 = F.zero := by
        intro j
        exact Decidable.of_not_not (fun hjne => hpiv ⟨j, hjne⟩)
      have hpk' : p < k' + 1 := by omega
      obtain ⟨x, ⟨jx, hjx⟩, hxzero⟩ := ih (fun j => dropRow (cols j)) hpk'
      refine ⟨x, ⟨jx, hjx⟩, ?_⟩
      funext d
      rcases Fin.eq_zero_or_eq_succ d with hd | ⟨c, rfl⟩
      · subst hd
        show FSum.ssum (fun j => F.mul (x j) (cols j 0)) = F.zero
        have : (fun j => F.mul (x j) (cols j 0)) = (fun _ : Fin (k'+1) => F.zero) := by
          funext j; rw [hpiv j, F.mul_zero]
        rw [this]; exact FSum.ssum_const_zero
      · have := congrFun hxzero c
        show FSum.ssum (fun j => F.mul (x j) (cols j c.succ)) = F.zero
        exact this

end Vec

/-! # =====================================================================
    # (I.4) From the exchange core to list-level dependence
    # ===================================================================== -/

namespace Vec
variable {F : Field}

/-- Bridge: `lcomb` of the coefficient list `(finRange vs.length).map x` against `vs`
equals the function-indexed `combF x (vs.get)`. Matches the two recursions. -/
theorem lcomb_finRange_eq_combF {n : Nat} :
    ∀ (vs : List (Vec F n)) (x : Fin vs.length → F.carrier),
      lcomb ((List.finRange vs.length).map x) vs = combF x (fun i => vs.get i) := by
  intro vs
  induction vs with
  | nil => intro x; funext coord; rfl
  | cons v vs' ih =>
    intro x
    show lcomb ((List.finRange (vs'.length + 1)).map x) (v :: vs')
        = combF x (fun i => (v :: vs').get i)
    rw [List.finRange_succ]
    show lcomb (x 0 :: ((List.finRange vs'.length).map Fin.succ).map x) (v :: vs')
        = combF x (fun i => (v :: vs').get i)
    rw [List.map_map]
    show add (smul (x 0) v)
          (lcomb ((List.finRange vs'.length).map (fun i => x i.succ)) vs')
        = combF x (fun i => (v :: vs').get i)
    rw [ih (fun i => x i.succ)]
    -- RHS: combF x ((v::vs').get) = smul (x 0) v + combF (x∘succ) (vs'.get)
    have hrhs : combF x (fun i => (v :: vs').get i)
        = add (smul (x 0) ((v :: vs').get 0))
            (combF (fun i : Fin vs'.length => x i.succ) (fun i => (v :: vs').get i.succ)) :=
      combF_succ x (fun i => (v :: vs').get i)
    rw [hrhs]
    rfl

/-- **More vectors than the dimension ⟹ dependent.** Any list `vs` of vectors in `Fⁿ`
with `n < vs.length` is linearly `dependent`: the exchange core produces a nontrivial
coefficient function, which lists out as a nontrivial coefficient list combining `vs` to
`0`. (`basis.md`: a nontrivial vanishing combination.) -/
theorem dependent_of_length_gt [DecidableEq F.carrier] {n : Nat} (vs : List (Vec F n))
    (h : n < vs.length) : dependent vs := by
  obtain ⟨x, ⟨jx, hjx⟩, hxzero⟩ := exists_dep_combF (fun i => vs.get i) h
  refine ⟨(List.finRange vs.length).map x, ?_, ?_, ?_⟩
  · rw [List.length_map, List.length_finRange]
  · refine ⟨x jx, ?_, hjx⟩
    rw [List.mem_map]
    exact ⟨jx, List.mem_finRange jx, rfl⟩
  · rw [lcomb_finRange_eq_combF vs x]; exact hxzero

end Vec

/-! # =====================================================================
    # (J): the Steinitz bound and dimension invariance
    # ===================================================================== -/

namespace Vec
variable {F : Field}

/-- **THE STEINITZ BOUND (independent ≤ dimension).** An independent list `L` of vectors
in `Fⁿ` has length at most `n` — the standard space's dimension bounds every independent
set (`dimension.md`: the Steinitz exchange lemma; an independent set never exceeds the
dimension). The crux of dimension invariance, choice-free: if `n < L.length`, the exchange
core makes `L` dependent, contradicting independence. -/
theorem steinitz_bound [DecidableEq F.carrier] {n : Nat} {L : List (Vec F n)}
    (hL : independent L) : L.length ≤ n := by
  apply Nat.le_of_not_lt
  intro hlt
  exact not_independent_of_dependent (dependent_of_length_gt L hlt) hL

/-- **Spanning coordinatizer (choice-free).** From `spans S`, every finite list `L` of
vectors admits a coordinate matrix: a function `M : Fin L.length → Vec F S.length` whose
`j`-th row, read as a coefficient list, recombines `S` to `L.get j`. Built by induction on
`L`, extracting each head's coordinates by `Exists`-elimination into the `∃`-goal (so no
`Classical.choice` is incurred). -/
theorem spans_coords {n : Nat} {S : List (Vec F n)} (hS : spans S) :
    ∀ (L : List (Vec F n)),
      ∃ cs : Fin L.length → List F.carrier,
        ∀ j : Fin L.length, lcomb (cs j) S = L.get j := by
  intro L
  induction L with
  | nil => exact ⟨fun j => j.elim0, fun j => j.elim0⟩
  | cons v L' ih =>
    obtain ⟨cv, hcv⟩ := hS v
    obtain ⟨cs', hcs'⟩ := ih
    refine ⟨fun j => if h : j = 0 then cv else cs' (j.pred h), ?_⟩
    intro j
    induction j using Fin.cases with
    | zero =>
      show lcomb (if h : (0 : Fin (L'.length+1)) = 0 then cv else cs' ((0:Fin (L'.length+1)).pred h)) S
          = (v :: L').get 0
      rw [dif_pos rfl]; exact hcv
    | succ i =>
      show lcomb (if h : i.succ = 0 then cv else cs' (i.succ.pred h)) S = (v :: L').get i.succ
      rw [dif_neg (Fin.succ_ne_zero i)]
      rw [List.get_cons_succ']
      rw [show i.succ.pred (Fin.succ_ne_zero i) = i from Fin.pred_succ i]
      exact hcs' i

/-- `lcomb` is **additive in its coefficient list** (matched lengths) — folding two
coefficient lists over the same vector list adds the combinations. -/
theorem lcomb_add_coeff {n : Nat} : ∀ (S : List (Vec F n)) (cs ds : List F.carrier),
    cs.length = S.length → ds.length = S.length →
    lcomb (List.zipWith F.add cs ds) S = add (lcomb cs S) (lcomb ds S) := by
  intro S
  induction S with
  | nil =>
    intro cs ds _ _
    rw [lcomb_nil_right, lcomb_nil_right, lcomb_nil_right]
    funext coord
    show F.zero = F.add F.zero F.zero
    exact (F.add_zero F.zero).symm
  | cons s S' ih =>
    intro cs ds hcs hds
    cases cs with
    | nil => exact absurd hcs (by simp)
    | cons c cs' =>
      cases ds with
      | nil => exact absurd hds (by simp)
      | cons d ds' =>
        have hcs' : cs'.length = S'.length := by simp at hcs ⊢; omega
        have hds' : ds'.length = S'.length := by simp at hds ⊢; omega
        show add (smul (F.add c d) s) (lcomb (List.zipWith F.add cs' ds') S')
            = add (add (smul c s) (lcomb cs' S')) (add (smul d s) (lcomb ds' S'))
        rw [ih cs' ds' hcs' hds']
        funext coord
        show F.add (F.mul (F.add c d) (s coord))
              (F.add (lcomb cs' S' coord) (lcomb ds' S' coord))
            = F.add (F.add (F.mul c (s coord)) (lcomb cs' S' coord))
                (F.add (F.mul d (s coord)) (lcomb ds' S' coord))
        rw [F.right_distrib]
        -- (cs+ds) + (A+B) = (cs+A)+(ds+B)  with cs=c·s etc.
        rw [F.add_assoc, ← F.add_assoc (F.mul d (s coord)),
            F.add_comm (F.mul d (s coord)) (lcomb cs' S' coord),
            F.add_assoc, ← F.add_assoc]

end Vec

namespace Vec
variable {F : Field}

/-- **`lcomb` is homogeneous in its coefficient list**: scaling all coefficients by `a`
scales the combination by `a`. -/
theorem lcomb_smul_coeff {n : Nat} : ∀ (S : List (Vec F n)) (a : F.carrier) (cs : List F.carrier),
    lcomb (cs.map (fun c => F.mul a c)) S = smul a (lcomb cs S) := by
  intro S
  induction S with
  | nil =>
    intro a cs
    rw [lcomb_nil_right, lcomb_nil_right]
    funext coord; show F.zero = F.mul a F.zero; exact (F.mul_zero a).symm
  | cons s S' ih =>
    intro a cs
    cases cs with
    | nil =>
      show lcomb [] (s :: S') = smul a (lcomb [] (s :: S'))
      rw [lcomb_nil_left]
      funext coord; show F.zero = F.mul a F.zero; exact (F.mul_zero a).symm
    | cons c cs' =>
      show add (smul (F.mul a c) s) (lcomb (cs'.map (fun c => F.mul a c)) S')
          = smul a (add (smul c s) (lcomb cs' S'))
      rw [ih a cs']
      funext coord
      show F.add (F.mul (F.mul a c) (s coord)) (F.mul a (lcomb cs' S' coord))
          = F.mul a (F.add (F.mul c (s coord)) (lcomb cs' S' coord))
      rw [F.left_distrib, F.mul_assoc]

/-- **Pad a coefficient list to length `len`** with trailing zeros (truncating if longer).
Because a "missing" coefficient and an explicit zero coefficient both contribute the zero
vector, padding does not change `lcomb`. -/
def padTo (len : Nat) (c : List F.carrier) : List F.carrier :=
  (c ++ List.replicate len F.zero).take len

end Vec

namespace Vec
variable {F : Field}

/-- **`lcomb` as a `combF` over `S`'s entries.** Any coefficient list `cs` combines `S`
exactly as the coordinate function `i ↦ csᵢ` (missing entries read as `0`) does against
`S.get`. This is the universal bridge between the list `lcomb` and the `Fin`-indexed
`combF`, eliminating all length bookkeeping. -/
theorem lcomb_eq_combF_get {n : Nat} : ∀ (S : List (Vec F n)) (cs : List F.carrier),
    lcomb cs S = combF (fun i : Fin S.length => cs.getD i.val F.zero) (fun i => S.get i) := by
  intro S
  induction S with
  | nil => intro cs; funext coord; cases cs <;> rfl
  | cons s S' ih =>
    intro cs
    cases cs with
    | nil =>
      -- lcomb [] (s::S') = zero = combF (all-zero) ...
      rw [lcomb_nil_left]
      have hzc : (fun i : Fin (s :: S').length => ([] : List F.carrier).getD i.val F.zero)
          = (fun _ : Fin (s :: S').length => F.zero) := by funext i; rfl
      rw [hzc]
      funext coord
      show F.zero = combF (fun _ : Fin (S'.length+1) => F.zero) (fun i => (s :: S').get i) coord
      show F.zero = FSum.ssum (fun j => F.mul F.zero ((s :: S').get j coord))
      rw [show (fun j => F.mul F.zero ((s :: S').get j coord))
            = (fun _ : Fin (S'.length+1) => F.zero) from funext (fun j => F.zero_mul _)]
      exact FSum.ssum_const_zero.symm
    | cons c cs' =>
      show add (smul c s) (lcomb cs' S')
          = combF (fun i : Fin (S'.length+1) => (c :: cs').getD i.val F.zero)
              (fun i : Fin (S'.length+1) => (s::S').get i)
      rw [ih cs']
      rw [combF_succ
        (fun i : Fin (S'.length+1) => (c :: cs').getD i.val F.zero)
        (fun i : Fin (S'.length+1) => (s::S').get i)]
      funext coord
      show F.add (F.mul c (s coord))
            (combF (fun i : Fin S'.length => cs'.getD i.val F.zero) (fun i => S'.get i) coord)
          = F.add (F.mul ((c :: cs').getD (0:Fin (S'.length+1)).val F.zero) ((s::S').get 0 coord))
              (combF (fun i : Fin S'.length => (c :: cs').getD i.succ.val F.zero)
                (fun i => (s::S').get i.succ) coord)
      rfl

end Vec

namespace FSum
variable {F : Field}

/-- **Double-sum swap (Fubini for finite scalar sums).**
`Σ_a Σ_b f a b = Σ_b Σ_a f a b`. By induction on the outer range using `ssum_add`. -/
theorem ssum_comm {ka kb : Nat} (f : Fin ka → Fin kb → F.carrier) :
    ssum (fun a => ssum (fun b => f a b)) = ssum (fun b => ssum (fun a => f a b)) := by
  induction ka with
  | zero =>
    rw [ssum_zero]
    rw [show (fun b => ssum (fun a : Fin 0 => f a b)) = (fun _ : Fin kb => F.zero)
          from funext (fun b => ssum_zero _)]
    exact ssum_const_zero.symm
  | succ m ih =>
    rw [ssum_succ (fun a => ssum (fun b => f a b))]
    -- Σ_b f 0 b + Σ_{a:Fin m} Σ_b f a.succ b
    rw [ih (fun a b => f a.succ b)]
    -- = Σ_b f 0 b + Σ_b Σ_a f a.succ b = Σ_b (f 0 b + Σ_a f a.succ b)
    rw [← ssum_add (fun b => f 0 b) (fun b => ssum (fun a => f a.succ b))]
    congr 1
    funext b
    rw [ssum_succ (fun a => f a b)]

end FSum

namespace Vec
variable {F : Field}

/-- **`combF` Fubini.** Combining `x` against the family `j ↦ (M j combined with g)` equals
combining `(combF x M)` against `g`: `Σⱼ xⱼ (Σᵢ Mⱼᵢ gᵢ) = Σᵢ (Σⱼ xⱼ Mⱼᵢ) gᵢ`. -/
theorem combF_combF {p ka kb : Nat} (x : Fin ka → F.carrier)
    (M : Fin ka → Vec F kb) (g : Fin kb → Vec F p) :
    combF x (fun j => combF (M j) g) = combF (combF x M) g := by
  funext coord
  show FSum.ssum (fun a => F.mul (x a) (FSum.ssum (fun b => F.mul (M a b) (g b coord))))
      = FSum.ssum (fun b => F.mul (FSum.ssum (fun a => F.mul (x a) (M a b))) (g b coord))
  -- pull x a inside, swap, pull g b coord out
  rw [show (fun a => F.mul (x a) (FSum.ssum (fun b => F.mul (M a b) (g b coord))))
        = (fun a => FSum.ssum (fun b => F.mul (x a) (F.mul (M a b) (g b coord))))
        from funext (fun a => (FSum.ssum_smul (x a) (fun b => F.mul (M a b) (g b coord))).symm)]
  rw [FSum.ssum_comm (fun a b => F.mul (x a) (F.mul (M a b) (g b coord)))]
  congr 1
  funext b
  rw [show (fun a => F.mul (x a) (F.mul (M a b) (g b coord)))
        = (fun a => F.mul (F.mul (x a) (M a b)) (g b coord))
        from funext (fun a => (F.mul_assoc (x a) (M a b) (g b coord)).symm)]
  -- Σ_a (x a · M a b)·(g b coord) = (Σ_a x a · M a b)·(g b coord)
  rw [show (fun a => F.mul (F.mul (x a) (M a b)) (g b coord))
        = (fun a => F.mul (g b coord) (F.mul (x a) (M a b)))
        from funext (fun a => F.mul_comm _ _)]
  rw [FSum.ssum_smul (g b coord) (fun a => F.mul (x a) (M a b))]
  exact F.mul_comm (g b coord) (FSum.ssum (fun a => F.mul (x a) (M a b)))

end Vec

namespace Vec
variable {F : Field}

/-- A nontrivial `combF`-dependence of `vs.get` yields list-level `dependent vs`. -/
theorem dependent_of_combF_zero {n : Nat} (vs : List (Vec F n))
    (x : Fin vs.length → F.carrier) (jx : Fin vs.length) (hjx : x jx ≠ F.zero)
    (hx : combF x (fun i => vs.get i) = zero F n) : dependent vs := by
  refine ⟨(List.finRange vs.length).map x, ?_, ?_, ?_⟩
  · rw [List.length_map, List.length_finRange]
  · exact ⟨x jx, by rw [List.mem_map]; exact ⟨jx, List.mem_finRange jx, rfl⟩, hjx⟩
  · rw [lcomb_finRange_eq_combF vs x]; exact hx

end Vec

/-- **Every basis of `Fn F n` has length ≤ n** (independent side, choice-free). -/
theorem basis_length_le {F : Field} [DecidableEq F.carrier] {n : Nat} {B : List (Vec F n)}
    (hB : IsBasis B) : B.length ≤ n :=
  Vec.steinitz_bound hB.indep

/-- **Every spanning list of `Fn F n` has length ≥ n** (spanning side, choice-free): if it
were shorter than `n`, the `n` standard basis vectors, coordinatized against it, would give
`n > length` columns in `F^{length}`, hence a dependence (`exists_dep_combF`) that lifts —
via `combF` Fubini and the `lcomb`/`combF` bridge — to a dependence of the standard basis,
contradicting `stdBasis_independent`. -/
theorem spanning_length_ge {F : Field} [DecidableEq F.carrier] {n : Nat} {S : List (Vec F n)}
    (hS : spans S) : n ≤ S.length := by
  apply Nat.le_of_not_lt
  intro hlt  -- S.length < n
  -- coordinatize the standard basis against S
  obtain ⟨cs, hcs⟩ := Vec.spans_coords hS (Vec.stdBasis F n)
  -- columns M j ∈ F^{S.length}, there are (stdBasis).length = n of them
  have hstdlen : (Vec.stdBasis F n).length = n := Vec.stdBasis_length F n
  -- length S < (stdBasis).length
  have hgt : S.length < (Vec.stdBasis F n).length := by rw [hstdlen]; exact hlt
  -- the coordinate columns
  let M : Fin (Vec.stdBasis F n).length → Vec F S.length :=
    fun j => fun i : Fin S.length => (cs j).getD i.val F.zero
  obtain ⟨x, ⟨jx, hjx⟩, hxM⟩ := Vec.exists_dep_combF M hgt
  -- lift to a dependence of the standard basis
  apply not_independent_of_dependent
    (Vec.dependent_of_combF_zero (Vec.stdBasis F n) x jx hjx ?_)
    (stdBasis_independent F n)
  -- show combF x (stdBasis.get) = 0
  have hbridge : (fun j => (Vec.stdBasis F n).get j)
      = (fun j => Vec.combF (M j) (fun i => S.get i)) := by
    funext j
    rw [← hcs j]
    exact Vec.lcomb_eq_combF_get S (cs j)
  rw [hbridge, Vec.combF_combF x M (fun i => S.get i), hxM]
  -- combF (zero) (S.get) = 0
  funext coord
  show FSum.ssum (fun i => F.mul ((Vec.zero F S.length) i) (S.get i coord)) = F.zero
  rw [show (fun i => F.mul ((Vec.zero F S.length) i) (S.get i coord))
        = (fun _ : Fin S.length => F.zero)
        from funext (fun i => F.zero_mul _)]
  exact FSum.ssum_const_zero

/-- **Every basis of `Fn F n` has length exactly `n`.** Upper bound from the independent
side (`steinitz_bound`), lower bound from the spanning side (`spanning_length_ge`). -/
theorem basis_length_eq {F : Field} [DecidableEq F.carrier] {n : Nat} {B : List (Vec F n)}
    (hB : IsBasis B) : B.length = n :=
  Nat.le_antisymm (basis_length_le hB) (spanning_length_ge hB.span)

/-- **`dimension_well_defined`**: dimension is a well-defined invariant.
Any two bases `B₁ B₂` of the standard space `Fn F n` have **equal length** — each is a
basis so each has length `n` (`basis_length_eq`), hence `|B₁| = |B₂|`. This is the corpus's
central linear-algebra claim (`dimension.md`: "all bases … have the same cardinality …
proved by the Steinitz exchange lemma"), here pinned so that the common length is exactly
`n = dim (Fn F n)` (witnessed by `stdBasis`, of length `n`). -/
theorem dimension_well_defined {F : Field} [DecidableEq F.carrier] {n : Nat}
    {B₁ B₂ : List (Vec F n)} (h₁ : IsBasis B₁) (h₂ : IsBasis B₂) :
    B₁.length = B₂.length := by
  rw [basis_length_eq h₁, basis_length_eq h₂]

/-- The standard basis exhibits the invariant: `dim (Fn F n) = n`, i.e. the canonical basis
`stdBasis` is a basis of length `n`, and (by `dimension_well_defined`) every basis matches
it. -/
theorem dim_Fn {F : Field} [DecidableEq F.carrier] (n : Nat) :
    (Vec.stdBasis F n).length = n ∧ IsBasis (Vec.stdBasis F n) :=
  ⟨Vec.stdBasis_length F n, stdBasis_isBasis F n⟩

/-! # =====================================================================
    # (K) A concrete worked rank–nullity over 𝔽₂ (boolField)
    # ===================================================================== -/

namespace BoolWorked

open RelMath.Algebra

/-- The 𝔽₂ vector `(a, b) : Fn boolField 2`. -/
def v2 (a b : Bool) : Vec boolField 2 := fun i => if i = 0 then a else b
/-- The 𝔽₂ vector `(a) : Fn boolField 1`. -/
def v1 (a : Bool) : Vec boolField 1 := fun _ => a

/-- **The worked linear map `T : 𝔽₂² → 𝔽₂¹`, `T (a,b) = (a + b)`** (the XOR/sum
functional). Both laws hold by `decide` over the finite field 𝔽₂. -/
def T : LinearMap (Fn boolField 2) (Fn boolField 1) where
  toFun := fun v => v1 (boolField.add (v 0) (v 1))
  map_add u v := by
    funext i
    show boolField.add (boolField.add (u 0) (v 0)) (boolField.add (u 1) (v 1))
        = boolField.add (boolField.add (u 0) (u 1)) (boolField.add (v 0) (v 1))
    rw [boolField.add_assoc, ← boolField.add_assoc (v 0),
        boolField.add_comm (v 0) (u 1), boolField.add_assoc, ← boolField.add_assoc]
  map_smul a v := by
    funext i
    show boolField.add (boolField.mul a (v 0)) (boolField.mul a (v 1))
        = boolField.mul a (boolField.add (v 0) (v 1))
    rw [boolField.left_distrib]

end BoolWorked

namespace BoolWorked

open RelMath.Algebra

/-- **Kernel basis** of `T`: the single vector `(1,1)`. -/
def kerBasis : List (Vec boolField 2) := [v2 true true]
/-- **Image basis** of `T`: the single vector `(1)`. -/
def imBasis : List (Vec boolField 1) := [v1 true]

/-- `(1,1)` lies in `Ker T`: `T (1,1) = 1 + 1 = 0`. -/
theorem kerBasis_in_ker : T.Ker (v2 true true) := by
  show v1 (boolField.add ((v2 true true) 0) ((v2 true true) 1)) = Vec.zero boolField 1
  funext i; rfl

/-- The kernel basis is **independent** (`[(1,1)]`, a single nonzero vector). -/
theorem kerBasis_indep : independent kerBasis := by
  intro cs hlen hzero c hc
  obtain ⟨c0, rfl⟩ := List.length_eq_one_iff.mp hlen
  have hz0 : (Vec.lcomb [c0] kerBasis) 0 = (Vec.zero boolField 2) 0 := congrFun hzero 0
  have hmul : boolField.add (boolField.mul c0 true) boolField.zero = boolField.zero := hz0
  have hc0 : c0 = boolField.zero := by
    cases c0 with
    | false => rfl
    | true => simp only [boolField] at hmul; exact absurd hmul (by decide)
  rcases List.mem_singleton.mp hc with h; rw [h]; exact hc0

/-- The kernel basis **spans** `Ker T`: every kernel vector is `c · (1,1)`. -/
theorem kerBasis_spans_ker (v : Vec boolField 2) (hv : T.Ker v) :
    ∃ cs : List boolField.carrier, Vec.lcomb cs kerBasis = v := by
  refine ⟨[v 0], ?_⟩
  -- v ∈ Ker ⟹ v 0 = v 1, so v = (v0)·(1,1)
  have hker : boolField.add (v 0) (v 1) = boolField.zero := congrFun hv 0
  have hv01 : v 1 = v 0 := by cases h0 : v 0 <;> cases h1 : v 1 <;> simp_all [boolField]
  funext i
  show (Vec.add (Vec.smul (v 0) (v2 true true)) (Vec.zero boolField 2)) i = v i
  rcases Fin.eq_zero_or_eq_succ i with hi | ⟨c, rfl⟩
  · subst hi
    show boolField.add (boolField.mul (v 0) true) boolField.zero = v 0
    rw [boolField.add_zero]; exact boolField.mul_one (v 0)
  · have hc0 : c = 0 := Fin.fin_one_eq_zero c
    subst hc0
    show boolField.add (boolField.mul (v 0) true) boolField.zero = v 1
    rw [boolField.add_zero]
    show boolField.mul (v 0) boolField.one = v 1
    rw [boolField.mul_one]; exact hv01.symm

/-- `(1)` lies in `Im T` (e.g. `T (1,0) = 1`). -/
theorem imBasis_in_im : T.Im (v1 true) := ⟨v2 true false, by funext i; rfl⟩

/-- The image basis is **independent**. -/
theorem imBasis_indep : independent imBasis := by
  intro cs hlen hzero c hc
  obtain ⟨c0, rfl⟩ := List.length_eq_one_iff.mp hlen
  have hz0 : (Vec.lcomb [c0] imBasis) 0 = (Vec.zero boolField 1) 0 := congrFun hzero 0
  have hmul : boolField.add (boolField.mul c0 true) boolField.zero = boolField.zero := hz0
  have hc0 : c0 = boolField.zero := by
    cases c0 with
    | false => rfl
    | true => simp only [boolField] at hmul; exact absurd hmul (by decide)
  rcases List.mem_singleton.mp hc with h; rw [h]; exact hc0

/-- The image basis **spans** `Im T` (it is all of `𝔽₂¹`). -/
theorem imBasis_spans_im (w : Vec boolField 1) (_ : T.Im w) :
    ∃ cs : List boolField.carrier, Vec.lcomb cs imBasis = w := by
  refine ⟨[w 0], ?_⟩
  funext i
  show (Vec.add (Vec.smul (w 0) (v1 true)) (Vec.zero boolField 1)) i = w i
  have hi : i = (0 : Fin 1) := Fin.fin_one_eq_zero i
  rw [hi]
  show boolField.add (boolField.mul (w 0) true) boolField.zero = w 0
  rw [boolField.add_zero]; exact boolField.mul_one (w 0)

/-- **`rank_nullity` witnessed over 𝔽₂.** For the worked map
`T : 𝔽₂² → 𝔽₂¹`, `T(a,b)=a+b`: the kernel has an independent spanning basis of length `1`
(nullity `= 1`, kernel `{(0,0),(1,1)}`) and the image has an independent spanning basis of
length `1` (rank `= 1`, image all of `𝔽₂¹`), so
`nullity + rank = 1 + 1 = 2 = dim (𝔽₂²)` — the rank–nullity theorem, computed.
(`linear-map.md`: `dim V = dim ker T + dim im T`.) -/
theorem rank_nullity_boolWorked :
    kerBasis.length + imBasis.length = 2
    ∧ independent kerBasis ∧ (∀ v, T.Ker v → ∃ cs, Vec.lcomb cs kerBasis = v)
    ∧ independent imBasis ∧ (∀ w, T.Im w → ∃ cs, Vec.lcomb cs imBasis = w) :=
  ⟨rfl, kerBasis_indep, kerBasis_spans_ker, imBasis_indep, imBasis_spans_im⟩

end BoolWorked

/-! # =====================================================================
    # (L) Canonical headline names
    # ===================================================================== -/

/-- **`steinitz_bound`** at the canonical name. An independent list of
vectors in `Fⁿ` has length at most any spanning list's length: since `stdBasis` (length
`n`) spans, this is `|indep| ≤ n`, and `n ≤ |span|` for every spanning list
(`spanning_length_ge`); composing, `|indep| ≤ |span|`. The exchange-lemma size bound of
`dimension.md`, choice-free. -/
theorem steinitz_bound {F : Field} [DecidableEq F.carrier] {n : Nat}
    {L S : List (Vec F n)} (hL : independent L) (hS : spans S) : L.length ≤ S.length :=
  Nat.le_trans (Vec.steinitz_bound hL) (spanning_length_ge hS)

/-- **`rank_nullity`** at the canonical name (concrete `𝔽₂` witness). For the
worked map `T : 𝔽₂² → 𝔽₂¹`, `nullity + rank = 1 + 1 = 2 = dim 𝔽₂²`, with the kernel and
image bases certified (independent + spanning their subspaces). See the honest scope note:
the general kernel-basis-extension form is stated concretely here over `𝔽₂`. -/
theorem rank_nullity :
    BoolWorked.kerBasis.length + BoolWorked.imBasis.length = 2
    ∧ independent BoolWorked.kerBasis
      ∧ (∀ v, BoolWorked.T.Ker v → ∃ cs, Vec.lcomb cs BoolWorked.kerBasis = v)
    ∧ independent BoolWorked.imBasis
      ∧ (∀ w, BoolWorked.T.Im w → ∃ cs, Vec.lcomb cs BoolWorked.imBasis = w) :=
  BoolWorked.rank_nullity_boolWorked

end LinAlg
end RelMath
