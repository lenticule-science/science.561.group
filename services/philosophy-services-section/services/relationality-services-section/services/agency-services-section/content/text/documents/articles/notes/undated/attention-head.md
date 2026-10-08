---
type: object
class: contemporary
status: active
depends-on:
  - residual-stream.md
see-also:
  - teaching/explanations/circuit.md
  - ../morphisms/activation-patching.md
references:
  - references/wang-ioi2022.md
title: Attention head
description: An attention head is one of the parallel attention operations within a multi-head attention layer of a transformer.
---

# Attention head

An **attention head** is one of the parallel attention
operations within a multi-head attention layer of a
transformer. Each head has its own query, key, value, and
output-projection matrices and operates on a low-dimensional
subspace of the residual stream.

## Anatomy

For a transformer with hidden dimension $d$ and $h$ heads
per layer (head dimension $d_h = d/h$), each head is
parameterized by:

- **Query matrix** $W_Q \in \mathbb{R}^{d \times d_h}$.
- **Key matrix** $W_K \in \mathbb{R}^{d \times d_h}$.
- **Value matrix** $W_V \in \mathbb{R}^{d \times d_h}$.
- **Output matrix** $W_O \in \mathbb{R}^{d_h \times d}$.

The head reads from the residual stream into its $d_h$-
dimensional subspace via $W_Q, W_K, W_V$, computes attention,
and writes back via $W_O$.

## QK and OV circuits

A useful decomposition (Elhage et al. 2021):

- **QK circuit** $W_Q W_K^\top$ — determines *where* the
  head attends. A bilinear form on residual stream.
- **OV circuit** $W_V W_O$ — determines *what* the head
  writes given the source it attended to. A linear map from
  residual stream to residual stream.

This decomposition lets the QK and OV circuits be analyzed
separately: the QK circuit specifies the head's attention
pattern; the OV circuit specifies the head's effect on the
target token's representation.

## Heads as features-in-features-out

Mechanistically, each head can be characterized by:

- **The features it reads** from source tokens (via $W_V$).
- **The pattern it computes** for which sources to attend to
  (via $W_Q W_K^\top$).
- **The features it writes** to the target token (via the
  composition through $W_O$).

A head's "function" is the conjunction of these three. A head
that reads "token is a name" features, attends to source
tokens that match the current target's prediction-context,
and writes "name to copy" features — this is, e.g., a
*name-mover head* in the IOI circuit.

## Heads in circuits

Identified circuits (IOI, factual recall, etc.) typically
involve a small number of heads (usually 5-30) per circuit,
each with a documented role. Roles found in the literature
include:

- **Name-mover heads** — copy named entities to relevant
  positions.
- **S-inhibition heads** — suppress duplicated entities.
- **Induction heads** — implement in-context pattern matching
  ([prefix] [next] ... [prefix] $\to$ [next]).
- **Previous-token heads** — write the previous token's
  representation to the current.
- **Successor heads** — produce the next item in an ordered
  sequence.

The empirical catalog of identified head functions is growing.

## Polysemantic heads

Like neurons, heads can be polysemantic — implementing
different functions on different inputs. Many heads are
*partially* monosemantic on the studied input distribution
but reveal additional functions when studied on other
distributions.

## Why heads matter for interpretability

Heads are an *intermediate granularity* between neurons and
layers — coarse enough to have nameable functions, fine
enough to be tractably studied. Most published mechanistic
interpretability results name specific heads (by layer,
head-index pair) and assign each a role.
