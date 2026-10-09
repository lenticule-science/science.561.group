---
type: definition
class: substrate-entity
status: draft
symbol: O
depends-on: [operations-base, jural-relation, predication-fiber-algebra, settling-quiescence]
realizes: [office]
---

# Office as double settlement

The mathematical realization of an [office](../../../../../../../../../../../../library/theories/humanities/theories/sociology/theories/work/terms/office.md), aligning with the [formal structure of office](../../../../../../../../../../../../library/theories/humanities/theories/sociology/theories/work/texts/formal-structure-of-office.md) text in the work vocabulary. An office is a substrate entity $O \in E_{\mathrm{op}}$ with two designated *required predicates* whose joint affirming settlement on a candidate agent constitutes incumbency.

## Data

An office $O$ carries the following structural cells:

- $\langle O, \texttt{normative-structure}, P\rangle$ at $\mathbf{t}$ — references the office's normative content $P$ (the *body politic*; structural, persistent across histories).
- $\langle O, \texttt{action-domain}, A_O\rangle$ at $\mathbf{t}$ — the set of actions the office governs.
- $\langle O, \texttt{deontic-profile-action}, a_i\rangle$ at $\mathbf{t}$ for each $a_i \in A_O$ — and for each $a_i$, a [jural relation](jural-relation.md) entity $R_i$ with $\langle R_i, \texttt{kind}, k_i\rangle$ where $k_i \in \{\texttt{power}, \texttt{duty}, \texttt{privilege}, \texttt{immunity}\}$, $\langle R_i, \texttt{active-holder}, O\rangle$ (the office, not any specific incumbent), $\langle R_i, \texttt{scope-action}, a_i\rangle$.

The deontic profile $D_O: A_O \to \{\texttt{power}, \texttt{duty}, \texttt{privilege}, \texttt{immunity}\}$ is realized as the family of jural-relation entities attached to the office, with the office in the active-holder position.

## The two required predicates

Per the [office text](../../../../../../../../../../../../library/theories/humanities/theories/sociology/theories/work/texts/formal-structure-of-office.md), incumbency requires *two* required predicates to settle affirmingly on a candidate $\iota$:

- **Recognition predicate** $\mathrm{rec}(O)$: the cell $\langle \iota, \texttt{recognized-as-incumbent-of}, O\rangle$. Settles when accumulated witnesses (status-function declarations, formal acknowledgments) recognize $\iota$ as legitimately holding $O$. This is the *honor* axis — backward, history-sensitive.
- **Induction predicate** $\mathrm{ind}(O)$: the cell $\langle \iota, \texttt{inducted-into}, O\rangle$. Settles when the candidate has taken on forward obligation — the *munus* axis. Forward-stable: the candidate has committed to executing the office's duties.

Both cells live in their respective predicate fibers in $\mathbf{2}^\bowtie$. Each takes values in $\mathbf{FOUR}$ per the [evidence](../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/evidence.md) reading.

## Incumbency states

Per the Roman *munus / honor / dignitas* trinity, the candidate's joint state on the two required predicates is:

| $v(\mathrm{rec}(O), \iota)$ | $v(\mathrm{ind}(O), \iota)$ | State |
|---|---|---|
| $\bot$ | $\bot$ | **Vacant** — no relation; $\iota$ is not a candidate. |
| $\bot$ | $\mathbf{t}$ | ***Munus***-only — forward obligation in place, no accumulated recognition. The interrex case. |
| $\mathbf{t}$ | $\bot$ | Recognition-only — recognized as legitimate occupant but no forward obligation yet stabilized. Rare but possible (e.g., the period between election and inauguration). |
| $\mathbf{t}$ | $\mathbf{t}$ | ***Dignitas*** — full incumbency, doubly settled. |
| any | $\mathbf{f}$ | Forward obligation explicitly denied — failed induction. |
| $\mathbf{f}$ | any | Recognition explicitly denied — illegitimate. |
| $\top$ in either | — | Repair condition. |

## Persistence and *dignitas non moritur*

The office's structural data ($P$, $A_O$, $D_O$) is itself substrate content — predications carrying $\mathbf{t}$ values across the entire settling. They are not destroyed when the incumbency cells of a particular candidate $\iota$ change. By [settling-monotonicity](../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), the office's structural cells only accumulate — the normative structure persists. Vacancy of the office at history $\tau$ means that no candidate $\iota$ has both required predicates at $\mathbf{t}$ at $\tau$; the office's structural cells are at $\mathbf{t}$ regardless.

## Connection to capability fiber bundle

The office has a [capability section](../../../objects/capability-fiber-bundle.md) $\sigma_O: c \mapsto v(\langle O, \texttt{provides-capability}, c\rangle)$. When a candidate $\iota$ reaches dignitas (both required predicates at $\mathbf{t}$), the [capability propagation rule](../../../objects/operations-settling.md) fires: $\iota$'s capability section is updated by joining $\sigma_O$ pointwise, transferring the office's powers to the incumbent.

## Connection to the formal-structure-of-office text

This object is a bilattice-substrate-native realization of the office quadruple $(P, A, D_O, I^+)$. The text uses Heyting-algebra fiber and a presheaf $H: T^{\mathrm{op}} \to \mathbf{HA}$; this object uses bilattice-valued predication fiber algebras and the [predication settling](../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md). The two formalisms are equivalent presentations of the same structure — see [office-formalism-equivalence](../theorems/office-formalism-equivalence.md) for the translation table.
