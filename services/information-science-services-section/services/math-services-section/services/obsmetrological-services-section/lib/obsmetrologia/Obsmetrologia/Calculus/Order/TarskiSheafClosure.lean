import Obsmetrologia.Calculus.Order.KnasterTarskiStandalone

/-!
# TarskiSheafClosure — the inner-product-free sheaf closure over a directed cell complex (DERIVED)

The shared order-theoretic engine of the **matter regimes**: a cellular sheaf valued in a complete
lattice, over a **directed** cell complex, with a Tarski/Lawvere Laplacian (`□∘◇` round-trip) whose
least fixed point is the settled global section and whose harmonic kernel is the degree-0 cohomology
object `H⁰`. Lattice-valued, no inner product — the lattice analogue of `δ*δ` (Ghrist–Riess Tarski
Laplacian), built only on the standalone Knaster–Tarski fixed-point theorem.

This is deliberately neutral: the same closure is the engine of `AperiodicOrder.MaterialSectors.Contact.KeratinSheaf` (frictional
contacts between hair shafts) and `KineticTheory.Liquid.OrnsteinZernikeClosure` (density couplings between distance
bins). A cell stops being a bare relation and becomes a directed stalk; what differs between regimes
is only the *decoration* of the cells and edges, never the closure.

Direction is mathematically real: an `Edge` is an ordered `src ↦ tgt`, so reversing it imposes the
opposite (one-sided, hysteretic) restriction.

## Main definitions
* `Edge`, `Complex` — a directed restriction edge and a finite cell complex over a stalk lattice `S`.
* `Assign`, `IsCompatible` — keratin/liquid states and the directed global-section condition.
* `driveFn`, `settle` — the Tarski drive and its least-fixed-point settling.
* `Powerset` — the constructive powerset complete lattice (a stalk for irreversible/monotone state).

## Main results
* `settle_infl`, `settle_mono`, `settle_idem` — settling is a closure operator.
* `harmonic_imp_compatible`, `settle_le_of_compatible` — harmonic states are global sections; settling
  lands on the least compatible state above the seed.
* `mem_h0_iff_harmonic`, `harmonic_kernel_h0_iso` — the harmonic kernel is `H⁰` (lattice `ker L = H⁰`).

## References
Ghrist–Riess Tarski Laplacians; `Flow.LawvereKernelH0` (the `Valuation` instance). Built on
`Obsmetrologia.Order.KnasterTarskiStandalone`.

## Tags
Tarski Laplacian, cellular sheaf, directed restriction, closure operator, degree-0 cohomology
-/

namespace Obsmetrologia
namespace Tarski

open Order

variable {S : Order.CompleteLattice}

/-! ## The powerset stalk -/

/-- The **powerset complete lattice** `E → Prop`, ordered by inclusion, `sSup` = union. Constructive
(no decidability), the concrete stalk for irreversible/monotone state: a state *is* the set of
events that have fired. -/
def Powerset (E : Type) : Order.CompleteLattice where
  carrier := E → Prop
  le a b := ∀ e, a e → b e
  le_refl _ := fun _ h => h
  le_trans := fun {_ _ _} h1 h2 e h => h2 e (h1 e h)
  le_antisymm := fun {_ _} h1 h2 => funext fun e => propext ⟨h1 e, h2 e⟩
  sSup 𝒮 := fun e => ∃ a, 𝒮 a ∧ a e
  le_sSup := fun _ a ha e he => ⟨a, ha, he⟩
  sSup_le := fun _ b hb e he => by obtain ⟨a, ha, hae⟩ := he; exact hb a ha e hae

/-! ## The directed cell complex -/

/-- A **directed restriction edge** `src ↦ tgt` with a monotone restriction transporting the source
stalk state into a constraint on the target. Direction is real — swapping `src`/`tgt` is a different
edge imposing the opposite (one-sided, hysteretic) constraint. -/
structure Edge (S : Order.CompleteLattice) (V : Type) where
  src : V
  tgt : V
  restrict : S.carrier → S.carrier
  restrict_mono : ∀ {a b}, S.le a b → S.le (restrict a) (restrict b)

/-- A finite **cell complex**: vertices and a directed list of restriction edges over a stalk lattice
`S`. -/
structure Complex (S : Order.CompleteLattice) where
  Vertex : Type
  edges : List (Edge S Vertex)

/-- A **state**: a local stalk value at every vertex. -/
abbrev Assign (K : Complex S) : Type := K.Vertex → S.carrier

/-- A state is a **global section** (compatible) when every directed edge's restriction of the source
is dominated by the target: `ρ_e (x src) ≤ x tgt`. The directed, one-sided compatibility a restriction
imposes — not the symmetric agreement of an undirected sheaf. -/
def IsCompatible (K : Complex S) (x : Assign K) : Prop :=
  ∀ e ∈ K.edges, S.le (e.restrict (x e.src)) (x e.tgt)

/-! ## The Tarski Laplacian and its settling -/

/-- The **drive** operator (the order Laplacian's `□∘◇` round-trip): raise each vertex to the join of
its seed value and every incident edge's restricted contribution. Its least fixed point is the settled
section. -/
def driveFn (K : Complex S) (seed y : Assign K) : Assign K :=
  fun j => S.sSup (fun s => s = seed j ∨
    ∃ e, e ∈ K.edges ∧ e.tgt = j ∧ s = e.restrict (y e.src))

/-- `driveFn` is monotone in **both** the seed and the current state — the sole Knaster–Tarski
hypothesis. -/
theorem driveFn_mono (K : Complex S) {seed seed' y y' : Assign K}
    (hs : ∀ v, S.le (seed v) (seed' v)) (hy : ∀ v, S.le (y v) (y' v)) :
    ∀ j, S.le (driveFn K seed y j) (driveFn K seed' y' j) := by
  intro j
  apply S.sSup_le
  intro s hs'
  cases hs' with
  | inl h =>
      rw [h]
      exact S.le_trans (hs j) (S.le_sSup _ (seed' j) (Or.inl rfl))
  | inr h =>
      obtain ⟨e, hmem, htgt, hval⟩ := h
      rw [hval]
      exact S.le_trans (e.restrict_mono (hy e.src))
        (S.le_sSup _ (e.restrict (y' e.src)) (Or.inr ⟨e, hmem, htgt, rfl⟩))

/-- The pointwise **complete lattice of states** `Vertex → S`: `sSup` is computed stalk-wise. The
substrate on which Knaster–Tarski produces the settled section. -/
def AssignCL (S : Order.CompleteLattice) (V : Type) : Order.CompleteLattice where
  carrier := V → S.carrier
  le x y := ∀ v, S.le (x v) (y v)
  le_refl x := fun v => S.le_refl (x v)
  le_trans := fun {a b c} h1 h2 v => S.le_trans (h1 v) (h2 v)
  le_antisymm := fun {a b} h1 h2 => funext fun v => S.le_antisymm (h1 v) (h2 v)
  sSup 𝒮 := fun v => S.sSup (fun s => ∃ x, 𝒮 x ∧ x v = s)
  le_sSup := fun 𝒮 x hx v => S.le_sSup _ (x v) ⟨x, hx, rfl⟩
  sSup_le := fun 𝒮 b hb v => S.sSup_le _ (b v) (fun s hs => by
    obtain ⟨x, hx, hxv⟩ := hs; exact hxv ▸ hb x hx v)

/-- The drive as a **monotone endomap** of the state lattice. -/
def driveMono (K : Complex S) (seed : Assign K) :
    (AssignCL S K.Vertex).Mono where
  f := driveFn K seed
  mono := fun {_ _} hab => driveFn_mono K (fun v => S.le_refl (seed v)) hab

/-- **Settling**: the least fixed point of the drive — the settled section generated by a seed. -/
def settle (K : Complex S) (seed : Assign K) : Assign K :=
  (driveMono K seed).lfp

/-- The settled section is `driveFn`-fixed (Knaster–Tarski). -/
theorem settle_fixed (K : Complex S) (seed : Assign K) :
    driveFn K seed (settle K seed) = settle K seed :=
  (driveMono K seed).lfp_fixed

/-- **`settle` is inflationary**: the seed sits below its settling. -/
theorem settle_infl (K : Complex S) (seed : Assign K) :
    ∀ v, S.le (seed v) (settle K seed v) := by
  intro v
  have h : S.le (seed v) (driveFn K seed (settle K seed) v) :=
    S.le_sSup _ (seed v) (Or.inl rfl)
  rw [settle_fixed] at h
  exact h

/-- **`settle` is monotone**: a larger seed settles to a larger section. -/
theorem settle_mono (K : Complex S) {seed seed' : Assign K}
    (h : ∀ v, S.le (seed v) (seed' v)) :
    (AssignCL S K.Vertex).le (settle K seed) (settle K seed') := by
  apply (driveMono K seed).lfp_le_prefix
  intro j
  have h1 : S.le (driveFn K seed (settle K seed') j) (driveFn K seed' (settle K seed') j) :=
    driveFn_mono K h (fun v => S.le_refl _) j
  rw [settle_fixed] at h1
  exact h1

/-- At the settled section the drive with seed replaced by the section itself is already fixed. -/
theorem drive_at_settle_fixed (K : Complex S) (seed : Assign K) :
    driveFn K (settle K seed) (settle K seed) = settle K seed := by
  funext j
  apply S.le_antisymm
  · apply S.sSup_le
    intro s hs
    cases hs with
    | inl h => rw [h]; exact S.le_refl _
    | inr h =>
        obtain ⟨e, hmem, htgt, hval⟩ := h
        have hsup : S.le s (driveFn K seed (settle K seed) j) :=
          S.le_sSup _ s (Or.inr ⟨e, hmem, htgt, hval⟩)
        rw [settle_fixed] at hsup
        exact hsup
  · exact S.le_sSup _ (settle K seed j) (Or.inl rfl)

/-- **`settle` is idempotent**: with inflation and monotonicity, `settle` is a **closure operator**. -/
theorem settle_idem (K : Complex S) (seed : Assign K) :
    settle K (settle K seed) = settle K seed := by
  apply (AssignCL S K.Vertex).le_antisymm
  · exact (driveMono K (settle K seed)).lfp_least_of_fixed (drive_at_settle_fixed K seed)
  · exact settle_infl K (settle K seed)

/-- **Harmonic** states: those fixed by settling (the kernel of the order Laplacian). -/
def IsHarmonic (K : Complex S) (x : Assign K) : Prop := settle K x = x

/-- **A harmonic state is a global section.** Being settling-fixed forces every directed restriction
constraint `ρ_e (x src) ≤ x tgt` — harmonicity *is* global compatibility. -/
theorem harmonic_imp_compatible (K : Complex S) (x : Assign K)
    (h : IsHarmonic K x) : IsCompatible K x := by
  intro e he
  have hfix := settle_fixed K x
  rw [h] at hfix
  have hc : S.le (e.restrict (x e.src)) (driveFn K x x e.tgt) :=
    S.le_sSup _ (e.restrict (x e.src)) (Or.inr ⟨e, he, rfl, rfl⟩)
  rw [hfix] at hc
  exact hc

/-- **Settling lands on the least compatible state above the seed.** Any global section dominating
the seed dominates `settle K seed`. -/
theorem settle_le_of_compatible (K : Complex S) (seed x : Assign K)
    (hsx : ∀ v, S.le (seed v) (x v)) (hcomp : IsCompatible K x) :
    (AssignCL S K.Vertex).le (settle K seed) x := by
  apply (driveMono K seed).lfp_le_prefix
  intro j
  apply S.sSup_le
  intro s hs
  cases hs with
  | inl h => rw [h]; exact hsx j
  | inr h =>
      obtain ⟨e, hmem, htgt, hval⟩ := h
      rw [hval]
      have hco := hcomp e hmem
      rw [htgt] at hco
      exact hco

/-! ## The harmonic kernel is the degree-0 cohomology object `H⁰` -/

/-- The **harmonic kernel** of the Tarski Laplacian. -/
abbrev HarmonicKernel (K : Complex S) : Type := { x : Assign K // IsHarmonic K x }

/-- The **degree-0 cohomology object `H⁰`**: the global sections as the *image* of settling. -/
abbrev H0Object (K : Complex S) : Type := { x : Assign K // ∃ seed, settle K seed = x }

/-- **A state is a global section iff it is harmonic.** The image of settling equals its fixed-point
set — forward by idempotence, backward trivially. The lattice Hodge identity `ker L = H⁰`. -/
theorem mem_h0_iff_harmonic (K : Complex S) (x : Assign K) :
    (∃ seed, settle K seed = x) ↔ IsHarmonic K x := by
  constructor
  · intro ⟨seed, hseed⟩
    show settle K x = x
    rw [← hseed]; exact settle_idem K seed
  · intro h; exact ⟨x, h⟩

/-- Forward Hodge map. -/
def toH0 (K : Complex S) : HarmonicKernel K → H0Object K :=
  fun c => ⟨c.val, ⟨c.val, c.property⟩⟩

/-- Backward Hodge map. -/
def fromH0 (K : Complex S) : H0Object K → HarmonicKernel K :=
  fun c => ⟨c.val, (mem_h0_iff_harmonic K c.val).mp c.property⟩

/-- **The harmonic kernel is isomorphic to `H⁰`.** -/
theorem harmonic_kernel_h0_iso (K : Complex S) :
    (∀ x : Assign K, (∃ seed, settle K seed = x) ↔ IsHarmonic K x)
    ∧ (∀ c : HarmonicKernel K, fromH0 K (toH0 K c) = c)
    ∧ (∀ c : H0Object K, toH0 K (fromH0 K c) = c) :=
  ⟨fun x => mem_h0_iff_harmonic K x,
   fun _ => Subtype.ext rfl,
   fun _ => Subtype.ext rfl⟩

end Tarski
end Obsmetrologia
