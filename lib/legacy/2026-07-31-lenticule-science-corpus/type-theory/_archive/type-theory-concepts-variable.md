---
type: concept
class: syntactic-role
status: current
depends-on: []
---

# Variable

*A variable* is a name that stands for a value but does not yet specify which value. In type theory, variables are the primitive syntactic atoms of every term language: every [lambda-term](../objects/lambda-term.md) is built from variables, [binders](binder.md), and applications. A variable carries no internal structure — it is just a name drawn from a countably infinite supply.

A variable occurrence is *bound* if it lies inside the scope of a [binder](binder.md) introducing the same name, and *free* otherwise. The set of free variables of a term $M$ is written $\mathrm{FV}(M)$ and is computed structurally: $\mathrm{FV}(x) = \{x\}$, $\mathrm{FV}(M\;N) = \mathrm{FV}(M) \cup \mathrm{FV}(N)$, $\mathrm{FV}(\lambda x.\,M) = \mathrm{FV}(M) \setminus \{x\}$. Only free occurrences participate in [substitution](substitution.md); only [alpha-equivalence](alpha-equivalence.md) makes the choice of bound-variable name irrelevant.

## Position

Variables are the simplest syntactic role and the precondition for every other concept here: a [typing-judgment](typing-judgment.md) $\Gamma \vdash x : A$ assigns a type to a variable, a [typing-context](typing-context.md) is a finite list of variable-type pairs, and [beta-reduction](beta-reduction.md) is defined by substituting a term for free occurrences of a variable. Reference: [Barendregt 1984](references/barendregt1984.md) §1.1, [Pierce 2002](references/pierce2002.md) Ch. 5.
