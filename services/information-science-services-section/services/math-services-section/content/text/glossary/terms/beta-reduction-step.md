---
term-kind: definition
class: rewrite-step
status: current
depends-on: [beta-reduction, substitution-operator]
---

# Beta-reduction step

A **beta-reduction step** is a single application of the [beta-reduction](./beta-reduction.md) rule to a redex anywhere inside a term. The relation $M \to_\beta N$ holds whenever $N$ is obtained from $M$ by replacing one β-redex $(\lambda x.\,P)\;Q$ in $M$ with its contractum $P[Q/x]$ (using the [substitution-operator](./substitution-operator.md)).

## Definition

By the congruence rules:

- $(\lambda x.\,M)\;N \to_\beta M[N/x]$ — the basic step.
- If $M \to_\beta M'$, then $M\;N \to_\beta M'\;N$, $N\;M \to_\beta N\;M'$, and $\lambda x.\,M \to_\beta \lambda x.\,M'$.

The reflexive-transitive closure $\to_\beta^*$ relates terms by *some sequence* of β-steps; the symmetric closure $=_\beta$ is β-equivalence.

## Properties

- *Confluence* ([church-rosser](../../documents/articles/research-articles/church-rosser.md)): if $M \to_\beta^* M_1$ and $M \to_\beta^* M_2$, there is $M'$ with $M_1 \to_\beta^* M'$ and $M_2 \to_\beta^* M'$.
- *Subject reduction*: if $\Gamma \vdash M : A$ and $M \to_\beta N$, then $\Gamma \vdash N : A$ ([subject-reduction](../../documents/articles/research-articles/subject-reduction.md)).
- In STLC: every chain of β-steps terminates ([strong-normalization-stlc](../../documents/articles/research-articles/strong-normalization-stlc.md)).

## Position

The β-step is the *atomic computation* of every λ-calculus. Reduction strategies (call-by-name, call-by-value, normal-order, applicative-order) are different rules for *which* β-redex to fire next; confluence means they all agree on the result, when a result exists. Reference: [Barendregt 1984](../../documents/articles/bibliographies/barendregt1984.md) §3.1, [Pierce 2002](../../documents/articles/bibliographies/pierce2002.md) §5.3.
