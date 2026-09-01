---
name: "Interaction Surface"
aliases:
  - "interaction surface"
  - "interaction surfaces"
date-created: 2025-12-31
tags: []
---

The interaction surface of a [handle](./handle.md) $\tau$ in a partial state $X$ is the finite set of [interaction terms](./interaction-term.md) associated with $\tau$ in that state: $\mathrm{Ix}_X(\tau) \subseteq \mathsf{IxTerm}$. The interaction surface is the boundary across which the handle engages with the meaning domain — it records which semiotic acts are currently active for the handle. It is the relational boundary across which external engagement is translated into the sign system's internal meaning.

An interaction surface is not itself semantic content; it is auxiliary data that mediates between [handles](./handle.md) and the [Heyting algebra](../../../../concepts/heyting-algebra/index.md) $H$. Semantic consequences are produced by interpreting the terms and generating the [handle fragment](./handle-fragment.md) from their denotations. Enlarging the interaction surface (adding more [interaction terms](./interaction-term.md)) can only enlarge the handle fragment: if $\mathrm{Ix}_X(\tau) \subseteq \mathrm{Ix}'_X(\tau)$, then the handle fragment under the larger surface contains the one under the smaller.

The [delta](./delta.md) operation at the interaction level compares two surfaces by symmetric difference: $\Delta_{\mathrm{ix}}(A, B) = (A \setminus B) \cup (B \setminus A)$. This measures the syntactic difference between two interaction profiles before any semantic interpretation.
