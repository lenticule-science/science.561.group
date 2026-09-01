---
id: closure-operator-monotonicity
name: ClosureOperatorMonotonicity
description: "Monotonicity of U_G"
---

### Lemma — Monotonicity of $U_G$ {#closure-operator-monotonicity}

For all subclasses $X, Y \subseteq \mathrm{Obj}(R)$:

1. **Monotonicity.** If $X \subseteq Y$, then $U_G(X) \subseteq U_G(Y)$.
2. **Inflationarity.** $X \subseteq U_G(X)$.

**Proof.** Inflationarity is built into the definition. For monotonicity: any subclass $Z$ closed
under (2)–(7) and containing $Y \cup A$ also contains $X \cup A$, so the intersection for $X$ is
contained in the intersection for $Y$. $\square$
