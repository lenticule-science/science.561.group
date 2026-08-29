---
name: directory-path
description: A POSIX 1003.1 pathname string addressing a directory — a `/`-separated sequence of name components terminating at a directory's filename, interpreted by POSIX pathname resolution.
addressing: directory
references:
  ieee10031-2017:
    class: report
    authors: ["IEEE", "The Open Group"]
    year: 2017
    title: "IEEE Std 1003.1-2017 — Standard for Information Technology — Portable Operating System Interface (POSIX) Base Specifications, Issue 7"
    institution: "IEEE and The Open Group"
    location: "New York"
---

A **directory-path** is a finite byte sequence of the form $$c_0 \,/\, c_1 \,/\, c_2 \,/\, \cdots \,/\, c_n$$ where each $c_i$ is a *path component*: a non-empty byte sequence of at most `NAME_MAX` octets not containing the path separator `/` or the null byte [@ieee10031-2017, §2.3].
A leading `/` is present iff the path is *absolute* — resolved from the filesystem's root.
A path without a leading `/` is *relative* — resolved from the calling process's current working directory.

The empty path component and the trailing `/` are admissible in a directory-path: the trailing slash explicitly signals that the path is to be resolved as a directory, and `c_n` resolving to a non-directory inode under a path ending in `/` is a resolution error (POSIX `ENOTDIR`).

POSIX pathname resolution [@ieee10031-2017, §4.13] interprets a directory-path as a sequence of lookups identical in form to the file-path case, with the type constraint that the terminal component $c_n$ must resolve to the inode of a directory.
Two distinct directory-paths may resolve to the same directory (notably through `.
` and `..
` traversals); a syntactically well-formed directory-path may resolve to no directory at all.

The cell `(directory-path, addressing, directory)` records that directory-paths are names whose addressing functor lands in the category of directories when it lands at all.
