import Obsmetrologia.Language.Predicating.CurryHowardLambek

/-!
# Predicating.NormalOrder — the one-step reducts, normal order and normal forms, computed

`CurryHowardLambek` gives the simply-typed λ-calculus with products as relations: one-step
reduction `step`, its closure `Red`, and Church–Rosser. This module computes what those
relations determine, so that a term's reducts and its normal form can be read off rather than
only reasoned about:

* `Tm.reducts` — every one-step reduct of a term. The root contraction comes first, then each
  immediate subterm's reducts from left to right, each term once.
* `Tm.stepNO` — the normal-order step: the leftmost-outermost contraction.
* `Tm.normalize` — normal-order reduction under fuel.
* `Tm.lift` — the shift of every free variable by `k`.

## Main results

* `mem_reducts_iff` — `u ∈ t.reducts ↔ step t u`: the list is the one-step relation, sound and
  complete.
* `stepNO_sound`, `stepNO_none` — a normal-order step is a step, and normal order stops only at
  a normal form.
* `normalize_red`, `normalize_normal` — normalization reduces to a normal form.
* `normalize_unique` — that normal form is the term's only one: any reduct of the term in
  normal form is it (by `church_rosser`).

Every proof is structural; nothing here depends on `propext` or `Classical.choice`.

## References

H. P. Barendregt, *The Lambda Calculus: Its Syntax and Semantics* (1984), §13.2 (normal-order
strategy); M. Takahashi, "Parallel reductions in λ-calculus", Inf. Comput. 118 (1995).
-/

namespace Obsmetrologia
namespace Predicating.CurryHowardLambek

namespace Tm

/-! ## Lists, structurally -/

/-- Each element once, keeping its first occurrence. -/
def dedup : List Tm → List Tm
  | [] => []
  | x :: xs => if xs.contains x then x :: (dedup xs).filter (fun y => !(y == x)) else x :: dedup xs

theorem beq_tm_iff {a b : Tm} : (a == b) = true ↔ a = b :=
  ⟨fun h => of_decide_eq_true h, fun h => decide_eq_true h⟩

theorem mem_filter_ne {x y : Tm} : ∀ {l : List Tm},
    x ∈ l.filter (fun z => !(z == y)) ↔ x ∈ l ∧ x ≠ y
  | [] => ⟨fun h => (nomatch h), fun h => (nomatch h.1)⟩
  | a :: as => by
    unfold List.filter
    cases hb : !(a == y) with
    | true =>
      have hay : a ≠ y := fun e => by rw [e] at hb; exact absurd hb (by rw [beq_tm_iff.mpr rfl]; decide)
      constructor
      · intro h
        match h with
        | .head _ => exact ⟨List.Mem.head _, hay⟩
        | .tail _ h' => let r := mem_filter_ne.mp h'; exact ⟨List.Mem.tail _ r.1, r.2⟩
      · intro ⟨h, hne⟩
        match h with
        | .head _ => exact List.Mem.head _
        | .tail _ h' => exact List.Mem.tail _ (mem_filter_ne.mpr ⟨h', hne⟩)
    | false =>
      have hay : a = y := by
        cases h : (a == y) with
        | true => exact beq_tm_iff.mp h
        | false => rw [h] at hb; exact nomatch hb
      constructor
      · intro h
        let r := mem_filter_ne.mp h
        exact ⟨List.Mem.tail _ r.1, r.2⟩
      · intro ⟨h, hne⟩
        match h with
        | .head _ => exact absurd hay hne
        | .tail _ h' => exact mem_filter_ne.mpr ⟨h', hne⟩

theorem mem_dedup {x : Tm} : ∀ {l : List Tm}, x ∈ dedup l ↔ x ∈ l
  | [] => Iff.rfl
  | a :: as => by
    unfold dedup
    by_cases hc : as.contains a = true
    · rw [if_pos hc]
      constructor
      · intro h
        match h with
        | .head _ => exact List.Mem.head _
        | .tail _ h' => exact List.Mem.tail _ (mem_dedup.mp (mem_filter_ne.mp h').1)
      · intro h
        match h with
        | .head _ => exact List.Mem.head _
        | .tail _ h' =>
          by_cases e : x = a
          · rw [e]; exact List.Mem.head _
          · exact List.Mem.tail _ (mem_filter_ne.mpr ⟨mem_dedup.mpr h', e⟩)
    · rw [if_neg hc]
      constructor
      · intro h
        match h with
        | .head _ => exact List.Mem.head _
        | .tail _ h' => exact List.Mem.tail _ (mem_dedup.mp h')
      · intro h
        match h with
        | .head _ => exact List.Mem.head _
        | .tail _ h' => exact List.Mem.tail _ (mem_dedup.mpr h')

theorem mem_append_iff {x : Tm} : ∀ {l r : List Tm}, x ∈ l ++ r ↔ x ∈ l ∨ x ∈ r
  | [], _ => ⟨Or.inr, fun h => (match h with | Or.inl h => nomatch h | Or.inr h => h)⟩
  | a :: as, r => by
    constructor
    · intro h
      match h with
      | .head _ => exact Or.inl (List.Mem.head _)
      | .tail _ h' =>
        match (mem_append_iff (l := as) (r := r)).mp h' with
        | Or.inl h'' => exact Or.inl (List.Mem.tail _ h'')
        | Or.inr h'' => exact Or.inr h''
    · intro h
      match h with
      | Or.inl (.head _) => exact List.Mem.head _
      | Or.inl (.tail _ h') => exact List.Mem.tail _ (mem_append_iff.mpr (Or.inl h'))
      | Or.inr h' => exact List.Mem.tail _ (mem_append_iff.mpr (Or.inr h'))

theorem mem_map_iff {f : Tm → Tm} {y : Tm} : ∀ {l : List Tm}, y ∈ l.map f ↔ ∃ x, x ∈ l ∧ f x = y
  | [] => ⟨fun h => (nomatch h), fun h => (match h with | ⟨_, h', _⟩ => nomatch h')⟩
  | a :: as => by
    constructor
    · intro h
      cases h with
      | head => exact ⟨a, List.Mem.head _, rfl⟩
      | tail _ h' => let ⟨x, hx, e⟩ := mem_map_iff.mp h'; exact ⟨x, List.Mem.tail _ hx, e⟩
    · intro ⟨x, hx, e⟩
      cases hx with
      | head => rw [← e]; exact List.Mem.head _
      | tail _ hx' => exact List.Mem.tail _ (mem_map_iff.mpr ⟨x, hx', e⟩)

/-! ## The one-step reducts -/

/-- The root β-contraction of an application, if its function is an abstraction. -/
def rootApp : Tm → Tm → List Tm
  | lam b, u => [inst b u]
  | var _, _ => []
  | app _ _, _ => []
  | pair _ _, _ => []
  | fst _, _ => []
  | snd _, _ => []
  | star, _ => []

/-- The root first projection, if its argument is a pair. -/
def rootFst : Tm → List Tm
  | pair a _ => [a]
  | var _ => []
  | lam _ => []
  | app _ _ => []
  | fst _ => []
  | snd _ => []
  | star => []

/-- The root second projection, if its argument is a pair. -/
def rootSnd : Tm → List Tm
  | pair _ b => [b]
  | var _ => []
  | lam _ => []
  | app _ _ => []
  | fst _ => []
  | snd _ => []
  | star => []

/-- **Every one-step reduct**: the root contraction first, then each immediate subterm's
reducts from left to right, each term once. -/
def reducts : Tm → List Tm
  | var _ => []
  | star => []
  | lam t => dedup ((reducts t).map lam)
  | app t u => dedup (rootApp t u ++ (reducts t).map (fun t' => app t' u) ++ (reducts u).map (app t))
  | pair t u => dedup ((reducts t).map (fun t' => pair t' u) ++ (reducts u).map (pair t))
  | fst t => dedup (rootFst t ++ (reducts t).map fst)
  | snd t => dedup (rootSnd t ++ (reducts t).map snd)

theorem mem_rootApp {t u v : Tm} : v ∈ rootApp t u ↔ ∃ b, t = lam b ∧ v = inst b u := by
  cases t with
  | lam b =>
    constructor
    · intro h
      cases h with
      | head => exact ⟨b, rfl, rfl⟩
      | tail _ h' => exact nomatch h'
    · intro ⟨b', e, ev⟩
      cases e
      rw [ev]
      exact List.Mem.head _
  | var _ => exact ⟨fun h => (nomatch h), fun h => (match h with | ⟨_, e, _⟩ => nomatch e)⟩
  | app _ _ => exact ⟨fun h => (nomatch h), fun h => (match h with | ⟨_, e, _⟩ => nomatch e)⟩
  | pair _ _ => exact ⟨fun h => (nomatch h), fun h => (match h with | ⟨_, e, _⟩ => nomatch e)⟩
  | fst _ => exact ⟨fun h => (nomatch h), fun h => (match h with | ⟨_, e, _⟩ => nomatch e)⟩
  | snd _ => exact ⟨fun h => (nomatch h), fun h => (match h with | ⟨_, e, _⟩ => nomatch e)⟩
  | star => exact ⟨fun h => (nomatch h), fun h => (match h with | ⟨_, e, _⟩ => nomatch e)⟩

theorem mem_rootFst {t v : Tm} : v ∈ rootFst t ↔ ∃ b, t = pair v b := by
  cases t with
  | pair a b =>
    constructor
    · intro h
      cases h with
      | head => exact ⟨b, rfl⟩
      | tail _ h' => exact nomatch h'
    · intro ⟨b', e⟩
      cases e
      exact List.Mem.head _
  | var _ => exact ⟨fun h => (nomatch h), fun h => (match h with | ⟨_, e⟩ => nomatch e)⟩
  | lam _ => exact ⟨fun h => (nomatch h), fun h => (match h with | ⟨_, e⟩ => nomatch e)⟩
  | app _ _ => exact ⟨fun h => (nomatch h), fun h => (match h with | ⟨_, e⟩ => nomatch e)⟩
  | fst _ => exact ⟨fun h => (nomatch h), fun h => (match h with | ⟨_, e⟩ => nomatch e)⟩
  | snd _ => exact ⟨fun h => (nomatch h), fun h => (match h with | ⟨_, e⟩ => nomatch e)⟩
  | star => exact ⟨fun h => (nomatch h), fun h => (match h with | ⟨_, e⟩ => nomatch e)⟩

theorem mem_rootSnd {t v : Tm} : v ∈ rootSnd t ↔ ∃ a, t = pair a v := by
  cases t with
  | pair a b =>
    constructor
    · intro h
      cases h with
      | head => exact ⟨a, rfl⟩
      | tail _ h' => exact nomatch h'
    · intro ⟨a', e⟩
      cases e
      exact List.Mem.head _
  | var _ => exact ⟨fun h => (nomatch h), fun h => (match h with | ⟨_, e⟩ => nomatch e)⟩
  | lam _ => exact ⟨fun h => (nomatch h), fun h => (match h with | ⟨_, e⟩ => nomatch e)⟩
  | app _ _ => exact ⟨fun h => (nomatch h), fun h => (match h with | ⟨_, e⟩ => nomatch e)⟩
  | fst _ => exact ⟨fun h => (nomatch h), fun h => (match h with | ⟨_, e⟩ => nomatch e)⟩
  | snd _ => exact ⟨fun h => (nomatch h), fun h => (match h with | ⟨_, e⟩ => nomatch e)⟩
  | star => exact ⟨fun h => (nomatch h), fun h => (match h with | ⟨_, e⟩ => nomatch e)⟩

/-- **The reducts are the one-step relation**, sound and complete. -/
theorem mem_reducts_iff : ∀ {t u : Tm}, u ∈ reducts t ↔ step t u
  | var _, _ => ⟨fun h => (nomatch h), fun h => (nomatch h)⟩
  | star, _ => ⟨fun h => (nomatch h), fun h => (nomatch h)⟩
  | lam t, u => by
    unfold reducts
    constructor
    · intro h
      let ⟨t', ht', e⟩ := mem_map_iff.mp (mem_dedup.mp h)
      rw [← e]; exact step.lam (mem_reducts_iff.mp ht')
    · intro h
      cases h with
      | lam s => exact mem_dedup.mpr (mem_map_iff.mpr ⟨_, mem_reducts_iff.mpr s, rfl⟩)
  | app t u, v => by
    unfold reducts
    constructor
    · intro h
      match mem_append_iff.mp (mem_dedup.mp h) with
      | Or.inl h1 =>
        match mem_append_iff.mp h1 with
        | Or.inl hr => let ⟨b, e, ev⟩ := mem_rootApp.mp hr; rw [e, ev]; exact step.beta
        | Or.inr hl => let ⟨t', ht', e⟩ := mem_map_iff.mp hl; rw [← e]; exact step.appL (mem_reducts_iff.mp ht')
      | Or.inr h2 => let ⟨u', hu', e⟩ := mem_map_iff.mp h2; rw [← e]; exact step.appR (mem_reducts_iff.mp hu')
    · intro h
      apply mem_dedup.mpr
      cases h with
      | beta => exact mem_append_iff.mpr (Or.inl (mem_append_iff.mpr (Or.inl (mem_rootApp.mpr ⟨_, rfl, rfl⟩))))
      | appL s => exact mem_append_iff.mpr (Or.inl (mem_append_iff.mpr (Or.inr (mem_map_iff.mpr ⟨_, mem_reducts_iff.mpr s, rfl⟩))))
      | appR s => exact mem_append_iff.mpr (Or.inr (mem_map_iff.mpr ⟨_, mem_reducts_iff.mpr s, rfl⟩))
  | pair t u, v => by
    unfold reducts
    constructor
    · intro h
      match mem_append_iff.mp (mem_dedup.mp h) with
      | Or.inl hl => let ⟨t', ht', e⟩ := mem_map_iff.mp hl; rw [← e]; exact step.pairL (mem_reducts_iff.mp ht')
      | Or.inr hr => let ⟨u', hu', e⟩ := mem_map_iff.mp hr; rw [← e]; exact step.pairR (mem_reducts_iff.mp hu')
    · intro h
      apply mem_dedup.mpr
      cases h with
      | pairL s => exact mem_append_iff.mpr (Or.inl (mem_map_iff.mpr ⟨_, mem_reducts_iff.mpr s, rfl⟩))
      | pairR s => exact mem_append_iff.mpr (Or.inr (mem_map_iff.mpr ⟨_, mem_reducts_iff.mpr s, rfl⟩))
  | fst t, v => by
    unfold reducts
    constructor
    · intro h
      match mem_append_iff.mp (mem_dedup.mp h) with
      | Or.inl hr => let ⟨b, e⟩ := mem_rootFst.mp hr; rw [e]; exact step.pi1
      | Or.inr hl => let ⟨t', ht', e⟩ := mem_map_iff.mp hl; rw [← e]; exact step.fst (mem_reducts_iff.mp ht')
    · intro h
      apply mem_dedup.mpr
      cases h with
      | pi1 => exact mem_append_iff.mpr (Or.inl (mem_rootFst.mpr ⟨_, rfl⟩))
      | fst s => exact mem_append_iff.mpr (Or.inr (mem_map_iff.mpr ⟨_, mem_reducts_iff.mpr s, rfl⟩))
  | snd t, v => by
    unfold reducts
    constructor
    · intro h
      match mem_append_iff.mp (mem_dedup.mp h) with
      | Or.inl hr => let ⟨a, e⟩ := mem_rootSnd.mp hr; rw [e]; exact step.pi2
      | Or.inr hl => let ⟨t', ht', e⟩ := mem_map_iff.mp hl; rw [← e]; exact step.snd (mem_reducts_iff.mp ht')
    · intro h
      apply mem_dedup.mpr
      cases h with
      | pi2 => exact mem_append_iff.mpr (Or.inl (mem_rootSnd.mpr ⟨_, rfl⟩))
      | snd s => exact mem_append_iff.mpr (Or.inr (mem_map_iff.mpr ⟨_, mem_reducts_iff.mpr s, rfl⟩))

/-! ## Normal order -/

/-- A term is normal when it has no one-step reduct. -/
def Normal (t : Tm) : Prop := ∀ u, ¬ step t u

/-- The first of two options. -/
def firstOf : Option Tm → Option Tm → Option Tm
  | some a, _ => some a
  | none, b => b

/-- **The normal-order step**: the root contraction if there is one, else the leftmost
subterm's normal-order step. -/
def stepNO : Tm → Option Tm
  | var _ => none
  | star => none
  | lam t => (stepNO t).map lam
  | app t u => firstOf (rootApp t u).head?
      (firstOf ((stepNO t).map (fun t' => app t' u)) ((stepNO u).map (app t)))
  | pair t u => firstOf ((stepNO t).map (fun t' => pair t' u)) ((stepNO u).map (pair t))
  | fst t => firstOf (rootFst t).head? ((stepNO t).map fst)
  | snd t => firstOf (rootSnd t).head? ((stepNO t).map snd)

theorem head?_append : ∀ (l r : List Tm), (l ++ r).head? = firstOf l.head? r.head?
  | [], _ => rfl
  | _ :: _, _ => rfl

theorem head?_map (f : Tm → Tm) : ∀ (l : List Tm), (l.map f).head? = l.head?.map f
  | [] => rfl
  | _ :: _ => rfl

theorem head?_dedup : ∀ (l : List Tm), (dedup l).head? = l.head?
  | [] => rfl
  | a :: as => by
    unfold dedup
    by_cases hc : as.contains a = true
    · rw [if_pos hc]; rfl
    · rw [if_neg hc]; rfl

/-- **Normal order is the first reduct**: the normal-order step is the head of `reducts`, the
root contraction before any subterm's, and the leftmost subterm's before the rest. -/
theorem stepNO_eq_head : ∀ (t : Tm), stepNO t = (reducts t).head?
  | var _ => rfl
  | star => rfl
  | lam t => by
    show (stepNO t).map lam = (dedup ((reducts t).map lam)).head?
    rw [head?_dedup, head?_map, stepNO_eq_head t]
  | app t u => by
    show firstOf (rootApp t u).head? (firstOf ((stepNO t).map (fun t' => app t' u)) ((stepNO u).map (app t))) =
      (dedup (rootApp t u ++ (reducts t).map (fun t' => app t' u) ++ (reducts u).map (app t))).head?
    rw [head?_dedup, head?_append, head?_append, head?_map, head?_map, stepNO_eq_head t, stepNO_eq_head u]
    cases (rootApp t u).head? <;> rfl
  | pair t u => by
    show firstOf ((stepNO t).map (fun t' => pair t' u)) ((stepNO u).map (pair t)) =
      (dedup ((reducts t).map (fun t' => pair t' u) ++ (reducts u).map (pair t))).head?
    rw [head?_dedup, head?_append, head?_map, head?_map, stepNO_eq_head t, stepNO_eq_head u]
  | fst t => by
    show firstOf (rootFst t).head? ((stepNO t).map fst) = (dedup (rootFst t ++ (reducts t).map fst)).head?
    rw [head?_dedup, head?_append, head?_map, stepNO_eq_head t]
  | snd t => by
    show firstOf (rootSnd t).head? ((stepNO t).map snd) = (dedup (rootSnd t ++ (reducts t).map snd)).head?
    rw [head?_dedup, head?_append, head?_map, stepNO_eq_head t]

/-- **A normal-order step is a step.** -/
theorem stepNO_sound {t u : Tm} (h : stepNO t = some u) : step t u := by
  rw [stepNO_eq_head] at h
  apply mem_reducts_iff.mp
  cases hr : reducts t with
  | nil => rw [hr] at h; exact nomatch h
  | cons a as => rw [hr] at h; cases h; exact List.Mem.head _

/-- **Normal order stops only at a normal form.** -/
theorem stepNO_none {t : Tm} (h : stepNO t = none) : Normal t := by
  rw [stepNO_eq_head] at h
  intro u hs
  have hm := mem_reducts_iff.mpr hs
  cases hr : reducts t with
  | nil => rw [hr] at hm; exact nomatch hm
  | cons a as => rw [hr] at h; exact nomatch h

/-- **Normal-order reduction** under fuel: the normal form once a step finds none, or nothing
when the fuel runs out first. -/
def normalize : Nat → Tm → Option Tm
  | 0, _ => none
  | n + 1, t =>
    match stepNO t with
    | none => some t
    | some t' => normalize n t'

/-- Normalization reduces. -/
theorem normalize_red : ∀ {n : Nat} {t u : Tm}, normalize n t = some u → Red t u
  | 0, _, _, h => nomatch h
  | n + 1, t, u, h => by
    unfold normalize at h
    cases hs : stepNO t with
    | none => rw [hs] at h; cases h; exact Red.refl
    | some t' =>
      rw [hs] at h
      exact Red.trans (Red.single (stepNO_sound hs)) (normalize_red h)

/-- Normalization ends at a normal form. -/
theorem normalize_normal : ∀ {n : Nat} {t u : Tm}, normalize n t = some u → Normal u
  | 0, _, _, h => nomatch h
  | n + 1, t, u, h => by
    unfold normalize at h
    cases hs : stepNO t with
    | none => rw [hs] at h; cases h; exact stepNO_none hs
    | some t' => rw [hs] at h; exact normalize_normal h

/-- A normal term reduces only to itself. -/
theorem red_normal_eq {t u : Tm} (hn : Normal t) (h : Red t u) : t = u := by
  induction h with
  | refl => rfl
  | tail _ s ih => subst ih; exact absurd s (hn _)

/-- **Normal forms are unique.** Whatever normalization finds is the only normal form a term
reduces to (`church_rosser`). -/
theorem normalize_unique {n : Nat} {t u v : Tm} (h : normalize n t = some u) (hv : Red t v)
    (hnv : Normal v) : u = v := by
  have ⟨w, huw, hvw⟩ := church_rosser (normalize_red h) hv
  rw [red_normal_eq (normalize_normal h) huw, red_normal_eq hnv hvw]

/-- Shift every free variable by `k`. -/
def lift (k : Nat) (t : Tm) : Tm := rename (· + k) t

end Tm

end Predicating.CurryHowardLambek
end Obsmetrologia
