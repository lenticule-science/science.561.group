---

title: "Action Potential"
description: "A brief electrical impulse that propagates along a neuron's axon, serving as the fundamental unit of neural signal transmission."
date-created: 2026-03-06
aliases:
  - "action potential"
  - "nerve impulse"
keywords:
  - neurophysiology
defines:
  - "Action Potential"
  - "nerve impulse"
requires: [neuron, cell, synapse]
enables: [neurotransmitter-release, neural-signaling]
component-of: nervous-system
governed-by: homeostasis
acts-on: synapse
---

An **action potential** is the brief electrical impulse that travels along a [neuron's](./neuron.md) axon, carrying information from one part of the nervous system to another. It is the basic unit of neural communication — every sensation you feel, every movement you make, every pain signal processed by the [nociceptive](../../pain/terms/nociception.md) system, involves action potentials traveling along neurons.

## How it works

A neuron at rest maintains a voltage difference across its [cell](./cell.md) membrane — approximately -70 millivolts (the inside is negative relative to the outside). This resting potential is maintained by ion pumps that keep sodium (Na+) concentrated outside the cell and potassium (K+) concentrated inside.

When the neuron receives sufficient stimulation (from a [synapse](./synapse.md), from a sensory receptor, or from an adjacent section of axon), voltage-gated sodium channels in the membrane open. Sodium ions rush into the cell, driven by both the concentration gradient and the electrical gradient. The membrane voltage rapidly rises from -70 mV to approximately +30 mV. This rapid depolarization is the action potential.

The sodium channels then close and voltage-gated potassium channels open. Potassium ions flow out of the cell, restoring the negative resting potential (repolarization). The ion pumps then restore the original ion concentrations.

The entire process takes about 1-2 milliseconds.

## All-or-none and propagation

Action potentials are **all-or-none**: if the stimulation reaches threshold, the action potential fires at full strength; if it does not reach threshold, nothing happens. There is no partial action potential. Information is encoded not by the size of individual action potentials (which are all the same) but by their frequency — a strong stimulus produces more action potentials per second, not bigger action potentials.

The action potential **propagates** along the axon because the depolarization in one region opens sodium channels in the adjacent region, triggering a new action potential there. In myelinated axons, the signal jumps between gaps in the myelin sheath (nodes of Ranvier), dramatically increasing speed — a process called saltatory conduction. This is why myelinated A-delta fibers conduct the fast, sharp component of pain much faster than unmyelinated C fibers conduct the slow, dull component.

## Clinical relevance

**Local anesthetics** (lidocaine, bupivacaine) work by blocking voltage-gated sodium channels. Without sodium influx, the action potential cannot be generated. The neuron cannot fire. No action potential means no signal transmission — which means no pain sensation from the blocked nerve. This is a direct, mechanism-based interruption of neural signaling.

**Anticonvulsants** (phenytoin, carbamazepine) also work by blocking sodium channels, reducing the excessive neuronal firing that produces seizures. Some of these drugs are used in [neuropathic pain](../../pain/terms/central-sensitization.md) because the same mechanism — excessive, sensitized firing — underlies both seizures and certain chronic pain states.

**Demyelinating diseases** (multiple sclerosis, Guillain-Barre syndrome) damage the myelin sheath, slowing or blocking action potential conduction. Symptoms depend on which neurons are affected: motor neurons produce weakness and paralysis; sensory neurons produce numbness, tingling, or pain.
