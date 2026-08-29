---
type: question
status: set-aside
explores: [scope, closure-conditions, locale]
---

# Does the Caramello three-level correspondence map the corpus's stage progression precisely?

The older relational-system specs cite Caramello's three-level sequence as the structural foundation of the development progression:

1. **Geometric theory** (a syntactic category) — corresponds to the older specs' Blueprint stage.
2. **Syntactic site** $(C, J)$ — corresponds to the Charter stage.
3. **Classifying topos** $\mathbf{Sh}(C, J)$ — corresponds to the Locale stage.

The corpus's [closure-conditions](teaching/explanations/closure-conditions.md) names a five-stage progression:

1. **Bare presence** (condition 1 only).
2. **Composable structure** (1–4).
3. **Constraint-equipped** (1–5).
4. **Self-generating** (1–6).
5. **Closed** (1–7).

The two progressions are similar but not isomorphic:

- The Blueprint stage in the older spec corresponds to either *constraint-equipped* (condition 5 added) or *self-generating* (condition 6 added) in the corpus, depending on which subset of conditions 1–6 is meant. The older spec is ambiguous about this.
- The Charter stage in the older spec corresponds approximately to a state between *self-generating* and *closed* — the topology has been declared but the sheaf condition has not yet activated. The corpus does not have a named in-between stage.
- The Locale stage corresponds to *closed* in the corpus.

The question is whether the missing in-between stage (Charter — topology declared but sheaf-condition not yet active) is engineering content the corpus should capture as its own named stage. The older specs treat it as structurally distinct: a region that has the covering structure but is not yet receiving live sections is operationally different from a region without the covering structure (different from constraint-equipped) and from a region with active sheaf-gluing (different from closed).

Engineering candidates:

- The corpus could add a *charter* stage between *self-generating* and *closed*: the [scope-record](../objects/scope-record.md)'s `completion-stage` could carry an additional value like `charter` or `topology-declared`.
- Alternatively, the topology declaration could be captured as a substrate operation that is admissibility-required *before* live sections are admitted; the substrate's discipline would then make Charter implicit (declared by the operation's success) without naming it as a separate stage.
- The corpus could leave this open as engineering choice — different platforms may implement either approach.

The set-aside framing: the Caramello correspondence is a precise mathematical claim about the topos-theoretic content of the progression; the corpus is engineering content that doesn't directly cite the math. Whether the engineering progression *needs* the charter stage as a named stage, or whether the substrate's commit-then-activate discipline captures the same content, is open.

Source: `work/triage/engineering-archive/library/triage/relational-system/relational-system-charter.md`.
