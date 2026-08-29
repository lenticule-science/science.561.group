---
type: definition
class: sub-base
status: draft
symbol: "\\mathcal{J}"
depends-on: [operations-base, jural-relation, normative-system]
realizes: [jurisdiction]
---

# Jurisdiction

The mathematical realization of [jurisdiction](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/governance/theories/jurisdiction/terms/jurisdiction.md): the formal scope within which an authority's normative powers are operative.
Per the library's four-tuple definition, a jurisdiction $\mathcal{J} = (A, T_J, H_J, V)$ specifies an authority, a sub-site of histories, a sub-fiber of cells, and a validity condition.
In predicated-governance terms, jurisdiction is a *sub-base* of the [operations base](../../../objects/operations-base.md) restricted to a specific authority's scope.

## Data

A jurisdiction $\mathcal{J}$ instantiated on the operations base is a quadruple

$$\mathcal{J} \;=\; (A,\; T_J,\; \mathcal{C}_J,\; V)$$

where:

- $A$ — the *authority*: a substrate entity (typically an office or an agent in office) whose [jural-relations](jural-relation.md) of `kind: power` are operative within the jurisdiction.
  The authority's powers exist as cells $\langle R^P, \texttt{potential-holder}, A\rangle = \mathbf{t}$ for various jural-relations $R^P$; the jurisdiction names the scope where those cells are *operative*.
- $T_J \subseteq \lambda$ — the *settling-stage sub-range*: the ordinals at which the jurisdiction's closure rules fire.
  Outside $T_J$, the authority's powers do not propagate even if they exist as cells.
- $\mathcal{C}_J \subseteq \mathcal{C}_{\mathrm{op}}$ — the *predicate sub-category*: the work predicates the jurisdiction governs.
  Subject-matter jurisdiction is encoded here — a maritime court has jurisdiction over admiralty predicates but not criminal-law predicates.
- $V$ — the *validity condition*: a closure-rule antecedent on cells determining whether a candidate act falls within $\mathcal{J}$.
  Implemented as a closure rule that fires when an act is attempted: if $V$ matches, the act is admitted under $\mathcal{J}$; otherwise it produces an *ultra vires* failure-witness.

## Sub-topos / sub-base structure

Per the library's "jurisdiction as sub-topos" reading, $\mathcal{J}$ corresponds to a sub-base $(B_{\mathrm{op}})|_{\mathcal{J}} = (\mathbf{2}, \mathcal{C}_J, E_J, |T_J|)$ with $E_J \subseteq E_{\mathrm{op}}$ comprising entities relevant to the jurisdiction.
The inclusion is a structural commitment: predication settlings over $(B_{\mathrm{op}})|_{\mathcal{J}}$ embed into settlings over $B_{\mathrm{op}}$.

The bilattice-substrate counterpart of the geometric morphism $\mathbf{Sh}(T_J) \hookrightarrow \mathbf{Sh}(T)$ is the embedding of the jurisdiction's predication fiber algebras $A_p|_{T_J}$ as sub-algebras of the global $A_p$.
Within the sub-base, $A$'s closure rules are operative; outside, they are not.

## Three jurisdiction types

Per the library's typology, three orthogonal axes of restriction:

**Personal jurisdiction.** $T_J$ is the set of stages at which a particular agent is present in or consented to the authority's domain.
As substrate condition: a closure rule gates jurisdiction-firing on $\langle a, \texttt{present-in-domain-of}, A\rangle = \mathbf{t}$ at the stage in question.
Without personal jurisdiction, the authority's acts on $a$ do not propagate.

**Subject-matter jurisdiction.** $\mathcal{C}_J$ restricts the predicates the authority can settle.
As substrate condition: closure rules check the predicate-category membership of any cell the authority's acts target.
An act on a cell with predicate outside $\mathcal{C}_J$ produces a failure-witness.

**Territorial / temporal jurisdiction.** $T_J$ is a spatial-temporal range.
As substrate condition: $T_J$'s ordinal range is checked at the stage of any candidate act.

## Concurrent jurisdiction

When two jurisdictions $\mathcal{J}_1, \mathcal{J}_2$ overlap — i.e., $T_{J_1} \cap T_{J_2} \neq \emptyset$, $\mathcal{C}_{J_1} \cap \mathcal{C}_{J_2} \neq \emptyset$ — both authorities' powers are operative on the overlapping cells.
The substrate-algebraic content: closure rules from both $\mathcal{S}_{J_1}$ and $\mathcal{S}_{J_2}$ fire on shared cells.
When their consequents conflict, the cell goes to $\top$ — substrate-detected concurrent-jurisdiction conflict.

Resolution requires conflict rules (lex posterior, lex superior, lex specialis) — these are charter-tier rules in the [charter-as-closure-system](../theorems/charter-as-closure-system.md), specifying which authority prevails on each predicate class.

## Ultra vires

An act that fails $V$ — outside the jurisdiction's scope — does not propagate toward settled state.
Substrate-algebraically: the closure rules that admit the authority's increments check $V$ first.
An act whose target cell is outside $\mathcal{C}_J$, or at a stage outside $T_J$, or fails $V$ for any reason, produces:

- A failure-witness $\langle \texttt{ultra-vires-attempt}, \texttt{by}, A\rangle = \mathbf{t}$
- *No* downstream effect on the substrate's settled state

The witness is part of the audit trail; the would-be-settled cell remains at $\bot$ (or whatever value it had pre-attempt).

## Jurisdiction and judgment

Per the library text, an officer's *zone* $Z$ is the jurisdiction restricted to the officer's discretionary scope:

$$Z \;=\; \mathcal{J}|_B \;=\; (B,\; T_J \cap T_B,\; \mathcal{C}_J \cap \mathcal{C}_B,\; V|_{T_B \times \mathcal{C}_B})$$

where $B$ is the [officer](officer.md).
An act within $Z$ is *intra vires* — within both the authority's full jurisdiction and the officer's personal scope.
An act within $\mathcal{J}$ but outside $Z$ is *insubordinate* (valid as the authority's act, but the officer exceeded their zone).
An act outside $\mathcal{J}$ entirely is *ultra vires* (failure-witness, no settled effect).

## CALM and coordination-free jurisdiction queries

The validity condition $V$ of a jurisdiction $\mathcal{J}$ fires as a closure-rule antecedent check.
Once a cell $c$ is confirmed within $\mathcal{J}$ — the cells $\langle c, \texttt{within-jurisdiction-of}, \mathcal{J}\rangle = \mathbf{t}$ and $\langle c, \texttt{predicate-in}, \mathcal{C}_J\rangle = \mathbf{t}$ are settled — those cells are $\leq_k$-monotone.
By the [predication-settling CALM corollary](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-calm-corollary.md):

- The positive jurisdiction query "is act $X$ within $\mathcal{J}$?" is coordination-free: any replica with a local snapshot of the jurisdiction-scope cells can confirm positively without round-tripping to a central authority.
- The ultra-vires failure determination ("is this act *outside* $\mathcal{J}$?") requires coordination — confirming absence of jurisdiction requires ruling out all positive jurisdiction claims.

This matches real governance practice: it is easy to confirm that a specific act is clearly within an authority's jurisdiction (standard case); contested jurisdiction (where multiple jurisdictions claim the same act, or where the boundary is unclear) requires coordination to resolve.

For concurrent-jurisdiction conflicts (two authorities' $\mathcal{J}_1, \mathcal{J}_2$ overlapping): the positive queries "is $X \in \mathcal{J}_1$?" and "is $X \in \mathcal{J}_2$?" are both coordination-free; the *resolution* of which jurisdiction prevails on $X$ (when their rules conflict) requires coordination — the lex-superior/lex-posterior/lex-specialis rule must be settled, which is not monotone.

## Temporal BC for delegation scope chains

In the [temporal 2-category](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/temporal-2-category.md) $\mathbf{T}(\mathcal{C}_\mathcal{P}, \lambda)$, each delegation creates a 1-cell that maps a principal's jurisdiction 0-cell to a derived jurisdiction 0-cell:

$$\mathrm{del}(A \to B) : (\tau_{\mathrm{del}}, \mathcal{J}_A) \to (\tau_{\mathrm{del}+}, \mathcal{J}_B)$$

where $\mathcal{J}_B \hookrightarrow \mathcal{J}_A$ is the sub-base inclusion.
The delegation chain $A \to B \to C$ (sub-delegation) produces the composite 1-cell $\mathrm{del}(B \to C) \circ \mathrm{del}(A \to B)$, corresponding to the jurisdiction restriction $\mathcal{J}_C \hookrightarrow \mathcal{J}_B \hookrightarrow \mathcal{J}_A$.

The [temporal Beck-Chevalley condition](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/temporal-beck-chevalley.md) holds for this chain iff the fiber of cells at each jurisdiction level commutes with the restriction morphism.
BC holds when delegation is well-behaved (each delegate's jurisdiction is a genuine sub-base restriction); BC fails when a delegate's authority scope is *enlarged* relative to the principal's — the substrate-algebraic content of *delegatus non potest delegare*'s violation.
A failed-BC delegation chain produces a non-invertible 2-cell at the pseudo-pullback, which is the temporal-2-category signature of an ultra-vires sub-delegation.

## Jurisdiction and delegation

Per the library, [delegation](../morphisms/delegation.md) from $A$ to $B$ creates a derived jurisdiction $\mathcal{J}_B = \mathcal{J}|_{D_{\mathrm{sub}}}$ — the principal's jurisdiction restricted to the delegated scope.
As substrate condition:

- $T_{J_B} \subseteq T_J$ (no temporal extension)
- $\mathcal{C}_{J_B} \subseteq \mathcal{C}_J$ (no subject-matter expansion)
- $V_{J_B}$ is at least as restrictive as $V_J$

These are the [presheaf functoriality](../theorems/office-formalism-equivalence.md) constraints from the formal-structure-of-delegation text rendered substrate-algebraically: the delegate's jurisdiction is structurally bounded by the principal's.
Sub-delegation cannot exceed the original principal's scope (*delegatus non potest delegare*).
In temporal-2-category terms: the chain of restriction 1-cells satisfies temporal BC iff no restriction is expanded — BC is the structural invariant that encodes the *delegatus* principle.
