---
type: definition
class: evaluation-fiber
status: draft
depends-on: [office-as-double-settlement, jural-relation, polity]
realizes: [seven-grandfathers-teachings, anishinaabe-governance]
---

# Conduct teachings as evaluation predicates

The mathematical realization of *conduct teachings* as the primary basis of leadership accountability — drawn from the Anishinaabe Teachings of the Seven Grandfathers (love, respect, bravery, truth, honesty, humility, wisdom) per the [indigenous-governance-traditions survey](../../../../../../governance-services-section/content/text/documents/notes/2026-04-03-note-on-indigenous-governance-traditions-survey.md). Where formal-legal accountability operates through rule-violation detection, teachings-based accountability operates through *continuous evaluation of conduct against named virtues*. Loss of standing follows from visible failure to embody the teachings.

## Data

A conduct-teachings discipline within a [polity](polity.md) $\mathcal{P}$ is a tuple

$$\mathrm{Tch} \;=\; (\Theta,\; \mathrm{eval},\; \mathrm{recog})$$

where:

- $\Theta = \{t_1, t_2, \ldots, t_k\}$ — the *teachings* (named virtues): each is a substrate predicate. For Anishinaabe, the seven: $\Theta = \{\texttt{love}, \texttt{respect}, \texttt{bravery}, \texttt{truth}, \texttt{honesty}, \texttt{humility}, \texttt{wisdom}\}$. Other traditions name different sets (Confucian *li/yi/ren*, Stoic *cardinal-virtues*, Aristotelian *aretai*, etc.).
- $\mathrm{eval}: \mathrm{Pop}_\mathcal{P} \times \Theta \to \mathbf{FOUR}$ — the *evaluation function*: for each agent and each teaching, the substrate carries a cell $\langle a, \texttt{exhibits-teaching}, t_i\rangle = v$ recording the substrate's accumulated evidence of $a$'s conduct on teaching $t_i$.
- $\mathrm{recog}$ — the *community-judgment recognition* mechanism: closure rules by which evaluation cells are settled by community-witnessed conduct. Conduct-witnesses fire the cells; the cells accumulate over time per [settling-monotonicity](../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md).

## How standing depends on the teachings

For an [office](office-as-double-settlement.md) $O$ accountable through conduct teachings, the agent's incumbency is conditional on their evaluation cells reaching/maintaining $\mathbf{t}$ on each teaching:

$$\bigwedge_{t_i \in \Theta} \langle a, \texttt{exhibits-teaching}, t_i\rangle = \mathbf{t} \;\Longrightarrow\; \langle \iota_a, \texttt{maintains-standing-in}, O\rangle = \mathbf{t}$$

Failure on any teaching ($\mathbf{f}$ or $\top$) breaks the universal $\bigwedge$ and the standing-cell does not settle at $\mathbf{t}$. Standing-loss is detected as substrate-algebraic content: the universal antecedent fails.

This is *continuous accountability*: not periodic review at term-end, but ongoing evaluation. Each new conduct-witness updates the relevant teaching's cell; each update potentially affects standing.

## Distinguishing structural property: standing is endogenous

Per the survey, "leadership selection reflects embodiment of the seven teachings rather than election by voting or appointment by external authorities." Substrate-algebraically:

- The standing-cell is settled by the community's evaluation-witnesses, not by an installation increment from an external authority.
- The standing-cell is *not* a constitutive cell that an installer asserts; it's a *derivative* cell that fires under the conjunction of teaching-evaluation cells.
- A leader whose conduct evaluation degrades loses standing *automatically* — the closure rule that gates standing on the teaching cells fails to fire, and previously-settled standing-cells move toward $\mathbf{f}$ as the substrate processes contradicting evidence.

This contrasts with formal-installation governance where standing is held by virtue of being-installed, and removal requires a separate explicit act. In conduct-teachings governance, standing is *continuously verified*; loss of standing is the substrate's natural consequence of evaluation failure, not a separate removal event.

## Comparison with rule-following and capability-matching

| | Conduct teachings | Rule-following | Capability-matching |
|---|---|---|---|
| Primary basis | Embodiment of named virtues | Compliance with formal rules | Demonstrated skills |
| Evaluation | Continuous, communal | Periodic, formal | Initial assessment |
| Loss-of-standing | Endogenous (evaluation degrades) | Exogenous (removal-act required) | Re-assessment-required |
| Substrate cells primary | `exhibits-teaching` | `complied-with-rule` | `provides-capability` |
| Visibility | Public conduct-witnesses | Formal-record-witnesses | Skill-demonstration witnesses |

Conduct-teachings is structurally distinct from rule-following: a rule-follower can lose standing only by violating a specific rule; a conduct-teachings leader can lose standing by *failing to embody a virtue* even without specific rule-violation. The substrate carries either; the polity's choice is which evaluation pattern is primary.

## The teachings as named cells, not abstract principles

A common Western misreading: treat virtues as abstract ethical principles rather than as substrate-tracked cells. Substrate-algebraically, the teachings are *named predicates* with definite cell-evaluation. The cell $\langle a, \texttt{exhibits-bravery}, \tau\rangle$ has a definite value; community-witnessed acts fire the cell; the substrate maintains the cell's evolving state.

The point: virtue-based governance is not anti-formal. It's *formal in a different cell-pattern* than rule-based governance. The substrate carries virtue-cells with the same precision as it carries rule-violation cells.

What this requires structurally: the closure-rule subsystem $\mathcal{S}_{\mathrm{Tch}}$ must include rules for *what counts as evidence of each teaching*. "Bravery" must be operationalized as substrate-readable patterns — specific conduct-witnesses that the closure rule recognizes as bravery-evidence. Without this operationalization, the cell remains at $\bot$ regardless of what conduct occurs.

This is the structural commitment community-judgment carries: the community's witnessing-practice *is* the operationalization. The closure-rule subsystem's content is built up by the community's accumulated history of witnessing, naming, and accepting "this counts as bravery, that does not." The substrate-algebraic content of "community judgment" is exactly this accumulated witnessing.

## Settling regime

A conduct-teachings discipline is typically Scott-continuous: each conduct-witness fires the relevant teaching cell finitely; the standing cell aggregates finitely-many teaching cells via $\bigwedge$. Closure ordinal $\kappa = \omega$.

A discipline that aggregates *across all prior community-witnessing* (e.g., a teaching whose evaluation reads the cumulative witnessing-history rather than recent witnesses only) lifts the regime to transfinite-bounded — substrate-algebraic content of *deep traditions* whose virtue-evaluations require communal accumulated wisdom, not just current witnessing.

## Composition with rotational authority

When conduct-teachings governance is paired with [rotational-authority](./rotational-authority.md): each rotation's incumbent must maintain the teaching evaluations during their term. Loss-of-standing during the term triggers early relief and rotation to the next eligible member. The substrate handles this naturally: the rotation closure rule fires either at term-end or on standing-loss, whichever comes first.

This combination is structurally rich: rotation distributes authority-experience; conduct-teachings ensures during-term accountability. A polity with both has a substrate that simultaneously rotates authority and continuously evaluates the current incumbent's conduct.

## Composition with consensus closure

Conduct-teachings evaluation can also feed into [consensus-closure](./consensus-closure.md): the populace's alignment cells on a decision can be conditioned on whether the proposers exhibit the teachings. Closure rule:

$$\langle a, \texttt{aligns-with}, \phi\rangle = \mathbf{t} \;\Longleftrightarrow\; \langle a, \texttt{believes-proposer-exhibits-teachings}\rangle = \mathbf{t}$$

— alignment depends on the proposer's standing under the teachings. Substrate-algebraic content: decisions don't settle by raw aggregation of preferences; they settle conditional on the substrate's evaluation of the proposers' embodied conduct.

## What this object imports from Anishinaabe

A substrate-algebraic alternative to rule-compliance and capability-matching as bases of leadership accountability: continuous evaluation against named virtues, with standing endogenously derived from conduct cells. Predicated-governance carries this as one of several admissible accountability patterns. The Anishinaabe specific list ($\Theta = $ love, respect, bravery, truth, honesty, humility, wisdom) is one instantiation; the structural pattern admits other named virtue sets from other traditions.
