---
id: nuclear-reduction-measure
description: "The lexicographic termination measure W(M) = (fmlW(M), ent(M)) for the fiber nuclear language reduction system: polynomial weight tracking modal operator depth, and entanglement counting Transfer-inside-Saturate nesting."
---

### Definition — Nuclear Reduction Measure {#nuclear-reduction-measure}

The **nuclear reduction measure** of a closed term $M : \mathsf{Prop}$ in
FiberNuclearLanguage is the pair
$$
W(M) \;:=\; \bigl(\mathsf{fmlW}(M),\; \mathsf{ent}(M)\bigr) \;\in\; \mathbb{N} \times \mathbb{N},
$$
ordered lexicographically. It is the termination measure used in
[strong-normalization](strong-normalization.md).

#### Polynomial Weight $\mathsf{fmlW}$ {#nuclear-reduction-measure-poly}

$$
\begin{aligned}
\mathsf{fmlW}(\ell) &= 1 \quad (\ell \in \{\mathsf{var}, \mathsf{True}, \mathsf{False}\}) \\
\mathsf{fmlW}(M \star N) &= \mathsf{fmlW}(M) + \mathsf{fmlW}(N) + 1
    \quad (\star \in \{\wedge, \vee, \Rightarrow\}) \\
\mathsf{fmlW}(\mathsf{Saturate}(M)) &= \mathsf{fmlW}(\mathsf{Transfer}(M)) = 2 \cdot \mathsf{fmlW}(M)
\end{aligned}
$$

Each nuclear operator doubles its argument's weight; binary connectives add weights plus
one for the node. Since every leaf has $\mathsf{fmlW} \geq 1$, we have
$\mathsf{fmlW}(M) \geq 1$ for all $M$.

#### Transfer-Inside-Saturate Nesting Degree $\mathsf{ent}$ {#nuclear-reduction-measure-ent}

Let $\mathsf{kc}(M)$ denote the total number of Transfer occurrences in $M$:
$$
\begin{aligned}
\mathsf{kc}(\ell) &= 0, \quad
\mathsf{kc}(M \star N) = \mathsf{kc}(M) + \mathsf{kc}(N), \quad
\mathsf{kc}(\mathsf{Saturate}(M)) = \mathsf{kc}(M), \quad
\mathsf{kc}(\mathsf{Transfer}(M)) = \mathsf{kc}(M) + 1.
\end{aligned}
$$

The **entanglement** $\mathsf{ent}(M)$ counts, for each Transfer occurrence in $M$,
the number of its Saturate-headed ancestors, summed over all Transfer occurrences:
$$
\begin{aligned}
\mathsf{ent}(\ell) &= 0 \\
\mathsf{ent}(M \star N) &= \mathsf{ent}(M) + \mathsf{ent}(N) \\
\mathsf{ent}(\mathsf{Transfer}(M)) &= \mathsf{ent}(M) \\
\mathsf{ent}(\mathsf{Saturate}(M)) &= \mathsf{ent}(M) + \mathsf{kc}(M)
\end{aligned}
$$

Each Saturate wrapper adds one to the Saturate-depth of every Transfer in its scope,
hence increases $\mathsf{ent}$ by $\mathsf{kc}(M)$.

#### Role in This Theory {#nuclear-reduction-measure-role}

The pair $(\mathsf{fmlW}, \mathsf{ent})$ is a well-founded lexicographic measure on
FiberNuclearLanguage terms. Every reduction step in the
[reduction system](reduction-system.md) strictly decreases $W$ in lex order:

- Rules R1–R6, R8–R19$'$ decrease $\mathsf{fmlW}$.
- Rule R7 ($\mathsf{Saturate}(\mathsf{Transfer}(M)) \to \mathsf{Transfer}(\mathsf{Saturate}(M))$)
  preserves $\mathsf{fmlW}$ and decreases $\mathsf{ent}$ by exactly $1$.

Well-foundedness of $(\mathbb{N} \times \mathbb{N}, \leq_\mathrm{lex})$ then gives strong
normalization (see [strong-normalization](strong-normalization.md)). The two coordinates
correspond to the two nuclei: $\mathsf{fmlW}$ tracks Saturate/Transfer interaction
globally; $\mathsf{ent}$ tracks the specific cross-commutation work of R7
(see [modal-weight-duality](modal-weight-duality.md)).
