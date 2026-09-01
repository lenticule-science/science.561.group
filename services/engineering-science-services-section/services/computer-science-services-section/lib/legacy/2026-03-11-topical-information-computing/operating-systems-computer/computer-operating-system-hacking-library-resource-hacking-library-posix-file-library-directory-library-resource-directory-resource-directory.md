---
name: resource-directory
description: A directory that additionally realizes a resource — the joint type pulled back from the category of directories and the category of resources along the role-class partition functor.
specializing: directory
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

A **resource-directory** is a directory $D$ for which there exists a triple $(v^R, \iota, T)$ — a resource — and a parse functor $\rho : D \mapsto (v^R, \iota, T)$ taking the directory's entry set, together with the inode metadata of its children, to a resource in the host theory $T$.
The two specifying cells of the joint type:

- `(resource-directory, specializing, directory)` — the underlying object of the joint type is a directory; reading the entries off a resource-directory gives the directory's (name, inode-number) set.
- `(resource-directory, realizing, resource)` — the parse $\rho$ exhibits the abstract resource that the directory's contents materialize; reading the directory through $\rho$ gives the resource triple.

The resource-directory objects form the pullback [@maclane1971, ch. III §3; @awodey2010, §5.2] $$\begin{array}{ccc} \mathbf{ResourceDirectory} & \longrightarrow & \mathbf{Resource} \\ \downarrow & & \downarrow \\ \mathbf{Directory} & \xrightarrow{\;\rho\;} & \mathbf{Resource} \end{array}$$ analogous to the resource-file pullback.
A directory lifts to a resource-directory iff its entries lie in the image of $\rho$ and the resulting resource component is well-formed under $T$.

A common shape for $\rho$: parse one designated child entry (e.g. a directory-index file at a fixed name) as a markdown-resource-file whose frontmatter encodes the resource components, plus the rest of the entries as the resource's content.
The categorical definition does not depend on this specific shape; what fixes it is the host theory $T$ together with the parse $\rho$.
