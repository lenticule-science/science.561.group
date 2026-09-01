+++
title = "Literately Programming a Fantasy World"
author = ["emsenn"]
tags = ["elisp", "Teraum"]
draft = false
+++

I have this fantasy world that I can't settle on how to implement. Stories? A novel? Tabletop role-playing game resources? Podcasts? A text-based online game? All of the above?

Of course, the ideal is all of the above but that's not realistic, and honestly my main interest, more than any of that, is in exploring the craft of building a fantasy world. By doing that, I'll stumble upon the stories and media most worth expressing myself through. I've always had an interest in codifying the world, getting it into a computer so I can make sure things make some sort of sense. At one point, I started to succeed; I made a _multi-user dimension_, or MUD, set in the world, so had a few small towns and their residents written. But they were also like, interactive, walking around the won; it was an attempt at a game, too. I think with what I'm learning with _Emacs_, _Org-mode_, and _literate programming_, I might be able to actually start accomplishing the task. This'll be awkward because I know like, nothing about _Elisp_ syntax, nor do I have any firm idea of how to accomplish what I want.

<a id="code-snippet--teraum-declaration"></a>
```elisp
(setq teraum <<whole-wide-world>>)
```

<div class="src-block-caption">
  <span class="src-block-number"><a href="#code-snippet--teraum-declaration">Code Snippet 1</a></span>:
  <code>teraum-declaration</code>
</div>

So that's simple enough, it sets up a variable that is set to the `<<whole wide world>>`, which is a macro I can write a definition for like...

<a id="code-snippet--whole-wide-world"></a>
```elisp
"foo bar"
```

<div class="src-block-caption">
  <span class="src-block-number"><a href="#code-snippet--whole-wide-world">Code Snippet 2</a></span>:
  whole-wide-world
</div>

And then I should be able to get the variable.

```elisp
(message teraum)
```

```text
foo bar
```

What if I do another block named the same, `<<whole-wide-world>>`

<a id="code-snippet--whole-wide-world"></a>
```elisp
"argle bargle"
```

What's the result this time?

```elisp
(message teraum)
```

```text
foo bar
```

Not exactly what I expected, let's try...

```elisp
(setq teraum <<whole-wide-world>>)
```

Nope, so it looks like once you've used a name, you can't reuse it. That's fine, now I know.