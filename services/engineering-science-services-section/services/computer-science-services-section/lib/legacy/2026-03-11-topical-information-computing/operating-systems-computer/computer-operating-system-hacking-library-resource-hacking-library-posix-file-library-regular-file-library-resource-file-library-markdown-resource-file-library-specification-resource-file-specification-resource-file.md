---
name: specification-resource-file
description: A markdown-resource-file conforming to the RFC-shaped specification document form — a normative description of conformance criteria for some class of entity.
specializing: markdown-resource-file
realizing: specification
references:
  rfc2119:
    class: report
    authors: ["Bradner, Scott"]
    year: 1997
    title: "RFC 2119 — Key words for use in RFCs to Indicate Requirement Levels"
    institution: "Internet Engineering Task Force"
    location: "Fremont, California"
  rfc8174:
    class: report
    authors: ["Leiba, Barry"]
    year: 2017
    title: "RFC 8174 — Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words"
    institution: "Internet Engineering Task Force"
    location: "Fremont, California"
  maclane1971:
    class: book
    authors: ["Mac Lane, Saunders"]
    year: 1971
    title: "Categories for the Working Mathematician"
    publisher: "Springer"
    location: "New York"
---

A **specification-resource-file** is a markdown-resource-file $F$ whose frontmatter mapping carries an identity (`name`), a description, and a `status` cell (one of `active`, `superseded`, `draft`, or equivalent).
The body is structured as an RFC-shaped normative document: a brief introduction, a conventions section (binding the meaning of MUST, MUST NOT, SHOULD, SHOULD NOT, and MAY per [@rfc2119; @rfc8174]), a terminology section, one or more numbered normative sections stating the conformance criteria, and a final conformance section summarizing the conjunction of those criteria.

The joint type is the pullback [@maclane1971, ch. III §3] in the diagram $$\begin{array}{ccc} \mathbf{SpecificationResourceFile} & \longrightarrow & \mathbf{Specification} \\ \downarrow & & \downarrow \\ \mathbf{MarkdownResourceFile} & \xrightarrow{\;\rho\;} & \mathbf{Specification} \end{array}$$ where the realizing functor $\rho$ projects the frontmatter cells onto the specification's identity and lifecycle state, and the body onto the specification's normative content — the set of conformance criteria that an entity must satisfy to be conformant under this specification.
