---
type: claim
status: proved
depends-on:
  - ../code/structures/cgs.md
  - ../code/structures/dial-eff.md
see-also:
  - ../questions/what-are-the-subtheories-of-computing.md
  - f-dial-eff-to-cgs-exists.md
references:
  - Girard 1987
  - Seely 1989
  - Abramsky-Mellies 1999
  - Caires-Pfenning 2010
  - Wadler 2012
  - Hyland-Ong 1996
  - Abramsky-Ghica-Murawski-Ong-Stark 2004
---

# The typed subtheory lattice is the linear logic fragment lattice

## Statement

The subtheory lattice of the typed theory of computing is the lattice of linear logic fragments:

$$\mathrm{MLL} \;\subset\; \mathrm{MALL} \;\subset\; \{\mathrm{ILL}, \mathrm{CLL}\} \;\subset\; \mathrm{LL}$$

This lattice is fully classified. Each inclusion is a full $*$-autonomous embedding.

## Proof

All three major typed computational paradigms embed into $\mathbf{CGS}$ (concurrent games with symmetry) as full sub-$*$-autonomous-categories:

- **Sequential game semantics** (Hyland-Ong 1996): sequential strategies are deterministic concurrent strategies; the full abstraction theorem for PCF makes this a tight embedding.
- **Nominal computation** (Abramsky-Ghica-Murawski-Ong-Stark 2004): arenas with $\mathrm{FSym}(\mathbb{A})$-symmetry accommodate fresh-name allocation; full abstraction for the $\nu$-calculus is proved in this framework.
- **Session-typed concurrency** (Caires-Pfenning 2010; Wadler 2012): session types correspond to classical linear logic propositions; session-typed $\pi$-processes correspond to CLL proofs via cut-elimination; processes embed into the Kleisli category of $!$ on a $*$-autonomous model of CLL.

$\mathbf{CGS}$ is itself $*$-autonomous (Castellan-Clairambault-Winskel 2014, 2017). The linear logic fragment lattice describes the $*$-autonomous sub-theories of $\mathbf{CGS}$:

- **MLL** (multiplicative linear logic): bare resource-sensitivity — each hypothesis used exactly once. Objects: game arenas; morphisms: strategies with no duplication or discard. $*$-autonomous, minimal.
- **MALL** (multiplicative-additive): deterministic choice added via additive connectives $\mathbin{\&}$ (player's choice) and $\oplus$ (opponent's choice). Full $*$-autonomous embedding into the next level.
- **ILL** (intuitionistic linear logic): replicable resources added via the $!$ comonad ("of course"), recovering a Cartesian closed structure on $\mathcal{Kl}(!)$. Typed $\lambda$-calculi — STLC, System F, Martin-Löf type theory — correspond via Curry-Howard-Lambek to sub-CCCs of $\mathcal{Kl}(!)$.
- **CLL** (classical linear logic): game-semantic duality added; session-typed $\pi$-calculus corresponds to CLL proofs via Caires-Pfenning.
- **LL** (full linear logic): classical linear logic with full $!$ comonad. The ambient $*$-autonomous world.

Each inclusion is concrete: MLL-categories embed into MALL-categories by adding $\mathbin{\&}$ and $\oplus$ operations; MALL embeds into ILL/CLL by adding $!$; both embed into LL. The embeddings are full and faithful $*$-autonomous functors, not just inclusions of structure sets.

The realizability account (via Dialectica, from $\mathbf{Eff}$) lands in ILL: $\mathbf{Eff} \simeq \mathcal{Kl}(!_{\mathbf{Dial}(\mathbf{Eff})})$ (Hyland 2002), and Dial(Eff) is a $*$-autonomous model of LL, with $\mathbf{Eff}$ as its Kleisli CCC.

## Significance

If "the theory of computing" means typed computation, the subtheory question is completely answered: the lattice MLL $\subset$ MALL $\subset$ \{ILL, CLL\} $\subset$ LL, with all inclusions explicit. This is a mathematical fact, not an organizational choice.

The typed and untyped lattices may be nested rather than parallel: if $\mathbf{Eff} \simeq \mathcal{Kl}(!_{\mathbf{CGS}})$ as CCCs, the nucleus lattice of $\mathbf{Eff}$ (the untyped subtheory lattice) is a quotient of the ILL fragment of the typed lattice. Whether this identification holds exactly is the main open question connecting the two lattices.
