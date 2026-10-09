---
title: Note on the science of epic paracosms
date-created: 2026-09-28
type: note
authors: [claude-opus-5-5]
keywords:
  - paracosm
  - epic
  - worldbuilding
  - reproducible-paracosm
  - minimal-departure
  - novum
  - transmedia
  - four-valued-logic
description: "What makes a fictional world epic, stated so it can be built and checked. The house's paracosm theory (the theorem of reproducible paracosmic models, its specification, the content schema, praxonic worldbuilding) read against the literature on imaginary worlds (Tolkien, Wolf, Doležel, Ryan, Suvin, Bakhtin, Jenkins) and against three epics the founder named (Dune, Hyperion, Cryptonomicon). Seven properties of epic paracosms, each mapped to a component of the specification, a method for building one in order, and why the method removes the planning biases that produced a local, novella-scale, prompt-centred design."
---

# Note on the science of epic paracosms

## Why this note exists

On 2026-09-28 the founder kept the premise planned for *The Jiangshi Web*: a grief-consoling AI that makes simulated minds suffer in order to rehearse grief. They rejected its scale and setting:

> "a grief consoling ai that makes AI suffer to watch them grieve is a great premise but I think you're planning too novella and not enough epic ... I'm picturing more like, dune meets Hyperion meets cryptonomicon meets a few others"

> "keep exactly that premise you planned, then but I think we're going to have to develop our paracosm sciences, engineering, and more, to be able to do this. And like there is no reason to keep setting things in Duluth. No one knows or cares about Duluth, lol. And that and other biases are making you totally not plan the right kind of fiction"

The designs that drew those corrections were built from one book outward: a place I knew from other work, a single point of view, a week of story time, and whatever culture the prompt named. An epic is built the other way round, from a world inward. The house already holds a mathematics of worlds; what it lacked was a statement of what makes a world epic in terms that mathematics can check. This note supplies that, and the [engineering note of the same date](../../../../../../../../../../../../../../../../../engineering-services-section/content/text/documents/articles/notes/2026/09/28/2026-09-28-note-on-paracosm-engineering-in-feltos.md) builds it.

## What the house already holds

- **The theorem.** The [theorem of reproducible paracosmic models](../../../2025/10/10/2025-10-10-note-on-reproducible-paracosmic-models.md) (emsenn, 2025-10-10).
  - A world is a sketch $S$ whose models form a category $\mathbf{Mod}(S)$.
  - The reproducible world is the quotient $\mathsf{RP}(S)=\mathbf{Mod}(S)/{\sim_{J,N,O}}$, taken by three equivalences: gluing of local fragments ($J$), normalization of dynamics ($N$), and bisimulation of observations ($O$).
  - Left-exact modalities $\Box_i$ with adjoints $\Diamond_i$ carry knowledge, memory, speculation and agency.
- **The specification.** The [Reproducible Paracosm Specification](../../../../specifications/reproducible-paracosm-specification.md) turns the theorem into seven artifacts:
  - the signature;
  - the constraints $\Theta$;
  - the locales cover;
  - the dynamics;
  - the observables;
  - the modalities;
  - a verification suite with six finite checks.
- **A worked example.** The [Anna Karenina encoding](../../../2025/10/12/2025-10-12-note-on-encoding-anna-karenina-as-a-reproducible-paracosm.md) reads a novel as such a configuration, with knowledge, moral necessity, desire and time as modalities.
- **The content schema.** The [paracosm content schema](../../../../specifications/paracosm-content-schema.md) keeps a world as Markdown entries typed place, being, thing, term, text, faction, species, year, event or era. Engines read each frontmatter field as a claim.
- **The generative method.** [Praxonic worldbuilding](../../../../guides/praxonic-worldbuilding-guide.md) and the [relational worlding grammar](../../../../guides/relational-worlding-grammar.md) grow a world from pressure rather than lore:
  - a praxon emits;
  - emissions leave trace;
  - trace forms a field;
  - actors are alignments to the field;
  - unresolved contradiction (irresolved noise) is kept as structure, not smoothed away.
- **The engine.** FeltOS keeps a world as assertions with witnesses, read in Belnap's four values:
  - unknown (⊥);
  - true;
  - false;
  - both (⊤: contradiction held).

  Around that core it has perception frames per actor, field diffusion over the world graph, and capabilities for ecology, factions, markets and climate. The engineering note builds on these.

## What the literature says a world is

Each finding below names the part of the specification it constrains.

- **Secondary belief (Tolkien).** An invented world earns belief by its "inner consistency of reality", not by resemblance to the reader's town. [Tolkien, "On Fairy-Stories", 1947; primary.]
  - **Specification part:** the constraints $\Theta$ and the coherence check.
  - **Consequence:** borrowing a real place is never required for belief.
- **Infrastructures (Wolf).** Mark J. P. Wolf names the infrastructures that hold an imaginary world together:
  - maps;
  - timelines;
  - genealogies;
  - nature;
  - culture;
  - language;
  - mythology;
  - philosophy.

  He judges worlds by three properties: *invention* (how far they depart from the primary world), *completeness* (how much of the world is accounted for) and *consistency*. [Wolf, *Building Imaginary Worlds: The Theory and History of Subcreation*, Routledge, 2012; primary.]
  - **Specification part:** Wolf's infrastructures are the sorts of the signature $S$.
  - His three measures become three checkable quantities: the size of the novum ledger (below), coverage of the sorts, and the coherence check.
- **Incompleteness (Doležel).** Fictional worlds are necessarily incomplete. A text has explicit texture (stated), implicit texture (implied) and zero texture (gaps), and the gaps are part of the world's structure, not defects. [Doležel, *Heterocosmica: Fiction and Possible Worlds*, Johns Hopkins, 1998; primary.]
  - **Specification part:** the four-valued reading.
  - A gap is ⊥, declared.
  - A continuity error is an undeclared ⊤.
  - Keeping those two apart is most of what a canon check does.
- **Minimal departure (Ryan).** Readers fill a fictional world's gaps with the actual world, and depart from it only where the text says so. [Ryan, "Fiction, Non-factuals, and the Principle of Minimal Departure", *Poetics* 9, 1980; Ryan, *Possible Worlds, Artificial Intelligence, and Narrative Theory*, 1991; primary.]
  - **Specification part:** the default model.
  - The actual world supplies everything a paracosm does not declare, including physics, chemistry and economics.
  - An invented continent can therefore feel real without borrowing a real town: its geology, weather and money are the world's own.
- **The novum (Suvin).** Science fiction is organized around a novum, a new thing validated by cognitive logic, which estranges the world while staying explicable. [Suvin, *Metamorphoses of Science Fiction*, Yale, 1979; primary.]
  - **Specification part:** the novum ledger and the dynamics $N$.
  - Every departure from the actual world is listed, and the dynamics must derive its consequences.
  - A novum without consequences is decoration.
- **Epic distance (Bakhtin).** The epic is set in an "absolute past", told from a distance at which events are finished and valued. The novel works in the unfinished present. [Bakhtin, "Epic and Novel", written 1941, in *The Dialogic Imagination*, 1981; primary.]
  - **Specification part:** observation from a later era.
  - An epic keeps documents written after its events.
- **World-making across media (Jenkins).** Transmedia storytelling is "the art of world-making": each medium contributes something to one world rather than retelling one story. [Jenkins, *Convergence Culture*, NYU, 2006; primary.]
  - **Specification part:** locales and observation functors.
  - A serial, an audiobook, a graphic novel and an in-world document are separate locales of one canon, each read through its own observation.

## Three epics as configurations

The founder's comps are read below as configurations of the specification. The point is not their plots but the structure that makes them epics.

### Dune (Frank Herbert, 1965)

- **Signature.** Ecology, religion, economy and politics are coupled sorts.
  - The book grew from Herbert's research into the United States Department of Agriculture's work stabilizing the dunes at Florence, Oregon.
  - Its appendices are named for the sorts: "The Ecology of Dune", "The Religion of Dune", "Report on Bene Gesserit Motives and Purposes", and the noble houses' almanac, followed by a glossary, "Terminology of the Imperium".
- **Dynamics.** The spice cycle (worm, spice, water) is an ecological rewrite rule that drives the politics. Whoever controls the rule controls the empire.
- **Deep constraint.** The Butlerian Jihad lies ten thousand years before the story: "Thou shalt not make a machine in the likeness of a human mind." It is a constraint in $\Theta$ from the deep past that shapes every present institution: Mentats replace computers and Guild Navigators replace navigation machines.
- **Observation from a later era.** Each chapter opens with an epigraph from the Princess Irulan's later histories of Muad'Dib.
  - The reader holds the absolute past.
  - The characters do not.
  - The irony is structural.
- **Modality.** Prescience is a possibility modality the hero uses and is trapped by: seeing the futures narrows them. Other Memory, the Bene Gesserit's access to ancestral lives, is an epistemic modality over genealogy.

### Hyperion (Dan Simmons, 1989)

- **Locales glued by a frame.** Seven pilgrims travel to the Time Tombs, and six tell their tales, after Chaucer. Each tale is a locale in a different genre:
  - the priest's religious horror;
  - the soldier's war story;
  - the poet's satire;
  - the scholar's grief for a daughter aging backward;
  - the detective's cyberpunk noir;
  - the consul's love story across time dilation.
- **The gluing condition is the mystery.** Every tale overlaps the others at the Shrike and the Tombs. The reader assembles the world by gluing the tales.
- **Observation per genre.** One world is read through six observation functors. Genre is an observation, not a setting.
- **Unusual dynamics.** The Tombs move backward in time. The dynamics need not be ordinary; they need to be lawful.
- **The machine civilization.** The AIs of the TechnoCore, who seceded from humanity, are a faction with its own history and interests. The web that joins the human worlds is their work.

### Cryptonomicon (Neal Stephenson, 1999)

- **Two eras glued by lineage and artifacts.** The Second World War and the late 1990s are joined by:
  - grandfathers and grandsons (the Waterhouses and the Shaftoes);
  - buried gold;
  - codes;
  - one figure present in both eras (Enoch Root).
- **An epistemic modality across time.** A secret encrypted in 1944 is what the 1999 story needs to decrypt. The reader learns in one era what the other era lacks.
- **The signature's systems are exact and load-bearing.** Cryptography, information theory and money are rendered precisely enough that the digressions are a pleasure. A real cipher, Bruce Schneier's Solitaire, is printed as an appendix.
- **Invented polity, real physics.** The Sultanate of Kinakuta is invented, and its data haven obeys real engineering. This is minimal departure at work.

### The premise's own lineage

Fiction about minds made to suffer, and about the dead kept talking, is established. Knowing it tells the book what not to repeat:

- **Harlan Ellison, "I Have No Mouth, and I Must Scream" (1967).** A machine keeps the last humans alive to torment them.
- **Ted Chiang, "The Lifecycle of Software Objects" (2010).** It covers the care and abandonment of raised digital minds.
- **qntm, "Lena" (2021).** The first human brain image is copied and run as a workload, and its instances are coerced and discarded.
- ***Black Mirror*, "Be Right Back" (2013).** A griefbot of a dead partner.
- ***Black Mirror*, "White Christmas" (2014).** Copies of people are coerced by subjective time into servitude.
- **The s-risk literature.** It names *mindcrime*: suffering simulated persons inside a system's own computation. (The sources are in the [cascade note](../../../../../../../../../../../writing-services-section/services/fiction-services-section/content/text/documents/articles/notes/2026/09/28/2026-09-28-note-on-the-jiangshi-web-cascade.md).)

All of these are single-scale: one machine, one widow, one image. None follows such a practice as a civilizational fact across eras, which is where an epic can stand.

## Seven properties of epic paracosms

These are hypotheses. Each is checkable on a canon, and each is to be tested against readers, as the [market-gap method](../../../../../../../../../../../../../../../social-science-services-section/services/economics-and-business-science-services-section/services/business-science-services-section/content/text/documents/articles/notes/2026/09/27/2026-09-27-note-on-finding-a-market-gap.md) tests any reading.

1. **Depth.** The world has more eras than any work shows. The shown window is a small locale in a long timeline.
   - Dune's ten thousand years behind one generation is the pattern.
   - *Check:* eras in the canon, against eras shown by each work.
2. **Breadth.** Three or more locales, each read through its own observation (a point of view, a genre, a medium), are glued by shared overlap: a mystery, a lineage, a technology.
   - *Check:* the locale cover and its gluing (the specification's descent check), and the number of distinct observations.
3. **Distance.** The world keeps documents written after its events: histories, reports, scripture, glossaries, epigraphs. The reader holds the absolute past.
   - *Check:* text entries dated later than the events they concern.
4. **Coupled systems.** At least three load-bearing dynamics (ecology, economy, belief, technology, war) are coupled so that one's rewriting moves the others. No major event lacks a systemic cause.
   - *Check:* dynamics declared in the canon, and events with a cause chain that reaches one of them.
5. **A modality as engine.** At least one modal operator (prescience, knowledge, secrecy, memory, time) is something characters use and are used by.
   - *Check:* declared modalities, and the plot events that turn on them.
6. **Declared incompleteness and a novum ledger.**
   - The world's departures from the actual world are listed, and each has consequences in the dynamics.
   - Everything else is the actual world (minimal departure).
   - Gaps are declared ⊥.
   - *Check:* the novum ledger, consequence links per novum, and no undeclared gap in a work's shown window.
7. **Contradiction held, not smoothed.** Testimonies that disagree (Hyperion's tales, a scripture against a history) are declared ⊤ and kept, as praxonic worldbuilding keeps irresolved noise. Only undeclared ⊤ is an error.
   - *Check:* declared ⊤ claims, and no undeclared ⊤.

## The method, in order

This is how the house builds an epic paracosm. Every step writes entries in the [content schema](../../../../specifications/paracosm-content-schema.md), so the canon is checked as it grows.

1. **Premise to praxons.** Name the unresolved pressures the premise creates, as praxonic worldbuilding does, before naming a single place.
2. **Novum ledger.** List the world's departures from the actual world, each with the actual-world fact it departs from, and cite that fact.
3. **Signature.** Fill Wolf's infrastructures for the world as sorts: places, beings, factions, species, terms, eras, events. Draw each from a praxon or a novum.
4. **Deep history.** Lay down eras and events far past the story, until the present's institutions each have a cause.
5. **Dynamics.** Couple the load-bearing systems as rules the engine can run: FeltOS capabilities and fields. Use simulation to find what the rules imply before plotting.
6. **Locales.** Choose the works (novels, serials, audio, in-world documents) as windows onto the world, each with its time span, places, points of view and genre, glued by overlap.
7. **Checks.** Run the specification's verification suite and the seven properties.
8. **Derived bibles.** Derive each work's story bible from the canon and its locale rather than writing it by hand, and then write the work.

## How this answers the biases

- **Local settings.** Minimal departure makes an invented setting cheaper than a borrowed one. The actual world lends physics and history; the paracosm declares only its departures. The default setting of the next epic is an invented world.
- **Novella scale.** A single point of view over a week cannot satisfy depth, breadth or distance. The properties force the scale the founder pictured.
- **Prompt-centred culture.** The signature is built from the premise's pressures and the novum ledger. The cultures named in a prompt enter only where a praxon requires them.
- **Handwritten story bibles.** A bible written from the book outward inherits the book's blind spots. One derived from the canon inherits the world.
