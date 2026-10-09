---
type: definition
class: cell-and-rule-quality
status: draft
depends-on: [predication-cell-set, closure-rule]
realizes: [wakhan, wakhan-tanka]
title: Wakhan as cell-and-rule quality
description: Wakȟáŋ — the sacred, the mysterious — is a quality attaching to predication cells and to closure rules, not a separate substrate region or a primitive entity.
---

# Wakhan as cell-and-rule quality

[Wakȟáŋ](../../../../indigenous/theories/lakotaean-philosophy/concepts/wakhan.md) — the sacred, the mysterious — is a *quality* attaching to predication cells and to closure rules, not a separate substrate region or a primitive entity.

## Cell-quality

A predication cell $\langle e_1, p, e_2\rangle$ in $\mathcal{C}_{\mathrm{lak}}$ may carry the wakȟáŋ quality.
Formally, $\mathcal{C}_{\mathrm{lak}}$ admits a *wakhan-marking function*

$$w : \mathrm{Cells}(\mathcal{C}_{\mathrm{lak}}) \to \{0, 1\}$$

with $w(c) = 1$ marking $c$ as wakȟáŋ-bearing.
A cell can be wakȟáŋ at a value of $\mathbf{t}$ (an actively held sacred relation), at $\mathbf{f}$ (a sacred relation actively negated), at $\bot$ (a sacred relation not yet settled), or at $\top$ (a sacred relation under contradiction — the substrate signature of an attack on or interruption of the sacred).

The marking is not orthogonal to the closure structure.
Closure rules that fire on wakȟáŋ-marked cells must themselves be wakȟáŋ-bearing rules (see below).
The substrate enforces a *purity discipline*: ordinary closure rules cannot fire on wakȟáŋ-marked cells, because doing so would dilute the sacred quality.

## Rule-quality

Some closure rules in the Lakota substrate are themselves wakȟáŋ-bearing: when they fire, the firing is itself a sacred event.
The paradigmatic case is *ceremony-binding*: a council decision $\phi$ is bound by the pipe ceremony if and only if a wakȟáŋ-bearing closure rule fires that converts the council's consensus cell into a *settled-by-ceremony* cell.

Formally, the wakȟáŋ-bearing closure rule structure factors through:

$$\bigwedge_{a \in \mathrm{Pop}} \langle a, \texttt{aligns-with}, \phi\rangle = \mathbf{t} \,\wedge\, \langle \text{pipe}, \texttt{borne-by}, \text{wičháša wakȟáŋ}\rangle = \mathbf{t} \,\Longrightarrow\, w(\langle \phi, \texttt{settled-by-ceremony}, \mathcal{P}\rangle) = 1 \,\wedge\, \langle \phi, \texttt{settled-by-ceremony}, \mathcal{P}\rangle = \mathbf{t}$$

— the wakȟáŋ marker on the settled-cell is produced by the rule's firing.
A consensus reached without the pipe ceremony has a $\texttt{settled-by-consensus}$ cell at $\mathbf{t}$ but not a $\texttt{settled-by-ceremony}$ cell — the polity has agreed, but the agreement is not wakȟáŋ-bound and may be revisited without the structural weight of ceremony.

## Wakhan Tanka as the encompassing wakhan quality

[Wakȟáŋ Tȟáŋka](../../../../indigenous/theories/lakotaean-philosophy/concepts/wakhan.md) — the Great Mystery — is the substrate-level name for the wakȟáŋ quality taken as a whole.
It is not a primitive entity in $E_{\mathrm{lak}}$ (translating it as "the Great Spirit" — as a Christian-style God-entity — was always a mistranslation).
It is the encompassing sacredness of the relational whole, formally: the global pattern of $w = 1$ markings across the substrate, considered as the substrate-property *that the sacred is the structure of relation itself*.

This is the substrate-algebraic refusal of the Christianizing reading.
Wakȟáŋ Tȟáŋka is not a God who creates and judges; it is the structural fact that the sacred quality is distributed across the cells and rules of the relational substrate, and the whole is wakȟáŋ.

## Who can produce wakhan markings

Wakȟáŋ-bearing rules can fire only when authorized witnesses are present and proper conditions hold.
The wičháša wakȟáŋ — the holy people — are the witness-class authorized to bear and present wakȟáŋ-conferring artifacts (the pipe most centrally).
The substrate enforces this: a wakȟáŋ-bearing closure rule's antecedent includes a condition cell over wičháša wakȟáŋ standing, and that cell must itself be at $\mathbf{t}$ for the rule to fire.
A person without standing cannot make a council decision wakȟáŋ-bound by performing the ceremonial form; the substrate distinguishes the form from the standing-enacted ceremony.
