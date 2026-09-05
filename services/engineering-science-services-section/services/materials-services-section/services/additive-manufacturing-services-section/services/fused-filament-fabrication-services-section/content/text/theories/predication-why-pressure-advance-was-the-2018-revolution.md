---
type: remark
class: historical
---

# Why pressure-advance was the 2018 revolution in FFF print quality

Through 2017, the canonical practitioner advice for cleaner FFF prints was "slow down" — reduce print speed below ~40 mm/s on perimeters to avoid corner blobs, ringing, and inconsistent extrusion. Klipper's introduction of viscoelastic pressure-advance (Kevin O'Connor 2017–2018) and Marlin's parallel "Linear Advance" (Sebastian Popp 2017) collapsed that constraint. The same hardware that printed cleanly only at 40 mm/s could now print cleanly at 100+ mm/s.

The mechanism is exactly what [Bellini's 2004 model](./predication-bellini-et-al-2004.md) predicted: the hot-end melt zone acts as a viscous capacitor with a time constant set by $\eta_0 V_{\rm melt} / R^4$ (where $R$ is the throat radius). A toolhead command to stop or slow at a corner produces extrusion that lags behind the command — the pressure stored in the melt continues to push polymer through the nozzle for tens of milliseconds after the toolhead decelerates. Pressure-advance precompensates by retracting the extruder during deceleration, draining the melt-pressure capacitor.

The interesting historical note is that the *theory* was 13 years older than the *implementation*. What changed in 2017 was not new physics but two engineering things: (1) firmware capable of running the per-segment look-ahead computation in real time on commodity 8-bit/32-bit microcontrollers, and (2) a community willing to spend the calibration time per material to find the right $K$ value.

The same gap — known physics, decades to engineering deployment — is currently visible for closed-loop flow control (see [closed-loop-flow-control](./predication-closed-loop-flow-control.md)). The melt-zone pressure could be measured with a piezo or strain gauge; the loop could feed back to extruder velocity. The physics is Bellini-2004. The engineering is not yet here.
