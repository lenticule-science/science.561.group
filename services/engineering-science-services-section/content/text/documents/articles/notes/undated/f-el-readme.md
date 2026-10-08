---
title: f.el
description: Much inspired by @magnarss excellent s.el and dash.el, f.el is a modern API for working with files and directories in Emacs.
---

[![](https://github.com/rejeep/f.el/actions/workflows/workflow.yml/badge.svg)](https://github.com/rejeep/f.el/actions/workflows/workflow.yml) [![](https://img.shields.io/coveralls/rejeep/f.el.svg)](https://coveralls.io/r/rejeep/f.el) [![](https://melpa.org/packages/f-badge.svg)](https://melpa.org/#/f) [![](https://stable.melpa.org/packages/f-badge.svg)](https://stable.melpa.org/#/f)

Much inspired by [@magnars](https://github.com/magnars)s excellent [s.el](https://github.com/magnars/s.el) and [dash.el](https://github.com/magnars/dash.el), [f.el](https://github.com/rejeep/f.el) is a modern API for working with files and directories in Emacs.

# Table of Contents <span class="tag" tag-name="TOC_3_gh"><span class="smallcaps">TOC_3_gh</span></span> {#table-of-contents}

- [Contributing](#contributing)
- [Documentation and examples](#documentation-and-examples)
  - [Paths](#paths)
    - [f-join](#f-join)
    - [f-split](#f-split)
    - [f-expand](#f-expand)
    - [f-filename](#f-filename)
    - [f-dirname](#f-dirname)
    - [f-common-parent](#f-common-parent)
    - [f-ext](#f-ext)
    - [f-no-ext](#f-no-ext)
    - [f-swap-ext](#f-swap-ext)
    - [f-base](#f-base)
    - [f-relative](#f-relative)
    - [f-short](#f-short)
    - [f-long](#f-long)
    - [f-canonical](#f-canonical)
    - [f-slash](#f-slash)
    - [f-full](#f-full)
    - [f-uniquify](#f-uniquify)
    - [f-uniquify-alist](#f-uniquify-alist)
  - [I/O](#io)
    - [f-read-bytes](#f-read-bytes)
    - [f-write-bytes](#f-write-bytes)
    - [f-append-bytes](#f-append-bytes)
    - [f-read-text](#f-read-text)
    - [f-write-text](#f-write-text)
    - [f-append-text](#f-append-text)
  - [Destructive](#destructive)
    - [f-mkdir](#f-mkdir)
    - [f-mkdir-full-path](#f-mkdir-full-path)
    - [f-delete](#f-delete)
    - [f-symlink](#f-symlink)
    - [f-move](#f-move)
    - [f-copy](#f-copy)
    - [f-copy-contents](#f-copy-contents)
    - [f-touch](#f-touch)
  - [Predicates](#predicates)
    - [f-exists-p](#f-exists-p)
    - [f-directory-p](#f-directory-p)
    - [f-file-p](#f-file-p)
    - [f-symlink-p](#f-symlink-p)
    - [f-readable-p](#f-readable-p)
    - [f-writable-p](#f-writable-p)
    - [f-executable-p](#f-executable-p)
    - [f-absolute-p](#f-absolute-p)
    - [f-relative-p](#f-relative-p)
    - [f-root-p](#f-root-p)
    - [f-ext-p](#f-ext-p)
    - [f-same-p](#f-same-p)
    - [f-parent-of-p](#f-parent-of-p)
    - [f-child-of-p](#f-child-of-p)
    - [f-ancestor-of-p](#f-ancestor-of-p)
    - [f-descendant-of-p](#f-descendant-of-p)
    - [f-hidden-p](#f-hidden-p)
    - [f-empty-p](#f-empty-p)
    - [f-newer-p](#f-newer-p)
    - [f-older-p](#f-older-p)
    - [f-same-time-p](#f-same-time-p)
  - [Stats](#stats)
    - [f-size](#f-size)
    - [f-depth](#f-depth)
    - [f-change-time](#f-change-time)
    - [f-modification-time](#f-modification-time)
    - [f-access-time](#f-access-time)
  - [Misc](#misc)
    - [f-this-file](#f-this-file)
    - [f-path-separator](#f-path-separator)
    - [f-glob](#f-glob)
    - [f-entries](#f-entries)
    - [f-directories](#f-directories)
    - [f-files](#f-files)
    - [f-root](#f-root)
    - [f-traverse-upwards](#f-traverse-upwards)
    - [f-with-sandbox](#f-with-sandbox)
- [Example](#example)
  - [Using standard Emacs builtin functions](#using-standard-emacs-builtin-functions)
  - [Using f.el](#using-fel)

# Contributing

Check [file:./CONTRIBUTING.org](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/emacs/references/packages/f-el/CONTRIBUTING.org)

# Documentation and examples

## Paths

### f-join

``` example
(f-join &rest args)

Join ARGS to a single path.

Be aware if one of the arguments is an absolute path, ‘f-join’
will discard all the preceeding arguments and make this absolute
path the new root of the generated path.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-join "path") ;; => "path"
(f-join "path" "to") ;; => "path/to"
(f-join "/" "path" "to" "heaven") ;; => "/path/to/heaven"
(f-join "path" "/to" "file") ;; => "/to/file"
```

### f-split

``` example
(f-split path)

Split PATH and return list containing parts.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-split "path") ;; => '("path")
(f-split "path/to") ;; => '("path" "to")
(f-split "/path/to/heaven") ;; => '("/" "path" "to" "heaven")
(f-split "~/back/to/earth") ;; => '("~" "back" "to" "earth")
```

### f-expand

``` example
(f-expand path &optional dir)

Expand PATH relative to DIR (or ‘default-directory’).
PATH and DIR can be either a directory names or directory file
names.  Return a directory name if PATH is a directory name, and
a directory file name otherwise.  File name handlers are
ignored.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-expand "name") ;; => "/default/directory/name"
(f-expand "name" "other/directory") ;; => "other/directory/name"
```

### f-filename

``` example
(f-filename path)

Return the name of PATH.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-filename "path/to/file.ext") ;; => "file.ext"
(f-filename "path/to/directory") ;; => "directory"
```

### f-dirname

``` example
(f-dirname path)

Return the parent directory to PATH.
```

Alias: `f-parent`

``` {.commonlisp org-language="emacs-lisp"}
(f-dirname "path/to/file.ext") ;; => "path/to"
(f-dirname "path/to/directory") ;; => "path/to"
(f-dirname "/") ;; => nil
```

### f-common-parent

``` example
(f-common-parent paths)

Return the deepest common parent directory of PATHS.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-common-parent '("foo/bar/baz" "foo/bar/qux" "foo/bar/mux")) ;; => "foo/bar/"
(f-common-parent '("/foo/bar/baz" "/foo/bar/qux" "/foo/bax/mux")) ;; => "/foo/"
(f-common-parent '("foo/bar/baz" "quack/bar/qux" "lack/bar/mux")) ;; => ""
```

### f-ext

``` example
(f-ext path)
```

Alias of `file-name-extension`

``` {.commonlisp org-language="emacs-lisp"}
(f-ext "path/to/file") ;; => nil
(f-ext "path/to/file.txt") ;; => txt
(f-ext "path/to/file.txt.org") ;; => org
```

### f-no-ext

``` example
(f-no-ext path)
```

Alias of `file-name-sans-extension`

``` {.commonlisp org-language="emacs-lisp"}
(f-no-ext "path/to/file") ;; => path/to/file
(f-no-ext "path/to/file.txt") ;; => path/to/file
(f-no-ext "path/to/file.txt.org") ;; => path/to/file.txt
```

### f-swap-ext

``` example
(f-swap-ext path ext)

Return PATH but with EXT as the new extension.
EXT must not be nil or empty.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-swap-ext "path/to/file.ext" "org") ;; => "path/to/file.org"
(f-swap-ext "path/to/file.ext" "") ;; => error
```

### f-base

``` example
(f-base path)

Return the name of PATH, excluding the extension of file.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-base "path/to/file.ext") ;; => "file"
(f-base "path/to/directory") ;; => nil
```

### f-relative

``` example
(f-relative path &optional dir)

Convert FILENAME to be relative to DIRECTORY (default: ‘default-directory’).
This function returns a relative file name that is equivalent to FILENAME
when used with that default directory as the default.
If FILENAME is a relative file name, it will be interpreted as existing in
‘default-directory’.
If FILENAME and DIRECTORY lie on different machines or on different drives
on a DOS/Windows machine, it returns FILENAME in expanded form.

(fn FILENAME &optional DIRECTORY)
```

``` {.commonlisp org-language="emacs-lisp"}
(f-relative "/some/path/relative/to/my/file.txt" "/some/path/") ;; => relative/to/my/file.txt
(f-relative "/default/directory/my/file.txt") ;; => my/file.txt
```

### f-short

``` example
(f-short path)
```

Alias of `abbreviate-file-name`

Alias: `f-abbrev`

``` {.commonlisp org-language="emacs-lisp"}
(f-short "/Users/foo/Code/bar") ;; => ~/Code/bar
(f-short "/path/to/Code/bar") ;; => /path/to/Code/bar
```

### f-long

``` example
(f-long path)

Return long version of PATH.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-long "~/Code/bar") ;; => /Users/foo/Code/bar
(f-long "/path/to/Code/bar") ;; => /path/to/Code/bar
```

### f-canonical

``` example
(f-canonical path)
```

Alias of `file-truename`

``` {.commonlisp org-language="emacs-lisp"}
(f-canonical "/path/to/real/file") ;; => /path/to/real/file
(f-canonical "/link/to/file") ;; => /path/to/real/file
```

### f-slash

``` example
(f-slash path)

Append slash to PATH unless one already.

Some functions, such as ‘call-process’ requires there to be an
ending slash.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-slash "/path/to/file") ;; => /path/to/file
(f-slash "/path/to/dir") ;; => /path/to/dir/
(f-slash "/path/to/dir/") ;; => /path/to/dir/
```

### f-full

``` example
(f-full path)

Return absolute path to PATH, with ending slash.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-full "~/path/to/file") ;; => /home/foo/path/to/file
(f-full "~/path/to/dir") ;; => /home/foo/path/to/dir/
(f-full "~/path/to/dir/") ;; => /home/foo/path/to/dir/
```

### f-uniquify

``` example
(f-uniquify paths)

Return unique suffixes of FILES.

This function expects no duplicate paths.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-uniquify '("/foo/bar" "/foo/baz" "/foo/quux")) ;; => '("bar" "baz" "quux")
(f-uniquify '("/foo/bar" "/www/bar" "/foo/quux")) ;; => '("foo/bar" "www/bar" "quux")
(f-uniquify '("/foo/bar" "/www/bar" "/www/bar/quux")) ;; => '("foo/bar" "www/bar" "quux")
(f-uniquify '("/foo/bar" "/foo/baz" "/home/www/bar" "/home/www/baz" "/var/foo" "/opt/foo/www/baz")) ;; => '("foo/bar" "www/bar" "foo/baz" "home/www/baz" "foo/www/baz" "foo")
```

### f-uniquify-alist

``` example
(f-uniquify-alist paths)

Return alist mapping FILES to unique suffixes of FILES.

This function expects no duplicate paths.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-uniquify-alist '("/foo/bar" "/foo/baz" "/foo/quux")) ;; => '(("/foo/bar" . "bar") ("/foo/baz" . "baz") ("/foo/quux" . "quux"))
(f-uniquify-alist '("/foo/bar" "/www/bar" "/foo/quux")) ;; => '(("/foo/bar" . "foo/bar") ("/www/bar" . "www/bar") ("/foo/quux" . "quux"))
(f-uniquify-alist '("/foo/bar" "/www/bar" "/www/bar/quux")) ;; => '(("/foo/bar" . "foo/bar") ("/www/bar" . "www/bar") ("/www/bar/quux" . "quux"))
(f-uniquify-alist '("/foo/bar" "/foo/baz" "/home/www/bar" "/home/www/baz" "/var/foo" "/opt/foo/www/baz")) ;; => '(("/foo/bar" . "foo/bar") ("/home/www/bar" . "www/bar") ("/foo/baz" . "foo/baz") ("/home/www/baz" . "home/www/baz") ("/opt/foo/www/baz" . "foo/www/baz") ("/var/foo" . "foo"))
```

## I/O

### f-read-bytes

``` example
(f-read-bytes path)

Read binary data from PATH.

Return the binary data as unibyte string.  The optional second
and third arguments BEG and END specify what portion of the file
to read.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-read-bytes "path/to/binary/data")
```

### f-write-bytes

``` example
(f-write-bytes data path)

Write binary DATA to PATH.

DATA is a unibyte string.  PATH is a file name to write to.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-write-bytes (unibyte-string 72 101 108 108 111 32 119 111 114 108 100) "path/to/binary/data")
```

### f-append-bytes

``` example
(f-append-bytes text coding path)

Append binary DATA to PATH.

If PATH does not exist, it is created.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-append-bytes "path/to/file" (unibyte-string 72 101 108 108 111 32 119 111 114 108 100))
```

### f-read-text

``` example
(f-read-text path &optional coding)

Read text with PATH, using CODING.

CODING defaults to ‘utf-8’.

Return the decoded text as multibyte string.
```

Alias: `f-read`

``` {.commonlisp org-language="emacs-lisp"}
(f-read-text "path/to/file.txt" 'utf-8)
(f-read "path/to/file.txt" 'utf-8)
```

### f-write-text

``` example
(f-write-text text coding path)

Write TEXT with CODING to PATH.

TEXT is a multibyte string.  CODING is a coding system to encode
TEXT with.  PATH is a file name to write to.
```

Alias: `f-write`

``` {.commonlisp org-language="emacs-lisp"}
(f-write-text "Hello world" 'utf-8 "path/to/file.txt")
(f-write "Hello world" 'utf-8 "path/to/file.txt")
```

### f-append-text

``` example
(f-append-text text coding path)

Append TEXT with CODING to PATH.

If PATH does not exist, it is created.
```

Alias: `f-append`

``` {.commonlisp org-language="emacs-lisp"}
(f-append-text "Hello world" 'utf-8 "path/to/file.txt")
(f-append "Hello world" 'utf-8 "path/to/file.txt")
```

## Destructive

### f-mkdir

``` example
(f-mkdir &rest dirs)

Create directories DIRS.

DIRS should be a successive list of directories forming together
a full path.  The easiest way to call this function with a fully
formed path is using ‘f-split’ alongside it:

    (apply #'f-mkdir (f-split "path/to/file"))

Although it works sometimes, it is not recommended to use fully
formed paths in the function. In this case, it is recommended to
use ‘f-mkdir-full-path’ instead.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-mkdir "dir") ;; creates /default/directory/dir
(f-mkdir "other" "dir") ;; creates /default/directory/other/dir
(f-mkdir "/" "some" "path") ;; creates /some/path
(f-mkdir "~" "yet" "another" "dir") ;; creates ~/yet/another/dir
```

### f-mkdir-full-path

``` example
(f-mkdir-full-path dir)

Create DIR from a full path.

This function is similar to ‘f-mkdir’ except it can accept a full
path instead of requiring several successive directory names.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-mkdir-full-path "dir") ;; creates /default/directory/dir
(f-mkdir-full-path "other/dir") ;; creates /default/directory/other/dir
(f-mkdir-full-path "/some/path") ;; creates /some/path
(f-mkdir-full-path "~/yet/another/dir") ;; creates ~/yet/another/dir
```

### f-delete

``` example
(f-delete path &optional force)

Delete PATH, which can be file or directory.

If FORCE is t, a directory will be deleted recursively.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-delete "dir")
(f-delete "other/dir" t)
(f-delete "path/to/file.txt")
```

### f-symlink

``` example
(f-symlink source path)

Create a symlink to SOURCE from PATH.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-symlink "path/to/source" "path/to/link")
```

### f-move

``` example
(f-move from to)

Move or rename FROM to TO.
If TO is a directory name, move FROM into TO.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-move "path/to/file.txt" "new-file.txt")
(f-move "path/to/file.txt" "other/path")
```

### f-copy

``` example
(f-copy from to)

Copy file or directory FROM to TO.
If FROM names a directory and TO is a directory name, copy FROM
into TO as a subdirectory.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-copy "path/to/file.txt" "new-file.txt")
(f-copy "path/to/dir" "other/dir")
```

### f-copy-contents

``` example
(f-copy-contents from to)

Copy contents in directory FROM, to directory TO.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-copy-contents "path/to/dir" "path/to/other/dir")
```

### f-touch

``` example
(f-touch path)

Update PATH last modification date or create if it does not exist.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-touch "path/to/existing/file.txt")
(f-touch "path/to/non/existing/file.txt")
```

## Predicates

### f-exists-p

``` example
(f-exists-p path)
```

Alias of `file-exists-p`

Alias: `f-exists?`

``` {.commonlisp org-language="emacs-lisp"}
(f-exists-p "path/to/file.txt")
(f-exists-p "path/to/dir")
```

### f-directory-p

``` example
(f-directory-p path)
```

Alias of `file-directory-p`

Aliases:

- `f-directory?`
- `f-dir-p`
- `f-dir?`

``` {.commonlisp org-language="emacs-lisp"}
(f-directory-p "path/to/file.txt") ;; => nil
(f-directory-p "path/to/dir") ;; => t
```

### f-file-p

``` example
(f-file-p path)
```

Alias of `file-regular-p`

Alias: `f-file?`

``` {.commonlisp org-language="emacs-lisp"}
(f-file-p "path/to/file.txt") ;; => t
(f-file-p "path/to/dir") ;; => nil
```

### f-symlink-p

``` example
(f-symlink-p path)

Return t if PATH is symlink, false otherwise.
```

Alias: `f-symlink?`

``` {.commonlisp org-language="emacs-lisp"}
(f-symlink-p "path/to/file.txt") ;; => nil
(f-symlink-p "path/to/dir") ;; => nil
(f-symlink-p "path/to/link") ;; => t
```

### f-readable-p

``` example
(f-readable-p path)
```

Alias of `file-readable-p`

Alias: `f-readable?`

``` {.commonlisp org-language="emacs-lisp"}
(f-readable-p "path/to/file.txt")
(f-readable-p "path/to/dir")
```

### f-writable-p

``` example
(f-writable-p path)
```

Alias of `file-writable-p`

Alias: `f-writable?`

``` {.commonlisp org-language="emacs-lisp"}
(f-writable-p "path/to/file.txt")
(f-writable-p "path/to/dir")
```

### f-executable-p

``` example
(f-executable-p path)
```

Alias of `file-executable-p`

Alias: `f-executable?`

``` {.commonlisp org-language="emacs-lisp"}
(f-executable-p "path/to/file.txt")
(f-executable-p "path/to/dir")
```

### f-absolute-p

``` example
(f-absolute-p path)
```

Alias of `file-name-absolute-p`

Alias: `f-absolute?`

``` {.commonlisp org-language="emacs-lisp"}
(f-absolute-p "path/to/dir") ;; => nil
(f-absolute-p "/full/path/to/dir") ;; => t
```

### f-relative-p

``` example
(f-relative-p path)

Return t if PATH is relative, false otherwise.
```

Alias: `f-relative?`

``` {.commonlisp org-language="emacs-lisp"}
(f-relative-p "path/to/dir") ;; => t
(f-relative-p "/full/path/to/dir") ;; => nil
```

### f-root-p

``` example
(f-root-p path)

Return t if PATH is root directory, false otherwise.
```

Alias: `f-root?`

``` {.commonlisp org-language="emacs-lisp"}
(f-root-p "/") ;; => t
(f-root-p "/not/root") ;; => nil
```

### f-ext-p

``` example
(f-ext-p path ext)

Return t if extension of PATH is EXT, false otherwise.

If EXT is nil or omitted, return t if PATH has any extension,
false otherwise.

The extension, in a file name, is the part that follows the last
’.’, excluding version numbers and backup suffixes.
```

Alias: `f-ext?`

``` {.commonlisp org-language="emacs-lisp"}
(f-ext-p "path/to/file.el" "el") ;; => t
(f-ext-p "path/to/file.el" "txt") ;; => nil
(f-ext-p "path/to/file.el") ;; => t
(f-ext-p "path/to/file") ;; => nil
```

### f-same-p

``` example
(f-same-p path-a path-b)

Return t if PATH-A and PATH-B are references to same file.
```

Aliases:

- `f-same?`
- `f-equal-p`
- `f-equal?`

``` {.commonlisp org-language="emacs-lisp"}
(f-same-p "foo.txt" "foo.txt") ;; => t
(f-same-p "/path/to/foo.txt" "/path/to/bar.txt") ;; => nil
(f-same-p "foo/bar/../baz" "foo/baz") ;; => t
```

### f-parent-of-p

``` example
(f-parent-of-p path-a path-b)

Return t if PATH-A is parent of PATH-B.
```

Alias: `f-parent-of?`

``` {.commonlisp org-language="emacs-lisp"}
(f-parent-of-p "/path/to" "/path/to/dir") ;; => t
(f-parent-of-p "/path/to/dir" "/path/to") ;; => nil
(f-parent-of-p "/path/to" "/path/to") ;; => nil
```

### f-child-of-p

``` example
(f-child-of-p path-a path-b)

Return t if PATH-A is child of PATH-B.
```

Alias: `f-child-of?`

``` {.commonlisp org-language="emacs-lisp"}
(f-child-of-p "/path/to" "/path/to/dir") ;; => nil
(f-child-of-p "/path/to/dir" "/path/to") ;; => t
(f-child-of-p "/path/to" "/path/to") ;; => nil
```

### f-ancestor-of-p

``` example
(f-ancestor-of-p path-a path-b)

Return t if PATH-A is ancestor of PATH-B.
```

Alias: `f-ancestor-of?`

``` {.commonlisp org-language="emacs-lisp"}
(f-ancestor-of-p "/path/to" "/path/to/dir") ;; => t
(f-ancestor-of-p "/path" "/path/to/dir") ;; => t
(f-ancestor-of-p "/path/to/dir" "/path/to") ;; => nil
(f-ancestor-of-p "/path/to" "/path/to") ;; => nil
```

### f-descendant-of-p

``` example
(f-descendant-of-p path-a path-b)

Return t if PATH-A is desendant of PATH-B.
```

Alias: `f-descendant-of?`

``` {.commonlisp org-language="emacs-lisp"}
(f-descendant-of-p "/path/to/dir" "/path/to") ;; => t
(f-descendant-of-p "/path/to/dir" "/path") ;; => t
(f-descendant-of-p "/path/to" "/path/to/dir") ;; => nil
(f-descendant-of-p "/path/to" "/path/to") ;; => nil
```

### f-hidden-p

``` example
(f-hidden-p path)

Return t if PATH is hidden, nil otherwise.

BEHAVIOR controls when a path should be considered as hidden
depending on its value.  Beware, if PATH begins with "./", the
current dir "." will not be considered as hidden.

When BEHAVIOR is nil, it will only check if the path begins with
a dot, as in .a/b/c, and return t if there is one.  This is the
old behavior of f.el left as default for backward-compatibility
purposes.

When BEHAVIOR is ANY, return t if any of the elements of PATH is
hidden, nil otherwise.

When BEHAVIOR is LAST, return t only if the last element of PATH
is hidden, nil otherwise.

TODO: Hidden directories and files on Windows are marked
differently than on *NIX systems.  This should be properly
implemented.
```

Alias: `f-hidden?`

``` {.commonlisp org-language="emacs-lisp"}
(f-hidden-p "path/to/foo") ;; => nil
(f-hidden-p ".path/to/foo") ;; => t
(f-hidden-p "path/.to/foo") ;; => nil
(f-hidden-p "path/to/.foo") ;; => nil
(f-hidden-p ".path/to/foo" 'any) ;; => t
(f-hidden-p "path/.to/foo" 'any) ;; => t
(f-hidden-p "path/to/.foo" 'any) ;; => t
(f-hidden-p ".path/to/foo" 'last) ;; => nil
(f-hidden-p "path/.to/foo" 'last) ;; => nil
(f-hidden-p "path/to/.foo" 'last) ;; => t
```

### f-empty-p

``` example
(f-empty-p path)

If PATH is a file, return t if the file in PATH is empty, nil otherwise.
If PATH is directory, return t if directory has no files, nil otherwise.
```

Alias: `f-empty?`

``` {.commonlisp org-language="emacs-lisp"}
(f-empty-p "/path/to/empty-file") ;; => t
(f-empty-p "/path/to/file-with-contents") ;; => nil
(f-empty-p "/path/to/empty-dir/") ;; => t
(f-empty-p "/path/to/dir-with-contents/") ;; => nil
```

### f-newer-p

``` example
(f-newer-p file other &optional method)

Compare if FILE is newer than OTHER.

For more info on METHOD, see ‘f--date-compare’.
```

Alias: `f-newer?`

``` {.commonlisp org-language="emacs-lisp"}
(f-newer-p "newer.txt" "older.txt") ;; t
(f-newer-p "older.txt""newer.txt" ) ;; nil
(f-newer-p "same1.txt" "same2.txt") ;; nil
```

### f-older-p

``` example
(f-older-p file other &optional method)

Compare if FILE is older than OTHER.

For more info on METHOD, see ‘f--date-compare’.
```

Alias: `f-older?`

``` {.commonlisp org-language="emacs-lisp"}
(f-older-p "older.txt" "newer.txt") ;; t
(f-older-p "newer.txt""older.txt" ) ;; nil
(f-older-p "same1.txt" "same2.txt") ;; nil
```

### f-same-time-p

``` example
(f-same-time-p file other &optional method)

Check if FILE and OTHER share the same access or modification time.

For more info on METHOD, see ‘f--date-compare’.
```

Alias: `f-same-time?`

``` {.commonlisp org-language="emacs-lisp"}
(f-same-time-p "same1.txt" "same2.txt") ;; t
(f-same-time-p "newer.txt" "older.txt") ;; nil
(f-same-time-p "older.txt" "newer.txt") ;; nil
```

## Stats

### f-size

``` example
(f-size path)

Return size of PATH.

If PATH is a file, return size of that file.  If PATH is
directory, return sum of all files in PATH.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-size "path/to/file.txt")
(f-size "path/to/dir")
```

### f-depth

``` example
(f-depth path)

Return the depth of PATH.

At first, PATH is expanded with ‘f-expand’.  Then the full path is used to
detect the depth.
’/’ will be zero depth,  ’/usr’ will be one depth.  And so on.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-depth "/") ;; 0
(f-depth "/var/") ;; 1
(f-depth "/usr/local/bin") ;; 3
```

### f-change-time

``` example
(f-change-time path &optional timestamp-p)

Return the last status change time of PATH.

The status change time (ctime) of PATH in the same format as
‘current-time’.  For details on TIMESTAMP-P and the format of the
returned value, see ‘f--get-time’.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-change-time "path/to/file.txt")         ;; (25517 48756 26337 111000)
(f-change-time "path/to/dir")              ;; (25517 57887 344657 210000)
(f-change-time "path/to/file.txt" t)       ;; (1672330868026337111 . 1000000000)
(f-change-time "path/to/dir" t)            ;; (1672339999344657210 . 1000000000)
(f-change-time "path/to/file.txt"'seconds) ;; 1672330868
(f-change-time "path/to/dir"'seconds)      ;; 1672339999
```

### f-modification-time

``` example
(f-modification-time path &optional timestamp-p)

Return the last modification time of PATH.
The modification time (mtime) of PATH in the same format as
‘current-time’.  For details on TIMESTAMP-P and the format of the
returned value, see ‘f--get-time’.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-modification-time "path/to/file.txt")          ;; (25517 48756 26337 111000)
(f-modification-time "path/to/dir")               ;; (25517 57887 344657 210000)
(f-modification-time "path/to/file.txt" t)        ;; (1672330868026337111 . 1000000000)
(f-modification-time "path/to/dir" t)             ;; (1672339999344657210 . 1000000000)
(f-modification-time "path/to/file.txt" 'seconds) ;; 1672330868
(f-modification-time "path/to/dir" 'seconds)      ;; 1672339999
```

### f-access-time

``` example
(f-access-time path &optional timestamp-p)

Return the last access time of PATH.
The access time (atime) of PATH is in the same format as
‘current-time’.  For details on TIMESTAMP-P and the format of the
returned value, see ‘f--get-time’.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-access-time "path/to/file.txt")          ;; (25517 48756 26337 111000)
(f-access-time "path/to/dir")               ;; (25517 57887 344657 210000)
(f-access-time "path/to/file.txt" t)        ;; (1672330868026337111 . 1000000000)
(f-access-time "path/to/dir" t)             ;; (1672339999344657210 . 1000000000)
(f-access-time "path/to/file.txt" 'seconds) ;; 1672330868
(f-access-time "path/to/dir" 'seconds)      ;; 1672339999
```

## Misc

### f-this-file

``` example
(f-this-file)

Return path to this file.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-this-file) ;; => /path/to/this/file
```

### f-path-separator

``` example
(f-path-separator)

Return path separator.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-path-separator) ;; => /
```

### f-glob

``` example
(f-glob pattern &optional path)

Find PATTERN in PATH.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-glob "path/to/*.el")
(f-glob "*.el" "path/to")
```

### f-entries

``` example
(f-entries path &optional fn recursive)

Find all files and directories in PATH.

FN - called for each found file and directory.  If FN returns a thruthy
value, file or directory will be included.
RECURSIVE - Search for files and directories recursive.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-entries "path/to/dir")
(f-entries "path/to/dir" (lambda (file) (s-matches? "test" file)))
(f-entries "path/to/dir" nil t)
(f--entries "path/to/dir" (s-matches? "test" it))
```

### f-directories

``` example
(f-directories path &optional fn recursive)

Find all directories in PATH.  See ‘f-entries’.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-directories "path/to/dir")
(f-directories "path/to/dir" (lambda (dir) (equal (f-filename dir) "test")))
(f-directories "path/to/dir" nil t)
(f--directories "path/to/dir" (equal (f-filename it) "test"))
```

### f-files

``` example
(f-files path &optional fn recursive)

Find all files in PATH.  See ‘f-entries’.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-files "path/to/dir")
(f-files "path/to/dir" (lambda (file) (equal (f-ext file) "el")))
(f-files "path/to/dir" nil t)
(f--files "path/to/dir" (equal (f-ext it) "el"))
```

### f-root

``` example
(f-root)

Return absolute root.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-root) ;; => "/"
```

### f-traverse-upwards

``` example
(f-traverse-upwards fn &optional path)

Traverse up as long as FN return nil, starting at PATH.

If FN returns a non-nil value, the path sent as argument to FN is
returned.  If no function callback return a non-nil value, nil is
returned.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-traverse-upwards
 (lambda (path)
   (f-exists? (f-expand ".git" path)))
 start-path)

(f--traverse-upwards (f-exists? (f-expand ".git" it)) start-path) ;; same as above
```

### f-with-sandbox

``` example
(f-with-sandbox path-or-paths &rest body)

Only allow PATH-OR-PATHS and descendants to be modified in BODY.
```

``` {.commonlisp org-language="emacs-lisp"}
(f-with-sandbox foo-path
  (f-touch (f-expand "foo" foo-path)))
(f-with-sandbox (list foo-path bar-path)
  (f-touch (f-expand "foo" foo-path))
  (f-touch (f-expand "bar" bar-path)))
(f-with-sandbox foo-path
  (f-touch (f-expand "bar" bar-path))) ;; "Destructive operation outside sandbox"
```

# Example

Here's an example of a function that finds the Git project root.

## Using standard Emacs builtin functions

``` {.commonlisp org-language="emacs-lisp"}
(defun find-git-root (&optional dir)
  (unless dir (setq dir (expand-file-name (file-name-directory (buffer-file-name)))))
  (let ((parent (expand-file-name ".." dir)))
    (unless (equal parent dir)
      (if (file-exists-p (expand-file-name ".git" dir))
          dir
        (find-git-root parent)))))
```

## Using f.el {#using-f.el}

``` {.commonlisp org-language="emacs-lisp"}
(defun find-git-root (&optional dir)
  (interactive)
  (unless dir (setq dir (f-dirname (buffer-file-name))))
  (let ((parent (f-parent dir)))
    (unless (f-root? parent)
      (if (f-exists? (f-expand ".git" dir))
          dir
        (find-git-root parent)))))
```

Now, try writing it even simpler yourself. Hint, check out `f-traverse-upwards`.
