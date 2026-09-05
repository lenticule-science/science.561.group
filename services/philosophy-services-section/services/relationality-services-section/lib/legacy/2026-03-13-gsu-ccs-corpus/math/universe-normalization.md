---
id: universe-normalization
name: UniverseNormalization
description: "Normalization at the Universe Level"
---

### Theorem — Normalization at the Universe Level {#universe-normalization}

#### The Semantic Normalizer {#def-semantic-normalizer}

Inside $R$, the joint projection $\pi_t$ (§joint-projection) assembles into an internal
map of sheaves called the **semantic normalizer**:
$$
\mathsf{NF} \;:=\; \pi \;:\; H \longrightarrow H^\ast.
$$
Fiberwise, $\mathsf{NF}_t = \pi_t : H_t \to H_t^\ast$. Its properties follow directly
from $\pi_t$ being a nucleus (§joint-projection): idempotence, monotonicity, retraction
onto $H_t^\ast$. Naturality — $H(f) \circ \pi_{t'} = \pi_t \circ H(f)$ for prefix
morphisms $f : t \to t'$ — follows from nucleus preservation (§reindexing). The Axiom
of Locality then assembles $\{\pi_t\}$ into the internal map $\mathsf{NF} : H \to H^\ast$
in $R$.

#### Theorem — Normalization Alignment {#thm-normalization-alignment}

**Statement.** Let $\vdash M : \mathsf{Prop}$. Then:

1. The semantic normalizer sends $\llbracket M \rrbracket$ to the doubly-stable layer:
   $$
   \mathsf{NF}\bigl(\llbracket M \rrbracket\bigr) \;=\; \pi_t\bigl(\llbracket M \rrbracket\bigr)
   \;=\; \sigma_t\!\bigl(\Delta_t(\llbracket M \rrbracket)\bigr) \;\in\; H_t^\ast.
   $$

2. For two closed terms $M, M' : \mathsf{Prop}$:
   $$
   \mathsf{NF}(\llbracket M \rrbracket) = \mathsf{NF}(\llbracket M' \rrbracket)
   \;\Longleftrightarrow\;
   \pi_t(\llbracket M \rrbracket) = \pi_t(\llbracket M' \rrbracket).
   $$
   This is an equivalence relation on FiberNuclearLanguage-terms that is coarser than
   semantic equality ($\llbracket M \rrbracket = \llbracket M' \rrbracket$): two terms with
   distinct denotations may still have the same doubly-stable projection.

3. If $M \to^\ast N$ (syntactic normalization via R1–R19$'$), then
   $\llbracket M \rrbracket = \llbracket N \rrbracket$ by soundness (§soundness), so
   $\mathsf{NF}(\llbracket M \rrbracket) = \mathsf{NF}(\llbracket N \rrbracket)$.
   Syntactic reduction preserves semantic content and hence preserves the NF value.

*Proof.* (1) is the definition of $\mathsf{NF}_t = \pi_t$. (2) is tautological.
(3) follows from soundness of the reduction rules (each rule preserves denotation in
every fiber). $\square$

FiberNuclearLanguage is the internal nuclear Heyting-modal language of the relational universe.
The semantic normalizer $\mathsf{NF} = \pi = \sigma \circ \Delta$ is the canonical internal
projection from $H$ onto $H^\ast$, definable entirely within $R$ from the fiber algebra
data. Syntactic normalization (§normalization) aligns with it in the sense of
statement (3): reducing a term to syntactic normal form does not change its NF value.
