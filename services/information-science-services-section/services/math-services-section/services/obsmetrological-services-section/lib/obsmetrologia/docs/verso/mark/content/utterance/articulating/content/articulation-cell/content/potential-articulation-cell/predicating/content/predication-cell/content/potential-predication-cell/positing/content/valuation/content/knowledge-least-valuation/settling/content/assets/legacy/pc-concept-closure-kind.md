---
type: concept
class: classification
depends-on: [closure-rule, settling-as-computation]
see-also: [extend-restrict-adjoint, settle, closure-rule-application]
---

# Closure kind

The substrate's four-position taxonomy for *what kind of closure-rule application* an operation is, classified by which of the two structural directions (closure against the past, closure against the future) the operation leaves stable. The taxonomy is structurally fundamental — it is a four-quadrant partition of every operation the substrate can perform — and it is operationally load-bearing: an operation's closure kind determines its scheduling, its determinism guarantees, and its admissible runtime support.

In the math reformulation, the two directions are realized as a pair of [closure operators](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md) on the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md): one closure $\sigma$ that drives a valuation toward what accumulated history forces, and one closure $\Delta$ that drives toward what every forward extension already commits to. The four positions of this concept correspond to whether each closure has reached fixed-point on the operation's output.

The four positions are:

- **Process.** Both closures are stable across the operation — the output sits in $\mathrm{Fix}(\sigma) \cap \mathrm{Fix}(\Delta)$. A process operation is fully deterministic: the same input produces the same output, and once produced, the output is stable forward (no future state changes it) and stable backward (no further reflection refines it). Implementations: a pure function, a deterministic graph rewrite, a canonical-form computation. Substrate cost: bounded and predictable.
- **Derivation.** $\sigma$ is open, $\Delta$ is stable. A derivation operation produces a new conclusion that the substrate has not yet recognized — saturation has not closed against it — but once produced, the conclusion is stable forward. Implementations: an LLM-generated derivation against a typed conclusion shape, an inference whose form is fixed but whose content is novel. Substrate cost: variable (the derivation is the open-ended part); witness records the input, the rule, and the derived output as a finalized conclusion.
- **Procedure.** $\sigma$ is stable, $\Delta$ is open. A procedure operation routes — its saturation against the past is settled (the prerequisites are met), but its transfer (which next step is appropriate) is the open question. Implementations: a dispatch decision, a control-flow branch, a routing rule. Substrate cost: small per invocation; the operation produces a step-direction, not a state change.
- **Inquiry.** Both $\sigma$ and $\Delta$ are open. An inquiry operation explores: neither the past's recognition of the topic nor the future's commitment to a direction is settled. Implementations: an open-ended LLM agent invocation, a research session, an unstructured exploration. Substrate cost: unbounded by the substrate's algebra; bounded only by the substrate's [fuel](fuel-bound.md) discipline applied as a hard cap.

The four positions are exclusive: every [closure-rule](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule.md) application falls into exactly one. An operation that crosses positions has been mis-specified — typically, two operations have been merged into one, and the substrate's discipline is to split them.

## Why the taxonomy matters

The closure kind determines several substrate-level engineering decisions:

- **Determinism guarantees.** Process and Procedure are fully deterministic. Derivation is deterministic given a result-type contract (the substrate's [shapes](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/scope/shape/shape.md) constrain the output). Inquiry is non-deterministic by design. Replay tests treat the four kinds differently: a Process replay produces byte-identical output; a Derivation replay produces output that satisfies the same shape; a Procedure replay produces the same routing decision; an Inquiry replay produces output the substrate cannot guarantee to match.
- **Implementation surface.** Process operations are pure functions in the substrate's runtime. Derivation operations are LLM agents with structured-output constraints. Procedure operations are dispatch logic. Inquiry operations are unconstrained LLM agents or human-driven sessions. The four require different engineering substrates: Process needs only deterministic compute; Inquiry needs the full agential surface with [scope](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/scope/scope.md), [authorization](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/governance/authorization/authorization.md), and [governance](theories/agential-orchestration-platform/concepts/governance.md).
- **Scheduling and parallelization.** Two Process operations can run in parallel without coordination provided their inputs are independent. Two Derivation operations parallelize when their input contexts don't conflict. Two Procedure operations may produce conflicting routing decisions and require serialization at the dispatch layer. Two Inquiry operations are inherently independent at substrate level (their outputs are exploratory, not authoritative) and can fan out freely.
- **Witness shape.** The witness for each closure-kind records different evidence: a Process witness shows input hash, rule version, output hash; a Derivation witness adds the derivation's premise and the conclusion's shape conformance; a Procedure witness adds the routed-to direction and the dispatch-rule that selected it; an Inquiry witness records only the session's bounded artifacts (the substrate cannot witness exploration completeness).

## Closure kind and the extend/restrict adjoint

Per [extend-restrict-adjoint](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/extend-restrict-adjoint.md), the substrate's two binary value-domain operations are extend ($\odot$, [twist-product fusion](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md)) and restrict ($\Rightarrow$, [twist-product right residual](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-right-residual.md)). The closure kind tells you which of the operation's two algebraic moves is the *open* one:

- Process: the operation is a fixed `⊙`/`⇒` composition. Both extension and restriction are determined by the rule.
- Derivation: the operation's restriction is fixed (the result-type shape) but the extension is open (the substrate is *deriving* what content to add).
- Procedure: the operation's extension is fixed (the substrate's existing content) but the restriction is open (the substrate is *choosing* the next step).
- Inquiry: both extension and restriction are open.

The mapping is what makes the closure kind structurally precise: an operation's classification is decided by inspecting which of the two algebraic operations the operation specifies and which it leaves to substrate-external resolution.

## Common pathologies

Three frequent confusions worth refusing:

- **Treating an Inquiry as a Process.** A substrate that schedules an open-ended LLM session as if it were a deterministic transformation has hidden the inquiry's variability behind a process interface. The substrate's audit cannot reproduce the inquiry's output; replay tests will fail intermittently. The fix is to *declare* the closure kind as Inquiry and accept the variability at the schema level.
- **Treating a Derivation as a Procedure.** A substrate that uses an LLM agent for a routing decision has confused the open-extension Derivation kind with the open-restriction Procedure kind. The agent should be deriving content (a recommendation, a label, a structured value) and a separate Procedure operation should consume that derivation to produce the routing. Splitting the two makes both auditable.
- **Letting a Procedure leak into Inquiry.** A routing rule that requires open exploration to make its decision has crossed into Inquiry territory. The fix is either to pre-derive the inputs the routing rule needs (so the routing becomes a Procedure) or to declare the routing as an Inquiry-driven operation with the substrate's full Inquiry-kind discipline.

## Position in the substrate

Closure kind is the substrate's *operation taxonomy*. Without it, every closure-rule application is a black box with implicit determinism guarantees; with it, every operation declares what kind of closure it performs and the substrate's runtime can apply the right scheduling, witnessing, and replay discipline. The four-position structure is what makes the substrate's mixed deterministic/exploratory operations coexist coherently — Process and Procedure run with full reproducibility, Derivation runs with shape-bounded reproducibility, Inquiry runs with explicit non-determinism — and what makes auditors able to reason about any operation's expected variance before they look at its specific output.

The taxonomy composes with [closure-rule](closure-rule.md) (which declares its kind in its specification), with [settle](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/flatfile-agentic-resource-system/code/transformers/settle.md) (which schedules different kinds differently), and with [witness](witness.md) (whose schema includes the kind and the kind-specific evidence).
