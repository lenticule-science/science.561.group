+++
title = "Trying to View My Programming Needs Abstractly"
author = ["emsenn"]
tags = ["programming"]
draft = false
+++

I've been going through a lot of growing pains, of a sort, as I've been trying to use computers better. And because I'm coming at this, as most are, from a position of being a user seeking to do ever-more ambitious things, and not a like, person who's been handed down a problem by their supervisor, there's a lot of things that I should probably know, that I don't even know exist. And there's also a lot that I should probably know, that I'm aware of, and I just... really don't want to take the time to learn how to do it properly.

But I'm at a breaking point with one of those things, and it's learning how to more-properly use _Org-mode_ for more sophisticated of tasks. I'm no longer just looking to replace Markdown, I'm interested in shifting a lot about how I work with writing on computers.

One paradigm shift I've been moving toward is an adoption of _literate programming_. Conventionally, computer programs are written as one or more files containing line after line of computer code. Often, there's blocks, or chunks, of commentary mixed in. Lots of programming languages have tools for taking that commentary out and turning it into documentation. Pretty handy: take something written for a computer to read, and extract out a verison a human can read.

_Literate programming_ inverts that: the source code is written first for human readability, and it includes blocks of code that implement the specified functionality. Then, that code can be extracted out into something that a computer can use.

But with _Org-mode_, it also means the ability to take run the source code within the document, and take its output and render it as tables, or pass it to other blocks within the text. It's that sort of functionality I've been avoiding, as I viewed it as too hard and complicated for what I was doing.

But, now I'm at the point where I think trying to do it another way would be more complicated, more difficult, and probably get me to a less-useful final way of doing things.

I've been dabbling in _literate programming_ for the past few months though, and taking other small steps to advance my understanding of programming, like trying to come to terms with what _functional programming_ is. My first introduction to programming was with _MUDs_, specifically _LPC MUDs_, which use a more object-oriented variant of the _C_ programming language. (Lars Pesnjö's C, or _LPC_.)

So the notion of viewing code as being what works on a bunch of objects held in memory is my baseline for a computer program does. I know, to those of you with a more academic understanding of the field, that sounds ridiculous. As an analogy, it's like I saw someone make a cake and went, "Ah, making cakes, that is the sum and whole of how one can prepare food!" I understood an abstract framework for doing the thing one sort of way as the thing itself.

It's honestly been a struggle to come back from, and I wish I could express better how I got myself into that position and how I'm trying to work myself out, because I think there's a lot of people who are hobbyist developers who are in similar positions: they learned by doing and through ignorance, have to relate everything back to that and it's hard to gain a more holistic understanding from there.

Maybe it's a variation on the idiom, to understand a big truth, one must learn the little lies. It's used to explain why primary school education is so reductive; why we teach children false things like there being three phases of matter, and only introduce plasma in secondary school. (That's the only example I could think of offhand.)

I've digressed quite a bit from my point, which was that I think I'm ready to try and start thinking about _functional programming_, not just reading about it.

I briefly touched on what _object-oriented programming_ is, or at least what I understand it to be. You make some objects, things, and you give them some variables, qualities, and as your program runs, it goes "object, change this variable to this new value," and then in the future, functions will get that value when they ask the object for that variable.

_Functional programming_, treats things more like math, where input goes into functions, and output comes, well, out. There's no object maintaining a state, but data being handled between functions.

To phrase it another way, _object-oriented programming_ says you have some data, and you can tell that data to do stuff: share what it is or change itself. _Functional programming_ says that the data and what it can do are different things.

In _object-oriented programming_, you'd have a `bread` object, and it'd have some variables, like `proofMinutes = 20` and `bakeMinutes = 40`, and some functions like `get_prep_minutes`. So, you might call `bread.get_prep_minutes` and see `60` in response.

In _functional programming_, you'd have your `bread` thing, but it'd be called a _data structure_ now, I think, not an object. It'd still contain some variables, but now, `get_prep_minutes` would be its own function, outside the `bread` _data structure_. You'd do `get_prep_minutes(bread)` and see `60`.

With such a simple example, it's hard to really show how the two lead to very difficult programs, but I'm not going to construct some more complex example just to show it; there are tutorials on this topic written by folk who actually know what they're doing, or at least bothered to search for definitions as they wrote.

One way I heard it explained to me is that if you plan on adding new things to your code, you're probably better suited to go for _object-oriented programming_. When you're planning on working with one set of things, and adding new ways of working with those things, _functional programming_ is the way to go.

Writing it out, _functional programming_ seems like the obvious way to go; it seems more straight-forward, less abstract, and more in-line with my way of thinking about computers.

So how would I write functional programs then? Like, how would I specifically accomplish something I want to do? These days I do almost everything in an _Org-mode_ file, inspired by my interest in _literate programming_.

So I'd probably want to have sections defining what my _data structures_ are, and then sections for the functions, and then... explanations of how to accomplish different tasks, using those functions?

At this point I'm in this weird limbo where I think I have some understanding of the abstract, but I'm unsure about how to move forward with applying it to any specific project of mine.

One thing I've been looking at is creating a _media package channel_ for myself. I'll explain what that is briefly, to see if that leads me to an explanation of how I might implement it as a _literately-programmed_ _functional program_.

Actually, writing that sentence, I've realized something: functional programming almost means you aren't building a computer program, as a whole, but writing a specification for a _data structure_ and just, a collection of functions. I know that sounds like a tautology, but phrasing it that way helps me understand it - these are each a separate asset: each _data structure_, as well as each function.

Even though - or because - they're separate assets, they're explicitly dependent on each other, rather than the more implicit dependency of an object having the proper methods.

So, going back, a _media package channel_ is this notion I have for something like a _software package channel_, which is a collection of manifests for different _software packages_. A _media package_, is, instead, information about a piece of digital(ized) media content, such as an illustration or novel.

I've been dabbling, so I have already a rough _data structure_ for what a _media package channel_ would be; here it is implemented in _JSON_, with just one _media package_.

```json
{"brutstrap-css": {
    "name": "Brutstrap CSS",
    "creator": "emsenn",
    "license": "CC0",
    "description": "a cascading stylesheet for representing HTML content as it is constructed.",
    "versions": {
      "current": {
	  "sourcehut": {
	      "location": "https://git.sr.ht/~emsenn/brutstrap-css/blob/master/",
	      "formats": ["html","md","pdf","tex","txt"]
	  }
      }
   }
}}
```

So I guess I have a few things I have to decide on next. How am I going to choose to store data, and then, what do I want to do with the data.

What I want to do with it is fairly simple... relative to what a computer can do. Given a _channel_, _media package identifier_ (`brutstrap-css` above), _version_ (`current`), _origin_ (`sourcehut`), and _format_ (`html`, for example), return the file at \\(location + identifier + format\\).

(Ignore the switch from code formatting to math formatting there, I realized if I'm going to move toward math-y coding, I should go all-in.)

So that'd be one function, \\(getPackage(channel, identifier, version, origin, format)\\).

Which leaves me needing to know... how to store the _data structure_, how to implement the function, and how to store the output - what languages, and how specifically to do that.

Before pressing on, I'm going to open the _Org-mode Reference Manual_, because I know it has some information on this that previously went over my head, but might be more intelligible now.

I'm looking at Section 14, "Working with Source Code." I've been working with source code in _Org-mode_ for a bit now, so a lot of this will be stuff I know, but there's also a lot I ignored in my first education.

Let's make a source block - here's the _Org-mode_:

```org
#+name: src-1
#+caption: First source block
#+begin_src elisp
  (message "Hello, world.")
#+end_src
```

And after this sentence, is that above Org-mode, which'll render as an _Elisp_ source block - and because I don't have options saying otherwise, it won't be run on export, and so the results won't be included.

<a id="code-snippet--src-1"></a>
```elisp
(message "Hello, world.")
```

<div class="src-block-caption">
  <span class="src-block-number"><a href="#code-snippet--src-1">Code Snippet 1</a></span>:
  First source block
</div>

In my editor, I can run the command `org-babel-execute-src-block` (hotkey `C-c C-c`) with my cursor over the source block, and inserts this underneath it:

```org
#+RESULTS: src-1
: Hello, world.
```

The next section explains how to use header arguments - those come after the language and switches in the `#+BEGIN_SRC` line. They can also be set system-wide, with the `org-babel-default-header-args` variable, or buffer-wide within _Org-mode_ with a `#+PROPERTY: header-args` line, or within a subtree with a `header-args` property. The manual has specifics on the syntax of each.

...Woah I somehow missed it but you can do inline code blogs with the syntax `src_language[args]{code}`. Let's try that with an _Org-mode_ line: `,#+PROPERTIES: header-args :exports both`

It includes a `,` as an escape character - maybe _Org-mode_ wasn't the best language to try it with. Either way, it's not important, just a cool thing to know going forward.

If there are a lot of header arguments for a code block, it says, you can use a `#+HEADER` line. Let's change up our first source block.

Here's what I'm writing, in _Org-mode_:

```org
#+name: src-2
#+caption: Second source block
#+header: :var name="emsenn"
#+header: :exports both
#+begin_src elisp
  (message "Hello, %S" name)
#+end_src
```

I should make it clear I don't really know _Elisp_, so I'm learning that here as we go, too. I added two header lines - oh, why do I use lower-case sometimes, and all-caps the others? _Org-mode_ seems to be transitioning away from all-caps, and so I am too. But the manual often uses the old style, so I tend to when I'm writing while reading it. Anyway. The first header should assign `name` to the string `emsenn`, and the second should make it so the results are included when I export.

Here's how that code block looks, and if I did it right, it should be followed by its results:

<a id="code-snippet--src-2"></a>
```elisp
(message "Hello, %S" name)
```

<div class="src-block-caption">
  <span class="src-block-number"><a href="#code-snippet--src-2">Code Snippet 2</a></span>:
  Second source block
</div>

```text
Hello, "emsenn"
```

Alright - that did export to the rendered document like I was expecting, but the output is `Hello, "emsenn"`, which is not what I was expecting.

I don't think learning the finer points of handling strings in this way is worth sinking into right now, though; let's move on.

The last bit of the section on header arguments mentions that I can do `#+CALL:` to call a function, too. So if I do `#+CALL: src-2() :exports results`, I should get just the line, `Hello, "emsenn"`.

```text
Hello, "emsenn"
```

Simple enough.

The next section is on the "Environment of a Code Block," and starts with more information about passing arguments, and gives some examples about passing them in from a table.

Between the previous sentence and this, I had to stop to do a few hours of unrelated activities.

I think I remember pretty well where I left off though: learning to pass arguments into source blocks.

Section 14.3 of the _Org-mode Reference Manual_, "Environment of a Code Block," is about that. It starts off with an example table:

<a id="table--example-table"></a>
| 1 |
|---|
| 2 |
| 3 |
| 4 |

And a source block - I'll add `:exports both` so you can see the results, too.

<a id="code-snippet--table-length"></a>
```elisp
(length table)
```

```text
4
```

Simple enough. They give some more examples, some of which use _Python_, which I don't have right now, so I won't recreate all of them. You can pass the results of functions between each other, pass only a specific table cell as an argument, send a range, from the table...

This looks useful, you can have an _Elisp_ list and refer to specific elements of it:

<a id="code-snippet--example-list-1"></a>
```elisp
'((2 4 6 8)
  (1 3 7 9))
```

<a id="code-snippet--parse-list-1"></a>
```elisp
data
```

```text
6
```

_Elisp_ can also set the values, let's see...

\#+name parse-word-count

```elisp
filename
```

```text
"/home/emsenn/org/projects/posts/source.org"
```

The section goes on to say that code can share the same session, and set a different directory and outputting to files and lots of other stuff, but I think I've read what I need to answer some of my earlier questions:

-   How do I write my data structure for a _media package channel_?
-   How do I write a function to download a piece of content from a remote
    source, based on some variables and that channel data?
-   How do I record the returned content?

For the data structure, I should probably use whatever a dictionary is in _Elisp_.

The function will also be in _Elisp_, and it will direct its output to a new file in the specified directory.

Seems simple enough, except I don't know Elisp. Project for a fresh day.