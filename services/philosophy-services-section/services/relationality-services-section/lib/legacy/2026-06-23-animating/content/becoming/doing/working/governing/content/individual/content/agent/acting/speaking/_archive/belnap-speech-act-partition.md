---
type: theorem
status: sketch
depends-on: [four-bilattice, truth-order, knowledge-order, predication-settling-category, predication-valuation, negation, bilattice]
see-also: [dihedral-symmetry-on-twist-products, channel-theoretic-speech-acts, temporally-bounded-positing]
---

# The four Belnap values partition positing morphisms into four speech-act classes

On the [four-element bilattice](../objects/four-bilattice.md) $\mathbf{FOUR}$, the four values $\{\bot, \mathbf{t}, \mathbf{f}, \top\}$ partition the positing datum space into four pairwise-disjoint exhaustive classes.
These classes correspond to four illocutionary speech-act types, and the [Klein-four symmetry group](teaching/explanations/klein-four-symmetry.md) $\mathbb{Z}_2 \times \mathbb{Z}_2 = \langle \mathord{\sim}, \mathord{-} \rangle$ acts on the classes as a permutation group.

## Statement

**Definition.** For a positing datum $q \in \mathbf{FOUR}$, define its **speech-act class**:

| Value $q$ | Class | Informal name |
|---|---|---|
| $\bot$ | Abstaining | No illocutionary act; identity morphism at the cell |
| $\mathbf{t}$ | Asserting | Positive evidence only; claiming truth |
| $\mathbf{f}$ | Denying | Negative evidence only; claiming falsity |
| $\top$ | Contesting | Both sides present; paraconsistently held |

**Partition.** The four classes are pairwise disjoint and cover $\mathbf{FOUR}$: every $q \in \mathbf{FOUR}$ belongs to exactly one class.

**Closure under same-class $\vee_k$.** Within each class, composition of positing morphisms at the same cell (i.e., $\leq_k$-join of their data) stays within the class: - Asserting $\vee_k$ Asserting $= \mathbf{t} \vee_k \mathbf{t} = \mathbf{t}$ — Asserting - Denying $\vee_k$ Denying $= \mathbf{f} \vee_k \mathbf{f} = \mathbf{f}$ — Denying - Contesting $\vee_k$ Anything $= \top$ — Contesting (absorbing) - Abstaining $\vee_k$ Anything $= q$ — Absorbed into the other class

**Cross-class $\vee_k$.** Asserting $\vee_k$ Denying $= \mathbf{t} \vee_k \mathbf{f} = \top$ — Contesting.
An agent asserting and an agent denying the same cell produce a contested cell; the bilattice holds the contradiction without collapse.

**Klein-four action.** The bilattice's Klein-four involutions act on the speech-act classes as follows:

| Involution | Action on classes |
|---|---|
| Negation $\sim$ (swaps $\mathbf{t} \leftrightarrow \mathbf{f}$, fixes $\bot, \top$) | Swaps Asserting $\leftrightarrow$ Denying; fixes Abstaining, Contesting |
| Conflation $-$ (swaps $\bot \leftrightarrow \top$, fixes $\mathbf{t}, \mathbf{f}$) | Swaps Abstaining $\leftrightarrow$ Contesting; fixes Asserting, Denying |
| Composite $\sim \circ -$ | Swaps Asserting $\leftrightarrow$ Denying and Abstaining $\leftrightarrow$ Contesting |

The orbit structure: $\{$Asserting, Denying$\}$ is one $\langle\mathord{\sim}\rangle$-orbit; $\{$Abstaining, Contesting$\}$ is one $\langle\mathord{-}\rangle$-orbit.
The two orbits do not mix under the Klein-four action.

## Proof

The partition claim follows immediately from the structure of $\mathbf{FOUR}$: the four values are the only elements, and the truth-order places $\mathbf{f} <_t \bot, \top <_t \mathbf{t}$ (strictly), so truth-designated ($\geq_t \mathbf{t}$) is exactly $\{\mathbf{t}\}$, truth-antidesignated ($\leq_t \mathbf{f}$) is exactly $\{\mathbf{f}\}$, and knowledge-maximal ($\geq_k \mathbf{t} \wedge_k \mathbf{f}$, i.e., $= \top$) is exactly $\{\top\}$.
Together with $\bot$, these are the four elements.
The classes are disjoint and exhaustive.

The closure-under-$\vee_k$ claims follow from the $\vee_k$-table of $\mathbf{FOUR}$: $\mathbf{t} \vee_k \mathbf{t} = \mathbf{t}$, $\mathbf{f} \vee_k \mathbf{f} = \mathbf{f}$, $\top \vee_k q = \top$ for any $q$, $\bot \vee_k q = q$ for any $q$, $\mathbf{t} \vee_k \mathbf{f} = \top$.

The Klein-four action follows from the action of $\sim$ and $-$ on $\mathbf{FOUR}$ (see [bilattice-klein-four-symmetry](questions/bilattice-klein-four-symmetry.md)): $\sim(\mathbf{t}) = \mathbf{f}$, $\sim(\mathbf{f}) = \mathbf{t}$, $\sim(\bot) = \bot$, $\sim(\top) = \top$; $-(\bot) = \top$, $-(\top) = \bot$, $-(\mathbf{t}) = \mathbf{t}$, $-(\mathbf{f}) = \mathbf{f}$.
The claimed orbit structure is immediate. $\square$

## Restriction to $\mathbf{FOUR}$; status for general $\mathbf{L}^\bowtie$

This theorem is stated and proved for $\mathbf{L} = \mathbf{2}$ (the four-element bilattice).
For a general bounded-interlaced bilattice $\mathbf{L}^\bowtie$, the speech-act classes generalize to:

- **Asserting**: $q_+ = 1$ (positive coordinate at maximum), $q_- < 1$ (negative strictly below maximum)
- **Denying**: $q_- = 1$, $q_+ < 1$
- **Contesting**: $q_+ = q_- = 1$ (both at maximum, i.e., $q = \top$)
- **Abstaining**: $q = \bot$

For intermediate values (e.g., $q_+ = 0.7, q_- = 0$ in a $[0,1]$-valued bilattice), the binary classification breaks down; the class is neither asserting (not at maximum positive evidence) nor denying nor contesting.
This intermediate region is handled by the **graduated speech-act model**: for $q = \langle q_+, q_- \rangle \in \mathbf{L}^\bowtie$, define:

- **Assertion degree** $\alpha(q) := q_+ \in \mathbf{L}$ — the positive-evidence coordinate.
- **Denial degree** $\delta(q) := q_- \in \mathbf{L}$ — the negative-evidence coordinate.
- **Contestation degree** $\kappa(q) := q_+ \wedge_\mathbf{L} q_- \in \mathbf{L}$ — the degree to which both sides are simultaneously present.

The assignment $q \mapsto (\alpha(q), \delta(q))$ is a functor from the set of positing data to $\mathbf{L} \times \mathbf{L}$, sending each positing morphism to its speech-act degree pair.
The $\mathbf{FOUR}$-partition theorem is the special case $\mathbf{L} = \mathbf{2}$ where these degree pairs collapse to $\{0, 1\}^2$, recovering the four exact classes.

## Corollary: speech-act morphism classes are well-defined on $\mathbf{FOUR}$

The four classes license defining: - [Assertive positing morphism](../morphisms/assertive-positing-morphism.md): $\mathrm{posit}_{(\phi, \mathbf{t})}$ - [Denial positing morphism](../morphisms/denial-positing-morphism.md): $\mathrm{posit}_{(\phi, \mathbf{f})}$ - [Contestation positing morphism](../morphisms/contestation-positing-morphism.md): $\mathrm{posit}_{(\phi, \top)}$ - Abstaining: the identity (no positing morphism)

as four well-defined sub-classes of the [positing-morphism](../morphisms/positing-morphism.md).
On $\mathbf{FOUR}$, every positing morphism belongs to exactly one of the four classes.
