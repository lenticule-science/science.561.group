---
type: definition
class: fiber-bundle
status: draft
symbol: "\\mathcal{K}"
depends-on: [operations-base, predication-fiber-algebra]
---

# Capability fiber bundle

The pair $\mathcal{K} = (\mathcal{K}^{\mathrm{prov}}, \mathcal{K}^{\mathrm{req}})$ of [predication fiber algebras](../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) over the operations base, indexed by the two capability predicates:

$$\mathcal{K}^{\mathrm{prov}} \;=\; A_{\texttt{provides-capability}} \;=\; \mathbf{2}^{\bowtie\, E_{\mathrm{op}} \times E_{\mathrm{op}}}$$
$$\mathcal{K}^{\mathrm{req}} \;=\; A_{\texttt{requires-capability}} \;=\; \mathbf{2}^{\bowtie\, E_{\mathrm{op}} \times E_{\mathrm{op}}}$$

A valuation $v(\texttt{provides-capability})$ is a function $E_{\mathrm{op}} \times E_{\mathrm{op}} \to \mathbf{FOUR}$. The cells of operational interest are pairs $(A, c)$ where $A$ is an agent and $c$ is a capability:

| $v(\langle A, \texttt{provides-capability}, c\rangle)$ | Reading |
|---|---|
| $\bot$ | No information: agent has not declared either way |
| $\mathbf{t}$ | Positive: enrollment witness or capability assertion is recorded |
| $\mathbf{f}$ | Negative: revocation or exclusion witness is recorded |
| $\top$ | Contradictory: both an enrollment and a revocation witness exist; repair condition |

The same four-state reading applies to $\mathcal{K}^{\mathrm{req}}$ for $(T, c)$ pairs.

## Sections

The *capability section of agent $A$* is the function

$$\sigma_A : c \mapsto v(\langle A, \texttt{provides-capability}, c\rangle)$$

— the row of $\mathcal{K}^{\mathrm{prov}}$ at $A$. Symmetrically, the *requirement section of task $T$* is

$$\rho_T : c \mapsto v(\langle T, \texttt{requires-capability}, c\rangle).$$

These sections are the inputs to [dispatch](../../morphisms/dispatch.md).

## Capability propagation under office membership

When an agent enrolls in an office ($\langle A, \texttt{member-of}, O\rangle = \mathbf{t}$), the office's capability section transfers to the agent. This is realized as a closure rule in $\mathcal{S}_{\mathrm{op}}$:

$$\langle A, \texttt{member-of}, O\rangle = \mathbf{t} \;\wedge\; \langle O, \texttt{provides-capability}, c\rangle = \mathbf{t} \;\Longrightarrow\; \langle A, \texttt{provides-capability}, c\rangle \geq_k \mathbf{t}.$$

This is the [predicate-specialization morphism](../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-specialization.md) realized at the rule level: the office is a specialization-source for the agent's capability fiber.

## Settling-monotonicity and capability evolution

By [settling-monotonicity](../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), capability cells only grow in $\leq_k$. A capability once positively asserted at $\mathbf{t}$ remains at $\mathbf{t}$ unless a negative-evidence witness arrives, which moves it to $\top$ (not back to $\bot$). Capability *revocation* is therefore *contradiction-by-negative-witness*, not retraction. The repair operation that resolves $\top$ to $\mathbf{f}$ is governed by the substrate's repair catalog, not by the closure rules of $\mathcal{S}_{\mathrm{op}}$.
