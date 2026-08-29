---
id: closure-operator
name: ClosureOperator
description: "Operator: Closure Operator U_G"
defines: ClosureOperator
---

### Definition — Closure Operator $U_G$ {#closure-operator}

Define
$$
U_G \;:\; P(\mathrm{Obj}(R)) \longrightarrow P(\mathrm{Obj}(R)).
$$
For each subclass $X \subseteq \mathrm{Obj}(R)$, the subclass $U_G(X)$ is the **smallest** subclass
satisfying all of the following:

1. **Contains $X$ and the atoms.** $X \subseteq U_G(X)$ and $A \subseteq U_G(X)$.

2. **Closed under isomorphism.** If $A \in U_G(X)$ and $B \cong A$ in $R$, then $B \in U_G(X)$.

3. **Closed under finite limits and small colimits.** Products, equalizers, pullbacks, and all small
   colimits (filtered colimits, coproducts, coequalizers) of objects in $U_G(X)$ lie in $U_G(X)$.

4. **Closed under exponentials.** If $A, B \in U_G(X)$, then $B^A \in U_G(X)$.

5. **Closed under subobjects.** If $A \in U_G(X)$ and $S \hookrightarrow A$ is a subobject in $R$,
   then $S \in U_G(X)$.

6. **Closed under the structural operations $\mathcal{F}$.** Whenever an operation in $\mathcal{F}$
   (the Axiom of Generative Basis) is applied to inputs in $U_G(X)$, the result lies in $U_G(X)$.

7. **Closed under sheaf gluing and profile restriction.** Objects obtained by restricting along a
   profile site or by gluing along a covering family lie in $U_G(X)$.

Equivalently, $U_G(X)$ is the intersection of all subclasses $Y \supseteq X \cup A$ satisfying
conditions (2)–(7). This intersection is uniquely determined.
