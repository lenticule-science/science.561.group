---

title: "Cognition Without Neurons: Scientific Reference"
date-created: 2026-03-28T00:00:00
describes: cognition without neurons
description: "Scientific reference on non-neural cognition: Physarum experiments, fungal network optimization, basal cognition, electrical signaling in fungi, and mechanistic explanations."
---

Companion to [fungal-intelligence.md](../domains/mycology/terms/fungal-intelligence.md), which treats the concept relationally. This file compiles specific experimental results, researcher names, and citations.

---

## 1. Physarum polycephalum Experiments

*Physarum polycephalum* is an acellular slime mold (Mycetozoa, Amoebozoa) -- not a fungus, but a protist that forms a multinucleate plasmodium (a single cell with many nuclei, which can spread across several square meters). It moves by rhythmic cytoplasmic streaming driven by actomyosin contraction. Despite being a single cell without any neurons, *Physarum* has become the model organism for studying non-neural decision-making.

### Nakagaki's Maze-Solving (2000)

**Nakagaki T, Yamada H, Toth A (2000).** "Intelligence: Maze-solving by an amoeboid organism." *Nature* 407: 470.

- *Physarum* was allowed to spread throughout a maze (a small agar labyrinth, roughly 30 cm^2).
- Food (oat flakes) was placed at two points: the entrance and the exit.
- Within hours, the plasmodium retracted from dead-end passages and pruned its network down to a single thick tube connecting the two food sources via the shortest path through the maze.
- The organism explored the full maze space, then optimized its network by retracting cytoplasm from unproductive branches and reinforcing the shortest connection.
- This was a one-page letter to *Nature* that attracted enormous attention because it demonstrated spatial "problem-solving" in a brainless organism.

**Mechanism:** The optimization works through a feedback loop. Cytoplasmic streaming is faster in thicker tubes (Poiseuille's law: flow rate scales with the fourth power of the tube radius). Tubes carrying more flow become thicker (positive feedback from shear stress on the tube walls). Tubes carrying less flow thin and eventually disappear. The shortest path between food sources naturally carries the most flow (lowest resistance), so it self-reinforces while longer paths are pruned.

### Tokyo Rail Network Optimization (2010)

**Tero A, Takagi S, Saigusa T, Ito K, Bebber DP, Fricker MD, Yumiki K, Kobayashi R, Nakagaki T (2010).** "Rules for Biologically Inspired Adaptive Network Design." *Science* 327: 439-442.

- Food sources (oat flakes) were placed on an agar plate at positions corresponding to 36 major cities in the Greater Tokyo region. A *Physarum* plasmodium was placed at the position of Tokyo.
- The organism formed a network connecting all food sources. The resulting network was compared to the actual Tokyo rail network.
- The *Physarum* network matched the real rail network in efficiency (total length), fault tolerance (redundant connections), and transport performance.
- The study ran multiple replicates. While the exact network differed each time (the process is stochastic), the statistical properties of the resulting networks consistently matched or exceeded the engineered rail system on the measured criteria.
- The authors derived a mathematical model based on the Physarum's behavior (an adaptive network model with positive feedback on flow and a cost term for total tube length) that could be applied to general network design problems.

This paper was widely covered in popular media and became one of the most famous examples of biological computation. It demonstrated that a mindless organism, using only local feedback rules, could solve a multi-objective optimization problem (balancing cost, efficiency, and resilience) that human engineers solve with decades of planning.

### Dussutour's Habituation Experiments (2016)

**Boisseau RP, Vogel D, Dussutour A (2016).** "Habituation in non-neural organisms: evidence from slime moulds." *Proceedings of the Royal Society B* 283: 20160446.

- Habituation is the simplest form of learning: a decrease in response to a repeated, non-harmful stimulus. It was traditionally considered to require a nervous system.
- *Physarum* normally avoids crossing a bridge laced with a bitter but harmless substance (quinine or caffeine). The organism slows its advance and detours around the substance.
- After repeated exposure (over 6 days of trials), the organisms stopped avoiding the substance and crossed the bridge at normal speed. They had habituated.
- The habituation was **specific**: organisms habituated to quinine still avoided caffeine, and vice versa. This rules out general fatigue or sensory adaptation.
- Habituation **persisted**: after 2 days without exposure, habituated organisms still crossed the bitter bridge without hesitation.
- Habituation could be **transferred**: when a habituated *Physarum* cell was fused with a naive one, the resulting fused cell showed the habituated behavior. The "memory" was transmitted through the cytoplasm during cell fusion.
- Dussutour's group proposed that the memory might be stored in the cytoplasm's chemical composition -- the habituated organism may accumulate or break down the aversive compound, and this altered cytoplasmic state is transferred during fusion.

**Follow-up work:**
- Vogel D, Dussutour A (2016). "Direct transfer of learned behaviour via cell fusion in non-neural organisms." *Proceedings of the Royal Society B* 283: 20162382. Confirmed and elaborated the cell-fusion memory transfer result.
- Dussutour's lab has continued investigating *Physarum* decision-making, including studies of nutritional trade-offs and irrational choice behavior (violation of the independence of irrelevant alternatives, or IIA, in diet choice tasks -- Reid et al. 2016, *PNAS*). However, note that Reid and Dussutour's work on IIA violations used a different slime mold species (*Dictyostelium*) in some cases.

### Other Notable Physarum Results

- **Anticipation/prediction:** Saigusa T, Tero A, Nakagaki T, Kuramoto Y (2008). "Amoebae Anticipate Periodic Events." *Physical Review Letters* 100: 018101. *Physarum* was exposed to cold shocks at regular intervals (e.g., every 60 minutes). After three exposures, the organism began slowing its movement *in anticipation* of the next cold shock, even when it did not come. This suggests a form of temporal memory and prediction.
- **Externalized spatial memory:** Reid CR, Latty T, Dussutour A, Beekman M (2012). "Slime mold uses an externalized spatial memory to navigate in complex environments." *PNAS* 109: 17490-17494. *Physarum* deposits a chemical trail (extracellular slime) wherever it has been. It then avoids crossing its own slime, effectively using the slime as an externalized memory of previously explored territory -- preventing it from revisiting dead ends.

---

## 2. True Fungi: Network Optimization in Basidiomycota

### Phanerochaete velutina and Foraging Networks

The most systematic studies of network optimization in true fungi (as opposed to slime molds) come from the labs of **Lynne Boddy** (Cardiff University) and **Mark Fricker** (Oxford University), often collaborating.

**Organism:** *Phanerochaete velutina* is a white-rot basidiomycete (wood-decay fungus). Its mycelial networks are large enough to study at the macroscale (tens of centimeters to meters) in soil microcosm experiments.

**Key findings:**

- **Resource discovery and network remodeling:** When a mycelial network growing from a colonized wood block encounters a new wood resource, it reinforces the connection to that resource (the connecting cords thicken) and prunes connections that do not lead to resources. This remodeling produces an efficient transport network.
  - Bebber DP, Hynes J, Darrah PR, Boddy L, Fricker MD (2007). "Biological solutions to transport network design." *Proceedings of the Royal Society B* 274: 2307-2315.
  - The resulting networks show properties of optimized transport systems: short path lengths, low total cost (total cord length), and reasonable fault tolerance.

- **Exploration vs. exploitation trade-off:** When a fungal network is growing outward from a food source, it produces a fan-shaped margin of fine, exploratory hyphae. When a new resource is found, the network shifts from exploration to exploitation -- thickening the connections to the new resource and withdrawing from other directions.
  - Boddy L (1999). "Saprotrophic cord-forming fungi: meeting the challenge of heterogeneous environments." *Mycologia* 91: 13-32.

- **Network analysis:** Fricker's group has applied graph theory and network science to characterize mycelial networks.
  - Fricker MD, Boddy L, Bebber DP (2007). "Network organisation of mycelial fungi." In *Biology of the Fungal Cell* (Howard RJ, Gow NAR, eds.), Springer.
  - Mycelial networks are not random graphs; they show heavy-tailed degree distributions (some nodes are highly connected hubs), short average path lengths, and high clustering coefficients -- properties shared with "small-world" networks and some engineered transport networks.

- **Nutrient transport:** Using radiotracers and fluorescent dyes, Fricker's group has mapped the flow of nutrients through mycelial networks. Transport is bidirectional and occurs through both passive diffusion and active cytoplasmic streaming. The network can re-route transport when connections are severed.
  - Fricker MD, Lee JA, Bebber DP, Tlalka M, Hynes J, Darrah PR, Watkinson SC, Boddy L (2008). "Imaging complex nutrient dynamics in mycelial networks." *Journal of Microscopy* 231: 317-331.

### How Fungi "Decide" Where to Grow

Fungal growth direction is controlled by tropisms -- directional growth responses to environmental stimuli. These are mediated at the hyphal tip, which is the only actively growing region of a hypha.

**Chemotropism:**
- Hyphae grow toward chemical attractants (nutrients, signals from potential symbiotic partners) and away from repellents.
- The MAPK signaling cascade mediates chemotropic responses. In *Neurospora crassa*, chemoattraction toward a compatible mating partner involves MAK-2 (MAPK) signaling, with oscillating recruitment of signaling proteins to the hyphal tip (Fleissner et al. 2009, *Current Biology*).
- In mycorrhizal fungi, root exudates (strigolactones, flavonoids) act as chemoattractants, guiding hyphal growth toward plant roots. Strigolactone perception by arbuscular mycorrhizal fungi was demonstrated by Akiyama, Matsuzaki, and Hayashi (2005, *Nature*).

**Thigmotropism (contact-guided growth):**
- Hyphae can sense and respond to surface topography. This is critical for plant pathogens whose hyphae must locate stomata to penetrate leaves.
- *Uromyces appendiculatus* (bean rust fungus) hyphae grow perpendicular to ridges on the leaf surface, which guides them toward stomata. This was demonstrated using artificial surfaces with micro-ridges (Hoch, Staples, Whitehead, Comeau, Wolf 1987, *Science*).
- The mechanosensory mechanism involves stretch-activated calcium channels at the hyphal tip.

**Gravitropism:**
- Fruiting bodies of many fungi (e.g., *Agaricus bisporus*, *Coprinus cinereus*) are positively gravitropic in their stipes (stems grow upward) and negatively gravitropic in their caps (gills orient downward for spore dispersal).
- The mechanism involves differential growth on upper vs. lower sides of horizontal stems, mediated by auxin-like growth regulators and possibly statoliths (though fungal statoliths are less well characterized than plant statoliths).

**Galvanotropism / electrotropism:**
- Fungal hyphae grow toward the cathode in an applied electric field. This was shown in *Neurospora crassa* and other species. The mechanism likely involves redistribution of charged proteins and ion channels at the hyphal tip.

**Integration of signals:**
- At any given moment, a growing hyphal tip integrates multiple signals: nutrient gradients, neighboring hyphae (auto-inhibition to avoid self-overlap), physical contact cues, light (phototropism in some species), gravity, and electrical fields. The "decision" about where to grow is the emergent result of these integrated signals at the level of the tip's growth machinery (the Spitzenkorper, a cluster of vesicles that directs wall deposition).

---

## 3. Basal Cognition / Minimal Cognition

### The Field

"Basal cognition" refers to a research program investigating cognitive-like processes (sensing, decision-making, memory, learning, anticipation) in organisms without nervous systems: bacteria, protists, fungi, plants, and even individual cells within multicellular organisms.

The term gained currency through a series of workshops and publications beginning around 2019-2020, associated with researchers including **Pamela Lyon** (University of Adelaide), **Michael Levin** (Tufts University), **Fred Keijzer** (University of Groningen), and others.

Key publications framing the field:
- Lyon P (2015). "The cognitive cell: bacterial behavior reconsidered." *Frontiers in Microbiology* 6: 264. Argued that bacterial chemotaxis, quorum sensing, and other behaviors meet functional definitions of cognition.
- Lyon P, Keijzer F, Arendt D, Levin M (2021). "Reframing cognition: getting down to biological basics." *Philosophical Transactions of the Royal Society B* 376: 20190750. This was the introduction to a theme issue on basal cognition.
- Levin M (2019). "The Computational Boundary of a 'Self': Developmental Bioelectricity Drives Multicellularity and Scale-Free Cognition." *Frontiers in Psychology* 10: 2688.

### Michael Levin's Work on Bioelectricity

**Michael Levin** (Allen Discovery Center, Tufts University) studies how bioelectrical patterns -- voltage gradients across cell membranes and tissues, mediated by ion channels and gap junctions -- store and process information in developmental and regenerative contexts.

**Key experimental results:**

- **Planarian head/tail determination:** Planaria (flatworms) can regenerate any body part. Levin's lab showed that the bioelectric state of cells determines what structure regenerates. By pharmacologically manipulating membrane voltage (using reagents that open or close specific ion channels), they caused planaria to regenerate heads where tails should grow, and vice versa. The "decision" about what to build is stored in the bioelectrical pattern, not directly in the genome.
  - Beane WS, Morokuma J, Adams DS, Levin M (2011). "A Chemical Genetics Approach Reveals H,K-ATPase-Mediated Membrane Voltage Is Required for Planarian Head Regeneration." *Chemistry & Biology* 18: 77-89.

- **Xenopus craniofacial patterning:** In frog embryos, Levin's group showed that specific bioelectrical states (membrane voltage patterns) are required for normal face development. Disrupting the voltage pattern produced craniofacial defects; imposing specific voltage patterns could induce ectopic eyes and other structures.
  - Pai VP, Aw S, Shomrat T, Lemire JM, Levin M (2012). "Transmembrane voltage potential controls embryonic eye patterning in Xenopus laevis." *Development* 139: 313-323.

- **Collective cell intelligence:** Levin argues that individual cells (and groups of cells) engage in computational processes -- they have goals (target morphologies), memory (stored as bioelectrical states and gene regulatory network states), and decision-making (choosing between different developmental fates). He frames this in terms of "multiscale competency architecture": intelligence at the cellular level is composed into intelligence at the tissue level, which is composed into intelligence at the organism level.

- **Xenobots:** Levin's lab, in collaboration with Josh Bongard (University of Vermont), created "Xenobots" -- novel living organisms assembled from *Xenopus laevis* embryonic skin and heart cells. These millimeter-scale constructs could move, self-heal, and exhibit collective behaviors not seen in normal frog development.
  - Kriegman S, Blackiston D, Levin M, Bongard J (2020). "A scalable pipeline for designing reconfigurable organisms." *PNAS* 117: 1853-1859.
  - Kriegman S, Blackiston D, Levin M, Bongard J (2021). "Kinematic self-replication in reconfigurable organisms." *PNAS* 118: e2112672118. Xenobots were shown to exhibit a form of self-replication: they gathered loose cells into piles that matured into new Xenobots.

### What the Field Actually Claims vs. Overhype

**Legitimate claims supported by evidence:**
- Organisms without nervous systems (bacteria, protists, plants, fungi, individual cells) perform information processing that can be functionally described as sensing, integration, decision-making, and adaptive behavior.
- These capacities are grounded in physical mechanisms (chemical signaling, bioelectricity, gene regulatory networks, cytoskeletal dynamics) that are conserved across the tree of life, predating the evolution of neurons.
- Neurons did not invent information processing; they specialized and accelerated pre-existing cellular capacities. Ion channels, electrical signaling, and chemical neurotransmitters all predate neurons -- they are found in single-celled organisms.
- Studying these basal capacities can inform our understanding of the evolution of nervous systems and of cognition more broadly.

**Where overhype occurs:**
- **Anthropomorphic language:** Describing slime molds as "intelligent" or bacteria as "making decisions" can mislead if it implies these organisms have subjective experience, intentions, or understanding. Most basal cognition researchers are careful to distinguish functional cognition (information processing that produces adaptive behavior) from phenomenal consciousness (subjective experience), but popular media often collapses this distinction.
- **"Plants are conscious" claims:** Some popular writers (e.g., Stefano Mancuso's *Brilliant Green*) have been criticized by plant biologists for implying that plants have something like consciousness. A letter in *Trends in Plant Science* (Taiz et al. 2019, "Plants Neither Possess nor Require Consciousness") signed by 36 plant biologists pushed back against these claims, arguing that while plants perform sophisticated information processing, there is no evidence they are conscious, and the claim is not currently testable.
- **Conflating computation with cognition:** The fact that a system performs computation (information processing) does not necessarily mean it is cognitive in any interesting sense. A thermostat performs feedback regulation. The challenge is to define what distinguishes genuinely cognitive computation from mere physical responsiveness, and this definitional question remains unresolved.
- **Levin's framing:** Levin's claims about cells having "goals" and "beliefs" (in a deflationary, functional sense) are controversial even among sympathetic colleagues. Some argue this language is useful for generating hypotheses about biological self-organization; others worry it imports intentional psychology into contexts where simpler mechanical explanations suffice.

---

## 4. Electrical Signaling in Fungi

### Adamatzky's Work on Fungal Electrical Spiking

**Andrew Adamatzky** (University of the West of England, Bristol) has published a series of papers documenting electrical spiking activity in fungi, primarily using differential electrodes inserted into mycelial networks and fruiting bodies.

**Key paper:**
- Adamatzky A (2022). "Language of fungi derived from their electrical spiking activity." *Royal Society Open Science* 9: 211926.
  - Measured extracellular electrical potentials in four fungal species: *Ganoderma resinaceum*, *Pleurotus djamor*, *Flammulina velutipes*, and *Schizophyllum commune*.
  - Recorded trains of electrical spikes, with individual spikes lasting approximately 1-21 hours (much slower than neural action potentials, which last milliseconds).
  - Identified clusters of spikes that could be grouped into "words" (spike trains separated by gaps). Adamatzky reported that the distribution of these "word" lengths followed patterns comparable to human language -- specifically, the average "word length" was approximately 5.97 spike-events, compared to an average word length of ~4.8 letters in English.
  - He proposed that fungal electrical activity could constitute a form of communication.

**Other Adamatzky publications on fungal electronics:**
- Adamatzky A (2018). "On spiking behaviour of oyster fungi *Pleurotus djamor*." *Scientific Reports* 8: 7873.
- Adamatzky A, Gandia A (2022). "Fungi anaesthesia." *Scientific Reports* 12: 340. Showed that chloroform reduced the amplitude and frequency of electrical spikes in fungi, analogous to the effect of anesthetics on neural tissue.

### Are These Actually Analogous to Neural Activity?

**Points of comparison with neural signaling:**
- Both involve changes in electrical potential across biological membranes.
- Both show spiking patterns (rapid changes followed by recovery).
- Both can be modulated by external stimuli.

**Critical differences and skeptical assessments:**
- **Timescale:** Neural action potentials last 1-5 milliseconds and propagate at speeds of 1-120 m/s. Adamatzky's fungal spikes last minutes to hours. The timescale difference is roughly 10^4 to 10^6 fold. This does not necessarily mean they are non-functional, but it does mean they cannot serve the same computational purposes as neural signals (rapid sequential information processing).
- **Mechanism:** Neural action potentials involve voltage-gated sodium and potassium channels in a well-characterized regenerative cycle (Hodgkin-Huxley model). The mechanism of fungal electrical spikes is not well characterized. Possibilities include:
  - Changes in turgor pressure causing membrane deformation and ion flux.
  - Calcium signaling waves propagating through the mycelium.
  - Metabolic activity producing local changes in extracellular ion concentrations.
  - Action potential-like events in fungal membranes (fungi do have ion channels, including calcium, potassium, and chloride channels).
- **"Language" claims:** Adamatzky's claim that fungal spike patterns resemble language has been widely criticized. The statistical comparison (word length distribution) is superficial -- many random and physical processes produce similar statistical distributions. Zipf's law-like patterns appear in phenomena from earthquake magnitudes to city sizes. Finding a particular distribution of cluster sizes does not constitute evidence of language or communication in any meaningful sense.
- **Signal vs. noise:** Some skeptics question whether the recorded signals represent genuine biological signaling rather than artifacts of electrode insertion, injury responses, or environmental fluctuations. Adamatzky has responded by showing that the signals are reproducible and respond to stimuli, but the functional significance remains unestablished.
- **What is being communicated?** Even if the electrical signals are genuine and biologically functional, it remains unclear what information they carry. In neural systems, the informational content of action potentials is understood in terms of rate coding, temporal coding, and population coding. No comparable decoding of fungal electrical signals has been achieved.

**More established work on fungal electrical signaling:**
- Olsson S, Hansson BS (1995). "Action potential-like activity found in fungal mycelia is sensitive to stimulation." *Mycological Research* 99: 1057-1065. Documented action potential-like events in *Pleurotus ostreatus* and *Armillaria bulbosa* mycelium, measured with intracellular electrodes. These were faster events (seconds-scale) than Adamatzky's measurements and were triggered by mechanical stimulation. This earlier work is more methodologically rigorous but received less attention.

---

## 5. Mechanistic Explanations: How Local Processes Produce Global Network Optimization

The "intelligent" behaviors observed in fungi and slime molds are produced by well-characterized physical and chemical mechanisms operating locally, without central coordination. The key insight is that local feedback mechanisms, iterated across a large network, can produce globally optimal or near-optimal outcomes.

### Cytoplasmic Streaming

- The primary transport mechanism in *Physarum* and in fungal hyphae.
- In *Physarum*: the plasmodium contracts rhythmically (period ~1-2 minutes), driven by actomyosin -- the same contractile proteins used in animal muscles. Contraction squeezes cytoplasm through the tube network (shuttle streaming). The flow alternates direction in an oscillatory pattern.
- The contraction frequency and amplitude are modulated by local conditions: regions near food contract more vigorously, driving flow toward food sources.
- In fungi: cytoplasmic streaming in hyphae is driven by both motor proteins (kinesins, dyneins moving along microtubules) and by turgor-pressure gradients. Streaming carries vesicles, organelles, nuclei, and dissolved nutrients.
- **Feedback loop:** Tubes carrying more flow experience more shear stress, which stimulates tube wall reinforcement (actin polymerization, wall deposition). Tubes carrying less flow are not maintained and eventually collapse. This positive feedback loop (more flow -> thicker tube -> even more flow) is the core mechanism of network optimization.

### Turgor Pressure Regulation

- Fungal hyphae grow by turgor-driven tip extension. The internal hydrostatic pressure (turgor) of a hypha is typically 0.1-1.0 MPa, generated by osmotic uptake of water.
- Turgor drives the extension of the hyphal tip, where the cell wall is most plastic (thin, newly synthesized wall material at the apex).
- Differential turgor regulation across a network allows the fungus to redirect growth. Hyphae experiencing favorable conditions (nutrients, water) maintain high turgor and grow rapidly. Hyphae in unfavorable conditions may lose turgor and cease growth.
- The cell wall is a critical mediator: enzymes at the tip soften the wall to allow turgor-driven expansion, while enzymes behind the tip cross-link and rigidify the wall. The balance between these processes determines growth rate and direction.

### Calcium Signaling

- Calcium (Ca^2+) is a universal intracellular signaling molecule in eukaryotes, including fungi.
- Cytoplasmic calcium concentration is normally very low (~100 nM). Transient increases (calcium spikes or waves) act as signals.
- In fungi, calcium signaling is involved in:
  - **Hyphal tip growth:** A tip-high calcium gradient is maintained in growing hyphae. Disrupting this gradient (e.g., with calcium chelators or channel blockers) stops growth. The calcium gradient is maintained by stretch-activated calcium channels at the tip and calcium pumps further back.
  - **Branching:** Local calcium spikes trigger new branch formation.
  - **Response to mechanical contact:** When a hypha contacts a surface or another hypha, mechanosensitive calcium channels open, triggering a calcium transient that can alter growth direction (thigmotropism) or initiate penetration (in pathogenic fungi).
  - **Anastomosis:** Hyphal fusion involves a calcium-dependent signaling cascade (Fleissner et al. 2009).
- Calcium waves can propagate along hyphae and through the mycelial network, potentially coordinating responses across distances.

### Reactive Oxygen Species (ROS)

- ROS (superoxide, hydrogen peroxide, hydroxyl radical) are produced by NADPH oxidases (NOX enzymes) at hyphal tips.
- In fungi, ROS are required for normal hyphal tip growth. NOX-deficient mutants of *Neurospora crassa* and *Aspergillus nidulans* show severely impaired growth and abnormal branching.
- ROS regulate cell wall loosening at the hyphal tip (H2O2 can modify cell wall proteins and polysaccharides), calcium channel activity, and signaling cascades that control growth direction.
- Cano-Dominguez N, Alvarez-Delfin K, Hansberg W, Aguirre J (2008). "NADPH Oxidases NOX-1 and NOX-2 Require the Regulatory Subunit NOR-1 To Control Cell Differentiation and Growth in *Neurospora crassa*." *Eukaryotic Cell* 7: 1352-1363.

### How Local Mechanisms Produce Global Optimization

The pattern that emerges across all these mechanisms is the same: **local positive feedback + global resource limitation = network optimization.**

1. **Exploration phase:** Hyphae extend outward in all directions from a resource base, branching frequently. This is metabolically expensive but maximizes the probability of finding new resources.
2. **Discovery:** When a hyphal tip encounters a nutrient source, local signaling (calcium spikes, metabolite sensing) triggers increased growth and transport toward the resource.
3. **Reinforcement:** Connections that carry resources (cytoplasmic flow carrying nutrients back to the network) are reinforced by positive feedback (more flow -> thicker cord -> more flow). This is analogous to Hebbian learning in neural networks ("neurons that fire together wire together"), but mediated by fluid dynamics rather than synaptic plasticity.
4. **Pruning:** Connections that do not carry significant resources receive less cytoplasm and are not maintained. They thin and are eventually recycled (the fungus reabsorbs the materials in the walls and cytoplasm of abandoned hyphae).
5. **Result:** The network converges on an efficient transport topology connecting resource patches, balancing total network cost against transport efficiency and resilience.

This process requires no central processor, no representation of the network, and no "planning." It is an emergent property of iterated local feedback -- the same class of mechanism that produces river network optimization, vascular network development in animals (angiogenesis), and ant trail systems. The mathematical framework that describes it (adaptive network models, Murray's law for branching, reinforcement learning analogs) applies across these diverse systems.

**Key modeling work:**
- Tero A, Kobayashi R, Nakagaki T (2007). "A mathematical model for adaptive transport network in path finding by true slime mold." *Journal of Theoretical Biology* 244: 553-564. Formalized the *Physarum* optimization process as a differential equation system where tube conductance increases with flow and decreases with time (decay).
- This model has been applied to engineering problems in network design, and a "Physarum solver" algorithm has been implemented for shortest path and minimum spanning tree problems.

---

## Summary of Key Researchers and Labs

| Researcher | Affiliation | Contribution |
|---|---|---|
| Toshiyuki Nakagaki | Hokkaido University, Japan | *Physarum* maze-solving, Tokyo rail network |
| Audrey Dussutour | CNRS / University of Toulouse, France | *Physarum* habituation, learning, cell fusion memory transfer |
| Lynne Boddy | Cardiff University, UK | Fungal foraging ecology, cord-forming fungi, network remodeling |
| Mark Fricker | University of Oxford, UK | Mycelial network analysis, nutrient transport imaging |
| Andrew Adamatzky | University of the West of England, Bristol | Fungal electrical spiking, unconventional computing |
| Michael Levin | Tufts University, USA | Bioelectricity, basal cognition, developmental decision-making, Xenobots |
| Pamela Lyon | University of Adelaide, Australia | Theoretical framework for basal cognition |
| Fred Keijzer | University of Groningen, Netherlands | Philosophy of cognition in minimal systems |
| Stefan Olsson | University of Copenhagen / NTU Singapore | Early work on fungal action potentials |

---

## Key Cited Works

- Nakagaki T, Yamada H, Toth A (2000). "Intelligence: Maze-solving by an amoeboid organism." *Nature* 407: 470.
- Tero A et al. (2010). "Rules for Biologically Inspired Adaptive Network Design." *Science* 327: 439-442.
- Boisseau RP, Vogel D, Dussutour A (2016). "Habituation in non-neural organisms." *Proceedings of the Royal Society B* 283: 20160446.
- Bebber DP et al. (2007). "Biological solutions to transport network design." *Proceedings of the Royal Society B* 274: 2307-2315.
- Adamatzky A (2022). "Language of fungi derived from their electrical spiking activity." *Royal Society Open Science* 9: 211926.
- Lyon P, Keijzer F, Arendt D, Levin M (2021). "Reframing cognition: getting down to biological basics." *Phil Trans R Soc B* 376: 20190750.
- Levin M (2019). "The Computational Boundary of a 'Self'." *Frontiers in Psychology* 10: 2688.
- Kriegman S et al. (2020). "A scalable pipeline for designing reconfigurable organisms." *PNAS* 117: 1853-1859.
- Saigusa T et al. (2008). "Amoebae Anticipate Periodic Events." *Physical Review Letters* 100: 018101.
- Reid CR et al. (2012). "Slime mold uses an externalized spatial memory." *PNAS* 109: 17490-17494.
- Olsson S, Hansson BS (1995). "Action potential-like activity found in fungal mycelia." *Mycological Research* 99: 1057-1065.
- Taiz L et al. (2019). "Plants Neither Possess nor Require Consciousness." *Trends in Plant Science* 24: 677-687.
- Tero A, Kobayashi R, Nakagaki T (2007). "A mathematical model for adaptive transport network in path finding by true slime mold." *J Theor Biol* 244: 553-564.