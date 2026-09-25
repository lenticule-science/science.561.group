---
title: "Paraconsistent Comprehension"
description: "Lawvere comprehension at the knowledge-order designation, with its form-validation, refinement-type, and SQL WHERE specializations."
date-created: 2026-06-20
type: theorem-and-research-note
source-snapshot: 2026-08-17-windows-561-group
source-variants:
  - paraconsistency/predication-lawvere-comprehension-paraconsistent.md
  - paraconsistency/predication-lawvere-comprehension-paraconsistent-1.md
  - paraconsistency/predication-lawvere-comprehension-paraconsistent-2.md
  - paraconsistency/predication-form-validation-as-paraconsistent-comprehension.md
  - paraconsistency/predication-refinements-as-paraconsistent-comprehension.md
  - paraconsistency/predication-where-clause-as-paraconsistent-comprehension.md
---

# Paraconsistent comprehension

## Proved Lawvere-comprehension theorem

For a predicate $p$, let the knowledge-order extension functor be

$$\mathrm{Ext}^k : \mathcal{C}/p \to \mathcal{E}_p,\qquad (g:q\to p)\mapsto \exists_g^k(\mathbf{1}_q^k),$$

where the extension takes $\top$ on $\mathrm{dom}(q)$ and $\bot$ elsewhere. Its right adjoint is

$$\{p:-\}_\top : \mathcal{E}_p\to\mathcal{C}/p,$$

which sends $\psi$ to the specialization $q_\psi\to p$ with $\mathrm{dom}(q_\psi)=\psi^{-1}(\top)$. This is the knowledge-order analogue of classical comprehension $\{p:-\}_\mathbf{t}$; the source proof is the parallel adjunction proof with $\mathbf{t}\leadsto\top$, $\mathbf{f}\leadsto\bot$, and $\leq_t\leadsto\leq_k$. Both are proved right adjoints, but they designate different sub-supports.

## Form validation and refined types

For a form with per-rule bilattice verdicts $\mathrm{cl}_{\rho_i}(v)$, aggregate evidence cellwise by the knowledge join

$$\varphi_F(v)=\bigvee_i\mathrm{cl}_{\rho_i}(v).$$

The ordinary admission surface is the classical comprehension $\mathrm{Admit}(F)=\{p_F:\varphi_F\}_{\mathbf{t}}$; the contradiction surface is $\mathrm{Conflict}(F)=\{p_F:\varphi_F\}_{\top}$. The four cells remain visible: $\mathbf{t}$ is positive and uncontradicted, $\mathbf{f}$ is rejection, $\bot$ is unevaluated, and $\top$ is conflicting evidence. A $\mathbf{t}$ and $\mathbf{f}$ contribution joins to $\top$ rather than silently poisoning or erasing the evidence. The form source labels this an engineering claim with status `proved`; that status applies to the structural identification, not to every surrounding runtime implementation claim.

For a refined type $\{T\mid\varphi\}_d$, choose a declared designation $d\in\{\mathbf{t},\top\}$:

$$\{T\mid\varphi\}_d=\{p_T:\varphi\}_d.$$

The $\mathbf{t}$ choice is the everyday default; $\top$ is the federation-stable settled-information variant. Subtyping at a fixed designation is designated-domain inclusion, $\varphi^{-1}(d)\subseteq\psi^{-1}(d)$, not an unqualified global inequality. The fiber residual supplies weakest preconditions:

$$\varphi\odot\psi\leq_t\chi\quad\Longleftrightarrow\quad\varphi\leq_t(\psi\Rightarrow\chi).$$

The source marks this structural theorem as proved while explicitly separating it from a future four-valued upgrade of the runtime's binary `check-type` soundness theorem. Regime-dependent closure termination and budget-exhausted $\bot$ outcomes therefore remain part of the note's scope, not a claim that every operational check is already bilattice-native.

## SQL `WHERE` specialization — open sketch

The SQL source proposes that `WHERE \psi` is comprehension $\{p:\psi\}_D$ for a recorded designation $D\subseteq\mathbf{FOUR}$. The principal cases are $\{\mathbf{t}\}$ (legacy SQL truth), $\{\top\}$ (conflict-repair rows), $\{\mathbf{t},\top\}$ (positive evidence), and $\{\mathbf{t},\top,\bot\}$ (not classically refuted). The “any written information” set $\{\mathbf{t},\mathbf{f},\top\}$ is a separate non-principal designation.

This remains `status: sketch`. The source requires (1) a precise binding from SQL syntax to the hyperdoctrine, (2) a proof that the proposed designation family gives the claimed right adjoints, and (3) a reduction of standard `NULL`, `IS NULL`, `COALESCE`, and aggregate behavior to those designation choices. The established $\mathbf{t}$ and $\top$ adjunctions do not by themselves prove the general SQL claim.
