---
kind: morphism
type: stack-morphism
symbol: "\\sigma_n^{n+1}"
depends-on: [step-n-substitution-rule, step-n-moduli-substack, step-n-substitution-recurrence]
---

# Step-shift morphism

The morphism taking step-$n$ structure to step-$(n+1)$ structure. Acts on closure rules by extending the look-back depth by 1, and induces a moduli-level morphism $\sigma_n^{n+1} : \mathscr{M}^{(n)} \to \mathscr{M}^{(n+1)}$ embedding the step-$n$ sub-stack into the next. **The corpus's first internal renormalization-style structural transition.**

## Definition

Let $\mathcal{S}$ be a step-$n$ substitution rule with substitution matrix $M_\mathcal{S} \in \mathrm{Mat}_{n \times n}(\mathbb{N})$. The **step-shift** $\sigma_n^{n+1}(\mathcal{S})$ is the step-$(n+1)$ rule with substitution matrix:

$$M_{\sigma_n^{n+1}(\mathcal{S})} \;=\; \begin{pmatrix} M_\mathcal{S} & \mathbf{c} \\ \mathbf{r} & 0 \end{pmatrix} \in \mathrm{Mat}_{(n+1) \times (n+1)}(\mathbb{N})$$

for specific extension vectors $\mathbf{c} \in \mathbb{N}^n, \mathbf{r} \in \mathbb{N}^n$ chosen to preserve primitivity.

The simplest choice: $\mathbf{c} = (1, 0, \ldots, 0)^T$ and $\mathbf{r} = (1, 0, \ldots, 0)$ — adds a new substitution-letter that maps to the first letter and is mapped to from the first letter. This produces a step-$(n+1)$ rule whose growth-rate is structurally close to but not identical with the step-$n$ original.

## Concrete examples

- **Fibonacci → Padovan-style ($n = 2 \to n = 3$):** Fibonacci's $\begin{pmatrix} 1 & 1 \\ 1 & 0 \end{pmatrix}$ extends to a $3 \times 3$ matrix $\begin{pmatrix} 1 & 1 & 1 \\ 1 & 0 & 0 \\ 1 & 0 & 0 \end{pmatrix}$ (or similar) — *not* Padovan's matrix exactly, but a step-3 rule in $\mathscr{M}^{(3)}$.
- **Padovan → Tetranacci-style ($n = 3 \to n = 4$):** similar extension giving a step-4 rule.

The step-shift morphism doesn't take Fibonacci to Padovan as a *specific* substitution; it produces *some* step-$(n+1)$ rule from a step-$n$ rule, with the specific produced rule depending on extension-vector choice.

## Functoriality

The step-shift morphism is functorial on moduli:

$$\sigma_n^{n+1} : \mathscr{M}^{(n)} \to \mathscr{M}^{(n+1)}$$

— a stack morphism. Composition gives an ascending-chain structure:

$$\mathscr{M}^{(2)} \xrightarrow{\sigma_2^3} \mathscr{M}^{(3)} \xrightarrow{\sigma_3^4} \mathscr{M}^{(4)} \xrightarrow{\sigma_4^5} \cdots$$

Established formally by the [step-shift functoriality theorem](../theorems/step-shift-functoriality-theorem.md) (forthcoming).

## Action on classifying invariants

The step-shift morphism's derivative on cohomology takes the rank-$n$ classifying invariant to a rank-$(n+1)$ invariant:

$$d\sigma_n^{n+1} : \mathbb{Z}^n \to \mathbb{Z}^{n+1}$$

— typically embedding $\mathbb{Z}^n$ as a sub-lattice of $\mathbb{Z}^{n+1}$, with the new generator corresponding to the new substitution letter. Concrete computation in [step-shift-on-classifying-invariants example](../examples/step-shift-on-classifying-invariants.md) (forthcoming).

## RG-flow interpretation

The step-shift morphism acts as a **renormalization-group flow** on the moduli family. Each iteration of $\sigma$ moves up one level in the step-hierarchy, producing a richer rule with more letters, deeper recurrence, higher cohomological rank.

Fixed points of the RG flow (rules invariant under step-shift) are the corpus's first instance of a renormalization fixed point: substitution rules whose step-shifted version is closure-equivalent to themselves. These are speculative; whether they exist concretely is open.

The colimit of the ascending chain $\mathrm{colim}_n \mathscr{M}^{(n)}$ is a candidate **infinite-step-depth fixed point** — a universal substitution moduli at the limit of the step-shift flow. See [step-n fixed-point object](../../aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/content/step-n-moduli-substack/content/step-n-fixed-point/step-n-fixed-point.md) (forthcoming).

## Position in the program

The structural backbone of the step-$n$ family. Together with the [alphabet-extension-morphism](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/terms/alphabet-extension-morphism.md) (the "horizontal" sibling morphism between substitutions of different alphabet structure at fixed $n$), these are the corpus's first internal RG-style morphisms.
