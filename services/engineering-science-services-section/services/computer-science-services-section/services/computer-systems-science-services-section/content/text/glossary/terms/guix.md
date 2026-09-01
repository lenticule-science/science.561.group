---
date: "\\[2025-09-16 Tue 18:37\\]"
field: "\\[\\[id:dd810340-ed05-4579-8c36-49995e5cc0e3\\]\\[computing\\]\\]"
id: fd807957-f450-4d5f-b7f9-691b792fc39d
instantiates: "\\[\\[id:a68f194d-54d8-46ac-bb80-bbd29ea90059\\]\\[operating
  system\\]\\]"
public: true
name: Guix
date-created: 2025-09-16
date-modified: 2026-08-28
index:
  - "computing!operating system!Guix"
---


**GNU Guix** is a functional package manager and a collection of Guile
programming interfaces for defining, building, composing, and deploying
software environments. It can run on another GNU/Linux distribution or serve
as the package and configuration substrate of Guix System.

Guix keeps build results in the content-addressed-style `/gnu/store`, records
dependency closures, and presents selected results through transactional
profile generations. Its declarations are ordinary Guile values: packages,
manifests, services, operating systems, images, and file-like objects can be
constructed and transformed programmatically.

Three commonly confused terms name different levels:

| Term | Plain role | Question answered |
|---|---|---|
| [Guix channel](./guix-channel.md) | versioned delivery line for Guix/Guile definitions | Which definition universe are we using? |
| [Guix module](./guix-module.md) | reusable namespace of executable definitions | Where is this vocabulary or logic defined? |
| [Guix manifest](./guix-manifest.md) | selected roster for an environment or bundle | What material should this environment contain? |

The shortest reliable model is:

```text
Git repository = where files and history live
Guile module   = reusable executable definitions
Guix channel   = authenticated, versioned delivery of modules
Guix package   = recipe for one buildable artifact
Guix manifest  = selected artifacts for one environment
Guix profile   = realized generation of that selection
```

Making a repository a channel does not “put the whole repository into Guix” and
does not make every resource a package. It makes selected modules from a
versioned repository available to Guix.

## Reference

- [GNU Guix Reference Manual](https://guix.gnu.org/manual/en/guix.html)
