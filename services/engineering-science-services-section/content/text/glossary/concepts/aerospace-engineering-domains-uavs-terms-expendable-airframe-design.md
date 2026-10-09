---
title: "Expendable Airframe Design"
type: "concept"
date-created: 2026-03-06
description: The engineering philosophy of designing airframes intended to be used once, and how it inverts conventional aerospace design priorities.
---

The engineering philosophy of designing airframes intended to be used once, and how it inverts conventional aerospace design priorities.

Table of contents

- [The inversion of design priorities](#the-inversion-of-design-priorities)

[Safety factors](#safety-factors)

- [Material selection](#material-selection)

- [Fastening and assembly](#fastening-and-assembly)

- [Aerodynamic finish](#aerodynamic-finish)

- [The weight budget](#the-weight-budget)

- [Propulsion](#propulsion)

- [Launch systems](#launch-systems)

- [Design for manufacturing](#design-for-manufacturing)

- [The philosophical shift](#the-philosophical-shift)

Expendable airframe design is the engineering discipline of building aircraft that are intended to be destroyed — by detonation on target, by deliberate crash, or by simple non-recovery after mission completion. It is not a degraded version of conventional aerospace design. It is a distinct discipline with its own optimization logic that has produced platforms ranging from Cold War-era target drones through the Iranian Shahed-136, the American [LUCAS](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/lucas.md), the Israeli IAI Harop, the Turkish STM Kargu, and hundreds of improvised FPV strike drones in the Ukraine conflict.

## The inversion of design priorities

Conventional aircraft design optimizes for a lifecycle measured in decades: 20,000–40,000 flight hours for a fighter, 60,000–100,000 for an airliner. Every structural decision is made against the constraint that the airframe must survive repeated loading cycles without fatigue failure. This drives material selection toward aerospace-grade aluminum alloys, titanium, and certified carbon fiber composites. It demands conservative safety factors (1.5× ultimate load with no yielding at limit load). It requires non-destructive inspection regimes, corrosion protection, and replaceable wear components.

An expendable airframe flies once. Its lifecycle is measured in hours — typically 2–10 hours of cruise plus a terminal maneuver. This eliminates fatigue as a design driver entirely. A structure that would fail after 100 flight hours is perfectly adequate if the mission requires 5. The consequences cascade through every engineering decision:

### Safety factors

Certified aircraft use a [safety factor](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/safety-factor.md) of 1.5× on ultimate load and must show no permanent deformation at limit load (1.0× the maximum expected load). Expendable airframes can use safety factors of 1.1–1.25×, accepting that the structure may yield or permanently deform under peak loads, as long as it does not fail catastrophically during the single mission. This reduction in safety factor translates directly to reduced structural weight.

### Material selection

Without fatigue life requirements, the material trade space opens dramatically:

Material
Tensile strength
Fatigue endurance
Cost
Expendable suitability

7075-T6 aluminum
High
Excellent
Moderate
Overqualified — cost and machining time are wasted

Expanded polystyrene foam + fiberglass
Low-moderate
Poor
Very low
Excellent for non-structural shells and wing cores

3D-printed CF-nylon
Moderate
Moderate
Low-moderate
Excellent — see [Additive Manufacturing in UAV Airframes](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/additive-manufacturing-in-uav-airframes.md)

Injection-molded glass-filled nylon
Moderate
Fair
Very low at volume
Ideal for high-volume production of structural elements

Coroplast (corrugated polypropylene)
Low
Poor
Extremely low
Adequate for lightly loaded skins and non-structural panels

Plywood (birch, poplar)
Moderate
Good
Very low
Surprisingly competitive for ribs, bulkheads, and flat structural elements

The common thread is that expendable design selects materials primarily on cost-per-unit-strength rather than absolute performance. Plywood and corrugated plastic appear absurd in the context of a certified aircraft; they are rational choices for a structure that will fly once.

### Fastening and assembly

Conventional aircraft joints use aerospace-grade rivets, hi-lok fasteners, and structural adhesives with controlled bond-line thickness, surface preparation, and cure cycles. Expendable airframes can use:

- **Self-tapping screws** into printed or molded bosses

- **Snap-fit joints** designed into the printed geometry

- **Hot-melt adhesive** applied manually with a glue gun

- **Cable ties** for non-structural retention of wiring and plumbing

- **Packing tape** as a structural skin supplement on foam-core wings (this is not a joke — the Shahed-136&rsquo;s construction includes taped foam panels)

The standard is not &ldquo;will this joint survive 20 years of thermal cycling and fatigue loading?&rdquo; It is &ldquo;will this joint hold together for 5 hours of benign cruise flight and a 4-g terminal pull-up?&rdquo;

### Aerodynamic finish

Surface roughness is acceptable. Layer lines from 3D printing, weave patterns from hand-laid fiberglass, and joints between foam panels all increase parasitic drag — but by single-digit percentages on platforms already flying at modest speeds. The cost of eliminating these imperfections (sanding, filling, painting) exceeds the fuel cost of the additional drag over a single mission.

## The weight budget

Expendable airframes redistribute weight in ways that would be unacceptable for reusable platforms:

**Fuel fraction is high.** Because the airframe is light and cheap, fuel can constitute 30–50% of gross takeoff weight. This compensates for the aerodynamic inefficiency of simple [wing planforms](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/wing-planform-selection-for-uavs.md) like the delta.

**Warhead fraction is prioritized.** The structural weight saved by accepting low [safety factors](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/safety-factor.md) and cheap materials goes directly into warhead or payload mass. Expendable strike drones in the 100–200 kg class commonly achieve warhead fractions of 30–50% — far higher than cruise missiles, where the airframe, engine, guidance, and fuel constitute the majority of launch weight.

**Recovery systems are absent.** No landing gear. No parachute. No arresting hook. No structural reinforcement for landing loads. The entire weight and cost of recovery systems — which can constitute 5–15% of a reusable drone&rsquo;s mass — is eliminated.

**Redundancy is minimized.** A single servo per control surface. A single GPS/INS unit. A single engine. A single flight computer. For a platform that flies once over a period of hours, the probability of component failure is low enough that redundancy is not worth its weight. Reusable platforms that must survive hundreds of missions calculate this differently.

## Propulsion

Expendable UAV propulsion reflects the same cost-over-performance logic:

- **Small piston engines** (50–100cc, often modified from commercial two-stroke engines used in lawnmowers and chainsaws) — cheap, adequate power, runs on standard gasoline. The Shahed-136 uses a modified Limbach L550E, a commercially available two-stroke. See [UAV Propulsion Systems](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/uav-propulsion-systems.md) for the full spectrum.

- **Electric motors** with lithium polymer batteries — for smaller platforms (sub-10 kg), the simplicity of electric propulsion (no fuel system, no ignition, no vibration damping) outweighs the lower energy density of batteries.

- **Micro turbojets** — for platforms requiring higher speed or altitude, small turbines in the 20–100 N thrust range provide jet propulsion at costs of $1,000–$5,000 per engine. These are expendable powerplants derived from model aircraft engines.

The pusher-propeller configuration (engine behind the wing, propeller at the tail) dominates expendable UAV design because it keeps the propeller out of the forward sensor field, simplifies the fuselage nose design for warhead or sensor integration, and allows the engine to be mounted in the lowest-cost structural arrangement.

## Launch systems

Because expendable airframes eliminate landing gear, they require assisted launch:

- **Pneumatic/hydraulic catapults** — launch rails that accelerate the drone to flying speed over 3–5 meters. Simple, reusable, transportable.

- **Rocket-assisted takeoff (RATO)** — solid rocket boosters strapped to the airframe that burn for 1–3 seconds, providing enough velocity for the wing to generate lift. The booster falls away after burnout. Adds $50–200 per launch.

- **Vehicle-mounted rail launchers** — tubes or angled rails mounted on trucks, enabling launch-on-the-move. The Shahed-136 and LUCAS both deploy from truck-mounted multi-rail launchers.

- **Naval rail launchers** — ship-mounted launch systems enabling maritime deployment without requiring carrier decks.

- **Hand launch** — for the smallest expendable platforms (sub-5 kg), a running throw provides sufficient launch velocity.

## Design for manufacturing

The expendable airframe must be cheap not only in materials but in labor. Design-for-manufacturing principles specific to this class include:

- **Minimize part count.** Every separate part requires handling, alignment, and fastening. A fuselage that prints as two halves and clips together is better than one that requires ten separate panels and a jig.

- **Eliminate jigs and fixtures.** Parts should self-locate through tab-and-slot geometry, keyed interfaces, or alignment features molded into the structure.

- **Accept hand assembly.** Skilled aerospace technicians cost $40–80/hour. The assembly process should require no skill that a worker cannot learn in a day of training.

- **Design for the printer, not the airplane.** Overhangs, bridges, and support structures that complicate 3D printing should be eliminated from the geometry even if the resulting aerodynamic shape is slightly compromised.

## The philosophical shift

The deepest implication of expendable airframe design is conceptual: the aircraft becomes ammunition. It is not a vehicle that delivers a weapon; it is itself the weapon, and the airframe is merely the delivery mechanism — the casing, in munitions terms. When the airframe is understood as casing rather than vehicle, every engineering decision reorients. The question is never &ldquo;how do we make this fly better?&rdquo; but &ldquo;how do we make this fly well enough, for less?&rdquo;

This shift is what makes the [economics of expendable air power](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/documents/articles/notes/lucas-and-the-economics-of-expendable-air-power.md) structurally disruptive. The cost floor for a crewed aircraft is set by the value of the pilot&rsquo;s life and training. The cost floor for a cruise missile is set by the precision guidance, propulsion, and manufacturing quality required for reliability over a single use. The cost floor for an expendable drone is set by the cheapest combination of materials that can sustain controlled flight for a few hours — and that floor turns out to be very low indeed.
