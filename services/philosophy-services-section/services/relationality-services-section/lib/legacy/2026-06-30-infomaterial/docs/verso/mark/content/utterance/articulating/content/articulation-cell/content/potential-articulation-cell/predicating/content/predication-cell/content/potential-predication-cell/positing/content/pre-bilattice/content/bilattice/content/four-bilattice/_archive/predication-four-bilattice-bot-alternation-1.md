---
kind: theorem
status: proved
depends-on: [four-bilattice, twist-product-fusion, twist-product-right-residual]
---

# $\bot$-alternation oscillation on $\mathbf{FOUR}$

The alternating iteration $x_{n+1} = \bot \odot x_n$ if $n$ is even, $x_{n+1} = \bot \Rightarrow x_n$ if $n$ is odd, starting from $x_0 = \bot$, produces the period-2 orbit

$$\bot \to \mathbf{f} \to \bot \to \mathbf{f} \to \cdots$$

in [$\mathbf{FOUR}$](../objects/four-bilattice.md). All other alternating dynamics between [twist-product fusion](../morphisms/twist-product-fusion.md) $\odot$ and [twist-product right residual](../morphisms/twist-product-right-residual.md) $\Rightarrow$ with a fixed operand $a \neq \bot$ converge.

## Proof

Direct computation. Using $\bot = \langle 0, 0 \rangle$ and $\mathbf{f} = \langle 0, 1 \rangle$:

- $\bot \odot \bot = \langle 0 \cdot 0,\ (0 \to 0) \wedge (0 \to 0) \rangle = \langle 0, 1 \rangle = \mathbf{f}$.
- $\bot \Rightarrow \mathbf{f} = \langle (0 \to 0) \wedge (1 \to 0),\ 0 \cdot 1 \rangle = \langle 1 \wedge 0,\ 0 \rangle = \langle 0, 0 \rangle = \bot$.

The alternation $\bot \odot, \bot \Rightarrow, \bot \odot, \ldots$ starting at $\bot$ produces $\bot \to \mathbf{f} \to \bot \to \mathbf{f} \to \cdots$, period 2. For a fixed operand $a \neq \bot$, case analysis on $a \in \{\mathbf{t}, \mathbf{f}, \top\}$ shows every alternating orbit converges in at most 2 steps. $\square$

## Remark

The $\bot$-alternation is the only genuinely oscillatory behavior in the finite alternating-residuation dynamics on $\mathbf{FOUR}$. The computation $\bot \odot \bot = \mathbf{f}$ is structural — forced by the twist-product formula's $0 \to 0 = 1$ in the second coordinate — rather than semantically natural; treating the $\bot$-sub-algebra as a boundary case is consistent with the fact that $\bot$-cells are precisely the ones [closure](../morphisms/closure-operator.md) eliminates when their inference-derivable values appear at [quiescence](../concepts/settling-quiescence.md).
