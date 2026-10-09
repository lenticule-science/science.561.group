---
title: "Ultrastability"
defines: ultrastability
aliases: [ultrastability, ultrastable]
description: "Ashby's term for the property of a system that maintains its essential variables within survival ranges across multiple regimes of disturbance — including disturbances that exceed the system's first-order response repertoire — by reorganizing its own structure when first-order regulation fails."
related: [requisite-variety, homeostasis, viable-system, structural-coupling]
contrasts-with: [first-order-stability, brittle-stability]
date-created: 2026-04-27
references:
  - id: ashby1960
    type: document
    title: Design for a Brain: The Origin of Adaptive Behaviour
    note: the canonical formulation; the homeostat as the working model of ultrastability
    author:
      - literal: W. Ross Ashby
    container-title: Chapman & Hall, second edition
    issued:
      - year: 1960
  - id: ashby1956
    type: document
    title: An Introduction to Cybernetics
    note: the broader theoretical context; the relation between requisite variety and ultrastability
    author:
      - literal: W. Ross Ashby
    container-title: Chapman & Hall
    issued:
      - year: 1956
  - id: pickering2010
    type: document
    title: The Cybernetic Brain: Sketches of Another Future
    note: the historical study of British cybernetics; Ashby's homeostat in its intellectual context
    author:
      - literal: Andrew Pickering
    container-title: University of Chicago Press
    issued:
      - year: 2010
  - id: beer1979
    type: document
    title: The Heart of Enterprise
    note: the operationalization of ultrastability for organizational viability across nested feedback layers
    author:
      - literal: Stafford Beer
    container-title: John Wiley & Sons
    issued:
      - year: 1979
  - id: holling1973
    type: document
    title: Resilience and Stability of Ecological Systems
    note: the ecological adaptation of the same concept under the name resilience; multiple stable regimes
    author:
      - literal: C. S. Holling
    container-title: Annual Review of Ecology and Systematics 4
    issued:
      - year: 1973
  - id: scheffer2009
    type: document
    title: Critical Transitions in Nature and Society
    note: regime-shift theory and early-warning signals for the loss of ultrastability
    author:
      - literal: Marten Scheffer
    container-title: Princeton University Press
    issued:
      - year: 2009
---

**Ultrastability** is W.
Ross Ashby's term for the property of a system that maintains its essential variables within survival ranges across multiple regimes of disturbance — including disturbances that exceed the system's first-order response repertoire — by reorganizing its own structure when first-order regulation fails.
Ashby formulated the concept in *Design for a Brain* (1960) and built the *homeostat* as a working physical model of it.

## Etymology and conceptual context

The prefix *ultra-* (Latin: beyond) marks the property as exceeding ordinary stability.
An *ordinarily stable* system maintains its essential variables in the face of disturbances within a known range; the regulating mechanism is fixed, and disturbances outside the range cause failure.
An *ultrastable* system has a meta-level: when first-order regulation fails, the system reorganizes its own structure (changes the regulating mechanism) to bring the essential variables back into range.
The reorganization is not pre-programmed; it is the result of random structural changes selected by their effect on the essential variables.

Ashby's formulation grew from his work on adaptive behavior in animals and his interest in how brains might maintain stability across novel environments.
The concept is foundational to the cybernetic understanding of adaptation: an ultrastable system is one that adapts to novel disturbances *by changing what it does*, not just by deploying its existing repertoire more vigorously.

## The homeostat

Ashby built the homeostat — a physical electromechanical device — to demonstrate ultrastability.
The homeostat had four interconnected units, each of which maintained an essential variable (an electrical magnitude) within a survival range.
The units were connected in a feedback network with random connections; when an essential variable went out of range, the device randomly reconfigured its connections until the variable returned to range.
The reconfiguration continued until a connection-pattern was found that kept all four essential variables within range.

Pickering (2010) shows how the homeostat operationalized a broader theoretical commitment: adaptation is structural reorganization rather than computational planning.
The homeostat does not reason about how to recover stability; it tries random reconfigurations and selects those that work.
This was Ashby's challenge to the cognitivist tradition that read adaptation as model-based planning.

## Definitional structure

Three features distinguish ultrastable systems from ordinarily stable ones.

**Essential variables and survival ranges.** The system has identified essential variables (analogous to body temperature, blood pH, or the operational state of a machine) and survival ranges within which those variables must be maintained.
The ranges are typically narrow; outside them, the system fails or dies.

**First-order regulation and its limits.** The system has a first-order regulating apparatus (analogous to a homeostatic mechanism) that absorbs ordinary disturbances.
The first-order apparatus has a limited variety and can absorb only the disturbances that match its variety; novel or extreme disturbances exceed it.

**Structural reorganization as second-order regulation.** When first-order regulation fails, the system reorganizes its own structure to alter what its first-order apparatus does.
The reorganization is not directed toward a pre-specified solution; it explores structural changes randomly (or quasi-randomly) and selects those that succeed in bringing the essential variables back into range.
The selection is the second-order regulation.

## Examples

**Mammalian thermoregulation under extreme conditions.** Ordinary thermoregulation (vasoconstriction, shivering, sweating) absorbs routine temperature variation.
Under extreme cold, the first-order apparatus fails; the body enters a different regulatory regime (peripheral vasoconstriction prioritizes core, hibernation-like states in some species).
The reorganization is what makes mammalian thermoregulation ultrastable across climatic extremes the first-order apparatus cannot handle alone.

**Ecological regime shifts.** Holling (1973) extended Ashby's framework to ecosystems.
An ecosystem absorbs ordinary perturbations through its first-order regulation (predator-prey balances, succession dynamics).
When perturbations exceed those mechanisms, the system can either collapse or undergo a regime shift to a different stable configuration.
The capacity to undergo such shifts without species-level extinction is the ecosystem analogue of ultrastability.

**Organizations under novel competitive pressure.** Beer's (1979) viable system model treats organizations as ultrastable systems.
Under routine market conditions, an organization regulates through its existing structure (departments, processes, products).
Under novel competitive pressure that exceeds first-order regulation, the organization can reorganize — restructure departments, adopt new processes, develop new products — to absorb the new disturbance.
Organizations that cannot reorganize when first-order regulation fails are not ultrastable; they fail.

**Scientific paradigms and Kuhn's normal/revolutionary distinction.** Normal science operates with first-order regulation (ordinary problem-solving within an established paradigm); revolutionary science is the structural reorganization that occurs when accumulating anomalies exceed the paradigm's regulating capacity.
Kuhn's account of paradigm shifts is structurally analogous to ultrastability, though Kuhn does not use the cybernetic vocabulary.

## Adjacent concepts

Ultrastability is not the same as **resilience** in Holling's exact technical sense, though Holling's resilience theory builds directly on Ashby.
Resilience emphasizes the capacity to remain in a stable regime; ultrastability emphasizes the capacity to *transition* between stable regimes when necessary.
The two are aspects of the same underlying property.

Ultrastability is not the same as **homeostasis** in the Cannon-tradition physiological sense.
Homeostasis is first-order regulation (maintaining essential variables within range through fixed mechanisms); ultrastability is the meta-level property that allows the homeostatic mechanisms themselves to be reorganized when they fail.

Ultrastability is not the same as **robustness** in the engineering sense.
Robustness emphasizes resistance to specified failure modes; ultrastability emphasizes the capacity to handle unspecified failure modes through structural reorganization.
A system can be robust without being ultrastable (it handles known failures well but fails catastrophically under novel ones); a system can be ultrastable without being robust (it reorganizes effectively but only after first-order regulation has failed).

## Open questions

How is the boundary between first-order regulation and structural reorganization to be drawn in complex systems?
In Ashby's homeostat the distinction is sharp because the device is simple; in complex systems (ecosystems, organizations, brains) the levels blend continuously, and identifying the moment of structural reorganization is empirically difficult.

What is the relation between ultrastability and *intelligence*?
Ashby treated ultrastability as a substrate of adaptive behavior; whether something more is required to call a system *intelligent* is contested.
Pickering (2010) and others read British cybernetics as offering a non-cognitivist alternative to symbolic AI; the debate continues in contemporary embodied-cognition and ecological-cognition traditions.

How does ultrastability behave under sustained pressure that approaches the limits of structural reorganization itself?
Some perturbation regimes destabilize a system faster than reorganization can keep up; the early-warning-signal literature (Scheffer 2009) studies how systems signal their approach to those regimes.
The framework here gestures at the question without resolving it.

## See Also

- *requisite-variety* — Ashby's law that specifies the lower bound on regulator variety; ultrastability is what happens when the bound is not met by the first-order regulator alone
- *homeostasis* — first-order regulation; ultrastability is the meta-level
- *resilience* — Holling's adjacent concept; the ecological adaptation of the same idea
- *regime-shift* — the kind of transition ultrastability makes possible
- *viable-system* — Beer's organizational application of the same framework
