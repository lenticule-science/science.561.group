---
type: concept
class: derived-content
status: stable
depends-on: [formal-context, intent-extent-duality]
see-also: [implication-base, basic-theorem-of-fca]
title: Attribute implication
description: The propositional content the FCA lineage extracts from a formal context, beyond the concept lattice itself.
---

# Attribute implication

The propositional content the FCA lineage extracts from a formal context, beyond the concept lattice itself. An **attribute implication** in a context $(G, M, I)$ is a pair $B_1 \to B_2$ with $B_1, B_2 \subseteq M$, read "every object bearing all attributes in $B_1$ also bears all attributes in $B_2$." The implication *holds in the context* iff $B_2 \subseteq B_1''$ (where $({-})''$ is the closure on $\mathcal{P}(M)$ from [intent-extent-duality](intent-extent-duality.md)) — equivalently, iff $B_1' \subseteq B_2'$.

Attribute implications are how an FCA-shaped knowledge system carries propositional content. The concept lattice is the system's *structural* invariant; the implications are its *propositional* invariant. Together they are what the system "knows" about the relationship between the attributes in $M$.

## The implication theory of a context

The set $\mathrm{Imp}(G, M, I) := \{B_1 \to B_2 \mid B_2 \subseteq B_1''\}$ of all implications holding in the context is closed under the Armstrong rules:

- **Reflexivity.** $B_1 \supseteq B_2 \implies B_1 \to B_2$.
- **Augmentation.** $B_1 \to B_2 \implies B_1 \cup B_3 \to B_2 \cup B_3$.
- **Transitivity.** $B_1 \to B_2$ and $B_2 \to B_3 \implies B_1 \to B_3$.

Armstrong (1974) showed these rules are sound and complete for the implication theory of any binary relation, so $\mathrm{Imp}(G, M, I)$ is exactly the deductive closure of any of its bases under Armstrong's rules.

## The Duquenne–Guigues base

Among the (typically infinitely many) implication bases of a context, one is canonical: the **Duquenne–Guigues base** (Duquenne & Guigues 1986) consisting of implications $P \to P''$ for $P$ ranging over the *pseudo-intents* of the context — sets that are closed under all implications with smaller pseudo-intent premise but not closed under the full closure operator. The Duquenne–Guigues base is minimum in cardinality among all bases of $\mathrm{Imp}(G, M, I)$ and is unique up to renaming.

The base is what attribute exploration (Ganter 1984) computes interactively: the algorithm walks the pseudo-intents in order, posing each candidate implication to a domain expert who either confirms it (whence it joins the base) or rejects it by supplying a counterexample object (which is added to $G$, refining the context). Attribute exploration is the FCA lineage's contribution to the *interactive knowledge acquisition* problem.

## Implication base as predication content

Read against the predicated framing: an implication $B_1 \to B_2$ in the FCA substrate corresponds to a [closure rule](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule.md) on the predicated substrate of the form

$$
\bigwedge_{m \in B_1} \mathrm{has\text{-}attribute}(g, m) \;\Rightarrow\; \bigwedge_{m \in B_2} \mathrm{has\text{-}attribute}(g, m).
$$

The Duquenne–Guigues base is, in predicated language, a *minimal closure-rule system* generating the same Galois closure as the full implication theory. The FCA lineage's attribute exploration is, in predicated language, the interactive elicitation of a closure-rule system from a domain expert.
