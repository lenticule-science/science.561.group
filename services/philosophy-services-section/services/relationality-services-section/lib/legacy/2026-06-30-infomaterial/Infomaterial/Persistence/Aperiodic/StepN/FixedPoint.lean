import Infomaterial.Persistence.Aperiodic.Moduli
import Infomaterial.Persistence.Aperiodic.Universality
import Infomaterial.Persistence.Aperiodic.AndersonPutnam

/-!
# Step-`n` fixed-point object — `M^∞`, the colimit of the ascending chain `M^(2) ↪ M^(3) ↪ ⋯` under the step-shift, the candidate renormalization-group fixed point at infinite step depth

This module formalizes the corpus node

* `…/settling/…/step-n-substitution-rule/content/step-n-moduli-substack/content/step-n-fixed-point/step-n-fixed-point.md`

which records the **step-`n` fixed-point object** `M^∞`. Reading the corpus:

> `M^∞ := colim_n M^(n)` is the colimit (as `n → ∞`) of the ascending chain
> `M^(2) ↪ M^(3) ↪ ⋯` under the step-shift `σ`. It is the candidate **renormalization-group
> (RG) fixed point** at infinite step depth: `σ(M^∞) = M^∞`. Each finite-step `M^(n)` embeds
> into the colimit (universal property), and the colimit is invariant under further iteration
> of `σ`.

## How `M^∞` is modeled (reusing `SettlingModuliStack` and `AperiodicClassification`)

The ascending chain `M^(2) ↪ M^(3) ↪ ⋯` is realized by `Moduli.stepShift` (the step-shift
`σ : StepRule n → StepRule (n+1)`), which **preserves the moduli point**
(`Moduli.toModuli_stepShift`) and carries each sub-stack into the next
(`Moduli.M_stepShift_mono`, the chain inclusion `M^(n) ⊆ M^(n+1)`).

The colimit reuses `Moduli.moduliSystem` — the directed system over `(Nat, ≤)` whose every
stage is `Moduli.ModuliPoint` and whose maps are the (identity-on-classes) step-shift, exactly
as `SettlingModuliStack` builds it. `M^∞` is its colimit `Persistence.Aperiodic.DirectedSystem.Colimit
moduliSystem` (built on `AperiodicClassification`'s direct-limit `Quot Eventually`). Each
finite stage `n` embeds as `embed n p := Colimit.mk moduliSystem ⟨n, p⟩` (the cocone), and the
colimit collapses the depth index (`Moduli.moduli_colimit_stage_independent`).

## How the RG fixed-point equation is modeled — honest scoping

The **step-shift flow at infinite depth** `σ^∞ : M^∞ → M^∞` is the colimit endomorphism induced
by `σ` shifting each representative one depth up: `⟨n, p⟩ ↦ ⟨n+1, p⟩`. Because `σ` preserves the
moduli point, the directed-system maps are the identity on classes, so the colimit collapses the
depth index — `⟨n, p⟩` and `⟨n+1, p⟩` are already identified in `M^∞`
(`Moduli.moduli_colimit_stage_independent`). Hence `σ^∞` is **well-defined** (it descends to a
function on the quotient) and is the **identity** on `M^∞`. The RG-fixed-point equation
`σ(M^∞) = M^∞` is therefore the statement `σ^∞ x = x` for every `x : M^∞` — `M^∞` is a fixed
point of the step-shift flow, invariant under further iteration of `σ`. This reuses the
constant-map directed system precisely because `stepShift` preserves the moduli point, exactly as
`SettlingModuliStack` does for `moduliSystem`; we document that the depth-collapse (not a
nontrivial cohomological flow) is what makes the shift the identity here.
-/

namespace Infomaterial
namespace Persistence.Aperiodic.StepN

open Infomaterial.Persistence.Aperiodic
open Infomaterial.Persistence.Aperiodic.Moduli

/-! ## (1) The ascending chain `M^(2) ↪ M^(3) ↪ ⋯`

The chain is the step-shift `σ` of `SettlingModuliStack`: it preserves the moduli point and
carries each sub-stack into the next. We re-export the two load-bearing facts under names local
to the fixed-point node. -/

/-- **The chain step preserves the moduli point.** `σ` carries a step-`n` rule's MLD-class to
the *same* class one depth up: `toModuli (σ r) = toModuli r`. This is the inclusion `M^(n) ↪
M^(n+1)` on classes (`Moduli.toModuli_stepShift`). -/
theorem chain_preserves_point {n : Nat} (r : StepRule n) :
    toModuli (stepShift r) = toModuli r :=
  toModuli_stepShift r

/-- **The chain step is the sub-stack inclusion** `M^(n) ⊆ M^(n+1)`: a moduli point in the
step-`n` sub-stack lies in the step-`(n+1)` sub-stack (`Moduli.M_stepShift_mono`). The
ascending chain `M^(2) ↪ M^(3) ↪ ⋯`. -/
theorem chain_inclusion {n : Nat} {p : ModuliPoint} (h : M n p) : M (n + 1) p :=
  M_stepShift_mono h

/-! ## (2) `M^∞` — the colimit of the chain (the RG-fixed-point candidate)

`M^∞ := colim_n M^(n)` is the colimit of `Moduli.moduliSystem` (the directed system over
`(Nat, ≤)` whose stages are `ModuliPoint` and whose maps are the identity-on-classes step-shift),
reusing `AperiodicClassification`'s direct-limit `Quot Eventually`. -/

/-- **The step-`n` fixed-point object** `M^∞ := colim_n M^(n)` — the colimit of the ascending
chain `M^(2) ↪ M^(3) ↪ ⋯`, realized as `Persistence.Aperiodic.DirectedSystem.Colimit moduliSystem`. The
candidate **RG-fixed-point**: the universal substitution moduli at infinite step depth. -/
def Minfinity : Type 1 := DirectedSystem.Colimit moduliSystem

/-- **The finite-stage embedding** `M^(n) → M^∞` — each moduli point at step depth `n` maps
into the colimit (the cocone of the directed system). `embed n p := Colimit.mk ⟨n, p⟩`. -/
def embed (n : Nat) (p : ModuliPoint) : Minfinity :=
  DirectedSystem.Colimit.mk moduliSystem ⟨n, p⟩

/-- **The colimit collapses the step-depth index.** A moduli point embedded at depth `m` equals
the same point embedded at depth `n` in `M^∞` (the step-shift acts as the identity on classes, so
the colimit identifies all depths). Reuses `Moduli.moduli_colimit_stage_independent`. -/
theorem embed_depth_independent (m n : Nat) (p : ModuliPoint) : embed m p = embed n p :=
  moduli_colimit_stage_independent m n p

/-- **Each chain stage maps compatibly into `M^∞`** (the cocone law on the constant system): a
point at depth `n` and its image under the directed-system map at depth `n+1` agree in the
colimit. Since `moduliSystem.map` is the identity on `ModuliPoint`, this is
`embed n p = embed (n+1) p` read off `Persistence.Aperiodic.DirectedSystem.Colimit.map_eq`. -/
theorem embed_cocone (n : Nat) (p : ModuliPoint) :
    embed n p = DirectedSystem.Colimit.mk moduliSystem ⟨n + 1, moduliSystem.map (Nat.le_succ n) p⟩ :=
  DirectedSystem.Colimit.map_eq moduliSystem (Nat.le_succ n) p

/-! ## (3) The step-shift flow `σ^∞ : M^∞ → M^∞` and its RG-fixed-point equation

`σ^∞` shifts each representative one step depth up: `⟨n, p⟩ ↦ ⟨n+1, p⟩`. It is well-defined on
the quotient because the colimit collapses the depth (`embed_depth_independent`), and it is the
**identity** on `M^∞` — `σ(M^∞) = M^∞`, the RG-fixed-point equation. -/

/-- **The step-shift flow at infinite depth** `σ^∞ : M^∞ → M^∞` — the colimit endomorphism
induced by `σ` shifting each representative one step depth up. Defined by `Quot.lift` of
`⟨n, p⟩ ↦ embed (n+1) p`; well-definedness uses that the colimit collapses depth (`σ` preserves
the moduli point, `Moduli.toModuli_stepShift` / `moduli_colimit_stage_independent`). -/
def sigmaInfinity : Minfinity → Minfinity :=
  Quot.lift (fun a : DirectedSystem.Elem moduliSystem => embed (a.stage + 1) a.val)
    (by
      -- well-defined: eventually-equal representatives have equal depth-shifted embeddings
      intro a b h
      -- both `embed (a.stage+1) a.val` and `embed (b.stage+1) b.val` reduce to `Colimit.mk`s
      -- identified by the colimit (the directed-system map is identity on classes)
      obtain ⟨k, hak, hbk, hk⟩ := h
      -- a.val and b.val become equal at stage k (map is identity), so the colimit classes agree
      show DirectedSystem.Colimit.mk moduliSystem ⟨a.stage + 1, a.val⟩
        = DirectedSystem.Colimit.mk moduliSystem ⟨b.stage + 1, b.val⟩
      apply DirectedSystem.Colimit.sound
      -- push both to stage `k+1`; `moduliSystem.map` is the identity, so the values are a.val,
      -- b.val, equal at k by `hk` (which is `a.val = b.val` since the maps are identities)
      refine ⟨k + 1, Nat.succ_le_succ hak, Nat.succ_le_succ hbk, ?_⟩
      -- `moduliSystem.map _ x = x`; the eventual-equality witness `hk : a.val = b.val`
      exact hk)

/-- **`σ^∞` shifts a stage embedding one depth up.** On the embedding of `p` at depth `n`,
`σ^∞ (embed n p) = embed (n+1) p` — the step-shift flow advances the step depth by one. (Holds
definitionally from the `Quot.lift`.) -/
theorem sigmaInfinity_embed (n : Nat) (p : ModuliPoint) :
    sigmaInfinity (embed n p) = embed (n + 1) p := rfl

/-- **`σ^∞` is the identity on each embedded point.** Advancing the step depth by one is invisible
in the colimit (`embed n p = embed (n+1) p`, `embed_depth_independent`): `σ^∞ (embed n p) =
embed n p`. The fixed-point equation on every finite-stage class. -/
theorem sigmaInfinity_embed_fixed (n : Nat) (p : ModuliPoint) :
    sigmaInfinity (embed n p) = embed n p := by
  rw [sigmaInfinity_embed]
  exact (embed_depth_independent n (n + 1) p).symm

/-- **`σ^∞` is the identity on all of `M^∞`** — the renormalization-group fixed-point equation
`σ(M^∞) = M^∞`. Every point of the colimit is fixed by the step-shift flow: the colimit collapses
the step-depth index, so advancing the depth is the identity. Proved by `Quot.ind` reducing to
the stage-embedding case (`sigmaInfinity_embed_fixed`). -/
theorem sigmaInfinity_id (x : Minfinity) : sigmaInfinity x = x := by
  induction x using Quot.ind with
  | mk a =>
    -- `Quot.mk _ a = embed a.stage a.val` definitionally; apply the embedded-fixed lemma
    exact sigmaInfinity_embed_fixed a.stage a.val

/-! ## `M^∞` is an RG fixed point of the step-shift flow -/

/-- **The step-`n` colimit is a renormalization-group fixed point.** `M^∞ = colim_n
M^(n)` is a **fixed point of the step-shift flow** `σ^∞`: `σ(M^∞) = M^∞`. Concretely:

* **the RG-fixed-point equation** — `σ^∞ x = x` for *every* `x : M^∞`: the step-shift flow at
  infinite depth is the identity on the colimit (advancing the step depth by one is invisible
  once the depths are colimited);
* **on finite stages** — `σ^∞ (embed n p) = embed n p`: each embedded step-`n` class is fixed
  (`σ^∞` shifts to depth `n+1`, identified with depth `n` in `M^∞`);
* **the depth-shift law** — `σ^∞ (embed n p) = embed (n+1) p`: `σ^∞` advances the step depth by
  one, and the colimit's depth-collapse turns that shift into the identity.

This holds because `Moduli.stepShift` preserves the moduli point (`Moduli.toModuli_stepShift`),
so the directed-system maps are identity-on-classes and the colimit collapses the depth index
(`Moduli.moduli_colimit_stage_independent`); the shift is the identity on that index. (Honest
scope: the RG flow is realized via the depth-collapse of the constant-map directed system that
`SettlingModuliStack` already uses, not a recomputed cohomological flow.)

Corpus: `step-n-fixed-point.md`. -/
theorem step_n_colimit_rg_fixed_point :
    -- the RG-fixed-point equation: σ^∞ is the identity on M^∞ (σ(M^∞) = M^∞)
    (∀ x : Minfinity, sigmaInfinity x = x)
    -- on every embedded finite stage, σ^∞ fixes the class
    ∧ (∀ (n : Nat) (p : ModuliPoint), sigmaInfinity (embed n p) = embed n p)
    -- the depth-shift law: σ^∞ advances the step depth by one
    ∧ (∀ (n : Nat) (p : ModuliPoint), sigmaInfinity (embed n p) = embed (n + 1) p) :=
  ⟨sigmaInfinity_id,
   sigmaInfinity_embed_fixed,
   sigmaInfinity_embed⟩

/-! ## The ascending chain, its colimit, and the universal property -/

/-- **The step-shift chain, its colimit `M^∞`, and the universal RG-fixed-point property
.** Bundles the ascending chain with its colimit as the universal RG fixed point:

* **the ascending chain** `M^(2) ↪ M^(3) ↪ ⋯` — the step-shift preserves the moduli point
  (`toModuli (σ r) = toModuli r`) and carries each sub-stack into the next (`M n p → M (n+1) p`),
  the chain inclusions of `SettlingModuliStack`;
* **each finite stage maps into the colimit** — `embed n p : M^∞` is the cocone, and the colimit
  identifies a point across all step depths (`embed m p = embed n p`), the universal property
  collapsing the depth index;
* **the cocone law** — `embed n p` agrees with the directed-system image at depth `n+1`
  (`Persistence.Aperiodic.DirectedSystem.Colimit.map_eq`), so the embeddings commute with the chain maps;
* **invariance under iteration of `σ`** — the colimit is fixed by the step-shift flow
  (`σ^∞ x = x`): `M^∞` is invariant under further iteration of `σ`, the universal substitution
  moduli at infinite step depth.

Corpus: `step-n-fixed-point.md`. -/
theorem step_shift_chain_colimit :
    -- the ascending chain: σ preserves the moduli point and is the sub-stack inclusion
    (∀ (n : Nat) (r : StepRule n), toModuli (stepShift r) = toModuli r)
    ∧ (∀ (n : Nat) (p : ModuliPoint), M n p → M (n + 1) p)
    -- each finite stage embeds into the colimit, identified across all depths (universal property)
    ∧ (∀ (m n : Nat) (p : ModuliPoint), embed m p = embed n p)
    -- the cocone law: the embedding commutes with the chain's directed-system map
    ∧ (∀ (n : Nat) (p : ModuliPoint),
        embed n p
          = DirectedSystem.Colimit.mk moduliSystem ⟨n + 1, moduliSystem.map (Nat.le_succ n) p⟩)
    -- the colimit is invariant under further iteration of σ (the RG fixed point)
    ∧ (∀ x : Minfinity, sigmaInfinity x = x) :=
  ⟨fun _ r => chain_preserves_point r,
   fun _ _ h => chain_inclusion h,
   embed_depth_independent,
   embed_cocone,
   sigmaInfinity_id⟩

end Persistence.Aperiodic.StepN
end Infomaterial
