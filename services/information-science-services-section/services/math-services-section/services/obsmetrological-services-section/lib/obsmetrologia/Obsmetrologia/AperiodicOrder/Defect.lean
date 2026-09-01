import Obsmetrologia.AperiodicOrder.Tiling.Classification
import Obsmetrologia.Dynamics.Flow.CurvatureRegime

/-!
# Defect as cohomological obstruction

A **defect** in a crystal, quasicrystal, or glass — a vacancy, dislocation, grain boundary, or any
local incompatibility that cannot be ironed out globally — is, abstractly, a nonzero local-to-global
obstruction. Obsmetrologia already carries that obstruction theory: the classifying invariant
`Settling.clInv ∈ H1Class`, zero exactly in the flat (strict/Scott) regimes and nonzero in the curved
(transfinite-bounded/aperiodic) ones. This module names the defect vocabulary on top of it.

A defect is `v.clInv ≠ 0`. The point is that this predicate is **inhabited** — `aperiodicWitness` is a defect (`aperiodicWitness_hasDefect`) — so the theory is not vacuous. That distinguishes it
from the finite strict/Scott Čech datum `Cohomology.Cech1`, where every cocycle glues
(`h1_vanishes`): on the flat sheaf there are no defects at all, which is precisely why the defect
predicate belongs at the regime-classified `Settling` level, where curvature can be nonzero.

The bridge to curvature: a defect forces a curved regime (`hasDefect_curved`) and hence non-vanishing
cohomology (`hasDefect_nonvanishing`); conversely, a settled (flat / cohomology-vanishing) regime is
defect-free (`no_defect_of_settles`, `no_defect_of_vanishing`). The converse "curved ⇒ defect" does
**not** hold — a curved regime may still carry the zero invariant — so only the one direction is
stated.

## Main definitions
* `HasDefect` — a settling carries a defect when its classifying invariant is nonzero.
* `Disclination.rot`, `Disclination.develop`, `Disclination.coneLoop`,
  `Disclination.dipoleLoop` — the concrete geometric carrier: developed walks on the
  hexagonal frame group, frames as vectors of the Eisenstein-integer plane.

## Main results
* `no_defect_of_settles` / `no_defect_of_vanishing` — flat / cohomology-vanishing regimes are defect-free.
* `hasDefect_curved` / `hasDefect_nonvanishing` — a defect forces a curved regime with non-vanishing H¹.
* `aperiodicWitness_hasDefect`, `defect_exists` — defects exist (the predicate is inhabited).
* `Disclination.disclination_holonomy_quantum` — the five-site is a curvature quantum
  of order six, a zero-separation 5–7 pair annihilates, and a separated pair is a
  dislocation with Burgers vector linear in the separation. Depends on no axioms.

## References
Corpus: `aperiodic-classification`, the curvature–regime correspondence. The crystal/glass defect
memos (defect = local-to-global obstruction); built on `AperiodicOrder.Tiling.Classification` and
`Flow.CurvatureRegime`.

## Tags
defect, dislocation, cohomological obstruction, classifying invariant, curvature, H1
-/

namespace Obsmetrologia
namespace AperiodicOrder.Defect

open Obsmetrologia.Flow.CurvatureRegime
open Obsmetrologia.AperiodicOrder.Tiling

/-- **A settling carries a defect** when its classifying invariant is nonzero — a nonzero
local-to-global obstruction (the abstract form of a vacancy / dislocation / grain boundary). -/
def HasDefect (v : Settling) : Prop := v.clInv ≠ H1Class.zero

/-- **A settled (flat) regime is defect-free.** In the strict/Scott regimes the classifying invariant
is zero (`clinv_zero_of_settles`), so no defect can be carried. -/
theorem no_defect_of_settles (v : Settling)
    (hr : v.regime = ClosureRegime.strict ∨ v.regime = ClosureRegime.scott) :
    ¬ HasDefect v := fun hd => hd (clinv_zero_of_settles v hr)

/-- **Cohomology-vanishing regimes are defect-free** — the `H¹ = 0` form of `no_defect_of_settles`,
via `vanishes_iff_flat`. -/
theorem no_defect_of_vanishing (v : Settling) (h : cohomologyVanishes v.regime = true) :
    ¬ HasDefect v :=
  fun hd => hd (clinv_zero_of_settles v ((vanishes_iff_flat v.regime).mp h))

/-- **A defect forces a curved regime.** The contrapositive of `clinv_zero_of_settles`: a nonzero
classifying invariant rules out the flat regimes, leaving transfinite-bounded or aperiodic. -/
theorem hasDefect_curved (v : Settling) (h : HasDefect v) : IsCurved v.regime := by
  rw [curved_iff_not_flat]
  intro hflat
  exact h (clinv_zero_of_settles v hflat)

/-- **A defect forces non-vanishing cohomology** (`H¹ ≠ 0`): `hasDefect_curved` read through
`nonvanishes_iff_curved`. The defect is a curvature event. -/
theorem hasDefect_nonvanishing (v : Settling) (h : HasDefect v) :
    cohomologyVanishes v.regime = false :=
  (nonvanishes_iff_curved v.regime).mpr (hasDefect_curved v h)

/-- **The aperiodic witness is a defect** — the defect predicate is inhabited, so the theory
is not vacuous (unlike the flat Čech datum, where `h1_vanishes` kills every defect). -/
theorem aperiodicWitness_hasDefect : HasDefect aperiodicWitness :=
  aperiodicWitness_clinv_nonzero

/-- **Defects exist**: a settling in the aperiodic regime carrying a nonzero invariant. -/
theorem defect_exists : ∃ v : Settling, v.regime = ClosureRegime.aperiodic ∧ HasDefect v :=
  ⟨aperiodicWitness, rfl, aperiodicWitness_hasDefect⟩

/-! ## The disclination carrier: developed walks on the hexagonal frame group

The concrete geometric defect underneath the abstract predicate. A frame on the
hexagonal (triangular-lattice) carrier is not a posited finite type: it is a vector
of the derived plane of Eisenstein-integer coordinates, turned by the derived
rotation `rot`; the six-ness of the frame group is a theorem about the `rot`-orbit
of `(1, 0)` (`frame_orbit_six`, `frame_orbit_not_before_six`), declared nowhere. A
six-coordinated site's boundary loop develops closed — flat, no defect. A
five-coordinated site is a **disclination**: its loop returns the frame rotated —
one quantum of rotational holonomy (curvature) — and the development first closes at
the **sixth** traversal. A seven-site carries the opposite charge: a 5–7 pair at
zero separation **annihilates** (its circuit develops to the identity), while a
5–7 pair held at positive separation is a **dislocation** — trivial rotational
holonomy, nonzero translational holonomy — with Burgers vector growing linearly in
the separation (`(0, −1)`, `(0, −2)`, `(0, −3)` at separations one, two, three).
Corpus far frontier: `dev/content/notes/2026/06/26/crystal_mathematical_frontier_2026.md`
§4.5 (KTHNY two-stage melting by defect unbinding) and §5.5 (translational
holonomy = torsion, rotational holonomy = curvature). -/

namespace Disclination

/-- A vector of the derived plane: Eisenstein-integer coordinates over the basis
`(1, ζ)`, `ζ = e^{iπ/3}`. -/
abbrev Vec := Int × Int

/-- Rotation by one sixth of a turn: `ζ·(a + bζ) = −b + (a+b)ζ`. -/
def rot (v : Vec) : Vec := (-(v.2), v.1 + v.2)

/-- Iterated rotation. -/
def rotPow : Nat → Vec → Vec
  | 0, v => v
  | n + 1, v => rot (rotPow n v)

/-- A developing state: the current frame — a plane vector — and the developed
position. -/
abbrev State := Vec × Vec

/-- The based start state: frame `(1, 0)` at the origin. -/
def start : State := ((1, 0), (0, 0))

/-- One move: turn the frame by `t` sixths of a turn, then step one frame-unit
forward. -/
def move (s : State) (t : Nat) : State :=
  (rotPow t s.1, (s.2.1 + (rotPow t s.1).1, s.2.2 + (rotPow t s.1).2))

/-- Develop a walk from a state: run its moves left to right. -/
def develop (w : List Nat) (s : State) : State := w.foldl move s

/-- The boundary loop of a `k`-coordinated site: `k` unit edges, one sixth-turn at
each. -/
def coneLoop (k : Nat) : List Nat := List.replicate k 1

/-- `n` consecutive traversals of the `k`-site boundary loop. -/
def iterateLoop (k n : Nat) : List Nat := List.flatten (List.replicate n (coneLoop k))

/-- Development composes along concatenation — holonomies compose. -/
theorem develop_append (w₁ w₂ : List Nat) (s : State) :
    develop (w₁ ++ w₂) s = develop w₂ (develop w₁ s) := by
  induction w₁ generalizing s with
  | nil => rfl
  | cons t w ih => exact ih (move s t)

/-- The frame orbit closes at six turns. -/
theorem frame_orbit_six : rotPow 6 (1, 0) = ((1 : Int), (0 : Int)) := rfl

/-- The frame orbit closes at no earlier positive count: the derived rotation's orbit
has exactly six frames. Six is a theorem of the plane, not a declared carrier. -/
theorem frame_orbit_not_before_six :
    rotPow 1 (1, 0) ≠ ((1 : Int), (0 : Int)) ∧ rotPow 2 (1, 0) ≠ ((1 : Int), (0 : Int))
    ∧ rotPow 3 (1, 0) ≠ ((1 : Int), (0 : Int)) ∧ rotPow 4 (1, 0) ≠ ((1 : Int), (0 : Int))
    ∧ rotPow 5 (1, 0) ≠ ((1 : Int), (0 : Int)) := by
  refine ⟨?_, ?_, ?_, ?_, ?_⟩ <;> decide

/-- **The flat loop closes.** The boundary loop of a six-coordinated site develops to
the identity: frame and position both return in one traversal. -/
theorem hex_loop_closes : develop (coneLoop 6) start = start := rfl

/-- **A five-site has nonzero rotational holonomy**: its boundary loop returns the
frame rotated — one curvature quantum. -/
theorem five_loop_frame :
    (develop (coneLoop 5) start).1 = ((1 : Int), (-1 : Int))
    ∧ (develop (coneLoop 5) start).1 ≠ start.1 :=
  ⟨rfl, by decide⟩

/-- A seven-site's loop returns the frame rotated the other way. -/
theorem seven_loop_frame : (develop (coneLoop 7) start).1 = ((0 : Int), (1 : Int)) := rfl

/-- **A zero-separation 5–7 pair annihilates**: traversing both boundary loops from
one basepoint develops to the identity — opposite charges, no residue. -/
theorem five_seven_annihilate :
    develop (coneLoop 5 ++ coneLoop 7) start = start := rfl

/-- **The disclination does a six and collapses to one.** Iterating the five-site's
boundary loop, the development closes at the sixth traversal and at no earlier one:
the developed position already fails to return. -/
theorem five_loop_does_a_six :
    develop (iterateLoop 5 6) start = start
    ∧ (develop (iterateLoop 5 1) start).2 ≠ ((0 : Int), (0 : Int))
    ∧ (develop (iterateLoop 5 2) start).2 ≠ ((0 : Int), (0 : Int))
    ∧ (develop (iterateLoop 5 3) start).2 ≠ ((0 : Int), (0 : Int))
    ∧ (develop (iterateLoop 5 4) start).2 ≠ ((0 : Int), (0 : Int))
    ∧ (develop (iterateLoop 5 5) start).2 ≠ ((0 : Int), (0 : Int)) := by
  refine ⟨rfl, ?_, ?_, ?_, ?_, ?_⟩ <;> decide

/-- The 5–7 dipole circuit at separation `sep`: around the five-site, `sep` steps out,
around the seven-site, U-turn, `sep` steps back, U-turn. -/
def dipoleLoop (sep : Nat) : List Nat :=
  coneLoop 5 ++ List.replicate sep 0 ++ coneLoop 7
    ++ [3] ++ List.replicate sep 0 ++ [3]

/-- **A separated 5–7 pair is a dislocation.** At separations one, two, and three the
dipole circuit returns the frame unrotated — trivial rotational holonomy — while the
developed position fails to close by a Burgers vector growing linearly with the
separation. -/
theorem dipole_dislocation :
    (develop (dipoleLoop 1) start).1 = start.1
    ∧ (develop (dipoleLoop 1) start).2 = ((0 : Int), (-1 : Int))
    ∧ (develop (dipoleLoop 2) start).2 = ((0 : Int), (-2 : Int))
    ∧ (develop (dipoleLoop 3) start).2 = ((0 : Int), (-3 : Int)) :=
  ⟨rfl, rfl, rfl, rfl⟩

/-- The dipole's Burgers vector is nonzero at separation three. -/
theorem dipole_burgers_ne_zero :
    (develop (dipoleLoop 3) start).2 ≠ ((0 : Int), (0 : Int)) := by decide

/-- Development is equivariant under translation of the developed position:
the frame is position-independent and the position shifts by the start. -/
theorem develop_shift : ∀ (w : List Nat) (f p : Vec),
    develop w (f, p)
      = ((develop w (f, ((0 : Int), (0 : Int)))).1,
         (p.1 + (develop w (f, ((0 : Int), (0 : Int)))).2.1,
          p.2 + (develop w (f, ((0 : Int), (0 : Int)))).2.2))
  | [], f, p => by
    show (f, p) = (f, (p.1 + 0, p.2 + 0))
    rw [Int.add_zero, Int.add_zero]
  | t :: w, f, p => by
    show develop w (move (f, p) t) = _
    rw [show develop (t :: w) (f, ((0 : Int), (0 : Int)))
        = develop w (move (f, ((0 : Int), (0 : Int))) t) from rfl,
      show move (f, ((0 : Int), (0 : Int))) t
        = (rotPow t f, ((0 : Int) + (rotPow t f).1, (0 : Int) + (rotPow t f).2)) from rfl]
    show develop w (rotPow t f, (p.1 + (rotPow t f).1, p.2 + (rotPow t f).2)) = _
    rw [develop_shift w (rotPow t f) ((p.1 + (rotPow t f).1, p.2 + (rotPow t f).2)),
      develop_shift w (rotPow t f) (((0 : Int) + (rotPow t f).1, (0 : Int) + (rotPow t f).2))]
    refine Prod.ext rfl (Prod.ext ?_ ?_) <;> (dsimp only; rw [Int.zero_add, Int.add_assoc])

/-- A straight walk carries the position `n` frame-units forward and turns
nothing. -/
theorem develop_straight : ∀ (n : Nat) (f p : Vec),
    develop (List.replicate n 0) (f, p)
      = (f, (p.1 + (n : Int) * f.1, p.2 + (n : Int) * f.2))
  | 0, f, p => by
    show (f, p) = (f, (p.1 + 0 * f.1, p.2 + 0 * f.2))
    rw [Int.zero_mul, Int.zero_mul, Int.add_zero, Int.add_zero]
  | n + 1, f, p => by
    show develop (List.replicate n 0) (move (f, p) 0) = _
    show develop (List.replicate n 0) (f, (p.1 + f.1, p.2 + f.2)) = _
    rw [develop_straight n f ((p.1 + f.1, p.2 + f.2)),
      show (((n + 1 : Nat) : Int)) = (n : Int) + 1 from rfl,
      Int.add_mul, Int.add_mul, Int.one_mul, Int.one_mul]
    refine Prod.ext rfl (Prod.ext ?_ ?_)
    · dsimp only
      rw [Int.add_assoc, Int.add_comm f.1]
    · dsimp only
      rw [Int.add_assoc, Int.add_comm f.2]

/-- **The Burgers vector is linear in the separation.** The 5–7 dipole
circuit at any separation returns the frame unrotated and the position
displaced by exactly `(0, −sep)`: the dislocation content of the pair is
the separation. -/
theorem dipole_burgers_linear (sep : Nat) :
    develop (dipoleLoop sep) start
      = (((1 : Int), (0 : Int)), ((0 : Int), -(sep : Int))) := by
  have s2 : develop (coneLoop 5 ++ List.replicate sep 0) start
      = (((1 : Int), (-1 : Int)), ((sep : Int) - 1, -(sep : Int))) := by
    rw [develop_append,
      show develop (coneLoop 5) start
        = (((1 : Int), (-1 : Int)), ((-1 : Int), (0 : Int))) from rfl,
      develop_straight sep ((1 : Int), (-1 : Int))]
    refine Prod.ext rfl (Prod.ext ?_ ?_)
    · dsimp only
      rw [Int.mul_one, Int.add_comm, Int.sub_eq_add_neg]
    · dsimp only
      rw [Int.zero_add, Int.mul_neg, Int.mul_one]
  have s3 : develop ((coneLoop 5 ++ List.replicate sep 0) ++ coneLoop 7) start
      = (((1 : Int), (0 : Int)), ((sep : Int), -(sep : Int))) := by
    rw [develop_append, s2, develop_shift (coneLoop 7),
      show develop (coneLoop 7) (((1 : Int), (-1 : Int)), ((0 : Int), (0 : Int)))
        = (((1 : Int), (0 : Int)), ((1 : Int), (0 : Int))) from rfl]
    refine Prod.ext rfl (Prod.ext ?_ ?_)
    · dsimp only
      rw [Int.sub_add_cancel]
    · dsimp only
      rw [Int.add_zero]
  have s4 : develop (((coneLoop 5 ++ List.replicate sep 0) ++ coneLoop 7) ++ [3]) start
      = (((-1 : Int), (0 : Int)), ((sep : Int) - 1, -(sep : Int))) := by
    rw [develop_append, s3, develop_shift [3],
      show develop [3] (((1 : Int), (0 : Int)), ((0 : Int), (0 : Int)))
        = (((-1 : Int), (0 : Int)), ((-1 : Int), (0 : Int))) from rfl]
    refine Prod.ext rfl (Prod.ext ?_ ?_)
    · dsimp only
      rw [Int.sub_eq_add_neg]
    · dsimp only
      rw [Int.add_zero]
  have s5 : develop ((((coneLoop 5 ++ List.replicate sep 0) ++ coneLoop 7) ++ [3])
        ++ List.replicate sep 0) start
      = (((-1 : Int), (0 : Int)), ((-1 : Int), -(sep : Int))) := by
    rw [develop_append, s4, develop_straight sep ((-1 : Int), (0 : Int))]
    refine Prod.ext rfl (Prod.ext ?_ ?_)
    · dsimp only
      rw [Int.mul_neg, Int.mul_one, Int.sub_eq_add_neg, Int.add_right_comm,
        Int.add_right_neg, Int.zero_add]
    · dsimp only
      rw [Int.mul_zero, Int.add_zero]
  show develop (((((coneLoop 5 ++ List.replicate sep 0) ++ coneLoop 7)
    ++ [3]) ++ List.replicate sep 0) ++ [3]) start = _
  rw [develop_append, s5, develop_shift [3],
    show develop [3] (((-1 : Int), (0 : Int)), ((0 : Int), (0 : Int)))
      = (((1 : Int), (0 : Int)), ((1 : Int), (0 : Int))) from rfl]
  refine Prod.ext rfl (Prod.ext ?_ ?_)
  · dsimp only
    rfl
  · dsimp only
    rw [Int.add_zero]

/-- **The dislocation content vanishes exactly at contact.** The dipole's
Burgers vector is zero iff the separation is zero: `five_seven_annihilate`
is the unique minimum of the pair's translational holonomy. -/
theorem dipole_burgers_zero_iff_contact (sep : Nat) :
    (develop (dipoleLoop sep) start).2 = ((0 : Int), (0 : Int)) ↔ sep = 0 := by
  rw [dipole_burgers_linear]
  constructor
  · intro h
    have h2 : -(sep : Int) = 0 := congrArg Prod.snd h
    exact Int.ofNat.inj (Int.neg_eq_zero.mp h2)
  · intro h
    rw [h]
    rfl

/-- A configuration of dipoles: the concatenated circuit of one 5–7 dipole
per listed separation, traversed from one basepoint. -/
def configLoop (seps : List Nat) : List Nat :=
  List.flatten (seps.map dipoleLoop)

/-- **The obstruction functional is additive.** A configuration of dipoles
develops to the identity frame with the position displaced by the sum of
the separations: the total dislocation content of a many-body
configuration is the sum of its two-body contents. -/
theorem config_burgers_additive : ∀ seps : List Nat,
    develop (configLoop seps) start
      = (((1 : Int), (0 : Int)), ((0 : Int), -((seps.sum : Nat) : Int)))
  | [] => rfl
  | s :: seps => by
    show develop (dipoleLoop s ++ configLoop seps) start = _
    rw [develop_append, dipole_burgers_linear s, develop_shift (configLoop seps),
      show ((((1 : Int), (0 : Int)), ((0 : Int), (0 : Int))) : State) = start from rfl,
      config_burgers_additive seps]
    refine Prod.ext rfl (Prod.ext ?_ ?_)
    · dsimp only
      rw [Int.add_zero]
    · dsimp only
      rw [show (((s :: seps).sum : Nat) : Int) = ((s : Int) + ((seps.sum : Nat) : Int)) from rfl,
        Int.neg_add]

/-- **A configuration's dislocation content vanishes exactly at universal
contact**: the total Burgers vector is zero iff every separation is zero —
each pair annihilated, none merely cancelled against another. -/
theorem config_burgers_zero_iff_contact (seps : List Nat) :
    (develop (configLoop seps) start).2 = ((0 : Int), (0 : Int))
      ↔ ∀ s, s ∈ seps → s = 0 := by
  rw [config_burgers_additive]
  constructor
  · intro h
    have h2 : -((seps.sum : Nat) : Int) = 0 := congrArg Prod.snd h
    have h3 : seps.sum = 0 := Int.ofNat.inj (Int.neg_eq_zero.mp h2)
    have hzero : ∀ l : List Nat, l.sum = 0 → ∀ s, s ∈ l → s = 0 := by
      intro l
      induction l with
      | nil =>
        intro _ s hs
        cases hs
      | cons a l ih =>
        intro hsum s hs
        have ha : a + l.sum = 0 := hsum
        cases hs with
        | head => exact Nat.eq_zero_of_add_eq_zero_right ha
        | tail _ hmem => exact ih (Nat.eq_zero_of_add_eq_zero_left ha) s hmem
    exact hzero seps h3
  · intro h
    have hsum : ∀ l : List Nat, (∀ s, s ∈ l → s = 0) → l.sum = 0 := by
      intro l
      induction l with
      | nil => intro _; rfl
      | cons a l ih =>
        intro hl
        show a + l.sum = 0
        rw [hl a (List.mem_cons_self), ih (fun s hs => hl s (List.mem_cons_of_mem a hs))]
    rw [hsum seps h]
    rfl

/-! ### The descent dynamics: sliding defects annihilate -/

/-- One settling step: every dipole slides one unit toward contact. -/
def slide (seps : List Nat) : List Nat := seps.map Nat.pred

/-- Iterated sliding. -/
def slideIter : Nat → List Nat → List Nat
  | 0, seps => seps
  | k + 1, seps => slide (slideIter k seps)

theorem map_sub_zero : ∀ l : List Nat, l.map (fun s => s - 0) = l
  | [] => rfl
  | a :: l => by
    show (a - 0) :: List.map (fun s => s - 0) l = a :: l
    rw [map_sub_zero l]
    rfl

theorem map_pred_map_sub (k : Nat) : ∀ l : List Nat,
    (l.map (fun s => s - k)).map Nat.pred = l.map (fun s => s - (k + 1))
  | [] => rfl
  | a :: l => by
    show (Nat.pred (a - k)) :: (List.map (fun s => s - k) l).map Nat.pred = _
    rw [map_pred_map_sub k l]
    rfl

/-- Sliding `k` steps subtracts `k` from every separation. -/
theorem slideIter_eq_map_sub : ∀ (k : Nat) (seps : List Nat),
    slideIter k seps = seps.map (fun s => s - k)
  | 0, seps => (map_sub_zero seps).symm
  | k + 1, seps => by
    show slide (slideIter k seps) = _
    rw [slideIter_eq_map_sub k seps]
    exact map_pred_map_sub k seps

/-- The total obstruction never increases along a slide. -/
theorem sum_slide_le : ∀ seps : List Nat, (slide seps).sum ≤ seps.sum
  | [] => Nat.le_refl 0
  | a :: l => by
    show Nat.pred a + (slide l).sum ≤ a + l.sum
    exact Nat.add_le_add (Nat.pred_le a) (sum_slide_le l)

/-- **The force is strictly positive off the vacuum**: a configuration with
an unannihilated pair strictly lowers its total obstruction in one slide. -/
theorem sum_slide_lt : ∀ seps : List Nat,
    (∃ s, s ∈ seps ∧ s ≠ 0) → (slide seps).sum < seps.sum
  | [], ⟨_, hs, _⟩ => absurd hs (List.not_mem_nil)
  | a :: l, h => by
    obtain ⟨s, hs, hne⟩ := h
    cases hs with
    | head =>
      cases a with
      | zero => exact absurd rfl hne
      | succ b =>
        show b + (slide l).sum < Nat.succ b + l.sum
        rw [Nat.succ_add]
        exact Nat.lt_succ_of_le (Nat.add_le_add (Nat.le_refl b) (sum_slide_le l))
    | tail _ hmem =>
      show Nat.pred a + (slide l).sum < a + l.sum
      exact Nat.add_lt_add_of_le_of_lt (Nat.pred_le a) (sum_slide_lt l ⟨s, hmem, hne⟩)

/-- **The equilibria are exactly the vacua**: a configuration is fixed by
the slide iff every pair is annihilated. -/
theorem slide_fixed_iff_vacuum : ∀ seps : List Nat,
    slide seps = seps ↔ ∀ s, s ∈ seps → s = 0
  | [] => Iff.intro (fun _ s hs => nomatch hs) (fun _ => rfl)
  | a :: l => by
    constructor
    · intro h s hs
      have h2 := List.cons.inj h
      cases hs with
      | head =>
        cases a with
        | zero => rfl
        | succ b => exact absurd h2.1.symm (Nat.succ_ne_self b)
      | tail _ hmem => exact (slide_fixed_iff_vacuum l).mp h2.2 s hmem
    · intro h
      show Nat.pred a :: slide l = a :: l
      rw [h a (List.mem_cons_self),
        (slide_fixed_iff_vacuum l).mpr (fun s hs => h s (List.mem_cons_of_mem a hs))]
      rfl

theorem nat_left_le_max (a b : Nat) : a ≤ max a b := by
  rw [Nat.max_def]
  split
  · assumption
  · exact Nat.le_refl a

theorem nat_right_le_max (a b : Nat) : b ≤ max a b := by
  rw [Nat.max_def]
  split
  · exact Nat.le_refl b
  · next hn => exact Nat.le_of_succ_le (Nat.gt_of_not_le hn)

theorem nat_sub_eq_zero_of_le {a b : Nat} (h : a ≤ b) : a - b = 0 := by
  induction h with
  | refl => exact Nat.sub_self a
  | step _ ih => exact congrArg Nat.pred ih

theorem le_foldr_max : ∀ (l : List Nat) (a : Nat), a ∈ l → a ≤ l.foldr max 0
  | b :: l, a, ha => by
    cases ha with
    | head => exact nat_left_le_max _ (l.foldr max 0)
    | tail _ hmem =>
      exact Nat.le_trans (le_foldr_max l a hmem) (nat_right_le_max b (l.foldr max 0))

/-- **Collapse completes at the horizon.** After as many slides as the
largest separation, every pair is at contact and the configuration's total
Burgers vector is zero: the settling stage of the descent is the
configuration's diameter, and its settled value is the vacuum. -/
theorem slide_collapse (seps : List Nat) :
    (develop (configLoop (slideIter (seps.foldr max 0) seps)) start).2
      = ((0 : Int), (0 : Int)) := by
  refine (config_burgers_zero_iff_contact _).mpr ?_
  rw [slideIter_eq_map_sub]
  intro s hs
  have hz : ∀ l : List Nat, (∀ a, a ∈ l → a ≤ seps.foldr max 0) →
      ∀ s, s ∈ l.map (fun x => x - seps.foldr max 0) → s = 0 := by
    intro l
    induction l with
    | nil =>
      intro _ s hs
      cases hs
    | cons a l ih =>
      intro hle s hs
      cases hs with
      | head => exact nat_sub_eq_zero_of_le (hle a (List.mem_cons_self))
      | tail _ hmem =>
        exact ih (fun b hb => hle b (List.mem_cons_of_mem a hb)) s hmem
  exact hz seps (le_foldr_max seps) s hs

/-- **Obstruction descent.** The slide dynamics on dipole configurations:
the total obstruction is non-increasing, strictly decreasing off the
vacuum, its fixed points are exactly the annihilated configurations, and
the descent reaches zero total Burgers vector in as many stages as the
largest separation. -/
theorem obstruction_descent (seps : List Nat) :
    ((slide seps).sum ≤ seps.sum)
    ∧ ((∃ s, s ∈ seps ∧ s ≠ 0) → (slide seps).sum < seps.sum)
    ∧ (slide seps = seps ↔ ∀ s, s ∈ seps → s = 0)
    ∧ (develop (configLoop (slideIter (seps.foldr max 0) seps)) start).2
        = ((0 : Int), (0 : Int)) :=
  ⟨sum_slide_le seps, sum_slide_lt seps, slide_fixed_iff_vacuum seps,
    slide_collapse seps⟩

/-- Bundles the disclination carrier: the frame orbit has order exactly six; the flat
six-loop closes in one traversal; the five-site's loop has nonzero frame holonomy and
first closes at the sixth traversal; a zero-separation 5–7 pair annihilates; and a
separated 5–7 pair is a dislocation — trivial rotational holonomy with nonzero
Burgers vector. -/
theorem disclination_holonomy_quantum :
    rotPow 6 (1, 0) = ((1 : Int), (0 : Int))
    ∧ develop (coneLoop 6) start = start
    ∧ (develop (coneLoop 5) start).1 ≠ start.1
    ∧ develop (iterateLoop 5 6) start = start
    ∧ develop (coneLoop 5 ++ coneLoop 7) start = start
    ∧ ((develop (dipoleLoop 3) start).1 = start.1
        ∧ (develop (dipoleLoop 3) start).2 ≠ ((0 : Int), (0 : Int))) :=
  ⟨frame_orbit_six, hex_loop_closes, five_loop_frame.2, five_loop_does_a_six.1,
    five_seven_annihilate, ⟨rfl, dipole_burgers_ne_zero⟩⟩

/-! ### Charge conservation: the rotational holonomy is the turn count

The developed frame of a walk depends only on the walk's total turn count —
straight segments are invisible to it. The turn counts act through the frame
orbit, on which the derived rotation has order six
(`rotPow_six_of_frameMem` — the orbit-wide form of `frame_orbit_six`), so a
seven-cone is one quantum of excess, a five-cone one quantum of deficit, and
a U-turn half a frame. A dipole circuit is frame-neutral at every separation
because its charge word cancels — deficit against excess, half-turn against
half-turn (`dipole_frame_neutral`). The slide dynamics edits only straight
segments, so a configuration's rotational charge is invariant along the whole
descent: `slide_collapse` discharges the translational content, while an
unpaired five-site's quantum has no discharge along the slide — only an
opposite cone annihilates it. -/

/-- Iterated rotation composes additively. -/
theorem rotPow_add : ∀ (m n : Nat) (v : Vec),
    rotPow (m + n) v = rotPow n (rotPow m v)
  | _, 0, _ => rfl
  | m, n + 1, v => congrArg rot (rotPow_add m n v)

/-- Membership in the frame orbit: the rot-orbit of the base frame `(1, 0)`. -/
abbrev FrameMem (v : Vec) : Prop :=
  v = (1, 0) ∨ v = (0, 1) ∨ v = (-1, 1) ∨ v = (-1, 0) ∨ v = (0, -1) ∨ v = (1, -1)

theorem frameMem_base : FrameMem (1, 0) := Or.inl rfl

theorem frameMem_rot {v : Vec} (h : FrameMem v) : FrameMem (rot v) := by
  rcases h with rfl | rfl | rfl | rfl | rfl | rfl <;> decide

theorem frameMem_rotPow : ∀ (n : Nat) {v : Vec}, FrameMem v → FrameMem (rotPow n v)
  | 0, _, h => h
  | n + 1, _, h => frameMem_rot (frameMem_rotPow n h)

/-- **The derived rotation has order six on the frame orbit** — the
orbit-wide form of `frame_orbit_six`. -/
theorem rotPow_six_of_frameMem {v : Vec} (h : FrameMem v) : rotPow 6 v = v := by
  rcases h with rfl | rfl | rfl | rfl | rfl | rfl <;> decide

/-- A seven-cone's count is one quantum of excess: on the orbit, seven turns
act as one. -/
theorem rotPow_seven_of_frameMem {v : Vec} (h : FrameMem v) : rotPow 7 v = rot v :=
  congrArg rot (rotPow_six_of_frameMem h)

/-- Two U-turns are a full frame: on the orbit, a pair of half-turns acts as
the identity. -/
theorem rotPow_uturn_pair_of_frameMem {v : Vec} (h : FrameMem v) :
    rotPow 3 (rotPow 3 v) = v :=
  (rotPow_add 3 3 v).symm.trans (rotPow_six_of_frameMem h)

/-- The based frame orbit has period six. -/
theorem rotPow_six_add (n : Nat) : rotPow (n + 6) (1, 0) = rotPow n (1, 0) :=
  (rotPow_add n 6 (1, 0)).trans
    (rotPow_six_of_frameMem (frameMem_rotPow n frameMem_base))

/-- The based orbit closes at every multiple of six turns. -/
theorem rotPow_base_six_mul : ∀ k : Nat, rotPow (6 * k) (1, 0) = ((1 : Int), (0 : Int))
  | 0 => rfl
  | k + 1 => (rotPow_six_add (6 * k)).trans (rotPow_base_six_mul k)

/-- The based orbit closes only at multiples of six turns. -/
theorem six_mul_of_rotPow_base : ∀ n : Nat,
    rotPow n (1, 0) = ((1 : Int), (0 : Int)) → ∃ k, n = 6 * k
  | 0, _ => ⟨0, rfl⟩
  | 1, h => absurd h (by decide)
  | 2, h => absurd h (by decide)
  | 3, h => absurd h (by decide)
  | 4, h => absurd h (by decide)
  | 5, h => absurd h (by decide)
  | n + 6, h => by
    rw [rotPow_six_add n] at h
    obtain ⟨k, rfl⟩ := six_mul_of_rotPow_base n h
    exact ⟨k + 1, rfl⟩

/-- **The frame charge of a walk is its total turn.** The developed frame
depends only on the turn sum: straight segments do not move it. -/
theorem develop_fst_eq_rotPow_sum : ∀ (w : List Nat) (f p : Vec),
    (develop w (f, p)).1 = rotPow w.sum f
  | [], _, _ => rfl
  | t :: w, f, p =>
    (develop_fst_eq_rotPow_sum w (rotPow t f)
        (p.1 + (rotPow t f).1, p.2 + (rotPow t f).2)).trans
      (rotPow_add t w.sum f).symm

/-- **A based walk's frame closes exactly when its turn count is a multiple
of six** — the rotational charge is the turn count modulo six. -/
theorem develop_frame_closed_iff (w : List Nat) :
    (develop w start).1 = start.1 ↔ ∃ k, w.sum = 6 * k :=
  (develop_fst_eq_rotPow_sum w (1, 0) (0, 0) ▸
    ⟨six_mul_of_rotPow_base w.sum, fun ⟨k, hk⟩ => hk ▸ rotPow_base_six_mul k⟩ :
    (develop w start).1 = start.1 ↔ ∃ k, w.sum = 6 * k)

theorem sum_replicate_zero : ∀ n : Nat, (List.replicate n (0 : Nat)).sum = 0
  | 0 => rfl
  | n + 1 => by
    show 0 + (List.replicate n (0 : Nat)).sum = 0
    rw [sum_replicate_zero n]

theorem sum_append : ∀ l₁ l₂ : List Nat, (l₁ ++ l₂).sum = l₁.sum + l₂.sum
  | [], l₂ => (Nat.zero_add l₂.sum).symm
  | a :: l₁, l₂ => by
    show a + (l₁ ++ l₂).sum = a + l₁.sum + l₂.sum
    rw [sum_append l₁ l₂, Nat.add_assoc]

/-- A `k`-site's boundary loop has turn count `k`. -/
theorem coneLoop_sum : ∀ k : Nat, (coneLoop k).sum = k
  | 0 => rfl
  | k + 1 => by
    show 1 + (coneLoop k).sum = k + 1
    rw [coneLoop_sum k, Nat.add_comm]

/-- **The coordination census**: a `k`-site's boundary loop is frame-flat
exactly when `k` is a multiple of six — the flat coordination of
`hex_loop_closes`. -/
theorem cone_frame_closed_iff (k : Nat) :
    (develop (coneLoop k) start).1 = start.1 ↔ ∃ m, k = 6 * m :=
  ⟨fun h =>
    match (develop_frame_closed_iff (coneLoop k)).mp h with
    | ⟨m, hm⟩ => ⟨m, (coneLoop_sum k).symm.trans hm⟩,
   fun ⟨m, hm⟩ =>
    (develop_frame_closed_iff (coneLoop k)).mpr ⟨m, (coneLoop_sum k).trans hm⟩⟩

/-- The frame charge composes along concatenation: the second walk's turn
count acts on the first walk's developed frame. -/
theorem develop_fst_append (w₁ w₂ : List Nat) (s : State) :
    (develop (w₁ ++ w₂) s).1 = rotPow w₂.sum (develop w₁ s).1 := by
  rw [develop_append]
  exact develop_fst_eq_rotPow_sum w₂ (develop w₁ s).1 (develop w₁ s).2

/-- A configuration of cones: the concatenated boundary loops of the listed
coordinations, traversed from one basepoint. -/
def coneConfig (ks : List Nat) : List Nat := List.flatten (ks.map coneLoop)

/-- A cone configuration's turn count is its total coordination. -/
theorem coneConfig_sum : ∀ ks : List Nat, (coneConfig ks).sum = ks.sum
  | [] => rfl
  | k :: ks => by
    show (coneLoop k ++ coneConfig ks).sum = k + ks.sum
    rw [sum_append, coneLoop_sum, coneConfig_sum ks]

/-- **The neutral sectors**: a configuration of cones is frame-flat exactly
when its total coordination is a multiple of six. The frame component of
`five_seven_annihilate` is the `[5, 7]` instance. -/
theorem coneConfig_frame_closed_iff (ks : List Nat) :
    (develop (coneConfig ks) start).1 = start.1 ↔ ∃ m, ks.sum = 6 * m :=
  ⟨fun h =>
    match (develop_frame_closed_iff (coneConfig ks)).mp h with
    | ⟨m, hm⟩ => ⟨m, (coneConfig_sum ks).symm.trans hm⟩,
   fun ⟨m, hm⟩ =>
    (develop_frame_closed_iff (coneConfig ks)).mpr ⟨m, (coneConfig_sum ks).trans hm⟩⟩

/-- **A dipole is frame-neutral at every separation**: its circuit preserves
every orbit frame. The charge word cancels — the five-cone's deficit quantum
closes against the seven-cone's excess quantum, and the two U-turns pair to
a full frame; the straight segments are invisible. -/
theorem dipole_frame_neutral (sep : Nat) (p : Vec) {v : Vec} (h : FrameMem v) :
    (develop (dipoleLoop sep) (v, p)).1 = v := by
  rw [develop_fst_eq_rotPow_sum]
  show rotPow (coneLoop 5 ++ List.replicate sep 0 ++ coneLoop 7
      ++ [3] ++ List.replicate sep 0 ++ [3]).sum v = v
  rw [sum_append, sum_append, sum_append, sum_append, sum_append,
    sum_replicate_zero sep]
  show rotPow (5 + (0 + (7 + (3 + (0 + 3))))) v = v
  rw [rotPow_add 5 (0 + (7 + (3 + (0 + 3)))) v]
  show rotPow (7 + (3 + (0 + 3))) (rotPow 5 v) = v
  rw [rotPow_add 7 (3 + (0 + 3)) (rotPow 5 v),
    rotPow_seven_of_frameMem (frameMem_rotPow 5 h)]
  show rotPow (3 + (0 + 3)) (rotPow 6 v) = v
  rw [rotPow_six_of_frameMem h, rotPow_add 3 (0 + 3) v]
  show rotPow 3 (rotPow 3 v) = v
  exact rotPow_uturn_pair_of_frameMem h

/-- **A configuration of dipoles is frame-neutral**: its circuit preserves
every orbit frame, one dipole cancellation at a time. -/
theorem config_frame_neutral : ∀ (seps : List Nat) (p : Vec) {v : Vec},
    FrameMem v → (develop (configLoop seps) (v, p)).1 = v
  | [], _, _, _ => rfl
  | s :: seps, p, v, h => by
    show (develop (dipoleLoop s ++ configLoop seps) (v, p)).1 = v
    rw [develop_append]
    have h1 : (develop (dipoleLoop s) (v, p)).1 = v := dipole_frame_neutral s p h
    exact (config_frame_neutral seps (develop (dipoleLoop s) (v, p)).2
      (h1.symm ▸ h)).trans h1

/-- One unpaired five-site among a configuration of 5–7 dipoles: the
five-site's boundary loop followed by the configuration circuit. -/
def unpairedLoop (seps : List Nat) : List Nat := coneLoop 5 ++ configLoop seps

/-- **The unpaired rotational charge is invariant along the descent**: at
every slide stage the configuration's developed frame is the five-site's
one quantum, because the dipole remainder is frame-neutral. -/
theorem unpaired_frame_invariant (seps : List Nat) (k : Nat) :
    (develop (unpairedLoop (slideIter k seps)) start).1 = ((1 : Int), (-1 : Int)) := by
  show (develop (coneLoop 5 ++ configLoop (slideIter k seps)) start).1 = _
  rw [develop_append]
  exact config_frame_neutral (slideIter k seps)
    (develop (coneLoop 5) start).2 (by decide)

/-- An opposite cone annihilates the unpaired charge at any separation: the
unpaired configuration followed by a seven-site's loop is frame-closed,
because the seven-cone's excess quantum closes the five-site's deficit. -/
theorem seven_neutralizes_unpaired (seps : List Nat) :
    (develop (unpairedLoop seps ++ coneLoop 7) start).1 = start.1 := by
  rw [develop_append]
  have h1 : (develop (unpairedLoop seps) start).1 = ((1 : Int), (-1 : Int)) :=
    unpaired_frame_invariant seps 0
  exact (develop_fst_eq_rotPow_sum (coneLoop 7)
      (develop (unpairedLoop seps) start).1 (develop (unpairedLoop seps) start).2).trans
    ((rotPow_seven_of_frameMem
        (h1.symm ▸ (by decide : FrameMem ((1 : Int), (-1 : Int))))).trans
      ((congrArg rot h1).trans (by decide)))

/-- **An unpaired disclination survives the descent.** Along the slide the
dipole configuration discharges its whole translational content
(`slide_collapse`), while an unpaired five-site's frame charge is the same
one quantum at every stage and never returns the frame: the descent's
settled value carries a conserved rotational remainder. -/
theorem unpaired_disclination_survives_descent (seps : List Nat) :
    (∀ k, (develop (unpairedLoop (slideIter k seps)) start).1 = ((1 : Int), (-1 : Int)))
    ∧ (∀ k, (develop (unpairedLoop (slideIter k seps)) start).1 ≠ start.1)
    ∧ (develop (configLoop (slideIter (seps.foldr max 0) seps)) start).2
        = ((0 : Int), (0 : Int)) :=
  ⟨fun k => unpaired_frame_invariant seps k,
   fun k h => absurd ((unpaired_frame_invariant seps k).symm.trans h) (by decide),
   slide_collapse seps⟩

end Disclination

end AperiodicOrder.Defect
end Obsmetrologia
