---
id: r7-step-direction
name: R7StepDirection
description: "Observation: R7 encodes a canonical step direction in FiberNuclearLanguage — Trans inner, Sat outer — which is the syntactic expression of the irreversibility recorded in §relational-irreversibility."
---

### Conjecture — R7 Step Direction {#r7-step-direction}

The reduction rule R7 (§reduction-system) orients the canonical nesting of the two
nuclei:
$$
\mathsf{Saturate}(\mathsf{Transfer}(M)) \;\to\; \mathsf{Transfer}(\mathsf{Saturate}(M)).
$$
This rule fires in one direction only. The canonical form is
$\mathsf{Transfer}(\mathsf{Saturate}(M))$: saturation inner, transfer outer.

#### What the Direction Encodes {#r7-direction-content}

The two nuclei face in opposite directions along the step structure:

- $\mathsf{Saturate}$ ($\sigma_t$) faces backward: it asks what the accumulated
  sub-history structure forces. Given $M$, $\sigma_t(M)$ is the largest element of
  $H_t$ that restricts identically to $M$ on all sub-histories.

- $\mathsf{Transfer}$ ($\Delta_t$) faces forward: it asks what every one-step
  extension of $t$ already contains. Given $M$, $\Delta_t(M)$ is the canonical
  forward projection of $M$ into all extensions.

The canonical form $\mathsf{Transfer}(\mathsf{Saturate}(M))$ says: first determine what
$M$ must be given all backward constraints ($\sigma_t$), then project the settled
result into all forward extensions ($\Delta_t$). Past before future, at the
syntactic level.

The rule is not symmetric because the direction is not symmetric. Taking $M$,
settling it against the past, and projecting forward is the canonical step. The
reverse — projecting first and then settling — produces the same semantic element
(since $\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$ at the semantic level)
but is not in canonical form.

#### The Step Direction and Irreversibility {#r7-direction-irreversibility}

R7 is the syntactic signature of the step direction that §relational-irreversibility
describes at the semantic level. The counit $\epsilon : G_s \to \mathrm{Id}_R$
(§directed-comonad) maps a stepped fiber $H_{s \star t}$ back to $H_t$ by
restriction. If §step-fiber-aperiodicity holds, this map is not an isomorphism:
the stepped fiber has strictly more content. R7 encodes this asymmetry directly:
$\mathsf{Saturate}(\mathsf{Transfer}(M))$ (backward then forward) reduces away; what
remains is $\mathsf{Transfer}(\mathsf{Saturate}(M))$ — the form where the forward
projection is the outermost, most recent operation.

The reduction system cannot undo R7. A term that has been normalized cannot be
placed back in $\mathsf{Saturate}$-outer form by any further reduction. This irreducibility
of the direction is the term-level expression of the irreversibility conjecture:
settling creates content that no reduction can un-create.

#### Relation to the Nuclear Quartet Ordering {#r7-quartet-ordering}

The nuclear quartet ([NuclearQuartetSubalgebra](nuclear-quartet-subalgebra.md)) places four phases in a canonical order.
The R7 direction suggests that the ordering within the quartet is not arbitrary:
$\sigma$ before $\Delta$ as inner before outer. Whether the quartet's phase
ordering follows from the R7 canonical direction — or vice versa — is an open
question whose resolution would determine whether the step direction is fundamental
or derived.
