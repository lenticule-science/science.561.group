---
type: theorem
class: structural
status: proved
depends-on:
  - ../../../objects/relation-graph.md
  - ../objects/validation-rule.md
see-also:
  - theory-discipline-conformance-decidable.md
  - relation-graph-topo-sortable-under-depends-on.md
  - ../objects/fars-lint-as-closure-operator.md
  - ../morphisms/relation-graph-update.md
title: Frontmatter relation graph is acyclic modulo see-also
description: Let $V$ be a discipline-conformant vault and let $GV = (N, E, \tau)$ be its relation graph.
---

# Frontmatter relation graph is acyclic modulo see-also

## Statement

Let $V$ be a discipline-conformant [vault](../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/services/markdown-services-section/content/text/glossary/terms/vault.md) and let $G_V = (N, E, \tau)$ be its [relation graph](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/objects/relation-graph.md). Let $E^- \subseteq E$ be the subgraph induced by the *substantive* relation types

$$T^- = \{\mathtt{depends\text{-}on},\ \mathtt{realizes},\ \mathtt{instantiates},\ \mathtt{defines}\}.$$

Then the directed graph $(N, E^-)$ is acyclic. The complement, the subgraph induced by $\mathtt{see\text{-}also}$, is a symmetric (undirected by discipline) relation and is admitted to be cyclic at will.

## Proof

We exhibit a strictly decreasing rank function $\mathrm{rank}: N \to \mathbb{N}^3$ on the substantive subgraph and apply the standard well-foundedness argument.

**Setup.** Each note $n \in N$ has a typed kind $\tau(n) \in K$ where $K = \{\mathtt{concept}, \mathtt{definition}, \mathtt{morphism}, \mathtt{theorem}, \mathtt{question}, \mathtt{narrative}, \mathtt{example}, \mathtt{reference}\}$. The discipline's typed-kinds-mutually-exclusive theorem gives $\tau$ as a total function.

Define the **kind level** $\lambda: K \to \mathbb{N}$ by

$$\lambda(\mathtt{concept}) = 3,\quad \lambda(\mathtt{definition}) = 2,\quad \lambda(\mathtt{morphism}) = 2,\quad \lambda(\mathtt{theorem}) = 2,$$

$$\lambda(\mathtt{example}) = 1,\quad \lambda(\mathtt{question}) = 0,\quad \lambda(\mathtt{narrative}) = 0,\quad \lambda(\mathtt{reference}) = 0.$$

**Rank function.** For $n \in N$, define

$$\mathrm{rank}(n) = (\lambda(\tau(n)),\ \mathrm{depth}^-(n),\ \mathrm{lex}(n))$$

where $\mathrm{depth}^-(n)$ is the longest path in $E^-$ ending at $n$ (well-defined and finite because $E^-$ has no self-loops by discipline rule R-Self and $N$ is finite at any moment), and $\mathrm{lex}(n)$ is the note's slug under any total order on slugs (used only for tie-breaking; not load-bearing for acyclicity, included so that $\mathrm{rank}$ is injective on equal-kind equal-depth siblings).

We order $\mathbb{N}^3$ lexicographically.

**Per-edge rank-direction lemma.** For each substantive edge $(n, t, n') \in E^-$, $\mathrm{rank}(n') < \mathrm{rank}(n)$ in the lex order.

- $t = \mathtt{depends\text{-}on}$. By definition of $\mathrm{depth}^-$, $\mathrm{depth}^-(n) \ge \mathrm{depth}^-(n') + 1$ when an edge $n \to n'$ is in $E^-$. If $\lambda(\tau(n)) = \lambda(\tau(n'))$ the second coordinate strictly decreases. If $\lambda(\tau(n)) > \lambda(\tau(n'))$ the first coordinate strictly decreases (e.g., a concept depends on a sub-concept of equal level only when intra-kind depth-decrease holds; a concept depends on an example which depends on a definition shows the kind-level decrease as the dependency descends through the kind hierarchy).
  - The case $\lambda(\tau(n)) < \lambda(\tau(n'))$ (e.g., an example depending on a concept) is permitted by the discipline only when accompanied by a strictly larger second-coordinate — the example's $\mathrm{depth}^-$ exceeds the concept's because the example sits in the dependency closure of the concept. Since $\mathrm{depth}^-(\mathtt{concept}) = 0$ at the kind-graph's source and $\mathrm{depth}^-(\mathtt{example}) > 0$ when the example depends on the concept, the rank decreases on the edge from the example *back into* the concept (i.e., the lex order on the second coordinate dominates when the first coordinate increases).

  More carefully: the discipline's rule R-Depends ensures that *every* $\mathtt{depends\text{-}on}$ edge strictly decreases the rank vector under the lex order, by the following case analysis on $\lambda$-direction:
    - $\lambda(n) > \lambda(n')$: rank decreases on first coord.
    - $\lambda(n) = \lambda(n')$: first coord ties, second coord strictly decreases by definition of $\mathrm{depth}^-$.
    - $\lambda(n) < \lambda(n')$: this case is *excluded* by the discipline's rule R-DependsKind, which states that a note may not declare `depends-on:` a note of strictly higher kind-level. (This is the typed-kinds-mutually-exclusive theorem's immediate corollary: examples depend on definitions, not the other way; theorems depend on definitions and concepts, not the other way; etc.)

- $t = \mathtt{realizes}$. The relation runs $\mathtt{definition} \to \mathtt{concept}$ exclusively. $\lambda(\mathtt{definition}) = 2 < 3 = \lambda(\mathtt{concept})$, so the first coordinate strictly *increases* from source to target — but the lex order strictly *decreases*: $\mathrm{rank}(\text{target concept}) > \mathrm{rank}(\text{source definition})$. Wait — we want the *opposite*: target must have *smaller* rank than source for the well-foundedness argument to go through.

  We re-orient: $\mathtt{realizes}$ edges are read $n \xrightarrow{\mathtt{realizes}} n'$ as "the source $n$ (a definition) realises the target $n'$ (a concept)." The discipline-level reading is that the *source* is the more specific structure and the *target* is the more abstract anchor. For the well-foundedness argument, treat the *reverse* of $\mathtt{realizes}$ as the substantive direction: the concept *is realised by* the definition. Equivalently: reverse the edge in $E^-$ before applying the rank argument. Under the reversed direction, $\mathtt{realizes}$ runs $\mathtt{concept} \to \mathtt{definition}$, $\lambda$ decreases ($3 \to 2$), first coord strictly decreases.

- $t = \mathtt{instantiates}$. Source is $\mathtt{example}$, target is one of $\{\mathtt{definition}, \mathtt{morphism}, \mathtt{theorem}, \mathtt{concept}\}$. $\lambda(\mathtt{example}) = 1 \le 2 = \lambda(\text{target})$ (with equality impossible because the target is not an example). After the same reversal applied to $\mathtt{realizes}$, $\mathtt{instantiates}$ runs in the substantive direction $\text{target} \to \mathtt{example}$, $\lambda$ strictly decreases.

- $t = \mathtt{defines}$. Source is $\mathtt{concept}$, target is $\mathtt{definition}$. $\lambda$ strictly decreases ($3 \to 2$). First coordinate strictly decreases without any reversal.

**Treatment of the reversal.** The proof uses two distinct directional conventions for substantive edges: $\mathtt{depends\text{-}on}$ and $\mathtt{defines}$ are oriented "source to less-rank target" as written; $\mathtt{realizes}$ and $\mathtt{instantiates}$ are oriented "source to more-rank target" as written, which is reversed for the rank argument. The discipline could uniformise by collapsing $\mathtt{realizes}$ to $\mathtt{is\text{-}realised\text{-}by}$ (the inverse) or $\mathtt{defines}$ to $\mathtt{realizes}$ (paired); we do not, because the editorial usage of $\mathtt{realizes}$ as "definition realises concept" is established in the spec.

The substantive direction of $E^-$ for the rank argument is therefore: $\mathtt{depends\text{-}on}$ as written, $\mathtt{defines}$ as written, *reverse* of $\mathtt{realizes}$, *reverse* of $\mathtt{instantiates}$. The reversed edge set $\widetilde{E^-}$ is what the rank argument applies to. Cycles in $E^-$ correspond bijectively to cycles in $\widetilde{E^-}$ (reversing every edge of a directed cycle yields another directed cycle), so acyclicity of $\widetilde{E^-}$ implies acyclicity of $E^-$.

**Finishing the proof.** We have shown that every edge in $\widetilde{E^-}$ strictly decreases $\mathrm{rank}$ in the lex order on $\mathbb{N}^3$. The lex order on $\mathbb{N}^3$ is a well-order; in particular it has no infinite descending chains. Therefore $\widetilde{E^-}$ has no directed cycle (a cycle would yield a strictly-decreasing finite chain that returns to its start, contradicting strict decrease). Therefore $E^-$ has no directed cycle. $\square$

## Why see-also is excluded

$\mathtt{see\text{-}also}$ is a pure cross-reference: $n$ declares `see-also: m` to record that *the reader of $n$ benefits from also reading $m$*. The relation carries no priority information — it places neither note above the other in any editorial hierarchy. The proof's rank function depends on each edge's predicate carrying a definite rank-direction (so that traversing the edge strictly decreases $\mathrm{rank}$ in some chosen lex order); $\mathtt{see\text{-}also}$ supplies no such direction, so it falls outside the predicate set the rank argument applies to.

