---
title: "Flutter"
type: "term"
date-created: 2026-03-06
---

A self-excited oscillation where aerodynamic forces and structural flexibility interact to produce destructive vibrations, typically leading to rapid structural failure.

Flutter is a dynamic instability in which aerodynamic forces couple with the structural flexibility of a wing (or tail, or control surface) to produce oscillations that grow in amplitude until the structure fails. It is one of the few failure modes that can destroy an airframe in seconds, with no warning and no recovery.

Flutter occurs when two structural modes — typically wing bending and wing torsion — couple through the aerodynamic forces. As the wing bends upward, aerodynamic loading twists it nose-up, increasing lift and driving further bending. As the wing springs back down, the twist reverses. At a critical airspeed (the flutter speed), the energy input from aerodynamic forces exceeds the energy dissipated by structural damping, and the oscillation amplitude grows without bound.

Flutter speed depends on:

- **Structural stiffness** — stiffer wings flutter at higher speeds. This is one reason [spar](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/spar.md) design matters even for short-duration platforms.

- **Mass distribution** — heavy wingtips (due to motors, cameras, or fuel) lower the flutter speed by moving the center of gravity of the wing section aft of the elastic axis.

- **[Aspect ratio](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/aspect-ratio.md)** — high-AR wings are more flexible and more susceptible. Low-AR delta wings are inherently stiff and rarely flutter within their flight envelope.

- **Control surface freeplay** — loose hinges on ailerons or elevons allow small oscillations that can couple with wing modes. Proper hinge design and servo preload are critical.

For [3D-printed](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/additive-manufacturing-in-uav-airframes.md) wings, flutter analysis must account for the relationship between [infill](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/infill-density.md) pattern/density and structural stiffness. A wing printed with 15% rectilinear infill has dramatically different bending and torsional stiffness than the same geometry at 40% gyroid infill — and therefore a different flutter speed. A print batch with slightly different infill (due to slicer settings error or material variation) can produce a wing that flutters within the flight envelope even though the design intent was safe.

Modal testing — tapping the assembled wing and measuring the frequency response with an accelerometer — is the practical way to verify flutter margins on production UAV wings. Any resonant frequency within 2× of expected propeller or engine excitation frequencies warrants investigation.
