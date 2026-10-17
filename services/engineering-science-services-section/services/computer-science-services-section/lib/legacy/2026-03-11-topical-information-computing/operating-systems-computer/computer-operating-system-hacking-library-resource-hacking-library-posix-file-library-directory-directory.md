---
name: directory
description: A POSIX 1003.1 directory (mode bit `S_IFDIR`) — a filesystem object whose content is a collection of (name, inode-number) entries.
specializing: posix-file
references:
  ieee10031-2017:
    class: report
    authors: ["IEEE", "The Open Group"]
    year: 2017
    title: "IEEE Std 1003.1-2017 — Standard for Information Technology — Portable Operating System Interface (POSIX) Base Specifications, Issue 7"
    institution: "IEEE and The Open Group"
    location: "New York"
---

A **directory** is a posix-file whose mode field's type bits equal `S_IFDIR` [@ieee10031-2017, §2.3].
Its content is a finite set of *directory entries*, each a pair `(name, inode-number)` where `name` is a non-empty byte sequence not containing `/` or the null byte (and not exceeding `NAME_MAX` octets in length), and `inode-number` identifies a posix-file in the same filesystem.

Every directory contains at least two entries: `.
` resolving to the directory's own inode, and `..
` resolving to the inode of its parent directory (or to its own inode in the case of a filesystem's root directory).
All other entries are added or removed only by directory-modifying operations.

Operations admissible on a directory beyond the posix-file base set [@ieee10031-2017, §3]:

- `mkdir(path, mode)` — create a directory at `path` with mode bits `mode & ~umask`.
- `rmdir(path)` — remove the directory at `path`.
  The call fails if the directory contains entries other than `.
  ` and `..
  `.
- `opendir(path)` / `readdir(dirp)` / `closedir(dirp)` — open a directory for iteration, read successive entries, close the iterator.
  `read(2)` and `write(2)` are not admissible on a directory.
- `link(old, new)` — create a directory entry at `new` resolving to the same inode as the entry at `old`.
  Restricted to regular-files in POSIX.
  1-2017 by default.
- `unlink(path)` — remove the directory entry at `path`; the underlying inode is freed when its link count reaches zero and no open file descriptors reference it.

The set of directories together with the parent relation forms a tree rooted at the filesystem's root inode, modulo two augmentations: hard links may attach a single non-directory inode to multiple directory entries (giving a tree-with-merges on inodes); symbolic links record path-strings as entry targets and are resolved as a separate phase of name resolution.
