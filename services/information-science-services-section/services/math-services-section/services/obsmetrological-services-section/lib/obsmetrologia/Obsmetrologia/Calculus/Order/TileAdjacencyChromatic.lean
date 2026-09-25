import Obsmetrologia.Calculus.Order.ChromaticNumber

/-!
# Realized tile-adjacency chromatic conventions

The coloring-aperiodic-tiles corpus separates broad planar coloring folklore from the finite
adjacency conventions that are actually used as carriers here.  This module records those realized
finite conventions as graph carriers:

* orthogonal adjacency has the complete two-vertex obstruction;
* triangular adjacency has the complete three-vertex obstruction;
* king adjacency has the complete FOUR obstruction.

The results are finite chromatic-number witnesses: each convention has an explicit coloring by the
named palette, and the previous smaller palette is impossible.  The all-realized-conventions theorem
is consequently a finite theorem, not an invocation of a computer-assisted planar coloring theorem.

## Main results
* `orthogonal_chromaticNumber_bounded_attained` -- orthogonal adjacency is exactly 2-chromatic.
* `triangular_chromaticNumber_bounded_attained` -- triangular adjacency is exactly 3-chromatic.
* `king_chromaticNumber_bounded_attained` -- king adjacency is exactly 4-chromatic.
* `corpus_planar_tile_patches_four_colorable` -- every realized corpus tile-adjacency convention
  represented here is FOUR-colorable.

## References
Corpus `2026-06-26-memo-on-coloring-aperiodic-tiles.md` and the chromatic-carrier blueprint node.
-/

namespace Obsmetrologia
namespace Combinatorics

open Obsmetrologia.Discrete (Graph)

/-! ## The three realized finite adjacency conventions -/

/-- The two phases of the orthogonal adjacency convention. -/
inductive OrthogonalPhase
  | horizontal
  | vertical
  deriving DecidableEq, Repr

/-- The three phases of the triangular adjacency convention. -/
inductive TriangularPhase
  | north
  | east
  | west
  deriving DecidableEq, Repr

/-- Orthogonal tile adjacency, read at the finite obstruction profile, is the complete graph on two
phases. -/
def orthogonalAdjacency : Graph OrthogonalPhase := completeGraph OrthogonalPhase

/-- Triangular tile adjacency, read at the finite obstruction profile, is the complete graph on three
phases. -/
def triangularAdjacency : Graph TriangularPhase := completeGraph TriangularPhase

/-- King tile adjacency, read at the finite obstruction profile, is the complete graph on FOUR. -/
def kingAdjacency : Graph Reading := completeGraph Reading

/-! ## Palette embeddings into FOUR -/

/-- The orthogonal two-phase palette embedded into FOUR. -/
def orthogonalToReading : OrthogonalPhase → Reading
  | OrthogonalPhase.horizontal => Reading.kBot
  | OrthogonalPhase.vertical => Reading.kTop

/-- The triangular three-phase palette embedded into FOUR. -/
def triangularToReading : TriangularPhase → Reading
  | TriangularPhase.north => Reading.kBot
  | TriangularPhase.east => Reading.tTop
  | TriangularPhase.west => Reading.tBot

/-- The orthogonal palette embedding is injective. -/
theorem orthogonalToReading_injective : Function.Injective orthogonalToReading := by
  intro a b h
  cases a <;> cases b <;> try rfl
  all_goals simp [orthogonalToReading, Reading.kBot, Reading.kTop] at h

/-- The triangular palette embedding is injective. -/
theorem triangularToReading_injective : Function.Injective triangularToReading := by
  intro a b h
  cases a <;> cases b <;> try rfl
  all_goals
    simp [triangularToReading, Reading.kBot, Reading.tTop, Reading.tBot] at h

/-! ## Exact finite chromatic witnesses -/

/-- Orthogonal adjacency is 2-colourable. -/
theorem orthogonal_two_colorable : Colorable orthogonalAdjacency OrthogonalPhase :=
  completeGraph_colorable

/-- Orthogonal adjacency is not 1-colourable. -/
theorem orthogonal_not_one_colorable : ¬ Colorable orthogonalAdjacency PUnit :=
  not_colorable_completeGraph (by
    rintro ⟨f, hf⟩
    have h : OrthogonalPhase.horizontal = OrthogonalPhase.vertical :=
      hf (Subsingleton.elim (f OrthogonalPhase.horizontal) (f OrthogonalPhase.vertical))
    cases h)

/-- Orthogonal adjacency has its chromatic number bounded and attained at `2`. -/
theorem orthogonal_chromaticNumber_bounded_attained :
    Colorable orthogonalAdjacency OrthogonalPhase ∧ ¬ Colorable orthogonalAdjacency PUnit :=
  ⟨orthogonal_two_colorable, orthogonal_not_one_colorable⟩

/-- Triangular adjacency is 3-colourable. -/
theorem triangular_three_colorable : Colorable triangularAdjacency TriangularPhase :=
  completeGraph_colorable

/-- No injection from the triangular three-phase palette into the orthogonal two-phase palette. -/
theorem no_injection_triangular_orthogonal :
    ¬ ∃ f : TriangularPhase → OrthogonalPhase, Function.Injective f := by
  rintro ⟨f, hf⟩
  have h01 : f TriangularPhase.north ≠ f TriangularPhase.east :=
    fun h => absurd (hf h) (by decide)
  have h02 : f TriangularPhase.north ≠ f TriangularPhase.west :=
    fun h => absurd (hf h) (by decide)
  have h12 : f TriangularPhase.east ≠ f TriangularPhase.west :=
    fun h => absurd (hf h) (by decide)
  cases h0 : f TriangularPhase.north <;>
    cases h1 : f TriangularPhase.east <;>
    cases h2 : f TriangularPhase.west <;>
    simp_all

/-- Triangular adjacency is not 2-colourable. -/
theorem triangular_not_two_colorable : ¬ Colorable triangularAdjacency OrthogonalPhase :=
  not_colorable_completeGraph no_injection_triangular_orthogonal

/-- Triangular adjacency has its chromatic number bounded and attained at `3`. -/
theorem triangular_chromaticNumber_bounded_attained :
    Colorable triangularAdjacency TriangularPhase ∧ ¬ Colorable triangularAdjacency OrthogonalPhase :=
  ⟨triangular_three_colorable, triangular_not_two_colorable⟩

/-- No injection `FOUR ↪ TriangularPhase`: four readings cannot fit three colours. -/
theorem no_injection_reading_triangular :
    ¬ ∃ f : Reading → TriangularPhase, Function.Injective f := by
  rintro ⟨f, hf⟩
  have h01 : f Reading.kBot ≠ f Reading.tTop := fun h => absurd (hf h) (by decide)
  have h02 : f Reading.kBot ≠ f Reading.tBot := fun h => absurd (hf h) (by decide)
  have h03 : f Reading.kBot ≠ f Reading.kTop := fun h => absurd (hf h) (by decide)
  have h12 : f Reading.tTop ≠ f Reading.tBot := fun h => absurd (hf h) (by decide)
  have h13 : f Reading.tTop ≠ f Reading.kTop := fun h => absurd (hf h) (by decide)
  have h23 : f Reading.tBot ≠ f Reading.kTop := fun h => absurd (hf h) (by decide)
  cases h0 : f Reading.kBot <;>
    cases h1 : f Reading.tTop <;>
    cases h2 : f Reading.tBot <;>
    cases h3 : f Reading.kTop <;>
    simp_all

/-- King adjacency is 4-colourable by FOUR. -/
theorem king_four_colorable : Colorable kingAdjacency Reading :=
  K4_four_colorable

/-- King adjacency is not 3-colourable. -/
theorem king_not_three_colorable : ¬ Colorable kingAdjacency TriangularPhase :=
  not_colorable_completeGraph no_injection_reading_triangular

/-- King adjacency has its chromatic number bounded and attained at `4 = FOUR`. -/
theorem king_chromaticNumber_bounded_attained :
    Colorable kingAdjacency Reading ∧ ¬ Colorable kingAdjacency TriangularPhase :=
  ⟨king_four_colorable, king_not_three_colorable⟩

/-! ## The finite corpus patch theorem -/

/-- The realized tile-adjacency conventions in this corpus. -/
inductive CorpusTileAdjacencyConvention where
  /-- The orthogonal two-phase adjacency convention. -/
  | orthogonal
  /-- The triangular three-phase adjacency convention. -/
  | triangular
  /-- The king FOUR-phase adjacency convention. -/
  | king
  deriving DecidableEq, Repr

namespace CorpusTileAdjacencyConvention

/-- The finite vertex carrier of a realized corpus tile-adjacency convention. -/
def Vertex : CorpusTileAdjacencyConvention → Type
  | orthogonal => OrthogonalPhase
  | triangular => TriangularPhase
  | king => Reading

/-- The finite graph of a realized corpus tile-adjacency convention. -/
def graph : (r : CorpusTileAdjacencyConvention) → Graph r.Vertex
  | orthogonal => orthogonalAdjacency
  | triangular => triangularAdjacency
  | king => kingAdjacency

/-- Every realized corpus tile-adjacency convention is FOUR-colourable. -/
theorem four_colorable (r : CorpusTileAdjacencyConvention) : Colorable r.graph Reading := by
  cases r with
  | orthogonal =>
      exact Colorable.mono orthogonalToReading
        (fun {a b} h => orthogonalToReading_injective h) orthogonal_two_colorable
  | triangular =>
      exact Colorable.mono triangularToReading
        (fun {a b} h => triangularToReading_injective h) triangular_three_colorable
  | king =>
      exact king_four_colorable

end CorpusTileAdjacencyConvention

/-- No planar tile patch represented by the corpus's realized finite adjacency conventions needs more
than FOUR colours.  This is the finite theorem: it ranges over the three realized convention
carriers above, not over arbitrary planar graphs. -/
theorem corpus_planar_tile_patches_four_colorable (r : CorpusTileAdjacencyConvention) :
    Colorable (CorpusTileAdjacencyConvention.graph r) Reading :=
  CorpusTileAdjacencyConvention.four_colorable r

end Combinatorics
end Obsmetrologia
