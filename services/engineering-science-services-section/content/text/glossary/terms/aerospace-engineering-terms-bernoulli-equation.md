---
name: "Bernoulli Equation"
type: "term"
date-created: 2026-03-06
---

The relationship between pressure and velocity in steady, inviscid, incompressible flow — higher velocity means lower pressure.

The Bernoulli equation states that along a streamline in steady, inviscid, incompressible flow, the sum of static pressure, [dynamic pressure](../../../../services/aerospace-engineering-science-services-section/content/text/glossary/terms/dynamic-pressure.md), and hydrostatic pressure is constant:

p + ½ρv² + ρgh = constant

where p is static pressure, ρ is fluid density, v is flow velocity, g is gravitational acceleration, and h is height. In most aerodynamic applications, the height term is negligible:

p + ½ρv² = p₀

where p₀ is the total (stagnation) pressure. The key implication: where velocity increases, pressure decreases.

### How lift works (and how it doesn&rsquo;t)

The Bernoulli equation is commonly invoked to explain [lift](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/lift.md): air moves faster over the curved upper surface of an [airfoil](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/airfoil.md), so pressure is lower above the wing than below, producing a net upward force. This is correct as a description of the pressure distribution but incomplete as an explanation — it does not explain *why* the air moves faster over the top. The complete explanation requires the Navier-Stokes equations, circulation theory (the Kutta condition), and the role of viscosity in establishing the flow pattern.

The common &ldquo;equal transit time&rdquo; explanation — that air molecules must traverse the longer upper path in the same time as the shorter lower path — is simply wrong. Air over the top of a wing arrives at the trailing edge *before* air flowing under the bottom, not at the same time.

### Limitations

The Bernoulli equation is valid only for:

- **Steady flow** — no time-varying changes

- **Incompressible flow** — [Mach number](../../../../services/aerospace-engineering-science-services-section/content/text/glossary/terms/mach-number.md) below ~0.3

- **Inviscid flow** — outside the [boundary layer](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/boundary-layer.md)

- **Along a streamline** — not across streamlines (unless the flow is irrotational)

Despite these limitations, the Bernoulli equation is remarkably useful for first-order analysis: pitot tubes measure airspeed using it, venturi flow meters depend on it, and it provides good estimates of pressure distributions on airfoils at low Mach numbers.
