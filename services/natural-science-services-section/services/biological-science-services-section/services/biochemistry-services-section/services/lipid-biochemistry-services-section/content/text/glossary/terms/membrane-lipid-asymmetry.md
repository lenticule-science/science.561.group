---
aliases:
  - lipid asymmetry
  - plasma membrane asymmetry
  - transbilayer lipid gradient
description: The ATP-dependent maintenance of differing lipid compositions on the inner and outer leaflets of the plasma membrane, mediated by three transporter classes (flippases, floppases, scramblases) with distinct ATP dependence and directionality, allowing loss of asymmetry under ATP depletion to trigger phospholipid externalization and activation cascades.
identity: membrane-lipid-asymmetry
name: Membrane-Lipid Asymmetry
date-created: 2026-09-01
references:
  pomorski2010:
    authors:
      - Todd Pomorski
      - Arthur G. Menon
    title: Lipid flippases and their biological functions
    year: 2010
    publication: Cell and Molecular Life Sciences
    note: Comprehensive review of active lipid transport
relations:
  controlled-by:
    - atp-dependent-flippase
    - calcium-activated-scramblase
  requires: atp
  produced-by: atp-depletion
---

Membrane-lipid asymmetry is the property by which the inner (cytoplasmic) and
outer (extracellular/blood-facing) leaflets of the plasma membrane have
different lipid compositions. This difference is not a static accident of
assembly; it is an actively maintained state, run continuously by ATP-dependent
enzyme systems. Asymmetry determines which lipids are available on the outer
surface for signaling and protein assembly, and which are hidden on the inner
surface. Loss of asymmetry — which occurs under ATP depletion, cell activation,
or injury — is the mechanism by which internalized lipids, particularly the
anionic phospholipid phosphatidylserine, are exposed on the cell surface,
triggering clearance and coagulation responses.

## The composition difference: what is asymmetric

In a healthy resting cell:

- **Inner (cytoplasmic) leaflet:** enriched in phosphatidylethanolamine (PE),
  phosphatidylserine (PS), and phosphatidylinositol (PI). These are charged
  lipids or polar lipids that are sequestered internally. PS is the most
  striking asymmetry: it makes up 5–10% of inner-leaflet phospholipids but is
  normally nearly absent from the outer leaflet.
- **Outer (extracellular) leaflet:** enriched in phosphatidylcholine (PC) and
  sphingomyelin. These are more neutral or zwitterionic lipids that are exposed
  to the aqueous environment and to circulating proteins.

This asymmetry is not random. It appears across cell types and species. The
asymmetry is especially pronounced for PS and PE, which are anionic or small
and polar, respectively. PC and sphingomyelin, which are large and amphipathic,
tolerate exposure to the aqueous environment.

## Three classes of lipid transporters

The asymmetry is maintained by three classes of ATP-dependent and calcium-
dependent transporters, working in opposite directions:

### 1. Flippases (inward transporters, ATP-consuming)

Flippases are ATP-dependent enzymes (particularly members of the P-type ATPase
family, including ATP11A and ATP11C) that actively transport phospholipids from
the outer to the inner leaflet, driven by ATP hydrolysis. Flippases are
selective for PS and PE — the lipids that should be internalized. They require
ATP and they pump lipid inward. The rate of flippase activity is proportional to
ATP concentration; when ATP is depleted, flippase activity drops immediately,
and the inward movement of PS stops.

**Consequence:** Flippase is the brake on PS externalization. As long as ATP is
available, flippase continuously removes PS from the outer leaflet and returns
it to the inner leaflet, maintaining asymmetry despite spontaneous flip-flop.

### 2. Floppases (outward transporters, ATP-consuming)

Floppases are ATP-dependent transporters (including members of the ABC
transporter family) that pump lipids from the inner to the outer leaflet. They
are less well characterized than flippases but are thought to participate in
PC secretion and in some disease states. Like flippases, floppases are ATP-
dependent and are therefore silenced when ATP is depleted.

### 3. Scramblases (bidirectional transporters, calcium-activated, ATP-independent)

Scramblases (TMEM16A and TMEM16F being the major isoforms) are calcium-activated
lipid transporters that work bidirectionally, allowing lipids to move in either
direction through the membrane protein. Critically, scramblases are ATP-
independent — they do not require ATP, and they work even when ATP is depleted.
When intracellular calcium rises (in response to activation, injury, or
apoptosis), scramblase becomes active and permits rapid equilibration of lipids
across the membrane, destroying the asymmetry.

**The critical difference:** Scramblases are calcium-activated and ATP-
independent. Flippases are ATP-dependent and active regardless of calcium (they
are always running in a healthy resting cell).

## The dynamics under different conditions

### Normal resting state

Flippases are active, continuously pumping PS and PE inward from both spontaneous
flip-flop and from low-level baseline scrambling. Asymmetry is maintained and
stable. PS remains hidden on the inner leaflet. The cell is not recognized as
activated or dying.

### Cell activation or injury (calcium rise)

Agonists (thrombin, collagen, etc.) or injury (mechanical, osmotic) cause
intracellular calcium to rise. Rising calcium activates scramblase. Scramblase
immediately begins moving lipids bidirectionally, allowing PS (and PE) to flow
to the outer leaflet. PS externalization happens within seconds to minutes.
Flippase is still active and consuming ATP, but it cannot keep up with the
scrambling — the inward movement is overwhelmed by the outward movement. PS
accumulates on the outer leaflet. This is the normal activation response and is
reversible.

After the activation signal resolves, calcium falls, scramblase inactivates,
and flippase re-internalizes the PS. Asymmetry is restored.

### ATP depletion (e.g., hypoxia, mitochondrial dysfunction)

ATP levels fall. Flippase activity drops immediately and severely, because it is
an ATP-consuming pump. The inward transport of PS slows dramatically. If
scramblase is simultaneously active (due to some concurrent calcium signal or
injury), there is a net outward movement of PS, and asymmetry is lost. Even if
scramblase is inactive, PS that has been spontaneously moved to the outer leaflet
is not being returned inward by flippase, so PS accumulates externally.

The critical consequence is that ATP depletion causes PS externalization even
without activation or injury. The cell exposes PS not because it has been
activated by an agonist, but because it cannot afford the ATP cost of keeping PS
hidden. This is a procoagulant state triggered by energy failure, not by
activation.

### Apoptosis (programmed cell death)

Apoptotic cells externalize PS as part of the apoptotic cascade. This is mediated
by both calcium-driven scramblase activation and by sustained ATP consumption
during apoptosis. The PS externalization is the "eat me" signal that marks the
apoptotic cell for macrophage clearance. This is an intentional, regulated
process — PS externalization is part of how the immune system recognizes cells
that should be removed.

## The ATP cost of maintaining asymmetry: an inference

Flippase activity is ATP-consuming. Every PS or PE molecule that is moved inward
costs one ATP (or a fraction thereof, depending on the stoichiometry of the
pump). In a cell with many millions of phospholipid molecules undergoing
constant spontaneous flip-flop, the cumulative ATP cost of maintaining asymmetry
is non-trivial. A cell with compromised ATP production — due to mitochondrial
dysfunction, hypoxia, or metabolic failure — would be expected to prioritize
ATP use, and membrane-asymmetry maintenance may be deprioritized relative to
essential processes like maintaining ionic gradients.

This connection between ATP status and PS externalization is a mechanistic
expectation from the transport biology. It is not yet a demonstrated pathway in
any specific disease. The inference is that the energy failure findings in
ME/CFS and long COVID, combined with the microclot burden findings, may be
connected by this mechanism: ATP depletion causes PS externalization on platelets
and red cells; externalized PS triggers platelet activation and coagulation;
the result is microclot formation. If this is true, then PS externalization and
ATP status should be measurable in the same subjects, on the same samples, and
correlated. This measurement has not been done.

## Related terms

- Phosphatidylserine — the most important asymmetric lipid
- Flippase — the ATP-dependent inward transporter
- Floppase — the ATP-dependent outward transporter
- Scramblase — the calcium-activated bidirectional transporter
- Platelet-activation — producing PS externalization
- Coagulation-cascade — enabled by PS externalization
- Apoptosis — using PS externalization as "eat me" signal
- ATP depletion — causing loss of asymmetry
