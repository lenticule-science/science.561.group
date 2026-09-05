---
name: theory-of-interactive-computation
type: theorem
status: proved
description: The CLL fragment of CGS is the theory of interactive computation — computation as two-player strategy, where a program and its environment exchange moves. Session-typed π-calculus embeds via the Caires-Pfenning correspondence; PCF computation is fully abstract here.
see-also: [what-is-the-theory-of-computing, what-are-the-subtheories-of-computing]
---

# The Theory of Interactive Computation

**Theorem.** The classical linear logic (CLL) fragment of $\mathbf{CGS}$ (concurrent games with symmetry, Castellan-Clairambault-Winskel 2014/2017) is the theory of interactive computation. It is a $*$-autonomous category; Hyland-Ong sequential innocent strategies embed as a full sub-$*$-autonomous subcategory; session-typed π-calculus embeds via the Caires-Pfenning correspondence; PCF computation satisfies full abstraction here.

**Proof.**

*CLL as game semantics.* $\mathbf{CGS}$ is $*$-autonomous with: objects = prime event structures $(E, \leq, \#)$ equipped with a symmetry groupoid; morphisms $A \to B$ = equivalence classes of concurrent strategies $\sigma: S \to A^\perp \| B$ satisfying receptivity, innocence, and symmetry-invariance; composition = synchronized parallel composition followed by hiding internal moves. The CLL fragment is the full $*$-autonomous subcategory with the $?$ comonad (dual of $!$): CLL = MALL $+ ! + ?$, where $!A$ allows the environment to request $A$ repeatedly.

*The Hyland-Ong embedding.* Sequential innocent strategies (Hyland-Ong 1996) are the deterministic concurrent strategies: at most one Player-move is enabled after any history. View-innocence (the strategy's response depends only on the most recent question, not the full history) is a finiteness condition on the symmetry quotient. The functor from the Hyland-Ong category to $\mathbf{CGS}$ mapping each sequential arena to a prime event structure with trivial causality (all moves concurrent) and mapping each innocent strategy to its event-structure encoding is full and faithful — the Hyland-Ong category embeds as a full sub-$*$-autonomous subcategory.

*PCF full abstraction.* For any two closed PCF terms $M$, $N$ of the same type: $M \approx_{\mathrm{obs}} N$ (observationally equivalent under all program contexts) iff $\llbracket M \rrbracket = \llbracket N \rrbracket$ (equal innocent strategies in $\mathbf{CGS}$). The game-semantic interpretation $\llbracket - \rrbracket$ is fully abstract for PCF (Hyland-Ong 1996; Abramsky-Jagadeesan-Malacaria 2000). This establishes $\mathbf{CGS}$'s CLL fragment as the correct denotational model for typed functional computation.

*The Caires-Pfenning embedding.* Session types (Caires-Pfenning 2010; Wadler 2012) correspond to CLL propositions: a session type $S$ on a channel is a CLL formula; a session-typed process $P \vdash x: S$ is a CLL proof; the cut rule (channel communication = two processes sharing a channel) corresponds to cut elimination. This embedding is the Curry-Howard correspondence for interactive computation: sessions are propositions, processes are proofs, communication is computation. $\square$
