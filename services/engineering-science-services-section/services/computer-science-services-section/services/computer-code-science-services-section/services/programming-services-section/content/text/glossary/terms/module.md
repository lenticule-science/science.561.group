---
name: "module"
aliases:
  - "module"
date-created: 2026-01-01
date-modified: 2026-08-28
tags: []
---

# Module

A **module** is a named unit of program organization that groups related
bindings behind an explicit namespace and interface. Depending on the language,
those bindings may include values, functions, types, records, classes, macros,
or other modules. A module commonly declares which bindings it imports and
which it exports for reuse.

A module is not necessarily a package. A package is usually a distributable or
installable unit and may contain many modules. A source file often implements
one module, but the exact file/module relationship is defined by the language's
module system.

In Guile, a module is a named namespace such as `(phezi ochage atlas)`. Guile
conventionally maps that name to `phezi/ochage/atlas.scm` relative to a load
path. A [Guix module](../../../../../../../computer-systems-science-services-section/content/text/glossary/terms/guix-module.md)
is an ordinary Guile module that defines or uses Guix values and procedures.
