---
identity: cranial-electrotherapy-stimulation
name: "Cranial Electrotherapy Stimulation"
description: "Small pulsed alternating currents (microamperes to a few milliamperes) through electrodes on the earlobes, behind the ears or at the temples, for 20–60 minutes, used for anxiety, insomnia and depression; a prescription device class in the US with modest, low-certainty evidence for anxiety."
aliases:
  - "CES"
  - "cranial electrical stimulation"
  - "cranial electrotherapy"
  - "electrosleep"
  - "Alpha-Stim"
relations:
  subtype-of: "transcranial-electrical-stimulation"
  derives-from: "electrosleep"
  acts-on:
    - "neural-oscillation"
    - "neuronal-excitability"
references:
  shekelle2018:
    authors:
      - "Paul G. Shekelle"
      - "Ian A. Cook"
      - "Isomi M. Miake-Lye"
      - "Marika Suttorp Booth"
      - "Jessica M. Beroes"
      - "Selene Mak"
    title: "Benefits and Harms of Cranial Electrical Stimulation for Chronic Painful Conditions, Depression, Anxiety, and Insomnia: A Systematic Review"
    year: 2018
    publication: "Annals of Internal Medicine"
    volume: "168"
    issue: "6"
    pages: "414-421"
    doi: "10.7326/M17-1970"
  kavirajan2014:
    authors:
      - "Harish C. Kavirajan"
      - "Kristen Lueck"
      - "Kenneth Chuang"
    title: "Alternating current cranial electrotherapy stimulation (CES) for depression"
    year: 2014
    publication: "Cochrane Database of Systematic Reviews"
    issue: "7"
    pages: "CD010521"
  barclay2014:
    authors:
      - "Timothy H. Barclay"
      - "Raymond D. Barclay"
    title: "A clinical trial of cranial electrotherapy stimulation for anxiety and comorbid depression"
    year: 2014
    publication: "Journal of Affective Disorders"
    volume: "164"
    pages: "171-177"
  datta2013:
    authors:
      - "Abhishek Datta"
      - "Jacek P. Dmochowski"
      - "Berkan Guleyupoglu"
      - "Marom Bikson"
      - "Felipe Fregni"
    title: "Cranial electrotherapy stimulation and transcranial pulsed current stimulation: a computer based high-resolution modeling study"
    year: 2013
    publication: "NeuroImage"
    volume: "65"
    pages: "280-287"
  voroslakos2018:
    authors:
      - "Mihály Vöröslakos"
      - "Yuichi Takeuchi"
      - "Kitti Brinyiczki"
      - "Tamás Zombori"
      - "Azahara Oliva"
      - "Antonio Fernández-Ruiz"
      - "Gábor Kozák"
      - "Zsolt Kincses"
      - "Béla Iványi"
      - "György Buzsáki"
      - "Antal Berényi"
    title: "Direct effects of transcranial electric stimulation on brain circuits in rats and humans"
    year: 2018
    publication: "Nature Communications"
    volume: "9"
    pages: "483"
  kaptchuk2015:
    authors:
      - "Ted J. Kaptchuk"
      - "Franklin G. Miller"
    title: "Placebo Effects in Medicine"
    year: 2015
    publication: "New England Journal of Medicine"
    volume: "373"
    issue: "1"
    pages: "8-9"
provenance:
  date-created: "2026-09-24"
  authors:
    - claude-opus-5-5
---

Cranial electrotherapy stimulation (CES) passes a small, usually pulsed and biphasic [alternating current](../../../../../../../../../../../physical-science-services-section/services/physics-services-section/content/text/glossary/terms/alternating-current.md) through electrodes clipped to the earlobes, or placed behind the ears or at the temples, typically for 20–60 minutes a day. Devices differ widely in their dose. Some run at a fraction of a milliampere and low frequency, often below the level a user can feel. Others deliver several milliamperes on a higher-frequency carrier. It descends from the "electrosleep" research of the mid-twentieth century and is used chiefly for anxiety, insomnia and depression.

**Regulation.** In the US, CES devices fall under 21 CFR 882.5800. Since the FDA's 2019 reclassification they are Class II, prescription devices for anxiety and insomnia. Claims for depression remain Class III, which requires premarket approval.

**Mechanism.** Several routes are proposed, and none is settled.
- *Transcranial:* current-flow modelling of ear-clip montages shows that part of the current crosses into the brain, including toward deep structures, producing small [electric fields](../../../../../../../../../../../physical-science-services-section/services/physics-services-section/content/text/glossary/terms/electric-field.md) [@datta2013]. Their magnitude is at or below the range where [transcranial stimulation](transcranial-electrical-stimulation.md) reliably affects neurons [@voroslakos2018]. The original claim, that CES shifts the EEG toward [alpha](../../../../../../../../../neuroscience-services-section/content/text/glossary/terms/alpha-rhythm.md), is a statement of this route.
- *Peripheral:* the electrodes sit on skin supplied by sensory nerves, including the auricular branch of the [vagus nerve](../../../../../../../../../physiology-services-section/content/text/glossary/terms/vagus-nerve.md), so part of any effect could run through the same pathways [taVNS](transcutaneous-auricular-vagus-nerve-stimulation.md) targets.
- *Expectancy:* the conditions it is used for are ones where [placebo effects](../../../../../../../../content/text/glossary/terms/placebo-effect.md) are large [@kaptchuk2015]. Subsensory devices can be compared against a genuinely indistinguishable [sham](../../../../../../../../content/text/glossary/terms/sham-stimulation.md). Higher-current devices that tingle are harder to blind.

**Evidence.** A systematic review for the US Veterans Affairs Evidence Synthesis Program pooled 26 randomized trials [@shekelle2018]. It found low-strength evidence of a modest benefit in patients with anxiety and depression, and insufficient evidence for depression alone, insomnia, headache, fibromyalgia and other pain conditions. A Cochrane review of CES for acute depression found no adequate evidence either way [@kavirajan2014]. Individual sham-controlled trials report benefit, such as a five-week trial in outpatients with anxiety [@barclay2014], but they are mostly small and often industry-linked.

**Safety.** Adverse effects are mild and uncommon: skin irritation under the electrodes, headache, and dizziness at higher currents.

For a structured path from the physics to this evidence, see the [note on studying cranial electrotherapy stimulation](../../documents/articles/notes/2026/09/24/2026-09-24-note-on-studying-cranial-electrotherapy-stimulation.md).
