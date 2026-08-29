---
name: thing
description: "The polysemous wrapper for a categorical primitive when discussed in 561 OS contexts. Every thing IS an object at the math layer; the polysemy is which kind-name is in scope (structure, character, transformer, category, theory, object, directory, program, system, intelligence, carrier, cell, stratum). A thing is the apex of its own recursive layout — every directory in the OS is a thing."
specializing: object
references:
  - id: lambek1958
    type: article-journal
    title: The mathematics of sentence structure
    volume: 65
    issue: 3
    author:
      - literal: Lambek, Joachim
    container-title: American Mathematical Monthly
    page: 154-170
    issued:
      - year: 1958
  - id: maclane1971
    type: book
    title: Categories for the Working Mathematician
    series: Graduate Texts in Mathematics
    volume: 5
    publisher: Springer-Verlag
    location: New York
    author:
      - literal: Mac Lane, Saunders
    issued:
      - year: 1971
---

A **thing** is the polysemous wrapper for a categorical primitive in 561 OS contexts. At the math layer every thing is an [object](../object/object.md) — an element of $\mathrm{Ob}(\mathcal{C})$. The polysemy is which kind-name is in scope: when a thing carries categorical-object identity, it is called *object*; when it carries the morphism structure, *transformer*; when it carries the Bourbaki / Mac-Lane structure-with-signature, *structure*; and so on through the list of kinds.

The polysemy is a naming convention, not a structural fact. A thing's schema specializes object's schema via `allOf` with no additional cells. The same JSON instance that validates against `thing.schema.json` validates against `object.schema.json` and vice versa.

The schema is intentionally minimal. Specific projections of a thing (a directory in a POSIX filesystem, a content-addressable cell, an in-memory node, a wire-format envelope) carry their own additional cells in their realization schemas. Those realization schemas live with the realization, not on thing itself. Keeping thing at math-layer minimality means the same categorical machinery — the predication-fibration, the closure operator, the hyperdoctrine adjoints — operates uniformly over things across every realization the OS supports or will support.

A thing addresses the recursive-layout apex. Every directory in the OS is a thing, and every thing is the apex of a cone — the initial algebra of its closure operator, the structure-side fixed point. The recursive layout's fractal property — every directory carrying the same shape regardless of depth — is the projection of thing-as-apex into the POSIX-filesystem realization, not a property of thing itself.
