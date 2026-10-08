---
title: a collection of examples for ob-awk tests
---

# Simple tests {#9e998b2a-3581-43fe-b26d-07d3c507b86a}

Run without input stream

``` {.awk output="silent" results="silent"}
BEGIN {
    print 42
}
```

Use a code block output as an input

``` {.awk stdin="genseq" results="silent"}
{
    print 42+$1
}
```

Use input file

``` {#genfile .awk in-file="ob-awk-test.in" results="silent"}
$0~/[\t]*#/{
    # skip comments 
    next
}
{ 
    print $1*10
}
```

|     |     |     |
|-----|-----|-----|
| a   | b   | c   |

``` {.awk var="a=awk-table-input"}
BEGIN{ print a; }
```

# Input data generators

A code block to generate input stream

``` {#genseq .commonlisp org-language="emacs-lisp" results="silent"}
(print "1")
```
