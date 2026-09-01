---
name: citing
description: A partial interpretation functor from the body cell-positings of a markdown-resource-file to the cited-work objects its frontmatter declares — sends each body `[@citekey]` token to the cited-work the citekey resolves to.
gerund: citing
agent-noun: citer
imperative: cite
originating: markdown-resource-file
terminating: cited-work
preserves:
  - identities
references:
  - id: lambek-scott1986
    type: book
    title: Introduction to Higher-Order Categorical Logic
    publisher: Cambridge University Press
    location: Cambridge
    author:
      - literal: Lambek, Joachim
      - literal: Scott, Philip J.
    issued:
      - year: 1986
  - id: robinson-rosolini1988
    type: article-journal
    title: Categories of partial maps
    volume: 79
    issue: 2
    author:
      - literal: Robinson, Edmund
      - literal: Rosolini, Giuseppe
    container-title: Information and Computation
    page: 95-130
    issued:
      - year: 1988
---

Let $F$ be a markdown-resource-file and let $\mathrm{Ref}(F)$ denote the set of cited-work objects declared in $F$'s frontmatter `references:` map. Each entry in the map is keyed by a *citekey* and carries the bibliographic data the entry inhabits-cited-work-form with.

A **citing** of $\mathrm{Ref}(F)$ by the body of $F$ is a partial functor
$$\gamma_F : \mathrm{Body}(F) \rightharpoonup \mathrm{Ref}(F)$$
that sends each body token of the form `[@citekey]` to the cited-work entry at the matching citekey in $\mathrm{Ref}(F)$, and is undefined on every other body token. Partiality is the essential feature: most body tokens are not citations, and the domain of $\gamma_F$ is exactly the set of `[@citekey]` tokens the body emits.

The functor $\gamma_F$ is required to be **total on its domain of declared references**: every `[@citekey]` token in $F$'s body must resolve to a `references:` entry under the matching citekey. A body `[@citekey]` whose citekey has no `references:` entry is a typing failure — the cell $(F, \text{citing}, \text{work}_{\text{citekey}})$ posited by the body token has no witness in the frontmatter, and the cell-graph is incoherent at $F$.

The functor is **faithful on morphisms where defined**: two distinct body positions citing the same citekey are distinct elements of $\mathrm{Body}(F)$ but map to the same element of $\mathrm{Ref}(F)$. The map is not in general injective.

The citing morphism is a body-level instance of the same syntactic-to-semantic interpretation pattern as [addressing](addressing.md), specialized to the citation case [@lambek-scott1986, Part II §11]: the body is the syntactic surface; the `references:` map is the semantic surface; the `[@citekey]` token is the address; the cited-work entry is the referent. Partiality is handled along the lines of [@robinson-rosolini1988].

The cell $(F, \text{citing}, W)$ — for a cited-work $W$ — records that $F$ cites $W$. Reading: "$F$ cites $W$." The cell is posited by every `[@citekey]` body token in $F$ whose citekey resolves to $W$ in $F$'s `references:` map.
