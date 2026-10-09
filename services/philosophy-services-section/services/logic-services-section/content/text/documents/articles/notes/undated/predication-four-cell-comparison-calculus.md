---
type: example
instantiates: [predicatory-commutation, predicatory-confluence, predicatory-equalization, predicatory-differentiation]
depends-on: [four-bilattice, positing-morphism, confluence-join, evidence-residual, equalization-locus]
title: Four-cell comparison calculus
description: Fix one predication cell $\phi$ and the four-element bilattice $\mathbf{FOUR}$.
---

# Four-cell comparison calculus

Fix one predication cell $\phi$ and the four-element bilattice $\mathbf{FOUR}$. Start with $v(\phi)=\bot$.

## Commutation

Let $A=\mathrm{posit}_{(\phi,\mathbf{t})}$ and $D=\mathrm{posit}_{(\phi,\mathbf{f})}$. Then

$$A(D(v)) = \mathbf{f} \vee_k \mathbf{t} = \top,$$

and

$$D(A(v)) = \mathbf{t} \vee_k \mathbf{f} = \top.$$

So assertive positing and denial positing commute at the same cell. More generally, same-cell posits commute because $\vee_k$ is commutative.

## Confluence

The two one-step branches

$$v \Rightarrow A(v)=\mathbf{t}, \qquad v \Rightarrow D(v)=\mathbf{f}$$

join at

$$\nabla_k(\mathbf{t},\mathbf{f})=\mathbf{t}\vee_k\mathbf{f}=\top.$$

Operationally, the assertion branch reaches $\top$ by applying the denial posit; the denial branch reaches $\top$ by applying the assertion posit.

## Equalization

The equalization locus of $A$ and $D$ on this one-cell space is

$$\mathrm{Eq}(A,D)=\{x \mid x \vee_k \mathbf{t} = x \vee_k \mathbf{f}\}.$$

Checking the four values:

- $x=\bot$: outputs $\mathbf{t}$ and $\mathbf{f}$, not equal.
- $x=\mathbf{t}$: outputs $\mathbf{t}$ and $\top$, not equal.
- $x=\mathbf{f}$: outputs $\top$ and $\mathbf{f}$, not equal.
- $x=\top$: outputs $\top$ and $\top$, equal.

Thus $\mathrm{Eq}(A,D)=\{\top\}$. Assertion and denial agree only once the cell is already contested.

## Differentiation

The evidence residual from assertion to contestation is

$$\partial_k(\mathbf{t},\top)=\mathbf{f},$$

because the missing evidence is precisely the negative coordinate. The residual from denial to contestation is

$$\partial_k(\mathbf{f},\top)=\mathbf{t}.$$

So the calculator can distinguish "what changed" without reducing both changes to the same Boolean flag.

