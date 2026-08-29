---
type: theorem
class: engineering-claim
status: proved
depends-on: [bilattice-operation-table, four-bilattice, twist-product, twist-product-fusion, twist-product-right-residual, knowledge-order, truth-order, negation, four-bilattice-residuation-properties]
see-also: [conformance-via-fiber-algebra-functor, determinism-via-fiber-functoriality]
---

# The substrate's bilattice operation tables are the unique operations satisfying the bilattice axioms

**Claim.** The 16-entry tables fixed in [bilattice-operation-table](../concepts/bilattice-operation-table.md) for the operations $\vee_k, \wedge_k, \vee_t, \wedge_t, \neg, \odot, \Rightarrow$ on $\mathbf{FOUR} = \{\bot, \mathbf{t}, \mathbf{f}, \top\}$ are uniquely determined by:

1. The [knowledge-order](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) axioms ($\bot \leq_k \mathbf{t} \leq_k \top$ and $\bot \leq_k \mathbf{f} \leq_k \top$, lattice closure).
2. The [truth-order](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/truth-order.md) axioms ($\mathbf{f} \leq_t \bot \leq_t \mathbf{t}$ and $\mathbf{f} \leq_t \top \leq_t \mathbf{t}$, lattice closure).
3. The [twist-product](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/twist-product.md) construction $\mathbf{FOUR} \cong \mathbf{2}^\bowtie$ (per [four-bilattice](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/four-bilattice.md)).
4. The bilattice axiom that $\neg$ swaps $\mathbf{t} \leftrightarrow \mathbf{f}$ and fixes $\bot, \top$.
5. The [residuation properties](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-bilattice-residuation-properties.md) of $\Rightarrow$ relative to $\odot$.

A substrate using any other table is implementing a different algebra, not $\mathbf{FOUR}$.

## Why this holds

Each operation's table is determined by the underlying mathematical structure:

**$\vee_k$ and $\wedge_k$** are the join and meet of the [knowledge-order](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) lattice. The Hasse diagram of $\leq_k$ is a diamond with $\bot$ at the bottom, $\top$ at the top, $\mathbf{t}$ and $\mathbf{f}$ as incomparable middle elements. The lattice operations are uniquely determined by this structure:

- $a \vee_k b$ is the least element $\geq_k$ both $a$ and $b$.
- $a \wedge_k b$ is the greatest element $\leq_k$ both $a$ and $b$.

Cell-by-cell verification: for example $\mathbf{t} \vee_k \mathbf{f}$ — the least upper bound of two incomparable middle elements is the top element $\top$. The table records exactly this; any deviation would not be the lattice's join.

**$\vee_t$ and $\wedge_t$** are the join and meet of the [truth-order](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/truth-order.md) lattice. By the same uniqueness argument, the tables are determined by the order's Hasse diagram (a diamond with $\mathbf{f}$ at bottom, $\mathbf{t}$ at top, $\bot$ and $\top$ as incomparable middle).

**$\neg$** is fixed by the bilattice axiom: $\neg$ is an order-inverting involution on $\leq_t$ that fixes the middle elements of $\leq_k$. The unique such function on $\mathbf{FOUR}$ swaps $\mathbf{t} \leftrightarrow \mathbf{f}$ and fixes $\bot, \top$.

**$\odot$** is determined by the twist-product construction. Per [four-bilattice](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/four-bilattice.md), $\mathbf{FOUR} \cong \mathbf{2}^\bowtie$ with the encoding $\bot = \langle 0, 0 \rangle, \mathbf{t} = \langle 1, 0 \rangle, \mathbf{f} = \langle 0, 1 \rangle, \top = \langle 1, 1 \rangle$. Per [twist-product-fusion](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md), $\langle a_+, a_- \rangle \odot \langle b_+, b_- \rangle = \langle a_+ \wedge b_+, a_- \vee b_- \rangle$ in $\mathbf{2}$. Computing all 16 entries gives the table. Verification:

- $\mathbf{t} \odot \mathbf{t} = \langle 1, 0 \rangle \odot \langle 1, 0 \rangle = \langle 1 \wedge 1, 0 \vee 0 \rangle = \langle 1, 0 \rangle = \mathbf{t}$ ✓
- $\mathbf{t} \odot \mathbf{f} = \langle 1, 0 \rangle \odot \langle 0, 1 \rangle = \langle 0, 1 \rangle = \mathbf{f}$ ✓
- $\mathbf{f} \odot \top = \langle 0, 1 \rangle \odot \langle 1, 1 \rangle = \langle 0, 1 \rangle = \mathbf{f}$ ✓ (absorbing)
- $\mathbf{t} \odot \top = \langle 1, 0 \rangle \odot \langle 1, 1 \rangle = \langle 1, 1 \rangle = \top$ ✓

The remaining entries follow identically.

**$\Rightarrow$** is determined by the residuation property: $a \odot c \leq_k b \iff c \leq_k (a \Rightarrow b)$. Per [four-bilattice-residuation-properties](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-bilattice-residuation-properties.md), this residual exists and is unique for each $(a, b)$ pair; the table entries are computed by enumerating $c$ values and finding the largest one satisfying the implication.

## Engineering consequence

- **Substrate operations are byte-deterministic.** Per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), two implementations using these tables produce byte-identical operation outputs on byte-identical inputs. A non-table implementation produces different outputs and breaks the substrate's content-addressing.
- **Conformance is checkable on the operation tables.** Per [conformance-via-fiber-algebra-functor](conformance-via-fiber-algebra-functor.md), an implementation's conformance test must include all 16 entries of each table (a 96-test check, since 6 binary operations $\times$ 16 entries plus 4 entries for $\neg$). Per the theorem, an implementation passing the 100-test check is conformant on the value-domain.
- **No "implementation freedom" at the value-domain level.** The bilattice's structure constrains every operation entry. An engineer who wants to "improve" the table is implementing a different algebra; per [determinism-via-fiber-functoriality](determinism-via-fiber-functoriality.md), this is non-conformance.
- **Optimization is bounded by the table.** A runtime can short-circuit (e.g., $\bot \vee_k x = x$ without table lookup), inline the table, or implement via bit-tricks on the byte encoding — but the *result* must equal the table entry. Optimizations that don't preserve the table values are bugs.

## What the theorem rules out

- **Tables that violate lattice axioms.** A "bilattice" with non-associative join, or with unit elements other than $\bot$ (for $\vee_k$) and $\mathbf{f}$ (for $\vee_t$), is not the four-bilattice. Per the lattice uniqueness argument, the table values are forced.
- **Tables with different $\odot$ semantics.** A "twist-product fusion" not equal to componentwise $\langle \wedge, \vee \rangle$ on $\mathbf{2}^\bowtie$ is not the four-bilattice's $\odot$. Per [twist-product-fusion](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md), the construction is canonical.
- **Tables with different residuation behavior.** A "$\Rightarrow$" not satisfying $a \odot c \leq_k b \iff c \leq_k (a \Rightarrow b)$ is not the right residual; per [four-bilattice-residuation-properties](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-bilattice-residuation-properties.md), the residual exists and is unique.
- **Implementations using a different byte encoding.** Per [bilattice-operation-table](../concepts/bilattice-operation-table.md), the byte encoding $\bot=0, \mathbf{t}=1, \mathbf{f}=2, \top=3$ is fixed substrate content. An implementation using a different encoding produces different canonical hashes; per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), this breaks federation deduplication and audit equivalence.

## What the theorem requires

- The substrate's value-domain is the four-bilattice $\mathbf{FOUR}$ (per [four-bilattice](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/four-bilattice.md)).
- The bilattice's underlying lattice operations satisfy the standard axioms (associativity, commutativity, absorption, idempotence).
- The twist-product construction $\mathbf{2}^\bowtie$ is well-defined per [twist-product](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/twist-product.md).

## Position

This theorem is the structural ground for the substrate's value-domain spec. Together with [bilattice-operation-table](../concepts/bilattice-operation-table.md), it gives substrate implementers the unambiguous reference: here are the tables, and here is the math forcing them. Conformance starts here — an implementation that fails the table check on any of the 100 entries cannot be conformant on any higher-level operation that uses the value domain.
