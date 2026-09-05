import RelationalHyperverse.UniverseClosureMeta

-- Establishes: hyperverse-tower

/-!
# HyperverseTower: the ω-tower and self-universal universes

Corresponds to `math/hyperverse-tower.md`.

The **hyperverse tower** is the ω-chain:

  R = R^(0) ↪ R^(1) ↪ R^(2) ↪ ⋯

where R^(n+1) = U_H(R^(n)) and the embeddings are the canonical Yoneda inclusions.
The Relational Hyperverse H is the colimit of this tower: H = colim_n R^(n).

**The two towers are distinct** (per `CLAUDE.md`):
- The *depth-filtration tower* builds R within a fixed T (§def-depth-filtration)
- The *hyperverse tower* builds H by iterating U_H across universes (this file)

A **self-universal** universe is a fixed point of U_H: a universe S with U_H(S) ≅ S.
The Relational Hyperverse is the *initial* such fixed point.

## Main definitions
- `UniverseClosure.iter R n` : the n-th level R^(n) of the tower
- `UniverseClosure.step_embed` : the embedding R^(n) ↪ R^(n+1)
- `UniverseClosure.tower_embed` : the cumulative embedding R ↪ R^(n)
- `IsSelfUniversal R` : R is a fixed point of U_H

## Open items
- Colimit construction: H = colim_n R^(n) requires completeness of RU
- IsSelfUniversal coherence: embed ∘ retract = id and retract ∘ embed = id
  (requires morphism equality / category structure on RU)
-/

-- ── The ω-Tower ───────────────────────────────────────────────────────────────

/-- The iterated application U_H^n(R): the n-th level of the hyperverse tower. -/
noncomputable def UniverseClosure.iter (R : RelationalUniverse) : ℕ → RelationalUniverse
  | 0     => R
  | n + 1 => UniverseClosure (UniverseClosure.iter R n)

/-- The embedding from level n to level n+1. -/
noncomputable def UniverseClosure.step_embed (R : RelationalUniverse) (n : ℕ) :
    RelationalUniverseMor (UniverseClosure.iter R n) (UniverseClosure.iter R (n + 1)) :=
  UniverseClosure.embed (UniverseClosure.iter R n)

/-- The cumulative embedding from R = R^(0) to R^(n), composing n step embeddings. -/
noncomputable def UniverseClosure.tower_embed (R : RelationalUniverse) :
    ∀ n : ℕ, RelationalUniverseMor R (UniverseClosure.iter R n)
  | 0     => RelationalUniverseMor.id R
  | n + 1 =>
      RelationalUniverseMor.comp
        (UniverseClosure.step_embed R n)
        (UniverseClosure.tower_embed R n)


-- ── Self-universal (fixed-point) universes ────────────────────────────────────

/-- A RelationalUniverse is self-universal if it is a fixed point of U_H:
    U_H(R) ≅ R.

    The embed and retract witness the isomorphism. Coherence (that they are
    mutually inverse) is left OPEN — it requires an equality notion for
    RelationalUniverseMor (i.e., a category structure on RU with morphism equality). -/
structure IsSelfUniversal (R : RelationalUniverse) where
  /-- The forward half: R embeds into its own closure. -/
  embed   : RelationalUniverseMor R (UniverseClosure R)
  /-- The backward half: the closure retracts onto R. -/
  retract : RelationalUniverseMor (UniverseClosure R) R
  -- OPEN: retract.comp embed = idMor R
  -- OPEN: embed.comp retract = idMor (UniverseClosure R)

/-- Any self-universal universe has the canonical embed from UniverseClosure.embed. -/
def IsSelfUniversal.canonical_embed (R : RelationalUniverse) : IsSelfUniversal R →
    RelationalUniverseMor R (UniverseClosure R) :=
  fun su => su.embed
