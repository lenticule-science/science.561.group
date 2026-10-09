---
title: Directed Infinity-Site Simulation
keywords:
  - simulation
  - infinity-site
  - coverage
depends-on:
  - theorem/external/relational-directed-stratified-infinity-sites
description: Simulate Theorem (Relational Directed Stratified Infinity-Sites) by encoding the profile/filter/tower machinery as an explicit Grothendieck-style site over the existing relational state.
---

Simulate **Theorem (Relational Directed Stratified Infinity-Sites)** by encoding
the profile/filter/tower machinery as an explicit Grothendieck-style site
*over* the existing relational state.  Objects, morphisms, and covers are views
on stabilised recognitions and towers; this spec does not introduce a separate
store.

## State representation

- **Objects.**
  A finite or symbolic set of profile recognitions drawn from the global
  relational state (for example, profile objects or sections tagged by a
  given discipline).  Each object records the discipline/filter data that
  defines its coverage.

- **Morphisms.**
  Directed maps between such objects, induced by admissible flows and
  inclusions in the underlying recognitions and profile towers.  In a
  simulation they may be represented as adjacency lists, but conceptually
  they are morphisms in the stratified site built from existing profiles.

- **Cover families.**
  For each object `X`, a finite list of covers `{U_i -> X}` derived from the
  earned discipline/filter rules.  These covers are computed from profile
  metadata rather than stored as an independent catalogue.

- **Tower hierarchy.**
  The nested profile tower levels over these objects, as given by
  `BuildProfileTower` and related acts, used to track higher cells in the
  directed ∞‑site.

## Inputs

1. Base objects and morphisms (seeded from profile data).
2. Rules for generating covers (discipline/filter specification).
3. Tower parameters (number of levels, composition rules).

## Procedures

1. **Coverage generation.**
   For each object, compute admissible covers by applying the discipline/filter
   rules.  Verify stability under flow/nucleus operations.

2. **Tower assembly.**
   Build higher cells by iterating profile tower construction, ensuring coherence
   across levels.

3. **Sheaf interface.**
   Provide APIs for checking matching families on this site (to be consumed by
   the sheaf simulation).

## Invariants

- Covers must be closed under pullback and composition (within the simulated
  fragment).
- Tower coherence: projections between levels should commute.

## Outputs

- Site data: objects, morphisms, covers, tower structure.
- Diagnostics for coverage violations or tower inconsistencies.
