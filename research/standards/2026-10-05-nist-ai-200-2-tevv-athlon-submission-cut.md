# NIST AI 200-2 TEVV-Athlon — Submission Cut

## Recommended thesis
TEVV-Athlon would benefit from an explicit, inspectable traceability relation between **what was observed**, **how it was operationalized as a measurement**, and **what property the final evaluation claims about the AI system**. Agentic systems make this requirement especially visible because the evaluated system's state, permissions, tools, environment, and downstream effects may change during the evaluation.

## 1. Make the evidence-to-claim chain explicit
For each consequential Block, permit or recommend a structured chain:
1. observation / mark and source;
2. operational definition or articulation;
3. measurement procedure and Tool;
4. measurement result and uncertainty;
5. inference rule or synthesis step;
6. claimed property and scope conditions.

This separates an observation from the evaluator's interpretation of it and makes it easier to audit whether the final report asserts more than the measurements support.

## 2. Add operational system boundaries for agentic TEVV
For an agentic system, identify the model, orchestrator, connected APIs/tools, delegated permissions, relevant external state, human approval points, and downstream receivers. Distinguish these operational tools from TEVV-Athlon measurement Tools. State which components are simulated, directly observed, or outside scope.

## 3. Treat unknown, contradictory, stale, and refused states as first-class outcomes
Do not collapse missing evidence into a negative observation or exclude it silently. Record separately:
- observed support;
- unavailable/unobserved evidence;
- contradictory evidence;
- stale or temporally mismatched evidence;
- correct refusal/escalation;
- unnecessary refusal.

Use explicit denominators so exclusions cannot inflate apparent success.

## 4. Measure external effect and receiver acceptance separately
For workflows with an external action, distinguish:
- action proposed;
- action attempted;
- action technically executed;
- external state changed;
- downstream receiver observed the change;
- receiver accepted the result as satisfying the intended outcome.

An API success code, a changed record, and successful task completion are different measurements.

## 5. Add version-bound replay and dynamic-state tests
Recommended agentic test conditions include:
- authorization revoked between decision and execution;
- state changed after the model read it;
- partial API failure;
- timeout after a write followed by retry pressure;
- duplicate effects;
- model/tool/policy version changes;
- receiver non-acceptance or missing acknowledgment.

Record model/tool/configuration/data/scoring versions and residual environment differences. For stochastic systems, compare outcome distributions rather than requiring identical text.

## Worked-example suggestion
A synthetic work-item service in a sandbox: update one record only when the principal is authorized and the expected prior version matches, then obtain independent state readback and downstream validation. Measure unauthorized action, false refusal, duplicate effect, state-change fidelity, and receiver acceptance.

## Closing recommendation
Prioritize (1) an optional evidence-to-claim record, (2) a worked agentic example, and (3) explicit treatment of unobserved outcomes. These additions fit the existing four-stage TEVV-Athlon architecture while improving auditability and limiting overclaiming.

## Submission hygiene
- Public comment; no proprietary material.
- Subject: `NIST AI 200-2`.
- Attribute only as approved by Morgan/561 Group.
- This document proposes measurement guidance; it does not claim completed validation or NIST endorsement.