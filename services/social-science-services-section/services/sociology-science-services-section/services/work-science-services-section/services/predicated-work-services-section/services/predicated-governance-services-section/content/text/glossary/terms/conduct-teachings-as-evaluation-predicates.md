---
type: definition
class: evaluation-fiber
status: draft
depends-on: [office-as-double-settlement, jural-relation, polity]
realizes: [seven-grandfathers-teachings, anishinaabe-governance]
aliases:
  - Conduct teachings as evaluation predicates
---

# Conduct teachings as evaluation predicates

The mathematical realization of *conduct teachings* as the primary basis of leadership accountability — drawn from the Anishinaabe Teachings of the Seven Grandfathers (love, respect, bravery, truth, honesty, humility, wisdom) per the [indigenous-governance-traditions survey](../../../../../../../governance-services-section/content/text/documents/notes/2026-04-03-note-on-indigenous-governance-traditions-survey.md). Where formal-legal accountability operates through rule-violation detection, teachings-based accountability operates through *continuous evaluation of conduct against named virtues*. Loss of standing follows from visible failure to embody the teachings.

## Data

A conduct-teachings discipline within a [polity](../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/polity.md) $\mathcal{P}$ is a tuple

$$\mathrm{Tch} \;=\; (\Theta,\; \mathrm{eval},\; \mathrm{recog})$$

where:

- $\Theta = \{t_1, t_2, \ldots, t_k\}$ — the *teachings* (named virtues): each is a substrate predicate. For Anishinaabe, the seven: $\Theta = \{\texttt{love}, \texttt{respect}, \texttt{bravery}, \texttt{truth}, \texttt{honesty}, \texttt{humility}, \texttt{wisdom}\}$. Other traditions name different sets (Confucian *li/yi/ren*, Stoic *cardinal-virtues*, Aristotelian *aretai*, etc.).
- $\mathrm{eval}: \mathrm{Pop}_\mathcal{P} \times \Theta \to \mathbf{FOUR}$ — the *evaluation function*: for each agent and each teaching, the substrate carries a cell $\langle a, \texttt{exhibits-teaching}, t_i\rangle = v$ recording the substrate's accumulated evidence of $a$'s conduct on teaching $t_i$.
- $\mathrm{recog}$ — the *community-judgment recognition* mechanism: closure rules by which evaluation cells are settled by community-witnessed conduct. Conduct-witnesses fire the cells; the cells accumulate over time per [settling-monotonicity](../../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md).

## How standing depends on the teachings

For an [office](../../../glossary/terms/office-as-double-settlement.md) $O$ accountable through conduct teachings, the agent's incumbency is conditional on their evaluation cells reaching/maintaining $\mathbf{t}$ on each teaching:

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

## Regime

A conduct-teachings discipline is typically Scott-continuous: each conduct-witness fires the relevant teaching cell finitely; the standing cell aggregates finitely-many teaching cells via $\bigwedge$. Closure ordinal $\kappa = \omega$.

A discipline that aggregates *across all prior community-witnessing* (e.g., a teaching whose evaluation reads the cumulative witnessing-history rather than recent witnesses only) lifts the regime to transfinite-bounded — substrate-algebraic content of *deep traditions* whose virtue-evaluations require communal accumulated wisdom, not just current witnessing.

## Composition with rotational authority

When conduct-teachings governance is paired with [rotational-authority](rotational-authority.md): each rotation's incumbent must maintain the teaching evaluations during their term. Loss-of-standing during the term triggers early relief and rotation to the next eligible member. The substrate handles this naturally: the rotation closure rule fires either at term-end or on standing-loss, whichever comes first.

This combination is structurally rich: rotation distributes authority-experience; conduct-teachings ensures during-term accountability. A polity with both has a substrate that simultaneously rotates authority and continuously evaluates the current incumbent's conduct.

## Composition with consensus closure

Conduct-teachings evaluation can also feed into [consensus-closure](consensus-closure.md): the populace's alignment cells on a decision can be conditioned on whether the proposers exhibit the teachings. Closure rule:

$$\langle a, \texttt{aligns-with}, \phi\rangle = \mathbf{t} \;\Longleftrightarrow\; \langle a, \texttt{believes-proposer-exhibits-teachings}\rangle = \mathbf{t}$$

— alignment depends on the proposer's standing under the teachings. Substrate-algebraic content: decisions don't settle by raw aggregation of preferences; they settle conditional on the substrate's evaluation of the proposers' embodied conduct.

## What this object imports from Anishinaabe

A substrate-algebraic alternative to rule-compliance and capability-matching as bases of leadership accountability: continuous evaluation against named virtues, with standing endogenously derived from conduct cells. Predicated-governance carries this as one of several admissible accountability patterns. The Anishinaabe specific list ($\Theta = $ love, respect, bravery, truth, honesty, humility, wisdom) is one instantiation; the structural pattern admits other named virtue sets from other traditions.

The individual teaching-evaluation cells $\langle a, \texttt{exhibits-teaching}, t_i\rangle$ are $\leq_k$-monotone once settled at $\mathbf{t}$.
By the [predication-settling CALM corollary](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/formalization/infomaterial/lib/infomaterial/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/settling-calm-corollary.md):

- Confirming that an agent exhibits a teaching is coordination-free: any replica with local conduct-witness records can confirm positive teaching-exhibition.
- Confirming that an agent *fails* a teaching requires coordination: it's confirming the *absence* of positive witnessing (or the presence of contradicting witnesses), which is anti-monotone.

For the standing-cell $\langle \iota_a, \texttt{maintains-standing-in}, O\rangle$ (the $\bigwedge$ of all teaching cells): since it is the truth-order meet of the individual teaching cells, it is itself $\leq_k$-monotone at $\mathbf{t}$ while all component cells remain at $\mathbf{t}$.
However, as soon as any teaching cell receives a contradicting conduct-witness (moving toward $\mathbf{f}$ or $\top$), the meet is no longer monotone.
This means:

- Confirming an agent *has* standing is coordination-free while all teaching cells are positive.
- Detecting *standing loss* — the moment a teaching cell degrades — requires coordination.

This is the CALM-theoretic content of "leadership standing requires ongoing communal witnessing": the community's distributed witnessing is individually coordination-free on positive evidence; only coordinating degradation signals (who has witnessed which failure) constitutes the contested case.

The [truth-knowledge long exact sequence](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/truth-knowledge-cohomology-long-exact-sequence.md) applied to the teaching-evaluation sheaf $\mathcal{F}_{\mathrm{Tch}}$:

A *consistent standing* (all teaching cells at $\mathbf{t}$): $\mathcal{F}^{(\top)}_{\mathrm{Tch}} = 0$, LES collapses, $H^n_t \cong H^n_k$.
No contradiction.

A *contradicted teaching* (cell $\langle a, \texttt{exhibits-teaching}, t_i\rangle = \top$, from conflicting conduct-witnesses): $\mathcal{F}^{(\top)}_{\mathrm{Tch}} \neq 0$ on that teaching's cell.
The connecting morphism $\partial: H^0(\mathcal{F}^{(\top)}_{\mathrm{Tch}}) \to H^1_t(\mathcal{F}^{(t)}_{\mathrm{Tch}})$ is non-zero, producing a non-trivial $H^1_t$-class encoding the *unresolved conduct dispute*.
The dispute is substrate-readable: $H^0(\mathcal{F}^{(\top)})$ ranks it (one class per contradicted teaching), and $[\partial]$ maps it to the degree-1 obstruction.

This gives the conduct-teachings discipline a cohomological health metric: $H^0(\mathcal{F}^{(\top)}_{\mathrm{Tch}}) = 0$ means all teaching evaluations are consistent; $H^0(\mathcal{F}^{(\top)}_{\mathrm{Tch}}) \cong \mathbb{Z}^k$ means $k$ teachings are in disputed-conduct state.
The community's consensus process — [consensus-closure](consensus-closure.md) applied to the disputed teaching cells — is the governance mechanism for reducing $k$ to 0 (repairing the inconsistency sheaf).
