---

title: "Neuron"
description: "A cell specialized for generating and transmitting electrical signals, serving as the functional unit of the nervous system."
date-created: 2026-03-06
aliases:
  - "neuron"
  - "neurons"
  - "nerve cell"
keywords:
  - neurophysiology
  - anatomy
defines:
  - "Neuron"
  - "nerve cell"
restricts: cell
contains: [synapse, receptor, axon, dendrite]
component-of: nervous-system
produces: action-potential
requires: [myelin, glial-cell]
enables: [neural-signaling, nociception]
---

A **neuron** is a [cell](./cell.md) specialized for generating and transmitting electrical signals. Neurons are the functional units of the nervous system — every sensation, every movement, every thought, every autonomic adjustment involves neurons carrying information from one part of the body to another.

## Structure

A neuron has three primary components:

**Cell body (soma)** — contains the nucleus and most of the cell's metabolic machinery. The soma integrates incoming signals from other neurons and determines whether to fire an [action potential](./action-potential.md).

**Dendrites** — branching extensions that receive signals from other neurons. A single neuron may have thousands of dendrites, each receiving input from a different source. The dendrites are the neuron's "input" side — where information arrives.

**Axon** — a single, often long extension that carries the action potential away from the cell body toward the next neuron, muscle cell, or gland. Axons can be very short (interneurons in the spinal cord) or very long (motor neurons running from the spinal cord to the toes — up to a meter in length). The axon is the neuron's "output" side — where information is sent.

Many axons are wrapped in **myelin** — a fatty insulating sheath produced by specialized glial cells (Schwann cells in the peripheral nervous system, oligodendrocytes in the central nervous system). Myelin dramatically increases the speed of signal transmission: a myelinated axon conducts impulses at 70-120 meters per second, compared to 0.5-2 meters per second for unmyelinated axons. This speed difference is clinically significant — it is why the fast, sharp "first pain" (carried by thinly myelinated A-delta fibers) arrives before the slow, dull "second pain" (carried by unmyelinated C fibers) when you stub your toe.

At the end of the axon, terminal branches form [synapses](./synapse.md) — junctions where the neuron communicates with its targets.

## Types of neurons

Neurons are classified by function:

- **Sensory (afferent) neurons** — carry information from the body to the central nervous system. [Nociceptors](../../pain/terms/nociception.md) (pain-detecting sensory neurons), [proprioceptors](../../somatics/proprioception.md) (position-detecting sensory neurons), and the receptors underlying [interoception](../../somatics/interoception.md) (internal-state-detecting sensory neurons) are all types of sensory neurons.
- **Motor (efferent) neurons** — carry commands from the central nervous system to muscles and glands. When [somatics](../../../concepts/somatics/index.md) describes restoring cortical control over habitually contracted muscles, it is describing the re-establishment of voluntary motor neuron signaling.
- **Interneurons** — connect neurons to other neurons within the central nervous system. The inhibitory interneurons in the spinal cord's dorsal horn are critical to pain modulation — they suppress [nociceptive](../../pain/terms/nociception.md) transmission, and their loss contributes to [central sensitization](../../pain/terms/central-sensitization.md).

## Glial cells

Neurons do not operate alone. Glial cells — which outnumber neurons roughly 1:1 in the brain — provide structural support, insulation, nutrition, and immune defense. Two types are particularly relevant to this module:

- **Microglia** — the nervous system's immune cells. When activated by injury or sustained nociceptive input, microglia release inflammatory cytokines that maintain neuronal hyperexcitability — a key mechanism in [chronic pain](../../pain/terms/chronic-pain.md).
- **Astrocytes** — regulate the chemical environment around synapses, modulate synaptic transmission, and participate in the neuroinflammatory processes that sustain central sensitization.
