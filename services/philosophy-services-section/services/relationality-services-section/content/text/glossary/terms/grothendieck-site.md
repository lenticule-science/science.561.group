---
name: Grothendieck site
id: grothendieck-site
type: term
date-created: 2026-10-14
description: "A category equipped with a topology of covering sieves satisfying maximality, pullback stability, and transitivity."
see-also:
  - infinity-site
---

A **Grothendieck site** is a pair `(C, J)` of a category `C` and a topology `J` specifying covering sieves for each object. Covering assignments satisfy maximality, stability under pullback, and local character (transitivity). Sheaves satisfy compatible local-to-global gluing over those covers. A **site is not itself its sheaf topos**.

The [single source-owned site explanation](../../documents/articles/notes/2026/03/19/2026-03-19-site.md) distinguishes this established mathematics from the Group's **conjectural** relational-history/institutional site construction. [Obsmetrologia Site.Basic](https://github.com/lenticule-science/obsmetrologia/blob/main/Obsmetrologia/Site/Basic.lean) formalizes a finite clopen-cover basis; [ProtectedCover](https://github.com/lenticule-science/obsmetrologia/blob/main/Obsmetrologia/Site/ProtectedCover.lean) proves that geometric coverage need not preserve a protected region. These results do not prove a physical 3+1 spacetime or automatic authority for work-system claims.
