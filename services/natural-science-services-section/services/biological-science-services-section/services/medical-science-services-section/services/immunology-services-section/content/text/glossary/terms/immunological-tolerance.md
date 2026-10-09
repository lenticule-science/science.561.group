---
name: "Immunological Tolerance"
description: "The set of mechanisms by which the immune system withholds attack from self-antigens, commensal microbiota, food antigens, and (during pregnancy) fetal antigens — despite these being detectable as non-self."
date-created: 2026-08-21
authors:
  - claude-sonnet-5
aliases:
  - "immune tolerance"
  - "immunological tolerance"
  - "self-tolerance"
keywords:
  - immunology
instance-of: immune-regulatory-mechanism
component-of: self-non-self
produced-by: [thymic-selection, regulatory-t-cell]
contrasts-with: autoimmunity
---

Immunological tolerance is not merely the absence of an antigen the immune system could react to — it is an active, ongoing classification: some detectable non-self material is treated as something other than a threat. This is the harder half of self/non-self discrimination. Building a repertoire capable of recognizing foreign antigen is comparatively simple (random receptor generation supplies it for free); the difficult engineering problem is preventing that repertoire from firing on the body's own tissue, its symbiotic microbiota, ingested food proteins, and — for roughly nine months at a time in placental mammals — a genetically distinct fetus.

## Mechanisms

- **Central tolerance** — deletion or inactivation of self-reactive lymphocyte clones during development, in the thymus (T cells) and bone marrow (B cells). See [self/non-self discrimination](./self-non-self.md).
- **Peripheral tolerance** — mechanisms acting on mature lymphocytes that escaped central deletion:
  - **Regulatory T cells (Tregs)** — a dedicated T cell subset (CD4+CD25+FoxP3+) that actively suppresses immune responses via inhibitory cytokines (IL-10, TGF-β) and direct cell contact, rather than merely failing to respond.
  - **Anergy** — a state of functional unresponsiveness induced when a T cell receptor engages antigen without the accompanying costimulatory signal that antigen-presenting cells provide only in the presence of danger or inflammation cues.
  - **Clonal ignorance** — antigens that are physically inaccessible to circulating lymphocytes (immune-privileged sites: eye, testis, brain) never trigger a response because they are never encountered, not because tolerance was actively established.
- **Oral tolerance** — the gut immune system is specifically biased toward generating regulatory responses to ingested antigens, suppressing reaction to food proteins and commensal bacteria that would otherwise provoke inflammation at a surface constantly exposed to foreign material.
- **Maternal-fetal tolerance** — pregnancy involves active local suppression at the maternal-fetal interface (regulatory T cell expansion, altered antigen presentation, complement regulation) rather than the fetus's paternal antigens simply going undetected.

## Failure modes

When tolerance mechanisms fail on self-antigen, the result is [autoimmunity](./autoimmunity.md). When they fail on food or environmental antigen, the result is allergy. Both are failures of the same regulatory apparatus directed at different targets — which is part of why classification of the failure matters as much as detection of the failure.

## A framing from outside immunology

The founding note for this section's theory arc proposes reading tolerance as a specific classification outcome: "commensal and food antigens carry nonzero raw conflict yet are correctly filed as residual uncertainty rather than named conflicts." On that reading, tolerance is not the absence of a signal but a deliberate downgrading of a real signal to a non-actionable category — and autoimmunity is what happens when that downgrading fails. See ["Immunity as Belief Board"](../../../../../../../../../../../../content/text/documents/articles/notes/2026/08/21/2026-08-21-note-on-immunity-as-belief-board.md) for the full argument, offered there as a draft hypothesis awaiting review rather than as an immunology finding.

## Related terms

- [Self/non-self discrimination](./self-non-self.md) — the classification tolerance maintains
- [Autoimmunity](./autoimmunity.md) — the clinical failure mode when tolerance to self breaks down
- [Danger model](./danger-model.md) — an account of why tolerance and response are keyed to damage signals rather than antigen identity alone
