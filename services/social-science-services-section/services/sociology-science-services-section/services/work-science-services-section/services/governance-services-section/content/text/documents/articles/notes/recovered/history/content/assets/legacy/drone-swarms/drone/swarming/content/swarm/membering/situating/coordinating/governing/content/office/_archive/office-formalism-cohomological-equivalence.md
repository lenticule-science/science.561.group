---
type: question
status: partial
explores: [office-formalism-equivalence]
---

# Do the bilattice-substrate and Heyting-algebra-presheaf formalisms of office have equivalent cohomology?

The [office-formalism-equivalence theorem](../theorems/office-formalism-equivalence.md) sketches a translation between the bilattice-substrate realization of office (two predicates with closure rules) and the work-vocabulary's [formal-structure-of-office](../../../../../../../../../../../humanities/theories/sociology/theories/work/texts/formal-structure-of-office.md) (Heyting algebra fiber with two nuclear closures), preserving doubly-stable incumbency, persistence, shadow classes, and restriction maps as settling-morphisms.

The translation does *not* establish equivalence at the cohomology level.
The Heyting-presheaf model and the bilattice-substrate model produce different cohomological structures by default: the office text's presheaf is in $\mathbf{HA}$; the predicated-work setting is in the bitopological settling site with d-frame-valued sheaves.

The question: is $H^n$ computed in the office text's setting equal to $H^n$ computed in the bilattice-substrate setting?

## The Priestley-duality route

The resolution strategy is to use [Priestley dualizability](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/priestley-dualizability.md) to relate the two sites.

### The restriction functor $\pi^+$

The bilattice $\mathbf{FOUR} = \mathbf{2} \times \mathbf{2}$ decomposes into a positive coordinate ($\mathbf{2}$, the truth lattice) and a negative coordinate ($\mathbf{2}$, the falsity lattice).
The *positive coordinate restriction* $\pi^+ : \mathbf{FOUR}\text{-}\mathbf{Settling} \to \mathbf{HA}\text{-}\mathbf{Presheaf}$ takes a bilattice-valued settling to its positive coordinate, producing a $\mathbf{2}$-valued presheaf, which is a Heyting algebra presheaf (since $\mathbf{2}$ is a Heyting algebra).

On the office's predication fiber, $\pi^+$ restricts each cell $\langle \iota, \mathrm{rec}(O), O\rangle \in \mathbf{FOUR}$ to its positive component $\langle \iota, \mathrm{rec}(O), O\rangle^+ \in \mathbf{2}$.
The positive component is $\mathbf{t}$ when the cell carries a positive witness (and ignores the negative-witness component).
This is the map from the bilattice settling to the Heyting presheaf used in the office-formalism-equivalence translation.

### Exactness and the independence condition

For cohomology to transfer across $\pi^+$, the functor must be *exact*: it must preserve exact sequences of sheaves on the respective sites.
Exactness of $\pi^+$ depends on whether the two predicate fibers (recognition and induction) interact via the negative coordinate:

**Independence condition (I).** The office's two required predicates $\mathrm{rec}(O)$ and $\mathrm{ind}(O)$ are *negation-independent*: there is no closure rule in $\mathcal{S}_{\mathrm{op}}$ whose antecedent reads a negative witness on one predicate ($v = \mathbf{f}$ or $v = \top$) and whose consequent writes to the other predicate.
Equivalently, the negative-coordinate interaction between the two fibers is trivial.

When condition (I) holds, the bilattice settling decomposes as a *product* over the positive and negative coordinates:

$$\mathcal{F}^{\mathrm{off}}_\mathrm{bil} \;\cong\; \mathcal{F}^{\mathrm{off}+} \times \mathcal{F}^{\mathrm{off}-}$$

where $\mathcal{F}^{\mathrm{off}+}$ is the positive-coordinate sheaf (the Heyting-presheaf model) and $\mathcal{F}^{\mathrm{off}-}$ is the negative-coordinate sheaf (tracking falsity witnesses).
The restriction $\pi^+$ is then the projection onto the first factor, which is exact for product sheaves.
The Künneth formula gives:

$$H^n_{\mathrm{bil}} \;\cong\; H^n_{\mathrm{HA}} \;\oplus\; H^n_{\mathrm{neg}}$$

When additionally $\mathcal{F}^{\mathrm{off}-}$ is acyclic (no higher cohomology in the negative coordinate, which holds when no negative witnesses are ever asserted — the default for a functioning office with no disputed incumbency), $H^n_{\mathrm{neg}} = 0$ for $n > 0$, and:

$$H^n_{\mathrm{bil}} \;\cong\; H^n_{\mathrm{HA}} \quad \text{for } n \geq 1$$

**Conclusion under condition (I) and acyclicity of $\mathcal{F}^{\mathrm{off}-}$:** the cohomologies match.
The office text's nuclear-doctrine theorems (shadow classes, delegation propositions) carry over to the predicated-work program via the cohomological equivalence.

### What breaks when (I) fails

If condition (I) fails — some closure rule uses negative-coordinate information from one predicate to influence the other — the decomposition fails and the Künneth formula does not apply directly.
The two cohomologies may differ:

- In the Heyting-presheaf model, which only tracks positive witnesses, a negative-coordinate interaction is invisible.
  The HA cohomology sees only the positive-coordinate sheaf.
- In the bilattice-substrate model, the negative-coordinate interaction produces additional closed-cell patterns, which contribute to $\mathcal{F}^{\mathrm{off}-}$ and hence to $H^n_{\mathrm{bil}}$.

When (I) fails, $H^n_{\mathrm{bil}}$ may be *strictly larger* than $H^n_{\mathrm{HA}}$: the bilattice setting detects cohomological classes (coming from disputed or negated incumbency patterns) that the Heyting-presheaf setting cannot see.

This is a substantive finding: formalisms that agree at the structural-data level (the office-formalism-equivalence translation table) can diverge cohomologically when negative-coordinate interactions are present.
The bilattice-substrate is the *finer* cohomological instrument: it distinguishes cases that the HA presheaf collapses.

### Operational instances of condition (I)

Condition (I) holds for *standard* offices: offices where incumbency is purely cumulative (recognition and induction accumulate positive witnesses) and where contested incumbency ($\top$ states) are handled by adjudication rather than by cross-predicate negative inference.

Condition (I) may fail for *contested offices* where explicit revocation of recognition triggers explicit revocation of induction (e.g., a rule that says "if recognition is explicitly denied, induction is automatically invalidated").
Such a rule reads a negative recognition witness and writes a negative induction witness — a cross-predicate negative interaction, violating (I).

The predicated-governance's [revocation](../morphisms/revocation.md) morphism is precisely the operation that can violate (I): revocation removes a jural relation by asserting $\mathbf{f}$ on its cells.
If revocation of recognition cascades to revocation of induction via a closure rule, condition (I) fails for that office.

## Summary of findings

| Condition | Cohomological outcome |
|---|---|
| (I) holds + $\mathcal{F}^{\mathrm{off}-}$ acyclic | $H^n_{\mathrm{bil}} \cong H^n_{\mathrm{HA}}$ for all $n \geq 1$ |
| (I) holds + $\mathcal{F}^{\mathrm{off}-}$ non-acyclic | $H^n_{\mathrm{bil}} = H^n_{\mathrm{HA}} \oplus H^n_{\mathrm{neg}}$ (additive correction) |
| (I) fails | $H^n_{\mathrm{bil}}$ may be strictly larger than $H^n_{\mathrm{HA}}$; extension class determined by the cross-predicate interaction |

For typical office structures in the predicated-governance subtheory — where incumbency is positively accumulated and contested incumbency is handled by adjudication (a repair condition, not a cross-predicate rule) — condition (I) and acyclicity of $\mathcal{F}^{\mathrm{off}-}$ both hold.
In this typical case, the two formalisms are cohomologically equivalent, and the office text's nuclear-doctrine analysis carries over intact.

## What remains open

The Künneth formula argument above assumes the settling site's topology is product-compatible — that the covering sieves on the bilattice site factor over the positive and negative coordinates.
Verifying this requires checking that the predication-categories' [Grothendieck topology](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling-category.md) on the bilattice site restricts correctly to the product of Grothendieck topologies on the two coordinate sites.
This is a routine topos-theoretic verification but has not been written out explicitly in the math program.
