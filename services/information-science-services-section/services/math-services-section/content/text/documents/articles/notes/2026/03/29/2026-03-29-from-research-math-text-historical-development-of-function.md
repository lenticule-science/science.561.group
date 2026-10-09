---
title: "Historical Development of the Function Concept"
type: "page"
date-created: 2026-03-29
description: How the concept of function developed from Dedekind's Abbildung through Frege, Church, and Eilenberg-Mac Lane.
---

How the concept of function developed from Dedekind's Abbildung through Frege, Church, and Eilenberg-Mac Lane.

## Dedekind&rsquo;s Abbildung

Dedekind introduced the notion of an *Abbildung* (mapping or image-making) in &ldquo;Was sind und was sollen die Zahlen?&rdquo; (1888). An Abbildung is a law $\phi$ that assigns to each element $s$ of a set $S$ a definite element $\phi(s)$ of a set S′S&#x27;. The defining conditions are totality (every $s$ has an image) and functionality (the image is uniquely determined). Dedekind observed that the identity mapping and the composition of mappings are again mappings, and that mappings are the primary tool for establishing correspondences between mathematical structures. The Dedekind Abbildung is the direct ancestor of the category-theoretic morphism.

## Frege&rsquo;s concept/object distinction

Frege drew a sharp line between *concepts* (functions mapping objects to truth-values — &ldquo;unsaturated,&rdquo; needing an argument) and *objects* (self-complete entities) in &ldquo;Über Begriff und Gegenstand&rdquo; (1892). A function is unsaturated: f(−)f(-) has a gap that must be filled by an argument to yield a value. The notation $f : A \to B$ captures this: $f$ is not itself an element of $B$ — it is a rule waiting for an input. This distinction underlies the type-theoretic treatment: a function of type $A \to B$ is not the same kind of thing as an element of $B$, even though function application f(a)f(a) produces an element of $B$.

## Church&rsquo;s lambda calculus

In &ldquo;A Formulation of the Simple Theory of Types&rdquo; (1940), Church gave functions a computational identity. A function $f : A \to B$ is a $\lambda$-term λxA. tB\lambda x^A.\, t^B — a rule that binds a variable $x$ of type $A$ and computes $t$ of type $B$. Function application f(a)=(λx. t)(a)=t[x:=a]f(a) = (\lambda x.\, t)(a) = t[x := a] is the $\beta$-reduction rule. The $\lambda$-calculus says: a function is exactly its reduction rule, nothing more.

## Eilenberg and Mac Lane on natural transformations

&ldquo;General Theory of Natural Equivalences&rdquo; (*Transactions of the AMS*, 1945) — the paper that introduced category theory — defines natural transformation as a mapping of one functor into another. A natural transformation $\eta : F \Rightarrow G$ is a morphism in the functor category [C,D][C, D] — a function at the level of functors. The naturality square $\eta_B \circ F(f) = G(f) \circ \eta_A$ is the condition that makes the transformation independent of the choice of morphism $f$. Mac Lane later wrote: &ldquo;I didn&rsquo;t invent categories to study functors; I invented them to study natural transformations.&rdquo;

## The thread

Dedekind established that a function is a total, deterministic assignment. Frege showed that a function is unsaturated — it is not a thing but a rule with a gap. Church showed that the gap IS the function — its computational identity is its reduction behavior. Eilenberg and Mac Lane showed that functions between structured objects must respect that structure — naturality. Each step adds a constraint to what &ldquo;function&rdquo; means without discarding what came before.
