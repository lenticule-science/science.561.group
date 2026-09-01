---

name: closure-sorting
description: "U_G is a Maxwell-demon sorter at the universe level, with memory = the universe being built. Two conjectures: R = U_G(R) is informational equilibrium; cohomological tunneling is global erasure at structural commitment cost."
---

### Conjecture — Closure Sorting {#closure-sorting}

*Found by holding Maxwell's demon in one hand and the Relational Hyperverse in the other.*

#### The Universe-Level Sorter {#closure-sorting-setup}

The nucleus sorter (§nucleus-sorting) works at a single fiber. The **closure sorter**
is $U_G$ itself (§closure-operator), operating on the full Relational Universe $R$.
It sorts objects of a candidate universe $\mathcal{U}$ by seven closure conditions:

| Condition | What it sorts | Action |
|-----------|---------------|--------|
| Atoms | Trace-fiber pairs $(t, H_t)$ | Admits the generating elements |
| Isomorphism | Isomorphic objects | Closes under relabeling |
| Limits/colimits | Diagrams | Closes under assembly |
| Exponentials | Internal hom-objects | Closes under function spaces |
| Subobjects | Monomorphisms | Closes under parts |
| Structural ops $\mathcal{F}$ | Functorial operations | Closes under the generating dynamics |
| Sheaf gluing | Compatible families on covering sieves | Closes under local-to-global assembly |

The sheaf gluing condition is the non-local one — and the one that cohomological
obstructions can block.

Unlike the nucleus sorter, $U_G$ has no external memory register. Its memory is the
universe being sorted: at stage $n$ of the depth-filtration tower (§depth-filtration),
the sorter's memory is $R_n$, and $R_{n+1} = U_G(R_n)$.

#### The First Conjecture — Informational Equilibrium {#closure-sorting-equilibrium}

The nucleus sorter is address-bound (§nucleus-sorting): it cannot erase its history $t$
because $t$ is its position. The closure sorter faces a stronger version — at the fixed
point, it *is* the universe it sorts.

**Conjecture (Informational Equilibrium).** $R = U_G(R)$ is the informational
equilibrium condition: the unique state where the sorter's memory and workspace are the
same set. Short of the fixed point, $R_n \subsetneq U_G(R_n) = R_{n+1}$ — the sorter
always produces more than it holds. At equilibrium, applying $U_G$ to $R$ yields nothing
new: the universe already contains everything its own sorting criteria require.

At equilibrium there is no external vantage point from which to assess whether the
sorting is correct — correctness is the fixed-point equation. The universe sorts itself
by criteria drawn from itself; the fixed point is the only state where those criteria
are stable.

The formal treatment — including what informational equilibrium excludes, its relation
to the address bound, and the hyperverse analog $\mathcal{H} = U_\mathcal{H}(\mathcal{H})$
— is in §informational-equilibrium.

#### The Second Conjecture — Cohomological Erasure {#closure-sorting-erasure}

The closure sorter faces a problem the nucleus sorter does not. Some objects are locally
consistent on every covering sieve but globally inconsistent across the site $(T,J)$:
modes with nonzero obstruction class $\partial([e]) \in H^1(T,J;\,E_0)$
(§cohomological-tunneling). Local inspection cannot resolve them.

**Conjecture (Cohomological Erasure).** When a mode $e$ has $\partial([e]) \neq 0$,
the Axiom of Locality (§locality) forces a discontinuous eigenvalue drop: $U_G$ maps
$e$ to a lower-eigenvalue state in a single step, discharging the $H^1$ class. This is
the sorter's **global erasure**.

The Landauer analog: each tunneling event erases one local inconsistency at a cost of
one structural commitment (§structural-commitment) — the sorter commits permanently to a
globally coherent section, constraining all future decisions over that covering family.
The total commitment cost equals $\sum_n \dim H^1$ at each depth; the tower converges
to $R = U_G(R)$ if and only if this sum is finite.

Unlike classical Landauer, the erasure is not voluntary — the Axiom of Locality forces
it. The cost is not energetic but topological: degrees of freedom surrendered, not joules
dissipated.

#### The Cantor Boundary {#closure-sorting-cantor}

The invariant locale $\mathsf{Phase}$ (§invariant-locale) is the closure sorter's
exhausted memory: the accumulation of all modes settled to $H_t^*$ across the full
tower. It has measure zero in the spectral metric but is uncountably complete — the
sorter has resolved everything, but the record of that resolution is a zero-volume
totality.

This Cantor-like geometry is not incidental. The $\phi^n$ growth of shuffle-equivalence
classes (§golden-stability) — the same growth that sets the address entropy of the
nucleus sorter (§address-entropy) — is the combinatorial source of this geometry.
The golden ratio appears at both levels: as the per-fiber address cost and as the
global shape of what's left when everything is sorted.

**Status.** Both conjectures are precise enough to pursue and their dependencies are
clear: §informational-equilibrium formalizes the first; §structural-commitment formalizes
the second. The Cantor boundary claim depends on §cohomological-tunneling (Convergence
section) and §invariant-locale reaching a level of development that ties the Cantor
topology to the $H^1$ exhaustion.
