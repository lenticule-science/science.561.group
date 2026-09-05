---
title: Finite sections of the quasicrystalline hypertensor sheaf
aliases:
  - Finite sections of the quasicrystalline hypertensor sheaf
  - finite sections of the quasicrystalline hypertensor sheaf
keywords:
  - theorem
  - internal
  - hypertensor
  - sheaf
  - towers
depends_on:
  - theorem/internal/universal-state-hypertensor
  - topology-integration
---

# Theorem (Sheaf Sections over Finite Windows)

Let the relational quasicrystalline hypertensor sheaf from
**Theorem (Relational Quasicrystalline Hypertensor Sheaf)** be given. For any
finite lattice window and corresponding finite open chart `U` in the
directed/infinity-site topology, there is a finite section of the sheaf over `U`
consisting of:

- a finite lattice window (indices and site metadata), and
- a finite family of profile towers attached to fibres whose trace/context
  positions lie inside `U`.

More precisely:

1. **Restriction to finite windows.**  
   Restricting the sheaf to an open `U` whose support lies over a finite lattice
   window yields a finite section that depends only on:
   - a finite lattice window structure, and
   - a finite family of attached profile towers drawn from the tower
     interaction stack.

2. **Representation by (window, towers).**  
   For such `U`, there is a representation of `s_U` as:

   - a lattice window object `W` recording dimension, sites, and window
     metadata, and
   - a finite list of profile towers whose fibres lie over trace/context points
     in `U`.

   Two such representations `(W, {T_i})` and `(W', {T'_j})` describe the same
   section precisely when they are related by sheaf restriction/gluing and
   nucleus-equivalence in the sense of the hypertensor and tower theorems.

3. **Functoriality under restriction.**  
   If `V ⊂ U` is another finite chart, the restriction of `s_U` to `V` is
   obtained by:

   - restricting the lattice window `W` to the sub-window corresponding to `V`,
   - restricting each tower `T_i` to the fibres that lie over `V`, and
   - discarding any towers/fibres outside `V`.

   Thus the association from each open set `U` to the pair
   `(W(U), {T_i(U)})` is functorial and realises the sheaf over finite windows.

In particular, finite sections of the sheaf are completely determined (up to
the earned equivalences) by a finite lattice window together with a finite
family of attached profile towers.  This justifies using carriers of the form
`(window, towers)` as concrete models for small pieces of the sheaf in
simulations.
