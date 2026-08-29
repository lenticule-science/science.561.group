---
type: definition
class: boundary-component
depends-on: [boundary, interfacer, port]
see-also: [reification, witness, scope-record]
---

# Sensor

A **sensor** is the substrate's measurement boundary: a component that couples the substrate to a portion of the external world and produces, for each measurand state, a substrate-admissible predication describing what was measured. A sensor is one specialization of an [interfacer](teaching/explanations/interfacer.md) — the specialization where the source is a physical or informational phenomenon outside the substrate's control, and the substrate's discipline must explicitly account for calibration, range, and irreducible measurement error.

Sensors are not optional adornments; for any predicated computer that interacts with the world (a personal corpus admitting filesystem changes, an industrial controller admitting plant readings, an agential platform admitting human-authored content), every input that crosses the substrate's boundary does so through some sensor. The discipline this object captures is what makes that crossing auditable.

## Six-tuple structure

A sensor is the six-tuple

`sensor = (measurand-space, output-space, transfer-function, operating-range, error-model, downstream-scope)`

each role separately specifiable and separately auditable:

- **Measurand space.** The set of phenomenon states the sensor is coupled to — what the sensor *can* in principle distinguish. The space carries the topology under which "nearby" measurand states should produce nearby outputs. For a filesystem sensor, the measurand is the bytes of the watched files; for a chat-window sensor, the measurand is the visible text; for a temperature probe, the measurand is the local thermal state.
- **Output space.** The set of substrate-admissible predications the sensor will emit. Every sensor output is a predication conformant to the [port](teaching/explanations/port.md)'s admit kinds — the sensor cannot smuggle content into the substrate that violates the port. The output space is finite (or finitely-described) per the port's discipline.
- **Transfer function.** The defined map from measurand states to outputs. The transfer function is what calibration *establishes*; without it the sensor's emission is a physical change with no semantic content. Two sensors with different transfer functions may both observe the same measurand and produce equivalent settled predications, provided their outputs reconcile under the substrate's [coherence-glue](../morphisms/coherence-glue.md).
- **Operating range.** The subset of the measurand space the transfer function is defined and accurate over. Outside this range the sensor saturates, becomes nonlinear beyond specification, or is damaged. The operating range is part of the sensor's contract: the substrate's [witness](teaching/explanations/witness.md) for a sensor admission records whether the measurand was inside the operating range.
- **Error model.** The distribution of actual outputs as a function of the true measurand. Every physical or informational sensor has an error model nonzero — calibration noise, quantization loss, observer bias, model uncertainty — and this error is structural, not removable by better engineering. The substrate's discipline is to record the error model as part of the sensor's content so downstream consumers can reason about confidence.
- **Downstream scope.** The substrate's [scope](teaching/explanations/scope.md) the sensor's outputs flow into. A sensor without a downstream scope is a transducer: it perturbs but the perturbation has nowhere to go. The substrate's audit trail begins at the sensor and continues through the downstream scope's settlement; sensor outputs detached from a scope are not audit-anchorable.

The six roles are independent: changing the operating range does not necessarily change the transfer function; changing the error model does not necessarily change the measurand space. Sensor maintenance is the discipline of keeping the six in synchrony as the underlying phenomenon, the substrate's port, or the engineering's confidence in the calibration evolves.

## Calibration as the substrate's commitment

Calibration is the act of establishing the transfer function by paired observation: a known measurand state is presented, the sensor emits its output, the (input, output) pair joins the calibration record. The substrate's commitment is that calibration records are themselves substrate content — predications about the sensor, its operating range, its error model — per [self-representation](teaching/explanations/self-representation.md). A sensor without a substrate-recorded calibration is operating on undeclared trust; a sensor whose calibration is in the substrate is auditable: any consumer can check the calibration's age, the sample it was based on, and the witness chain that established it.

When two sensors covering overlapping measurand subdomains produce mutually inconsistent outputs (different sensors reading the same room temperature give different predications), the substrate's [coherence-glue](../morphisms/coherence-glue.md) discipline reconciles them — typically by recording both sensor outputs with their provenance and treating the inconsistency as a contested predication that requires resolution per [repair](teaching/explanations/repair.md). The substrate does not silently choose one sensor over the other; it records the disagreement.

## Sensor fusion is sublocale composition

When multiple sensors collectively cover a phenomenon — a sensor array reading distinct sub-domains, multiple agents reporting distinct facets — the substrate's job is to assemble the local predications into a coherent global picture. The discipline is straightforward: each sensor admits its predications into the substrate's [scope](teaching/explanations/scope.md); the engine settles them per the closure-rule system; agreement between sensors strengthens the settled value (per the value-domain's join), disagreement surfaces as contested predication, missing coverage shows up as an explicit gap (no admission for that subregion). Fused output is a [sublocale](locale.md) view assembled from the sensor predications — *not* a separate "fusion" operator; the substrate's normal settlement does the work.

The pattern is what makes sensor fusion auditable: every datum in the fused output traces back to a sensor admission with provenance, and the engine's witness chain records every closure-rule application that contributed to the fused settlement.

## Distinguishing sensors from adjacent components

- **Sensor vs. transducer.** Every sensor has a transducer — the physical or informational coupling that produces a change in the sensor in response to the measurand. A transducer alone is not a sensor: without a defined transfer function, an operating range, an error model, and a downstream scope, the transducer's output is a physical state, not a measurement.
- **Sensor vs. actuator.** A sensor admits predications into the substrate; an actuator emits commands out of the substrate. The two are causal opposites: sensor is informationally upstream; actuator is informationally downstream. A control loop typically pairs a sensor and an actuator, but they are different objects under different disciplines.
- **Sensor vs. interfacer.** An interfacer is the general I/O discipline at the boundary; a sensor is the specialization for measurement of phenomena outside the substrate's control. Every sensor is an interfacer; not every interfacer is a sensor (an interfacer reading from a substrate-internal canonical-form representation has no measurand outside the substrate, no calibration discipline, no error model in the sensor sense).

## Position in the substrate

Sensors are the substrate's *epistemic perimeter*: they are how the substrate learns about anything outside itself. Every claim in the substrate that derives from outside is, at some point upstream, a sensor admission. The substrate's audit trail can therefore be traced back to specific sensors with specific calibrations and operating ranges; the substrate's confidence in its content is bounded by the confidence in its sensors.

A sensor that has been compromised — calibration is wrong, operating range is being exceeded, error model has changed — propagates that compromise into the substrate's content. The substrate's defense is the calibration record itself: if the calibration is in the substrate as a predication, then the moment a calibration update is admitted, every consumer of the sensor's output can re-evaluate against the new calibration. This is the substrate's response to the engineering reality that sensors fail, drift, and are replaced; the failure mode that loses information forever is calibration kept *outside* the substrate, where the substrate cannot reason about it.
