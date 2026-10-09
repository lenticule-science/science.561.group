---
type: reference
authors: [Barwise, Jon, Seligman, Jerry]
year: 1997
title: "Information Flow: The Logic of Distributed Systems"
venue: "Cambridge Tracts in Theoretical Computer Science 44, Cambridge University Press"
description: J.
---

## Full citation

J. Barwise and J. Seligman. *Information Flow: The Logic of Distributed Systems*. Cambridge Tracts in Theoretical Computer Science 44, Cambridge University Press, 1997.

## Status

Not directly accessed; cited at training-knowledge level.

## Annotation

Develops **channel theory**, a categorical framework for information flow between **classifications**. A classification $A = \langle \mathrm{tok}(A), \mathrm{typ}(A), {\vDash_A} \rangle$ consists of tokens (instances), types (attributes), and a classification relation. An **infomorphism** $f = (f^\wedge, f^\vee)$ from $A$ to $B$ is a contravariant pair ($f^\wedge : \mathrm{typ}(A) \to \mathrm{typ}(B)$ on types, $f^\vee : \mathrm{tok}(B) \to \mathrm{tok}(A)$ on tokens) satisfying: $f^\vee(b) \vDash_A \alpha \iff b \vDash_B f^\wedge(\alpha)$. Infomorphisms are the morphisms of the category **Class** of classifications.

A **channel** is a span of infomorphisms with common core $C$; information flow from $A$ to $B$ through the channel is a constraint derivation in $C$.

Cited in the [channel-theoretic speech acts theorem](../research/2026/07/31/lenticule-import/theorems/channel-theoretic-speech-acts.md): inserting a new token-type incidence into a classification (the act of positing a new fact) is not an infomorphism in the strict sense — it changes the classification's extension without being a morphism of classifications. PredCat fills this gap by modeling positing as a minimal incidence-extension infomorphism and the closure operator as a channel, giving the full locution/illocution/perlocution structure a channel-theoretic formulation.

The classification/infomorphism duality is structurally close to the predication fibration: tokens $\leftrightarrow$ entity pairs $(s, o)$; types $\leftrightarrow$ predicates $p$; classification relation $\leftrightarrow$ truth-order value $v(p)(s, o) = \mathbf{t}$. The bilattice-valued extension adds the knowledge-order axis and the paraconsistent $\top$ that channel theory's binary $\vDash_A$ does not capture.
