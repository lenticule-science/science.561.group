---
type: concept
class: device-integration-discipline
depends-on: [process-boundary, syscall-discipline, witness]
see-also: [interfacer, sensor]
---

# Hardware device

A *substrate-recorded representation of a physical device* the host has access to: sensor (temperature, GPS, IMU, camera), actuator (motor, display, LED, speaker), peripheral (USB, GPIO, serial). Hardware devices are how the substrate interacts with the physical world beyond the network.

The substrate's hardware-device discipline:

- **Substrate-recorded.** Per [self-representation](teaching/explanations/self-representation.md), each device has a device-record declaring its kind, the host driver / interface, what operations it supports.
- **Interfacer-mediated.** Per [interfacer](teaching/explanations/interfacer.md), device access is through an interfacer that translates between the device's physical I/O (syscalls, memory-mapped registers, USB protocol) and substrate content (predications about device state, actions to take).
- **Witness-emitting.** Per [witness](../objects/witness.md), device reads and writes produce witnesses. Sensor readings are admitted as substrate content with the device's identity in the witness; actuator commands are recorded as substrate operations.
- **Capability-gated.** Per [capability](theories/functional-runtime-platform/concepts/capability.md), device access requires the device's capability — granted at deployment time via the host's permission system.

Common device kinds:

- **Sensors.** Temperature, humidity, pressure, accelerometer, GPS, camera (image sensor), microphone (audio sensor), light sensor, ambient sensor. Read-only from the substrate's perspective.
- **Actuators.** Motor (stepper, servo), display (LCD, OLED, LED matrix), speaker, relay, valve, heater. Write-only.
- **Bidirectional.** Touch screen (input + display), bidirectional serial (USB, RS-232), networked sensors-with-callback.
- **Storage devices.** USB drives, SD cards, attached storage. Per [storage-backend](storage-backend.md), these may serve as the substrate's persistent-set backend.

The substrate's [sensor](../objects/sensor.md) object generalizes: a sensor is a hardware-device that produces substrate content from the physical world.

Per [federation-convergence](../theorems/federation-convergence.md), device data federates: a sensor reading admitted on substrate $A$ can be replicated to peer substrate $B$. Per [signature-binds-witness-to-identity](../theorems/signature-binds-witness-to-identity.md), the device's identity (typically the substrate-instance that owns the device) is in the witness, so peer substrates can attribute device readings appropriately.

Per [latency-budget](latency-budget.md), real-time device access (control loops, sensor fusion) may carry deadline discipline. Per [native-compilation-target](native-compilation-target.md), device drivers are typically native code for performance.
