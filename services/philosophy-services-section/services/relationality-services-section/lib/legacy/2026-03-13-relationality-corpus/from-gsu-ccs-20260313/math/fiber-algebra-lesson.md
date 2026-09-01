---

name: fiber-algebra-lesson
description: "Lesson: Introduction to: Fiber Algebras"
---

### Definition — Lesson — Fiber Algebras

**What a fiber algebra is.** At each history $t \in T$ there is a finite Heyting algebra $H_t$ — the algebra of propositions about what is true at history $t$. This much comes from §fiber. The fiber doctrine goes further: it equips each $H_t$ with *two* nucleus operators, $\sigma_t$ and $\Delta_t$, that together constitute the algebraic engine of the entire framework.

$\sigma_t$ is the **saturation nucleus** — the Being pole. It sends a proposition $a$ to the smallest proposition that is already backward-stable: settled by all of $t$'s history. $\Delta_t$ is the **transfer nucleus** — the Becoming pole. It sends $a$ to the smallest proposition that is forward-committed: active under all extensions of $t$.

The two nuclei are not independent. The **commutativity condition** $\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$ is not automatic for arbitrary nucleus pairs — it is an axiom, and it is the single most load-bearing condition in the framework. Without it, the joint projection $\pi_t := \sigma_t \circ \Delta_t$ would not be a nucleus, the fixed fiber $H_t^* = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$ would not be a retract, and the nuclear quartet would not close.

**The nuclear square.** The four objects $(H_t,\; \mathrm{Fix}(\sigma_t),\; \mathrm{Fix}(\Delta_t),\; H_t^*)$ and the maps between them form the **nuclear quartet** at the fiber level: the saturation-stable propositions, the transfer-stable propositions, and their intersection $H_t^*$ — the doubly-stable, fully quiescent layer. Every proposition in $H_t$ is carried by $\pi_t$ into $H_t^*$; nothing in $H_t^*$ moves further. This is the within-fiber instance of the universal quiescence phenomenon (§universal-quiescence).

**The presheaf condition.** The fibers are not independent — they are connected by restriction maps $H(f) : H_{t'} \to H_t$ for each prefix extension $t \leq t'$, and these maps must commute with both nuclei. This naturality condition is what makes the fiber algebras a *sheaf* of nuclear Heyting algebras, not just a family of them. It is also what makes the restriction maps automatically intertwine the fixed fibers: $H(f)$ carries $H_{t'}^*$ into $H_t^*$.

**Why this axiom comes first.** The fiber nuclear square is the ground-level instance of the pattern that runs through the entire paper. At the fiber level: $(H_t, \sigma_t, \Delta_t, H_t^*)$. At the universe level: $(R, \sigma, \Delta, R^*)$ where $\sigma, \Delta$ are the sheafified nuclei. At the hyperverse level: $(\mathcal{H}, \sigma^\mathcal{H}, \Delta^\mathcal{H}, \mathcal{H}^*)$ where — by the fixed-point theorem (§hyperverse-fixed-point) — $\sigma^\mathcal{H} = \Delta^\mathcal{H} = \mathrm{id}$ and $\mathcal{H}^* = \mathcal{H}$. Every subsequent construction is an elaboration of this shape. Understanding the fiber nuclear square is understanding the whole.
