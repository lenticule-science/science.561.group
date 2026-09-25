---
type: transformer
status: active
source: Ω_Eff
target: Ω_cl ≅ 2
depends-on:
  - ../structures/eff.md
  - ../structures/four.md
see-also:
  - ../prose/learning/claims/four-is-image-of-omega-under-double-negation.md
  - ../prose/learning/claims/complexity-excludes-from-subtopos-lattice.md
references:
  - Hyland 1982
  - Lee-van Oosten 2012
---

# Double-negation nucleus

The **double-negation nucleus** is the Lawvere-Tierney topology

$$j = \neg\neg: \Omega_{\mathbf{Eff}} \to \Omega_{\mathbf{Eff}}$$

defined by the internal double negation in $\mathbf{Eff}$'s Heyting algebra: $j(P) = \neg\neg P$ for each proposition $P$.

## Nucleus conditions

$j$ satisfies the three nucleus conditions:
- **Idempotent**: $\neg\neg\neg\neg P \Leftrightarrow \neg\neg P$ in any Heyting algebra (since $\neg\neg\neg \Leftrightarrow \neg$ and $\neg\neg\neg\neg \Leftrightarrow \neg\neg$).
- **Above identity**: $P \Rightarrow \neg\neg P$ in intuitionistic logic (double-negation introduction).
- **Preserves meets**: $\neg\neg(P \wedge Q) \Leftrightarrow \neg\neg P \wedge \neg\neg Q$ (since $\neg\neg$ commutes with $\wedge$ in Heyting algebras).

## The classical subtopos

The sheaves of $j = \neg\neg$ — propositions $P$ for which $\neg\neg P \Leftrightarrow P$ — are the *$\neg\neg$-closed* propositions: exactly those with Boolean (decidable) truth values. The sheaf subtopos $\mathbf{Sh}_{\neg\neg}(\mathbf{Eff})$ is the *classical subtopos* of $\mathbf{Eff}$, with internal Boolean logic and subobject classifier $\Omega_{\mathrm{cl}} \cong \mathbf{2}$.

In computability terms, the $\neg\neg$-closed propositions are the $\Delta^0_1$ predicates — decidable by a total Turing machine. The classical subtopos is the theory of decidable computation.

## FOUR via the double-negation nucleus

The map $\rho: \Omega_{\mathbf{Eff}} \to \mathbf{2} \times \mathbf{2}$ defined by

$$\rho(P) = (\neg\neg P,\; \neg\neg\neg P)$$

is the image-of-$\Omega_{\mathbf{Eff}}$ map that produces $\mathbf{FOUR}$. This map is internal to $\mathbf{Eff}$, using $j$ twice. See [four-is-image-of-omega-under-double-negation](../prose/learning/claims/four-is-image-of-omega-under-double-negation.md).

## Position in the nucleus lattice

The $\neg\neg$-nucleus is the *smallest* non-trivial nucleus that forces Boolean logic: any nucleus $j'$ satisfying $j'(P) \vee j'(\neg P) = \top$ for all $P$ (excluded middle) must satisfy $j' \geq \neg\neg$ in the nucleus ordering. This makes the $\neg\neg$-nucleus the lower boundary of the Boolean subtoposes of $\mathbf{Eff}$.

The nucleus lattice strictly between $\mathrm{id}$ (the trivial nucleus, giving all of $\mathbf{Eff}$) and $\neg\neg$ (giving the classical subtopos) is non-trivial and unclassified (Lee-van Oosten 2012): its elements correspond to subtoposes strictly between $\mathbf{Eff}$ and its Boolean fragment, i.e., non-classical-but-restricted fragments of the theory of computing. No named computability-theoretic fragment has been identified as such a nucleus (other than $\neg\neg$ itself).
