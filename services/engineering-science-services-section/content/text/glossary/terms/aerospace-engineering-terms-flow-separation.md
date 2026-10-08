---
name: "Flow Separation"
date-created: 2026-03-07
---

The detachment of the boundary layer from a surface under adverse pressure gradients — the mechanism behind stall, buffet, and most forms of pressure drag.

Table of contents

- [Why separation happens](#why-separation-happens)

- [Types of separation](#types-of-separation)

[Trailing-edge separation](#trailing-edge-separation)

- [Leading-edge separation](#leading-edge-separation)

- [Laminar separation bubble](#laminar-separation-bubble)

- [Massive separation](#massive-separation)

- [Design strategies against separation](#design-strategies-against-separation)

Flow separation occurs when the [boundary layer](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/boundary-layer.md) detaches from a surface and the smooth flow breaks down into a region of reversed, recirculating air. It is the mechanism behind [stall](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/stall.md) (lift loss when the upper-surface boundary layer separates), behind most [pressure drag](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/parasitic-drag.md) (the low-pressure wake behind a bluff body), and behind the laminar separation bubbles that dominate [low-Reynolds-number aerodynamics](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/low-reynolds-number-aerodynamics.md).

## Why separation happens

The boundary layer is driven forward by the freestream velocity and retarded by friction with the surface. On the forward portion of an airfoil, the flow accelerates (favorable pressure gradient) and the boundary layer stays thin and attached. Past the point of minimum pressure (typically 20–40% of [chord](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/chord.md) on the upper surface), the flow must decelerate as pressure recovers toward ambient — this is an **adverse pressure gradient**.

In an adverse pressure gradient, the slowest fluid near the surface decelerates faster than the faster fluid above it. If the adverse gradient is strong enough, the near-surface fluid reverses direction — it flows backward, upstream. At that point, the boundary layer has separated. Downstream of the separation point, the flow is chaotic, recirculating, and produces much higher drag than attached flow.

## Types of separation

### Trailing-edge separation

The boundary layer separates near the trailing edge and the separated region grows forward as [angle of attack](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/angle-of-attack.md) increases. This is the typical stall mechanism for thick airfoils at high Reynolds number. Stall onset is gradual and predictable — lift increases until the separated region reaches a critical extent, then lift decreases. Most large aircraft stall this way.

### Leading-edge separation

The boundary layer separates abruptly near the leading edge, usually because a thin airfoil&rsquo;s leading-edge radius is too small to keep the flow attached at high AoA. The separation is sudden and the lift loss is abrupt — &ldquo;hard stall.&rdquo; Common on thin airfoils and at low Reynolds numbers.

### Laminar separation bubble

At low [Reynolds numbers](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/reynolds-number.md) (Re 50,000–300,000), the [laminar](../../../../services/aerospace-engineering-science-services-section/content/text/glossary/terms/laminar-and-turbulent-flow.md) boundary layer separates when it encounters the adverse pressure gradient, but the separated shear layer transitions to turbulent, re-energizes, and reattaches downstream. The result is a trapped recirculation region — a bubble — between separation and reattachment. The bubble increases drag by 50–200% compared to fully attached flow and is the dominant performance-limiting phenomenon for small UAVs. See [Low-Reynolds-Number Aerodynamics](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/low-reynolds-number-aerodynamics.md) for detailed treatment.

### Massive separation

At very high angles of attack or on bluff (non-streamlined) bodies, the flow separates from a large portion of the surface and does not reattach. The wake is wide and turbulent, and [drag](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/drag.md) is dominated by the low pressure in the separated region. This is why unstreamlined shapes (flat plates, cylinders, exposed landing gear) produce high drag — the separated wake creates a large pressure deficit on the downstream side.

## Design strategies against separation

- **Airfoil shaping** — gradual pressure recovery (gentle adverse gradients) delays separation.

- **Turbulators** — tripping the boundary layer to [turbulent](../../../../services/aerospace-engineering-science-services-section/content/text/glossary/terms/laminar-and-turbulent-flow.md) before the separation point, because turbulent layers resist separation better.

- **Vortex generators** — small fins that create streamwise vortices, mixing high-energy air from the outer flow into the boundary layer.

- **Slats and slots** — leading-edge devices that re-energize the upper-surface boundary layer with air ducted from below.

- **Suction** — removing the decelerated boundary layer air through porous surfaces (used in laminar flow control research but rarely in production).
