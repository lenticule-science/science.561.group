---
type: theorem
status: proved
depends-on: [four-symmetric-evidence-difference, four-bilattice, predication-valuation]
see-also: [commutation-defect, predicatory-equalization]
---

# FOUR symmetric evidence difference detects equality

For $\mathbf{FOUR}$-valued predication valuations $v,w$,

$$\delta^{\oplus}_k(v,w)=\bot \quad\text{iff}\quad v=w.$$

## Proof

It is enough to prove the cellwise statement. Write $q=\langle q_+,q_- \rangle$ and $r=\langle r_+,r_- \rangle$ in $\mathbf{2}^{\bowtie}$. By definition,

$$\delta^{\oplus}_k(q,r)=\langle q_+ \oplus r_+,\; q_- \oplus r_- \rangle.$$

This value is $\bot=\langle 0,0\rangle$ iff

$$q_+ \oplus r_+ = 0
\quad\text{and}\quad
q_- \oplus r_- = 0.$$

In the Boolean lattice, $a \oplus b=0$ iff $a=b$. Hence the two displayed equations hold iff $q_+=r_+$ and $q_-=r_-$, which is exactly $q=r$.

Applying this argument at every predication cell $\phi$ gives $\delta^{\oplus}_k(v,w)=\bot$ iff $v(\phi)=w(\phi)$ for every $\phi$, i.e. iff $v=w$. $\square$

## Consequence

On $\mathbf{FOUR}$, a calculator can test exact equality of two predication-valued outputs without quotienting the comparison to a Boolean too early: the zero/nonzero test is Boolean, but the nonzero witness remains bilattice-valued.
