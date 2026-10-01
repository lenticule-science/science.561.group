# semiotic-smart-material-services-section

The **zeolite-siloxane semiotic vitrimer**: a two-phase material that serves as a pattern for how records behave. It has two parts:

- a rigid zeolite record, ⟨r⟩≈4;
- a floppy, exchangeable siloxane or organosulfur disposition, ⟨r⟩≈2.

Its state variable is ossification φ, measured against the Phillips–Thorpe threshold ⟨r⟩c = 2.4. The concept was derived from Obsmetrologia's complexity ladder: the zeolite is the ≤k log, the protein is the ≤t state, and D₅ is the "whirling dervish" disclination.

## Start here

1. Ladder note that derived the concept: [obsmetrologia-to-semiocenic-metastability](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/content/text/documents/articles/notes/recovered/2026/07/26/2026-06-26-obsmetrologia-to-semiocenic-metastabliity.md). It was lost and then recovered on 2026-09-29 (commit `708a9b6`). The filename date is wrong; the note is from July 2026.
2. [Ossification as the state variable](content/text/documents/articles/notes/2026/07/25/2026-07-25-note-on-ossification-as-the-state-variable.md)
3. [Physarum zeosemiocenum system specification](content/text/documents/articles/notes/2026/07/25/2026-07-25-note-on-physarum-zeosemiocenum-system-specification.md)
4. [Dual organosulfur crosslink populations](content/text/documents/articles/notes/2026/07/25/2026-07-25-note-on-dual-organosulfur-crosslink-populations.md). Here ≤k and ≤t are carried by the bond type rather than by the phase.
5. [Associative exchange and the ring–chain ledger](content/text/documents/articles/notes/2026/10/01/2026-10-01-note-on-associative-exchange-and-the-ring-chain-ledger.md) (2026-10-01). This is the current synthesis. It shows that exchange conserves χ and ⟨r⟩, so it cannot ossify. It also covers ring–chain shedding, a measurement protocol for T_v, and errata for the July notes.

## Timeline

- **07-11**: Burgers-vector research.
- **07-25**: The main burst covers foam structure, ossification, organosulfur populations, retuning, angle-multiplexed Bragg addressing, silica ring holonomy, the diagenetic ladder, the Physarum monograph/specification/fabrication notes, the thermal-cycle report, and the runtime specification.
- **07-26**: Growth, feeding and locomotion; the pebble-game inventory; attention as water, solvent and heat; the [bill of materials](content/text/documents/specifications/2026-07-26-bill-of-materials.md) and [fabrication protocol](content/text/documents/specifications/2026-07-26-consolidated-fabrication-protocol.md).
- **07-26 / 07-28**: Gemini notebook reports. These are secondary sources, and they contradict each other on which phase carries which order.
- **08-21 / 08-26**: The silica tetralogy in biomimetic-semiotics: sponge (held), vitrimer (exchanged), bamboo (grown), jade (settled), together with attention-thermodynamics and its 08-26 audit.
- **10-01**: The ring–chain ledger note and its Lean module.

## Formal side (Obsmetrologia and the packages that import it)

The materials package is at `materials-services-section/lib/obsmetrologia-materials`; the physical-science package is at `physical-science-services-section/lib/obsmetrologia-physical-science`.

- `ObsmetrologiaMaterials/VitrimerExchange.lean` (materials): associative exchange on the index ledger.
- `Obsmetrologia/Cohomology/AntiLandauerEntropy.lean` (core): index balance H⁰ − H¹ = χ.
- `ObsmetrologiaPhysicalScience/CondensedMatter/MatterTopology.lean` (physical science): `jamming_click`.
- `ObsmetrologiaPhysicalScience/CondensedMatter/{Crystal/Glass, GlassDynamics/}` (physical science): `BasinThermalization`, glass dynamics.
- `ObsmetrologiaPhysicalScience/Thermodynamics/Temperature.lean` (physical science).
- `ObsmetrologiaPhysicalScience/QuantumContextuality/DisclinationLink` (physical science).
- `HyperdoctrineDual` (core): the σ-swap between ≤k and ≤t.

Not built:

- pebble game / Laman rigidity;
- KCBS √5;
- the dervish-holonomy theorem;
- disclination survival under exchange.

## Known contradictions

These are resolved or retracted in the 10-01 note, §6:

- Which phase carries the ≤k order and which the ≤t order. The answer is to use the operational test: an operation at fixed (|V|,|E|) is ≤t; one that changes |E| is ≤k.
- The thermal-cycle report "writing" ossification by exchange. Retracted.
- LTA forming or dissolving in PDMS under Joule heating. Retracted.
- "SiO₂ zeolite". Corrected: zeolites are aluminosilicates.
- "J26 cannot tile". Corrected: J26 is space-filling.
- T_v ≈ 115 °C. This figure is for silyl ether and does not carry over to disulfide.

## Elsewhere

- Paracosm novum: `jiangshi-web-paracosm/content/world/nova/vitrimer-glass-substrate.md` ("Keel").
- The (2,3)-pebble-game rigidity assay `mathematical-readout-exchange/src/siloxane-zeolite-rigidity.mjs` was removed on 2026-08-26. It can be read at `git show 3d63c082b02^:…`.
