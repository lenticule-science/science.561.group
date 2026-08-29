---
type: term
term-kind: concept
class: syntactic-role
status: current
depends-on: [variable]
---

# Binder

*A binder* is a syntactic construct that introduces a [variable](./variable.md) and delimits its scope. The canonical binder of type theory is the λ-abstraction $\lambda x.\,M$, which introduces $x$ as a variable bound in the body $M$. Dependent type theory adds two more: the Π-binder $\Pi(x : A).\,B(x)$ in [pi-types](./pi-type.md) and the Σ-binder $\Sigma(x : A).\,B(x)$ in [sigma-types](./sigma-type.md). Each makes the bound variable visible inside its body and invisible outside.

A binder produces a *scope* — the syntactic region in which the introduced variable is in force. Scopes nest. Inner binders *shadow* outer binders that introduce the same name: in $\lambda x.\,(\lambda x.\,x)$, the inner $x$ refers to the inner binder.

## Position

Binders are what make [substitution](./substitution.md) and [alpha-equivalence](./alpha-equivalence.md) non-trivial: substitution must avoid capturing variables under inner binders, and the names of bound variables are interchangeable. The [typing-judgment](./typing-judgment.md) for a binder discharges an assumption from the [typing-context](./typing-context.md) — the abstraction rule for $\lambda$ moves $x : A$ from $\Gamma$ into the binder. Reference: [Barendregt 1984](../../documents/articles/bibliographies/barendregt1984.md) §1.2, [Pierce 2002](../../documents/articles/bibliographies/pierce2002.md) §5.3.
