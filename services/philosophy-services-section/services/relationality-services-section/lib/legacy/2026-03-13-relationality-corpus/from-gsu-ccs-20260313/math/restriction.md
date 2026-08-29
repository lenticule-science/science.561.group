---

name: restriction
description: "A restriction map is the image of a morphism t → t' under the presheaf H: a Heyting algebra homomorphism H_{t'} → H_t that carries propositions backward from longer histories to shorter ones."

defines: Restriction
---

### Definition — Restriction {#restriction}

A **restriction map** is the image under the presheaf $H : T^{\mathrm{op}} \to
\mathbf{HA}_\mathrm{nucl}$ of a morphism $f : t \to t'$ in the history category $T$:

$$
H(f) \;:\; H_{t'} \;\longrightarrow\; H_t.
$$

Since $f : t \to t'$ is a morphism in $T$ (i.e., $t \leq t'$, meaning $t'$ extends $t$),
and $H$ is contravariant, the restriction map goes in the opposite direction —
from the longer fiber back to the shorter one. It is a homomorphism of
$\mathbf{HA}_\mathrm{nucl}$: it preserves all Heyting structure ($\wedge$, $\vee$,
$\Rightarrow$, $\top$, $\bot$) and commutes with both nuclei (§reindexing):

$$
H(f)(\sigma_{t'}(a)) = \sigma_t(H(f)(a)),
\qquad
H(f)(\Delta_{t'}(a)) = \Delta_t(H(f)(a)).
$$

#### What Restriction Does {#restriction-action}

A restriction map carries a proposition at a longer history $t'$ to the proposition
it "looks like" from the shorter history $t$. The presheaf condition
$H(g \circ f) = H(f) \circ H(g)$ ensures that restricting in stages gives the same
result as restricting directly.

Restriction maps are what make the fiber algebras **coherent across the history
ordering**: the data at any longer history is accessible from any shorter one, and
that access is structure-preserving.

#### Restriction-Stable Propositions {#restriction-stable}

An element $a \in H_t$ is **restriction-stable** if $\sigma_t(a) = a$ — that is, if
$a$ is already as large as its restriction profile to every shorter history allows.
The sub-algebra of restriction-stable propositions is $\mathrm{Fix}(\sigma_t)$
(§fiber-doctrine). The restriction-stable sub-algebra is one pole of the
restriction–extension dyad (§restriction-extension-dyad).
