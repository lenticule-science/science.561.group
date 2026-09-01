---
type: theorem
status: sketch
depends-on:
  - akicita-band
  - wolakhota-closure-system
  - beck-chevalley-commutation-on-predication-bilattices
---

# Akicita revocation at scope-completion

**Statement.** For an akicita band $B$ with scope-action $X$ in polity $P$, the scope-completion morphism $\mathrm{complete}(X) : v \to v'$ commutes with predicate-category base-change in $\mathcal{C}_\mathrm{lak}$.
That is, for any $f : q \to p$ in $\mathcal{C}_\mathrm{lak}$:

$$f^*(\mathrm{complete}(X)(v)) = \mathrm{complete}(X)(f^*(v))$$

up to canonical iso.
Consequently, the automatic revocation of $\langle B, \texttt{scope-potential}\rangle$ and $\langle B, \texttt{enforcement-authority}\rangle$ at $X$-completion (per [akicita-band](../objects/akicita-band.md) §"Revocation at scope-completion") propagates correctly through reindexing.

## Proof sketch

The scope-completion morphism's substrate-content: when $\langle X, \texttt{completed}\rangle$ settles at $\mathbf{t}$, three cells are operated on:

1. $\langle B, \texttt{scope-potential}\rangle \to \bot$
2. $\langle B, \texttt{enforcement-authority}\rangle \to \bot$
3. Any $\langle a, \texttt{akicita-sanctioned}, X\rangle \to \bot$ for sanctions issued under $B$'s authority during $X$.

These operations are *scoped retractions*: cells indexed by $X$ are reset to $\bot$ when $X$ completes.
The cells are not really "decreasing in $\leq_k$" — they are *scope-windowed*, and the scope's closing is the natural-end of the cell's interpretive window.

By [Beck–Chevalley commutation on predication bilattices](../../../../../../../../math/theories/categories/theories/predication-categories/theorems/beck-chevalley-commutation-on-predication-bilattices.md), the reindexing $f^*$ commutes with the existential and universal quantifiers along $\mathcal{C}_\mathrm{lak}$-morphisms when the relevant pullback squares satisfy BC.

The scope-completion morphism is constructible as a composite:

- $\exists$-quantifier over the scoped-cells (collecting them into a $X$-indexed family).
- Substitution of $\bot$ into the family.
- Reindexing back to the cell-level.

Each step commutes with $f^*$ by BC.
The composite is therefore $f^*$-natural. $\square$

## Corollary: akicita-authority transports correctly across oyate boundaries

When an akicita band's scope-action $X$ involves multiple oyate (e.g., a confederacy-scope hunt that travels across oyate-territories), the BC-naturality ensures that the scope-completion at the confederacy-scope is the same as scope-completion at each oyate-scope reindexed up: revocation in one oyate's substrate matches revocation in another's.

This is what enables the akicita-authority to be coherent across oyate-boundaries.
A hunter from oyate $O_1$ sanctioned by the confederacy-akicita is *not* under sanction in oyate $O_2$ after the hunt completes; the revocation propagates uniformly.

## Corollary: akicita-sanctions do not propagate beyond scope

The same theorem applied to scoped-sanction-cells: sanctions issued under akicita-authority during $X$ are reset to $\bot$ at $X$-completion, and this reset is $f^*$-natural.
So a hunter whose bow was broken by hunt-akicita during the hunt is *not* under broken-bow-sanction in subsequent hunts, councils, or polity-life generally.
The sanction was scoped to $X$; the scope has closed; the sanction-cell follows.

This is structurally distinct from criminal-record-cells (which propagate-forward beyond the original scope under U.S.-statutory closure rules) and is the substrate-content of "akicita-sanctions don't carry over."
The polity does not accumulate punitive-records.

## Significance

The theorem makes precise the structural-feature that distinguishes akicita-authority from standing-police-authority: the scope-bounded character isn't merely a description; it is a Beck–Chevalley-coherent substrate-operation that *cannot leak* into post-scope substrate-state.

The polity has, in akicita-authority, a mechanism for *coercive coordination* during specific actions while preserving the *non-coercive* character of the polity's general life.
The BC-naturality is what guarantees the leakage-prevention is structural, not merely conventional.

## Sources

- Walker 1982, *Lakota Society* — akicita-scope completion in practice.
- Powers, *Oglala Religion* (1977) — the structural-form of akicita-authority's scope-bounding.
- Pekka Hämäläinen, *Lakota America* (2019) — akicita-coordination during Lakota Plains-period.
- [Beck–Chevalley commutation on predication bilattices](../../../../../../../../math/theories/categories/theories/predication-categories/theorems/beck-chevalley-commutation-on-predication-bilattices.md) — the algebraic underpinning.
