---
name: file-path
description: A POSIX 1003.1 pathname string addressing a regular-file — a `/`-separated sequence of name components terminating at a regular-file's filename, interpreted by POSIX pathname resolution.
addressing: regular-file
references:
  ieee10031-2017:
    class: report
    authors: ["IEEE", "The Open Group"]
    year: 2017
    title: "IEEE Std 1003.1-2017 — Standard for Information Technology — Portable Operating System Interface (POSIX) Base Specifications, Issue 7"
    institution: "IEEE and The Open Group"
    location: "New York"
---

A **file-path** is a finite byte sequence of the form $$c_0 \,/\, c_1 \,/\, c_2 \,/\, \cdots \,/\, c_n$$ where each $c_i$ is a *path component*: a non-empty byte sequence of at most `NAME_MAX` octets not containing the path separator `/` or the null byte [@ieee10031-2017, §2.3].
A leading `/` is present iff the path is *absolute* — resolved from the filesystem's root.
A path without a leading `/` is *relative* — resolved from the calling process's current working directory.

POSIX pathname resolution [@ieee10031-2017, §4.13] interprets a file-path as a sequence of lookups.
Resolution starts from the root inode (when the path is absolute) or from the calling process's current-working-directory inode (when relative).
Each component $c_i$ is looked up as a directory entry in the inode reached so far, advancing resolution to the inode that entry names.
The components `.
` and `..
` resolve to the current inode and its parent inode respectively.
Symbolic-link inodes encountered along the way are expanded — their stored path-strings are themselves resolved — up to a system-imposed traversal limit.
The terminal component $c_n$ must resolve to the inode of a regular-file for the path to be a file-path; if $c_n$ resolves to a directory, the path is a directory-path, and similarly for the other posix-file specializations.

Two distinct file-paths may resolve to the same regular-file (hard links; symbolic-link chains that converge), and a syntactically well-formed file-path may resolve to no file at all (a missing component along the resolution chain).
The cell `(file-path, addressing, regular-file)` records that file-paths are names whose addressing functor lands in the category of regular-files when it lands at all.
