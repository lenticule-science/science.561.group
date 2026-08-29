---

title: Why Plants Flower When They Do
description: "Explanation of the multiple pathways controlling flowering time: photoperiod detection, vernalization, gibberellin signaling, and their evolutionary logic in allowing plants to time reproduction to seasonal opportunity"
date-created: 2026-04-02
teaches: [flowering time control, photoperiod, vernalization, florigen, gibberellin, meristem transition, seasonal signals]
requires: [photoperiod, vernalization, flower, bolting]
addresses: Why some plants flower in spring and others in fall; why winter wheat needs cold to flower; why daylength controls onion bulbing; the evolution of multiple flowering pathways
---

A lettuce plant germinates in spring, grows vigorously for weeks, then suddenly stops producing leaves and begins forming a tall stem topped with flowers. This transition from vegetative to reproductive growth is called [bolting](../terms/bolting.md), and it is unwelcome to the farmer or gardener who wanted to harvest the leaves. But from the plant's perspective, the transition is adaptive: it flowers when conditions indicate that reproduction is likely to succeed. The plant does not always flower at the same developmental stage. Instead, multiple environmental pathways—daylength, temperature history, developmental age—converge to trigger flowering only when it serves the plant's evolutionary interests. Understanding these pathways reveals how plants use environmental signals to time one of the most important transitions in their life cycle.

## The Ecological Problem

Plants reproduce sexually by producing flowers and seeds, but reproduction is metabolically expensive and risky. While a plant invests in flowers and seeds, it cannot grow roots or leaves. If a flower forms during a sudden freeze, the reproductive investment is lost. If flowering occurs during a drought, seeds may fail to develop. By contrast, if a plant times flowering to coincide with reliable seasonal conditions—the return of spring warmth, the arrival of summer rains, the season when pollinators are abundant—reproductive success increases. This creates selection pressure for mechanisms that synchronize flowering with season.

Different plant species evolved in different climates. Temperate-zone plants experience strong seasonal variation in temperature and daylength. Tropical plants experience more constant conditions but seasonal rainfall. The flowering time that maximizes reproductive success depends on the local ecology, so plants evolve different solutions to detect seasonal opportunity.

## Photoperiod Detection: Measuring Daylength

Many temperate-zone plants use daylength (the [photoperiod](../terms/photoperiod.md)) as a seasonal cue. The mechanism is elegant: plants measure daylength not by summing hours of light but by measuring the duration of continuous darkness at night.

The photoreceptor is **phytochrome**, a protein that exists in two interconvertible forms. The red-light-absorbing form (Pr) converts to the far-red-light-absorbing form (Pfr) when struck by red light (daytime). At night, Pfr slowly reverts to Pr through a chemical process called dark reversion. This reversion occurs over several hours, allowing the plant to measure the length of the dark period. A plant exposed to 16 hours of darkness accumulates Pfr during the following day's light; a plant exposed to only 8 hours of darkness accumulates much more Pfr by day's end because more time has passed since dark reversion. This difference in Pfr accumulation is the plant's internal record of daylength.

**Long-day plants** (LDP) flower when the night becomes shorter than a critical threshold—typically when days exceed 12–16 hours. These plants flower in late spring and summer as daylength increases. Wheat, barley, lettuce, and onion are long-day plants. **Short-day plants** (also called long-night plants) flower when the night exceeds a critical length; they flower as daylength decreases in autumn. Chrysanthemums, cannabis, and soybeans are short-day plants.

The molecular basis involves the **CONSTANS** (CO) gene. CO protein is expressed continuously, but the protein is unstable in darkness and rapidly degraded. Under short-day conditions (long nights), CO degrades before dawn breaks, and no signal is sent. Under long-day conditions (short nights), light arrives while CO is still present and stable; CO accumulates and activates the *FLOWERING LOCUS T* (FT) gene, which encodes **florigen**, a protein that travels through the phloem from the leaves to the shoot apical meristem and triggers the meristem's transition to flower development.

This mechanism explains practical agricultural phenomena. Long-day onion varieties require 14–16 hours of light per day to initiate bulb formation; the same variety grown at southern latitudes (where daylength is shorter) will not bulb, no matter how long the growing season. Conversely, spinach, a long-day plant, bolts when daylength exceeds about 13 hours, independent of temperature in some cultivars. This is why spinach is a spring and fall crop in temperate zones; summer daylength is too long.

## Vernalization: The Memory of Winter

Many temperate plants—winter wheat, winter rye, biennials like cabbage and carrot—require a prolonged cold exposure to flower. This is [vernalization](../terms/vernalization.md), and it solves a different problem than photoperiod does.

A winter annual like winter wheat is sown in autumn. It germinates, grows leaves through the fall, and overwinters in a vegetative state. When spring arrives and temperatures warm, the plant flowers and sets seed. Without winter cold, the seed germinates and flowers immediately in the same growing season, producing seed that arrives too late in summer to germinate before winter. Vernalization ensures that flowering occurs only after winter has been experienced.

The molecular mechanism involves the **FLOWERING LOCUS C** (FLC) gene, which encodes a transcriptional repressor that actively blocks flowering genes. Winter annual plants typically carry an active *FRIGIDA* (FRI) allele that maintains high FLC expression, keeping the plant locked in a vegetative state.

Cold exposure induces the expression of **VIN3** (VERNALIZATION INSENSITIVE 3), a protein that recruits the **Polycomb-Repressive Complex 2** (PRC2). This complex catalyzes trimethylation of histone H3 at lysine 27 (H3K27me3), a repressive epigenetic modification. This mark is laid down progressively during the cold period across the FLC locus, silencing FLC transcription. As FLC levels drop, flowering genes are derepressed, and the plant becomes competent to flower when temperatures warm.

Crucially, this silencing is **epigenetically stable**: the H3K27me3 mark persists through cell divisions and tissue growth, even after temperatures warm. The plant "remembers" winter through chromatin modification, not through any change in DNA sequence. This memory is reset each generation during seed development, so seeds produced by a vernalized plant return to high FLC expression after germination and require re-vernalization.

This regeneration of FLC expression in each generation is adaptive. It prevents biennial plants from flowering prematurely during warm spells in fall, after seeds mature and while temperatures are still warm. Instead, seeds germinate in spring (if conditions permit) and experience spring cold, which is typically mild—not the deep winter cold of late December and January. This creates variation in the duration of cold exposure. Some seeds accumulate enough FLC silencing with mild spring cold; others do not. This genetic and phenotypic variation hedges bets, distributing flowering across the season and reducing the risk that an entire cohort flowers during an unsuitable weather event.

## The Gibberellin Pathway: Bolting and Stem Elongation

A third pathway involves the hormone **gibberellin** (GA). In rosette plants—plants that produce a compact cluster of leaves close to the ground, like lettuce or cabbage—gibberellin triggers the transition from a rosette form to a tall, flowering form. This transition is called **bolting** (in crop contexts) or stem elongation.

Gibberellin synthesis increases under warm temperatures and long days. GA accumulates in the shoot apical meristem, triggering cell elongation in the stem and the maturation of the inflorescence (flower clusters). This pathway is particularly important in rosette plants because it integrates temperature and photoperiod into a single hormonal signal.

The ecological logic is clear: a rosette plant grows low to the ground, capturing available light and water efficiently when other plants are competing for resources. But once the season is favorable for reproduction (long days, warm temperatures, reliable moisture), there is no advantage to remaining a rosette. The plant then invests in height, elevating flowers and fruits above the crowd of competitors so that pollinators can access them and seeds can disperse in wind. Gibberellin mediates this transition.

## The Autonomous Pathway: Age-Dependent Flowering

Some plants do not rely on environmental signals but flower autonomously based on developmental age. This pathway is less understood than photoperiod and vernalization pathways, but involves the progressive reduction of FLC repression over time, independent of cold. *Arabidopsis*, when grown under constant conditions in the laboratory, flowers after producing a specific number of leaves, suggesting that an age-dependent timer counts leaf primordia production.

The evolutionary logic is different: in stable or predictable environments (some tropical species, or species in human-managed settings like agricultural fields), timing reproductive growth to environmental conditions provides less advantage than simply flowering when developmental competence is reached. An age-dependent pathway is simpler and requires no environmental sensing machinery.

## Integration: Multiple Pathways, Redundancy, Robustness

These four pathways—photoperiod, vernalization, gibberellin, and autonomous flowering—often converge on the same target genes and are not independent. Photoperiod and vernalization both regulate FLC. Gibberellin and photoperiod both accelerate flowering under favorable conditions. Autonomous flowering provides a baseline, so plants flower even under constant laboratory conditions.

This redundancy is adaptive. No single environmental signal is perfectly correlated with reproductive success. Daylength can be disrupted by cloud cover or altitude. Temperature varies from year to year. A plant that responds to multiple independent signals is more robust than one that relies on a single cue. If daylength fails to trigger flowering, vernalization or gibberellin might succeed. A plant with three independent switches is more likely to flower at an appropriate time than one with a single switch.

Furthermore, this design allows plants to occupy different ecological niches. A long-day spring-flowering plant and a short-day fall-flowering plant can coexist in the same location, occupying different seasonal windows. Winter annuals and summer annuals can coexist, spreading reproductive risk across seasons.

## Agricultural Consequences

Understanding these pathways has profound practical consequences:

- **Onion bulbing** depends strictly on photoperiod; long-day varieties require 14–16 hours of light and will not bulb under short-day conditions, limiting where they can be grown.
- **Winter wheat** is planted in fall because vernalization is required; spring wheat is a cultivar that lacks the FRI allele and can be planted in spring without cold exposure.
- **Lettuce bolting** is a major agronomic problem; different bolting-resistant cultivars have different genetic bases—some delay gibberellin signaling, others suppress photoperiod sensitivity. Understanding the mechanism allows breeders to select for the trait.
- **Biennial crops** (cabbage, beet, broccoli) require cold overwintering; warm-climate cultivation is difficult without artificial cold treatment.
