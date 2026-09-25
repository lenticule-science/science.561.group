---
name: decidability
description: The ¬¬-subtopos of Eff — the subtheory of computing where every predicate is internally either true or false. Objects are decidable (Δ₁⁰) predicates; morphisms are computable total functions. The classical (Boolean) subtheory of computability; the least restrictive subtheory of Eff that forces classical logic.
component-of: computing
title: decidability
---

# Decidability

The Boolean subtopos of $\mathbf{Eff}$, given by the double-negation Lawvere-Tierney topology $j = \neg\neg$. The $j$-sheaves are exactly the assemblies where the internal logic becomes classical: every proposition $P$ satisfies $P \vee \neg P$ internally. The computable functions that are total and whose termination is decidable live here; the halting problem is undecidable and therefore not expressible as an internal predicate of this subtopos.

This is the $\neg\neg$-subtopos in the filter lattice of the Medvedev lattice — the smallest non-degenerate filter (consisting of all solvable mass problems, i.e., those with a computable member). It is the top of the untyped subtheory lattice; further restriction produces only the degenerate one-object topos.
