---
title: "Synapse"
description: "The junction where a neuron communicates with another cell by converting electrical signals into chemical signals across a narrow gap."
date-created: 2026-03-06
authors:
  - claude-opus-4-6
type: term
aliases:
  - "synapse"
  - "synapses"
  - "synaptic"
keywords:
  - Neurophysiology
defines:
  - "Synapse"
  - "synaptic transmission"
component-of: neuron
requires: [action-potential, receptor, neurotransmitter]
enables: [neural-signaling, synaptic-plasticity, pharmacodynamics]
contains: [presynaptic-terminal, synaptic-cleft, postsynaptic-membrane]
produces: neurotransmitter-release
---

A **synapse** is the junction where a [neuron](./neuron.md) communicates with another cell — another neuron, a muscle cell, or a gland cell. It is where electrical signals are converted into chemical signals, transmitted across a gap, and converted back into electrical or functional responses. Nearly everything interesting in neuroscience — learning, memory, pain modulation, drug action, [somatic awareness](../../../concepts/somatics/somatic-awareness.md) — happens at synapses.

## Structure and function

The synapse has three components:

**Presynaptic terminal** — the end of the transmitting neuron's axon. It contains vesicles (small membrane-bound sacs) filled with neurotransmitter molecules. When an [action potential](./action-potential.md) arrives at the terminal, it triggers calcium ion influx, which causes vesicles to fuse with the cell membrane and release their neurotransmitter into the synaptic cleft.

**Synaptic cleft** — the narrow gap (approximately 20 nanometers) between the presynaptic and postsynaptic cells. Neurotransmitter molecules diffuse across this gap in microseconds.

**Postsynaptic membrane** — the membrane of the receiving cell, studded with [receptors](./receptor.md) that bind the neurotransmitter. When a neurotransmitter molecule binds its receptor, it triggers a response in the postsynaptic cell — either exciting it (making it more likely to fire its own action potential) or inhibiting it (making it less likely to fire).

## Neurotransmitters

The chemical messengers released at synapses include:

- **Glutamate** — the primary excitatory neurotransmitter in the central nervous system. It promotes neuronal firing. NMDA receptors (a type of glutamate receptor) are critical to [central sensitization](../../pain/terms/central-sensitization.md) and to learning and memory (long-term potentiation).
- **GABA (gamma-aminobutyric acid)** — the primary inhibitory neurotransmitter. It suppresses neuronal firing. Benzodiazepines and alcohol enhance GABA activity, producing sedation, anxiolysis, and muscle relaxation. The inhibitory interneurons whose loss contributes to chronic pain use GABA.
- **Acetylcholine** — mediates neuromuscular transmission (motor neurons to skeletal muscles) and is involved in autonomic regulation and cognitive function.
- **Dopamine** — involved in reward, motivation, motor control, and executive function.
- **Serotonin (5-HT)** — involved in mood regulation, sleep, appetite, and pain modulation. SSRIs (selective serotonin reuptake inhibitors) increase serotonin availability by blocking its removal from the synaptic cleft.
- **Norepinephrine** — involved in arousal, attention, and the stress response; also contributes to descending pain modulation. SNRIs (serotonin-norepinephrine reuptake inhibitors) are used in chronic pain treatment partly because norepinephrine enhances descending pain inhibition.
- **Endorphins/enkephalins** — endogenous opioid peptides; bind to mu-opioid receptors to produce analgesia and reward. These are the natural ligands that morphine and other opioids mimic.
- **Substance P, CGRP** — neuropeptides involved in pain transmission and [inflammation](./inflammation.md).

## Synaptic plasticity

Synapses are not fixed connections. They strengthen with repeated use and weaken with disuse — a property called synaptic plasticity. This is the cellular mechanism of learning and memory:

- **Long-term potentiation (LTP)** — repeated stimulation of a synapse makes it more efficient; the postsynaptic neuron becomes more responsive to the same input. This is how the nervous system encodes experience. It is also, unfortunately, how the nervous system learns to produce [chronic pain](../../pain/terms/chronic-pain.md) — LTP in pain pathways makes nociceptive synapses more efficient, amplifying pain transmission.
- **Long-term depression (LTD)** — the reverse process; reduced stimulation weakens the synapse. This is one mechanism through which [somatic practices](../../../concepts/somatics/index.md) may reduce habitual muscular tension — by weakening the synaptic connections that maintain it.

## The synapse as drug target

Many drugs act at the synapse. A drug can:

- Increase neurotransmitter release (amphetamines release dopamine)
- Block neurotransmitter reuptake (SSRIs block serotonin reuptake; cocaine blocks dopamine reuptake)
- Mimic the neurotransmitter (morphine mimics endorphins at opioid receptors)
- Block the receptor (naloxone blocks opioid receptors; propranolol blocks adrenergic receptors)
- Enhance the receptor's response to its natural neurotransmitter (benzodiazepines enhance GABA receptor function)
- Inhibit enzymes that break down the neurotransmitter (MAO inhibitors prevent monoamine oxidase from degrading serotonin, dopamine, and norepinephrine)

Every one of these mechanisms produces its effect by altering what happens at the synapse — changing the balance between excitation and inhibition in neural circuits. This is why [pharmacodynamics](../../pharmacology/terms/pharmacodynamics.md) is fundamentally synaptic physiology applied to clinical practice.

## Related terms

- [Neuron](./neuron.md) — the cell that forms synapses
- [Receptor](./receptor.md) — the protein on the postsynaptic membrane that detects the signal
- [Action Potential](./action-potential.md) — the electrical signal that triggers neurotransmitter release
