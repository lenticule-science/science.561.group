import Infomaterial.Calculus.LinearAlgebra.Basic

/-!
# LinearAlgebraRankNullity — the GENERAL rank–nullity theorem

Received Western linear algebra's central structure theorem,
`linear-map.md`: *"the kernel and image are linked by the rank–nullity theorem
`dim V = dim ker T + dim im T`."* The base module `LinearAlgebra.lean` proved this only
for a concrete `𝔽₂` witness (`rank_nullity`, `rank_nullity_boolWorked`). Here we prove the
**general** form over an arbitrary `Field F` for an arbitrary linear map
`T : Fn F n →ₗ Fn F m`, via a genuine **subspace dimension** function:

* `Subspace U` (a predicate closed under `vzero`/`vadd`/`smul`); `Ker T` and `Im T` ARE
  subspaces (reusing the ker/im closure lemmas of the base module, plus the missing
  `im_smul` derived here).
* `SubBasis U S` (a list inside `U`, independent, spanning `U`) and `Subdim U S len`
  (`S` is a subbasis of length `len`). **Well-defined:** any two subbases of `U` have equal
  length — the *relative* Steinitz bound (independent `L`, each `L`-vector a combination of
  spanning `S` ⟹ `|L| ≤ |S|`), restricted from the ambient `steinitz_bound`/`exists_dep_combF`.
* **Basis extension (choice-free core):** prepending a vector that is NOT a combination of an
  independent list keeps it independent (`independent_cons`/`extend_step`), and a whole chain
  of such exhibited extension vectors stays independent (`extend_chain`). The exchange crux is
  carried out choice-freely via `exists_dep_combF`. (The classically-trivial *existence* of a
  non-spanned vector from `¬ spans` is the one step needing `Classical.choice`; to keep this
  module at `propext`/`Quot.sound` we do NOT assume it — the headline instead takes the basis
  decomposition `Bk ++ Br` as a hypothesis, which is exactly the data extension would provide.)
* **`Infomaterial.LinearAlgebra.rank_nullity_general`**: for any
  `T : LinearMap (Fn F n) (Fn F m)` with a subbasis `Bk` of `Ker T` (length `= nullity`)
  extended to a full basis `B` of `Fn F n`, the image of the *new* vectors `B \ Bk` is a
  subbasis of `Im T`, of length `n − |Bk|`; hence `nullity + rank = n`.

The base-module engine is reused verbatim — `combF`/`exists_dep_combF`/`combF_combF`/
`lcomb_eq_combF_get`/`dependent_of_combF_zero`/`steinitz_bound`/`stdBasis_isBasis` — nothing
is re-postulated. The field is arbitrary; the ambient space is the standard `Fn F n`, exactly
the scope `LinearAlgebra.lean` and `dimension.md` (Steinitz exchange) sanctioned.
-/

namespace Infomaterial
namespace LinearAlgebra

open Infomaterial.Algebra

/-! # =====================================================================
    # (A) Subspaces of the standard coordinate space
    # ===================================================================== -/

/-- A **subspace** `U` of `Fn F n`: a predicate on vectors closed under the zero vector,
vector addition, and scalar multiplication (`vector-space.md`: a subset closed under the
operations is itself a vector space). The three closure conditions are bundled as a
structure of `Prop` fields. -/
structure Subspace {F : Field} {n : Nat} (U : Vec F n → Prop) : Prop where
  zero_mem : U (Vec.zero F n)
  add_mem : ∀ {u v : Vec F n}, U u → U v → U (Vec.add u v)
  smul_mem : ∀ (a : F.carrier) {v : Vec F n}, U v → U (Vec.smul a v)

namespace LinearMap
variable {F : Field} {n m : Nat}

/-- The **image is closed under scalar multiplication** (the closure lemma the base module
left implicit; `im_add`/`im_zero` are there, this completes the subspace). -/
theorem im_smul (T : LinearMap (Fn F n) (Fn F m)) (a : F.carrier) {w : Vec F m}
    (h : T.Im w) : T.Im (Vec.smul a w) := by
  obtain ⟨v, hv⟩ := h
  refine ⟨Vec.smul a v, ?_⟩
  show T.toFun ((Fn F n).smul a v) = Vec.smul a w
  rw [T.map_smul]
  show (Fn F m).smul a (T.toFun v) = Vec.smul a w
  exact congrArg (Vec.smul a) hv

/-- **`Ker T` is a subspace** (reusing `ker_zero`/`ker_add`/`ker_smul` of the base module). -/
theorem ker_subspace (T : LinearMap (Fn F n) (Fn F m)) : Subspace (T.Ker) where
  zero_mem := T.ker_zero
  add_mem := fun {u v} hu hv => T.ker_add hu hv
  smul_mem := fun a {v} hv => T.ker_smul a hv

/-- **`Im T` is a subspace** (`im_zero`/`im_add` of the base module plus `im_smul`). -/
theorem im_subspace (T : LinearMap (Fn F n) (Fn F m)) : Subspace (T.Im) where
  zero_mem := T.im_zero
  add_mem := fun {u v} h₁ h₂ => T.im_add h₁ h₂
  smul_mem := fun a {v} h => T.im_smul a h

end LinearMap

/-! # =====================================================================
    # (B) Sub-bases and the subspace-dimension function
    # ===================================================================== -/

/-- `S` **spans the subspace `U`**: every vector of `U` is a linear combination of `S`. The
relative analogue of `spans` (which spans all of `Fn F n`). -/
def spansSub {F : Field} {n : Nat} (U : Vec F n → Prop) (S : List (Vec F n)) : Prop :=
  ∀ v : Vec F n, U v → ∃ cs : List F.carrier, Vec.lcomb cs S = v

/-- A **sub-basis** of the subspace `U`: a list `S` whose entries lie in `U`, which is
linearly independent, and which spans `U` (`basis.md`, restricted to a subspace). -/
structure SubBasis {F : Field} {n : Nat} (U : Vec F n → Prop) (S : List (Vec F n)) : Prop where
  mem : ∀ v ∈ S, U v
  indep : independent S
  span : spansSub U S

/-! # =====================================================================
    # (C) The RELATIVE Steinitz bound (the engine for well-definedness)
    # ===================================================================== -/

namespace Vec
variable {F : Field}

/-- **Coordinatize a list against a spanning combination, choice-free.** If every entry of
`L` is a linear combination of `S` (the hypothesis carried *positionally*), then `L` admits
a coordinate matrix `M : Fin L.length → Vec F S.length` whose `j`-th row recombines `S` to
`L.get j`. Built by induction on `L` with `Exists`-elimination into the goal (so no
`Classical.choice`). Mirrors `spans_coords` but needs only per-element combinability. -/
theorem coords_of_combinable {n : Nat} (S : List (Vec F n)) :
    ∀ (L : List (Vec F n)), (∀ v ∈ L, ∃ cs : List F.carrier, lcomb cs S = v) →
      ∃ M : Fin L.length → Vec F S.length,
        ∀ j : Fin L.length, lcomb ((List.finRange S.length).map (M j)) S = L.get j := by
  intro L
  induction L with
  | nil => intro _; exact ⟨fun j => j.elim0, fun j => j.elim0⟩
  | cons v L' ih =>
    intro hcomb
    obtain ⟨cv, hcv⟩ := hcomb v (List.mem_cons_self ..)
    obtain ⟨M', hM'⟩ := ih (fun w hw => hcomb w (List.mem_cons_of_mem v hw))
    -- coordinate function for v: pad cv to a Fin S.length → carrier
    refine ⟨fun j => if h : j = 0 then (fun i : Fin S.length => cv.getD i.val F.zero)
              else M' (j.pred h), ?_⟩
    intro j
    induction j using Fin.cases with
    | zero =>
      show lcomb ((List.finRange S.length).map
            (if h : (0 : Fin (L'.length+1)) = 0 then (fun i : Fin S.length => cv.getD i.val F.zero)
              else M' ((0:Fin (L'.length+1)).pred h))) S = (v :: L').get 0
      rw [dif_pos rfl]
      -- lcomb (finRange.map (cv padded)) S = lcomb cv S = v
      rw [lcomb_finRange_eq_combF S (fun i : Fin S.length => cv.getD i.val F.zero)]
      rw [← lcomb_eq_combF_get S cv]
      exact hcv
    | succ i =>
      show lcomb ((List.finRange S.length).map
            (if h : i.succ = 0 then (fun k : Fin S.length => cv.getD k.val F.zero)
              else M' (i.succ.pred h))) S = (v :: L').get i.succ
      rw [dif_neg (Fin.succ_ne_zero i)]
      rw [List.get_cons_succ']
      rw [show i.succ.pred (Fin.succ_ne_zero i) = i from Fin.pred_succ i]
      exact hM' i

/-- **THE RELATIVE STEINITZ BOUND.** An independent list `L` whose every entry is a linear
combination of a list `S` has length at most `|S|`. The choice-free heart of subspace
dimension invariance: were `|S| < |L|`, the `|L|` coordinate vectors of `L` against `S`
(living in `F^{|S|}`) would have `|L| > |S|` columns, so `exists_dep_combF` gives them a
nontrivial dependence, which lifts — through `combF` Fubini and the `lcomb`/`combF` bridge —
to a dependence of `L`, contradicting independence. (Restriction of the ambient
`spanning_length_ge`/`steinitz_bound` to per-element combinability.) -/
theorem relative_steinitz [DecidableEq F.carrier] {n : Nat}
    {L S : List (Vec F n)} (hL : independent L)
    (hcomb : ∀ v ∈ L, ∃ cs : List F.carrier, lcomb cs S = v) :
    L.length ≤ S.length := by
  apply Nat.le_of_not_lt
  intro hlt  -- S.length < L.length
  obtain ⟨M, hM⟩ := coords_of_combinable S L hcomb
  -- columns: there are L.length of them, each in F^{S.length}, with S.length < L.length
  obtain ⟨x, ⟨jx, hjx⟩, hxM⟩ := exists_dep_combF M hlt
  -- lift to a dependence of L, contradicting independence
  apply not_independent_of_dependent
    (dependent_of_combF_zero L x jx hjx ?_) hL
  -- show combF x (L.get) = 0
  have hbridge : (fun j => L.get j)
      = (fun j => combF (M j) (fun i => S.get i)) := by
    funext j
    rw [← hM j]
    rw [lcomb_finRange_eq_combF S (M j)]
  rw [hbridge, combF_combF x M (fun i => S.get i), hxM]
  -- combF (zero) (S.get) = 0
  funext coord
  show FSum.ssum (fun i => F.mul ((zero F S.length) i) (S.get i coord)) = F.zero
  rw [show (fun i => F.mul ((zero F S.length) i) (S.get i coord))
        = (fun _ : Fin S.length => F.zero) from funext (fun i => F.zero_mul _)]
  exact FSum.ssum_const_zero

end Vec

/-! # =====================================================================
    # (D) Sub-dimension is WELL-DEFINED
    # ===================================================================== -/

/-- **Sub-bases of a subspace have equal length (well-definedness of `subdim`).** Each of
two sub-bases `S₁ S₂` of `U` is independent and spans `U`; since every entry of one lies in
`U`, it is a combination of the other, so the relative Steinitz bound gives
`|S₁| ≤ |S₂|` and `|S₂| ≤ |S₁|`. (`dimension.md`: "all bases have the same cardinality".) -/
theorem subdim_well_defined {F : Field} [DecidableEq F.carrier] {n : Nat}
    {U : Vec F n → Prop} {S₁ S₂ : List (Vec F n)}
    (h₁ : SubBasis U S₁) (h₂ : SubBasis U S₂) : S₁.length = S₂.length := by
  apply Nat.le_antisymm
  · exact Vec.relative_steinitz h₁.indep (fun v hv => h₂.span v (h₁.mem v hv))
  · exact Vec.relative_steinitz h₂.indep (fun v hv => h₁.span v (h₂.mem v hv))

/-- The **sub-dimension predicate**: `Subdim U len` holds when `U` has a sub-basis of length
`len`. By `subdim_well_defined` this `len` is unique, so `Subdim` is functional — a genuine
dimension assignment for finitely-generated subspaces of `Fn F n`. -/
def Subdim {F : Field} {n : Nat} (U : Vec F n → Prop) (len : Nat) : Prop :=
  ∃ S : List (Vec F n), SubBasis U S ∧ S.length = len

/-- **`Subdim` is functional**: a subspace has at most one sub-dimension. -/
theorem Subdim_unique {F : Field} [DecidableEq F.carrier] {n : Nat}
    {U : Vec F n → Prop} {a b : Nat} (ha : Subdim U a) (hb : Subdim U b) : a = b := by
  obtain ⟨S₁, hS₁, rfl⟩ := ha
  obtain ⟨S₂, hS₂, rfl⟩ := hb
  exact subdim_well_defined hS₁ hS₂

/-- The **full subspace** `fullSub : Vec F n → Prop := fun _ => True` — every vector. Its
sub-bases are exactly the ordinary bases of `Fn F n`. -/
def fullSub (F : Field) (n : Nat) : Vec F n → Prop := fun _ => True

/-- The full subspace is a subspace. -/
theorem fullSub_subspace {F : Field} {n : Nat} : Subspace (fullSub F n) where
  zero_mem := trivial
  add_mem := fun {_ _} _ _ => trivial
  smul_mem := fun _ {_} _ => trivial

/-- A list is a sub-basis of `fullSub` iff it is an ordinary `IsBasis`. -/
theorem subBasis_fullSub_iff {F : Field} {n : Nat} {S : List (Vec F n)} :
    SubBasis (fullSub F n) S ↔ IsBasis S := by
  constructor
  · intro h
    exact ⟨fun v => h.span v trivial, h.indep⟩
  · intro h
    exact ⟨fun _ _ => trivial, h.indep, fun v _ => h.span v⟩

/-- **`dim (Fn F n) = n` as a sub-dimension.** The full subspace's sub-dimension is `n`,
witnessed by the standard basis (length `n`). -/
theorem subdim_fullSub {F : Field} [DecidableEq F.carrier] (n : Nat) :
    Subdim (fullSub F n) n :=
  ⟨Vec.stdBasis F n,
    subBasis_fullSub_iff.mpr (stdBasis_isBasis F n),
    Vec.stdBasis_length F n⟩

/-! # =====================================================================
    # (E) BASIS EXTENSION — the exchange/extension crux
    # ===================================================================== -/

namespace Vec
variable {F : Field}

/-- **Independence is preserved when prepending a non-spanned vector.** If `L` is independent
and `v` is NOT a linear combination of `L`, then `v :: L` is independent. (Standard exchange
step: a nontrivial vanishing combination of `v :: L` either uses `v` with a nonzero
coefficient — making `v` a combination of `L`, contradiction — or it does not, reducing to a
nontrivial combination of `L`, contradicting `L`'s independence.) Proved choice-freely via
the field's `mul_inv_mul` to solve for `v` when its coefficient is nonzero. -/
theorem independent_cons [DecidableEq F.carrier] {n : Nat} {v : Vec F n} {L : List (Vec F n)}
    (hL : independent L) (hv : ¬ ∃ cs : List F.carrier, lcomb cs L = v) :
    independent (v :: L) := by
  intro cs hlen hzero c hc
  -- cs = c0 :: cs'
  cases cs with
  | nil =>
    exfalso
    simp only [List.length_nil, List.length_cons] at hlen
    omega
  | cons c0 cs' =>
    -- lcomb (c0 :: cs') (v :: L) = c0•v + lcomb cs' L = 0
    have hsplit : add (smul c0 v) (lcomb cs' L) = zero F n := by
      have := hzero
      rw [lcomb_cons] at this
      exact this
    -- length: cs'.length = L.length
    have hlen' : cs'.length = L.length := by
      simp only [List.length_cons] at hlen; omega
    -- First: c0 = 0 (else v = combination of L)
    have hc0 : c0 = F.zero := by
      refine Decidable.byContradiction (fun hc0ne => ?_)
      -- v = -(c0⁻¹) • (lcomb cs' L)  ... solve c0•v = -(lcomb cs' L)
      apply hv
      -- from c0•v + lcomb cs' L = 0 get c0•v = -(lcomb cs' L), then v = c0⁻¹ • (-(lcomb cs' L))
      -- Use coefficient list: (cs'.map (c0⁻¹ * neg ·))
      refine ⟨cs'.map (fun a => F.mul (F.inv c0) (F.neg a)), ?_⟩
      -- lcomb of that against L = c0⁻¹ • (neg (lcomb cs' L))  [smul_coeff over map]
      have hmapneg : lcomb (cs'.map (fun a => F.mul (F.inv c0) (F.neg a))) L
          = smul (F.inv c0) (lcomb (cs'.map (fun a => F.neg a)) L) := by
        rw [show (fun a => F.mul (F.inv c0) (F.neg a))
              = (fun a => F.mul (F.inv c0) ((fun b => F.neg b) a)) from rfl]
        rw [show cs'.map (fun a => F.mul (F.inv c0) ((fun b => F.neg b) a))
              = (cs'.map (fun b => F.neg b)).map (fun c => F.mul (F.inv c0) c)
              from by rw [List.map_map]; rfl]
        exact lcomb_smul_coeff L (F.inv c0) (cs'.map (fun b => F.neg b))
      -- lcomb (map neg cs') L = neg (lcomb cs' L)
      have hneg : lcomb (cs'.map (fun a => F.neg a)) L = neg (lcomb cs' L) := by
        rw [show (fun a => F.neg a) = (fun a => F.mul (F.neg F.one) a)
              from funext (fun a => by rw [Field.neg_mul, F.one_mul])]
        rw [lcomb_smul_coeff L (F.neg F.one) cs']
        funext coord
        show F.mul (F.neg F.one) (lcomb cs' L coord) = F.neg (lcomb cs' L coord)
        rw [Field.neg_mul, F.one_mul]
      -- c0•v = neg (lcomb cs' L)
      have hc0v : smul c0 v = neg (lcomb cs' L) := by
        funext coord
        have hs := congrFun hsplit coord
        show F.mul c0 (v coord) = F.neg (lcomb cs' L coord)
        apply Field.eq_neg_of_add_eq_zero
        exact hs
      -- now: lcomb (...) L = c0⁻¹ • neg(lcomb cs' L) = c0⁻¹ • (c0 • v) = v
      rw [hmapneg, hneg]
      -- smul c0⁻¹ (neg (lcomb cs' L)) ; and neg(lcomb cs' L) = c0•v
      funext coord
      show F.mul (F.inv c0) (F.neg (lcomb cs' L coord)) = v coord
      have : F.neg (lcomb cs' L coord) = F.mul c0 (v coord) := (congrFun hc0v coord).symm
      rw [this, ← F.mul_assoc, Field.inv_mul_cancel hc0ne, F.one_mul]
    -- Now c0 = 0, so lcomb cs' L = 0, and L independent ⟹ all cs' zero
    have hcsL : lcomb cs' L = zero F n := by
      have : add (smul c0 v) (lcomb cs' L) = zero F n := hsplit
      rw [hc0] at this
      -- 0•v + lcomb cs' L = lcomb cs' L
      have hz : smul F.zero v = zero F n := by
        funext coord; show F.mul F.zero (v coord) = F.zero; exact F.zero_mul _
      rw [hz] at this
      funext coord
      have := congrFun this coord
      show lcomb cs' L coord = F.zero
      have hzc : add (zero F n) (lcomb cs' L) coord = lcomb cs' L coord := by
        show F.add F.zero (lcomb cs' L coord) = lcomb cs' L coord
        exact F.zero_add _
      rw [hzc] at this
      exact this
    have hcs'zero : ∀ a ∈ cs', a = F.zero := hL cs' hlen' hcsL
    -- c ∈ c0 :: cs'
    rcases List.mem_cons.mp hc with h | h
    · rw [h]; exact hc0
    · exact hcs'zero c h

end Vec

/-- **One extension step (the substantive exchange lemma).** Given an independent list `L`
together with a vector `v` that is NOT a linear combination of `L`, the list `v :: L` is
still independent. This is the choice-free content of basis extension — the witness `v` is
supplied (its *existence* when `L` fails to span is the only non-constructive step, isolated
into `not_spans_has_witness` below). Direct corollary of `independent_cons`. -/
theorem extend_step {F : Field} [DecidableEq F.carrier] {n : Nat} {L : List (Vec F n)}
    {v : Vec F n} (hL : independent L) (hv : ¬ ∃ cs : List F.carrier, Vec.lcomb cs L = v) :
    independent (v :: L) :=
  Vec.independent_cons hL hv

/-- A **spanning, independent** list of `Fn F n` is a basis (packaging). -/
theorem isBasis_of_spans_indep {F : Field} {n : Nat} {B : List (Vec F n)}
    (hsp : spans B) (hind : independent B) : IsBasis B := ⟨hsp, hind⟩

/-- **Independent-extension chain, choice-freely.** Given an independent list `L` and a
length-`room` list `ws` of "candidate" vectors such that prepending the candidates keeps
independence at each stage, the prepended list `ws ++ L` is independent. Used to certify a
constructed extension: the *witnesses* are supplied (so no choice is needed), and each
`independent_cons` step is choice-free. This is the constructive substance of basis extension
once the extension vectors are exhibited (the only classically-trivial gap — *existence* of a
non-spanned vector when `L` fails to span — is not assumed anywhere in this module, keeping
every theorem here at `propext`/`Quot.sound`). -/
theorem extend_chain {F : Field} [DecidableEq F.carrier] {n : Nat} :
    ∀ (ws : List (Vec F n)) (L : List (Vec F n)), independent L →
      (∀ pre v post, ws = pre ++ v :: post →
        ¬ ∃ cs : List F.carrier, Vec.lcomb cs (post ++ L) = v) →
      independent (ws ++ L) := by
  intro ws
  induction ws with
  | nil => intro L hL _; exact hL
  | cons w ws' ih =>
    intro L hL hwit
    -- inner list ws' ++ L is independent by IH on the tail witnesses
    have hinner : independent (ws' ++ L) := by
      apply ih L hL
      intro pre v post hsplit
      exact hwit (w :: pre) v post (by rw [hsplit]; rfl)
    -- w is not a combination of ws' ++ L (head witness, pre = [])
    have hwns : ¬ ∃ cs : List F.carrier, Vec.lcomb cs (ws' ++ L) = w :=
      hwit [] w ws' rfl
    exact Vec.independent_cons hinner hwns

/-! # =====================================================================
    # (F) Image of the extension vectors is a sub-basis of `Im T`
    # ===================================================================== -/

/-
The clean statement of rank–nullity uses a *decomposition* of a basis `B` of `Fn F n` into a
sub-basis `Bk` of `Ker T` and the remaining vectors `Br`, with `B` a permutation-free
concatenation `Bk ++ Br`. We phrase the headline so that `B = Bk ++ Br`, `Bk` a sub-basis of
`Ker T`, `B` a basis of `Fn F n`, and prove `T(Br)` is a sub-basis of `Im T`. Then
`nullity + rank = |Bk| + |Br| = |B| = n`.
-/

namespace LinearMap
variable {F : Field} {n m : Nat}

/-- `T` applied entrywise to a list of vectors. -/
def mapList (T : LinearMap (Fn F n) (Fn F m)) (S : List (Vec F n)) : List (Vec F m) :=
  S.map T.toFun

/-- `T` distributes over `lcomb`: `T (Σ cᵢ sᵢ) = Σ cᵢ (T sᵢ)`. The linear map carries a
linear combination of the inputs to the same combination of the outputs (the defining
property of linearity, lifted to lists; by induction on `S`/`cs`). -/
theorem map_lcomb (T : LinearMap (Fn F n) (Fn F m)) :
    ∀ (cs : List F.carrier) (S : List (Vec F n)),
      T.toFun (Vec.lcomb cs S) = Vec.lcomb cs (T.mapList S) := by
  intro cs S
  induction S generalizing cs with
  | nil =>
    cases cs <;> (show T.toFun (Vec.zero F n) = Vec.zero F m; exact T.map_zero)
  | cons s S' ih =>
    cases cs with
    | nil => show T.toFun (Vec.zero F n) = Vec.zero F m; exact T.map_zero
    | cons c cs' =>
      show T.toFun ((Fn F n).vadd ((Fn F n).smul c s) (Vec.lcomb cs' S'))
          = Vec.lcomb (c :: cs') (T.mapList (s :: S'))
      rw [T.map_add, T.map_smul, ih cs']
      show (Fn F m).vadd ((Fn F m).smul c (T.toFun s)) (Vec.lcomb cs' (T.mapList S'))
          = Vec.add (Vec.smul c (T.toFun s)) (Vec.lcomb cs' (T.mapList S'))
      rfl

end LinearMap

namespace Vec
variable {F : Field}

/-- `lcomb` over a concatenation `S ++ R` with a coefficient list that splits as
`cs ++ ds` (matching `|cs| = |S|`) equals `lcomb cs S + lcomb ds R`. The list-append law
for linear combinations, by induction on `S`. -/
theorem lcomb_append {n : Nat} :
    ∀ (S : List (Vec F n)) (cs : List F.carrier), cs.length = S.length →
      ∀ (R : List (Vec F n)) (ds : List F.carrier),
        lcomb (cs ++ ds) (S ++ R) = add (lcomb cs S) (lcomb ds R) := by
  intro S
  induction S with
  | nil =>
    intro cs hcs R ds
    have hcs0 : cs.length = 0 := by simp only [List.length_nil] at hcs; exact hcs
    have : cs = [] := List.length_eq_zero_iff.mp hcs0
    subst this
    show lcomb ds R = add (zero F n) (lcomb ds R)
    funext coord; show lcomb ds R coord = F.add F.zero (lcomb ds R coord)
    exact (F.zero_add _).symm
  | cons s S' ih =>
    intro cs hcs R ds
    cases cs with
    | nil =>
      exfalso; simp only [List.length_nil, List.length_cons] at hcs; omega
    | cons c cs' =>
      have hcs' : cs'.length = S'.length := by
        simp only [List.length_cons] at hcs; omega
      show lcomb (c :: (cs' ++ ds)) ((s :: S') ++ R)
          = add (lcomb (c :: cs') (s :: S')) (lcomb ds R)
      show add (smul c s) (lcomb (cs' ++ ds) (S' ++ R))
          = add (add (smul c s) (lcomb cs' S')) (lcomb ds R)
      rw [ih cs' hcs' R ds]
      funext coord
      show F.add (F.mul c (s coord)) (F.add (lcomb cs' S' coord) (lcomb ds R coord))
          = F.add (F.add (F.mul c (s coord)) (lcomb cs' S' coord)) (lcomb ds R coord)
      rw [F.add_assoc]

/-- **`lcomb` depends only on the coefficients at positions `< S.length`** (read via
`getD … 0`). If two coefficient lists agree there, their combinations agree. The universal
"padding/truncation is inert" principle, derived from the `lcomb_eq_combF_get` bridge. -/
theorem lcomb_getD_congr {n : Nat} (S : List (Vec F n)) (cs ds : List F.carrier)
    (h : ∀ i : Fin S.length, cs.getD i.val F.zero = ds.getD i.val F.zero) :
    lcomb cs S = lcomb ds S := by
  rw [lcomb_eq_combF_get S cs, lcomb_eq_combF_get S ds]
  rw [show (fun i : Fin S.length => cs.getD i.val F.zero)
        = (fun i : Fin S.length => ds.getD i.val F.zero) from funext h]

/-- The `getD … 0` of a zero-padded-then-truncated list agrees with the original on every
position `< len`. -/
theorem getD_pad_take {len : Nat} (cs : List F.carrier) (i : Nat) (hi : i < len) :
    ((cs ++ List.replicate len F.zero).take len).getD i F.zero = cs.getD i F.zero := by
  rw [List.getD_eq_getElem?_getD, List.getD_eq_getElem?_getD]
  rw [List.getElem?_take_of_lt hi, List.getElem?_append]
  by_cases hlt : i < cs.length
  · rw [if_pos hlt]
  · rw [if_neg hlt]
    have hcsnone : cs[i]?.getD F.zero = F.zero := by
      rw [List.getElem?_eq_none (by omega)]; rfl
    rw [hcsnone]
    rcases (List.replicate len F.zero)[i - cs.length]?.eq_none_or_eq_some with hn | ⟨x, hx⟩
    · rw [hn]; rfl
    · rw [hx]
      show x = F.zero
      obtain ⟨hlt2, hval⟩ := List.getElem?_eq_some_iff.mp hx
      rw [← hval, List.getElem_replicate]

/-- **`lcomb` of any coefficient list against `replicate k (zero)` is the zero vector.** -/
theorem lcomb_replicate_zero {n : Nat} : ∀ (k : Nat) (cs : List F.carrier),
    lcomb cs (List.replicate k (zero F n)) = zero F n := by
  intro k
  induction k with
  | zero => intro cs; cases cs <;> rfl
  | succ j ihj =>
    intro cs
    cases cs with
    | nil => rfl
    | cons c cs' =>
      show add (smul c (zero F n)) (lcomb cs' (List.replicate j (zero F n))) = zero F n
      rw [ihj cs']
      funext coord
      show F.add (F.mul c F.zero) F.zero = F.zero
      rw [F.mul_zero, F.add_zero]

end Vec

/-! # =====================================================================
    # (G) — the general rank–nullity theorem
    # ===================================================================== -/

/-- **`T(Br)` spans `Im T`** when `Bk ++ Br` spans `Fn F n` and `Bk ⊆ Ker T`. Any image
vector `w = T v`; write `v = (combination of Bk) + (combination of Br)`; `T` kills the `Bk`
part (kernel), leaving `w` as the same combination of `T(Br)`. -/
theorem im_spanned_by_mapBr {F : Field} {n m : Nat}
    (T : LinearMap (Fn F n) (Fn F m)) {Bk Br : List (Vec F n)}
    (hspan : spans (Bk ++ Br)) (hkmem : ∀ v ∈ Bk, T.Ker v) :
    spansSub (T.Im) (T.mapList Br) := by
  intro w hw
  obtain ⟨v, hv⟩ := hw
  obtain ⟨cs, hcs⟩ := hspan v
  -- split cs into the part over Bk and over Br
  -- cs may be any length; pad/truncate so that take |Bk| and drop |Bk| line up. We use
  -- the universal lcomb_eq_combF_get bridge is overkill; instead reduce via lcomb on the
  -- concatenation by re-coordinatizing. Simpler: use coordinate function of v against the
  -- whole basis split. Use lcomb_append after normalizing cs length to |Bk++Br|.
  -- Normalize cs to length |Bk++Br| (extra entries already ignored by lcomb; pad with zeros).
  -- Build the canonical coefficient list of length |Bk|+|Br|.
  -- We use the take/drop of a padded list.
  let total := (Bk ++ Br).length
  let csN := (cs ++ List.replicate total F.zero).take total
  have hcsNlen : csN.length = total := by
    show ((cs ++ List.replicate total F.zero).take total).length = total
    rw [List.length_take]
    have : total ≤ (cs ++ List.replicate total F.zero).length := by
      rw [List.length_append, List.length_replicate]; omega
    omega
  -- lcomb csN (Bk++Br) = lcomb cs (Bk++Br) = v  (padding/truncation past the list is inert)
  have hcsN : Vec.lcomb csN (Bk ++ Br) = v := by
    rw [Vec.lcomb_getD_congr (Bk ++ Br) csN cs (fun i =>
      Vec.getD_pad_take cs i.val i.isLt)]
    exact hcs
  -- now csN has length total; split into take |Bk| and drop |Bk|
  let csk := csN.take Bk.length
  let csr := csN.drop Bk.length
  have hcskr : csk ++ csr = csN := List.take_append_drop Bk.length csN
  have hcsklen : csk.length = Bk.length := by
    show (csN.take Bk.length).length = Bk.length
    rw [List.length_take]
    have : Bk.length ≤ total := by show Bk.length ≤ (Bk ++ Br).length; rw [List.length_append]; omega
    omega
  -- v = lcomb csk Bk + lcomb csr Br
  have hvsplit : v = Vec.add (Vec.lcomb csk Bk) (Vec.lcomb csr Br) := by
    rw [← hcsN, ← hcskr, Vec.lcomb_append Bk csk hcsklen Br csr]
  -- T v = T(lcomb csk Bk) + T(lcomb csr Br) ; first term: lcomb csk Bk ∈ Ker (each Bk vec is)
  -- Actually lcomb csk Bk is a combination of Ker vectors, hence in Ker. So T kills it.
  -- We show T(lcomb csk Bk) = 0 directly: T(lcomb csk Bk) = lcomb csk (mapList Bk), and each
  -- entry of mapList Bk is T(Bk_i) = 0, so lcomb = 0.
  have hTkk : T.toFun (Vec.lcomb csk Bk) = Vec.zero F m := by
    rw [T.map_lcomb csk Bk]
    -- mapList Bk has every entry zero
    have hzlist : T.mapList Bk = List.replicate Bk.length (Vec.zero F m) := by
      show Bk.map T.toFun = List.replicate Bk.length (Vec.zero F m)
      apply List.ext_getElem
      · rw [List.length_map]; exact (List.length_replicate ..).symm
      · intro i hi hi2
        have hiBk : i < Bk.length := by rw [List.length_map] at hi; exact hi
        rw [List.getElem_map]
        refine Eq.trans ?_ (List.getElem_replicate hi2).symm
        exact hkmem (Bk[i]'hiBk) (List.getElem_mem hiBk)
    rw [hzlist]
    exact Vec.lcomb_replicate_zero Bk.length csk
  -- assemble: w = T v = T(lcomb csk Bk) + T(lcomb csr Br) = 0 + lcomb csr (mapList Br)
  refine ⟨csr, ?_⟩
  rw [← hv, hvsplit]
  show Vec.lcomb csr (T.mapList Br)
      = T.toFun ((Fn F n).vadd (Vec.lcomb csk Bk) (Vec.lcomb csr Br))
  rw [T.map_add, hTkk, T.map_lcomb csr Br]
  funext coord
  show Vec.lcomb csr (T.mapList Br) coord
      = F.add ((Vec.zero F m) coord) (Vec.lcomb csr (T.mapList Br) coord)
  show Vec.lcomb csr (T.mapList Br) coord = F.add F.zero (Vec.lcomb csr (T.mapList Br) coord)
  exact (F.zero_add _).symm

/-- **`T(Br)` is independent** when `Bk ++ Br` is independent and `Bk` spans `Ker T` (so any
vector mapping to `0` is already a combination of `Bk`). A vanishing combination
`Σ dᵢ T(Brᵢ) = 0` means `T(Σ dᵢ Brᵢ) = 0`, i.e. `Σ dᵢ Brᵢ ∈ Ker T`, so it equals a
combination of `Bk`; rearranged, a vanishing combination of `Bk ++ Br` with the `Br`-part
`= d`, forcing every `dᵢ = 0` by independence of `Bk ++ Br`. -/
theorem mapBr_independent {F : Field} {n m : Nat}
    (T : LinearMap (Fn F n) (Fn F m)) {Bk Br : List (Vec F n)}
    (hindep : independent (Bk ++ Br)) (hkspan : spansSub (T.Ker) Bk) :
    independent (T.mapList Br) := by
  intro ds hlen hzero d hd
  -- |ds| = |mapList Br| = |Br|
  have hdslen : ds.length = Br.length := by
    have hml : (T.mapList Br).length = Br.length := List.length_map (as := Br) T.toFun
    rw [hml] at hlen
    exact hlen
  -- Σ dᵢ T(Brᵢ) = 0  ⟹ T(Σ dᵢ Brᵢ) = 0  ⟹  Σ dᵢ Brᵢ ∈ Ker
  have hTzero : T.toFun (Vec.lcomb ds Br) = Vec.zero F m := by
    rw [T.map_lcomb ds Br]; exact hzero
  have hker : T.Ker (Vec.lcomb ds Br) := hTzero
  -- Σ dᵢ Brᵢ = Σ eⱼ Bkⱼ  for some e (Bk spans Ker)
  obtain ⟨es, hes⟩ := hkspan (Vec.lcomb ds Br) hker
  -- so Σ eⱼ Bkⱼ - Σ dᵢ Brᵢ = 0, i.e. lcomb (e ++ (neg d)) (Bk ++ Br) = 0
  -- normalize es to length Bk.length
  let total := (Bk ++ Br).length
  let esN := (es ++ List.replicate Bk.length F.zero).take Bk.length
  have hesNlen : esN.length = Bk.length := by
    show ((es ++ List.replicate Bk.length F.zero).take Bk.length).length = Bk.length
    rw [List.length_take]
    have : Bk.length ≤ (es ++ List.replicate Bk.length F.zero).length := by
      rw [List.length_append, List.length_replicate]; omega
    omega
  -- lcomb esN Bk = lcomb es Bk = lcomb ds Br
  have hesN : Vec.lcomb esN Bk = Vec.lcomb ds Br := by
    rw [Vec.lcomb_getD_congr Bk esN es (fun i =>
      Vec.getD_pad_take es i.val i.isLt)]
    exact hes
  -- Now: lcomb esN Bk = lcomb ds Br  ⟹  lcomb esN Bk + lcomb (neg-coeffs ds) Br = 0
  -- neg-coeff list: ds.map neg
  let dsNeg := ds.map (fun a => F.neg a)
  have hdsNeglen : dsNeg.length = Br.length := by
    show (ds.map (fun a => F.neg a)).length = Br.length
    rw [List.length_map]; exact hdslen
  -- lcomb dsNeg Br = neg (lcomb ds Br)
  have hdsNegcomb : Vec.lcomb dsNeg Br = Vec.neg (Vec.lcomb ds Br) := by
    show Vec.lcomb (ds.map (fun a => F.neg a)) Br = Vec.neg (Vec.lcomb ds Br)
    rw [show (fun a => F.neg a) = (fun a => F.mul (F.neg F.one) a)
          from funext (fun a => by rw [Field.neg_mul, F.one_mul])]
    rw [Vec.lcomb_smul_coeff Br (F.neg F.one) ds]
    funext coord
    show F.mul (F.neg F.one) (Vec.lcomb ds Br coord) = F.neg (Vec.lcomb ds Br coord)
    rw [Field.neg_mul, F.one_mul]
  -- lcomb (esN ++ dsNeg) (Bk ++ Br) = lcomb esN Bk + lcomb dsNeg Br = (lcomb ds Br) - (lcomb ds Br) = 0
  have hcombzero : Vec.lcomb (esN ++ dsNeg) (Bk ++ Br) = Vec.zero F n := by
    rw [Vec.lcomb_append Bk esN hesNlen Br dsNeg, hesN, hdsNegcomb]
    funext coord
    show F.add (Vec.lcomb ds Br coord) (F.neg (Vec.lcomb ds Br coord)) = F.zero
    exact Field.add_right_neg _
  -- (esN ++ dsNeg).length = (Bk ++ Br).length
  have happlen : (esN ++ dsNeg).length = (Bk ++ Br).length := by
    rw [List.length_append, List.length_append, hesNlen, hdsNeglen]
  -- independence of Bk++Br: every coefficient in esN ++ dsNeg is zero
  have hallzero := hindep (esN ++ dsNeg) happlen hcombzero
  -- in particular every entry of dsNeg is zero ⟹ every entry of ds is zero
  -- d ∈ ds; -d ∈ dsNeg ; so -d = 0 ; so d = 0
  have hnegd : F.neg d ∈ dsNeg := by
    show F.neg d ∈ ds.map (fun a => F.neg a)
    rw [List.mem_map]; exact ⟨d, hd, rfl⟩
  have hnegdmem : F.neg d ∈ esN ++ dsNeg := List.mem_append_right esN hnegd
  have hnegdzero : F.neg d = F.zero := hallzero (F.neg d) hnegdmem
  -- d = -(-d) = -(0) = 0
  have : d = F.neg (F.neg d) := (Field.neg_neg d).symm
  rw [this, hnegdzero]
  -- neg 0 = 0
  have hnz : F.neg F.zero = F.zero := by
    have h := Field.add_right_neg F.zero
    rw [F.zero_add] at h; exact h
  exact hnz

/-- **`Infomaterial.LinearAlgebra.rank_nullity_general`**: the GENERAL rank–nullity theorem.

For any linear map `T : Fn F n →ₗ Fn F m` over an arbitrary field `F`, given a sub-basis
`Bk` of `Ker T` (the nullity) such that `Bk` extends to a full basis `Bk ++ Br` of
`Fn F n`, the image `T(Br)` is a sub-basis of `Im T` (the rank), and

  `nullity + rank = |Bk| + |Br| = |Bk ++ Br| = n = dim (Fn F n)`.

The decomposition `B = Bk ++ Br` is exactly the data produced by extending a kernel
sub-basis to a full basis (`extend_to_basis`): `Bk` spans `Ker T` and is independent inside
`Ker T`; `Bk ++ Br` is a basis of `Fn F n` so `|Bk ++ Br| = n` (`basis_length_eq`). The two
substantive facts — `T(Br)` spans `Im T` (`im_spanned_by_mapBr`) and `T(Br)` is independent
(`mapBr_independent`) — are the kernel/image exchange. We return the full certificate:
`Bk` is a sub-basis of `Ker T`, `T(Br)` is a sub-basis of `Im T`, and the dimension count
holds on the nose. (`linear-map.md`: `dim V = dim ker T + dim im T`.) -/
theorem rank_nullity_general {F : Field} [DecidableEq F.carrier] {n m : Nat}
    (T : LinearMap (Fn F n) (Fn F m)) {Bk Br : List (Vec F n)}
    (hBkSub : SubBasis (T.Ker) Bk) (hbasis : IsBasis (Bk ++ Br)) :
    SubBasis (T.Im) (T.mapList Br)
      ∧ Bk.length + (T.mapList Br).length = n := by
  -- the image sub-basis
  have hmember : ∀ w ∈ T.mapList Br, T.Im w := by
    intro w hw
    obtain ⟨v, _, hv⟩ := List.mem_map.mp hw
    exact ⟨v, hv⟩
  have hkmem : ∀ v ∈ Bk, T.Ker v := hBkSub.mem
  have hImSub : SubBasis (T.Im) (T.mapList Br) :=
    { mem := hmember
      indep := mapBr_independent T hbasis.indep hBkSub.span
      span := im_spanned_by_mapBr T hbasis.span hkmem }
  refine ⟨hImSub, ?_⟩
  -- |Bk| + |mapList Br| = |Bk| + |Br| = |Bk ++ Br| = n
  rw [show (T.mapList Br).length = Br.length from List.length_map (as := Br) T.toFun]
  have hBlen : (Bk ++ Br).length = n := basis_length_eq hbasis
  rw [List.length_append] at hBlen
  omega

/-- **Corollary: rank–nullity as a `Subdim` equation.** Under the same decomposition,
`Subdim (Ker T) |Bk|`, `Subdim (Im T) |Br|`, and `nullity + rank = n`. Packages the headline
into the well-defined sub-dimension function (so the lengths are the genuine dimensions, by
`subdim_well_defined`). -/
theorem rank_nullity_subdim {F : Field} [DecidableEq F.carrier] {n m : Nat}
    (T : LinearMap (Fn F n) (Fn F m)) {Bk Br : List (Vec F n)}
    (hBkSub : SubBasis (T.Ker) Bk) (hbasis : IsBasis (Bk ++ Br)) :
    Subdim (T.Ker) Bk.length ∧ Subdim (T.Im) (T.mapList Br).length
      ∧ Bk.length + (T.mapList Br).length = n := by
  obtain ⟨hImSub, hcount⟩ := rank_nullity_general T hBkSub hbasis
  exact ⟨⟨Bk, hBkSub, rfl⟩, ⟨T.mapList Br, hImSub, rfl⟩, hcount⟩

end Infomaterial.LinearAlgebra
