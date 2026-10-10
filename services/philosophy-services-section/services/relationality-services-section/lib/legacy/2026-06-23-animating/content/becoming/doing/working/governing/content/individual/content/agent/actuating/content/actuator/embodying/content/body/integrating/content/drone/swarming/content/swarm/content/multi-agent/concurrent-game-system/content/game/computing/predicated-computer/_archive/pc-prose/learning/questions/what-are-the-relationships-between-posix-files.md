---
name: what are the relationships between posix-files
description: Derives, from POSIX 1003.1 and from the slice construction in category theory, which gerund-named morphisms encode the inter-type relationships among the seven POSIX file types and the structure records built on them in the 561 repo (resource-files, role-class resource-files).
status: open
---

## The question

The 561 repository organizes its records as files on a POSIX filesystem and treats those files as a predication graph. Every record-to-record relationship is encoded as a frontmatter cell `(subject, predicate, object)` whose predicate is a transformer named by a gerund (the `-ing` form of a single English verb).

The POSIX layer has multiple file types (regular file, directory, symbolic link, FIFO, socket, character device, block device). The repo has further types built on top (resource-file, resource-directory, markdown-resource-file, per-role-class resource-file subtypes). The question is: **which gerund-named morphism encodes each relationship?** And — because gerunds force directionality — **which way does each morphism point?**

The question is not "what relations could exist among files" in the abstract. It is: which transformers must exist as records, so that the repo's structure records can encode their typed signatures as frontmatter cells whose keys resolve to those transformers.

## What POSIX itself says

POSIX 1003.1 (the IEEE/Open Group standard for portable operating systems) defines a *file* as a named region of storage in a filesystem. Every file has:

- A path within a filesystem namespace.
- An inode: a metadata record holding ownership (user ID, group ID), permission bits, link count, timestamps (access, modification, change), size, device location, and a **file type** flag.
- A defined set of operations: at minimum `open`, `close`, `stat`, `unlink`; specific operations beyond those depend on the file type.

The standard recognizes seven file types. From the `<sys/stat.h>` `S_IFMT` mask:

| Type            | Symbol     | What it is                                                                       |
|-----------------|-----------|----------------------------------------------------------------------------------|
| Regular file    | `S_IFREG` | A sequence of bytes addressable by offset. Supports `read`, `write`, `lseek`.    |
| Directory       | `S_IFDIR` | A structured collection of (name, inode) entries. Supports `readdir`, `mkdir`.   |
| Symbolic link   | `S_IFLNK` | A path-string interpreted by the OS during pathname resolution.                  |
| FIFO            | `S_IFIFO` | Unidirectional inter-process byte stream (named pipe). Transient content.        |
| Socket          | `S_IFSOCK`| Bidirectional inter-process communication endpoint. Transient content.           |
| Character device| `S_IFCHR` | Device exposed as a character-stream interface (e.g. terminals, serial ports).   |
| Block device    | `S_IFBLK` | Device exposed as a block-addressable interface (e.g. disks, partitions).        |

What is **common** to all seven types — the shared structure that justifies calling them all "POSIX files":

- A path in the filesystem namespace.
- An inode bearing the metadata listed above.
- The basic operation set `open`/`close`/`stat`/`unlink`.
- Participation in the filesystem hierarchy (every file has a parent directory, except the root).

What is **specific** to each type is the content layer — what `read(2)` and `write(2)` mean, what other operations are admissible, and how the content is interpreted. Two regular files differ only in their byte content; a regular file and a directory differ in the *kind* of content the system holds for them.

## What category theory gives us

A category $\mathcal{C}$ has objects and morphisms; each morphism has a source object (its domain) and a target object (its codomain); morphisms compose associatively and every object has an identity morphism (Mac Lane, *Categories for the Working Mathematician*, 1971, chapter I, §2).

The 561 repo models *types* as objects of a category and *typed relations between types* as morphisms. A morphism $T : A \to B$ is given a name; the name is a gerund — the `-ing` form of an English verb — describing what the source object *does* to (or *with respect to*) the target object.

Two general patterns of morphism are at play for the relationships we need to name:

**The specialization/forgetful pattern.** When type $B$ is "more general" and type $A$ adds extra structure or constraints, there is a morphism $A \to B$ that forgets the extra structure: every $A$-thing is also a $B$-thing (by forgetting). This is the forgetful functor of categorical algebra (Mac Lane 1971, chapter IV). In type-theoretic terms it is subtype-inclusion: an $A$ "is a more-specific kind of" $B$. The verb that names this is **specialization**: the source specializes the target. The gerund is `specializing`. Cell: `(A, specializing, B)` reads "$A$ specializes $B$" — $A$ is a narrower type than $B$.

**The realization pattern.** When type $A$ is a concrete form (a "shape of bytes on a disk") and type $B$ is an abstract mathematical concept that the concrete form materializes, there is a morphism $A \to B$ that picks out which abstract concept the concrete form realizes. This is the standard form-versus-content distinction: a JSON object realizes the JSON specification; a printed page realizes a typeset document. The verb is **realization**: the source realizes the target. The gerund is `realizing`. Cell: `(A, realizing, B)` reads "$A$ realizes $B$" — the concrete form $A$ materializes the abstract form $B$.

The two patterns are distinct: specialization is a relation *among* types at one level of abstraction; realization crosses levels. A category can carry both kinds of morphism; the predication category in which 561's structure records live does.

## Why gerunds, not noun phrases

A predication cell `(subject, predicate, object)` is a morphism in a category. Morphisms have a direction: arrows go from source to target. A gerund-named predicate makes the direction explicit, because gerunds are verb-forms — they describe what the source *does* to or with the target.

Noun-phrase predicates like `is-a`, `kind-of`, `member-of`, `instance-of` are static relational labels. They hide the direction (which way does "is-a" point?) and they hide the verb (what action grounds the relation?). They read as labels rather than as arrows.

The discipline therefore requires that every frontmatter key in a structure record's typed signature be a gerund whose corresponding transformer record exists in the repo. `is-a:` as a key is malformed; the right key is whichever gerund (e.g. `specializing:` or `realizing:`) accurately names the morphism.

## The edges we need to name

Listing the relationships the repo needs to encode, organized by region:

**Among POSIX file types.**

1. Regular file → POSIX file (the supertype name).
2. Directory → POSIX file.
3. Symbolic link → POSIX file.
4. FIFO → POSIX file.
5. Socket → POSIX file.
6. Character device → POSIX file.
7. Block device → POSIX file.

(Sibling relationships — e.g. between regular file and directory directly — are not arrows in the type hierarchy. Two siblings are co-objects in the slice over the supertype, with no direct morphism between them at the type level. The shared structure is the supertype.)

**From POSIX file to deeper repo types.**

8. POSIX file → entity (the predication graph's base unit of substance, the thing that bears predication cells).

**From concrete form to abstract concept.**

9. Resource-file → regular-file (a resource-file is a regular-file with extra rules — slug discipline, role-classification, addressability).
10. Resource-directory → directory (analogous).
11. Resource-file → resource (a resource-file materializes the abstract resource concept; the resource is a mathematical triple, the resource-file is the bytes-on-disk form).
12. Resource-directory → resource.

**Among resource-file specializations.**

13. Markdown-resource-file → resource-file (a markdown-resource-file is a resource-file whose content is YAML frontmatter followed by a markdown body).
14. Skill-resource-file → markdown-resource-file (and so on for the seven other role-class resource-file types: agent, character, structure, transformer, specification, prose, work).

**From role-class resource-file to role form.**

15. Skill-resource-file → skill (the bytes-on-disk form materializes the abstract skill — the invocable competence — that the record describes).
16. (Analogously for the other seven role classes.)

## Derivation, edge by edge

**Edges 1–7 (POSIX type to POSIX supertype).**

Each non-supertype POSIX file type adds specific operations and content-layer semantics to the shared structure (path + inode + basic operations + hierarchy participation). A regular file adds byte-content + offset-addressable operations. A directory adds entries + `readdir`/`mkdir`. A symbolic link adds path-content + indirection at resolution time. Each is a specialization of the supertype: extra structure on top of a more-general type.

The pattern is the specialization/forgetful pattern. The morphism direction is from the more-specific type to the more-general type. The cell is `(specific-type, specializing, supertype)`.

So: `(regular-file, specializing, posix-file)`, `(directory, specializing, posix-file)`, `(symbolic-link, specializing, posix-file)`, `(fifo, specializing, posix-file)`, `(socket, specializing, posix-file)`, `(character-device, specializing, posix-file)`, `(block-device, specializing, posix-file)`.

A note on the supertype's name. POSIX itself uses the word "file" for the supertype, and individual types are named "regular file," "directory," etc. The slug `posix-file` (kebab-case of "POSIX file") preserves the standard's terminology and avoids the ambiguity of overloading the bare word "file."

**Edge 8 (POSIX file to entity).**

An entity is the predication graph's base unit of substance: anything that bears predication cells. A POSIX file bears predication cells (by virtue of being addressable by a path and being able to carry frontmatter that the predication engine reads). Therefore every POSIX file is an entity — POSIX files form a specialization of entities, narrowing to those entities whose backing is a filesystem artifact.

Specialization/forgetful pattern again. Cell: `(posix-file, specializing, entity)`.

**Edges 9, 10 (resource-file to regular-file; resource-directory to directory).**

A resource-file is a regular file additionally satisfying the role-class partition rule, the slug-discipline rule, and the addressability rule. Every resource-file is a regular file (drop the extra rules); not every regular file is a resource-file (the extra rules constrain). Specialization.

Cells: `(resource-file, specializing, regular-file)`, `(resource-directory, specializing, directory)`.

**Edges 11, 12 (resource-file to resource; resource-directory to resource).**

A resource (as the 561 repo's mathematical record defines it) is an abstract triple consisting of a resource settling, a type-embedding, and a host theory. It is a category-theoretic object, not a filesystem artifact. A resource-file is the bytes-on-disk form that, when read and parsed under the host theory, projects to a particular resource — its settling component, its embedding into the theory's predicate category, and the theory itself.

This is the realization pattern: the concrete form realizes the abstract mathematical form. Cells: `(resource-file, realizing, resource)`, `(resource-directory, realizing, resource)`.

A resource-file therefore has **two** typed signature cells expressing its joint type: one specializing edge to its filesystem-form parent (regular-file), one realizing edge to its abstract-concept parent (resource). The two cells together encode that a resource-file is a regular-file that additionally realizes a resource.

**Edge 13 (markdown-resource-file to resource-file).**

A markdown-resource-file is a resource-file whose content is YAML frontmatter followed by a markdown body. Every markdown-resource-file is a resource-file; the extra constraint is on the content's parse shape. Specialization.

Cell: `(markdown-resource-file, specializing, resource-file)`.

**Edge 14 (role-class resource-file to markdown-resource-file).**

A skill-resource-file is a markdown-resource-file additionally conforming to the skill role-class schema. An agent-resource-file is a markdown-resource-file additionally conforming to the agent schema. Same pattern for character, structure, transformer, specification, prose, work. Each is a specialization of markdown-resource-file with role-specific frontmatter and body invariants.

Cells: `(skill-resource-file, specializing, markdown-resource-file)`, `(agent-resource-file, specializing, markdown-resource-file)`, and the parallel six.

**Edges 15, 16 (role-class resource-file to role form).**

A skill — at the abstract level — is an invocable competence: a named bundle of preconditions, body, postconditions, and witness shape that an agent can call. A skill-resource-file is the bytes-on-disk form (a directory holding `SKILL.md` and `_index.md` with role-specific frontmatter) that materializes a particular skill.

This is again the realization pattern. The concrete form realizes the abstract role form. Cell: `(skill-resource-file, realizing, skill)`. Analogously for the other seven role classes.

Each role-class resource-file therefore carries **two** typed signature cells: one specializing edge to markdown-resource-file (its file-form parent), one realizing edge to the role form (its abstract-concept parent).

## Answer

Two transformer records are sufficient to encode every edge enumerated above:

| Transformer  | Gerund        | Agent-noun     | Imperative   | What the source does to the target                                          |
|--------------|---------------|----------------|--------------|------------------------------------------------------------------------------|
| Specializing | `specializing`| `specializer`  | `specialize` | Adds constraints to narrow the target type into the source type.            |
| Realizing    | `realizing`   | `realizer`     | `realize`    | Materializes the target's abstract form as the source's concrete form.      |

Neither transformer record exists in the 561 repo today. Both must be authored as part of the same body of work this question opens.

Applied to the edges:

| Cell                                                          | Pattern          |
|---------------------------------------------------------------|------------------|
| `(regular-file, specializing, posix-file)`                    | specialization   |
| `(directory, specializing, posix-file)`                       | specialization   |
| `(symbolic-link, specializing, posix-file)`                   | specialization   |
| `(fifo, specializing, posix-file)`                            | specialization   |
| `(socket, specializing, posix-file)`                          | specialization   |
| `(character-device, specializing, posix-file)`                | specialization   |
| `(block-device, specializing, posix-file)`                    | specialization   |
| `(posix-file, specializing, entity)`                          | specialization   |
| `(resource-file, specializing, regular-file)`                 | specialization   |
| `(resource-directory, specializing, directory)`               | specialization   |
| `(resource-file, realizing, resource)`                        | realization      |
| `(resource-directory, realizing, resource)`                   | realization      |
| `(markdown-resource-file, specializing, resource-file)`       | specialization   |
| `(skill-resource-file, specializing, markdown-resource-file)` | specialization   |
| `(agent-resource-file, specializing, markdown-resource-file)` | specialization   |
| (and the six parallel role-class specializations)             | specialization   |
| `(skill-resource-file, realizing, skill)`                     | realization      |
| `(agent-resource-file, realizing, agent)`                     | realization      |
| (and the six parallel role-class realizations)                | realization      |

## What this answer does not decide

- **Whether `entity` itself specializes some deeper type.** The 561 repo has further structure (`structure`, `category`) above `entity`. Whether `entity` specializes `structure` (and what gerund encodes that), and whether `structure` is itself in some category, is the next question downstream. This file does not resolve it; the same patterns above (specialization vs. realization) plausibly apply but each edge needs its own derivation.
- **The names of the other-POSIX-file-type structure records.** This file uses `regular-file`, `directory`, `symbolic-link`, `fifo`, `socket`, `character-device`, `block-device`. The 561 repo currently only operates on regular files and directories; whether all seven get structure records, or only the two in use plus the supertype, is an authoring-scope decision separate from the morphism-derivation answered here.
- **Whether `specializing` and `realizing` are the right names.** Other English gerunds describe the same morphisms (`narrowing`, `restricting`, `inheriting` for the specialization pattern; `materializing`, `instantiating`, `embodying` for the realization pattern). The derivation above settles which morphism each edge is (specialization or realization), not which gerund best names that morphism. Final naming is a choice the transformer-record author makes when writing the record.
- **What sibling relationships look like in frontmatter.** Two specializations of the same supertype have no direct morphism in the type hierarchy. Whether the repo encodes "X and Y are siblings under Z" as separate cells `(X, specializing, Z)` and `(Y, specializing, Z)` (with siblinghood derivable from the shared codomain) or with an explicit sibling morphism is not decided here. The first option is what the derivation supports.
- **The status of the existing non-gerund transformer records** (e.g. `member-of`, `derives-from`, `decomposes-into`, `depends-on`, `has-character`, `has-status`). Each is the result of an earlier authoring round that did not enforce the gerund discipline. Whether to retire each, rename each, or keep some as historical aliases is a separate cleanup question.
