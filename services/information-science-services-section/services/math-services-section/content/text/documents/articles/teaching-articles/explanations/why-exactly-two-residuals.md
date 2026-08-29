---

title: "Why Exactly Two Residuals?"
description: "A product has two argument positions. Each position generates one residual. This is why predicates decompose into extending and restricting — and why there is no third mode."
date-created: 2026-03-31
requires:
  - binary-operation
teaches:
  - residuated-lattice
  - lambek-calculus
type: explanation

---

When you multiply two numbers, the product has two inputs: $a \times b$. If you know the product is at most $c$ and you know one of the inputs, you can ask what the other input must have been.

"Given $a$ and that $a \times b \leq c$, what can $b$ be?" This is division: $b \leq c / a$.

"Given $b$ and that $a \times b \leq c$, what can $a$ be?" This is also division: $a \leq c / b$.

For numbers, these are the same operation (division is commutative). But for non-commutative operations — like function composition, or word concatenation, or predicate-argument combination — the two questions have different answers. "What goes on the left?" and "what goes on the right?" are genuinely different questions.

These two questions generate two **residuals**:

$$a \cdot b \leq c \quad\text{iff}\quad b \leq a \backslash c \quad\text{iff}\quad a \leq c / b$$

The left residual $a \backslash c$: "what must go on the right of $a$ to stay below $c$?"
The right residual $c / b$: "what must go on the left of $b$ to stay below $c$?"

There are exactly two because the product $a \cdot b$ has exactly two argument positions: left and right. A ternary operation would have three residuals. A unary operation would have one (or zero). But a [binary operation](../../../../glossary/terms/binary-operation.md) — which is what combination IS — has two.

Lambek (1958) proved this for predicate-argument combination in natural language. A verb takes a subject and an object. These are its two argument positions. The two residuals are the two ways the verb can interact with its arguments: it can extend forward to consume the object (right residual $/$ ), or an argument can restrict backward to satisfy the verb's requirements (left residual $\backslash$).

Lawvere (1969) found the same structure in logic: existential quantification $\exists$ (extends a predicate outward) and universal quantification $\forall$ (restricts a predicate inward) are the two residuals of substitution. Two, because substitution has two sides: "substituting into a predicate" and "substituting from a context."

When the product is [commutative](../../../../glossary/terms/commutativity.md) ($a \cdot b = b \cdot a$), the two residuals collapse into one: $a \backslash c = c / a$. But even then, the [adjunction](../../../../glossary/terms/adjoint-pair.md) has two SIDES — the product side (combining, generating, extending) and the implication side (testing, constraining, restricting). The two modes of interaction persist even when they share a single formal operation.

This is not a classification we impose. It is a consequence of the fact that combination takes two inputs. Two inputs, two residuals, two modes. Extending and restricting.
