---
type: morphism
class: priority-list-activation
status: draft
symbol: "\\mathcal{S}"
depends-on: [office-as-double-settlement, incumbent, installation]
realizes: [hohfeldian-succession]
---

# Succession

The Hohfeldian operation by which an office's incumbency transfers to the next-priority candidate when the current incumbent becomes unavailable. Per the library's [hohfeldian-succession term](../../../../../../governance-services-section/services/hohfeldian-services-section/content/glossary/terms/hohfeldian-succession.md), a succession is a pair $(O, L)$ — an office and a priority-ordered list of candidate holders — together with an activation predicate that fires when the primary holder is unavailable.

## Definition

Given:

- An [office](../objects/office-as-double-settlement.md) $O$ with current incumbent $\mathrm{Inc}_0 = (O, \tau, h_0, \iota_0)$.
- A *priority list* $L = (h_0, h_1, \ldots, h_n) \in E_{\mathrm{op}}^{n+1}$ — a totally ordered list of candidate holders. Substrate-algebraic encoding: cells $\langle O, \texttt{succession-priority-}i, h_i\rangle = \mathbf{t}$ for $i = 0, \ldots, n$.
- An *activation predicate* $P$ — a closure-rule antecedent on cells determining whether the current holder $h_{i^*}$ remains capable of bearing $\iota$. Examples: $\langle h_{i^*}, \texttt{available}, \tau\rangle = \mathbf{f}$, $\langle h_{i^*}, \texttt{relieved-at}, \tau\rangle = \mathbf{t}$, $\langle h_{i^*}, \texttt{deceased-at}, \tau\rangle = \mathbf{t}$.
- An *availability predicate* $A_i$ for each $h_i$ — settled at $\mathbf{t}$ when $h_i$ is present, eligible, and capable.

Succession is the closure rule that fires when $P$ activates on the current holder and produces an immediate transition to the minimum-priority-index available candidate.

## The selection rule

The closure rule encoding succession is:

$$P(\mathrm{Inc}_{i^*}) \;\wedge\; \bigwedge_{j < i^* + 1}(\neg A_j \,\vee\, P(h_j)) \;\wedge\; A_{i^* + 1} \;\Longrightarrow\; \langle \iota_{i^* + 1}, \texttt{instituted-into}, O\rangle = \mathbf{t} \,\wedge\, \langle \iota_{i^* + 1}, \texttt{inducted-into}, O\rangle = \mathbf{t}$$

— when activation fires on the current holder, no earlier-priority candidate is available, and the next-priority candidate is available, the next candidate's incumbency proposition reaches affirming joint settlement immediately.

## Immediate assumption

Succession differs from ordinary [installation](installation.md) in that the joint settlement of both required predicates occurs in a single increment rather than the installation's two-stage structure. The substrate-algebraic content of "immediate assumption" (US Navy Reg. Art. 0801; Presidential Succession Act 3 U.S.C.) is that the closure rule asserts both `instituted-into` and `inducted-into` cells at $\mathbf{t}$ jointly, without waiting for separate witnesses or ceremonies.

This is a structural commitment the work vocabulary names explicitly: emergency succession does not wait for normal investiture procedures. Substrate-algebraically, it is encoded by *making the succession closure rule's consequent the joint settlement*, rather than separating into two rules.

## Coverage and chain integrity

The library's two structural invariants for a valid succession:

**Coverage.** $L$ covers all activation scenarios — for every reachable configuration of the operations settling, at least one $h_i$ has $A_i = \mathbf{t}$. As a substrate condition: a closure rule fires a *vacancy-warning* if $P$ activates on $h_0$ and *no* candidate satisfies $A_i$. Vacancy is a substrate state with $\langle O, \texttt{vacant-at}, \tau\rangle = \mathbf{t}$ — the office's structural cells persist (per *dignitas non moritur*), but no incumbency holds.

**Chain integrity.** If $h_{i^*}$ also becomes unavailable during the same activation event, the succession falls to $h_{i^*+1}$. Substrate-algebraically: the succession closure rule iterates as long as $P$ fires on each newly-active candidate. By [closure 2-monad's lax idempotence](../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md), the iteration reaches a fixed point — either at the first active holder or at vacancy.

## The succession list as substrate data

The priority list $L$ is itself substrate content: the cells $\langle O, \texttt{succession-priority-}i, h_i\rangle$ are settled at $\mathbf{t}$ when $L$ is established (typically by a charter rule or institutional constitution). The list is therefore *modifiable* via [novation](./novation.md) — extinguishing old priority cells and asserting new ones. But the list's structure persists across stages until explicitly modified; succession at stage $\tau$ reads the list as it was settled at $\tau$.

This makes the succession list itself a *first-class normative object* — a structure on $O$ that can be amended, contested, or restructured by the same Hohfeldian operations that apply to other normative content.

## Distinction from delegation

Succession transfers *full incumbency* of $O$, not a delegated-power sub-grant. The successor $h_{i^*+1}$ acquires the office's complete deontic profile — the powers, duties, privileges, immunities of $O$ — not a bounded grant from the prior holder. This distinguishes succession from emergency [delegation](./delegation.md), which would create a derived $R^B$ with restricted scope.

## Connection to charter

The charter typically declares the succession list of its founding offices. The [charter-as-closure-system](../theorems/charter-as-closure-system.md) thus contains the succession's selection rule as a charter rule. Modifying the succession list amends the charter (or, at the lower-tier rule fragments, modifies a guideline or preference in the charter's hierarchy).
