---
name: regular-file
description: A POSIX 1003.1 regular file (mode bit `S_IFREG`) — a filesystem object whose content is a sequence of bytes addressable by offset.
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

A **regular-file** is a posix-file whose mode field's type bits equal `S_IFREG` [@ieee10031-2017, §2.3].
Its content is an octet sequence of finite length; the length is recorded in the inode's `st_size` field.

Operations admissible on a regular-file beyond the posix-file base set [@ieee10031-2017, §3]:

- `read(fd, buf, n)` — copy up to `n` octets from the file into `buf`, starting at the file descriptor's current offset, advancing the offset by the number of octets read.
- `write(fd, buf, n)` — copy up to `n` octets from `buf` into the file, starting at the file descriptor's current offset, advancing the offset by the number of octets written.
  Writes past the current end of file extend the file.
- `lseek(fd, off, whence)` — set the file descriptor's current offset to a position given by `off` interpreted relative to one of `SEEK_SET` (start of file), `SEEK_CUR` (current offset), or `SEEK_END` (end of file).
- `truncate(path, length)` / `ftruncate(fd, length)` — set the length of the file to `length` bytes, padding with zero octets if `length` is greater than the current size.

A regular-file's content is uninterpreted by the kernel; interpretation of the octet sequence (as text, as an executable image, as a structured document) is the concern of programs that read it.
Two regular-files are equal as octet sequences iff their bytes match position-by-position up to their common length and they have the same length.
