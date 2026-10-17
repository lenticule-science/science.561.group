---
kind: reference
year: 1958
title: "The Mathematics of Sentence Structure"
venue: "American Mathematical Monthly 65(3), 154–170"
---

## Full citation

J. Lambek. "The Mathematics of Sentence Structure." *American Mathematical Monthly* 65(3), 154–170, 1958. JSTOR: <https://www.jstor.org/stable/2310058>.

## Status

Read locally; PDF at `sources/lambek1958.pdf` (18 pp).

## Annotation

The founding paper of categorial grammar. Lambek's "syntactic calculus" introduces primitive types $s$ (sentence) and $n$ (noun) and compound types $x/y$ (right-residual: needs a $y$ on the right to give an $x$), $y \backslash x$ (left-residual), and $x \cdot y$ (product). The central residuation laws

$$xy \to z \iff x \to z/y \iff y \to x \backslash z$$

are proved as the core inference rules of a Gentzen-style sequent calculus.

Lambek uses "$\to$" for calculus-derivability; $/$ and $\backslash$ for the right and left residuals; $\cdot$ for the product. The non-commutativity of $\cdot$ is what gives the two distinct residuals; under commutativity (as in our twist-product setting) they collapse into a single $\Rightarrow$.

For our program this is the original source of *predication-as-residuation*: a predicate $P$ takes its subject and object via a residuated combination, and the two residuals correspond to "what does $P$ require of its subject given the object?" and dually for the object. The instantiation on $\mathbf{L}^\bowtie$ via Busaniche–Cignoli / Chajda–Länger residuation is the algebraic descendant.
