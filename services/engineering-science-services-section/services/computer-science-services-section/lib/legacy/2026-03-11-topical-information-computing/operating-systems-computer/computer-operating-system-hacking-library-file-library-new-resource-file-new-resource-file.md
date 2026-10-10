---
name: new resource file
description: A resource file at the moment of first authoring — the call-site shape the writing-a-new-resource-file skill operates on. Distinguished from resource-file because the discipline that applies (read the type's spec, read a reference case, then write) is specifically a pre-creation discipline.
derives-from:
  - resource-file.md
---

A new resource file is the substrate object that exists at the moment a resource file is being authored from scratch — before any bytes have been written.
Once written, it is just a `resource-file`; the `new-` prefix names the call-site at which the read-before-write discipline applies.

The shape an instance carries: `type` (which kind of resource — character, skill, agent, structure, transformer, etc.), `path` (where the file will land), `content` (the bytes to be written), and the pair `(spec_path, reference_path)` resolved against the type.
The `(spec_path, reference_path)` pair is the load-bearing addition over `resource-file`: a new-resource-file's authoring is admissible only when both resolve to existing readable files.

This structure exists to give the verb-noun grammar a noun for skills that author new resources (`writing-a-new-resource-file` and the per-type composers like `writing-a-new-character`).
The discipline the skills enforce — mechanical read of the spec and one reference case before write — is what makes new-resource-file structurally distinct from resource-file for substrate purposes.
