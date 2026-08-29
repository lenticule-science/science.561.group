---
type: term
term-kind: morphism
class: group-action
symbol: G \curvearrowright \mathcal H
depends-on: [hilbert-structure-cone]
see-also: [moduli-of-laplacianizations, gauge-fiber-structure]
---

# Chain auto group action on Hilbert structures

The natural action of the chain automorphism group $G$ on the [Hilbert structure cone](./hilbert-structure-cone.md) $\mathcal H$, whose orbit space is $\mathcal M_{\mathrm{Lap}}$.

## The chain auto group

For a chain complex $(C_\bullet, d)$,
$$G = \{(g_n) \in \prod_n \mathrm{GL}(C_n) : g_{n-1} d_n = d_n g_n\ \text{for all}\ n\}.$$

A tuple $(g_n)$ is a chain auto if it intertwines the boundary operators. Equivalently, $G$ is the automorphism group of the chain complex as a chain complex.

## The action

For $g = (g_n) \in G$ and $Q = (Q_n) \in \mathcal H$, define
$$g \cdot Q := (g_n^T Q_n g_n)_n.$$

This preserves positive-definiteness ($g_n$ invertible $\Rightarrow$ $g_n^T Q_n g_n$ SPD). It also intertwines the Hilbert adjoints: $(d^*)^{g \cdot Q} = g^{-1} d^{*Q} g$, hence $\Delta^{g \cdot Q} = g^{-1} \Delta^Q g$ as operators on $C_\bullet$. Spectra of $\Delta$ are invariant under $G$.

## Properness

The action is proper (closed orbit map): the set of $g$ moving $Q$ near $Q'$ is compact in $G$. This follows from $G \subseteq \prod_n \mathrm{GL}(C_n)$ being closed and the SPD cone $\mathcal H$ being open with positive-definiteness preserved.

## Orbits

Each orbit $G \cdot Q$ is a smooth submanifold of $\mathcal H$. The orbit dim is $\dim G - \dim \mathrm{stab}_G(Q)$.

For *generic* $Q$ (in the open dense Stratification-I stratum), $\mathrm{stab}_G(Q)$ is finite (discrete), so the orbit has dim $\dim G$. For $Q$ in higher-codim strata, the stabilizer is positive-dim, and the orbit shrinks.

## Stabilizers

For $Q$ in [Stratum$(\Pi)$](./stratum-eigenvalue-multiplicity.md),
$$\dim \mathrm{stab}_G(Q) = \sum_B \sum_n \binom{k_n^B}{2}$$
([proved](../../documents/articles/research-articles/stab-codim-formula.md)).

Stabilizers are subgroups of $\prod_n O(C_n, Q_n)$ (orthogonal groups w.r.t. the inner product), restricted by the chain auto condition $g_{n-1} d_n = d_n g_n$.

## Quotient

$\mathcal M_{\mathrm{Lap}} = G \backslash \mathcal H$ inherits an orbifold structure from the proper action with possibly-positive-dim stabilizers. Strata of $\mathcal M_{\mathrm{Lap}}$ are images of Stratification-I strata of $\mathcal H$ under the quotient.

## Sub-actions

- The full $\prod_n \mathrm{GL}(C_n)$ action (without chain auto constraint) is the **unconstrained gauge action** — what would apply if there were no chain complex structure. The chain auto constraint reduces $\prod_n \mathrm{GL}(C_n)$ to the smaller $G$.

- The orthogonal-only sub-action $\prod_n O(C_n) \cap G$ preserves the Hilbert structure pointwise (when restricted to the orthogonal frame at the standard basis). Its quotient is a finite cover of $\mathcal M_{\mathrm{Lap}}$.

- The cellular automorphism group $G_{\mathrm{cell}} \subseteq G$ — finite — preserves the cellular basis. It acts on the [stalkwise diagonal cone](./stalkwise-diagonal-cone.md) $\mathcal H_{\mathrm{diag}} \subseteq \mathcal H$ as the natural automorphism.

## What the action achieves

Quotienting by $G$ removes the chain-automorphism redundancy, leaving only the "spectrally meaningful" data. Two Hilbert structures $Q, Q'$ in the same $G$-orbit have the same spectra of $\Delta$, the same Hodge filtration, the same bipartite multipartition — they are *equivalent as Laplacianizations*.

The moduli $\mathcal M_{\mathrm{Lap}}$ thus parametrizes Laplacianizations *up to chain-auto equivalence*, which is the right notion of equivalence for studying moduli of Hodge Laplacians.
