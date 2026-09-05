+++
title = "Improving My Personal Dictionary"
author = ["emsenn"]
tags = ["elisp"]
draft = false
+++

I maintain a _personal dictionary_ within my _Emacs_ configuration. I initially started it for my fantasy writing project, because I wanted an easy way to quickly define and reference an in-universe thing, such as a town or item. I set it up without knowing an _Elisp_, but now that I know just a little _Elisp_, I'd like to re-examine my approach.

Here's an excerpt from my _Emacs configuration_, showing how the dictionary currently

```elisp
(setq org-export-global-macros
'(("ref" . "{{{define(\$1)}}} {{{source(\$1)}}}")
("define" . "{{{\$1-definition}}}")
("source" . "{{{\$1-source}}}")
("source-link" . "See [[\$1][\$1]]")
("domain-name-definition" . "A string (group of letters) defining the name of an area of the Internet.")
("domain-name-source" . "{{{source-link(https://en.wikipedia.org/wiki/Domain_name)}}}.")))
```

This lets me write `{{{ref(domain-name)}}}` and get "A string (group of letters) defining the name of an area of the Internet. See [https://en.wikipedia.org/wiki/Domain\_name](https://en.wikipedia.org/wiki/Domain%5Fname)."

Here's a breakdown of how that works:

1.  Text inside `{{{ }}}` is interpetted by _Org-mode_ as a _macro_, and replaced when the document is exported. (I think _macros_ are evaluated first in the export process, but I don't know how exporting works yet.) So, `{{{ref}}}` calls the `ref` macro defined above, and expanded into `{{{define()}}} {{{src()}}}`
    -   `\$1` is replaced by the first argument given to the macro. `\$2` would be replaced by the second. So `{{{ref(domain-name)}}}` expands to `{{{define(domain-name)}}} {{{source(domain-name)}}}`.
2.  Any _macros_ referenced in that _macro_ are evaluated, and so on. So, `{{{define(domain-name)}}} {{{source(domain-name)}}}` would expand to `{{{domain-name-definition}}} {{{domain-name-source}}}`.
3.  Then that would become `A string (group of letters) defining the name of an area of the Internet. See {{{source-link(domain-name)}}}.`
4.  That would, finally, become `A string (group of letters) defining the name of an area of the Internet. See [[https://en.wikipedia.org/wiki/Domain_name][https://en.wikipedia.org/wiki/Domain_name]].`

There are quite a few handicaps in this approach though. The biggest and most immediate is that if I don't have both macros set per term, I can't use the `ref` macro - it fails because it tries to call, eventually, `fake-term-source`, which doesn't exist.

It also pretty well forces down a structure of how referecences must be constructed, and some other issues I'm having a tough time vocalizing here.

I'm going to start by instead, writing a little draft of what I'd like a _personal dictionary entry_ to look like, as written as an _Elisp_ declaration.

<a id="code-snippet--ems-dict"></a>
```elisp
(setq ems-dict
      '(("banana"
	 ("definition" . "an elongated berry, technically")
	 ("sources"
	  ("Wikipedia" . "https://en.wikipedia.org/wiki/Banana")
	  ("Wiktionary" . "https://en.wiktionary.org/wiki/banana")))))
```

<div class="src-block-caption">
  <span class="src-block-number"><a href="#code-snippet--ems-dict">Code Snippet 1</a></span>:
  This sets the variable <code>ems-dict</code> to a list of lists, the first and only item of which is a list of information about the "banana" term.
</div>

And here's a small function to pull out the definition:

<a id="code-snippet--get-def-1"></a>
```elisp
(defun ems-get-def
    (term)
  "Return the definition of TERM from ems-dict."
  (cdr (assoc "definition" (cdr (assoc term ems-dict)))))
```

<div class="src-block-caption">
  <span class="src-block-number"><a href="#code-snippet--get-def-1">Code Snippet 2</a></span>:
  get-def-1
</div>

So if I run that function, I should get the definition of the word banana.

<a id="code-snippet--lookup-banana-1"></a>
```elisp
(ems-get-def "banana")
```

<div class="src-block-caption">
  <span class="src-block-number"><a href="#code-snippet--lookup-banana-1">Code Snippet 3</a></span>:
  lookup-banana-1
</div>

Appears to be working; but let's make a little function for capitalizing the first line of a string.

<a id="code-snippet--cap-first-char-1"></a>
```elisp
(defun ems-cap-first-char
    (&optional string)
  "Return STRING with the first character capitalized."
  (when (and string (> (length string) 0))
    (let ((first-char (substring string nil 1))
	  (rest-str (substring string 1)))
      (concat (capitalize first-char) rest-str))))
```

<div class="src-block-caption">
  <span class="src-block-number"><a href="#code-snippet--cap-first-char-1">Code Snippet 4</a></span>:
  cap-first-char-1
</div>

Here's that in-use

<a id="code-snippet--test-cap-def-1"></a>
```elisp
(ems-cap-first-char (ems-get-def "banana"))
```

<div class="src-block-caption">
  <span class="src-block-number"><a href="#code-snippet--test-cap-def-1">Code Snippet 5</a></span>:
  test-cap-def-1
</div>

This doesn't really help me in using it as a tool for referencing these terms in my writing though. For that, I'll need to set up some macros.

```elisp
(add-to-list 'org-export-global-macros
	     '("def" . "(eval (ems-get-def \$1))"))
```

So then if I write `{{{def(banana)}}}` in a sentence, I shoudl be able to get the definition. To test, below I'll write

(I've exported this source file to HTML and it says "A banana is an eloganted berry, technically." Exactly what it should say.)