# Koios.News Visual Grammar v3

Status: proposed scientific specification for a durable Koios.News image language.

## Research question

Can Koios maintain a recognizable editorial visual identity while using multiple generative-image providers whose rendering behavior changes over time?

The hypothesis is that recognition should be carried by a **provider-independent scene grammar**, not by a single model's remembered "style."

## Core principle

A Koios image is a structured composition over semantic visual roles. Generative models render **parts**. Deterministic software owns assembly, typography, marks, crops, metadata, and export.

The system therefore separates:

1. **semantic scene** — what the image means;
2. **visual grammar** — how Koios is allowed to represent that meaning;
3. **rendered assets** — provider-produced components;
4. **assembly** — deterministic composition into publication surfaces;
5. **assay** — recognition, legibility, fidelity, novelty, and reuse checks.

## Canonical palette roles

- `paper`: #fbfaf7
- `ink`: #171a21
- `signal`: #000088 ("008 blue")
- `signal-secondary`: #5366c4
- `fog`: #b9c1da
- `mineral`: #cdb26d

The generator may produce antialiasing and bounded tonal variation around a role, but may not introduce an unbounded brand palette. Red is not a Koios signal color.

## Shape vocabulary

Primitive forms:

- circle / disc — state, body, world, bounded system;
- five-blade aperture — observation, situated intelligence, recurrence, a bounded opening through which a system is read;
- arc / orbit — trajectory, relation, path dependence;
- bar / column — capacity, institution, stock, infrastructure;
- wedge / triangle — direction, intervention, asymmetry;
- threshold / arch — transition, possibility space, passage;
- horizon — temporal boundary, constraint, frontier;
- line field — network, measurement, causality, transmission;
- silhouette — actor class, population, agency without portraiture;
- terrain — material/ecological substrate;
- lattice — evidence, discretization, machine-readable structure.

A scene should normally use 2–5 primitive families, not every primitive.

## Semantic roles

Every generated component must declare one role:

- `primary-symbol`
- `actor`
- `institution`
- `terrain`
- `world`
- `trajectory`
- `threshold`
- `signal`
- `network`
- `evidence`
- `background-field`
- `ornament`

The first ten roles carry meaning. `ornament` is optional and should usually be omitted.

## Section mappings

These are defaults, not icons that must be repeated literally.

- Technology → actor + structure + threshold
- Science → world + orbit + evidence
- Society → actors + terrain/field + relation
- Economy → columns + trajectory + threshold
- AI & Autonomy → actor + five-blade aperture + network + signal
- Environment → terrain + world + flow
- Space → world + horizon + orbit
- Health → body silhouette + internal lines + signal
- Governance → institution + columns + relation
- Ideas → five-blade aperture + line field + threshold

## Rendering character

Target: **clean isometric modernist symbolic editorial illustration, as if a 2047 publication inherited Bauhaus/Swiss/linocut abstraction but no longer needed the historical print defects.**

Required:

- isometric / axonometric parallel projection as the default scene perspective;
- the two ground-plane axes read at ±30° from horizontal, with no converging vanishing point;
- hard, intentional geometry;
- crisp silhouettes and isometric solids;
- large flat fields;
- physically legible overlap and occlusion;
- depth from isometric placement, elevation, scale, crop, translucency, and layering rather than camera perspective;
- sparse structural shadows that respect the isometric construction;
- limited microtexture only when it conveys material, never faux-aged paper;
- no simulated print grain, halftone damage, ink bleed, distressed edges, vintage registration error, or artificial archival wear;
- no generic neon/cyberpunk;
- no floating UI chrome unless it is itself the subject;
- no generated text inside component assets unless the contract explicitly requires a textual component.

Flat frontal compositions are non-default. Use them only for diagrams, maps, or other subjects whose semantics require orthographic flatness.

## Isometric dimensionality

Koios defaults to **isometric editorial space**:

- parallel projection;
- no vanishing point;
- three scene axes separated by 120° in the projected construction;
- buildings, bodies, machines, terrain, and abstract symbols may occupy one shared axonometric field;
- depth is communicated by elevation, adjacency, occlusion, and layer relation rather than cinematic lens effects;
- one impossible spatial relation is permitted when it clarifies the concept, but the surrounding isometric logic should remain legible.

This makes the illustration system feel computational and spatial without locking the brand to photorealistic 3D-render fashions.

## Canonical five-blade aperture mark

The Koios mark is **not an eye**. It is a five-sided rotating aperture that may read faintly eye-like only because an aperture is a device for observation.

Canonical construction:

- five blades arranged around one central negative pentagonal opening;
- clockwise rotational tension / whirling motion;
- no pupil, iris, almond outline, eyelids, or literal eyeball geometry;
- four entire blades are `ink` (#171a21);
- the **entire southeast / bottom-right blade** is `signal` (#000088);
- never color only the tip, edge, stripe, or partial face of the signal blade;
- no enclosing circle is required for the standard mark;
- the mark must remain legible at favicon scale.

The canonical orientation is semantically meaningful brand state. Although the fivefold carrier has dihedral symmetries, the publication mark does **not** freely rotate the blue blade between uses. Bottom-right is the stable public orientation.

### Obsmetrologia resonance, not proof

The fivefold mark is permitted because five is already a real recurring structure in Obsmetrologia:

- the Dervish Recurrence Conjecture is stated on a `D₅`-equivariant pentagonal obstruction carried by `C₅`;
- the KCBS readout is a five-cycle with exact quantum value `√5`;
- the golden-field bridge ties `√5`, `φ`, and the pentagon spectral gap in one field;
- `d = 5` is the first non-crystallographic gap beyond the crystallographic `{2,3,4,6}` orders;
- the five-site disclination has the KCBS pentagon as its boundary link;
- elsewhere the four-corner recurrence is explicitly read in **five readings of one object**.

These facts justify fivefold visual resonance. They do **not** license saying the Koios logo encodes or proves the still-open strong Dervish Recurrence Conjecture. The brand uses five as a disciplined structural echo, not a mathematical theorem.

## Controlled uncanny

Uncanny content belongs to ontology, not horror styling.

Allowed:

- a cyclopean artificial person in a suit;
- nonhuman agents occupying normal institutional space;
- unfamiliar material organisms represented matter-of-factly;
- architecture scaled for machine/human mixed use;
- impossible-but-clean diagrams that behave like mature technical conventions.

Disallowed:

- corrupted text;
- glitch effects;
- gore;
- SCP stamps;
- hazard-striping as atmosphere;
- Backrooms yellow;
- surveillance-camera tropes;
- monster framing.

## Component generation

Prefer transparent or clean-background **assemblable components** over complete posters.

Example component set for one story:

- `world-disc.png`
- `institution-bars.png`
- `agent-silhouette.png`
- `trajectory-arcs.svg`
- `terrain-field.png`
- `mask-primary-symbol.png`

The same component may be reused across homepage, social, email, video, and slide surfaces with different deterministic layouts.

## Composition fields

Scene v2 gives each layer a normalized spatial contract. Coordinates are fractions of the final canvas, so one semantic composition can compile to many export sizes.

Every layer declares:

- `x`, `y`, `width`, `height` — normalized composition field;
- `anchor` — the semantic attachment point inside that field;
- `fit` — contain or cover;
- `opacity` — deterministic layer opacity;
- `rotation` — bounded deterministic rotation;
- `clip` — whether the field acts as a mask boundary;
- `blend` — normal, multiply, or screen.

This is not a generic page-layout engine. The coordinates carry **semantic composition**. An actor may be lower-right because the institutional threshold dominates the field; a trajectory may occupy the full scene but sit behind the actor; an evidence lattice may deliberately occupy a small stable zone across an entire story series.

### Recomposition across surfaces

A scene should preserve its **topological relationships** across aspect ratios even when exact coordinates change.

For example:

- article hero: institution left 55%, actor right 35%, trajectory behind both;
- social square: institution becomes lower field, actor moves center-right, trajectory becomes a framing arc;
- vertical story: institution becomes a threshold at bottom, actor occupies the middle, signal moves to upper field.

These are separate deterministic layout templates over the same semantic component identities.

The same generated component should not be regenerated merely because the final crop changed.

### Negative space as a first-class field

Koios compositions reserve deliberate empty space for deterministic publication text and marks. Generators should not fill those regions. Negative space is therefore part of the scene contract, not an accident after cropping.

## Asset custody membrane

A provider response is not yet a Koios asset.

Before a generated component can enter the reusable library or deterministic assembler, its bytes must be:

1. materialized from inline data or a provider URL;
2. bounded by size;
3. admitted as an expected image media type;
4. checked for active/external content when the format is SVG;
5. identified from the actual bytes with `ni:///sha-256;...`;
6. detached from the provider's temporary URL and request session;
7. stored through an admitted asset-custody service.

For SVG specifically, the ingestion membrane should refuse scripts, event handlers, `javascript:` references, `foreignObject`, and external HTTP(S) resource references. A generated vector is treated as untrusted markup until it passes this membrane.

Final publication assembly should reference admitted content-addressed assets or their controlled custody URLs, never ephemeral generator URLs.

## Deterministic assembly invariants

Generators do not own:

- Koios five-blade aperture mark;
- wordmark;
- headline typography;
- section labels;
- timestamps;
- evidence metadata;
- logo safe areas;
- final 008-blue correction;
- crop rules;
- export dimensions;
- file naming;
- provenance identifiers.

Those are software responsibilities.

## Novelty budget

A Koios image should be recognizable before it is surprising.

Recommended perceptual allocation:

- 55–70% persistent grammar;
- 20–35% story-specific symbolic composition;
- 5–15% controlled novelty.

A provider result that achieves novelty by breaking palette, geometry, or role semantics is non-conformant.

## Recognition assay

For each candidate image set:

1. remove wordmarks and article text;
2. show image among at least four non-Koios editorial images;
3. ask whether the viewer identifies it as Koios;
4. record confidence and which cues drove recognition;
5. separately ask what the image appears to mean;
6. penalize recognition based only on the five-blade aperture mark.

Desired outcome: recognition comes from **composition grammar + palette + symbolic semantics**, with the aperture mark as corroboration.

## Provider-diversity assay

For one scene graph, produce renderings from at least two providers.

A grammar is robust when:

- both outputs can be assembled without changing the layout contract;
- semantic roles remain visually legible;
- the palette can be normalized without destroying the image;
- a viewer judges both outputs to belong to the same publication;
- provider-specific quirks remain subordinate to Koios identity.

## Failure modes

Reject:

- beautiful but unassemblable posters;
- model-generated typography pretending to be publication typography;
- faux-vintage grain;
- generic "AI blue gradient";
- icon packs with no story semantics;
- images that require prompt history to understand;
- uncontrolled photorealistic people used as generic stand-ins;
- components whose silhouettes collapse at thumbnail size;
- style consistency that depends on one proprietary seed or undocumented provider state.

## 2047 direction

The 2047 move is not "more generated." It is **more compiled**.

A future visual organization should be able to:

- express an editorial concept as a typed scene graph;
- route each component to the provider best suited to it;
- reuse already-good components by semantic identity;
- compare providers automatically;
- assemble outputs deterministically across many surfaces;
- preserve provenance and cost records;
- learn which visual primitives communicate which ideas;
- evolve the grammar without invalidating the asset library.

The generator is a rendering peripheral. The visual language is institutional knowledge.
