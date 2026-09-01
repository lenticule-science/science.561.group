---

name: fixed-fiber
description: "Object: the fixed fiber — at each history t, the sub-Heyting-algebra H_t^* of propositions fixed by both the saturation and transfer nuclei; the image of the joint projection π_t."
---

### Definition — The Fixed Fiber {#fixed-fiber}

The **fixed fiber** at $t$ is the sub-Heyting-algebra of $H_t$ consisting of elements fixed by both nuclei:
$$
H_t^{\ast} \;:=\;
\{\, a \in H_t \mid \sigma_t(a) = a \text{ and } \Delta_t(a) = a \,\}.
$$

By standard nucleus theory (see Johnstone, *Stone Spaces* §II.2.2), the fixed-point set
of any nucleus on a Heyting algebra is itself a Heyting algebra — specifically the
quotient $H_t/\sigma_t$, where meets are inherited and the join of $a,b$ is
$\sigma_t(a \vee_t b)$. Since $\sigma_t$ and $\Delta_t$ commute, the intersection
$H_t^\ast = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$ is closed under meets
and implication, hence is a sub-Heyting-algebra of $H_t$. In particular $H_t^\ast$ is
nonempty (it contains $\top_t$).

> **Remark — Stability is not classicality.** {#fixed-fiber-not-boolean}
> $H_t^*$ is a Heyting algebra, not a Boolean algebra. Double quiescence — being fixed by
> both $\sigma_t$ and $\Delta_t$ — does not force the excluded middle. An element
> $a \in H_t^*$ is epistemically *stable*: neither the accumulated past ($\sigma_t$) nor
> any possible future extension ($\Delta_t$) will push $a$ further. But stability means the
> settling process has terminated, not that every proposition is classically determined.
> Two doubly quiescent elements $a, \neg a \in H_t^*$ can coexist without $a \vee \neg a
> = \top_t$. The quiescence of $H_t^*$ is intuitionistic equilibrium, not Boolean collapse.
