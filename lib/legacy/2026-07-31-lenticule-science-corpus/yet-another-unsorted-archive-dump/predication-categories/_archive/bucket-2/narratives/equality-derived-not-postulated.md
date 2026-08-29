---
type: narrative
discusses: [classical-equality, paraconsistent-equality, lawvere-comprehension-classical, lawvere-comprehension-paraconsistent, two-internal-logics, equality-via-equalizer]
---

# Equality is derived, not postulated

Bilattice first-order logics in the literature — BD∆ (Omori–Wansing), [@kamide-zohar2020], Běhounek–Daňková–Dvořák 2023 — postulate classical $\mathbf{t}/\mathbf{f}$-valued equality as a primitive relation. The postulate is structurally awkward: equality is the canonical example of a *derivable* logical connective in Lawvere's hyperdoctrinal framework, and a setting that recovers the Lawvere apparatus should derive its equality the same way, not import it as a primitive.

The [predication hyperdoctrine](../objects/predication-hyperdoctrine.md) does. Both equalities — [classical equality](../objects/classical-equality.md) $=_E$ and [paraconsistent equality](../objects/paraconsistent-equality.md) $\Delta_E^k$ — fall out of the diagonal-$\Sigma$ construction, no primitive postulated.

## The construction

Fix the diagonal [predicate specialization](../morphisms/predicate-specialization.md) $g : q \to p$ with $\mathrm{dom}(q) = \Delta_E := \{(s, s) : s \in E\}$ — the diagonal sub-support, derivable from [equality-via-equalizer](../theorems/equality-via-equalizer.md). Apply Lawvere's $\Sigma$-image construction:

- **Classical equality.** $\exists_g^t(\mathbf{1}_q^t) = =_E$. The $\leq_t$-side $\exists$ extends by $\mathbf{f}$ off the diagonal; the $\leq_t$-terminal is constant-$\mathbf{t}$ on the diagonal. The Lawvere image is $\mathbf{t}$ on $\Delta_E$, $\mathbf{f}$ off — classical two-valued equality. ([Lawvere comprehension classical](../theorems/lawvere-comprehension-classical.md).)

- **Paraconsistent equality.** $\exists_g^k(\mathbf{1}_q^k) = \Delta_E^k$. The $\leq_k$-side $\exists$ extends by $\bot$ off the diagonal; the $\leq_k$-terminal is constant-$\top$ on the diagonal. The Lawvere image is $\top$ on $\Delta_E$, $\bot$ off — information-maximal on diagonal, no claim off. ([Lawvere comprehension paraconsistent](../theorems/lawvere-comprehension-paraconsistent.md).)

Both are derived; neither is postulated. The same diagonal specialization $g$ supplies both — they differ only in which adjoint system's $\exists$ is applied.

## Why postulating felt necessary in prior literature

The earlier bilattice first-order logics had access to only one adjoint triple at a time: typically the truth-side, with classical equality as the natural target. Without the parallel knowledge-side adjoints — the second of the [two adjoint systems](../theorems/two-internal-logics.md) — there is no way to derive a non-classical equality alongside the classical one. So the literature postulated whichever equality the setting wanted, without the structural derivation.

The two-system structure of the predication hyperdoctrine makes both adjoint triples available simultaneously on the *same* fibration. Lawvere's $\Sigma$-image works in either, producing the corresponding equality without postulation. Once the two adjoint systems are present, postulation becomes unnecessary; the equalities derive themselves.

## What this exposes

Beyond removing a postulate, the derivation exposes structural content: classical and paraconsistent equality are not separately stipulated logics — they are two faces of the *same* hyperdoctrinal apparatus, one per order. They live as two distinguished fibers of one [predication hyperdoctrine](../objects/predication-hyperdoctrine.md), with semantic differences explained by which order's adjunction was used to extract them.

Applications then choose:

- *Classical KR / database queries:* use $=_E$. Two-valued, compatible with classical entailment.
- *CRDT / paraconsistent reasoning:* use $\Delta_E^k$. Stable under $\vee_k$-merge, treats $\top$ as non-trivializing conflict.

The worked example [two equalities from the same diagonal](../examples/two-equalities-from-diagonal.md) exhibits both constructions on a 3-element entity set, tabulating the resulting valuations cell-by-cell.

The choice is no longer about which equality to postulate, but about which adjoint system the application uses. The framework supplies both for free.
