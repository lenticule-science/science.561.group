---
title: a collection of examples for ob-maxima tests
description: This test exercises the :graphics-pkg header argument.
---

# Simple tests {#b5842ed4-8e8b-4b18-a1c9-cef006b6a6c8}

``` {.maxima var="s=4" results="silent"}
print(s);
```

Pass a string

``` {.maxima var="fun=\"sin(x)\"" var="q=2" results="silent"}
print(diff(fun, x, q))$
```

# Graphic output

Graphic output

``` {.maxima var="a=0.5" results="graphics" file="maxima-test-sin.png"}
plot2d(sin(a*x), [x, 0, 2*%pi])$
```

``` {.maxima results="graphics" file="maxima-test-3d.png"}
plot3d (2^(-u^2 + v^2), [u, -3, 3], [v, -2, 2])$
```

## Use the `draw` package

This test exercises the `:graphics-pkg` header argument.

``` {#ob-maxima/draw .maxima var="a=0.5" results="graphics file" file="./maxima-test-cos.png" graphics-pkg="draw"}
draw2d(explicit(cos(a*x), x, -%pi, %pi))$
```

# Output to a file

Output to a file

``` {.maxima file="maxima-test-ouput.out"}
for i:1 thru 10 do print(i)$
```

# List input {#b5561c6a-73cd-453a-ba5e-62ad84844de6}

Simple list as an input

``` {.maxima var="a=(list 1 2 3)" results="silent" results="verbatim"}
print(a)$
```

``` {.maxima var="a=(list 1 (list 1 2) 3)" results="silent" results="verbatim"}
print(a+1);
```

# Table input {#400ee228-6b12-44fd-8097-7986f0f0db43}

|     |
|-----|
| 1.0 |
| 2.0 |

|     |     |
|-----|-----|
| 1.0 | 2.0 |

``` {.maxima var="s=test_tbl_col" results="silent" results="verbatim"}
print(s+1.0);
```

``` {.maxima var="s=test_tbl_row" results="silent" results="verbatim"}
print(s+1.0);
```

Matrix

|     |     |
|-----|-----|
| 1.0 | 1.0 |

``` {.maxima var="s=test_tbl_mtr" results="silent" results="verbatim"}
ms: apply(matrix, s);
print(ms);
```

# Construct a table from the output {#cc158527-b867-4b1d-8ae0-b8c713a90fd7}

``` {.maxima results="silent"}
with_stdout("/dev/null", load(numericalio))$
m: genmatrix (lambda([i,j], i+j-1), 3, 3)$
write_data(m, "/dev/stdout")$
```

# LaTeX output

``` {.maxima exports="both" results="latex" results="verbatim"}
assume(x>0);
tex(ratsimp(diff(%e^(a*x), x)));
```

# Batch {#batch header-args:maxima=":exports both :results verbatim :batch batch"}

Exercise the `:batch` header argument. These tests are also defined in `testing/lisp/test-ob-maxima.el`. The test name is name of the `ert` test.

``` {#ob-maxima/batch+verbatim .maxima}
(assume(z>0),
integrate(exp(-t)*t^z, t, 0, inf));
```

``` {#ob-maxima/batch+verbatim+quiet .maxima cmdline="--quiet"}
(assume(z>0),
integrate(exp(-t)*t^z, t, 0, inf));
```

``` {#ob-maxima/batch+verbatim+:lisp .maxima cmdline="--quiet"}
:lisp #$(assume(z>0),integrate(exp(-t)*t^z, t, 0, inf));#$
```

``` {#ob-maxima/batch+verbatim+empty-string .maxima cmdline="--quiet"}
"";
```

``` {#ob-maxima/batch+verbatim+whitespace-string .maxima cmdline="--quiet"}
" ";
```

``` {#ob-maxima/batch+verbatim+syntax-error .maxima cmdline="--quiet"}
;
```

``` {#ob-maxima/batch+verbatim+eof-error .maxima cmdline="--quiet"}
x:
```
