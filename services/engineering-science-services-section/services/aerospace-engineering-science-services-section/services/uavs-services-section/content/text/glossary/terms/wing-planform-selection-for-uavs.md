---
name: "Wing Planform Selection for UAVs"
date-created: 2026-03-06
type: concept
aliases:
  - "Wing Planform Selection for UAVs"
  - "UAV wing design"
  - "wing planform selection for UAVs"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - Aerodynamics
  - StructuralEngineering
description: "How mission requirements, manufacturing constraints, and cost targets drive the choice of wing geometry across the UAV spectrum."
---

The wing planform — the shape of the wing as seen from above — is the single most consequential geometric decision in fixed-wing UAV design. It determines aerodynamic efficiency, structural complexity, manufacturing method, stability and control characteristics, and internal volume for fuel and payload. Different UAV classes have converged on different planforms for good engineering reasons, and understanding those reasons is prerequisite to understanding why any particular drone looks the way it does.

## The design variables

A wing planform is defined by a handful of parameters that interact to determine performance:

- **[Aspect ratio](./aspect-ratio.md)** — span divided by mean chord. High AR (10–30) means long and narrow; low AR (1.5–4) means short and wide. The primary lever controlling the trade-off between aerodynamic efficiency and structural weight.
- **Sweep** — the angle of the leading edge relative to the lateral axis. Sweep delays compressibility effects at high subsonic speeds and, in delta configurations, provides pitch stability without a separate tail.
- **Taper ratio** — the ratio of tip chord to root chord. Taper reduces structural weight (smaller tips = less bending moment) and can improve span-wise lift distribution.
- **Twist (washout)** — a decrease in angle of incidence from root to tip. Ensures the root stalls before the tip, preserving aileron authority at high angles of attack.
- **Dihedral** — upward angle of the wing from root to tip. Provides roll stability. Excessive dihedral makes the aircraft sluggish in roll; too little makes it sensitive to gusts.
- **Airfoil section** — the cross-sectional shape of the wing. Thickness, camber, and leading-edge radius interact with Reynolds number (which varies dramatically across the UAV size range) to determine lift, drag, and stall characteristics.

## Planform families

### Conventional (rectangular or tapered)

A straight or mildly tapered wing with a separate horizontal tail. This is the default configuration for a reason: it separates the lifting function (wing) from the stabilizing function (tail), giving the designer independent control over each. The conventional layout is used across most of the UAV spectrum:

- **Micro/mini UAVs** (sub-5 kg): Foam-core or balsa-and-covering wings with aspect ratios of 5–8, similar to model aircraft. The RQ-11 Raven uses this configuration. Manufacturing is simple — hot-wire-cut foam or laser-cut balsa ribs — and the aerodynamic behavior is predictable.
- **Small tactical UAVs** (5–50 kg): Composite or [3D-printed](./additive-manufacturing-in-uav-airframes.md) wings with aspect ratios of 6–10. The ScanEagle (22 kg, AR ~10) is a representative example — optimized for loiter endurance, with a high-aspect-ratio wing that prioritizes L/D over structural simplicity.
- **MALE platforms** (600–5,000 kg): Carbon fiber composite wings with aspect ratios of 15–25. The MQ-9 Reaper (AR ~17) and the Turkish Bayraktar TB2 (AR ~12) use conventional planforms because the mission demands efficient cruise for 20+ hours. The structural investment in a long, slender wing is justified by the operational requirement.

**Advantages:** Predictable aerodynamics, well-understood design methods, independent sizing of wing and tail, wide speed and CG range.

**Disadvantages:** Tail boom adds length, weight, and structural complexity. Tail surfaces are vulnerable to damage. Total part count is higher than tailless designs.

### Delta and delta derivatives

A triangular wing with high leading-edge sweep, typically without a separate horizontal tail. Control is provided by elevons (combined elevator/aileron surfaces) on the trailing edge. The delta is the dominant planform for expendable strike drones — the Shahed-136, [LUCAS](./lucas.md), and most of their derivatives — and for high-speed military UAVs.

The delta's appeal for expendable platforms is not aerodynamic but structural and economic:

- **The root chord is deep**, providing volume for fuel, payload, and avionics without external fairings.
- **The spar is short** relative to span, carrying bending loads over a small distance. This means lighter, simpler primary structure.
- **No tail surfaces** — the stabilizing and control functions are integrated into the wing, eliminating the tail boom, horizontal stabilizer, vertical fin (or reducing it to a vestigial yaw damper), and the associated actuators. For a 3-meter expendable drone, this can reduce part count by 30–40%.
- **Manufacturing tolerance is wide.** A delta wing's aerodynamic behavior degrades gracefully with geometric imperfection. Asymmetry produces a mild roll tendency that an autopilot can trim out. The same asymmetry on a high-AR wing can produce flutter.
- **Flat panels dominate the geometry**, enabling construction from foam blocks (hot-wire cut), flat composite layups, [3D-printed slabs](./additive-manufacturing-in-uav-airframes.md), or injection-molded sections.

The cost is real: a delta with AR 2.0 has roughly twice the induced drag of a conventional wing with AR 8.0 at the same lift coefficient. For an [expendable airframe](./expendable-airframe-design.md) flying a one-way mission of a few hundred kilometers, this penalty is absorbed into the fuel fraction. For a platform that must loiter for hours, it is disqualifying.

**Variants:**
- **Cranked delta / double delta** — highly swept inboard section (structural depth, volume) with moderately swept outboard section (better low-speed lift). Used on some larger strike UAVs.
- **Ogival delta** — curved leading edge that approximates an elliptical lift distribution. More aerodynamically efficient than a pure delta but harder to manufacture.
- **Clipped delta** — tip chord is not zero; the wing is a trapezoid with high sweep. Slightly reduces induced drag at the expense of tip-stall margin.

### Flying wing (blended wing body)

The entire aircraft is a wing, with no distinct fuselage or tail. The payload is housed within the wing's thickness. Flying wings achieve very low parasitic drag (minimal wetted area) and, if properly designed, very low radar cross-section, making them the preferred planform for stealth UAVs:

- The Northrop Grumman RQ-170 Sentinel and its successor, the RQ-180, are flying-wing designs optimized for penetrating denied airspace.
- The nEUROn, Taranis, and XQ-67A are all flying-wing demonstrators exploring autonomous combat aircraft concepts.
- At the hobby and small commercial scale, flying wings are popular because they can be built from a single foam panel — the KFm (Kline-Fogleman) airfoil series was developed specifically for flat-sheet foam flying wings.

**Advantages:** Minimum wetted area (low parasitic drag), excellent stealth shaping potential, compact storage (no protruding tail), structural efficiency (the payload is carried inside the wing, not hung beneath it).

**Disadvantages:** Pitch and yaw control is difficult without a tail — flying wings rely on split elevons, drag rudders, or body flaps. CG range is narrow; a few percent shift can make the aircraft unflyable. Manufacturing precision requirements are higher than for deltas because the airfoil must integrate reflex (upward camber at the trailing edge) to maintain pitch stability, and errors in reflex directly affect trim.

### Tandem wing and canard

Two lifting surfaces in tandem — either a small forward wing (canard) with a main wing, or two wings of similar size. Used in some UAV designs for specific reasons:

- **Canard configurations** allow the forward surface to stall first, providing natural stall protection — the nose drops before the main wing loses lift. The IAI Harop loitering munition uses a canard layout.
- **Tandem wings** of similar size provide high total wing area in a compact span, useful for platforms that must fit in a small launch tube or container. Some tube-launched reconnaissance UAVs use this layout.

**Advantages:** Compact span for a given wing area, natural stall protection (canard), both surfaces generate positive lift (unlike a conventional tail, which generates downforce for trim).

**Disadvantages:** Aerodynamic interference between the two surfaces is complex and sensitive to CG position. Design methods are less mature than for conventional or delta layouts. Structural complexity is higher (two wing sets, two spar systems).

### Multirotor (rotary-wing)

Quadcopters, hexacopters, and octocopters dominate the sub-10 kg commercial and consumer UAV market. The planform question for multirotors is not wing shape but rotor geometry: number, diameter, pitch, and twist of the propellers, and the arm geometry that positions them.

Multirotors sacrifice aerodynamic efficiency for controllability and hover capability. A quadcopter achieves controlled flight purely through differential thrust of its four motors — no control surfaces, no cyclic pitch mechanism, no swashplate. This mechanical simplicity is why multirotors have displaced helicopters for most small UAV applications: the [flight controller](./flight-controller.md) handles the complexity in software rather than in mechanical linkages.

The engineering trade-offs are:
- **More rotors** = more redundancy (a hexacopter can lose one motor and continue flying) but more weight and drag.
- **Larger diameter, fewer rotors** = higher efficiency (disc loading decreases) but lower control bandwidth and larger physical footprint.
- **Higher pitch** = faster cruise but less efficient hover.
- **Ducted rotors** = reduced tip losses and improved safety, but added weight and profile drag.

### Helicopter (single/coaxial rotor)

For UAVs requiring efficient hover and high payload fraction, conventional or coaxial helicopter configurations remain competitive. The Schiebel Camcopter S-100 (200 kg) uses a conventional helicopter layout; the Kaman K-MAX autonomous cargo helicopter lifts over 2,700 kg. Coaxial designs (two counter-rotating rotors on the same shaft) eliminate the need for a tail rotor, improving compactness for shipboard operations.

## Choosing a planform

The selection is driven by mission requirements, filtered through manufacturing and cost constraints:

| Primary requirement | Preferred planform | Examples |
|---|---|---|
| Long endurance / high L/D | High-AR conventional | MQ-9 Reaper, ScanEagle |
| Low cost / expendable strike | Delta or clipped delta | Shahed-136, LUCAS, Switchblade 600 |
| Stealth / penetration | Flying wing | RQ-170, XQ-67A, nEUROn |
| Hover + vertical flight | Multirotor or helicopter | DJI Matrice, S-100 Camcopter |
| Tube launch / compact storage | Tandem or folding conventional | Switchblade 300, Coyote |
| Maximum payload fraction | Flying wing or blended body | X-47B, MQ-25 Stingray |

In practice, the choice is often constrained less by aerodynamics than by manufacturing capability. A design team with composite layup experience will gravitate toward conventional or flying-wing planforms. A team with FDM printers will favor deltas and simple tapered wings that fit within build volumes. A team optimizing for unit cost at scale will favor geometries that can be hot-wire-cut from foam or injection-molded. The wing that emerges is always a compromise — and understanding the terms of that compromise is the core of UAV wing design.

## Related concepts

- [Additive Manufacturing in UAV Airframes](./additive-manufacturing-in-uav-airframes.md) — how printing constraints interact with planform choice
- [Expendable Airframe Design](./expendable-airframe-design.md) — the design philosophy that makes the delta's trade-offs rational for strike drones
- [UAV Propulsion Systems](./uav-propulsion-systems.md) — propulsion choice interacts with planform through thrust line, vibration, and weight distribution
