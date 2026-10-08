---
title: a collection of examples for ob-octave tests
description: Graphics file.
---

# Simple tests {#54dcd61d-cf6c-4d7a-b9e5-854953c8a753}

Number output

Array output

# Input tests {#cc2d82bb-2ac0-45be-a0c8-d1463b86a3ba}

Input an integer variable

Input an array

Input a matrix

Input a string

Input elisp nil

# Graphical tests

Graphics file. This test is performed by `ob-octave/graphics-file`{.verbatim} in `testing/lisp/test-ob-octave.el`{.verbatim}.

``` {.octave results="file graphics" file="sombrero.png"}
sombrero;
```

Graphics file in a session. This test is performed by `ob-octave/graphics-file-session`{.verbatim} in `testing/lisp/test-ob-octave.el`{.verbatim}.

``` {.octave session="yes" results="graphics file" file="sombrero.png"}
sombrero;
```

Graphics file with a space in name. This test is performed by `ob-octave/graphics-file-space`{.verbatim} in `testing/lisp/test-ob-octave.el`{.verbatim}.

``` {.octave results="graphics file" file="sombrero hat.png"}
sombrero;
```
