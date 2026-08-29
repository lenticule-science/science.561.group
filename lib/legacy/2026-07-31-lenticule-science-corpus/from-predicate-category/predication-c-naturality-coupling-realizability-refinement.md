---
type: theorem
status: proved
depends-on: [transfinite-bounded-regime-realizability, aperiodic-regime-realizability, predicate-category-naturality, predicate-specialization, predicate-converse, predicate-subject-projection, predicate-object-projection, closure-rule, closure-operator]
---

# $\mathcal{C}$-naturality coupling realizability refinement

A refinement of the per-regime realizability theorems along the predicate-category-naturality axis. With non-discrete predicate categories, the closure operator's [$\mathcal{C}$-naturality](teaching/explanations/predicate-category-naturality.md) couples per-predicate firing patterns; each of the four [predicate-category](../objects/predicate-category.md) generator classes imposes a specific coupling.

**Theorem (per-generator-class).** Let $\mathcal{C}$ have a single non-identity generator-class morphism $f : q \to p$ between two predicates $p, q$. Suppose the restricted realizability at $p$ alone is governed by the bare $\Pi_1$+$<$ rule language; let $L_{\mathrm{ns}}^{(p)} = \{\mu < \kappa : \mu \text{ countable limit}\}$ be the realized firing-ordinal set at $p$ per [transfinite-bounded-regime realizability](transfinite-bounded-regime-realizability.md) or [aperiodic-regime realizability](aperiodic-regime-realizability.md). The $\mathcal{C}$-naturality coupling forces:

- **Specialization** ($f : q \to p$ with $\mathrm{dom}(q) \subseteq \mathrm{dom}(p)$): $L_{\mathrm{ns}}^{(q)} = \{\mu \in L_{\mathrm{ns}}^{(p)} : (s_\mu, o_\mu) \in \mathrm{dom}(q)\}$, where $(s_\mu, o_\mu)$ is the cell added at firing $\mu$. Sub-pattern restriction.
- **Converse** ($f : q \to p$ with cellwise action $(s, o) \mapsto (o, s)$): $L_{\mathrm{ns}}^{(q)} = L_{\mathrm{ns}}^{(p)}$ as ordered sets, with the cell at each firing ordinal swapped under $(s, o) \mapsto (o, s)$.
- **Subject-projection** ($f : q \to p$ with cellwise action $(s, o) \mapsto (s, s)$): $L_{\mathrm{ns}}^{(q)} = \{\mu \in L_{\mathrm{ns}}^{(p)} : s_\mu = o_\mu\}$. Only diagonal-cell firings of $p$ produce $q$-firings.
- **Object-projection** ($f : q \to p$ with cellwise action $(s, o) \mapsto (o, o)$): $L_{\mathrm{ns}}^{(q)} = \{\mu \in L_{\mathrm{ns}}^{(p)} : s_\mu = o_\mu\}$, the same diagonal restriction (dual via swap).

For a general non-discrete $\mathcal{C}$ with multiple generators, $L_{\mathrm{ns}}^{(q)}$ for each predicate $q$ is the orbit closure of the per-generator-class couplings: $L_{\mathrm{ns}}^{(q)}$ is constrained by every $\mathcal{C}$-morphism $f : q \to p'$ via the corresponding per-class coupling on $L_{\mathrm{ns}}^{(p')}$.

## Proof

The closure 2-monad $\mathrm{Cl}$ on the predication fibration over $\mathcal{C}$ is required to be $\mathcal{C}$-natural ([predicate-category naturality](teaching/explanations/predicate-category-naturality.md)): for every morphism $f : q \to p$ in $\mathcal{C}$, $f^* \circ \mathrm{cl}_p = \mathrm{cl}_q \circ f^*$. Hence $\mathrm{cl}_q$ is determined from $\mathrm{cl}_p$ via the action of $f^*$ on the fiber algebra $A_p$.

**Specialization.** $f^* : A_p \to A_q$ is restriction along $\iota_f : \mathrm{dom}(q) \hookrightarrow \mathrm{dom}(p)$: $f^*(v(p))(s, o) = v(p)(s, o)$ if $(s, o) \in \mathrm{dom}(q)$ and $\bot$ otherwise. A non-trivial firing of $\mathrm{cl}_p$ at $\mu$ adds a cell at $(s_\mu, o_\mu) \in \mathrm{dom}(p)$. Pulling back via $f^*$: if $(s_\mu, o_\mu) \in \mathrm{dom}(q)$, the firing transfers to $q$; otherwise $f^*$ sends the new content to $\bot$, which is no change at $q$. Hence $L_{\mathrm{ns}}^{(q)} = L_{\mathrm{ns}}^{(p)} \cap \{\mu : (s_\mu, o_\mu) \in \mathrm{dom}(q)\}$ — restriction of $p$'s firing pattern to the $\mathrm{dom}(q)$-relevant subset.

Witness: [coupled-predicate transfinite settling](../examples/coupled-predicate-transfinite-settling.md). $\square$

**Converse.** $f^*$ is the swap $(s, o) \mapsto (o, s)$, a bijection between $\mathrm{dom}(p)$ and $\mathrm{dom}(q)$ (since both are symmetric subsets of $E \times E$ for the converse to be defined). $\mathcal{C}$-naturality forces $\mathrm{cl}_q(f^*v(p)) = f^*(\mathrm{cl}_p(v(p)))$. A firing of $\mathrm{cl}_p$ at $\mu$ adding cell $(s_\mu, o_\mu)$ pulls back to a $q$-firing at the same ordinal $\mu$ adding cell $(o_\mu, s_\mu)$. The firing-ordinal sets are identical (in stage indexing); only the cell positions are swapped.

Witness: [converse-coupling transfinite settling](../examples/converse-coupling-transfinite-settling.md). $\square$

**Subject-projection.** $f^*$ collapses to the subject-diagonal: $f^*(v(p))(s, o) = v(p)(s, s)$. A firing of $\mathrm{cl}_p$ at $\mu$ adding cell $(s_\mu, o_\mu)$: under $f^*$, the value pulled back to $q$ at cell $(s, o)$ is $v(p)(s, s)$. If $s_\mu = o_\mu$ (diagonal $p$-firing), the value $v(p)(s_\mu, s_\mu) \geq_k V$ is "broadcast" to all $q$-cells $(s_\mu, \cdot)$. If $s_\mu \neq o_\mu$ (off-diagonal $p$-firing), the projection sees $v(p)(s_\mu, s_\mu)$ which is unchanged by the firing — no $q$-side cell update.

Hence $L_{\mathrm{ns}}^{(q)} = \{\mu \in L_{\mathrm{ns}}^{(p)} : s_\mu = o_\mu\}$ — diagonal-only $p$-firings transfer. $\square$

**Object-projection.** Symmetric to subject-projection via the swap $(s, o) \mapsto (o, s)$. The diagonal restriction $s_\mu = o_\mu$ is the same condition (the diagonal is symmetric). Hence $L_{\mathrm{ns}}^{(q)}$ has the same characterization as for subject-projection.

For diagonal-only rules (e.g., the transfinite-induction rule firing at $(\beta, \beta)$): both subject- and object-projection produce $L_{\mathrm{ns}}^{(q)} = L_{\mathrm{ns}}^{(p)}$ — every $p$-firing transfers. $\square$

**General $\mathcal{C}$.** For multiple generator-class morphisms reaching predicate $q$ from various predicates $\{p_i\}$, $\mathcal{C}$-naturality imposes the conjunction of per-class couplings: $L_{\mathrm{ns}}^{(q)}$ must be a common image of the per-class actions on $\{L_{\mathrm{ns}}^{(p_i)}\}$. The orbit closure under all generator-class actions characterizes the realizable per-predicate family. $\square$
