---
type: definition
class: substrate-entity
status: draft
depends-on: [incumbent, office-as-double-settlement]
realizes: [officer]
---

# Officer

The natural-person view of the [incumbent](incumbent.md) — the substrate entity $a$ named in the incumbency quadruple $\mathrm{Inc} = (O, \tau^*, a, \iota)$ as the current bearer of office $O$.
Per the library's [officer term](../../../../../../../../../../../../library/theories/humanities/theories/sociology/theories/work/theories/governance/terms/officer.md), the officer is the *body natural*: the human or AI agent whose mortal, particular, stage-indexed existence currently corporealizes the office's body politic.

## Data

An officer for office $O$ at stage $\tau^*$ is the entity $a \in E_{\mathrm{op}}$ satisfying:

- $\langle \iota, \texttt{occupant}, a\rangle = \mathbf{t}$ for some incumbency proposition $\iota$
- $\langle \iota, \texttt{instituted-into}, O\rangle = \mathbf{t}$ — the institution predicate is settled
- $\langle \iota, \texttt{inducted-into}, O\rangle = \mathbf{t}$ — the induction predicate is settled

Querying *who is the officer of $O$ at $\tau^*$* is the substrate operation: find the unique $a$ such that some $\iota$ has all three cells at $\mathbf{t}$.

## Three conditions for officership

Per the library's officer text:

1. **The office exists.** $O$'s structural cells are settled at $\mathbf{t}$ — normative-structure, action-domain, deontic-profile-actions.
2. **Investiture has occurred.** A felicitous [installation](../morphisms/installation.md) increment was admitted, asserting the recognition predicate; subsequently the induction predicate also reached $\mathbf{t}$.
3. **The binding is current.** No witness has retired the incumbency: $\langle \iota, \texttt{relieved-by}, A\rangle$ is not at $\mathbf{t}$ for any $A$, and no [revocation](../morphisms/revocation.md) of recognition has fired.

## Officer vs. role-bearer

A *role-bearer* fills a role by capability matching — the substrate cells $\langle a, \texttt{provides-capability}, c\rangle = \mathbf{t}$ for the role's required capabilities.
No formal investiture is required; capability matching is sufficient.

An *officer* is bound to an office by a constitutive normative event: an installation increment that creates jural relations not previously present.
The substrate-algebraic distinction is the *kind of cells* settled:

- Role-bearer: capability cells (action-domain coverage)
- Officer: incumbency cells (institution + induction on the office's required predicates)

A role-bearer who lacks the office's incumbency is doing the office's *work* without holding its *authority*.
The substrate's [dispatch morphism](../../../morphisms/dispatch.md) checks both: capability for execution, and incumbency-derived power for authority over the dispatch.

## The officer's limitation

Per the library's *salva rerum substantia* (usufruct condition): the officer enjoys the office's authorities but cannot alter its normative structure.
Substrate-algebraically: the officer's increments can affect cells *governed by* $O$'s deontic profile, but they cannot alter the office's structural cells (`normative-structure`, `action-domain`, `deontic-profile-actions`).
Those cells are *outside the officer's write scope* — the closure rules that admit officer-issued increments check that the increment's target cells are not among $O$'s structural cells.

An officer who attempts to modify $O$'s structural cells produces a charter-violation witness — the *Claims Require Construction* or *No Invisible Labor* rules fire, depending on which structural commitment was attacked.

## Body politic, body natural

The officer is the body natural; $O$ is the body politic.
The substrate-algebraic content of the body natural / body politic distinction:

- $O$'s structural cells persist across all stages (by [settling-monotonicity](../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md)).
  They do not depend on which $a$ holds $\iota$.
- $a$'s existence as an entity is independent of any office.
  An agent exists in $E_{\mathrm{op}}$ regardless of incumbency.
  Vacating the office reduces $a$'s deontic profile to its individual cells (without the office's deontic-profile-action transfers); it does not delete $a$.
- *Dignitas non moritur*: when $a$ vacates (relief, retirement, death, removal), $O$'s structural cells are unchanged.
  Whichever $a'$ subsequently reaches dignitas inherits the office's deontic profile.
  The body politic passes; the body natural does not.

## Connection to personnel

In the operational vocabulary, *personnel* are the natural persons (and AI agents) recorded in `operations/.../personnel/`.
Officers are personnel who currently hold office — a sub-population.
The substrate cell $\langle a, \texttt{is-personnel-of}, S\rangle = \mathbf{t}$ records ship-membership; the additional cells described above record office-holding.
