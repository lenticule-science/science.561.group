---
name: continuous-computation
description: The realizability topos RT(K₂) over Kleene's second algebra — the theory of computation on Baire space. A sibling of Eff connected by a one-directional geometric morphism; strictly larger (Brouwer's fan functional is realizable here but not in Eff). The theoretical home of computable analysis, domain theory, and Scott semantics.
component-of: computing
title: continuous-computation
---

# Continuous Computation

$RT(\mathcal{K}_2)$, the realizability topos over Kleene's second algebra (the PCA of functions on Baire space $\omega^\omega$ under the application $f \cdot g = \lambda n. f(\langle g(0), \ldots, g(n) \rangle)$). Connected to $\mathbf{Eff} = RT(\mathcal{K}_1)$ by a geometric morphism $\mathbf{Eff} \to RT(\mathcal{K}_2)$ (the inclusion $\mathcal{K}_1 \hookrightarrow \mathcal{K}_2$ as an applicative morphism). The morphism is one-directional: every partial recursive function is continuous on Baire space, so $\mathcal{K}_1$-computation embeds into $\mathcal{K}_2$-computation, but the converse fails. Brouwer's fan functional (computing the uniform modulus of continuity of any uniformly continuous function on Cantor space) is $\mathcal{K}_2$-realizable but not $\mathcal{K}_1$-realizable.

$RT(\mathcal{K}_2)$ is therefore NOT a subtopos of $\mathbf{Eff}$ — it is a sibling connected by an outward geometric morphism. It is the natural setting for computable analysis (Weihrauch reducibility, represented spaces), domain theory (Scott's graph model is a $\mathcal{K}_2$-assembly), and denotational semantics of PCF (Scott domains are modest sets over $\mathcal{K}_2$).
