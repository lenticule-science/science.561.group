---

title: "Event"
aliases:
  - "event"
  - "events"
date-created: 2026-01-01
tags: []
---

An event is a collection of outcomes from a probabilistic experiment — something that either happens or does not happen, and to which a [probability](../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/probability.md) can be assigned. When you roll a die, "rolling an even number" is an event: it is the set of outcomes $\{2, 4, 6\}$ within the [sample space](../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/sample-space.md) $\Omega = \{1, 2, 3, 4, 5, 6\}$. "Rolling a 3" is an event (the set $\{3\}$). "Rolling a number less than 10" is an event (the entire sample space — it always happens). "Rolling a 7" is an event too (the empty set — it never happens).

Formally, an event is a [subset](../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/subset.md) of $\Omega$. The empty set $\emptyset$ is the impossible event, with probability 0. The full sample space $\Omega$ is the certain event, with probability 1. Everything in between has a probability somewhere in $[0, 1]$.

Events combine using set operations, and the language of sets translates naturally into the language of outcomes. The [union](../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/union.md) $A \cup B$ is "either $A$ or $B$ occurs (or both)." The [intersection](../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/intersection.md) $A \cap B$ is "both $A$ and $B$ occur." The complement $A^c$ is "$A$ does not occur." These operations give probability its logical structure: the probability of "$A$ or $B$" is $P(A \cup B) = P(A) + P(B) - P(A \cap B)$, subtracting the overlap to avoid double-counting.

Two events are mutually exclusive (disjoint) when they cannot both occur: $A \cap B = \emptyset$. Rolling an even number and rolling an odd number are mutually exclusive — the die cannot land on both. For mutually exclusive events, $P(A \cup B) = P(A) + P(B)$, with no overlap to subtract. The Kolmogorov axioms extend this to countable collections: if events $A_1, A_2, \ldots$ are pairwise disjoint, then $P(A_1 \cup A_2 \cup \cdots) = P(A_1) + P(A_2) + \cdots$. This countable additivity is what makes probability a measure in the mathematical sense.

Not every subset of $\Omega$ need be an event. In general, events form a σ-algebra $\mathcal{F}$ on $\Omega$ — a collection of subsets that is closed under complement and countable union, and that contains $\Omega$ itself. For finite or countable sample spaces, the σ-algebra is usually just the collection of all subsets (the power set), and every possible question has a well-defined probability. But for uncountable sample spaces like $\mathbb{R}$, the power set is too large — there exist subsets so pathological that no consistent probability can be assigned to them. The σ-algebra restricts attention to "well-behaved" subsets, ensuring the probability measure is mathematically consistent.

Two events are [independent](../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/independence.md) when the occurrence of one provides no information about the other: $P(A \cap B) = P(A) \cdot P(B)$. Independence is distinct from mutual exclusivity — in fact, mutually exclusive events are maximally dependent (knowing one occurred tells you the other did not).
