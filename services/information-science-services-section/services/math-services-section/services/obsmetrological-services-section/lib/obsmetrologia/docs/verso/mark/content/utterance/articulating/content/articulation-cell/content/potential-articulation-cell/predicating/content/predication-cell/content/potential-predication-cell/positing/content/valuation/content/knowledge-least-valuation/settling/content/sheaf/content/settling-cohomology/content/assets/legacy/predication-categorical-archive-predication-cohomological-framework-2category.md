---
type: definition
class: 2-category
status: draft
symbol: "\\mathbf{CohFr}"
depends-on: [cohomological-framework, bitopological-settling-site, d-frame, q-enriched-cohomology]
see-also: [cohomological-framework-comparison, three-cohomological-frameworks]
---

# 2-category of cohomological frameworks

The 2-category $\mathbf{CohFr}$ organizes the four [cohomological frameworks](teaching/explanations/cohomological-framework.md) the corpus has grown up alongside each other. Its 0-cells are framework specifications; its 1-cells are typed comparisons; its 2-cells are the modifications between comparisons that the agreement claims are isomorphisms. Promoting each framework from a name in a narrative to a 0-cell in $\mathbf{CohFr}$ makes "the F1↔F2 agreement" a typed thing — the invertibility of a specific 1-cell's comparison transformation on a specified subdomain — rather than an unstated background assumption.

## 0-cells

A **0-cell** $\mathbb F$ of $\mathbf{CohFr}$ is a triple

$$\mathbb F \;=\; (\mathcal S_{\mathbb F},\; \mathcal V_{\mathbb F},\; H^\bullet_{\mathbb F})$$

with:

- **Site-presentation functor** $\mathcal S_{\mathbb F} : \mathbf{Stl} \to \mathcal D_{\mathbb F}$, where $\mathbf{Stl}$ is the category of [settlings](../objects/predication-settling.md) (or, where the framework requires it, a designated subcategory of settlings — *substitution settlings*, *strict-regime settlings*, etc.), and $\mathcal D_{\mathbb F}$ is the geometric category the framework reads its input as. The functor $\mathcal S_{\mathbb F}$ is the framework's commitment to *what it computes against*: an Anderson-Putnam tile space, a discrete-points fiber, an order-complex of clopens, the bitopological settling site as a Grothendieck site.
- **Value category** $\mathcal V_{\mathbb F}$. Chosen to carry the framework's chosen invariants: $\mathbf{Ab}$ for classical Čech, $\mathbf{dFrm}$ for d-frame-valued sheaf cohomology, $\mathbf{QCat}_{\mathrm{cwl}}$ for the Q-enriched theories.
- **Cohomology functor** $H^\bullet_{\mathbb F} : \mathcal D_{\mathbb F} \to \mathcal V_{\mathbb F}^{\mathbb N}$, valued in graded objects of $\mathcal V_{\mathbb F}$.

The four named 0-cells are exactly the frameworks listed in [cohomological framework](teaching/explanations/cohomological-framework.md):

- $\mathbb F_1$ — substitution-matrix Anderson-Putnam: $\mathcal S_1$ is defined on substitution settlings, sending a substitution $\omega$ to its tile space $\Omega_\omega$; $\mathcal V_1 = \mathbf{Ab}$ (with d-frame side-structure attached post hoc); $H^\bullet_1 = \check H^\bullet_{\mathrm{AP}}$.
- $\mathbb F_2$ — Tarski-Laplacian on the discrete-points fiber: $\mathcal S_2$ sends a settling to its bitopological site equipped with the discrete-points reading of each per-base-point fiber; $\mathcal V_2 = \mathbf{dFrm}$; $H^\bullet_2$ is the [Tarski-Laplacian fixed-point cohomology](../theorems/strict-regime-d-frame-cohomology.md), trivial above degree 0 by construction.
- $\mathbb F_3$ — cellular sheaf on the order complex of the clopen lattice (parallel-pair, Q-enriched): $\mathcal S_3$ sends a settling to its bitopological site equipped with the order-complex-of-clopens reading; $\mathcal V_3 = \mathbf{QCat}_{\mathrm{cwl}}$, with $\mathbf{dFrm}$ embedded as a full subcategory (the convention used in [d-frame-cohomology-comparison](../theorems/d-frame-cohomology-comparison.md)); $H^\bullet_3$ is the cellular-sheaf cohomology with the parallel-pair coboundary, computed via the [per-fiber Curry chain](../theorems/q-enriched-curry-grothendieck-site.md).
- $\mathbb F_4$ — Lawvere-Laplacian on the Grothendieck site (weighted-meet, Q-enriched): $\mathcal S_4$ presents the bitopological site directly as a Grothendieck site with no per-fiber factoring; $\mathcal V_4 = \mathbf{QCat}_{\mathrm{cwl}}$; $H^\bullet_4$ is the [Q-enriched cohomology](../objects/q-enriched-cohomology.md) with weighted-meet coboundary.

## 1-cells

A **1-cell** $\mathbb F \to \mathbb F'$ is a [framework comparison](../morphisms/cohomological-framework-comparison.md) — a triple $(\Phi_{\mathcal D}, \Phi_{\mathcal V}, \alpha)$ subject to a domain-restriction discipline (a 1-cell carries the subcategory of $\mathcal D_{\mathbb F}$ on which it is defined, since not every framework reads every settling). The morphism file gives the precise data; the upshot is that a 1-cell commits to an input-translation, a value-translation, and a comparison transformation $\alpha : \Phi_{\mathcal V} \circ H^\bullet_{\mathbb F} \Rightarrow H^\bullet_{\mathbb F'} \circ \Phi_{\mathcal D}$ relating "compute then translate" to "translate then compute."

Composition of 1-cells $(\Phi, \Phi', \alpha) : \mathbb F \to \mathbb F'$ and $(\Psi, \Psi', \beta) : \mathbb F' \to \mathbb F''$ is pointwise on the input/value functors and pastes the comparison transformations:

$$(\Psi \circ \Phi,\;\; \Psi' \circ \Phi',\;\; (\beta \circ \Phi_{\mathcal D}) \cdot (\Psi'_{\mathcal V} \circ \alpha)).$$

The identity 1-cell on $\mathbb F$ is $(\mathrm{id}_{\mathcal D_{\mathbb F}}, \mathrm{id}_{\mathcal V_{\mathbb F}}, \mathrm{id}_{H^\bullet_{\mathbb F}})$. Subdomain composition: the composed 1-cell's domain is the intersection of the source's and target's domains under $\Phi_{\mathcal D}$.

## 2-cells

A **2-cell** $(\Phi, \Phi', \alpha) \Rightarrow (\Psi, \Psi', \beta)$ between parallel 1-cells $\mathbb F \to \mathbb F'$ is a pair of natural transformations $\theta : \Phi \Rightarrow \Psi$ and $\theta' : \Phi' \Rightarrow \Psi'$ such that the obvious square of comparison transformations commutes:

$$\begin{array}{ccc}
\Phi'_{\mathcal V} \circ H^\bullet_{\mathbb F} & \xRightarrow{\;\alpha\;} & H^\bullet_{\mathbb F'} \circ \Phi_{\mathcal D} \\
{\scriptstyle \theta'_{\mathcal V} \circ H^\bullet_{\mathbb F}} \!\!\downarrow & & \downarrow\!\! {\scriptstyle H^\bullet_{\mathbb F'} \circ \theta_{\mathcal D}} \\
\Psi'_{\mathcal V} \circ H^\bullet_{\mathbb F} & \xRightarrow{\;\beta\;} & H^\bullet_{\mathbb F'} \circ \Psi_{\mathcal D}
\end{array}$$

Identity, vertical, and horizontal composition of 2-cells are componentwise from $\mathbf{Cat}$.

## Agreement 1-cells and agreement 2-isomorphisms

A 1-cell $(\Phi_{\mathcal D}, \Phi_{\mathcal V}, \alpha) : \mathbb F \to \mathbb F'$ is an **agreement 1-cell** when $\alpha$ is a (natural) isomorphism on its declared subdomain — the framework comparison commutes coherently up to natural isomorphism.

The four currently-implicit agreements named in [cohomological framework](teaching/explanations/cohomological-framework.md) become four claims about the invertibility of $\alpha$ for specific 1-cells on specified subdomains:

| 1-cell | Subdomain | Agreement claim | Theorem file |
|---|---|---|---|
| $\mathbb F_1 \to \mathbb F_2$ | substitution settlings, strict / Scott-continuous regime | $\alpha$ is a natural iso | [framework-1-2-strict-agreement](../theorems/framework-1-2-strict-agreement.md) |
| $\mathbb F_2 \to \mathbb F_3$ | strict-regime settlings (finite distributive bilattice fibers) | $\alpha$ is a natural iso (**partial: per-fiber $H^0$ unconditional via Lemma B1; full claim conditional on sketch assembly machinery**) | [framework-2-3-strict-agreement](../theorems/framework-2-3-strict-agreement.md) |
| $\mathbb F_3 \to \mathbb F_4$ | Grothendieck-site assembly | $\alpha$ is **not** a natural iso (positive negative result; **partial: structural source via Lemma D1 unconditional under standard $W$; concrete Belnap-fiber witness open via D2 blueprint, existential deferred to D-G2**) | [framework-3-4-disagreement](../theorems/framework-3-4-disagreement.md) |
| $\mathbb F_4 \to \mathbb F_3$ on $H^{\geq 2}$ | Grothendieck-site assembly with $H^{\geq 2}_{\mathbb F_4} = 0$ | $\alpha$ transfers vanishing | [framework-4-vanishing-transfer](../theorems/framework-4-vanishing-transfer.md) |

The verified instance from [per-fiber d-frame Curry on the Belnap fiber](../examples/per-fiber-d-frame-curry-on-belnap-fiber.md) is the first witness for the $\mathbb F_2 \to \mathbb F_3$ agreement on a single fiber.

## What this 2-category does and does not give

It gives a **type discipline**: every cross-framework claim now has the shape "$\alpha$ for *this* 1-cell is invertible on *this* subdomain." That alone removes a class of latent confusion (e.g., conflating "F2 and F3 give the same numerical answer here" with "the F2-to-F3 comparison transformation is invertible on the relevant $H^n$").

It does **not** prove any of the agreements. Of the four theorem files, three are now `sketch` (framework-1-2-strict-agreement, framework-2-3-strict-agreement, and framework-3-4-disagreement, each with substantial partial proofs and named outstanding gaps) and one remains `draft` (framework-4-vanishing-transfer, claim precisely stated with proof not yet carried out). Promoting any of them to `proved` is substantive mathematical work; for the F1↔F2 case the work is closing gaps C-G1 / C-G2, for the F2↔F3 case the [working question on per-fiber Curry](questions/per-fiber-curry-on-clopen-lattice-fiber.md) is one route in, and for the F3↔F4 disagreement the work is closing gaps D-G1 / D-G2 (typing $\alpha_{34}$ and producing a discriminating triangle-level witness independent of $\mathbb F_3$-assembly choice).

## Position in predication categories

This 2-category is the categorical formalism the [three-cohomological-frameworks narrative](prose/teaching/explanations/three-cohomological-frameworks.md) was implicitly pointing at when it described "agreements that aren't proved." Once the agreements are typed as invertibility claims about specific 1-cells, the downstream impact propagates cleanly: any theorem stated in $\mathbb F'$ but proved through $\mathbb F$ requires the corresponding agreement 1-cell, and demoting the agreement 1-cell from "assumed iso" to "claimed iso, draft" demotes every theorem that depends on it in a typed way.
