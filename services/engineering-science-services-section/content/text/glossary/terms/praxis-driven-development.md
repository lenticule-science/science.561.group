---
name: "Praxis-Driven Development"
kind: term
date-created: 2026-10-14
aliases: ["praxis-driven engineering", "praxis-selected development"]
relations:
  grounded-in: engineering-science
  selects: correctness-by-construction
  serves: requirements-engineering
provenance:
  historical-source: https://github.com/emsenn/civics/blob/main/operations/engineering/triage/operations/command/ideas/triage/praxis-driven-development.md
  historical-source-blob: 5d960f9a4a08719309647ec545b55c42da38cc8e
  original-utterance-date: 2026-04-04
---

# Praxis-Driven Development

**Definition.** A principle for selecting and revising an engineering endeavor's requirements: actual authorized practice, observed demand, incumbent work, resource constraints, and external recipients determine which capability the institution develops next. The selected capability is *realized* by a deliberate engineering life cycle: requirements, specification, architecture, detailed contracts, construction, verification, integration and independent receiving.

The original April 4, 2026 formulation says that the practices necessary to advance an endeavor determine what gets built. Here that proposition is retained with its source and developed into a specific scientific distinction: **praxis selects the engineering problem; Correctness by Construction (CbC) governs the engineering solution**. This is a semantic refinement, not a verbatim republication of the historical note.

## Scientific standing and hypotheses

Praxis is an observed, situated activity under agents' actual rights and constraints, not a code editor's sequence of trial executions. For an endeavor E and observation time t, let P(E,t) be a provenance-bearing set of practical demands, existing capabilities, recipient conditions, permissions and measurable costs. Let R be feasible candidate requirements; let V(r|P) be the *hypothesized* receiver value of satisfying requirement r in context P, including maintenance, risk and opportunity cost. Practical selection is the constrained decision:

$
r^{*} \in \operatorname*{arg\,max}_{r\in R_{\mathrm{admissible}}} V\!\left(r\,\middle|\,P(E,t)\right).
$

This is a model for inquiry; it is not a proved universal utility law, a claim of cardinal comparability among all obligations, or an Obsmetrologia theorem. Some requirements are only partially ordered; legal, safety, preservation and customer duties may be hard constraints. The empirical claim is narrower: selecting development by real practice and verifiable beneficiary value should outperform selecting by the convenience of a particular source file, an attractive feature, or an incidental failing build, under a stated comparison.

Separate four investigations: (a) *observation* of practice, including losses and outside obligations; (b) *inference* from that observation to a warranted requirement; (c) *design* of a system meeting the requirement; (d) *receipt* of value from the independently operated system. Each transition has a different evidentiary instrument. Recorded intent, proof, tested implementation, installed capability and customer acceptance are different states.

## Engineering realization: Correctness by Construction (CbC)

The established industrial engineering method is **Correctness by Construction**, implemented with specification-based refinement, contract-based design, and V-model verification and validation. The practical selector and construction method together yield one executable passage:

1. **Observe demand.** Identify the original principal, real beneficiary, current practice, external dependencies, permitted effects, present cost and independently observable valuable result. Evidence is time- and source-qualified.
2. **State requirements.** Express atomic, feasible, testable system requirements and measurable quality attributes; give each a source, rationale and receiver criterion. Reconcile them through the actual work/requirements owner.
3. **Specify the system.** Define actors, inputs, outputs, units, identities, authority, states, invariants, resource envelopes and required responses. Link science claims and applicable standards to the constraints they actually support.
4. **Architect by viewpoints.** Trace stakeholder concerns to owned components, interfaces, failure domains, data custody, deployment topology, and end-to-end producer/consumer dependency relationships. Compare alternatives on capacity, cost, preservation, evolvability and real market fitness.
5. **Refine to detailed contracts.** Derive typed preconditions, postconditions, invariants, refusal semantics, admissible effects, persistence, concurrency, version and migration obligations. Establish supplier/consumer identity and source closure using existing code/workspace types.
6. **Admit fabrication deterministically.** Use the already implemented Red Cup Data [artifact-fabrication source](https://github.com/red-cup-engineering/computer-data-engineering-services-section/blob/main/src/artifact-fabrication.mjs): `admitArtifactFabricationSpecification` validates source provenance, requirements, law/standard constraints, projections, acceptance obligations and full requirement traceability; `admitArtifactFabricationRealizationPlan` binds the admitted specification digest and complete target/acceptance coverage. The Code engine [reexports these exact operations](https://github.com/red-cup-engineering/computer-code-development-engine/blob/main/src/artifact-fabrication.mjs). A software producer may specialize the admitted artifact, but the common data laws remain owned there.
7. **Construct from the admitted design.** Use existing generators, qualified package interfaces, pinned source and reproducible build composition. Derive tests from the admitted contracts: detailed design ↔ unit/contract tests; architecture ↔ integration tests; requirements ↔ system tests; actual beneficiary need ↔ independent validation.
8. **Receive and learn.** Record the source and integrated product identity; assay runtime state and customer effects separately. Feed received deviations into the *original* scientific hypothesis, requirement and design owners, then make a new qualified refinement of the same endeavor.

The output of one stage is an attributable typed input to the next. This supports human, large-model, small-model and automatic API execution through deterministic admission functions and independently testable receiver conditions. Written methods explain how to use those functions; they do not constitute their implementation.

## Progressive determinization: from an agent's judgment to a reproducible operation

The original [April 7 sender-identity architecture](https://github.com/emsenn/civics/blob/main/operations/engineering/triage/operations/command/ideas/triage/unified-architecture-from-sender-identity.md) (blob `734c4fc9cd5ed3b72f4043467948ce1eb6fb00be`) proposes moving an action from expensive general reasoning to narrower reasoning and ultimately to a deterministic process as its source-owned types, context, requirements and tests become sufficient. The [April 4 cells-as-models inquiry](https://github.com/emsenn/civics/blob/main/operations/engineering/triage/operations/command/ideas/triage/cells-as-models-mcp-as-io.md) (blob `13f0775ef8fe65bfc4a132bb03bf033e43c9142a`) proposes that an algebraic cell with typed input, transition and result is itself a deterministic computation available through a uniform interface. These propositions are distinct from the verified behavior of current FeltOS/MetroPlat/Code software; the original documents are historical input evidence, not adopted replacement implementations.

A **progressively determinized duty** has a source-owned receiver predicate, a typed admissible input domain, an executable operation or inference service, an effect/authority envelope, explicit resource cost, and independently measured acceptance. Use the narrowest qualified executor that satisfies all obligations in the present state: typed deterministic operation when its domain admits the input; a specialized bounded model when the interpretation still requires uncertainty-bearing inference; a competent human or frontier agent when genuinely open design and scientific judgments remain. This is a partial ordering of admissible execution strategies, **not** a universal hierarchy of model sizes or a claim that every undecidable question becomes deterministic.

**Operational research assay:** choose matched work-item classes and collect the native caller identity, exact input version, required effect permissions, model/operation identity, total CPU/tokens/memory/network and accepted result. For repeated instances of an actually stable requirement, derive a source-owned typed operator and predeclared cases; compare its accepted outputs, total execution cost, tail latency, exception handling and operator independence against both the previous general-model execution and a legitimately rejected input. Establish deterministic substitution only for the tested domain; preserve explicit escalation for novel inputs. The executing Office skill is an API/program with a declared effect and contract; instructional text supplies the designer's research and the operator's semantic explanation.

**Architectural correspondence:** the existing [Red Cup Data artifact specification](https://github.com/red-cup-engineering/computer-data-engineering-services-section/blob/main/src/artifact-fabrication.mjs) checks whole requirement/projection/acceptance traceability; the [Red Cup Code-native `qualify_work_order` operation](https://github.com/red-cup-engineering/computer-code-development-engine/blob/main/src/fabrication/operations.mjs) composes the source translator with that data law and a source-byte binding before inference. Its MCP projection uses the existing typed [fabrication host](https://github.com/red-cup-engineering/computer-code-development-engine/blob/main/src/fabrication/fabrication-mcp-host.mjs). An installed host's actual invocation and independent consumer readback are further receiving steps.

The [Carnegie Mellon SEI Cleanroom Software Engineering Reference](https://sei.cmu.edu/library/cleanroom-software-engineering-reference/) describes mathematically based specification, design and correctness verification alongside usage-based statistical testing, with defect prevention as a design goal. [AdaCore's SPARK work-of-proof guidance](https://www.adacore.com/papers/work-of-proof-in-spark) demonstrates preconditions, postconditions and formal proof checks as executable source semantics. Neither source certifies the Group's current implementations; each motivates explicit specification-derived verification obligations before software release.

## Compositional organization

Different offices can hold the responsibility for observational research, requirements definition, system architecture, detailed design, standards qualification, type-system derivation, fabrication, package/closure receiving, deployment, operational continuity, independent assurance and commercial acceptance. Character, office, duty, source-owned skill and installed capability are separate typed resources. The responsible office is derived through actual incumbency and delegation; a single general-purpose office is not made responsible for every specialist act merely because it can read the associated instructions.

Lenticule Science owns this scientific distinction and its falsifiable comparisons. Red Cup Engineering owns reusable admission, refinement, static source analysis, fabrication and delivery technology. Coesite Operations owns operating templates, production continuity and allocation of actual capacities; corporate and public/customer instances own their own authorization and acceptance. The requirements and designs connect these actual owners rather than duplicating them.

## Falsification and empirical comparison

Compare two cohorts of comparable engineering changes matched for scope and exposure: praxis-selected/CbC-designed work and another declared method. Pre-register measures such as requirements-change rework, code/supplier revisions per accepted feature, independent acceptance latency, incident frequency, production resource use, newly duplicated implementations and customer value per engineer-hour. Report confidence, selection bias and denominator. Use representative positive cases (complete specification and traceable consumer admission), alternates (legitimate scientific inquiry and urgent recovery under an Operations runbook) and refusal cases (an incomplete specification or mismatched source identity) before claiming the method improved results.

A process hypothesis earns operational standing through observed improvements in those measured outcomes. Formalized source, executable acceptance and adoption by a real consumer are separate milestones.

## Sources and lineage

- [Original April 4, 2026 praxis idea in emsenn/civics](https://github.com/emsenn/civics/blob/main/operations/engineering/triage/operations/command/ideas/triage/praxis-driven-development.md) (source SHA above), including its stated connection to situated practice and action research.
- [ISO/IEC/IEEE 12207:2026, Software life cycle processes](https://www.iso.org/standard/90219.html): published April 2026, defines software life-cycle processes but prescribes no particular development methodology.
- [ISO/IEC/IEEE 29148:2018, Requirements engineering](https://www.iso.org/standard/72089.html): current published edition in October 2026, with an in-development revision.
- [ISO/IEC/IEEE 42010:2022, Architecture description](https://www.iso.org/standard/74393.html): specifies architecture-description concepts and viewpoints, rather than a construction method.
- [Current 561 Group engineering development intake](https://github.com/561-group/561-group-services-section/blob/main/lib/agency/skills/assess-code-family/references/development-intake.md) and [Red Cup's implemented artifact fabrication admissions](https://github.com/red-cup-engineering/computer-data-engineering-services-section/blob/main/src/artifact-fabrication.mjs).

**Receiving:** a separately checkable Science term in the Engineering Science corpus, usable by requirements and engineering methods with source lineage preserved; Semioverse indexing and installed engineering use need their own proof.
