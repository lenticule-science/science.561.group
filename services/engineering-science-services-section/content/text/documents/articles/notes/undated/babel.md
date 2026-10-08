---
title: a collection of examples for Babel tests
description: This is an inline call callecho(input="testing") embedded in prose.
---

# `:noweb`{.verbatim} header argument expansion {#eb1f6498-5bd9-45e0-9c56-50717053e7b7}

``` {#noweb-example .commonlisp org-language="emacs-lisp" results="silent" exports="code"}
(message "expanded1")
```

``` {#noweb-example2 .commonlisp org-language="emacs-lisp" results="silent"}
(message "expanded2")
```

``` {.commonlisp org-language="emacs-lisp" noweb="yes" results="silent"}
;; noweb-1-yes-start
  <<noweb-example>>
```

``` {.commonlisp org-language="emacs-lisp" noweb="no" results="silent"}
;; noweb-no-start
  <<noweb-example1>>
```

``` {.commonlisp org-language="emacs-lisp" noweb="yes" results="silent"}
;; noweb-2-yes-start
  <<noweb-example2>>
```

``` {.commonlisp org-language="emacs-lisp" noweb="tangle" results="silent"}
;; noweb-tangle-start
<<noweb-example1>>
<<noweb-example2>>
```

# `:noweb`{.verbatim} header argument expansion using :exports results {#8701beb4-13d9-468c-997a-8e63e8b66f8d}

``` {.commonlisp org-language="emacs-lisp" noweb="no" exports="code"}
;; noweb-no-start
  <<noweb-example1>>
```

``` {.commonlisp org-language="emacs-lisp" noweb="tangle" exports="code"}
<<noweb-example1>>
<<noweb-example2>>
```

# excessive id links on tangling {#ef06fd7f-012b-4fde-87a2-2ae91504ea7e}

## no, don't give me an ID

``` {.commonlisp org-language="emacs-lisp" tangle="no"}
(message "not to be tangled")
```

## yes, I'd love an ID {#ae7b55ca-9ef2-4d30-bd48-da30e35fd0f3}

``` {.commonlisp org-language="emacs-lisp" tangle="no"}
(message "for tangling")
```

# simple named code block {#0d82b52d-1bb9-4916-816b-2c67c8108dbb}

``` {#i-have-a-name .commonlisp org-language="emacs-lisp"}
42
```

``` example
42
```

``` example
42
```

# Pascal's Triangle – exports both test {#92518f2a-a46a-4205-a3ab-bcce1008a4bb}

``` {#pascals-triangle .commonlisp org-language="emacs-lisp" var="n=5" exports="both"}
(defun pascals-triangle (n)
  (if (= n 0)
      (list (list 1))
    (let* ((prev-triangle (pascals-triangle (- n 1)))
           (prev-row (car (reverse prev-triangle))))
      (append prev-triangle
              (list (cl-map 'list #'+
                            (append prev-row '(0))
                            (append '(0) prev-row)))))))

(pascals-triangle n)
```

# executing an lob call line {#fab7e291-fde6-45fc-bf6e-a485b8bca2f0 header-args=":results  silent"}

This is an inline call call_echo(input="testing") embedded in prose. This is an inline call call_echo(input="testing")\[:results vector\] embedded in prose.

call_echo("testing") call_concat(1,2,3)

``` {#concat .commonlisp org-language="emacs-lisp" var="a=0" var="b=0" var="c=0"}
(format "%S%S%S" a b c)
```

# exporting an lob call line {#72ddeed3-2d17-4c7f-8192-a575d535d3fc}

``` {#double .commonlisp org-language="emacs-lisp" var="it=0"}
(* 2 it)
```

The following exports as a normal call line

Now here is an inline call call_double(it=1) stuck in the middle of some prose.

This one should not be exported `call_double(it=2)`{.verbatim} because it is quoted.

Finally this next one should export, even though it starts a line call_double(it=3) because sometimes inline blocks fold with a paragraph.

And, a call with raw results call_double(4)\[:results raw\] should not have quoted results.

The following 2\*5=call_double(5) should export even when prefixed by an = sign.

# inline source block {#54cb8dc3-298c-4883-a933-029b3c9d4b18}

Here is one in the middle `echo 1`{.bash org-language="sh"} of a line. Here is one at the end of a line. `echo 2`{.bash org-language="sh"} `echo 3`{.bash org-language="sh"} Here is one at the beginning of a line.

# exported inline source block {#cd54fc88-1b6b-45b6-8511-4d8fa7fc8076 header-args=":exports  code"}

Here is one in the middle `echo 1`{.bash org-language="sh"} of a line. Here is one at the end of a line. `echo 2`{.bash org-language="sh"} `echo 3`{.bash org-language="sh"} Here is one at the beginning of a line. Here is one that is also evaluated: `echo 4`{.bash org-language="sh" exports="both"}

# mixed blocks with exports both {#5daa4d03-e3ea-46b7-b093-62c1b7632df3}

- a
- b
- c

``` {.commonlisp org-language="emacs-lisp" exports="both"}
"code block results"
```

``` {.commonlisp org-language="emacs-lisp" var="lst=a-list" results="list" exports="both"}
(reverse lst)
```

# using the `:noweb-ref`{.verbatim} header argument {#54d68d4b-1544-4745-85ab-4f03b3cbd8a0 header-args=":noweb-sep \"\""}

``` {.bash org-language="sh" tangle="yes" noweb="yes" shebang="\"#!/bin/sh\""}
<<fullest-disk>>
```

## query all mounted disks

``` {.bash org-language="sh" noweb-ref="fullest-disk"}
df
```

## strip the header row

``` {.bash org-language="sh" noweb-ref="fullest-disk"}
|sed '1d'
```

## sort by the percent full

``` {.bash org-language="sh" noweb-ref="fullest-disk"}
|awk '{print $5 " " $6}'|sort -n |tail -1
```

## extract the mount point

``` {.bash org-language="sh" noweb-ref="fullest-disk"}
|awk '{print $2}'
```

# resolving sub-trees as references {#2409e8ba-7b5f-4678-8888-e48aa02d8cb4 header-args=":results  silent"}

``` {.commonlisp org-language="emacs-lisp" var="text=d4faa7b3-072b-4dcf-813c-dd7141c633f3"}
(length text)
```

``` {.org noweb="yes"}
<<simple-subtree>>
<<d4faa7b3-072b-4dcf-813c-dd7141c633f3>>
```

## simple subtree with custom ID {#simple-subtree}

this is simple

## simple subtree with global ID {#d4faa7b3-072b-4dcf-813c-dd7141c633f3}

has length 14

# exporting a code block with a name {#b02ddd8a-eeb8-42ab-8664-8a759e6f43d9}

exporting a code block with a name

``` {#qux .bash org-language="sh" foo="\"baz\""}
echo bar
```

# noweb no-export and exports both {#8a820f6c-7980-43db-8a24-0710d33729c9}

Weird interaction.

here is one block

and another

``` {.bash org-language="sh" noweb="no-export" exports="both"}
# I am inside the code block
<<noweb-no-export-and-exports-both-1>>
```

# in order evaluation on export {#96cc7073-97ec-4556-87cf-1f9bffafd317 header-args=":exports results"}

First.

``` {#foo-for-order-of-evaluation .commonlisp org-language="emacs-lisp" var="it=1"}
(push it *evaluation-collector*)
```

Second

``` {.commonlisp org-language="emacs-lisp"}
(push 2 *evaluation-collector*)
```

Third `(car (push 3 *evaluation-collector*))`{.commonlisp org-language="emacs-lisp"}

Fourth

Fifth

``` {.commonlisp org-language="emacs-lisp"}
(push 5 *evaluation-collector*)
```

# exporting more than just results from a call line {#bec63a04-491e-4caa-97f5-108f3020365c}

Here is a call line with more than just the results exported.

# strip noweb references on export {#8e7bd234-99b2-4b14-8cd6-53945e409775}

``` {.bash org-language="sh" noweb="strip-export" exports="code" results="silent"}
<<strip-export-1>>
echo "1$i"
```

# use case of reading entry properties {#cc5fbc20-bca5-437a-a7b8-2b4d7a03f820}

Use case checked and documented with this test: During their evaluation the source blocks read values from properties from the entry where the call has been made unless the value is overridden with the optional argument of the caller.

## section {#section a="1" c="3"}

Note: Just export of a property can be done with a macro: {{{property(a)}}}.

- sect inline call_src_block_location_shell()\[:results raw\]
- sect inline call_src_block_location_elisp()\[:results raw\]

### subsection {#subsection b="2" c="4"}

- sub0 inline call_src_block_location_shell()\[:results raw\]
- sub0 inline call_src_block_location_elisp()\[:results raw\]

<!-- -->

- sub1 inline call_src_block_location_shell(c=5, e=6)\[:results raw\]
- sub1 inline call_src_block_location_elisp(c=5, e=6)\[:results raw\]

1.  function definition

    comments for ":var":

    - The "or" is to deal with a property not present.
    - The t is to get property inheritance.

# `:file-ext`{.verbatim} and `:output-dir`{.verbatim} header args {#93573e1d-6486-442e-b6d0-3fedbdc37c9b}

``` {#file-ext-basic .commonlisp org-language="emacs-lisp" file-ext="txt"}
nil
```

``` {#file-ext-dir-relative .commonlisp org-language="emacs-lisp" file-ext="txt" output-dir="foo"}
nil
```

``` {#file-ext-dir-relative-slash .commonlisp org-language="emacs-lisp" file-ext="txt" output-dir="foo/"}
nil
```

``` {#file-ext-dir-absolute .commonlisp org-language="emacs-lisp" file-ext="txt" output-dir="/tmp"}
nil
```

``` {#file-ext-file-wins .commonlisp org-language="emacs-lisp" file-ext="txt" file="foo.bar"}
nil
```

``` {#output-dir-and-file .commonlisp org-language="emacs-lisp" output-dir="xxx" file="foo.bar"}
nil
```

# detangle

## false positive

The `[[`{.verbatim} causes a false positive which `org-babel-detangle` should handle properly

``` {.commonlisp org-language="emacs-lisp" tangle="yes"}
(string-match-p "^#[[:digit:]]+$" "#123")
```

## linked content to detangle {#73115FB0-6565-442B-BB95-50195A499EF4}

``` {.commonlisp org-language="emacs-lisp" tangle="yes" comments="link"}
```
