---
type: morphism
class: rule-morphism
symbol: "\\alpha_{\\Sigma_1}^{\\Sigma_2}"
depends-on: [step-n-substitution-rule, step-n-substitution-recurrence]
---

# Alphabet-extension morphism

The morphism between step-$n$ substitution rules over different-but-related alphabets at the same step depth $n$. Companion to the [step-shift morphism](step-shift-morphism.md): where step-shift is the "vertical" morphism increasing $n$, alphabet-extension is the "horizontal" morphism varying the substitution structure within fixed $n$.

## Definition

Let $\Sigma_1, \Sigma_2$ be alphabets of the same cardinality $n$, with an injection $\iota : \Sigma_1 \hookrightarrow \Sigma_2$ extending one alphabet to another. For step-$n$ substitution rules $\mathcal{S}_1$ on $\Sigma_1$ and $\mathcal{S}_2$ on $\Sigma_2$ such that $\mathcal{S}_2|_{\iota(\Sigma_1)} = \iota_* \mathcal{S}_1$ (the restriction of $\mathcal{S}_2$'s substitution matrix to the $\Sigma_1$-part agrees with $\iota$ applied to $\mathcal{S}_1$'s matrix), the **alphabet-extension morphism**

$$\alpha_{\Sigma_1}^{\Sigma_2} : \mathcal{S}_1 \to \mathcal{S}_2$$

is the corresponding rule-morphism.

## Concrete examples

- **Fibonacci → Thue-Morse:** Both step-2; alphabets both $\{a, b\}$. Different substitution matrices ($\begin{pmatrix} 1 & 1 \\ 1 & 0 \end{pmatrix}$ vs $\begin{pmatrix} 1 & 1 \\ 1 & 1 \end{pmatrix}$). No alphabet-extension morphism connects them — they're distinct points in $\mathscr{M}^{(2)}$.
- **Padovan → Tribonacci:** Both step-3; alphabets both $\{a, b, c\}$. Different matrices. Again, no alphabet-extension morphism connects them.

The alphabet-extension morphism only exists when one rule is *literally* the restriction of another — the morphism captures sub-substitution-rule-of relationships, not arbitrary "morally similar" connections.

## Where alphabet-extension does work

The alphabet-extension morphism is meaningful between:

- A 2-letter substitution and its embedding into a 3-letter substitution that has the 2-letter as a sub-system.
- The "$n$-letter constant-substitution" $\sigma : a_i \mapsto a_i$ for all $i$ — this trivial rule embeds via alphabet-extension as $n$ varies (same matrix structure, just more letters).

For non-trivial substitutions, alphabet-extension morphisms are sparse — most distinct $n$-letter substitutions don't sub-embed into each other.

## Position in predication categories

The "horizontal" sibling to step-shift: where step-shift moves up the step-$n$ hierarchy, alphabet-extension moves laterally within the same $n$. Together, the two morphisms give the step-$n$ family a 2-dimensional structural lattice:

- *Vertical* (step-shift): $\mathscr{M}^{(n)} \to \mathscr{M}^{(n+1)}$.
- *Horizontal* (alphabet-extension): within each $\mathscr{M}^{(n)}$, sparse morphisms between specific rule-pairs.

The full structural picture of the step-$n$ family requires both morphisms; the [step-shift functoriality theorem](../theorems/step-shift-functoriality-theorem.md) (forthcoming) establishes the vertical structure.
