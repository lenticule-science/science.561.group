import Obsmetrologia.Cohomology.TransfiniteCellComplex

/-!
# Gyrobifastigium combinatorial cell

This module defines the oriented combinatorial boundary of the Johnson solid J26 as
two triangular prisms joined along one square after a one-step rotation of the
shared four-cycle.

## Main definitions

* `J26.Vertex`, `J26.Edge`, and `J26.Face` are the finite boundary carriers.
* `J26.faceVertices` and `J26.faceEdges` give the oriented exterior boundaries.
* `J26.cellComplex` includes the vertices, edges, faces, and one three-cell.

## Main results

* `J26.shared_cycle_is_quarter_turned` records the rotated prism gluing.
* `J26.exterior_faces_come_from_prisms` derives the exterior from the two prism
  boundaries after their shared square is removed.
* `J26.every_face_boundary_is_valid` checks every oriented face walk against the
  global edge incidence.
* `J26.face_dim_drop` proves strict dimension drop in the resulting cell complex.
-/

namespace Obsmetrologia
namespace AperiodicOrder
namespace J26

/-- The eight vertices of the J26 boundary. The `q` vertices form the glued square;
`a,b` belong only to the left prism and `c,d` only to the right prism. -/
inductive Vertex where
  | q0 | q1 | q2 | q3 | a | b | c | d
  deriving BEq, DecidableEq, Repr

/-- The fourteen unoriented edges of the J26 boundary. -/
inductive Edge where
  | q0q1 | q1q2 | q2q3 | q3q0
  | q1a | ab | bq2 | aq0 | bq3
  | q2c | cd | dq3 | cq1 | dq0
  deriving BEq, DecidableEq, Repr

/-- The eight exterior faces, grouped by the prism from which they descend. -/
inductive Face where
  | leftTop | leftBottom | leftSide0 | leftSide1
  | rightTop | rightBottom | rightSide0 | rightSide1
  deriving BEq, DecidableEq, Repr

/-- All vertices, in the fixed fabrication order. -/
def vertices : List Vertex :=
  [.q0, .q1, .q2, .q3, .a, .b, .c, .d]

/-- All edges, in the fixed fabrication order. -/
def edges : List Edge :=
  [.q0q1, .q1q2, .q2q3, .q3q0,
   .q1a, .ab, .bq2, .aq0, .bq3,
   .q2c, .cd, .dq3, .cq1, .dq0]

/-- All exterior faces, in left-prism then right-prism order. -/
def faces : List Face :=
  [.leftTop, .leftBottom, .leftSide0, .leftSide1,
   .rightTop, .rightBottom, .rightSide0, .rightSide1]

/-- The fixed global orientation of an edge. -/
def edgeEnds : Edge → Vertex × Vertex
  | .q0q1 => (.q0, .q1)
  | .q1q2 => (.q1, .q2)
  | .q2q3 => (.q2, .q3)
  | .q3q0 => (.q3, .q0)
  | .q1a  => (.q1, .a)
  | .ab   => (.a, .b)
  | .bq2  => (.b, .q2)
  | .aq0  => (.a, .q0)
  | .bq3  => (.b, .q3)
  | .q2c  => (.q2, .c)
  | .cd   => (.c, .d)
  | .dq3  => (.d, .q3)
  | .cq1  => (.c, .q1)
  | .dq0  => (.d, .q0)

/-- The oriented vertex cycle of an exterior face. -/
def faceVertices : Face → List Vertex
  | .leftTop    => [.q0, .q1, .a]
  | .leftBottom => [.q3, .q2, .b]
  | .leftSide0  => [.q1, .a, .b, .q2]
  | .leftSide1  => [.a, .q0, .q3, .b]
  | .rightTop    => [.q1, .q2, .c]
  | .rightBottom => [.q0, .q3, .d]
  | .rightSide0  => [.q2, .c, .d, .q3]
  | .rightSide1  => [.c, .q1, .q0, .d]

/-- The edge cycle corresponding to `faceVertices`. -/
def faceEdges : Face → List Edge
  | .leftTop    => [.q0q1, .q1a, .aq0]
  | .leftBottom => [.q2q3, .bq2, .bq3]
  | .leftSide0  => [.q1a, .ab, .bq2, .q1q2]
  | .leftSide1  => [.aq0, .q3q0, .bq3, .ab]
  | .rightTop    => [.q1q2, .q2c, .cq1]
  | .rightBottom => [.q3q0, .dq3, .dq0]
  | .rightSide0  => [.q2c, .cd, .dq3, .q2q3]
  | .rightSide1  => [.cq1, .q0q1, .dq0, .cd]

/-- The square cycle as seen from the left prism before gluing. -/
def leftSharedCycle : List Vertex := [.q0, .q1, .q2, .q3]

/-- The same square cycle as seen from the right prism after the gyro rotation. -/
def rightSharedCycle : List Vertex := [.q1, .q2, .q3, .q0]

/-- The right prism meets the shared square after one step of its four-cycle. -/
theorem shared_cycle_is_quarter_turned :
    rightSharedCycle = leftSharedCycle.drop 1 ++ [.q0] := rfl

/-- The left triangular prism boundary, including the square removed by gluing. -/
def leftPrismBoundary : List (List Vertex) :=
  [faceVertices .leftTop, faceVertices .leftBottom,
   faceVertices .leftSide0, faceVertices .leftSide1, leftSharedCycle]

/-- The right triangular prism boundary, including its rotated copy of the square
removed by gluing. -/
def rightPrismBoundary : List (List Vertex) :=
  [faceVertices .rightTop, faceVertices .rightBottom,
   faceVertices .rightSide0, faceVertices .rightSide1, rightSharedCycle]

/-- Removing the final shared square from each prism boundary produces exactly the
eight exterior J26 face cycles. -/
theorem exterior_faces_come_from_prisms :
    leftPrismBoundary.take 4 ++ rightPrismBoundary.take 4 =
      faces.map faceVertices := rfl

/-- Consecutive cyclic vertex pairs of a finite boundary walk. -/
def cyclicPairs {α : Type} : List α → List (α × α)
  | [] => []
  | first :: rest => List.zip (first :: rest) (rest ++ [first])

/-- Whether an unoriented global edge joins two vertices. -/
def edgeConnects (edge : Edge) (source target : Vertex) : Bool :=
  let ends := edgeEnds edge
  ((ends.1 == source) && (ends.2 == target)) ||
    ((ends.1 == target) && (ends.2 == source))

/-- Whether a face's edge list realizes its oriented cyclic vertex walk. -/
def boundaryValid (face : Face) : Bool :=
  let vertexCycle := cyclicPairs (faceVertices face)
  let edgeCycle := faceEdges face
  vertexCycle.length == edgeCycle.length &&
    (List.zip vertexCycle edgeCycle).all fun entry =>
      edgeConnects entry.2 entry.1.1 entry.1.2

/-- Every exterior face boundary is incident with the declared global edges. -/
theorem every_face_boundary_is_valid (face : Face) : boundaryValid face = true := by
  cases face <;> decide

/-- The J26 combinatorial counts are eight vertices, fourteen edges, and eight faces. -/
theorem combinatorial_counts :
    vertices.length = 8 ∧ edges.length = 14 ∧ faces.length = 8 := by
  decide

/-- The vertex fabrication order contains no duplicate vertex. -/
theorem vertices_nodup : vertices.Nodup := by decide

/-- The edge fabrication order contains no duplicate edge. -/
theorem edges_nodup : edges.Nodup := by decide

/-- The face fabrication order contains no duplicate face. -/
theorem faces_nodup : faces.Nodup := by decide

/-- The exterior consists of four triangular and four square faces. -/
theorem exterior_face_arities :
    faces.map (fun face => (faceVertices face).length) = [3, 3, 4, 4, 3, 3, 4, 4] := rfl

/-- Cells of the closed J26 combinatorial three-cell. -/
inductive Cell where
  | vertex (value : Vertex)
  | edge (value : Edge)
  | face (value : Face)
  | volume
  deriving BEq, DecidableEq, Repr

/-- Dimension of a J26 cell. -/
def cellDim : Cell → Nat
  | .vertex _ => 0
  | .edge _ => 1
  | .face _ => 2
  | .volume => 3

/-- Incidence of one vertex into a possible upper cell. -/
def vertexFaceBool (vertex : Vertex) : Cell → Bool
  | .vertex _ => false
  | .edge edge =>
      (vertex == (edgeEnds edge).1) || (vertex == (edgeEnds edge).2)
  | .face _ => false
  | .volume => false

/-- Incidence of one edge into a possible upper cell. -/
def edgeFaceBool (edge : Edge) : Cell → Bool
  | .vertex _ => false
  | .edge _ => false
  | .face face => (faceEdges face).contains edge
  | .volume => false

/-- Incidence of one face into a possible upper cell. -/
def faceFaceBool : Cell → Bool
  | .vertex _ => false
  | .edge _ => false
  | .face _ => false
  | .volume => true

/-- Decidable face incidence in the closed J26 cell. -/
def cellFaceBool : Cell → Cell → Bool
  | .vertex vertex => vertexFaceBool vertex
  | .edge edge => edgeFaceBool edge
  | .face _ => faceFaceBool
  | .volume => fun _ => false

/-- Face incidence is the positive readout of `cellFaceBool`. -/
def cellFace (lower upper : Cell) : Prop := cellFaceBool lower upper = true

/-- Face incidence strictly lowers dimension. -/
theorem face_dim_drop {lower upper : Cell} (incidence : cellFace lower upper) :
    cellDim lower < cellDim upper := by
  cases lower with
  | vertex vertex =>
      cases upper with
      | vertex _ => exact Bool.noConfusion incidence
      | edge _ => exact Nat.zero_lt_succ 0
      | face _ => exact Bool.noConfusion incidence
      | volume => exact Bool.noConfusion incidence
  | edge edge =>
      cases upper with
      | vertex _ => exact Bool.noConfusion incidence
      | edge _ => exact Bool.noConfusion incidence
      | face _ => exact Nat.succ_lt_succ (Nat.zero_lt_succ 0)
      | volume => exact Bool.noConfusion incidence
  | face face =>
      cases upper with
      | vertex _ => exact Bool.noConfusion incidence
      | edge _ => exact Bool.noConfusion incidence
      | face _ => exact Bool.noConfusion incidence
      | volume => exact Nat.succ_lt_succ (Nat.succ_lt_succ (Nat.zero_lt_succ 0))
  | volume =>
      cases upper <;> exact Bool.noConfusion incidence

/-- The J26 boundary and volume as a finite-dimensional cell complex. -/
def cellComplex : CellComplex.CellComplex where
  cells := Cell
  dim := cellDim
  face := cellFace
  face_dim_drop := face_dim_drop

end J26
end AperiodicOrder
end Obsmetrologia
