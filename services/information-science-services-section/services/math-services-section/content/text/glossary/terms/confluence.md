---
term-kind: concept
class: rewriting-property
status: current
depends-on: [beta-reduction]
---

# Confluence

*Confluence* (also called the *Church-Rosser property*) is the property of a rewriting system that any two reductions of the same term can be brought back together. Formally, $\to$ is confluent iff whenever $M \to^* M_1$ and $M \to^* M_2$, there exists $M'$ with $M_1 \to^* M'$ and $M_2 \to^* M'$.

For the [untyped-lambda-calculus](./untyped-lambda-calculus.md) under [beta-reduction](./beta-reduction.md), confluence is the [church-rosser](../../documents/articles/research-articles/church-rosser.md) theorem. Its immediate corollary is that [beta-normal forms](./normalization.md) are unique up to [alpha-equivalence](./alpha-equivalence.md): a term has at most one normal form, regardless of which reduction strategy reaches it.

## Position

Confluence is what makes the equivalence relation $=_\beta$ well-behaved: $M =_\beta N$ iff $M$ and $N$ reduce to a common term. Confluence is *independent* of [normalization](./normalization.md): the untyped calculus is confluent but not normalizing; a typed calculus is typically both. Loss of confluence usually indicates that the rewrite system is ambiguous about which redex to fire — a problem that becomes acute when adding [eta-equivalence](./eta-equivalence.md) or pattern-matching reductions. Reference: [Barendregt 1984](../../documents/articles/bibliographies/barendregt1984.md) §3.2, [Sørensen & Urzyczyn 2006](../../documents/articles/bibliographies/sorensen-urzyczyn2006.md) §1.5.
