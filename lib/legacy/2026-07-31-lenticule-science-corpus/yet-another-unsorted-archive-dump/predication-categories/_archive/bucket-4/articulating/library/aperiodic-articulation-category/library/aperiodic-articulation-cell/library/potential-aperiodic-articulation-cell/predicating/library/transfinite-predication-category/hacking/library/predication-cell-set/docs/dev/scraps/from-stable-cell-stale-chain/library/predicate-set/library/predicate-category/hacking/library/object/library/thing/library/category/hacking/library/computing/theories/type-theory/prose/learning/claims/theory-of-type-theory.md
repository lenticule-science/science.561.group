---
name: theory-of-type-theory
type: theorem
status: proved
description: Each typed calculus with a strong normalization theorem determines a sub-CCC of the ¬¬-subtopos of Eff via the realizability interpretation — the typed fragment of computing where every program terminates and typechecking is decidable.
see-also: [theory-of-computability, theory-of-decidability, what-are-the-subtheories-of-computing]
---

# The Theory of Type Theory

**Theorem.** Let $\lambda$ be a typed lambda calculus with a strong normalization theorem. Then $\lambda$ determines a Cartesian closed subcategory $\mathbf{C}_\lambda \hookrightarrow \mathbf{Sh}_{\neg\neg}(\mathbf{Eff})$ — a sub-CCC of the classical (decidable) subtopos of $\mathbf{Eff}$ — via the realizability interpretation of typed terms.

**Proof.**

*Strong normalization places predicates in Δ₁⁰.* A typed calculus with strong normalization has decidable typechecking (since type inference terminates) and decidable evaluation to normal form (since reduction terminates). The predicate "$t$ has type $A$" and the predicate "$t$ reduces to normal form $v$" are both decidable — Δ₁⁰ predicates. All content of the theory is therefore within the decidable subtopos $\mathbf{Sh}_{\neg\neg}(\mathbf{Eff})$.

*The realizability interpretation.* Each closed term $t: A$ in $\lambda$ has a set of realizers $|t| \subseteq \omega$ — the Kleene indices that witness its computational content. The interpretation $\llbracket A \rrbracket$ of each type $A$ is a modest set (an assembly where each element has a unique realizer). The interpretation is compositional: $\llbracket A \times B \rrbracket = \llbracket A \rrbracket \times \llbracket B \rrbracket$, $\llbracket A \to B \rrbracket = \llbracket B \rrbracket^{\llbracket A \rrbracket}$. The interpretation is sound: if $\Gamma \vdash t: A$ then $\llbracket t \rrbracket \in \llbracket A \rrbracket$.

*The sub-CCC.* The objects $\{\llbracket A \rrbracket \mid A \in \mathrm{Types}(\lambda)\}$ and morphisms $\{\llbracket t \rrbracket \mid t \in \mathrm{Terms}(\lambda)\}$ form a Cartesian closed category: terminal object $\llbracket \mathbf{1} \rrbracket$, products $\llbracket A \times B \rrbracket$, exponentials $\llbracket A \to B \rrbracket$ all exist and are preserved. The functor $\llbracket - \rrbracket: \mathbf{C}_\lambda \to \mathbf{Sh}_{\neg\neg}(\mathbf{Eff})$ is full and faithful on the normalized morphisms.

*Named instances.* STLC (Tait 1967): strong normalization by reducibility candidates; $\mathbf{C}_\mathrm{STLC}$ is the free CCC with a fixed base type. System F (Girard 1972): strong normalization by candidats de réductibilité; $\mathbf{C}_F$ is a CCC with parametric polymorphism. Martin-Löf type theory without universes (Nordström-Petersson-Smith 1990): strong normalization; $\mathbf{C}_\mathrm{MLTT}$ is a locally Cartesian closed category with identity types. Each embeds into $\mathbf{Sh}_{\neg\neg}(\mathbf{Eff})$ as a full sub-CCC. $\square$
