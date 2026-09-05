---
type: concept
class: discipline
depends-on: [closure-rule, canonical-form]
see-also: [validate-against-shape, repair, settle]
---

# Algebraic constraint validation

The substrate's discipline of declarative pre-commit checks: invariants that the substrate's content must satisfy *as content*, expressed as logic-program constraints rather than imperative validation code. Where [shape conformance](../morphisms/validate-against-shape.md) checks a single predication or entity against its declared shape, algebraic constraint validation checks substrate-wide laws — laws that quantify over many predications, or over relationships between predications, or over invariants that cannot be reduced to per-entity checks.

Three examples make the kind of law concrete:

- **Closure-rule monotonicity.** Every closure-rule application must raise the substrate's value-domain content (per the join), never lower it. Falsifying this requires comparing the pre-application and post-application fibers across the entire region the rule touched — not a per-predication check.
- **Restriction-map preservation.** A restriction from a later fiber to an earlier one must preserve the value-domain operations: meet, join, implication, top, bottom. Falsifying this requires checking the restriction's algebraic homomorphism property over many predications.
- **Sheaf-gluing uniqueness.** When a covering family of compatible local sections claims to assemble into a global section, the assembly must be unique. Falsifying this requires comparing two candidate amalgamations across an entire covering family.

These laws cannot be cheaply enforced by per-write Pydantic-style validators or per-predication shape checks; they require quantification over fibers, sections, or covering families. The substrate's discipline is to express them as declarative logic-program constraints — readable, inspectable as data, and outside the substrate's runtime code path — and to evaluate them as a pre-commit check before the substrate accepts a write.

## Why the layer is separate from settlement

Settlement is what a [closure rule](closure-rule.md) does: derive new content from existing content under the substrate's algebra. Algebraic constraint validation is what an *invariant* does: refuse content that would violate a substrate-wide law, before that content enters the store. The two are different responsibilities:

- A closure rule's premise matches a region's existing content; its conclusion is *added* content. The settlement loop continues until no rule's premise matches an unrecorded conclusion.
- An algebraic constraint's premise also matches existing content; but its *purpose* is to *prevent* content from being committed if doing so would falsify the constraint. Constraints do not derive new content; they accept-or-reject candidate writes.

A substrate that conflates the two has a category mistake: closure rules can have unbounded settlement chains; constraints must terminate (the substrate's commit cannot wait on an unbounded check). The discipline is to keep them in separate layers — closure rules as derivation; constraints as gate.

## What the layer commits to

Three engineering invariants every conforming algebraic-constraint-validation discipline commits to:

- **Declarative form.** Constraints are written as logic-program terms — Datalog, ASP, Prolog, miniKanren, whatever the substrate's runtime supports. They are *not* imperative validation procedures; they are facts and rules about what the substrate's content must satisfy. The form makes them inspectable: any reader of the substrate's content can read the constraints in the same way.
- **Pre-commit evaluation.** Constraints are checked before the candidate write is committed. A constraint violation rejects the write with the constraint's identifier and a witness of why; the substrate's content remains in the prior valid state. Per [witness](witness.md), the rejection is itself an event-log entry — the substrate's audit trail records what it refused, not just what it accepted.
- **Termination under finite content.** Constraint evaluation must terminate over the substrate's bounded content. The substrate's [value-domain](substrate-value-domain.md) is finite (per the substrate's commitments); the substrate's history at any moment is finite; constraints over those finite quantities must check in bounded time. A constraint whose evaluation does not terminate is not admissible; the discipline is to choose a logic-program semantics (typically ASP under stable-model semantics, or Datalog under bottom-up evaluation) that guarantees termination.

## Constraints versus shapes versus repairs

Three adjacent disciplines, each with a distinct role:

| Layer | What it does | Acts on | Outcome |
|---|---|---|---|
| Shape conformance | Per-entity structural check (per [validate-against-shape](../morphisms/validate-against-shape.md)) | A single predication or entity | Reject malformed content |
| Algebraic constraint validation | Substrate-wide invariant check | Many predications, fibers, covering families | Reject content that would violate a law |
| [Repair](repair.md) catalog | Reconcile contradictions discovered after admission | Existing substrate content | Resolve a known violation per a recipe |

Shape conformance is per-write; it checks one predication at a time. Algebraic constraint validation is also per-write, but quantifies over many predications. Repair is post-admission; it operates on already-recorded contradictions per a declared catalog. The three together are the substrate's full validity discipline — shape for malformed content, constraints for ill-formed content, repair for already-admitted contradictions.

## The constraint catalog as substrate content

Per [self-representation](self-representation.md), the substrate's algebraic constraints are themselves substrate content — predications declaring constraint identifiers, the logic-program text of each constraint, the constraint's enforcement scope, the constraint's severity (strict-rejection or recoverable-with-repair). Editing the constraint catalog is admitting predications about constraints, like editing any other substrate content.

The pattern means a substrate's invariant set evolves through the substrate's normal change discipline: a new constraint is introduced by admitting a constraint-record predication; an existing constraint is retired by retracting it; a constraint's logic-program text is amended by superseding the prior version. The substrate's [bootstrap](bootstrap.md) discipline establishes the initial constraint catalog; subsequent admissions update it.

## Position in the substrate

Algebraic constraint validation is the substrate's *enforced laws layer*. Without it, substrate-wide invariants depend on every closure rule and every shape having been independently designed to maintain them — a coordination burden that scales poorly. With it, the laws are stated once, in declarative form, and the substrate's commit path checks them uniformly. The substrate's content is then provably constrained: any committed write is an entry that passed the constraint catalog of the moment it was committed, witnessed in the event log.

The layer composes with [closure-rule-application](../morphisms/closure-rule-application.md) (constraints check the post-application state before commit), with [federation-as-substrate-join](teaching/explanations/federation-as-substrate-join.md) (federated content arrives across boundaries and must pass the receiver's constraint catalog before entering the local substrate), and with [hash-discipline](hash-discipline.md) (a constraint witness includes the hash of the candidate content the constraint applied to, making the rejection reproducible).

The pattern's hard discipline is to refuse to encode constraints as imperative runtime code. A substrate that has a "validate function" that branches on predication content has lost the inspectability of the declarative form; the constraints are now in the runtime, not in the substrate. The right structure is a logic-program record in the substrate, evaluated by a constraint evaluator the substrate runs uniformly over every commit.
