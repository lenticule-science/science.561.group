---
type: transformer
status: active
source: Dial(Eff)
target: CGS
depends-on:
  - ../structures/dial-eff.md
  - ../structures/cgs.md
  - ../structures/eff.md
  - dialectica-embedding.md
see-also:
  - ../prose/learning/claims/f-dial-eff-to-cgs-exists.md
  - ../questions/what-is-the-theory-of-computing.md
references:
  - Hyland 2002
  - Castellan-Clairambault-Winskel 2014
  - Castellan-Clairambault-Winskel 2017
---

# F: Dial(Eff) → CGS

The **Dialectica-to-CGS functor** $F: \mathbf{Dial}(\mathbf{Eff}) \to \mathbf{CGS}$ is the $*$-autonomous functor that embeds the Dialectica category into concurrent games with symmetry, constructed from the Dialectica-game correspondence.

## The key structural fact

Dialectica interaction is **concurrent, not alternating**: in a Dialectica object $(U, X, \alpha)$, P commits witness $u \in U$ and O commits challenge $x \in X$ simultaneously. No ordering constraint relates the two moves. This concurrent structure maps directly to the concurrent event structures of $\mathbf{CGS}$ (where causality is a partial order that may be trivial — all events concurrent).

## Construction

**On objects.** $(U, X, \alpha) \;\mapsto\;$ the concurrent game arena with:
- P-events: $U$ (the witness type)
- O-events: $X$ (the challenge type)
- Causal order: trivial — all events are concurrent (no P-event causes any O-event or vice versa)
- Conflict: within P-events: $u \# u'$ for all $u \neq u'$ (exactly one witness is committed); within O-events: $x \# x'$ for all $x \neq x'$ (exactly one challenge is made); no cross-conflict: any $(u, x)$ pair is a valid play
- Symmetry groupoid: trivial (no event permutations identified)

**On morphisms.** $(f, F): (U, X, \alpha) \to (V, Y, \beta)$ — satisfying $\alpha(u, F(u,y)) \leq \beta(f(u), y)$ — maps to the concurrent strategy:

Given O commits $y \in Y$ (a challenge in the target arena), P simultaneously:
1. Commits $f(u) \in V$ — its target witness (computable from source witness $u$ via $f$)
2. Simulates $F(u,y) \in X$ — the source O-challenge (computable from $u$ and $y$ via $F$), closing the source arena

The strategy's event structure has P-events $\{(u, f(u)) \mid u \in U\}$ and encodes both $f$ and $F$ in the concurrent strategy on the compound arena $A^\perp \| B$.

## *-autonomous preservation

- **Tensor**: $F(A \otimes B) = FA \| FB$ — the Dialectica tensor $(U \times V, X^V \times Y^U, \gamma)$ corresponds to parallel composition; the function-space P-types $X^V$ and $Y^U$ encode the "each-or-any" choice structure of concurrent plays in parallel.
- **Dual**: $F(A^\perp) = (FA)^\perp$ — the Dialectica dual $(X, U, \alpha^{\mathrm{op}})$ swaps P and O, which is exactly the $\mathbf{CGS}$ dual (reverse polarity labeling).
- **Unit**: $F(1, 1, \top)$ = the empty arena (the $\mathbf{CGS}$ unit). ✓

## Faithfulness and image

**Fully faithful**: distinct Dialectica morphisms $(f_1, F_1) \neq (f_2, F_2)$ produce distinct concurrent strategies (each concurrent strategy with trivial symmetry uniquely determines its $(f, F)$ from the play structure). Every concurrent computable strategy with trivial symmetry arises from some Dialectica morphism. The image of $F$ is the full sub-$*$-autonomous-subcategory of **concurrent computable games with trivial symmetry** in $\mathbf{CGS}$.

This image is distinct from the Hyland-Ong sub-$*$-autonomous-subcategory (sequential/alternating strategies): sequential strategies are deterministic *alternating* concurrent strategies, while Dialectica strategies are genuinely concurrent (causal order trivial). Neither is contained in the other as a sub-$*$-autonomous-subcategory; both live inside $\mathbf{CGS}$.

## The Kleisli extension

The $!$ comonad on $\mathbf{Dial}(\mathbf{Eff})$ extends $F$ to a functor

$$F^!: \mathbf{Eff} \;\simeq\; \mathcal{Kl}(!_{\mathbf{Dial}(\mathbf{Eff})}) \;\longrightarrow\; \mathcal{Kl}(!_{\mathbf{CGS}})$$

This is the embedding of $\mathbf{Eff}$ into the Kleisli sub-CCC of $\mathbf{CGS}$'s concurrent computable fragment. Under $F^!$, $\mathbf{Eff}$ is the *computable Kleisli fragment* of $\mathbf{CGS}$: discrete, non-interactive, concurrent computation with no names and computable moves.

## Significance

$F$ resolves the typed/untyped split: $\mathbf{CGS}$ is the unified ambient containing both the sequential (Hyland-Ong) typed fragment and the concurrent computable (Dialectica/$\mathbf{Eff}$) untyped fragment as distinct sub-$*$-autonomous-structures meeting at PCF.
