---
title: a collection of examples for ob-sed tests
description: "Note: Use -i.backup{.verbatim} instead of just -i{.verbatim} because the BSD sed{.verbatim}, unlike the GNU sed{.verbatim}, requires -i <extension>{.verbatim}."
---

# Test simple execution of sed script {#C7E7CA6A-2601-42C9-B534-4102D62E458D}

``` {#ex1 .example}
An example sentence.
```

``` {.sed stdin="ex1"}
s/n example/ processed/
2 d
```

# Test :in-file header argument {#54EC49AA-FE9F-4D58-812E-00FC87FAF562}

``` {.sed in-file="test1.txt"}
s/test/tested/
```

# Test :cmd-line header argument {#E3C6A8BA-39FF-4840-BA8E-90D5C4365AB1}

*Note:* Use `-i.backup`{.verbatim} instead of just `-i`{.verbatim} because the BSD `sed`{.verbatim}, unlike the GNU `sed`{.verbatim}, requires `-i <extension>`{.verbatim}.

``` {.sed in-file="test2.txt" cmd-line="\"-i.backup\""}
s/test/tested again/
```
