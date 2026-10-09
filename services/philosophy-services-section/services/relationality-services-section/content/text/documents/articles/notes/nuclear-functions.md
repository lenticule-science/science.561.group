---
title: "Nuclear Functions"
description: "How functions behave in the relational universe — the naturality condition, nuclear intertwining, and the distinction between functions that preserve settlement and those that do not."
examines: function, operation
setting: relational-universe
date-created: 2026-03-29
register: formal-applied
---

In the relational universe $R = \mathbf{Sh}(T, J)$, a function between presheaves $f : A \Rightarrow B$ is a natural transformation — a family of fiber-level maps $f_t : A(t) \to B(t)$ indexed by histories $t \in T$, satisfying the naturality condition: for every morphism $g : t' \to t$ in $T$,

$$f_{t'} \circ A(g) = B(g) \circ f_t$$

Restricting an element from $t$ to $t'$ and then applying $f$ gives the same result as applying $f$ first and then restricting. A family of maps that fails naturality is path-dependent — it depends on which history is used to observe the element. Such a family is not a function between presheaves; it is an inconsistent collection of local maps.

## Nuclear functions

A function $f : A \Rightarrow B$ is a **nuclear function** (a morphism in $\mathbf{HA}_\mathrm{nucl}$) iff it intertwines with both nuclei at every fiber:

$$f_t \circ \sigma_t^A = \sigma_t^B \circ f_t \qquad \text{and} \qquad f_t \circ \Delta_t^A = \Delta_t^B \circ f_t$$

Nuclear functions preserve the doubly-stable fiber: if $a \in H^*_t(A)$, then $f_t(a) \in H^*_t(B)$. General functions do not have this property — a non-nuclear function may send a settled element to an unsettled one.

The restriction maps $H(g) : H_t \to H_{t'}$ are nuclear by construction. They are morphisms in $\mathbf{HA}_\mathrm{nucl}$ because the fiber doctrine $H : T^{\mathrm{op}} \to \mathbf{HA}_\mathrm{nucl}$ lands in the category of nuclear Heyting algebras by definition.

## Function versus operation in the relational universe

| Structure | Type | Direction | Nuclear? |
|---|---|---|---|
| $\sigma_t$ (saturation) | Operation: $H_t \to H_t$ | Within $H_t$ | Yes — it IS the nucleus |
| $\Delta_t$ (transfer) | Operation: $H_t \to H_t$ | Within $H_t$ | Yes — it IS the nucleus |
| Restriction $H(g)$ | Function: $H_t \to H_{t'}$ | Backward along $g$ | Yes — morphism in $\mathbf{HA}_\mathrm{nucl}$ |
| Natural transformation $f : A \Rightarrow B$ | Function: $A \to B$ | Fiberwise, coherent | Only if nuclear |
| Identity $\mathrm{id}_A$ | Function: $A \to A$ | Self | Yes — trivially |

## The telos map as universal nuclear function

The telos map $\pi_t^A : A(t) \to H^*_t(A)$ defined by $\pi_t^A(a) = \sigma_t^A(\Delta_t^A(a))$ is a nuclear function. For any nuclear function $f_t : A(t) \to B(t)$ and any $a \in A(t)$:

$$\pi_t^B(f_t(a)) = f_t(\pi_t^A(a))$$

Nuclear functions commute with telos maps. Non-nuclear functions break this commutation — they do not respect the settlement structure.

## Composition

The composition of two nuclear functions is nuclear. Given nuclear $f : A \Rightarrow B$ and $g : B \Rightarrow C$, the composition $(g \circ f)$ intertwines with both nuclei because each component does:

$$(g \circ f) \circ \sigma_t^A = g \circ (\sigma_t^B \circ f) = (\sigma_t^C \circ g) \circ f = \sigma_t^C \circ (g \circ f)$$

## Open questions

- Whether every function in $R$ can be factored through a nuclear function via a canonical nuclear approximation $f^{\mathrm{nucl}}_t(a) = \pi_t^B(f_t(a))$.
- Whether the category of nuclear functions on $R$ is a full subcategory closed under limits, colimits, and exponentials.
- Whether there is a meaningful notion of "gap-preserving function" strictly weaker than nuclearity.
- Whether $\sigma$ and $\Delta$ can correct a non-natural family of fiber maps into a natural transformation.
- Whether the nuclear functions form a sub-presheaf $[A, B]_{\mathrm{nucl}} \hookrightarrow B^A$ in a well-behaved subcategory.
