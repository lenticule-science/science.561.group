---
type: theorem
status: draft
depends-on: [operations-settling, work-symmetry-group]
realizes: [visible-automorphism-quotient, invisible-automorphism-subgroup, visible-automorphism-sources]
---

# Restructure as visible automorphism

Organizational restructurings of a working community — mergers, name changes, role renaming, reorgs, reporting-line changes, persona rotations, agent re-identification — fall into two formally distinct strata determined by their action on the [operations settling](../objects/operations-settling.md) $v^{\mathrm{op}}$:

- **Cosmetic restructurings** lie in the [invisible automorphism subgroup](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/invisible-automorphism-subgroup.md) $N(v^{\mathrm{op}})$ — they fix the [settling-associated sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md) $\mathcal{F}^{\mathrm{op}}_U$ and contribute nothing to the [visible automorphism quotient](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/visible-automorphism-quotient.md) $\mathrm{Aut}^{\mathrm{vis}}(v^{\mathrm{op}})$.
- **Substantive restructurings** are non-trivial in $\mathrm{Aut}^{\mathrm{vis}}(v^{\mathrm{op}})$ — they act non-trivially on the settling-associated sheaf, and therefore on every cohomological invariant of the operations settling.

This is not a definition or stipulation — it is forced by the structure of automorphism sources for predication settlings.
By [visible-automorphism-sources](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/visible-automorphism-sources.md), an automorphism contributes to the visible quotient iff it both stabilizes $v^{\mathrm{op}}$ *and* permutes newly-designated cells non-trivially.

## The four sources, instantiated for work

The [visible-automorphism-sources](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/visible-automorphism-sources.md) theorem identifies four sources of automorphisms of a settling.
For an operations settling $v^{\mathrm{op}}$ over $B_{\mathrm{op}}$, these become:

**1.
Bilattice-negation gauge** $\sim$.
The [internal $\mathbb{Z}/2$ gauge](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/internal-z2-gauge.md) acting on cell *values*.
Operational instance: changing the sign convention of the event log (positive witness = $\mathbf{t}$ vs. positive witness = $\mathbf{f}$).
Always cosmetic — gauge fixes cell positions and so always lies in $N(v^{\mathrm{op}})$.

**2.
Fiber-swap symmetry** $(s, o) \mapsto (o, s)$.
Operational instance: in symmetric jural relations (mutual obligations, paired correlatives where the role of subject and object is exchangeable), swapping subject and object across all cells.
Cosmetic when the operational state is fiber-swap-symmetric and the newly-designated cells lie on the diagonal $\{(e, e)\}$; substantive when off-diagonal $\mathbb{Z}/2$-symmetric pairs $\{(s, o), (o, s)\}$ with $s \neq o$ are present.

**3.
Entity-permutation $\mathrm{Sym}(E_{\mathrm{op}})$-stabilizer.** Operational instance: relabeling agents, offices, or roles — the renaming group acts by $(s, o) \mapsto (\pi(s), \pi(o))$ for $\pi \in \mathrm{Sym}(E_{\mathrm{op}})$.
The stabilizer subgroup of $v^{\mathrm{op}}$ — those $\pi$ that leave the settling unchanged — is the **automorphism group of the operational state under relabeling**.
This is the source of the strongest operational classification:

- A renaming $\pi$ stabilizes $v^{\mathrm{op}}$ iff every cell satisfies $v^{\mathrm{op}}_\tau(p)(s, o) = v^{\mathrm{op}}_\tau(p)(\pi(s), \pi(o))$ for every $\tau$ and predicate $p$.
  That is: applying $\pi$ permutes the labels but reproduces the same operational record cell-for-cell.
- Such a $\pi$ is **cosmetic** iff it fixes every newly-designated cell — equivalently, iff $\pi$ permutes only entities all of whose cells are at $\bot$ (entities about which nothing has been recorded).
- Such a $\pi$ is **substantive** iff it permutes at least one entity that has appeared in a newly-designated cell.

**4.
Predicate-automorphism stabilizer.** Operational instance: relabeling the predicates themselves — `assigned-to` $\to$ `responsible-for`, `holds-power-over` $\to$ `is-empowered-against`, etc. Operational systems with explicit redundant naming for the same predicate sit in the cosmetic stratum here.

## Statement

For an operations settling $v^{\mathrm{op}}$ on $B_{\mathrm{op}}$, a **candidate restructuring** is a triple $(\pi_E, \pi_\Pi, g)$ — a permutation $\pi_E$ of $E_{\mathrm{op}}$, a generator-class-preserving endofunctor $\pi_\Pi$ of $\mathcal{C}_{\mathrm{op}}$, and an element $g \in K_4$ from the [work symmetry group](../objects/work-symmetry-group.md) — acting on $v^{\mathrm{op}}$ by $((\pi_E, \pi_\Pi)$ relabeling cell positions, $g$ acting cellwise on values$)$ stagewise.
The candidate is an **automorphism** when it stabilizes $v^{\mathrm{op}}$, i.e., lies in $\mathrm{Aut}^\simeq(v^{\mathrm{op}})$.
An automorphism is **cosmetic** iff it lies in the invisible subgroup $N(v^{\mathrm{op}})$, **substantive** iff its image in $\mathrm{Aut}^{\mathrm{vis}}(v^{\mathrm{op}})$ is non-trivial.

**Theorem.** *Let $\phi = (\pi_E, \pi_\Pi, g) \in \mathrm{Aut}^\simeq(v^{\mathrm{op}})$.
Then $\phi$ is cosmetic iff $(\pi_E, \pi_\Pi)$ fixes every newly-designated cell position.
Equivalently, $\phi$ is substantive iff $(\pi_E, \pi_\Pi)$ permutes at least one cell position that has been touched by an increment at some stage of $v^{\mathrm{op}}$.*

The gauge component $g$ contributes nothing to the visible/invisible distinction: when $g \in \langle \sim \rangle$ stabilizes $v^{\mathrm{op}}$ (which requires $v^{\mathrm{op}}$ to be cellwise $\sim$-invariant — only the $\bot, \top$ values are $\sim$-fixed), it always lies in $N(v^{\mathrm{op}})$ because gauge fixes cell positions; the conflation generator $-$ does not preserve $\leq_k$ at all and so cannot stabilize a generic operations settling.

## Sketch

By [visible-automorphism-sources](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/visible-automorphism-sources.md), an automorphism is in $N(v^{\mathrm{op}})$ iff it acts trivially on the settling-associated sheaf $\mathcal{F}^{\mathrm{op}}_U$ — equivalently, iff it fixes every newly-designated cell position.
The gauge component, when it stabilizes, only acts on values and is always trivial on $\mathcal{F}^{\mathrm{op}}_U$.
The relabeling component contributes to $\mathcal{F}^{\mathrm{op}}_U$ via its action on cell positions and is trivial iff it fixes every cell position that has been touched by an increment.
Combining: $\phi$ is cosmetic iff its relabeling component fixes every newly-designated cell position. $\square$

## Existence remarks

The theorem is conditioned on $\phi$ being an automorphism in the first place — most candidate restructurings fail this condition.
Stabilization requires:

- The relabeling $(\pi_E, \pi_\Pi)$ reproduces the operations valuation: $v^{\mathrm{op}}_\tau \circ (\pi_E \times \pi_E) = g \cdot v^{\mathrm{op}}_\tau$ stagewise.
- The gauge component $g$ either is identity or fixes $v^{\mathrm{op}}$ cellwise.
  Since $\sim$ swaps $\mathbf{t} \leftrightarrow \mathbf{f}$, the only operations settlings stabilized by $g = \sim$ are those whose cells take values only in $\{\bot, \top\}$ — settlings with no non-contradicted positive or negative evidence.
  This is operationally exotic.

So in practice the gauge stabilizer is $\{1\}$ and the automorphism group of an operations settling is essentially the relabeling stabilizer.
The theorem then says the visible/invisible split among those automorphisms is determined entirely by whether the relabeling fixes newly-designated cell positions.

## Operational content

The theorem makes three substantive operational claims:

**(a) The naming gauge is free.** Conventional choices about how to spell the operations log — sign convention, predicate name, agent identifier choice for never-recorded agents — never affect any cohomological invariant.
A merger that only changes labels but does not consolidate previously-separate operational records is cosmetic.

**(b) Consolidating recorded entities is substantive.** Identifying two agents $A_1, A_2$ that have both appeared in newly-designated cells (each has an operational history) is a permutation $\pi_E$ that does *not* fix newly-designated cells; by the theorem, this is substantive.
This formalizes the everyday observation that "merging two real people's records is not a relabeling — it changes what the records say."

**(c) Anonymizing inactive entities is cosmetic.** Removing or renaming agents, offices, or predicates that have no operational record (no newly-designated cells anywhere) is in the invisible subgroup.
The system's regime class, $H^\bullet$ classes, and MLD-class are unchanged.
This is the substrate-algebraic reason that purging dormant accounts, retiring unused predicates, or sunsetting empty offices is structurally safe.

## Comparison: visible automorphisms as identity diagnostics

The visible automorphism quotient $\mathrm{Aut}^{\mathrm{vis}}(v^{\mathrm{op}})$ is the **group of operationally distinguishable self-symmetries** of a working community's recorded state.
Communities at [rigid moduli points](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/rigid-moduli-point.md) — $\mathrm{Aut}^{\mathrm{vis}}(v^{\mathrm{op}}) = \{1\}$ — are uniquely identifiable up to gauge: no non-trivial restructuring leaves the operational record indistinguishable.
Communities at [orbifold moduli points](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/orbifold-moduli-point.md) — $\mathrm{Aut}^{\mathrm{vis}}(v^{\mathrm{op}})$ non-trivial — admit *non-trivial substantive restructurings that nevertheless leave the operational record cell-for-cell identical*.
These are the communities where, e.g., two parallel teams have identical records: the swap is substantive (it permutes recorded entities) but stabilizes $v^{\mathrm{op}}$.

The size and structure of $\mathrm{Aut}^{\mathrm{vis}}(v^{\mathrm{op}})$ is therefore an **operational identity diagnostic**: a working community with large $\mathrm{Aut}^{\mathrm{vis}}$ has many indistinguishable internal partitions; one with trivial $\mathrm{Aut}^{\mathrm{vis}}$ is uniquely characterized by its event log.

## Caveat — settling rigidity is the typical case

For real operations settlings with a typical event log — many entities, distinct histories per entity, idiosyncratic timing of newly-designated cells — the entity-permutation stabilizer is typically trivial.
Most working communities sit at rigid moduli points; orbifold cases are the exception (perfectly symmetric paired teams, isomorphic parallel processes, deliberately mirrored structures).
The theorem's force is therefore one-directional in practice: it explains *why most reorgs are visibly substantive* (they permute entities with distinct histories) and *why a small class of restructurings — pure relabeling, anonymization, sign-flip — provably are not*.

## Where used

- [work-symmetry-group](../objects/work-symmetry-group.md) — supplies the gauge component $g$ and the constraint that only $\sim$ contributes cosmetically.
- [audit-conflation](teaching/explanations/audit-conflation.md) — explains why audit reasoning is not a cosmetic transformation: it uses the $-$ generator, which fails clause 1.
- [retrospect-via-cosettling](../morphisms/retrospect-via-cosettling.md) — uses the visible/invisible distinction to characterize which historical reconstructions preserve cohomological structure.
