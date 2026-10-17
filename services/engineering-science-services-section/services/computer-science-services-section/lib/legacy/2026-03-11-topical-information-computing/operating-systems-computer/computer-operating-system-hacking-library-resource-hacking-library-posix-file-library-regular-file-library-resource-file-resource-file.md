---
name: resource-file
description: A regular-file that additionally realizes a resource — the joint type pulled back from the category of regular-files and the category of resources along the role-class partition functor.
specializing: regular-file
realizing: resource
references:
  maclane1971:
    class: book
    authors: ["Mac Lane, Saunders"]
    year: 1971
    title: "Categories for the Working Mathematician"
    publisher: "Springer"
    location: "New York"
  awodey2010:
    class: book
    authors: ["Awodey, Steve"]
    year: 2010
    title: "Category Theory"
    edition: "2nd"
    publisher: "Oxford University Press"
    location: "Oxford"
---

A **resource-file** is a regular-file $F$ for which there exists a triple $(v^R, \iota, T)$ — a resource — and a parse functor $\rho : F \mapsto (v^R, \iota, T)$ taking the byte content of $F$ to its components in the host theory $T$.
The two specifying cells of the joint type:

- `(resource-file, specializing, regular-file)` — the underlying object of the joint type is a regular-file; reading the bytes off a resource-file gives the regular-file's octet sequence.
- `(resource-file, realizing, resource)` — the parse $\rho$ exhibits the abstract resource that the bytes materialize; reading the bytes through $\rho$ gives the resource triple.

In categorical terms the resource-file objects form the pullback [@maclane1971, ch. III §3; @awodey2010, §5.2] in the diagram $$\begin{array}{ccc} \mathbf{ResourceFile} & \longrightarrow & \mathbf{Resource} \\ \downarrow & & \downarrow \\ \mathbf{RegularFile} & \xrightarrow{\;\rho\;} & \mathbf{Resource} \end{array}$$ where the vertical arrows are the [specializing](../transformers/specializing.md) and [realizing](../transformers/realizing.md) projections respectively.
A regular-file lifts to a resource-file iff its bytes lie in the image of $\rho$ and the resulting resource component is well-formed under $T$.

The role-class partition that picks out which regular-files admit such a lift is not part of the categorical definition of resource-file.
It is the additional structure each containing repository imposes to fix which $T$ applies to which path-prefix, recorded separately from the math.
