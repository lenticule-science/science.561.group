---
title: Tests for default header arguments to Babel source blocks
---

``` {#showvar .commonlisp org-language="emacs-lisp" execute="no"}
(mapconcat (lambda (n)
             (let* ((n (string (+ 48 n)))
                    (p (intern (concat "t" n))))
               (if (boundp p) (eval p) (concat "--" n))))
           (number-sequence 1 end)
           "/")
```

# Global property {#3fdadb69-5d15-411e-aad0-f7860cdd7816}

| Global                 | t1  | t2  | t3  | t4  | t5  | t6  | t7  | t8  | t9  |
|------------------------|-----|-----|-----|-----|-----|-----|-----|-----|-----|
| header-args            | gh1 | gh2 | —   | gh4 | —   | —   | —   | —   | —   |
| header-args:emacs-lisp | ge1 | —   | —   | ge4 | ge5 | —   | —   | —   | —   |
| Result                 | ge1 | gh2 | –3  | ge4 | ge5 | –6  | –7  | –8  | –9  |

``` {.commonlisp org-language="emacs-lisp" var="end=7"}
<<showvar>>
```

# Tree property

## Overwrite {#a9cdfeda-9f31-4bb5-b694-2cf452f07dfd header-args=":var t7=\"th7\"" header-args:emacs-lisp=":var t8=\"te8\"" header-args:emacs-lisp+=":results silent :noweb yes :var end=9"}

| Global                 | t1  | t2  | t3  | t4  | t5  | t6  | t7  | t8  | t9  |
|------------------------|-----|-----|-----|-----|-----|-----|-----|-----|-----|
| header-args            | gh1 | gh2 | —   | gh4 | —   | —   | —   | —   | —   |
| header-args:emacs-lisp | ge1 | —   | —   | ge4 | ge5 | —   | —   | —   | —   |
| Tree                   | t1  | t2  | t3  | t4  | t5  | t6  | t7  | t8  | t9  |
| header-args            | —   | —   | —   | —   | —   | —   | th7 | —   | —   |
| header-args:emacs-lisp | —   | —   | —   | —   | —   | —   | —   | te8 | —   |
| Result \#+CALL         | ge1 | gh2 | –3  | ge4 | ge5 | –6  | th7 | te8 | –9  |
| Result noweb           | –1  | –2  | –3  | –4  | –5  | –6  | th7 | te8 | –9  |

``` {.commonlisp org-language="emacs-lisp"}
<<showvar>>
```

## Accumulate {#1d97d258-fd50-4107-a095-e4625bffc57b header-args+=":var t2=\"th2\" t3=\"th3\"" header-args:emacs-lisp+=":var t5=\"te5\" end=8"}

| Global                  | t1  | t2  | t3  | t4  | t5  | t6  | t7  | t8  | t9  |
|-------------------------|-----|-----|-----|-----|-----|-----|-----|-----|-----|
| header-args             | gh1 | gh2 | —   | gh4 | —   | —   | —   | —   | —   |
| header-args:emacs-lisp  | ge1 | —   | —   | ge4 | ge5 | —   | —   | —   | —   |
| Tree                    | t1  | t2  | t3  | t4  | t5  | t6  | t7  | t8  | t9  |
| header-args+            | —   | th2 | th3 | —   | —   | —   | —   | —   | —   |
| header-args:emacs-lisp+ | —   | —   | —   | —   | te5 | —   | —   | —   | —   |
| Result \#+CALL          | ge1 | th2 | th3 | ge4 | te5 | –6  | –7  | –8  | –9  |
| Result noweb            | ge1 | th2 | th3 | ge4 | te5 | –6  | –7  | –8  | –9  |

``` {.commonlisp org-language="emacs-lisp"}
<<showvar>>
```

## Complex {#fa0e912d-d9b4-47b0-9f9e-1cbb39f7cbc2 header-args+=":var t2=\"th2\"" header-args:emacs-lisp=":var t5=\"te5\" end=7" header-args:emacs-lisp+=":results silent :noweb yes :var end=9"}

| Global                 | t1  | t2  | t3  | t4  | t5  | t6  | t7  | t8  | t9  |
|------------------------|-----|-----|-----|-----|-----|-----|-----|-----|-----|
| header-args            | gh1 | gh2 | —   | gh4 | —   | —   | —   | —   | —   |
| header-args:emacs-lisp | ge1 | —   | —   | ge4 | ge5 | —   | —   | —   | —   |
| Tree                   | t1  | t2  | t3  | t4  | t5  | t6  | t7  | t8  | t9  |
| header-args+           | —   | th2 | —   | —   | —   | —   | —   | —   | —   |
| header-args:emacs-lisp | —   | —   | —   | —   | te5 | —   | —   | —   | —   |
| Result \#+CALL         | gh1 | th2 | go3 | gh4 | te5 | –6  | –7  | –8  | –9  |
| Result noweb           | gh1 | th2 | –3  | gh4 | te5 | –6  | –7  | –8  | –9  |

``` {.commonlisp org-language="emacs-lisp"}
<<showvar>>
```
