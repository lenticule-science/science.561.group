/-!
# Finite aperiodic cohomology witnesses from the Jeandel–Rao Wang set

A dependency-free, fully finite cohomology computation that puts content behind the
aperiodic-regime claim "`cl-inv` can be nonzero" (`Obsmetrologia.AperiodicOrder.Tiling.aperiodicWitness`, whose
nonzero class is an abstract free coordinate with no computation underneath it).

Two nonzero `H¹` classes are exhibited on finite **one-vertex Anderson–Putnam cochain
complexes** extracted from the **Jeandel–Rao** aperiodic Wang set (11 tiles on 4 colours — the
minimal aperiodic Wang set; Jeandel–Rao 2015), through Labbé's (2018) marker structure:

* the **marker-ring quotient** `b3` core (`§(4)`): the quotient of the 444 collared states by the
  marker ring `(0,1)` has `7` edges, `4` faces, `H¹` of rank `5`; the isolated class
  `b3 = q1 + q2 + q5` is a nonzero cocycle.
* the **decorated witness** `φ` (`§(3)`): a witness-decorated marker-domino subcomplex
  (`6` edges, `3` faces) carrying the decorated cochain `φ`, the pullback of `b3`, again a
  nonzero cocycle.

Both complexes are one-vertex, so the degree-0 coboundary `δ⁰` vanishes; hence a cocycle that is
not identically zero already represents a nonzero `H¹` class (`NonzeroH1Class`).

## Main definitions

* `OneVertexComplex` — a finite one-vertex Anderson–Putnam cochain complex
  (`C0 = ℤ`, `C1 = ℤ^Edge`, `C2 = ℤ^Face`), with `delta1` the degree-1 coboundary,
  `IsCocycle` the closedness predicate, and `NonzeroH1Class` the nonzero-`H¹` criterion valid
  when `δ⁰ = 0`.
* `jrComplex`, `phi` — the decorated marker-domino witness subcomplex and its cochain.
* `markerRingComplex`, `b3` — the marker-ring quotient complex and its isolated core class.

## Main results

* `jeandelRaoMarker01_nonzero_h1_class` — `φ` is a nonzero `H¹` class on `jrComplex`.
* `markerRing_b3_nonzero_h1_class` — `b3` is a nonzero `H¹` class on `markerRingComplex`.

Both proofs depend only on `propext` (no `Quot.sound`, no `native_decide`).

## Implementation notes

The boundary data, cochain values, and ranks are transcribed from, and were cross-checked
against, the search certificates of the aperiodicity lab: `jrComplex`/`phi` against
`jeandel_rao_marker_01_decorated_certificate_v20.json`, and `markerRingComplex`/`b3` against
`jeandel_rao_marker_01_certificate_v13.json` (whose `H¹` basis lists `q1 + q2 + q5` as a class).
Closedness is decided by `cases f <;> decide` over the finite face type — the coboundary sums are
closed integer terms, so `decide` reduces them to `0 = 0` without `Classical` or `native_decide`.

The two complexes are linked by the corpus's mutual-local-derivability/desubstitution maps: `φ` is
the *decorated pullback* of `b3` along a marker-domino step. That pullback is realized as an explicit
integer cellular chain map in `Obsmetrologia.AperiodicOrder.Tiling.Witness.JeandelRaoSubstitution` (`subEdge`/`subFace`),
under which `subPull b3 = φ` and cocycles pull back to cocycles — one marker-domino rung. Promoting
`[φ]` through the full directed system of such maps to a nonzero direct-limit class is the open frontier
(`thm:jeandel-rao-persistence`).

## scope

These are **finite witness theorems**. They do not prove that every Jeandel–Rao tiling is
non-periodic, that either subcomplex is the full Anderson–Putnam complex of the Jeandel–Rao shift,
that `φ` or `b3` persists through the marker/desubstitution direct system, or that either is a
complete `cl-inv` for mutual-local-derivability. Each class is a *candidate local representative*
of a future `cl-inv` projection, not `cl-inv` itself. The full program is recorded in
`lean/docs/blueprint/notes/2026-06-22-jeandel-rao-aperiodicity-certificate-program.md`.

## References

* E. Jeandel, M. Rao, *An aperiodic set of 11 Wang tiles*, arXiv:1506.06492 (2015).
* S. Labbé, *Substitutive structure of Jeandel–Rao aperiodic tilings*, arXiv:1808.07768 (2018).
* J. Anderson, I. Putnam, *Topological invariants for substitution tilings and their associated
  C\*-algebras* (1995).

## Tags

aperiodic tiling, Wang tiles, Jeandel–Rao, Anderson–Putnam, Čech cohomology, cocycle, cl-inv
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling.Witness

/-! ## (1) The abstract finite one-vertex Anderson–Putnam cochain complex -/

/-- A finite **one-vertex Anderson–Putnam cochain complex**: `C0 = ℤ` (a single vertex, so the
degree-0 coboundary `δ⁰` is zero), `C1 = ℤ^Edge`, `C2 = ℤ^Face`, with the boundary
`d2 : Face → Edge → ℤ` giving the degree-1 coboundary `δ¹ φ f = Σ_e d2 f e · φ e` over the
finite edge list `edges`. -/
structure OneVertexComplex where
  /-- The (finite) 1-cells. -/
  Edge : Type
  /-- The (finite) 2-cells. -/
  Face : Type
  /-- The enumeration of 1-cells over which the coboundary sum is taken. -/
  edges : List Edge
  /-- The boundary map `∂ : C2 → C1` as integer incidence coefficients. -/
  d2 : Face → Edge → Int

namespace OneVertexComplex
variable (K : OneVertexComplex)

/-- The degree-1 coboundary `δ¹` evaluated on a face: `(δ¹ φ) f = φ(∂f) = Σ_e d2 f e · φ e`. -/
def delta1 (phi : K.Edge → Int) (f : K.Face) : Int :=
  (K.edges.map (fun e => K.d2 f e * phi e)).sum

/-- A 1-cochain is a **cocycle** (closed) when `δ¹` annihilates it on every face. -/
def IsCocycle (phi : K.Edge → Int) : Prop := ∀ f : K.Face, K.delta1 phi f = 0

/-- A **nonzero `H¹` class** in the one-vertex complex: a cocycle with a nonzero value somewhere.
Since `δ⁰ = 0` here, the only coboundary is `0`, so a nonzero cocycle is a nonzero class. -/
def NonzeroH1Class (phi : K.Edge → Int) : Prop := K.IsCocycle phi ∧ ∃ e : K.Edge, phi e ≠ 0

end OneVertexComplex

/-! ## (2) The Jeandel–Rao marker-(0,1) decorated witness subcomplex -/

/-- The six 1-cells of the decorated witness subcomplex. -/
inductive Edge | e0 | e1 | e2 | e3 | e4 | e5
  deriving DecidableEq, Repr

/-- The three 2-cells (witness faces). -/
inductive Face | f0 | f1 | f2
  deriving DecidableEq, Repr

/-- The boundary `∂ : C2 → C1` of the witness subcomplex:
`∂f0 = e0 − e1 + e2 − e3`, `∂f1 = ∂f2 = e2 − e3 + e4 − e5`. -/
def d2 : Face → Edge → Int
  | Face.f0, Edge.e0 => 1
  | Face.f0, Edge.e1 => -1
  | Face.f0, Edge.e2 => 1
  | Face.f0, Edge.e3 => -1
  | Face.f0, _       => 0
  | Face.f1, Edge.e2 => 1
  | Face.f1, Edge.e3 => -1
  | Face.f1, Edge.e4 => 1
  | Face.f1, Edge.e5 => -1
  | Face.f1, _       => 0
  | Face.f2, Edge.e2 => 1
  | Face.f2, Edge.e3 => -1
  | Face.f2, Edge.e4 => 1
  | Face.f2, Edge.e5 => -1
  | Face.f2, _       => 0

/-- The Jeandel–Rao marker-(0,1) decorated witness as a one-vertex AP complex. -/
def jrComplex : OneVertexComplex where
  Edge := Edge
  Face := Face
  edges := [Edge.e0, Edge.e1, Edge.e2, Edge.e3, Edge.e4, Edge.e5]
  d2 := d2

/-- The decorated witness cochain `φ`, supported on the two marked edges `{e2, e3}`. -/
def phi : Edge → Int
  | Edge.e2 => 1
  | Edge.e3 => 1
  | _       => 0

/-! ## (3) The finite witness theorem -/

/-- **`φ` is a cocycle.** `φ(∂f) = 0` on every face: `φ(∂f0) = 1 − 1 = 0`,
`φ(∂f1) = φ(∂f2) = 1 − 1 = 0`. -/
theorem phi_closed : jrComplex.IsCocycle phi := by
  intro f; cases f <;> decide

/-- **`φ` is nonzero** — `φ e2 = 1 ≠ 0`. -/
theorem phi_nonzero : phi Edge.e2 ≠ 0 := by decide

/-- **The Jeandel–Rao marker-(0,1) decorated witness carries a nonzero `H¹` class.** `φ` is a
nonzero closed 1-cochain on the one-vertex AP complex, and since `δ⁰ = 0` there, it represents a
nonzero `H¹` class — a finite, extracted cohomological witness of the Jeandel–Rao set's
aperiodic local structure. (Finite witness only: not Jeandel–Rao aperiodicity, not a
direct-limit `cl-inv` class — see the module header's scope.) -/
theorem jeandelRaoMarker01_nonzero_h1_class : jrComplex.NonzeroH1Class phi :=
  ⟨phi_closed, ⟨Edge.e2, phi_nonzero⟩⟩

/-! ## (4) The marker-ring quotient `b3` core (the logically-prior certificate)

Before the decorated witness, the lab isolated a meaningful class in the **marker-ring quotient**
of the 444 collared Jeandel–Rao states (marker subset `(0,1)`): 4 quotient faces `g0…g3`, 7
quotient edge types `q0…q6`, with boundary `∂g0 = q1 − q2`, `∂g1 = 0`, `∂g2 = q2 − q5`,
`∂g3 = −q1 + q5`. Its `H¹` has rank 5 (mostly cheap one-edge loops of the one-vertex complex); the
meaningful class is `b3`, supported on `{q1, q2, q5}` (incidence record `…_b3_incidence_v15.json`:
`b3_edges = [1,2,5]`, `core_faces = [0,2,3]`). The decorated `φ` of §3 is the *decorated pullback*
of this `b3`; that pullback chain map — the persistence step — is the open frontier
`thm:jeandel-rao-persistence`. -/

/-- The seven quotient 1-cells of the marker-ring quotient. -/
inductive QEdge | q0 | q1 | q2 | q3 | q4 | q5 | q6
  deriving DecidableEq, Repr

/-- The four quotient 2-cells of the marker-ring quotient. -/
inductive QFace | g0 | g1 | g2 | g3
  deriving DecidableEq, Repr

/-- The marker-ring quotient boundary: `∂g0 = q1 − q2`, `∂g1 = 0`, `∂g2 = q2 − q5`,
`∂g3 = −q1 + q5`. The three nonzero columns are linearly dependent
(`∂g0 + ∂g2 + ∂g3 = 0`), so `rank ∂ = 2` and `H¹` has rank `7 − 2 = 5`. -/
def qd2 : QFace → QEdge → Int
  | QFace.g0, QEdge.q1 => 1
  | QFace.g0, QEdge.q2 => -1
  | QFace.g0, _        => 0
  | QFace.g1, _        => 0
  | QFace.g2, QEdge.q2 => 1
  | QFace.g2, QEdge.q5 => -1
  | QFace.g2, _        => 0
  | QFace.g3, QEdge.q1 => -1
  | QFace.g3, QEdge.q5 => 1
  | QFace.g3, _        => 0

/-- The marker-ring quotient as a one-vertex AP complex. -/
def markerRingComplex : OneVertexComplex where
  Edge := QEdge
  Face := QFace
  edges := [QEdge.q0, QEdge.q1, QEdge.q2, QEdge.q3, QEdge.q4, QEdge.q5, QEdge.q6]
  d2 := qd2

/-- The isolated meaningful class `b3 = q1 + q2 + q5`, supported on the three core edges. -/
def b3 : QEdge → Int
  | QEdge.q1 => 1
  | QEdge.q2 => 1
  | QEdge.q5 => 1
  | _        => 0

/-- **`b3` is a cocycle.** `b3(∂g0) = 1 − 1 = 0`, `b3(∂g1) = 0`, `b3(∂g2) = 1 − 1 = 0`,
`b3(∂g3) = −1 + 1 = 0`. -/
theorem b3_closed : markerRingComplex.IsCocycle b3 := by
  intro f; cases f <;> decide

/-- **`b3` is nonzero** — `b3 q1 = 1 ≠ 0`. -/
theorem b3_nonzero : b3 QEdge.q1 ≠ 0 := by decide

/-- **The marker-ring quotient `b3` core is a nonzero `H¹` class.** The logically-prior finite
certificate from which the decorated witness `φ` is pulled back. (Finite witness only — same
scope as `jeandelRaoMarker01_nonzero_h1_class`.) -/
theorem markerRing_b3_nonzero_h1_class : markerRingComplex.NonzeroH1Class b3 :=
  ⟨b3_closed, ⟨QEdge.q1, b3_nonzero⟩⟩

/-! ## (5) The `q0` one-edge loop — a second class of the rank-5 group -/

/-- The one-edge loop cochain at `q0`: `1` at `q0`, else `0`. One of the rank-5 group's
one-edge loop coordinates, supported off the boundary support `{q1, q2, q5}`. -/
def q0Loop : QEdge → Int
  | QEdge.q0 => 1
  | _        => 0

/-- **`q0Loop` is a cocycle.** Every face of the marker-ring quotient has zero incidence
at `q0`. -/
theorem q0Loop_closed : markerRingComplex.IsCocycle q0Loop := by
  intro f; cases f <;> decide

/-- **`q0Loop` is nonzero** — `q0Loop q0 = 1 ≠ 0`. -/
theorem q0Loop_nonzero : q0Loop QEdge.q0 ≠ 0 := by decide

/-- **The `q0` one-edge loop is a nonzero `H¹` class** on the marker-ring quotient. -/
theorem markerRing_q0Loop_nonzero_h1_class : markerRingComplex.NonzeroH1Class q0Loop :=
  ⟨q0Loop_closed, ⟨QEdge.q0, q0Loop_nonzero⟩⟩

/-- **`b3` and `q0Loop` are distinct cocycles** — they differ at `q0`. On a one-vertex
complex `δ⁰ = 0`, so they represent distinct `H¹` classes. -/
theorem b3_ne_q0Loop : b3 ≠ q0Loop :=
  fun h => absurd (congrFun h QEdge.q0) (by decide)

end AperiodicOrder.Tiling.Witness
end Obsmetrologia
