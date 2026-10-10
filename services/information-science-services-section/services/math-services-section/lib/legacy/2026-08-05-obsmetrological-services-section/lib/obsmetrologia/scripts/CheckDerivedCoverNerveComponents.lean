import Obsmetrologia.Cohomology.CoordinationCohomology

namespace Obsmetrologia.Cohomology.DerivedCoverNerveChecks

def cellA : PredicationCell :=
  ⟨⟨"a"⟩, ⟨"rel"⟩, ⟨"a"⟩⟩

def cellB : PredicationCell :=
  ⟨⟨"b"⟩, ⟨"rel"⟩, ⟨"b"⟩⟩

def datumFor (cover : Sheaf.Cover) : Cech1 where
  cover := cover
  local_ := fun _ _ => 0

def alwaysCover (count : Nat) (hpositive : 0 < count) : Sheaf.Cover where
  patches := List.replicate count (fun _ => true)
  covers := by
    intro cell
    refine ⟨fun _ => true, ?_, rfl⟩
    have hne : count ≠ 0 := Nat.ne_of_gt hpositive
    simp [List.mem_replicate, hne]

def twoVertexOneEdgeFixture : IndexedCoverIncidence where
  datum := datumFor (alwaysCover 2 (by omega))
  observedCells := [cellA]

theorem twoVertexOneEdgeTreeOneComponent :
    twoVertexOneEdgeFixture.componentRepresentatives.length = 1 := by
  native_decide

theorem twoVertexOneEdgeTreeH1Zero :
    (CoverNerve.ofIndexedCoverIncidence twoVertexOneEdgeFixture).H1rank = 0 := by
  native_decide

theorem revision3FalseTwoComponentsRejected :
    (CoverNerve.ofIndexedCoverIncidence twoVertexOneEdgeFixture).components ≠ 2 := by
  native_decide

theorem duplicateOverlapWitnessCountsOnce :
    (IndexedCoverIncidence.finiteIndexedCoverGraph
      { twoVertexOneEdgeFixture with observedCells := [cellA, cellA] }).ecard =
    twoVertexOneEdgeFixture.finiteIndexedCoverGraph.ecard := by
  native_decide

theorem reversedOrientationIsSameEdge :
    twoVertexOneEdgeFixture.overlapIncidence ⟨1, by native_decide⟩
        ⟨0, by native_decide⟩ = false ∧
      twoVertexOneEdgeFixture.overlapIncidence ⟨0, by native_decide⟩
        ⟨1, by native_decide⟩ = true := by
  native_decide

def onlyA (cell : PredicationCell) : Bool := decide (cell = cellA)
def notA (cell : PredicationCell) : Bool := decide (cell ≠ cellA)

def disconnectedCover : Sheaf.Cover where
  patches := [onlyA, onlyA, notA, notA]
  covers := by
    intro cell
    by_cases h : cell = cellA
    · exact ⟨onlyA, by simp, by simp [onlyA, h]⟩
    · exact ⟨notA, by simp, by simp [notA, h]⟩

def disconnectedFixture : IndexedCoverIncidence where
  datum := datumFor disconnectedCover
  observedCells := [cellA, cellB]

theorem disconnectedFixtureComponents :
    disconnectedFixture.componentRepresentatives.length = 2 := by
  native_decide

theorem disconnectedFixtureH1 :
    (CoverNerve.ofIndexedCoverIncidence disconnectedFixture).H1rank = 0 := by
  native_decide

def cyclicFixture : IndexedCoverIncidence where
  datum := datumFor (alwaysCover 3 (by omega))
  observedCells := [cellA]

theorem cyclicFixtureOneComponent :
    cyclicFixture.componentRepresentatives.length = 1 := by
  native_decide

theorem cyclicFixtureH1One :
    (CoverNerve.ofIndexedCoverIncidence cyclicFixture).H1rank = 1 := by
  native_decide

/--
error: Tactic `native_decide` evaluated that the proposition
  twoVertexOneEdgeFixture.componentRepresentatives.length = 2
is false
-/
#guard_msgs in
theorem negativeControlRejectsAssignedComponentCount :
    twoVertexOneEdgeFixture.componentRepresentatives.length = 2 := by
  native_decide

#print axioms Obsmetrologia.Discrete.Graph.FinGraph.derivedComponents_sound
#print axioms Obsmetrologia.Discrete.Graph.FinGraph.derivedComponents_complete
#print axioms Obsmetrologia.Discrete.Graph.FinGraph.derivedComponents_unique
#print axioms Obsmetrologia.Cohomology.coverNerve_h1_from_incidence

end Obsmetrologia.Cohomology.DerivedCoverNerveChecks
