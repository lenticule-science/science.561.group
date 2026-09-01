---
term-kind: concept
class: rewrite-rule
status: current
depends-on: [variable, binder, substitution]
---

# Beta-reduction

*Beta-reduction* is the one computation rule shared by every λ-calculus: when a [binder](./binder.md) is applied to an argument, replace the bound variable in the body with the argument, capture-avoidingly.

$$
(\lambda x.\,M)\;N \;\longrightarrow_\beta\; M[N/x]
$$

The redex on the left, $(\lambda x.\,M)\;N$, is reduced by the [substitution](./substitution.md) on the right. A term is in *beta-normal form* if it contains no β-redex. The reflexive, transitive, symmetric closure of $\to_\beta$ is *beta-equivalence*, written $=_\beta$.

## Position

Beta-reduction is the operational substrate of the entire theory: it is what [normalization](./normalization.md) normalizes, what [confluence](./confluence.md) is confluent under (the [church-rosser](../../documents/articles/research-articles/church-rosser.md) theorem), and what [strong-normalization-stlc](../../documents/articles/research-articles/strong-normalization-stlc.md) bounds. Under the [curry-howard-correspondence](../../documents/articles/research-articles/curry-howard-correspondence.md), β-reduction is precisely *proof normalization*: simplifying a derivation by eliminating cuts. The corresponding operator note is [beta-reduction-step](./beta-reduction-step.md). Reference: [Barendregt 1984](../../documents/articles/bibliographies/barendregt1984.md) §3.1, [Pierce 2002](../../documents/articles/bibliographies/pierce2002.md) §5.3.
