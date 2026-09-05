---

title: Attempting to install TAB
author: emsenn
date-created: 2025-07-22
keywords:
  - babble
  - tooling
  - mud
publish-to:
  - emsenn-net
---

I'm going to see if I can't get TAB installed today. I did `git clone https://github.com/gaz561/tab` and then `make tab-bin` as the README.md instructed. Got an error about lacking Lua - makes sense, the README said it was necessary. Trying `sudo apt install lua` prompted me to pick between a version, 5.1 to 5.4.

No memory what TAB used, so I went for 5.4.

Did a `make clean` to try and clean things up, but I noticed it did leave directories behind. `make tab-bin` proceeded without error.

But then when I try and `make marmud` which should run the "main" development MUD, I get an error about not finding the socket module when making the timer system.

Which almost motivates me to start from scratch, grabbing technomancy's pengbot Makefile... but then I should set up Emacs to be able to help me run and write this code.

Which is a very different beast than GnoponEmacs, which has me wondering if I shouldn't make a new "emsemacs" that removes (basically all) the Org-mode stuff in favor of facilitating developing "emsoftware" - the working title for my MUD engine?

That said, I wanna sit and chew on this for a bit, because making an Emacs script that uses Org-mode and Org-roam *for* developing one specific tech project like this, might be a great move, in terms of facilitating literate programming and so on... but is something I'd definitely want to consider very carefully before beginning. Of course, the alternative is that would slow me down tremendously and it might ultimately be easier to figure out ways to integrate self-documentation in my own code, from the beginning. (Though there we get to, practically, Org-mode's interface just makes doing a lot of that easy.)

But no - I think if I can properly think it through, making it in my own code wouldn't be that hard.

I guess the question is, "How does a journal entry about a codebase, as a function?"

And that's a strange enough question that pursuing the answer - with the understanding of relational dynamics I have - might be enough to give me a good form for the rest of the stuff.

But, this then procrastinates a lot of actual work behind journaling and thinking about related concepts, which brings me back to, I should improve Org-mode and Org-roam, which brings me back to GnoponEmacs, as bloated and disorganized as it is.

So, back to trying to get emsenn.net into publishable shape, by cleaning up the GnoponEmacs source.

It looks like my first order-of-business is getting my Fediverse posts to publish. These are mirrors of what I post to `@emsenn@kolektiva.social`, but with links into my other files.

Which brings me back to thinking about how to set things up so that there is that ability, but I think I'm just, overthinking it and should get this done so I can play and tinker, not think.

