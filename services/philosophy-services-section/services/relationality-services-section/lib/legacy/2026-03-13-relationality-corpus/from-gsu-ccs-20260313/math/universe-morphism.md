---

name: universe-morphism
description: "Object: Morphisms of Relational Universes"
defines: UniverseMorphism
---

### Definition — Morphisms of Relational Universes {#universe-morphism}

A **morphism of relational universes**
$$
(\phi, \alpha) : \mathbf{U} = (T_\mathbf{U}, J_\mathbf{U}, H_\mathbf{U}) \longrightarrow \mathbf{V} = (T_\mathbf{V}, J_\mathbf{V}, H_\mathbf{V})
$$
consists of:

1. A **history category morphism** $\phi : T_\mathbf{U} \to T_\mathbf{V}$: a functor that
   preserves the commutation relation ($s \perp_\mathbf{U} t$ implies
   $\phi(s) \perp_\mathbf{V} \phi(t)$) and is continuous (covering families in $J_\mathbf{U}$
   map to covering families in $J_\mathbf{V}$).

2. A **natural isomorphism** $\alpha : H_\mathbf{U} \xrightarrow{\;\sim\;} \phi^* H_\mathbf{V}$
   of $\mathbf{HA}$-valued presheaves over $T_\mathbf{U}^{\mathrm{op}}$, where
   $(\phi^* H_\mathbf{V})_t := H_{\mathbf{V},\,\phi(t)}$.

Composition of $(\phi, \alpha) : \mathbf{U} \to \mathbf{V}$ and $(\psi, \beta) : \mathbf{V} \to \mathbf{W}$ is
$$
(\psi, \beta) \circ (\phi, \alpha) \;:=\; \bigl(\psi \circ \phi,\; (\phi^* \beta) \circ \alpha\bigr).
$$
Identities are $(\mathrm{id}_T, \mathrm{id}_H)$.

#### Nuclei Are Automatically Preserved {#morphisms-nuclei}

A key consequence of grounding $\sigma_t$ and $\Delta_t$ in the presheaf datum
(§fiber-doctrine): a natural isomorphism $\alpha : H_\mathbf{U} \xrightarrow{\sim}
\phi^* H_\mathbf{V}$ of $\mathbf{HA}$-presheaves automatically preserves the nuclei.

*Argument.* Fix a history $t \in T_\mathbf{U}$ and a step $s \perp_\mathbf{U} t$.
The one-step extension $i_{s,t} : t \to s \star t$ in $T_\mathbf{U}$ maps under $\phi$ to
$\phi(i_{s,t}) : \phi(t) \to \phi(s) \star \phi(t)$ in $T_\mathbf{V}$ (by preservation of commutation). The naturality square of $\alpha$ at $i_{s,t}$ gives
$$
\alpha_t \circ H_\mathbf{U}(i_{s,t}) = H_\mathbf{V}(\phi(i_{s,t})) \circ \alpha_{s \star t}.
$$
Hence $\alpha_t$ sends $\mathrm{image}(H_\mathbf{U}(i_{s,t}))$ to
$\mathrm{image}(H_\mathbf{V}(\phi(i_{s,t})))$, and therefore sends
$\mathrm{Fix}(\Delta_{\mathbf{U},t})$ isomorphically to $\mathrm{Fix}(\Delta_{\mathbf{V},\phi(t)})$.
Since both nuclei are defined as the closure operator for these fixed-point sets, $\alpha_t$
intertwines them: $\alpha_t \circ \Delta_{\mathbf{U},t} = \Delta_{\mathbf{V},\phi(t)} \circ \alpha_t$.
For $\sigma$: the naturality of $\alpha$ at the sub-history morphism $i_{t_0,t} : t_0 \to t$
gives $\alpha_{t_0} \circ \rho^{\mathbf{U}}_{t_0} = \rho^{\mathbf{V}}_{\phi(t_0)} \circ \alpha_t$.
Hence if $\rho^{\mathbf{U}}_{t_0}(b) \leq \rho^{\mathbf{U}}_{t_0}(a)$ for all $t_0 < t$,
then $\rho^{\mathbf{V}}_{\phi(t_0)}(\alpha_t(b)) \leq \rho^{\mathbf{V}}_{\phi(t_0)}(\alpha_t(a))$ for all $\phi(t_0) < \phi(t)$.

**Gap.** The defining set of $\sigma_{\mathbf{V},\phi(t)}(\alpha_t(a))$ involves the
condition $\rho^{\mathbf{V}}_{s}(c) \leq \rho^{\mathbf{V}}_{s}(\alpha_t(a))$ for
**all** predecessors $s < \phi(t)$ in $T_\mathbf{V}$, not only those of the form
$\phi(t_0)$. If $\phi$ is not surjective on predecessors of $\phi(t)$ — i.e., if
there exists $s < \phi(t)$ with $s \notin \mathrm{image}(\phi)$ — then naturality of
$\alpha$ does not verify the condition at $s$, and the argument establishing
$\alpha_t(\sigma_{\mathbf{U},t}(a)) \leq \sigma_{\mathbf{V},\phi(t)}(\alpha_t(a))$
is incomplete. The claimed equality
$\alpha_t \circ \sigma_{\mathbf{U},t} = \sigma_{\mathbf{V},\phi(t)} \circ \alpha_t$
holds when $\phi$ reflects predecessors (every $s < \phi(t)$ is of the form $\phi(t_0)$
for some $t_0 < t$), but this condition is not in the current definition of morphism.

No separate "preserves nuclei" condition is needed in the definition: it follows from
the isomorphism of $\mathbf{HA}$-presheaves together with the history category morphism.

#### Induced Geometric Morphism {#morphisms-geom}

Every morphism $(\phi, \alpha) : \mathbf{U} \to \mathbf{V}$ induces a **geometric morphism**
$f : R_\mathbf{U} \to R_\mathbf{V}$ of the associated toposes: the inverse image functor
$f^* : R_\mathbf{V} \to R_\mathbf{U}$ is the composite of sheafification and $\phi^*$-precomposition,
and it preserves the distinguished internal structure $H_\mathbf{V} \mapsto H_\mathbf{U}$
via $\alpha$.

Not every geometric morphism $R_\mathbf{U} \to R_\mathbf{V}$ arises this way: a morphism of
relational universes is a geometric morphism that additionally respects the history site structure.
The category $\mathbf{RU}$ is a (non-full) subcategory of the 2-category of Grothendieck toposes.
