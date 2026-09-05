---
type: theorem
class: contemporary
status: proved
depends-on:
  - teaching/explanations/reflective-stability.md
  - teaching/explanations/vingean-reflection.md
see-also:
  - ../morphisms/self-modification.md
references:
  - references/soares-fallenstein2015.md
---

# Reflective stability impossibility (Loebian obstacle)

## Statement

Let $T$ be a consistent recursively axiomatizable theory extending Peano Arithmetic, and let $\Box_T \phi$ denote "$\phi$ is provable in $T$".
Then for every sentence $\phi$, *Loeb's theorem* gives:

$$ T \vdash (\Box_T \phi \to \phi) \implies T \vdash \phi. $$

Specializing the consequent: an agent reasoning in $T$ cannot prove "if I (or my successor reasoning in $T$) prove $\phi$, then $\phi$" for arbitrary $\phi$ without already having proved $\phi$.
In particular, the agent cannot prove the *general* soundness statement $\forall \phi.\ \Box_T \phi \to \phi$ without making $T$ inconsistent.

## Proof

Loeb's theorem is a classical metatheorem.
Sketch:

1. Suppose $T \vdash \Box_T \phi \to \phi$ for some sentence $\phi$.
2. By the diagonal lemma, construct a sentence $\psi$ such that $T \vdash \psi \leftrightarrow (\Box_T \psi \to \phi)$.
3. From this, $T \vdash \Box_T \psi \to (\Box_T \psi \to \phi)$ (provability is preserved under modus ponens applied inside the box).
4. So $T \vdash \Box_T \psi \to \phi$.
5. By assumption, $T \vdash \Box_T \phi \to \phi$, so $T \vdash \Box_T \psi \to \phi$ implies $T \vdash \psi$.
6. Hence $T \vdash \Box_T \psi$, which combined with step 4 gives $T \vdash \phi$.

The proof is short but uses the strong machinery of Goedel-Loeb modal logic (the schema of provability conditions).

## What this rules out

Concretely, the theorem rules out:

- **Naive successor-trust.** An agent cannot prove that its next-stage successor (working in the same logical system) has all-true beliefs.
  Hence no successor can be unconditionally endorsed by the agent's own logic.
- **Self-trust at full strength.** An agent cannot prove the soundness of its own future proofs, in the sense that "if future-me proves $\phi$, then $\phi$" cannot be a theorem for arbitrary $\phi$.
- **Full reflective coherence.** A *reflectively stable* agent in the strongest sense — one whose belief-update procedure provably never errs — is not realizable in classical logic.

## What this does not rule out

The theorem does *not* rule out:

- **Bounded soundness schemata.** The agent can prove that successors using *strictly weaker* logical systems are sound, since the recursion bottoms out.
  This is the "tiling agents" approach (Yudkowsky-Herreshoff 2013).
- **Probabilistic self-trust.** The agent can have *calibrated* beliefs about its own future beliefs that satisfy logical induction's criterion.
  Confidence less than 1 sidesteps Loeb.
  See [logical-induction-criterion](logical-induction-criterion.md).
- **Domain-restricted soundness.** The agent can prove the soundness of specific decision-procedure outputs when those outputs are restricted to particular sentence schemata.
- **Modal cooperation.** Two agents with mutual access to one another's source code can establish cooperation via bounded modal proofs (Barasz et al.) without violating Loeb.

## Why it matters

The Loebian obstacle is the formal articulation of the *vingean reflection* problem (see [vingean-reflection](teaching/explanations/vingean-reflection.md)): an agent cannot fully trust its own future or successor using just classical proof.
Any AI system that intends to construct or become a more capable successor must contend with this.
It is a load-bearing constraint behind the agent-foundations program's interest in tiling agents, modal proof, and logical induction as alternatives to naive proof-based self-trust.
