---
aliases:
  - NVC
description: A regulatory control system in which local neural activity triggers astrocyte-mediated vascular dilation to ensure oxygen delivery matches neural metabolic demand; the physical substrate of BOLD fMRI.
identity: neurovascular-coupling
name: Neurovascular coupling
date-created: 2026-09-01
relations:
  distinguished-from: cerebral-autoregulation
---
Neurovascular coupling is a moment-to-moment regulatory control system: a feedback loop that keeps cerebral blood flow in close alignment with the changing metabolic demands of active neurons. The brain operates with no significant energy reserves, so the match between oxygen supply and oxygen consumption must be maintained continuously. When neurons in a region fire, they immediately increase their metabolic consumption of oxygen and glucose. Within seconds, blood flow to that same region increases, delivering the needed substrate before depletion can occur. This rapid, local adjustment is the phenomenon of neurovascular coupling.

The mechanism is not a direct neural command to blood vessels, but a multi-step chemical signaling pathway. When neurons are active, they release the neurotransmitter glutamate into the extracellular space. Nearby astrocytes, star-shaped glial cells that wrap around both synapses and blood vessels, sense this glutamate and become activated. Astrocytes then release vasoactive signaling molecules, most critically nitric oxide (produced by astrocytic endothelial nitric oxide synthase), which diffuses outward and acts on the smooth muscle cells of nearby cerebral vessels, causing them to relax and dilate. Additionally, potassium ions released by active neurons accumulate in the extracellular space; astrocytes take up this potassium, and the uptake process can itself trigger further astrocytic release of vasodilatory signals. The result is a robust, multi-input feedback system: neural activity drives multiple parallel pathways toward the same endpoint — vascular dilation and increased blood flow.

Neurovascular coupling is the direct physical basis of functional neuroimaging by BOLD (blood oxygen level-dependent) fMRI. The BOLD signal does not measure neural firing directly; it measures the magnetic properties of hemoglobin, which differ depending on whether the hemoglobin is bound to oxygen (diamagnetic) or not (paramagnetic). When blood flow increases faster than oxygen consumption increases — as happens during local neural activity — the blood in that region becomes enriched in oxygenated hemoglobin, producing a measurable MRI signal change. This entire inferential chain, from brain activity to BOLD signal, depends on intact neurovascular coupling. If the coupling mechanism fails — if astrocytes cannot be activated, or nitric oxide signaling is blocked, or vessels cannot dilate — then the BOLD signal will not reliably reflect neural activity, even if neurons continue firing normally. This should be distinguished from cerebral autoregulation, which is a separate, slower homeostatic system that maintains overall cerebral blood flow constant across systemic blood-pressure fluctuations, operating over minutes rather than seconds and over the scale of whole-brain perfusion rather than local region-by-region adjustments.

If neurovascular coupling is impaired, the validity of inferences drawn from BOLD fMRI becomes uncertain. A patient group showing reduced BOLD activation in a particular brain region might actually have intact neural activity but impaired vascular responsiveness; the reduced signal would then reflect vascular rather than neural dysfunction. This is a particular concern in patients with suspected vascular or endothelial damage, such as those with a history of systemic viral infection, or those with conditions that compromise glial function. Any BOLD fMRI study attempting to detect neural differences between patients and healthy controls must contend with the possibility that an apparent group difference in activation reflects a difference in neurovascular coupling rather than a difference in neural processing. Direct measurement of blood flow (through arterial spin labeling or other perfusion imaging techniques) can help disambiguate these possibilities, but BOLD-only studies remain vulnerable to this confound.

## Related terms

- Astrocyte — the glial cell type that mediates the connection between neural signals and vascular response
- Nitric oxide — a critical signaling molecule released by astrocytes that triggers vascular dilation
- BOLD fMRI — functional neuroimaging that depends entirely on intact neurovascular coupling
- Cerebral autoregulation — a slower, global homeostatic system maintaining overall brain perfusion
- Cerebral blood flow — the physiological output that neurovascular coupling regulates
