---
title: Sheaf Topos Simulation
keywords:
  - simulation
  - sheaf
  - topos
depends_on:
  - theorem/external/relational-sheaf-topos
---
# Sheaf Topos Simulation

Emulate **Theorem (Relational Sheaf Topos)** by maintaining an explicit site,
matching families, and sheafification routines *over the relational site*
given by discipline/filter/profile data.  The site may be finite or a
symbolically described fragment, provided covers and restrictions are
enumerable; it is always a view on the underlying recognitions and towers,
not a separate object store.

## State representation

- **Site catalogue.**  
  A finite or symbolic view of the directed/infinity-site built from profiles:
  objects are profile recognitions; admissible covers are computed from
  discipline/filter data.  In an implementation this may be cached as adjacency
  lists `C(X)`, but the authoritative source is the earned site structure.

- **Presheaf table.**  
  For each object `X`, a representation of sections `F(X)` and restriction maps
  into the global hypertensor sheaf (for example, by indexing into existing
  sections or storing references to them).  No new global sheaf is created.

- **Matching-family workspace.**  
  A transient workspace for computing glued sections over a cover `𝒰` using the
  `SheafCondition`/`Sheafification` acts.

- **Sheafification cache.**  
  Optional cache of sheafified sections `aF(X)` after enforcing the gluing
  conditions, used to avoid recomputation in simulations.

## Inputs

1. Site definition derived from the external theorem (objects, covers).
2. Initial presheaf assignments (e.g., observable sets).
3. Sequenced updates to sections or restrictions.

## Update procedure

1. **Restriction maintenance.**  
   Ensure every morphism in the site has a restriction map; if missing, synthesize
   it via composition of existing maps.
2. **Matching families.**  
   For each cover `𝒰 = {U_i -> X}`, gather local sections and test equality on
   overlaps.  If they agree, add their glued section to `aF(X)`.
3. **Sheafification iteration.**  
   Repeat matching-family checks until no new glued sections appear.  This
   approximates the internal `Sheafification` act.
4. **Comparison functor.**  
   Map profile recognitions into the sheaf via the embedding recorded in
   `ProfileTopos`, ensuring finite limits/exponentials still behave.

## Invariants

- Restriction maps must compose correctly; verify by checking identity on loops.
- Matching families that agree on overlaps must produce a unique glued section;
  detect duplicates indicating missing equalizers.
- Sheafified data should be stable: re-running sheafification without new local
  sections should change nothing.

## Outputs

- Sheafified structures `aF(X)` for all objects and explicit glued sections.
- Summary of cover checks (success, conflicts).
- Diagnostics on restriction consistency and gluing violations.
