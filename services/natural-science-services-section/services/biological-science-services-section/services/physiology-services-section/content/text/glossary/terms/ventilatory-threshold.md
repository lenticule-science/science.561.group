---
aliases:
  - VT
  - VT1
  - anaerobic threshold
  - gas-exchange threshold
description: The exercise intensity at which ventilation begins to rise disproportionately to oxygen uptake, detected non-invasively from gas exchange and used as a submaximal marker of the intensity above which metabolic demand is no longer met by steady-state oxidative supply.
identity: ventilatory-threshold
name: Ventilatory threshold
provenance:
  date-created: 2026-09-02
  sources:
    - lib/emsenn/services/561-group/services/science-services-section/services/natural-science-services-section/services/biological-science-services-section/services/medical-science-services-section/content/text/documents/articles/notes/2026/09/02/2026-09-02-note-on-the-biochemical-manifold-coordinate-system.md
references:
  wasserman1973:
    authors:
      - Karlman Wasserman
      - Brian J. Whipp
      - S. N. Koyal
      - William L. Beaver
    title: Anaerobic threshold and respiratory gas exchange during exercise
    year: 1973
    publication: Journal of Applied Physiology
    doi: 10.1152/jappl.1973.35.2.236
    note: PMID 4723033; resolved against CrossRef and PubMed 2026-09-02
  beaver1986:
    authors:
      - William L. Beaver
      - Karlman Wasserman
      - Brian J. Whipp
    title: A new method for detecting anaerobic threshold by gas exchange
    year: 1986
    publication: Journal of Applied Physiology
    doi: 10.1152/jappl.1986.60.6.2020
    note: PMID 3087938; resolved against CrossRef and PubMed 2026-09-02
  ruijgt2026:
    authors:
      - Twan M. Ruijgt
      - Anouk Slaghekke
      - Anneke Ellens
      - Kasper W. Janssen
      - Rob C. I. Wüst
    title: "Wearable Heart Rate Variability Monitoring, Autonomic Dysfunction and Post-exertional Malaise in Long COVID: An Observational Study"
    year: 2026
    publication: Sports Medicine
    doi: 10.1007/s40279-026-02487-4
    note: PMID 42501245; resolved against CrossRef and PubMed 2026-09-02
  fluge2016:
    authors:
      - Øystein Fluge
      - Olav Mella
      - Ove Bruland
      - Kristin Risa
      - Sissel E. Dyrstad
      - Kine Alme
      - Ingrid G. Rekeland
      - Karl J. Tronstad
    title: Metabolic profiling indicates impaired pyruvate dehydrogenase function in myalgic encephalopathy/chronic fatigue syndrome
    year: 2016
    publication: JCI Insight
    doi: 10.1172/jci.insight.89376
    note: PMID 28018972; resolved against CrossRef and PubMed 2026-09-02
relations:
  measures: oxidative-phosphorylation
  assessed-by: two-day-cardiopulmonary-exercise-testing
  distinguished-from: lactate
---
The ventilatory threshold is the exercise intensity at which pulmonary ventilation and carbon dioxide output begin to rise disproportionately to oxygen uptake, identified from breath-by-breath gas exchange during an incremental exercise test [wasserman1973]. Beaver, Wasserman and Whipp's V-slope method detects it from the relation between carbon dioxide output and oxygen uptake rather than from ventilatory equivalents alone [beaver1986]. **Established**: both the concept and its detection methods are standard exercise physiology.

It is a ventilatory and gas-exchange event, detected non-invasively, and is not the same measurement as a blood lactate threshold even though the two are related and are often conflated under the older name anaerobic threshold — the **distinguished-from** relation asserted here. **Established as a methodological distinction**, and the mechanistic account linking the two remains debated.

The **measures** relation to oxidative phosphorylation is an interpretive one and is marked as such: the threshold is read as the intensity above which steady-state oxidative supply no longer meets demand, and Fluge and colleagues' metabolic profiling proposed impaired pyruvate dehydrogenase function as one route to a lowered threshold in myalgic encephalomyelitis [fluge2016] (**single-cohort metabolite-profile evidence, with the enzyme activity inferred rather than assayed directly**).

Because it is submaximal and reproducible within a person, it is usable as an individual exertion reference in a way a maximal test is not, while remaining a description of that person's own capacity rather than a diagnostic threshold. Ruijgt and colleagues found heart-rate variability suppressed for 24 hours after exercise around this threshold in long-COVID patients, and framed it as supporting wearable-based overexertion management rather than as a validated diagnostic cut-point [ruijgt2026] (**one observational study, not independently replicated**).
