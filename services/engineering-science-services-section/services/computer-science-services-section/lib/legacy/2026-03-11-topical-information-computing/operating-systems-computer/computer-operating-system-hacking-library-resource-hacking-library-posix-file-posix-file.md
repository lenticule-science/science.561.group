---
name: posix-file
description: A POSIX 1003.1 filesystem object — the supertype of regular-file, directory, symbolic-link, fifo, socket, character-device, and block-device. An inode plus a path in the filesystem namespace.
references:
  ieee10031-2017:
    class: report
    authors: ["IEEE", "The Open Group"]
    year: 2017
    title: "IEEE Std 1003.1-2017 (Revision of IEEE Std 1003.1-2008) — Standard for Information Technology — Portable Operating System Interface (POSIX) Base Specifications, Issue 7"
    institution: "IEEE and The Open Group"
    location: "New York"
  iso98992018:
    class: report
    authors: ["International Organization for Standardization"]
    year: 2018
    title: "ISO/IEC 9899:2018 — Information technology — Programming languages — C"
    institution: "ISO/IEC"
    location: "Geneva"
---

A **posix-file** is an entity in a filesystem conforming to IEEE Std 1003.1 ("POSIX.
1") [@ieee10031-2017].
Every posix-file carries:

- A **path** in the filesystem namespace: a `/`-separated sequence of name components, each at most `NAME_MAX` bytes and not containing `/` or the null byte, terminating in a name that addresses this file under its parent directory.
- An **inode** holding metadata: a numeric inode identifier unique within its containing filesystem, owner user ID and group ID, mode bits encoding file type and access permissions, timestamps (last access, last modification, last status change), a hard-link count, and a size in bytes.
- A **type** drawn from a fixed set of seven mutually exclusive type bits (`S_IFREG`, `S_IFDIR`, `S_IFLNK`, `S_IFIFO`, `S_IFSOCK`, `S_IFCHR`, `S_IFBLK`) recorded in the inode's mode field, fixed at the file's creation.
- A **content interpretation** determined by the type bit: the bytes (or directory entries, when the type is `S_IFDIR`) the system holds for the file, and the operations admissible on those bytes.

Every posix-file admits the operations `open`, `close`, `stat`, `chmod`, `chown`, `unlink`, and `link` (with link operations applicable only between files on the same filesystem).
Further operations are determined by the file's type.

Containment in the filesystem hierarchy is one-to-many: every posix-file other than the root of its filesystem has exactly one parent directory; a directory contains zero or more children.
The hierarchy is a tree modulo hard links (a single inode may be reachable from multiple parents) and symbolic links (a name may point at a path string interpreted at resolution time).
The C standard library [@iso98992018, §7.21] supplies the canonical higher-level file-stream abstraction that the POSIX file model extends.

## The seven specializations

| Type            | Mode bit     | Content layer                                                                |
|-----------------|--------------|------------------------------------------------------------------------------|
| Regular file    | `S_IFREG`    | A sequence of bytes addressable by offset.                                   |
| Directory       | `S_IFDIR`    | A collection of (name, inode-number) entries.                                |
| Symbolic link   | `S_IFLNK`    | A path-string interpreted by the OS during pathname resolution.              |
| FIFO            | `S_IFIFO`    | A named unidirectional inter-process byte stream.                            |
| Socket          | `S_IFSOCK`   | A bidirectional inter-process communication endpoint.                        |
| Character device| `S_IFCHR`    | A character-stream interface to a hardware or virtual device.                |
| Block device    | `S_IFBLK`    | A block-addressable interface to a hardware or virtual device.               |

Each specialization adds constraints and additional operations to the shared posix-file form.
The categorical relationships from each specialization to posix-file are recorded as cells `(<specialization>, specializing, posix-file)` on the specialization records.
