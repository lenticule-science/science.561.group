---

title: Fungal Intelligence
date-created: 2026-03-06T00:00:00
locates: topic
aliases:
  - Fungal Intelligence
  - fungal intelligence
  - Mycelial Decision-Making
keywords:
  - mycology
  - distributed-cognition
  - network-biology
description: Experimental evidence for problem-solving, memory, and adaptive optimization in mycelial networks, and the physical mechanisms that produce these behaviors.
references:
  - id: nakagaki2000
    type: document
    title: Maze-solving by an amoeboid organism
    author:
      - literal: Toshiyuki Nakagaki
      - literal: Hiroyasu Yamada
      - literal: Ágota Tóth
    container-title: Nature
    issued:
      - year: 2000
  - id: tero2010
    type: document
    title: Rules for Biologically Inspired Adaptive Network Design
    author:
      - literal: Atsushi Tero
      - literal: Seiji Takagi
      - literal: Tetsu Saigusa
      - literal: Kentaro Ito
      - literal: Dan P. Bebber
      - literal: Mark D. Fricker
      - literal: Kenji Yumiki
      - literal: Ryo Kobayashi
      - literal: Toshiyuki Nakagaki
    container-title: Science
    issued:
      - year: 2010
  - id: tero2007
    type: document
    title: A mathematical model for adaptive transport network in path finding by true slime mold
    author:
      - literal: Atsushi Tero
      - literal: Ryo Kobayashi
      - literal: Toshiyuki Nakagaki
    container-title: Journal of Theoretical Biology
    issued:
      - year: 2007
  - id: dussutour2016
    type: document
    title: "Habituation in non-neural organisms: evidence from slime moulds"
    author:
      - literal: Audrey Dussutour
      - literal: Romain P. Boisseau
    container-title: Proceedings of the Royal Society B
    issued:
      - year: 2016
  - id: saigusa2008
    type: document
    title: Amoebae anticipate periodic events
    author:
      - literal: Tetsu Saigusa
      - literal: Atsushi Tero
      - literal: Toshiyuki Nakagaki
      - literal: Yoshiki Kuramoto
    container-title: Physical Review Letters
    issued:
      - year: 2008
  - id: reid2012
    type: document
    title: Slime mold uses an externalized spatial 'memory' to navigate in complex environments
    author:
      - literal: Chris R. Reid
      - literal: Tanya Latty
      - literal: Audrey Dussutour
      - literal: Madeleine Beekman
    container-title: Proceedings of the National Academy of Sciences
    issued:
      - year: 2012
  - id: adamatzky2022
    type: document
    title: Language of fungi derived from their electrical spiking activity
    author:
      - literal: Andrew Adamatzky
    container-title: Royal Society Open Science
    issued:
      - year: 2022
---

Fungi have no neurons, no brain, and no nervous system. Yet research over the past two decades has documented behaviors in [mycelial networks](../../../../../../../../../../../../../natural-science-services-section/services/biological-science-services-section/services/mycology-services-section/content/text/glossary/terms/mycelial-networks.md) that resemble cognitive processes: path optimization, resource allocation, memory, and habituation. Whether these behaviors constitute "intelligence" depends on one's definition, but the experimental results themselves are well established.

## Network optimization

The most famous demonstration involves the slime mold *Physarum polycephalum* — technically a protist, not a fungus, but one that forms mycelium-like networks and is routinely studied alongside fungi for its network behavior.

**Maze solving.** Toshiyuki Nakagaki and colleagues (2000, Nature) placed *Physarum* in a maze with food at two exits. The organism initially spread throughout the maze, then pruned back all branches except the shortest path connecting the two food sources. The remaining network traced the optimal solution.

**Transport network design.** Tero et al. (2010, Science) placed food sources at positions corresponding to cities around Tokyo. The *Physarum* network that connected them closely resembled the actual Tokyo rail system in topology and efficiency — a network that human engineers designed over decades.

True fungi display similar optimization behaviors. *Phanerochaete velutina* and other cord-forming Basidiomycota, studied extensively by Lynne Boddy and Mark Fricker at Oxford, form foraging networks that balance exploration against exploitation. When the fungus encounters a new wood block (nutrient source), hyphae connecting the source to the existing network thicken and increase transport capacity. Hyphae extending into unproductive territory thin and retract. The network continuously remodels itself, reallocating biomass from unproductive to productive connections.

Fricker's group quantified this remodeling using time-lapse imaging and network analysis software, showing that the resulting fungal networks minimize transport cost while maintaining fault-tolerant redundancy — the same trade-off that engineers optimize in designed transport systems.

## Memory and habituation

*Physarum polycephalum* can learn. Audrey Dussutour and colleagues (2016, Proceedings of the Royal Society B) showed that the organism habituates to aversive but harmless substances. When *Physarum* encounters a bridge coated with quinine or caffeine, it initially avoids crossing. Over repeated exposures, it learns to cross without hesitation. This habituation is specific — an organism habituated to quinine still avoids caffeine, and vice versa — and it persists for days if the stimulus is removed.

Most strikingly, the learned tolerance can be transferred to naive individuals through cell fusion. When a habituated *Physarum* fuses with a naive one, the resulting fused organism retains the habituation. This represents somatic memory transmission — information transfer without any genetic mechanism, stored in the physical or chemical state of the cytoplasm.

Other memory-like behaviors in *Physarum* include anticipation (Saigusa et al., 2008, Physical Review Letters: *Physarum* exposed to periodic cold shocks learns to slow its movement in anticipation of the next shock, even after the shocks stop) and externalized spatial memory (Reid et al., 2012, PNAS: the organism avoids areas it has previously explored by detecting its own extracellular slime trails, using them as a chemical record of where it has already been).

Whether true fungi (as opposed to slime molds) exhibit comparable memory is less well established. Mycelial networks do display path-dependent behavior: a network that has previously colonized a substrate retains structural features (thickened cords, preferential transport routes) that influence future growth and resource allocation. The network's history is recorded in its architecture, even if this does not constitute "memory" in the cognitive sense.

## Electrical activity

Andrew Adamatzky (2022, Royal Society Open Science) reported electrical spiking patterns in several fungal species, including *Ganoderma resinaceum*, *Pleurotus ostreatus*, *Cordyceps militaris*, and *Omphalotus nidiformis*. Using microelectrodes inserted into fruiting bodies and mycelial cords, Adamatzky recorded voltage fluctuations with spike trains showing some regularity in timing and amplitude. He proposed these might function as a form of communication, drawing analogies to neural spike trains.

These findings have been received cautiously. The spike durations Adamatzky reported (1-21 hours) are orders of magnitude slower than neural spikes (milliseconds), making the neural analogy strained. His analysis of spike trains as a "language" (based on clustering spikes into "words") was criticized because the statistical patterns he identified (Zipf's-law-like distributions) arise in many non-communicative systems. The recorded signals could reflect ion flux from cytoplasmic streaming, osmotic regulation, or wound responses to electrode insertion rather than information-carrying signals. No study has yet demonstrated that fungal electrical spikes carry specific information or trigger specific responses in receiving tissues.

## Mechanisms

The behaviors described above do not require a central processor. They emerge from well-characterized physical and chemical mechanisms operating at the hyphal level:

**Cytoplasmic streaming.** Motor proteins (myosin) drive bulk flow of cytoplasm along actin filaments within hyphae. Flow rate responds to local nutrient concentration and turgor pressure. When a nutrient source is encountered, increased metabolic activity draws cytoplasm toward that region, thickening the connecting hyphae and reinforcing the transport pathway.

**Turgor-driven growth.** Hyphal tip growth depends on turgor pressure, which depends on osmotic potential, which depends on solute concentration. Hyphae in nutrient-rich regions maintain higher turgor and grow faster. Hyphae in nutrient-poor regions lose turgor and may retract. This simple positive feedback — nutrients cause growth, which brings more of the network toward nutrients — produces directional foraging without any decision-making mechanism.

**Calcium signaling.** Calcium ion waves propagate through hyphae and may coordinate responses across the network. Calcium transients have been observed in response to mechanical stimulation, osmotic stress, and hyphal contact events. Calcium signaling in fungi uses some of the same molecular components (calmodulin, calcium-dependent protein kinases) found in other eukaryotic signaling systems.

**Reactive oxygen species (ROS).** Superoxide and hydrogen peroxide are produced at hyphal tips during growth and play roles in cell wall loosening, defense against competitors, and signaling. ROS gradients may contribute to directional growth decisions.

**Chemical sensing.** Hyphae detect and grow toward nutrient gradients (chemotropism), away from toxic compounds, and toward or away from other fungi depending on species and compatibility. Growth direction is controlled by repositioning of the Spitzenkörper, a vesicle supply center at the hyphal tip, in response to asymmetric chemical stimulation.

Tero et al. (2007) formalized this in a mathematical model showing that a network governed by two simple rules — positive feedback (flow increases tube diameter) and global resource limitation (total network volume is conserved) — converges on minimum-cost transport networks equivalent to Steiner trees. The "intelligence" of the mycelial network is the emergent outcome of these local mechanisms operating in parallel across millions of hyphal tips. Each tip responds to its immediate chemical and physical environment. The global network pattern — which looks optimized, adaptive, and purposeful — arises from the aggregate of these local responses interacting through the shared cytoplasmic space of the connected network.

## Basal cognition debate

The question of whether organisms without nervous systems can be said to "think" or "decide" has generated a growing research program under the label of "basal cognition" or "minimal cognition." Michael Levin (Tufts University) and colleagues have argued that all cells — not just neurons — process information and make decisions, using bioelectrical signals, chemical gradients, and mechanical forces. Under this view, neural cognition is a specialized elaboration of information-processing capacities that exist in all living cells, and mycelial network behavior sits on a continuum with animal cognition rather than being categorically different.

Critics argue that extending cognitive vocabulary to organisms without nervous systems risks conflating adaptive behavior with cognition, emptying the concept of explanatory content. The debate is ongoing and turns partly on definition: if "cognition" means "information processing that produces adaptive behavior," fungi qualify. If it means "subjective experience" or "representation," the question is currently unanswerable.