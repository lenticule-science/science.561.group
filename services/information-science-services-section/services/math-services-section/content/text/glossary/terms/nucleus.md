---
name: Nucleus
description: "A closure operator on a Heyting algebra that preserves finite meets. Meet-preservation makes its fixed points a Heyting algebra in their own right; two commuting nuclei compose to a nucleus whose fixed points are the doubly stable elements. Nuclei carry an interior, a residuation through the closure, and a stable envelope."
aliases: [nuclei, nuclear, nucleate, commuting nuclei, stable envelope, dynamic residuation, j-residuation]
---
A **nucleus** on a [Heyting algebra](heyting-algebra.md) $H$ is a [closure operator](closure-operator.md) $j$ (extensive, idempotent, monotone) that preserves finite meets, $j(a \wedge b) = j(a) \wedge j(b)$ ([`Positing/NucleusAndCommutingNuclei.lean`](../../../../services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Language/Positing/NucleusAndCommutingNuclei.lean)). Meet-preservation is exactly what makes the fixed-point set $\mathrm{Fix}(j)$ inherit the full Heyting structure: it is closed under implication, not only under meet and join.

## Commuting nuclei

Two nuclei **commute** when $j_1 \circ j_2 = j_2 \circ j_1$. Their composite $\pi = j_1 \circ j_2$ is then a nucleus with $\mathrm{Fix}(\pi) = \mathrm{Fix}(j_1) \cap \mathrm{Fix}(j_2)$: extensive because each factor is, idempotent by commuting the factors past each other, meet-preserving because each factor is, and its fixed points are exactly the elements both fix. The four sub-algebras $(H, \mathrm{Fix}(j_1), \mathrm{Fix}(j_2), \mathrm{Fix}(\pi))$ form a commuting square: apply neither, $j_1$ alone, $j_2$ alone, or both.

On a fiber $H_t$ with the saturation nucleus $\sigma_t$ and the determination nucleus $\Delta_t$, the **fixed fiber** $H^\ast_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$ is the sub-Heyting algebra of doubly stable propositions, and the joint projection $\pi_t = \sigma_t \circ \Delta_t$ is the nucleus that lands there.

## Interior and stable envelope

The **$j$-interior** of $a$ is $i_j(a) = \neg j(\neg a)$: the largest element of $\mathrm{Fix}(j)$ below $a$ when $j(\bot) = \bot$. If $j(\bot) = \bot$ then $j$ fixes every negation, $j(a \Rightarrow \bot) = a \Rightarrow \bot$, since $a \wedge j(a \Rightarrow \bot) \le j(a) \wedge j(a \Rightarrow \bot) = j(\bot) = \bot$; so $i_j(a) = \neg\neg a$, independently of $j$.

The **stable envelope** of a proposition is its observable content, $\mathrm{Env}_t(a) = i_{\sigma_t}(a) \wedge i_{\Delta_t}(a) = \neg\sigma_t(\neg a) \wedge \neg\Delta_t(\neg a)$, which equals $\neg(\pi_t(\neg a))$ under the joint projection. When both nuclei fix $\bot$ and the fiber is Boolean, the envelope is the largest doubly stable proposition entailed by $a$: $\mathrm{Env}_t(a) = \max\{x \in H^\ast_t \mid x \le a\}$.

## Residuation through a nucleus

The **$j$-residuation** of $(a, b)$ is implication taken through the nucleus, the greatest $x$ with $j(a \wedge x) \le j(b)$. It satisfies the Galois connection $j(a \wedge b) \le j(c) \iff b \le j{\supset}(a, c)$, and plain implication is the case $j = \mathrm{id}$. This is dynamic residuation: implication that holds once closure has done its work, not only in the raw fiber.

## In the acts derivation

The nucleus is reached at the settling stage, where normalized observation equivalence meets normalized judgement equivalence ("nucleate"). Fixing the nucleus in a stabilized context gives its semantics; its laws are that closing absorbs meets, $x \wedge \nu(y) \le \nu(x \wedge y)$, and that the interior distributes over joins. The nucleus commutes with the [flow](flow.md), and it does not matter whether one transforms then consolidates or consolidates then transforms: that commutation is where the derivation places geometry.

## Related

- [Closure operator](closure-operator.md)
- [Settling](settling.md)
- [Flow](flow.md)
- [Heyting implication](heyting-implication.md)
