---

name: history-normalization
description: "Every history has a unique canonical representative — the Foata normal form — built constructively by successive concurrency fronts. The abstract confluence properties of commutation rewriting correspond to this construction."
---

### Theorem — History Normalization {#history-normalization}

#### The Foata Normal Form {#foata-normal-form}

The **Foata normal form** of a history $[w]$ is built by the following iteration:

1. The **concurrency front** of $w$ is the set of all steps $s$ in $w$ such that no step
   to the left of $s$ (in any representative) is dependent on $s$ under $I^c$ (the
   dependence relation, complement of $I$).
2. Write this front as a block $B_i$ — its steps are pairwise commuting, so any ordering
   within the block represents the same history segment.
3. Remove $B_i$ from $w$ and repeat on the remainder.

The result $[w] = B_1 \cdot B_2 \cdots B_k$ is the **Foata decomposition**. Each step in
$B_{i+1}$ depends on at least one step in $B_i$; the blocks are causally ordered.

**Existence and termination.** The front algorithm terminates because each iteration
strictly reduces the number of remaining steps: the front $B_i$ is nonempty (by
definition, the first step of any representative always belongs to the front), so the
suffix shrinks at every stage.

**Uniqueness.** The concurrency front is determined by the history $[w]$, not by the
choice of representative $w$: a step $s$ is in the front iff no step dependent on $s$
precedes it in any linearization of the history. Since steps within a block are pairwise
commuting, the block $B_i$ is an unordered set of steps — any two orderings within $B_i$
represent the same history segment. The decomposition $B_1 \cdots B_k$ is therefore
uniquely determined by $[w]$.

Every history $[w] \in \mathbb{M}(\Sigma, I)$ has a **unique Foata normal form**.

#### Correspondence with Commutation Rewriting {#history-canonical}

The commutation rewriting relation $\to_I$ on step sequences — replacing $ss'$ by $s's$
whenever $s \perp s'$ — provides an alternative route to the same normal form.

The Foata algorithm corresponds to applying $\to_I$ in a systematic order: at each
stage, commute all steps that can move left until no more left-moves are possible. The
block $B_1$ is the result of commuting all independent steps to the front; this is
exactly the normal form for the left-to-right pass of $\to_I$.

The abstract properties of $\to_I$ are:

**Strongly normalizing.** Every $\to_I$-sequence terminates. Each swap preserves step
count; step sequences of a given length over $\Sigma$ are finite; hence no infinite
descent is possible.

**Locally confluent.** If $u \to_I v_1$ and $u \to_I v_2$ by distinct swaps, then $v_1$
and $v_2$ have a common reduct. *Proof.* If the swaps act at disjoint positions, both
can be applied in either order, yielding the same result. If they overlap, the
overlapping steps commute by hypothesis, so the two swaps produce the same step sequence
directly. $\square$

Newman's Lemma (strongly normalizing + locally confluent $\Rightarrow$ confluent) gives
full confluence of $\to_I$. This corresponds to the uniqueness already established
constructively: the confluent normal form of any step sequence $w$ under $\to_I$ is its
Foata normal form.

#### What This Is Not {#history-normalization-not}

History normalization is not FiberNuclearLanguage normalization (§normalization) nor
universe-level normalization (§universe-normalization). Those concern reduction of modal
terms in the language of fiber Heyting algebras. History normalization concerns the
combinatorics of the free history monoid $\mathbb{M}(\Sigma, I)$.

The Foata decomposition enters $R$ indirectly: it witnesses that the diamond property in
$T$ — the categorical consequence of commutation (§commutation) — is not vacuous and
that the history category is unambiguously defined.
