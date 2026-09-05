---
type: definition
class: substrate-entity
realizes: [algebraic-constraint-validation]
depends-on: [closure-rule-system]
see-also: [closure-rule-record, shape-record, repair-catalog]
---

# Constraint record

The substrate-entity formal definition of one [algebraic constraint](teaching/explanations/algebraic-constraint-validation.md): a logic-program declaration of a substrate-wide invariant the substrate must check before committing any candidate write. Distinct from [closure-rule records](closure-rule-record.md) (which derive new content) and from [shape records](shape-record.md) (which check single-predication conformance); a constraint record asserts a *quantified* invariant over many predications, fibers, or covering families and is evaluated as a pre-commit gate.

## Structural fields

A constraint record carries:

- **`id`** — kebab-case identifier (commonly `nucleus-extensivity`, `restriction-map-meet-preservation`, `sheaf-gluing-uniqueness`, etc.).
- **`description`** — one-line summary of the invariant the constraint enforces.
- **`logic-program-text`** — the constraint's body in a declarative logic-program form (Datalog, ASP, miniKanren, Prolog — the choice depends on the substrate's evaluator). The text is substrate content, queryable like any other predication.
- **`evaluator`** — reference to the [evaluator](teaching/explanations/algebraic-constraint-validation.md) entity declaring how the logic-program is run (e.g., a clingo-binding entity, a Datalog-engine entity).
- **`scope-applicability`** — reference to the [scope](scope-record.md) the constraint is active in. Constraints applicable to scope $S$ apply to every commit affecting content within $S$.
- **`severity`** — one of `strict-rejection` (a violating commit is rejected), `repairable` (a violation triggers a [repair-catalog](repair-catalog.md) entry), or `warning` (the violation is logged but the commit proceeds).
- **`closure-kind`** — `process` for constraints whose evaluation is deterministic and bounded; required since constraints must terminate per the algebraic-constraint-validation discipline.
- **`fuel-bound`** — explicit upper bound on the evaluator's running time. Constraints exceeding the bound are treated as inconclusive — neither pass nor fail — and surface as repair tickets.

## Invariants

- **Termination-guaranteed.** The cited evaluator's semantics must guarantee termination over finite substrate content. Stable-model semantics (ASP), bottom-up Datalog, and well-founded semantics all qualify; full Prolog with unbounded recursion does not without an explicit cut policy.
- **Scope-applicability respects scope hierarchy.** A constraint applicable to scope $S$ is implicitly applicable to scopes nested within $S$, unless explicitly disabled at the inner scope.
- **Severity determines behavior.** A `strict-rejection` constraint that fails causes the candidate write to be rejected with a witness recording the rejection. A `repairable` constraint that fails causes the write to be admitted but flagged with a repair-catalog ticket. A `warning` constraint produces a logged event but no behavioral consequence.
- **Self-representation respected.** Per [self-representation](teaching/explanations/self-representation.md), the constraint record itself is substrate content — its logic-program-text is editable through the substrate's normal admission discipline. Editing the constraint catalog produces witnesses; the substrate's audit trail records every constraint addition, modification, and retirement.

## Operations

- *Evaluate.* Given a candidate write and the substrate's current content, the evaluator runs the constraint's logic program over the relevant facts. Returns `pass` (commit), `fail` (per severity), or `inconclusive` (fuel exhausted).
- *Trace.* When a constraint fails, produce a witness identifying the violating predications and the constraint's pattern they violated. Lets the substrate's audit identify the cause of the rejection.
- *Versioned activation.* A constraint record's `version-hash` lets witnesses cite the active constraint catalog at commit time. Replay against a different catalog version may produce different acceptance decisions; the witness records which version was active.
- *Federate.* When two substrates federate, the receiving substrate consults its own constraint catalog before admitting peer-content. Peer content that fails a local constraint is rejected at the boundary, with the rejection witnessed.

## What the constraint record is not

- **Not a closure rule.** A [closure-rule record](closure-rule-record.md) derives new content from existing content; a constraint record refuses content that would violate an invariant. Closure rules can have unbounded settlement chains; constraints must terminate per their evaluator's guarantees.
- **Not a shape.** A [shape record](shape-record.md) checks single-predication conformance to a declared structural pattern; a constraint quantifies over many predications. The two run at different commit-path stages: shape conformance first (per-predication), then constraint evaluation (substrate-wide).
- **Not a repair recipe.** A [repair-catalog](repair-catalog.md) entry describes how to *fix* a known violation; a constraint detects whether a violation exists. Repairable constraints cite their applicable repair-catalog entries as a downstream concern, but the constraint itself only detects.

## Position in the substrate

The constraint record is the substrate's *invariant declaration unit*. Without it explicitly named, substrate-wide invariants live in imperative validation code (a "validate function" with branching logic), and the substrate cannot reason about them as substrate content. With it, every invariant is a substrate-recorded predication, queryable, version-able, federation-portable, and uniformly evaluated at the commit boundary.

The pattern composes with [algebraic-constraint-validation](teaching/explanations/algebraic-constraint-validation.md) (the discipline this object instantiates), with [closure-rule-system](closure-rule-system.md) (which the constraint catalog complements at the same scope), with [repair-catalog](repair-catalog.md) (which repairable constraints cite for resolution), and with [witness](witness.md) (which records every constraint evaluation outcome).
