---
name: markdown-resource-file
description: A resource-file whose byte content parses as a YAML frontmatter mapping followed by a CommonMark-conformant markdown body.
specializing: resource-file
references:
  yaml1-2-2:
    class: online
    authors: ["YAML Language Development Team"]
    year: 2021
    title: "YAML Ain't Markup Language (YAML) version 1.2.2"
    url: "https://yaml.org/spec/1.2.2/"
  commonmark0-31:
    class: online
    authors: ["MacFarlane, John", "Atkins, David Greenspan"]
    year: 2024
    title: "CommonMark Spec, version 0.31.2"
    url: "https://spec.commonmark.org/0.31.2/"
  rfc3629:
    class: report
    authors: ["Yergeau, François"]
    year: 2003
    title: "RFC 3629 — UTF-8, a transformation format of ISO 10646"
    institution: "Internet Engineering Task Force"
    location: "Fremont, California"
---

A **markdown-resource-file** is a resource-file $F$ whose byte content, decoded as UTF-8 [@rfc3629], has the form
```
---\n
<yaml-frontmatter>
---\n
<markdown-body>
```
where:

- `<yaml-frontmatter>` is a YAML 1.2 document [@yaml1-2-2] that parses to a mapping (an associative array of string keys to YAML values; not a list, not a scalar);
- `<markdown-body>` is a (possibly empty) CommonMark 0.31 document [@commonmark0-31].

The two delimiter lines (`---\n`) are required; their absence makes $F$ non-conformant as a markdown-resource-file even if the body alone would parse as CommonMark.

The frontmatter mapping carries the predication cells whose subject is $F$: each top-level key is a predicate, each value (or each list-element of a list-valued key) is an object.
The body is the human-and-agent-readable exposition of the entity $F$ records.

In categorical terms the markdown-resource-files are the resource-files whose parse $\rho$ further factors through a CommonMark-conformant parser composed with a YAML parser.
This is a specialization of the resource-file type: every markdown-resource-file is a resource-file (the YAML+markdown bytes are a particular octet sequence), and not every resource-file is a markdown-resource-file (the byte content of a resource-file may be JSON, a JSON-Schema document, a binary image, or any other format the host theory's parsers admit).
