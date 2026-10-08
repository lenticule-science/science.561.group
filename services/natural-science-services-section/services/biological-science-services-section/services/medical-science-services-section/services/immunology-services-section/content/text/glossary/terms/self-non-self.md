---
name: "Self/Non-Self Discrimination"
description: "The immune system's foundational classification problem: distinguishing the body's own molecular constituents from foreign material, established during lymphocyte development and maintained through ongoing tolerance mechanisms."
date-created: 2026-08-21
authors:
  - claude-sonnet-5
aliases:
  - "self/non-self"
  - "self-nonself discrimination"
  - "self-non-self discrimination"
keywords:
  - immunology
instance-of: immunological-classification
component-of: immunology
enables: [immunological-tolerance, autoimmunity]
contrasts-with: danger-model
analogous-to: idiotypic-network
---

Self/non-self discrimination is the classical framework for how the adaptive immune system decides what to attack. Frank Macfarlane Burnet's clonal selection theory (1957) held that the immune system pre-generates an enormous repertoire of lymphocytes bearing randomly assorted antigen receptors, then eliminates or inactivates those clones whose receptors bind the body's own molecules — leaving a surviving repertoire tuned to recognize only what is foreign.

## Establishing the boundary

The boundary is set during lymphocyte development, not inherited as a fixed list:

- **Central tolerance** — in the thymus, developing T cells are tested against self-antigens displayed by thymic epithelial and dendritic cells. Cells that bind self-antigens too strongly undergo negative selection (apoptosis); cells that fail to bind at all also die (positive selection requires some self-recognition, just not too much). Only cells in the narrow window — weak self-affinity — survive to leave the thymus. A parallel process (central B cell tolerance) occurs in the bone marrow.
- **Peripheral tolerance** — self-reactive lymphocytes that escape central deletion are held in check by regulatory T cells, anergy (functional inactivation on encountering antigen without costimulation), and clonal ignorance (antigens sequestered from immune surveillance, as in the eye or testis).

The boundary set this way is not permanent — it is a repertoire configuration reached through a developmental process and then actively maintained. See [immunological tolerance](./immunological-tolerance.md) for the maintenance mechanisms and [autoimmunity](./autoimmunity.md) for what happens when they fail.

## Limits of the framework

Self/non-self discrimination struggles to explain several observations without amendment: why the immune system tolerates the fetus (paternal antigens are non-self, yet pregnancy does not trigger rejection under normal conditions), why it tolerates commensal gut microbiota in enormous non-self quantities, and why transplanted tissue is rejected only under some conditions and not others. Polly Matzinger's [danger model](./danger-model.md) (1994) was proposed partly to address these gaps by keying immune response to signals of tissue damage rather than to foreignness per se.

## A framing from outside immunology

The founding note for this section's theory arc reads self/non-self discrimination as a case of a more general pattern — a system reaching a settled classification over a domain of possible inputs before it is asked to act on any particular one. See ["Immunity as Belief Board"](../../../../../../../../../../../../content/text/documents/articles/notes/2026/08/21/2026-08-21-note-on-immunity-as-belief-board.md), which frames thymic negative selection as "a charge configuration over the antigen space reaching its fixed point before deployment." That note is a draft awaiting the section's owner review; its claims are presented there as a hypothesis to be tested, not settled immunology, and this section is a candidate destination for it rather than an endorsement of it.

## Related terms

- [Immunological tolerance](./immunological-tolerance.md) — how the boundary is maintained after it is set
- [Autoimmunity](./autoimmunity.md) — what happens when self/non-self classification misfires
- [Danger model](./danger-model.md) — an alternative to keying response on self/non-self at all
- [Idiotypic network](./idiotypic-network.md) — a theory of how the repertoire is organized relative to itself, not only to antigen
