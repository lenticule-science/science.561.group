---
kind: theorem
status: proved
depends-on: [step-n-substitution-rule, step-n-classifying-invariant, four-bilattice, knowledge-order, truth-order, negation]
---

# Step-n / bilattice cardinality coincidence

The *cardinalities* $n = 2, 3, 4$ at which canonical step-$n$ substitutions exist in the corpus coincide with the cardinalities of the bilattice $\mathbf{FOUR}$'s structurally-distinguished substructures (orders, non-bottom values, full values).
For $n \geq 5$, no bilattice substructure has cardinality $n$, so no cardinality coincidence is possible.

This theorem proves the *cardinality coincidence* — a necessary condition for any canonical structural correspondence.
The strong claim of an actual structural correspondence (alphabet → bilattice mapping respected by substitution dynamics) is open and stated as a precise question below.

## Statement

**Theorem (cardinality coincidence).** *Let $\mathbf{FOUR}$ be the four-element bilattice.
Then:*

- *$\mathbf{FOUR}$ has exactly $2$ partial orders ($\leq_k, \leq_t$), exactly $3$ non-bottom elements ($\{\mathbf{t}, \mathbf{f}, \top\}$), and exactly $4$ elements ($\{\bot, \mathbf{t}, \mathbf{f}, \top\}$).*
- *These cardinalities $\{2, 3, 4\}$ coincide with the alphabet sizes of the corpus's three named canonical step-$n$ substitution families: Fibonacci ($n = 2$), Padovan/Tribonacci ($n = 3$), Tetranacci ($n = 4$).*
- *For any $n \geq 5$, no bilattice substructure of $\mathbf{FOUR}$ has cardinality $n$.
  So at $n \geq 5$ no alphabet-to-bilattice-substructure bijection exists.*

## Proof

The bilattice $\mathbf{FOUR}$ has carrier set $\{\mathbf{t}, \mathbf{f}, \bot, \top\}$ — four elements.
It carries two partial orders ($\leq_k$ and $\leq_t$) and the negation involution swapping $\mathbf{t}, \mathbf{f}$ and fixing $\bot, \top$.
The element $\bot$ is the unique minimum of $\leq_k$; removing it leaves $\{\mathbf{t}, \mathbf{f}, \top\}$ — three elements.

The cardinalities of these natural substructures are:

| Substructure | Cardinality |
|---|---|
| Partial orders | $2$ |
| Non-bottom elements | $3$ |
| Full element set | $4$ |

These are the only cardinalities $\geq 2$ realised by structurally-distinguished substructures.
(The two-element subsets $\{\bot, \top\}$, $\{\mathbf{t}, \mathbf{f}\}$ also have cardinality 2 — fixed-points of negation and swapped-by-negation respectively — coinciding with the cardinality-of-orders count.)

The corpus's named canonical step-$n$ substitution families have alphabet sizes:

- Fibonacci: alphabet $\{a, b\}$, size $2$.
- Padovan: alphabet $\{a, b, c\}$, size $3$.
- Tribonacci: alphabet $\{a, b, c\}$, size $3$.
- Tetranacci: alphabet $\{a, b, c, d\}$, size $4$.

Each named family's alphabet size is in $\{2, 3, 4\}$ — the bilattice substructure cardinalities.
Conversely, no named-family alphabet size is $\geq 5$.

For the boundary claim: $\mathbf{FOUR}$ has $4$ elements, so its largest substructure (in cardinality) is the full carrier set, with $4$ elements.
No substructure has cardinality $\geq 5$.
Hence at $n \geq 5$ no alphabet-to-bilattice-substructure bijection exists. $\square$

## What this proves and what it doesn't

**Proven.** The cardinality coincidence is a precise structural fact: the bilattice $\mathbf{FOUR}$'s substructures realise exactly the cardinalities $\{2, 3, 4\}$, and these match the named step-$n$ family alphabet sizes.
The cardinality boundary at $n = 4$ is sharp.

**Not proven.** A *canonical* structural correspondence — a specific alphabet-to-bilattice-element bijection $\phi : \{a_1, \ldots, a_n\} \to (\text{bilattice substructure})$ for each $n \in \{2, 3, 4\}$ such that the substitution matrix $M$ acts on $\mathbb{Z}^n$ in a way that respects the bilattice's negation, conflation, or order structure — is **not** established.
None of the named substitution rules has been shown to commute (in any precise sense) with a bilattice operation under any specific bijection $\phi$.

The cardinality coincidence is *necessary* for any canonical correspondence to exist, but it is *not sufficient*.
There are $n!$ candidate bijections at each $n$ and no structural argument distinguishing one as canonical.

## Open question: canonical structural correspondence

**Question.** *Does there exist a canonical bijection $\phi_n : \{a_1, \ldots, a_n\} \to \Sigma_n$ (where $\Sigma_n$ is a structurally-distinguished cardinality-$n$ subset of $\mathbf{FOUR}$) such that the canonical step-$n$ substitution rule's matrix $M_n$ acts on $\mathbb{Z}^n$ in a way that respects a bilattice operation (negation, conflation, or partial-order morphism) on $\Sigma_n$?*

Three more specific sub-questions:

**(a) $n = 2$.** Does the Fibonacci substitution $\sigma : a \mapsto ab, b \mapsto a$ have a "bilattice-natural" presentation?
E.g., is there a labelling of its alphabet by $\{\leq_k, \leq_t\}$ (or by some pair of bilattice elements) such that the substitution dynamics has a structural meaning in bilattice terms?

**(b) $n = 3$.** Does Padovan or Tribonacci's substitution have a labelling by $\{\mathbf{t}, \mathbf{f}, \top\}$ such that the substitution rule respects the negation involution restricted to $\{\mathbf{t}, \mathbf{f}, \top\}$ (which swaps $\mathbf{t}$ and $\mathbf{f}$ and fixes $\top$)?

**(c) $n = 4$.** Does Tetranacci's substitution have a labelling by $\{\bot, \mathbf{t}, \mathbf{f}, \top\}$ such that the substitution rule respects the full negation involution?

A negative answer at any $n$ would establish that the cardinality coincidence is genuine numerology — a structural fact about cardinalities not extending to any alphabet-bilattice morphism.
A positive answer at any $n$ would establish a real bilattice-substitution alignment at that $n$.

## A concrete positive case at $n = 2$: Thue-Morse

Among the corpus's step-$n$ examples, **Thue-Morse provides a positive case at $n = 2$** for the structural correspondence question.
The Thue-Morse substitution $\sigma : 0 \mapsto 01, 1 \mapsto 10$ commutes with the alphabet swap $0 \leftrightarrow 1$:

$$\sigma(\text{swap}(0)) \;=\; \sigma(1) \;=\; 10 \;=\; \text{swap}(01) \;=\; \text{swap}(\sigma(0)),$$

and similarly $\sigma(\text{swap}(1)) = \text{swap}(\sigma(1))$.
Under the bijection $\phi_{\text{TM}} : \{0, 1\} \to \{\mathbf{f}, \mathbf{t}\}$ (where the bilattice's negation involution swaps $\mathbf{t}$ and $\mathbf{f}$), the alphabet swap *is* the bilattice negation restricted to $\{\mathbf{t}, \mathbf{f}\}$.
So Thue-Morse's substitution rule commutes with bilattice negation under $\phi_{\text{TM}}$ — a genuine case of structural alignment between substitution dynamics and bilattice operation.

By contrast, the Fibonacci substitution $\sigma : a \mapsto ab, b \mapsto a$ does **not** commute with the alphabet swap: $\sigma(\text{swap}(a)) = \sigma(b) = a$, but $\text{swap}(\sigma(a)) = \text{swap}(ab) = ba \neq a$.
So Fibonacci does not have a bilattice-negation-respecting bijection at $n = 2$.

**The structural correspondence is therefore a property of the specific substitution rule, not a universal feature of step-$n$.** Within $n = 2$, both Fibonacci (no correspondence) and Thue-Morse (correspondence) exist as step-2 examples.
The "canonical" question above asks whether *any* representative of each $\mathscr{M}^{(n)}$ supports a structural correspondence; the Thue-Morse case answers *yes* at $n = 2$ for the negation involution.

At $n = 3, 4$: no such concrete positive case has been identified.
The named step-3 substitutions (Padovan, Tribonacci) and the named step-4 substitution (Tetranacci) lack the symmetric structure Thue-Morse has at $n = 2$.
Whether *any* step-3 or step-4 substitution rule (named or otherwise) supports a structural bilattice correspondence is open.

This question is recorded in the open-question file [canonical step-shift morphism](../questions/canonical-step-shift-morphism.md)'s broader investigation — the structural reasons that $n = 2, 3, 4$ are special in the corpus's framework, if any beyond the cardinality coincidence.

## Position in the program

The cardinality coincidence is established as a precise fact.
The corpus's earlier draft framing — claiming a "canonical correspondence" between alphabet and bilattice — is walked back to this honest cardinality-only statement, with the structural-correspondence question explicitly demarcated as open.

This refines the corpus's understanding of step-$n$ at $n = 2, 3, 4$: these levels are *cardinality-distinguished* (no others match bilattice substructure sizes), but not yet known to be *structurally distinguished*.
The step-$n$ framework's alignment with the bilattice's value structure is therefore a more delicate question than the corpus's earlier sketches suggested.
