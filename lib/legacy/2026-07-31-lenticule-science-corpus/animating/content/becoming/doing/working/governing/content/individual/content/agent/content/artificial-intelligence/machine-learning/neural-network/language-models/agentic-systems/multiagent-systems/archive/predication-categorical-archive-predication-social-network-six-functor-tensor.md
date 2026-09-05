---
type: example
status: verified
depends-on: [q-enriched-sheaf-tensor, q-enriched-sheaf-hom, q-enriched-sheaf-closed-monoidal-structure, social-network-strong-mld-orbits, social-network-verdier-dual, relational-database-settling]
instantiates: [q-enriched-sheaf-tensor, q-enriched-sheaf-closed-monoidal-structure]
lineage: 2
---

# Tensor of two settling sheaves on the social network

The corpus's first concrete computation of the [closed-monoidal $\otimes$](../theorems/q-enriched-sheaf-closed-monoidal-structure.md) on Q-enriched sheaves. **Lineage 2** instance: tensor of the truth-only-firing settling sheaf with the falsity-only-firing settling sheaf from [social-network-strong-mld-orbits](social-network-strong-mld-orbits.md).

## Setup

Two L2 settling sheaves on the same base ($E = \{a, b\}$, $P$, $\lambda = 2$):

- $\mathbb{F}_v$: settling sheaf for $v$ where Alice likes Bob ($v(P)(a, b) = \mathbf{t}$).
- $\mathbb{F}_{v'}$: settling sheaf for $v'$ where Alice does not like Bob ($v'(P)(a, b) = \mathbf{f}$).

## Tensor computation

The Q-enriched sheaf tensor $\mathbb{F}_v \otimes \mathbb{F}_{v'}$ is computed pointwise on stalks, then sheafified. At the maximal section $(P, 1, \{((a, b), +), ((a, b), -)\})$:

- $\mathbb{F}_v$ stalk: $L_+ = \mathcal{P}(\{((a, b), +)\})$ rank 1, $L_- = \{\emptyset\}$.
- $\mathbb{F}_{v'}$ stalk: $L_+' = \{\emptyset\}$, $L_-' = \mathcal{P}(\{((a, b), -)\})$ rank 1.
- Tensor stalk $(\mathbb{F}_v \otimes \mathbb{F}_{v'})(P, 1, \cdot)$: $L_+ \otimes L_+'$ on truth-side (which is rank 1 $\otimes$ rank 0 = rank 0 ... wait, that's wrong).

Hmm. Let me redo. The d-frame tensor of two d-frames takes truth-component to truth-component, falsity to falsity:

$$(L_+, L_-) \otimes (L_+', L_-') = (L_+ \otimes L_+', L_- \otimes L_-').$$

For our case: $L_+ = \mathcal{P}(\{((a, b), +)\})$ has rank 1; $L_+' = \{\emptyset\}$ has rank 0. The tensor of frames (at the level of underlying lattices) is the product of rank: $L_+ \otimes L_+' = \{\emptyset\}$ (anything tensored with a trivial frame is trivial).

Similarly $L_- \otimes L_-' = \{\emptyset\} \otimes \mathcal{P}(\{((a, b), -)\}) = \{\emptyset\}$.

So **$\mathbb{F}_v \otimes \mathbb{F}_{v'}$ has trivial stalks** at this section — the truth-only and falsity-only settlings are tensor-orthogonal.

## What the tensor records

The tensor's vanishing on this pair has structural meaning: $v$ and $v'$ are *evidence-disjoint* — $v$ has only truth-side content, $v'$ has only falsity-side content. Their tensor preserves only content present in *both*, which is empty.

Compare with the **inconsistency $\top$ at the joint cell**: if we instead consider the settling $v''$ where the cell $(a, b)$ has value $\top$ (both $\mathbf{t}$ and $\mathbf{f}$ asserted):

- $\mathbb{F}_{v''}$ stalk has $L_+'' = \mathcal{P}(\{((a, b), +)\})$ rank 1, $L_-'' = \mathcal{P}(\{((a, b), -)\})$ rank 1.
- $\mathbb{F}_v \otimes \mathbb{F}_{v''}$: truth-side $\mathcal{P}(\{((a, b), +)\}) \otimes \mathcal{P}(\{((a, b), +)\})$ = $\mathcal{P}(\{((a, b), +)\})$; falsity-side trivial.

So $\mathbb{F}_v \otimes \mathbb{F}_{v''} \cong \mathbb{F}_v$. The truth-only settling tensor with the $\top$-settling recovers the truth-only settling.

## Tensor with the negation-paired settling

Concretely interesting case: $\mathbb{F}_v \otimes \mathbb{F}_{\neg v}$, the tensor of a settling with its negation. Here $\neg v$ has $\neg v(P)(a, b) = \mathbf{f}$ (since $v(P)(a, b) = \mathbf{t}$ negates to $\mathbf{f}$). So $\mathbb{F}_{\neg v} = \mathbb{F}_{v'}$ in our notation.

We computed $\mathbb{F}_v \otimes \mathbb{F}_{v'} = $ trivial stalks. So **the tensor of a settling with its negation is the trivial sheaf**. This is the structural signature of the exchange-orbit pair: tensoring orbit-paired settlings annihilates content.

## What this exhibits

Three observations:

**1. The tensor encodes simultaneous-evidence patterns.** When two settlings agree on a cell with the same evidence-side content, the tensor preserves it. When they disagree (or have evidence-disjoint content), the tensor vanishes.

**2. Exchange-orbit pairs are tensor-annihilating.** Truth-only and falsity-only paired settlings tensor to the trivial sheaf — a precise computational signature of the strong-MLD exchange-orbit relation.

**3. Self-dual ($\top$-firing) settlings are tensor-absorbing.** A $\top$-firing settling tensors with any other to recover the other — it's the multiplicative identity (after normalization) for the d-frame tensor on this base.

## Position in Lineage 2

The L2 instance for the six-functor formalism's monoidal piece. With this in hand, L2 has been carried through to the six-functor framework. The tensor's algebraic structure here (annihilation on exchange pairs, absorption by self-dual orbits) is L2-specific content predication categories' abstract monoidal-structure theorem doesn't make visible without a concrete example.
