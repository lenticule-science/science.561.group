import Obsmetrologia.Closure.InverseLimit
import Obsmetrologia.Language.Positing.Record
import Obsmetrologia.Calculus.Real.Internal

/-!
# The dyadic odometer: the Vershik adic successor

The adic successor of the dyadic (radix-2) stationary Bratteli tower — the
little-endian "+1 with carry" odometer on finite paths, the canonical minimal
Cantor system. A level whose edge is not yet maximal (`false`) advances
(`true`) and the traversal stops there; a maximal edge (`true`) resets
(`false`) and carries the increment up a level. The all-maximal path wraps to
the all-minimal one, closing the serial order into a cycle.

The tower's tiling reading (edges = port incidence, levels = time, successor
= the serial yarn order) is consumed downstream by `AperiodicOrder.Tiling`;
the blueprint chapter on hair narrates that reading.

## Main results

* `vershik_succ` — the adic successor is the integer `+1` on the serial
  index, until a row maxes out.
* `vershik_replicate_true` — the maximal path wraps to the minimal path (the
  adic discontinuity).
* `vershik_two_cycle` — on two levels the successor is a 4-cycle (the minimal
  dyadic odometer).
* `vershikIter_fixed_iff` — the `m`-fold successor fixes an `L`-level path
  exactly when `2 ^ L` divides `m`: each stage is one `2 ^ L`-cycle.
* `vershikHullIter_ne_self` — no positive iterate of the odometer fixes any
  thread of the hull.
* `tower_periodicity_dichotomy` — periodic-point counts: `2 ^ n` at
  multiples of `2 ^ n` at stage `n`, `0` on the hull.
* `vershikIter_reaches` — each stage is a single orbit: any two same-level
  paths are connected by fewer than `2 ^ L` successor steps.
* `vershikHull_minimal_aperiodic` — every hull orbit is dense and no
  positive iterate has a fixed point.
* `toNat_ofNat`/`ofNat_toNat` — the stage orbit is its own coordinate
  chart: `ofNat n v` (the `v`-th successor step from the minimal path)
  inverts the serial index.
* `vershikFinIter_cycle` — the successor's `Fin (2 ^ n)` avatar closes its
  `2 ^ n`-cycle.
* `bernoulliLaw` / `bernoulliLaw_vershik_invariant` — the uniform mass
  `1 / 2 ^ n` per depth-`n` cylinder is a `CylinderLaw` (child masses sum to
  the parent's, unit total) and the adic successor preserves it.

## References

The dyadic odometer as the canonical Bratteli–Vershik / Cantor minimal
system. Sibling: `Closure.InverseLimit` (the stage tower's limit machinery).
-/

namespace Obsmetrologia
namespace Odometer

/-- The **Vershik adic successor** on the dyadic stationary Bratteli tower:
the next path in the serial order, the little-endian "+1 with carry"
odometer. A not-yet-maximal edge (`false`) advances to `true` and stops; a
maximal edge (`true`) resets to `false` and carries up a level. -/
def vershik : List Bool → List Bool
  | [] => []
  | false :: rest => true :: rest
  | true :: rest => false :: vershik rest

/-- The little-endian binary value of a path (lowest level first): its index
in the serial order. -/
def toNat : List Bool → Nat
  | [] => 0
  | false :: rest => 2 * toNat rest
  | true :: rest => 1 + 2 * toNat rest

/-- The successor preserves the level count: an `L`-level path stays
`L`-level (the top carry drops). -/
theorem vershik_length : ∀ p : List Bool, (vershik p).length = p.length
  | [] => rfl
  | false :: _ => rfl
  | true :: rest => congrArg (· + 1) (vershik_length rest)

/-- **The Vershik successor is `+1`.** On any path not yet maximal (some
level still carries a `false` edge), the adic successor increments the serial
index: `toNat (vershik p) = toNat p + 1`. -/
theorem vershik_succ : ∀ p : List Bool, false ∈ p → toNat (vershik p) = toNat p + 1
  | [], h => nomatch h
  | false :: rest, _ => Nat.add_comm 1 (2 * toNat rest)
  | true :: rest, h => by
      have hrest : false ∈ rest := by cases h with | tail _ h' => exact h'
      show 2 * toNat (vershik rest) = 1 + 2 * toNat rest + 1
      rw [vershik_succ rest hrest, Nat.mul_succ,
        Nat.add_comm 1 (2 * toNat rest), Nat.add_assoc]

/-- **The maximal path wraps to the minimal path.** The all-`true` (maximal)
path of any height carries past the top and returns to the all-`false`
(minimal) path — the adic map's one discontinuity, where the serial order
closes into a cycle. -/
theorem vershik_replicate_true : ∀ n : Nat,
    vershik (List.replicate n true) = List.replicate n false
  | 0 => rfl
  | n + 1 => by
      simp only [List.replicate_succ, vershik, vershik_replicate_true n]

/-- **On two levels the successor is a 4-cycle.** Iterating `vershik` four
times returns any two-level path to itself: the minimal dyadic odometer,
every path reached. -/
theorem vershik_two_cycle (a b : Bool) :
    vershik (vershik (vershik (vershik [a, b]))) = [a, b] := by
  cases a <;> cases b <;> rfl

/-! ### The dyadic tower and its Cantor hull -/

theorem length_take_of_le : ∀ (m : Nat) (l : List Bool),
    m ≤ l.length → (l.take m).length = m
  | 0, _, _ => rfl
  | _ + 1, [], h => nomatch h
  | m + 1, _ :: l, h =>
      congrArg (· + 1) (length_take_of_le m l (Nat.le_of_succ_le_succ h))

theorem take_of_le_length : ∀ (l : List Bool) (m : Nat),
    l.length ≤ m → l.take m = l
  | [], 0, _ => rfl
  | [], _ + 1, _ => rfl
  | _ :: _, 0, h => nomatch h
  | a :: l, m + 1, h =>
      congrArg (a :: ·) (take_of_le_length l m (Nat.le_of_succ_le_succ h))

theorem take_take_of_le : ∀ (m n : Nat) (l : List Bool),
    m ≤ n → (l.take n).take m = l.take m
  | 0, _, _, _ => rfl
  | _ + 1, 0, _, h => nomatch h
  | _ + 1, _ + 1, [], _ => rfl
  | m + 1, n + 1, a :: l, h =>
      congrArg (a :: ·) (take_take_of_le m n l (Nat.le_of_succ_le_succ h))

/-- The dyadic tower: stage `n` is the length-`n` paths, restriction is
prefix truncation. Its threads are the Cantor hull `2^ℕ`. -/
def dyadicTower : InverseSystem where
  stage n := {l : List Bool // l.length = n}
  proj {m n} h x := ⟨x.val.take m,
    length_take_of_le m x.val (by rw [x.property]; exact h)⟩
  proj_id {n} _ x := Subtype.ext
    (take_of_le_length x.val n (Nat.le_of_eq x.property))
  proj_comp {m n k} hmn _ _ x := Subtype.ext (take_take_of_le m n x.val hmn)

/-- The length-`n` prefix path of a point of Cantor space. -/
def pathOf (g : Nat → Bool) (n : Nat) : dyadicTower.stage n :=
  ⟨(List.range n).map g, by simp⟩

/-- The thread of a point of Cantor space: its prefix paths, coherent under
truncation. -/
def cantorThread (g : Nat → Bool) : dyadicTower.Thread where
  at_ := pathOf g
  coh {m n} h := Subtype.ext (by
    show ((List.range n).map g).take m = (List.range m).map g
    rw [← List.map_take, List.take_range, Nat.min_eq_left h])

/-- Read a thread at position `n`: the `n`-th edge of its stage-`n+1` path. -/
def read (t : dyadicTower.Thread) (n : Nat) : Bool :=
  (t.at_ (n + 1)).val[n]'(by rw [(t.at_ (n + 1)).property]; omega)

/-- Reading the thread of a Cantor point recovers the point. -/
theorem read_cantorThread (g : Nat → Bool) (n : Nat) :
    read (cantorThread g) n = g n := by
  simp [read, cantorThread, pathOf]

/-- A thread's stage-`n` path is the prefix of its reads. -/
theorem thread_at_eq_reads (t : dyadicTower.Thread) (n : Nat) :
    (t.at_ n).val = (List.range n).map (read t) := by
  apply List.ext_getElem
  · rw [(t.at_ n).property]; simp
  · intro k hk _
    have hkn : k < n := by
      have := (t.at_ n).property; omega
    have hc := t.coh (show k + 1 ≤ n by omega)
    have hval : (t.at_ n).val.take (k + 1) = (t.at_ (k + 1)).val :=
      congrArg Subtype.val hc
    have hget : (t.at_ n).val[k]'(by rw [(t.at_ n).property]; omega)
        = (t.at_ (k + 1)).val[k]'(by rw [(t.at_ (k + 1)).property]; omega) := by
      have h1 := List.getElem_of_eq hval.symm
        (show k < (t.at_ (k + 1)).val.length by rw [(t.at_ (k + 1)).property]; omega)
      exact ((h1.trans (List.getElem_take ..)).symm)
    simp only [List.getElem_map, List.getElem_range]
    rw [hget]
    rfl

/-- **The hull of the dyadic tower is Cantor space.** Reading a Cantor
point's thread recovers the point, and every thread is the thread of its
reads — the inverse limit `lim← {0,1}^n` is `2^ℕ`, in coordinates. -/
theorem dyadicHull_is_cantor :
    (∀ g n, read (cantorThread g) n = g n)
    ∧ (∀ t : dyadicTower.Thread, t = cantorThread (read t)) :=
  ⟨read_cantorThread, fun t =>
    InverseSystem.Thread.ext (S := dyadicTower) (fun n =>
      Subtype.ext (thread_at_eq_reads t n))⟩

/-! ### The odometer acts on the tower -/

/-- The Vershik successor commutes with prefix truncation: the carry
propagates left to right, so a prefix's successor is the successor's
prefix. -/
theorem vershik_take : ∀ (p : List Bool) (m : Nat),
    vershik (p.take m) = (vershik p).take m
  | [], 0 => rfl
  | [], _ + 1 => rfl
  | _ :: _, 0 => rfl
  | false :: _, _ + 1 => rfl
  | true :: rest, m + 1 => by
    show false :: vershik (rest.take m) = false :: (vershik rest).take m
    rw [vershik_take rest m]

/-- The Vershik successor as a stage map: it preserves path length. -/
def vershikStage {n : Nat} (x : dyadicTower.stage n) : dyadicTower.stage n :=
  ⟨vershik x.val, by rw [vershik_length, x.property]⟩

/-- **The odometer is an endomorphism of the dyadic tower**: the stage maps
commute with the restriction maps, so the successor descends to the Cantor
hull. -/
theorem vershikStage_proj {m n : Nat} (h : m ≤ n) (x : dyadicTower.stage n) :
    dyadicTower.proj h (vershikStage x) = vershikStage (dyadicTower.proj h x) :=
  Subtype.ext (vershik_take x.val m).symm

/-- The odometer on the hull: apply the successor at every stage. Coherence
is the tower endomorphism law. -/
def vershikHull (t : dyadicTower.Thread) : dyadicTower.Thread where
  at_ n := vershikStage (t.at_ n)
  coh {m n} h := by
    rw [vershikStage_proj h (t.at_ n), t.coh h]

/-! ### Periodic points: the orbit spectrum of the tower -/

theorem nat_add_right_cancel : ∀ {a b c : Nat}, a + c = b + c → a = b
  | _, _, 0, h => h
  | _, _, _ + 1, h => nat_add_right_cancel (Nat.succ.inj h)

theorem nat_add_left_cancel {a b c : Nat} (h : a + b = a + c) : b = c := by
  rw [Nat.add_comm a b, Nat.add_comm a c] at h
  exact nat_add_right_cancel h

theorem nat_two_mul_ne_two_mul_add_one : ∀ (a b : Nat), 2 * a ≠ 2 * b + 1
  | 0, _, h => nomatch h
  | _ + 1, 0, h => nomatch Nat.succ.inj h
  | a + 1, b + 1, h =>
      nat_two_mul_ne_two_mul_add_one a b (Nat.succ.inj (Nat.succ.inj h))

/-- The `m`-fold iterate of the Vershik successor. -/
def vershikIter : Nat → List Bool → List Bool
  | 0, p => p
  | m + 1, p => vershik (vershikIter m p)

/-- Iterates preserve the level count. -/
theorem vershikIter_length : ∀ (m : Nat) (p : List Bool),
    (vershikIter m p).length = p.length
  | 0, _ => rfl
  | m + 1, p => (vershik_length (vershikIter m p)).trans (vershikIter_length m p)

/-- The serial index of an `L`-level path is below `2 ^ L`. -/
theorem toNat_lt : ∀ p : List Bool, toNat p < 2 ^ p.length
  | [] => Nat.lt_succ_self 0
  | false :: rest => by
      have h : toNat rest + 1 ≤ 2 ^ rest.length := toNat_lt rest
      show 2 * toNat rest < 2 ^ rest.length * 2
      have h2 : 2 * (toNat rest + 1) ≤ 2 * 2 ^ rest.length := Nat.mul_le_mul_left 2 h
      have h3 : 2 * toNat rest < 2 * (toNat rest + 1) := by
        rw [Nat.mul_succ]
        exact Nat.lt_of_lt_of_le (Nat.lt_succ_self _) (Nat.le_succ _)
      rw [Nat.mul_comm (2 ^ rest.length) 2]
      exact Nat.lt_of_lt_of_le h3 h2
  | true :: rest => by
      have h : toNat rest + 1 ≤ 2 ^ rest.length := toNat_lt rest
      show 1 + 2 * toNat rest < 2 ^ rest.length * 2
      have h2 : 2 * (toNat rest + 1) ≤ 2 * 2 ^ rest.length := Nat.mul_le_mul_left 2 h
      have h3 : 1 + 2 * toNat rest < 2 * (toNat rest + 1) := by
        rw [Nat.mul_succ, Nat.add_comm 1 (2 * toNat rest)]
        exact Nat.lt_succ_self _
      rw [Nat.mul_comm (2 ^ rest.length) 2]
      exact Nat.lt_of_lt_of_le h3 h2

/-- Paths of equal level with equal serial index are equal: `toNat` is
injective level-wise. -/
theorem eq_of_toNat_eq : ∀ p q : List Bool,
    p.length = q.length → toNat p = toNat q → p = q
  | [], [], _, _ => rfl
  | [], _ :: _, h, _ => nomatch h
  | _ :: _, [], h, _ => nomatch h
  | a :: p, b :: q, h, hv => by
      have hlen : p.length = q.length := Nat.succ.inj h
      cases a <;> cases b
      · rw [eq_of_toNat_eq p q hlen
          (Nat.eq_of_mul_eq_mul_left (Nat.succ_pos 1) hv)]
      · exact absurd (hv.trans (Nat.add_comm 1 (2 * toNat q)))
          (nat_two_mul_ne_two_mul_add_one _ _)
      · exact absurd (hv.symm.trans (Nat.add_comm 1 (2 * toNat p)))
          (nat_two_mul_ne_two_mul_add_one _ _)
      · have hpq : 2 * toNat p = 2 * toNat q := nat_add_left_cancel hv
        rw [eq_of_toNat_eq p q hlen
          (Nat.eq_of_mul_eq_mul_left (Nat.succ_pos 1) hpq)]

/-- The successor increments the serial index exactly, or wraps: it adds `1`,
or adds `1` minus one full cycle `2 ^ L`. -/
theorem toNat_vershik_cases : ∀ p : List Bool,
    toNat (vershik p) = toNat p + 1
    ∨ toNat (vershik p) + 2 ^ p.length = toNat p + 1
  | [] => Or.inr rfl
  | false :: rest => Or.inl (Nat.add_comm 1 (2 * toNat rest))
  | true :: rest => by
      rcases toNat_vershik_cases rest with h | h
      · refine Or.inl ?_
        show 2 * toNat (vershik rest) = 1 + 2 * toNat rest + 1
        rw [h, Nat.mul_succ, Nat.add_comm 1 (2 * toNat rest), Nat.add_assoc]
      · refine Or.inr ?_
        show 2 * toNat (vershik rest) + 2 ^ rest.length * 2 = 1 + 2 * toNat rest + 1
        rw [Nat.mul_comm (2 ^ rest.length) 2, ← Nat.mul_add, h, Nat.mul_succ,
          Nat.add_comm 1 (2 * toNat rest), Nat.add_assoc]

/-- The `m`-fold iterate adds `m` to the serial index up to full cycles:
some multiple of `2 ^ L` accounts for the wraps. -/
theorem toNat_vershikIter : ∀ (m : Nat) (p : List Bool),
    ∃ k, toNat (vershikIter m p) + k * 2 ^ p.length = toNat p + m
  | 0, p => ⟨0, by rw [Nat.zero_mul]; rfl⟩
  | m + 1, p => by
      obtain ⟨k, hk⟩ := toNat_vershikIter m p
      rcases toNat_vershik_cases (vershikIter m p) with h | h
      · exact ⟨k, by
          show toNat (vershik (vershikIter m p)) + k * 2 ^ p.length = toNat p + (m + 1)
          rw [h, Nat.add_right_comm, hk, Nat.add_assoc]⟩
      · rw [vershikIter_length m p] at h
        exact ⟨k + 1, by
          show toNat (vershik (vershikIter m p)) + (k + 1) * 2 ^ p.length
            = toNat p + (m + 1)
          rw [Nat.succ_mul, ← Nat.add_assoc, Nat.add_right_comm _ (k * 2 ^ p.length), h,
            Nat.add_right_comm, hk, Nat.add_assoc]⟩

/-- Iterates commute with one application of the successor. -/
theorem vershikIter_vershik : ∀ (m : Nat) (p : List Bool),
    vershikIter m (vershik p) = vershik (vershikIter m p)
  | 0, _ => rfl
  | m + 1, p => congrArg vershik (vershikIter_vershik m p)

/-- Iteration is additive in the exponent. -/
theorem vershikIter_add : ∀ (a b : Nat) (p : List Bool),
    vershikIter (a + b) p = vershikIter a (vershikIter b p)
  | _, 0, _ => rfl
  | a, b + 1, p => by
      show vershik (vershikIter (a + b) p) = vershikIter a (vershik (vershikIter b p))
      rw [vershikIter_add a b p, vershikIter_vershik]

/-- One full cycle returns every path: the `2 ^ L`-fold successor is the
identity on `L`-level paths. -/
theorem vershikIter_cycle (p : List Bool) : vershikIter (2 ^ p.length) p = p := by
  obtain ⟨k, hk⟩ := toNat_vershikIter (2 ^ p.length) p
  have hlt := toNat_lt (vershikIter (2 ^ p.length) p)
  rw [vershikIter_length] at hlt
  have hp := toNat_lt p
  match k, hk with
  | 0, hk =>
      rw [Nat.zero_mul, Nat.add_zero] at hk
      exact absurd (Nat.le_trans (Nat.le_add_left _ _) (Nat.le_of_eq hk.symm))
        (Nat.not_le.mpr hlt)
  | 1, hk =>
      rw [Nat.one_mul] at hk
      exact eq_of_toNat_eq _ _ (vershikIter_length _ _) (nat_add_right_cancel hk)
  | k + 2, hk =>
      exfalso
      rw [Nat.succ_mul, Nat.succ_mul, ← Nat.add_assoc, ← Nat.add_assoc] at hk
      have h2 := nat_add_right_cancel hk
      have h3 : 2 ^ p.length ≤ toNat p := by
        rw [← h2]
        exact Nat.le_add_left _ _
      exact absurd h3 (Nat.not_le.mpr hp)

/-- **The periodic-point law of a stage.** The `m`-fold successor fixes an
`L`-level path exactly when `2 ^ L` divides `m`: each stage is one
`2 ^ L`-cycle, so every iterate fixes all paths or none. -/
theorem vershikIter_fixed_iff (m : Nat) (p : List Bool) :
    vershikIter m p = p ↔ 2 ^ p.length ∣ m := by
  constructor
  · intro h
    obtain ⟨k, hk⟩ := toNat_vershikIter m p
    rw [h] at hk
    exact ⟨k, (nat_add_left_cancel hk).symm.trans (Nat.mul_comm k _)⟩
  · rintro ⟨c, rfl⟩
    induction c with
    | zero => rfl
    | succ c ih => rw [Nat.mul_succ, vershikIter_add, vershikIter_cycle, ih]

/-- The `m`-fold iterate of the odometer on the hull. -/
def vershikHullIter : Nat → dyadicTower.Thread → dyadicTower.Thread
  | 0, t => t
  | m + 1, t => vershikHull (vershikHullIter m t)

/-- Hull iterates read stage-wise as path iterates. -/
theorem vershikHullIter_at : ∀ (m : Nat) (t : dyadicTower.Thread) (n : Nat),
    ((vershikHullIter m t).at_ n).val = vershikIter m (t.at_ n).val
  | 0, _, _ => rfl
  | m + 1, t, n => congrArg vershik (vershikHullIter_at m t n)

/-- **The hull has no periodic points.** No positive iterate of the odometer
fixes any thread: a fixed thread would be fixed at every stage, and any stage
with `m < 2 ^ n` refuses by the periodic-point law. -/
theorem vershikHullIter_ne_self (m : Nat) (hm : 0 < m) (t : dyadicTower.Thread) :
    vershikHullIter m t ≠ t := by
  intro h
  have hfix : vershikIter m (t.at_ m).val = (t.at_ m).val := by
    rw [← vershikHullIter_at m t m, h]
  obtain ⟨c, hc⟩ := (vershikIter_fixed_iff m _).mp hfix
  rw [(t.at_ m).property] at hc
  match c, hc with
  | 0, hc => exact absurd (hc.trans (Nat.mul_zero _)) (Nat.ne_of_gt hm)
  | c + 1, hc =>
      have h1 : 2 ^ m ≤ 2 ^ m * (c + 1) := by
        rw [Nat.mul_succ]
        exact Nat.le_add_left _ _
      exact absurd (Nat.le_trans h1 (Nat.le_of_eq hc.symm))
        (Nat.not_le.mpr Nat.lt_two_pow_self)

/-- **The periodicity dichotomy of the tower.** At every finite stage the
odometer is periodic — the `m`-fold successor fixes a stage-`n` path exactly
when `2 ^ n` divides `m` — and on the hull no positive iterate fixes any
thread. The periodic-point counts of stage `n` are `2 ^ n` at multiples of
`2 ^ n` and `0` elsewhere; on the hull they are all `0`. -/
theorem tower_periodicity_dichotomy :
    (∀ (m n : Nat) (x : dyadicTower.stage n),
        vershikIter m x.val = x.val ↔ 2 ^ n ∣ m)
    ∧ (∀ m, 0 < m → ∀ t : dyadicTower.Thread, vershikHullIter m t ≠ t) :=
  ⟨fun m n x =>
    (vershikIter_fixed_iff m x.val).trans (by rw [x.property]),
    vershikHullIter_ne_self⟩

/-! ### Transitivity and minimality -/

theorem nat_add_sub_cancel_of_le : ∀ {a b : Nat}, a ≤ b → a + (b - a) = b
  | 0, b, _ => Nat.zero_add b
  | _ + 1, 0, h => nomatch h
  | a + 1, b + 1, h => by
      rw [Nat.succ_sub_succ, Nat.succ_add]
      exact congrArg (· + 1) (nat_add_sub_cancel_of_le (Nat.le_of_succ_le_succ h))

/-- The wrap count of `toNat_vershikIter` is unique: the winding of an
`m`-step run is a well-defined number. -/
theorem toNat_vershikIter_unique {m : Nat} {p : List Bool} {k₁ k₂ : Nat}
    (h₁ : toNat (vershikIter m p) + k₁ * 2 ^ p.length = toNat p + m)
    (h₂ : toNat (vershikIter m p) + k₂ * 2 ^ p.length = toNat p + m) : k₁ = k₂ :=
  Nat.eq_of_mul_eq_mul_right (Nat.two_pow_pos _)
    (nat_add_left_cancel (h₁.trans h₂.symm))

/-- **Each stage is a single orbit.** Any two paths of the same level are
connected by fewer than `2 ^ L` steps of the successor. -/
theorem vershikIter_reaches (p q : List Bool) (hlen : p.length = q.length) :
    ∃ m, m < 2 ^ p.length ∧ vershikIter m p = q := by
  have hp := toNat_lt p
  have hq : toNat q < 2 ^ p.length := by rw [hlen]; exact toNat_lt q
  rcases Nat.lt_or_ge (toNat q) (toNat p) with hlt | hle
  · refine ⟨(2 ^ p.length - toNat p) + toNat q, ?_, ?_⟩
    · have h1 : (2 ^ p.length - toNat p) + toNat q
          < (2 ^ p.length - toNat p) + toNat p :=
        Nat.add_lt_add_left hlt _
      rw [Nat.add_comm _ (toNat p), nat_add_sub_cancel_of_le (Nat.le_of_lt hp)] at h1
      exact h1
    · obtain ⟨k, hk⟩ := toNat_vershikIter ((2 ^ p.length - toNat p) + toNat q) p
      rw [← Nat.add_assoc, nat_add_sub_cancel_of_le (Nat.le_of_lt hp)] at hk
      have hil : toNat (vershikIter ((2 ^ p.length - toNat p) + toNat q) p)
          < 2 ^ p.length := by
        have := toNat_lt (vershikIter ((2 ^ p.length - toNat p) + toNat q) p)
        rw [vershikIter_length] at this
        exact this
      match k, hk with
      | 0, hk =>
          rw [Nat.zero_mul, Nat.add_zero] at hk
          exact absurd (Nat.le_trans (Nat.le_add_right _ _) (Nat.le_of_eq hk.symm))
            (Nat.not_le.mpr hil)
      | 1, hk =>
          rw [Nat.one_mul, Nat.add_comm (2 ^ p.length) (toNat q)] at hk
          exact eq_of_toNat_eq _ _ ((vershikIter_length _ _).trans hlen)
            (nat_add_right_cancel hk)
      | k + 2, hk =>
          exfalso
          rw [Nat.succ_mul, Nat.succ_mul, ← Nat.add_assoc, ← Nat.add_assoc] at hk
          have h2 : 2 ^ p.length + toNat q < 2 ^ p.length + 2 ^ p.length :=
            Nat.add_lt_add_left hq _
          have h3 : 2 ^ p.length + 2 ^ p.length
              ≤ toNat (vershikIter ((2 ^ p.length - toNat p) + toNat q) p)
                  + k * 2 ^ p.length + 2 ^ p.length + 2 ^ p.length :=
            Nat.add_le_add_right (Nat.le_add_left _ _) _
          rw [hk] at h3
          exact absurd h3 (Nat.not_le.mpr h2)
  · refine ⟨toNat q - toNat p, ?_, ?_⟩
    · exact Nat.lt_of_le_of_lt (Nat.sub_le _ _) hq
    · obtain ⟨k, hk⟩ := toNat_vershikIter (toNat q - toNat p) p
      rw [nat_add_sub_cancel_of_le hle] at hk
      have hil : toNat (vershikIter (toNat q - toNat p) p) < 2 ^ p.length := by
        have := toNat_lt (vershikIter (toNat q - toNat p) p)
        rw [vershikIter_length] at this
        exact this
      match k, hk with
      | 0, hk =>
          rw [Nat.zero_mul, Nat.add_zero] at hk
          exact eq_of_toNat_eq _ _ ((vershikIter_length _ _).trans hlen) hk
      | k + 1, hk =>
          exfalso
          rw [Nat.succ_mul, ← Nat.add_assoc] at hk
          have h2 : 2 ^ p.length ≤ toNat q :=
            Nat.le_trans (Nat.le_add_left _ _) (Nat.le_of_eq hk)
          exact absurd h2 (Nat.not_le.mpr hq)

/-- **The hull orbit is dense.** For any two threads and any stage, some
iterate of the odometer carries the first to agree with the second at that
stage: the odometer visits every cylinder of the Cantor hull. -/
theorem vershikHull_orbit_dense (t t' : dyadicTower.Thread) (n : Nat) :
    ∃ m, (vershikHullIter m t).at_ n = t'.at_ n := by
  obtain ⟨m, _, hm⟩ := vershikIter_reaches (t.at_ n).val (t'.at_ n).val
    ((t.at_ n).property.trans (t'.at_ n).property.symm)
  exact ⟨m, Subtype.ext ((vershikHullIter_at m t n).trans hm)⟩

/-- **The hull odometer is minimal and aperiodic.** Every orbit is dense and
no positive iterate has a fixed point. -/
theorem vershikHull_minimal_aperiodic :
    (∀ (t t' : dyadicTower.Thread) (n : Nat),
        ∃ m, (vershikHullIter m t).at_ n = t'.at_ n)
    ∧ (∀ m, 0 < m → ∀ t : dyadicTower.Thread, vershikHullIter m t ≠ t) :=
  ⟨vershikHull_orbit_dense, vershikHullIter_ne_self⟩

/-! ### The serial chart and the `Fin` avatar -/

/-- The `v`-th path of the stage-`n` orbit: `v` successor steps from the
minimal (all-`false`) path. The stage's serial coordinate chart, inverse to
`toNat`. -/
def ofNat (n v : Nat) : List Bool := vershikIter v (List.replicate n false)

theorem length_replicate_false : ∀ n : Nat, (List.replicate n false).length = n
  | 0 => rfl
  | n + 1 => congrArg (· + 1) (length_replicate_false n)

/-- The chart lands at the right level. -/
theorem ofNat_length (n v : Nat) : (ofNat n v).length = n :=
  (vershikIter_length v _).trans (length_replicate_false n)

theorem toNat_replicate_false : ∀ n : Nat, toNat (List.replicate n false) = 0
  | 0 => rfl
  | n + 1 => by
      show 2 * toNat (List.replicate n false) = 0
      rw [toNat_replicate_false n]

/-- The chart is a section of the serial index: below `2 ^ n` the `v`-th
orbit point has index `v`. -/
theorem toNat_ofNat (n v : Nat) (h : v < 2 ^ n) : toNat (ofNat n v) = v := by
  obtain ⟨k, hk⟩ := toNat_vershikIter v (List.replicate n false)
  rw [toNat_replicate_false, Nat.zero_add, length_replicate_false] at hk
  match k, hk with
  | 0, hk =>
      rw [Nat.zero_mul, Nat.add_zero] at hk
      exact hk
  | k + 1, hk =>
      exfalso
      rw [Nat.succ_mul, ← Nat.add_assoc] at hk
      exact absurd (Nat.le_trans (Nat.le_add_left _ _) (Nat.le_of_eq hk))
        (Nat.not_le.mpr h)

/-- The chart is a retraction: every path is the `toNat p`-th point of its
stage orbit. -/
theorem ofNat_toNat (p : List Bool) : ofNat p.length (toNat p) = p :=
  eq_of_toNat_eq _ p (ofNat_length _ _)
    (toNat_ofNat _ _ (toNat_lt p))

/-- The chart intertwines iteration with addition of serial indices. -/
theorem vershikIter_ofNat (n m v : Nat) :
    vershikIter m (ofNat n v) = ofNat n (m + v) :=
  (vershikIter_add m v _).symm

/-- The stage-`n` successor in serial coordinates: the `Fin (2 ^ n)` avatar
of `vershik` under the orbit chart. -/
def vershikFin (n : Nat) (i : Fin (2 ^ n)) : Fin (2 ^ n) :=
  ⟨toNat (vershik (ofNat n i.val)), by
    have h := toNat_lt (vershik (ofNat n i.val))
    rw [vershik_length, ofNat_length] at h
    exact h⟩

/-- The `m`-fold iterate of the stage successor in serial coordinates. -/
def vershikFinIter (n m : Nat) (i : Fin (2 ^ n)) : Fin (2 ^ n) :=
  ⟨toNat (vershikIter m (ofNat n i.val)), by
    have h := toNat_lt (vershikIter m (ofNat n i.val))
    rw [vershikIter_length, ofNat_length] at h
    exact h⟩

theorem vershikFinIter_zero (n : Nat) (i : Fin (2 ^ n)) :
    vershikFinIter n 0 i = i :=
  Fin.ext (toNat_ofNat n i.val i.isLt)

theorem vershikFinIter_succ (n m : Nat) (i : Fin (2 ^ n)) :
    vershikFinIter n (m + 1) i = vershikFin n (vershikFinIter n m i) := by
  apply Fin.ext
  show toNat (vershik (vershikIter m (ofNat n i.val)))
    = toNat (vershik (ofNat n (toNat (vershikIter m (ofNat n i.val)))))
  have hchart : ofNat n (toNat (vershikIter m (ofNat n i.val)))
      = vershikIter m (ofNat n i.val) := by
    have h := ofNat_toNat (vershikIter m (ofNat n i.val))
    rw [vershikIter_length, ofNat_length] at h
    exact h
  rw [hchart]

/-- **The avatar closes its cycle.** The `2 ^ n`-fold iterate of the stage
successor is the identity in serial coordinates. -/
theorem vershikFinIter_cycle (n : Nat) (i : Fin (2 ^ n)) :
    vershikFinIter n (2 ^ n) i = i := by
  apply Fin.ext
  show toNat (vershikIter (2 ^ n) (ofNat n i.val)) = i.val
  have hc := vershikIter_cycle (ofNat n i.val)
  rw [ofNat_length] at hc
  rw [hc]
  exact toNat_ofNat n i.val i.isLt

/-! ### The gluing dichotomy over the tower -/

/-- Any knowledge-monotone stage accumulation valued in a carrier with a top
element is globally bounded by that top: it is the coefficient carrier's
boundedness, not anything special to `Charge`, that makes stage
accumulations glue. -/
theorem stage_datum_bounded_of_top {C : Type} {le : C → C → Prop}
    (top : C) (le_top : ∀ x, le x top) (c : Nat → C) :
    ∃ b, ∀ n, le (c n) b :=
  ⟨top, fun n => le_top (c n)⟩

/-- Every FOUR-valued stage accumulation over the tower is globally bounded:
the `Charge` instance of `stage_datum_bounded_of_top` at the top `⊤`. -/
theorem charge_stage_datum_bounded (c : Nat → Charge) :
    ∃ b, ∀ n, Charge.KLE (c n) b :=
  stage_datum_bounded_of_top Charge.kTop Charge.le_kTop c

/-- A record-valued stage accumulation over the tower with no global
section: the tally climb is knowledge-monotone along refinement yet admits
no bound. -/
theorem record_stage_datum_unbounded :
    ∃ r : Nat → Record,
      (∀ n, Record.KLE (r n) (r (n + 1))) ∧ ¬ ∃ b, ∀ n, Record.KLE (r n) b := by
  refine ⟨fun n => ⟨n, 0⟩, fun n => ⟨Nat.le_succ n, Nat.le_refl 0⟩, ?_⟩
  intro h
  obtain ⟨b, hb⟩ := h
  exact Nat.not_succ_le_self b.pos ((hb (b.pos + 1)).1)

/-- **The gluing dichotomy.** Over the dyadic tower's stages, every
FOUR-valued accumulation admits a global bound, and some knowledge-monotone
record-valued accumulation admits none: with bounded coefficients every
cover settles, with topless coefficients gluing genuinely fails. The
cohomology-vanishing regime gate distinguishes derived carriers for the
first time. -/
theorem tower_gluing_dichotomy :
    (∀ c : Nat → Charge, ∃ b, ∀ n, Charge.KLE (c n) b)
    ∧ (∃ r : Nat → Record,
        (∀ n, Record.KLE (r n) (r (n + 1))) ∧ ¬ ∃ b, ∀ n, Record.KLE (r n) b) :=
  ⟨charge_stage_datum_bounded, record_stage_datum_unbounded⟩

/-- **The ω-escape profile of the regime tower.** For each tower carrier,
whether an ℕ-indexed stage accumulation can escape every global bound:
charges never escape (`⊤` absorbs); records escape (the tally climb);
completed records never escape (the double infinity absorbs); and germs
never escape along ℕ — every ℕ-indexed family of germs is dominated —
although the germ carrier has no top. Escape along ℕ happens at the topless
ω-rung and nowhere else; at the aperiodic rung the obstruction (no top) is
present but no ℕ-indexed accumulation witnesses it. -/
theorem omega_escape_profile :
    (∀ c : Nat → Charge, ∃ b, ∀ n, Charge.KLE (c n) b)
    ∧ (∃ r : Nat → Record,
        (∀ n, Record.KLE (r n) (r (n + 1))) ∧ ¬ ∃ b, ∀ n, Record.KLE (r n) b)
    ∧ (∀ c : Nat → ORecord, ∀ n, ORecord.OKLE (c n) ORecord.kTop)
    ∧ (∀ g : Nat → Nat → Record, ∃ h, ∀ m, Record.DomBy (g m) h)
    ∧ (∀ h : Nat → Record, ∃ g, ¬ Record.DomBy g h) :=
  ⟨charge_stage_datum_bounded, record_stage_datum_unbounded,
    fun c n => ORecord.okle_kTop (c n),
    Record.germ_omega_family_bounded, Record.germ_no_top⟩

/-! ### The settling sheaf over the hull's cylinder covers -/

/-- The knowledge preorder on charges as a pre-value carrier. -/
def chargeKPreValue : Positing.Value.PreValueCategory where
  carrier := Charge
  le := Charge.KLE
  le_refl := Charge.kle_refl
  le_trans := fun {a b c} h1 h2 => Charge.kle_trans a b c h1 h2
  bot := Charge.kBot

/-- The knowledge order on records as a pre-value carrier. -/
def recordKPreValue : Positing.Value.PreValueCategory where
  carrier := Record
  le := Record.KLE
  le_refl := Record.kle_refl
  le_trans := fun {a b c} h1 h2 => Record.kle_trans a b c h1 h2
  bot := Record.kBot

/-- A settling datum over the hull's cylinder covers, valued in a pre-value
carrier: one value per depth-`n` cylinder, knowledge-monotone along
refinement — on every thread, the deeper cylinder's value dominates the
shallower one's. Nested cylinders are the only overlaps of the cover
system, so monotonicity along refinement is the agreement condition. -/
structure CylinderDatum (V : Positing.Value.PreValueCategory) where
  /-- The value held on each depth-`n` cylinder. -/
  at_ : (n : Nat) → dyadicTower.stage n → V.carrier
  /-- Along every thread, the values accumulate along refinement. -/
  mono : ∀ (t : dyadicTower.Thread) (n : Nat),
    V.le (at_ n (t.at_ n)) (at_ (n + 1) (t.at_ (n + 1)))

/-- A global section of a cylinder datum: a value at each hull point
dominating every cylinder value the point's thread passes through. -/
def CylinderDatum.GluesTo {V : Positing.Value.PreValueCategory}
    (D : CylinderDatum V) (g : dyadicTower.Thread → V.carrier) : Prop :=
  ∀ (t : dyadicTower.Thread) (n : Nat), V.le (D.at_ n (t.at_ n)) (g t)

/-- Any knowledge-monotone cylinder datum valued in a carrier with a top
element glues to the constant-`top` global section: it is boundedness of
the coefficient carrier that forces gluing, uniformly over every
`CylinderDatum`, not a fact special to `Charge`. -/
theorem cylinder_datum_glues_of_top {V : Positing.Value.PreValueCategory}
    (top : V.carrier) (le_top : ∀ x, V.le x top) (D : CylinderDatum V) :
    ∃ g, D.GluesTo g :=
  ⟨fun _ => top, fun t n => le_top (D.at_ n (t.at_ n))⟩

/-- Every charge-valued cylinder datum glues: the `Charge` instance of
`cylinder_datum_glues_of_top` at the top `⊤`. -/
theorem charge_cylinder_datum_glues (D : CylinderDatum chargeKPreValue) :
    ∃ g, D.GluesTo g :=
  cylinder_datum_glues_of_top Charge.kTop Charge.le_kTop D

theorem replicate_false_length : ∀ n : Nat, (List.replicate n false).length = n
  | 0 => rfl
  | n + 1 => congrArg (· + 1) (replicate_false_length n)

theorem replicate_false_take : ∀ (m n : Nat), m ≤ n →
    (List.replicate n false).take m = List.replicate m false
  | 0, _, _ => rfl
  | m + 1, n + 1, h => by
    show false :: (List.replicate n false).take m = false :: List.replicate m false
    rw [replicate_false_take m n (Nat.le_of_succ_le_succ h)]
  | m + 1, 0, h => absurd h (Nat.not_succ_le_zero m)

/-- The all-minimal point of the hull: the thread of all-`false` paths. -/
def zeroThread : dyadicTower.Thread where
  at_ n := ⟨List.replicate n false, replicate_false_length n⟩
  coh {m n} h := Subtype.ext (replicate_false_take m n h)

/-- **A record-valued cylinder datum with no global section**: the tally
climb along depth. Each depth-`n` cylinder holds `n` told-trues, so a
global value at any hull point would have to dominate every depth. -/
theorem record_cylinder_datum_not_glues :
    ∃ D : CylinderDatum recordKPreValue, ¬ ∃ g, D.GluesTo g := by
  refine ⟨⟨fun n _ => ⟨n, 0⟩, fun t n => ⟨Nat.le_succ n, Nat.le_refl 0⟩⟩, ?_⟩
  intro ⟨g, hg⟩
  exact absurd (hg zeroThread ((g zeroThread).pos + 1)).1 (Nat.not_succ_le_self _)

/-- **The settling sheaf over the hull's cylinder covers is gated by the
coefficient carrier.** With charge coefficients every knowledge-monotone
cylinder datum glues to a global section over the hull; with record
coefficients some cylinder datum glues to none. The obstruction is
invisible to the equality-agreement Čech `H¹` (which vanishes for every
datum, `Cohomology.h1_vanishes`); it lives in the order-valued reading of
the cover, and it opens exactly at the topless coefficient carrier. -/
theorem hull_settling_gluing_dichotomy :
    (∀ D : CylinderDatum chargeKPreValue, ∃ g, D.GluesTo g)
    ∧ (∃ D : CylinderDatum recordKPreValue, ¬ ∃ g, D.GluesTo g) :=
  ⟨charge_cylinder_datum_glues, record_cylinder_datum_not_glues⟩

/-! ### The Bernoulli cylinder law: the odometer's invariant mass -/

/-- A cylinder law over the dyadic tower: one pre-rational mass per cylinder
word, with a cylinder's mass the sum of its two children's and unit mass on
the empty word. Laws are stated at the `PreRat` setoid level. -/
structure CylinderLaw where
  /-- The mass held on the cylinder of a finite word. -/
  mass : List Bool → Real.Internal.PreRat
  /-- A cylinder's mass is the sum of its two children's. -/
  split : ∀ w : List Bool, Real.Internal.PreRat.equiv
    (Real.Internal.PreRat.add (mass (w ++ [false])) (mass (w ++ [true]))) (mass w)
  /-- The empty cylinder — the whole hull — carries mass one. -/
  total : Real.Internal.PreRat.equiv (mass []) Real.Internal.PreRat.one

/-- Invariance of a cylinder law under the adic successor. -/
def CylinderLaw.VershikInvariant (L : CylinderLaw) : Prop :=
  ∀ w : List Bool, Real.Internal.PreRat.equiv (L.mass (vershik w)) (L.mass w)

/-- The uniform mass `1 / 2 ^ n` of a depth-`n` cylinder. -/
def stageMass (n : Nat) : Real.Internal.PreRat :=
  ⟨1, Int.ofNat (2 ^ n), Real.Internal.int_ofNat_pos (Nat.two_pow_pos n)⟩

theorem stageMass_zero : stageMass 0 = Real.Internal.PreRat.one := rfl

theorem nat_split_quarter (t : Nat) : ((t + t) + (t + t)) * t = (t + t) * (t + t) :=
  calc ((t + t) + (t + t)) * t
      = t * ((t + t) + (t + t)) := Nat.mul_comm _ _
    _ = t * (t + t) + t * (t + t) := Nat.left_distrib _ _ _
    _ = (t + t) * t + (t + t) * t := by rw [Nat.mul_comm t (t + t)]
    _ = (t + t) * (t + t) := (Nat.left_distrib _ _ _).symm

theorem nat_stage_split (n : Nat) :
    (1 * 2 ^ (n + 1) + 1 * 2 ^ (n + 1)) * 2 ^ n = 1 * (2 ^ (n + 1) * 2 ^ (n + 1)) := by
  rw [Nat.one_mul, Nat.one_mul, Nat.pow_succ, Nat.mul_two (2 ^ n)]
  exact nat_split_quarter (2 ^ n)

/-- Halving: two copies of the depth-`(n + 1)` mass sum to the depth-`n`
mass. The cross-multiplication reduces along `Int.ofNat` to `nat_stage_split`. -/
theorem stageMass_split (n : Nat) :
    Real.Internal.PreRat.equiv
      (Real.Internal.PreRat.add (stageMass (n + 1)) (stageMass (n + 1))) (stageMass n) := by
  show Int.ofNat ((1 * 2 ^ (n + 1) + 1 * 2 ^ (n + 1)) * 2 ^ n)
     = Int.ofNat (1 * (2 ^ (n + 1) * 2 ^ (n + 1)))
  exact congrArg Int.ofNat (nat_stage_split n)

theorem length_append_singleton :
    ∀ (w : List Bool) (b : Bool), (w ++ [b]).length = w.length + 1
  | [], _ => rfl
  | _ :: w, b => congrArg (· + 1) (length_append_singleton w b)

/-- The Bernoulli mass of a cylinder word: `1 / 2 ^ length`. -/
def bernoulliMass (w : List Bool) : Real.Internal.PreRat := stageMass w.length

/-- Words of one length share one mass: each stage distribution is uniform. -/
theorem bernoulliMass_uniform {v w : List Bool} (h : v.length = w.length) :
    bernoulliMass v = bernoulliMass w :=
  congrArg stageMass h

theorem bernoulliMass_split (w : List Bool) :
    Real.Internal.PreRat.equiv
      (Real.Internal.PreRat.add
        (bernoulliMass (w ++ [false])) (bernoulliMass (w ++ [true])))
      (bernoulliMass w) := by
  show Real.Internal.PreRat.equiv
    (Real.Internal.PreRat.add
      (stageMass (w ++ [false]).length) (stageMass (w ++ [true]).length))
    (stageMass w.length)
  rw [length_append_singleton, length_append_singleton]
  exact stageMass_split w.length

/-- **The Bernoulli cylinder law**: the uniform mass `1 / 2 ^ n` per depth-`n`
cylinder splits across children and totals one. -/
def bernoulliLaw : CylinderLaw where
  mass := bernoulliMass
  split := bernoulliMass_split
  total := Real.Internal.PreRat.equiv_refl Real.Internal.PreRat.one

/-- The adic successor carries each cylinder to one of equal Bernoulli mass —
an equality of pre-rationals, via `vershik_length`. -/
theorem bernoulliMass_vershik (w : List Bool) :
    bernoulliMass (vershik w) = bernoulliMass w :=
  congrArg stageMass (vershik_length w)

/-- **The Bernoulli law is an invariant law of the odometer.** -/
theorem bernoulliLaw_vershik_invariant : bernoulliLaw.VershikInvariant := fun w => by
  show Real.Internal.PreRat.equiv (bernoulliMass (vershik w)) (bernoulliMass w)
  rw [bernoulliMass_vershik]
  exact Real.Internal.PreRat.equiv_refl (bernoulliMass w)

/-- The Bernoulli cylinder mass as a rational. -/
def bernoulli (w : List Bool) : Real.Internal.Rat :=
  Real.Internal.Rat.mk (bernoulliMass w)

/-- Split-additivity at the quotient level: the two child cylinders' masses
sum to the parent's. -/
theorem bernoulli_split (w : List Bool) :
    bernoulli (w ++ [false]) + bernoulli (w ++ [true]) = bernoulli w :=
  Real.Internal.Rat.mk_eq.mpr (bernoulliMass_split w)

theorem bernoulli_total : bernoulli [] = Real.Internal.Rat.one := rfl

theorem bernoulli_vershik (w : List Bool) : bernoulli (vershik w) = bernoulli w :=
  congrArg Real.Internal.Rat.mk (bernoulliMass_vershik w)

end Odometer
end Obsmetrologia
