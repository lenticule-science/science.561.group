+++
title = "Notes on Installing Writefreely on a Guix System"
author = ["emsenn"]
tags = ["Guix", "WriteFreely"]
draft = false
+++

Before lunch I successfully got _Nginx_ to run on my desktop computer,
which is running the _GuixSD_ operating system.

My goal is still getting a federated communication platform up, though
the more I give consideration to it, the more I think this might be
the opportunity and excuse I need to stop microblogging: maybe email
should be my federated communication platform of choice. Or,
letter-writing, which I think is probably still best implemented
through email.

That said, I would like to host my documents through a _WriteFreely_
instance, so I can be followed via _ActivityPub_, so I'm going to get on
with that, rather than shift gears from _Nginx_ to email.

So... I hate to say it but, I want to do this right, and I think that
means creating a _Guix_ package for Writefreely.

Dang. Back to the _Guix Reference Manual_, this time Section 14:
"Contributing," since it has a subsection on packaging.

This section starts with some instructions for setting up the "Perfect
Setup," which looks like it'd be really useful... if I knew more about
Emacs and such.

So I'm going to skip to 14.4, "Packaging Guidelines."

And... realize I'm way in over my head. Happenstance, I've just
received a message from [@roptat@framapiaf.org](https://framapiaf.org/@roptat) about my progress with
learning _Guix_, so I'm going to ask them if making a package is the
right way to go, before I sink my teeth into this. They've answered:

> I don't know this software, so I can't be sure. I think you will need
> to create a package for it first, and then a service. They are two
> separate things. The service-type simply uses the package defined in
> guix.
>
> For writting your first package, I suggest reading
> <https://www.gnu.org/software/guix/blog/2018/a-packaging-tutorial-for-guix/>
>
> Then you'll probably have to look at actual package definitions for go
> packages that are a bit different from gnu packages. See
> go-build-system in the manual

I asked them to explain what they meant by "[t]he service-type simply
uses the package defined in _[G]uix_," and they said:

> A service-type like `nginx-service-type` is a declaration. When the
> manual says it's from `(gnu services web)` it actually means it's a
> scheme variable that was created in a file called
> `gnu/services/web.scm`, in the Guix repo. It's much more messy than a
> package definition though… So you'll have to create the package first,
> then your service definition will make use of it.

I didn't really understand that answer, completely, but what I did
understand is: Yes, writing a package definition is the right place to
start.

Before I do that though, I'm going to just try and run it plainly -
download the latest binary, config, and run, following the
instructions here: <https://writefreely.org/start>

Which... when I try to run the binary inside that, gets me `bash:
./writefreely: No such file or directory`. The file is executable, so
this - in the past - has meant it's for 32bit and I'm on 64bit, or
vice-versa.

Running `uname -a` I see I'm on `x86_64`, and the binary is for
`amd64`. I think those are different platforms, so I guess it's time
to build the package! I was going to do that as the next step even if
the binary worked.

Writefreely's documentation on this is a bit terse:
<https://writefreely.org/docs/latest/developer/setup.md>

I need Go 1.10 or higher, and Node.js

Let's... this sounds like a good opportunity to learn how to do an
environment with _Guix_.

But, so I don't get confused later, I'm going to write down the
process ahead - I'll probably have to take a break soon, and don't
want to lose my stride:

-   First, I want to build and run WriteFreely, however I can get it to
    work, so I can learn how to do that.
    -   Learn how to make a Guix environment for tinkering in
    -   Learn how to build Writefreely
    -   Learn how to configure and run it.
-   Then, I want to write a package definition for it.
-   Then, I want to define a service for it.
-   Then, I want to... run it! I'll be running my own writefreely
    instance! That's cool!

Okay so uh... I _think_ I can just do... `guix environment` to make a
little spot to muck around it.

And then `guix install go` and `guix install node` to install those
two packages...

Hmm well even if I exit that environment I still have go installed so
clearly I did that wrong. But I don't think it really matters.

Writefreely's docs tell me to run this command:

```sh
go get -d github.com/writeas/writefreely/cmd/writefreely
```

Which holy crap fetches a lot of dependencies. Modern software is
crazy complex stacks, huh?

But then... I'm in an empty folder? But now my home directory has a
`go/` folder, which has `pkg/` and `src/` subdirectories.

Searching online got me to this:
<https://fedi.dev/gytis/build-writefreely-from-source>

Which tells me to go to `~/src/github.com/writeas/writefreely/` and `make
build`.

One problem: I don't have `make` installed as a command. I recall
reading that the `gnu-build-system` provided such tools, which would
probably inform how I accomplish the Writefreely package. But for now?
Hmm. I mean, let's try `guix install make`. It's a package, will it be
the right one?

Seems to be. I needed to also do `GOPATH=~/go` and `export
PATH="$PATH:$GOPATH/bin"`

`make build` gets me an error - apparently I don't have `as`, whatever
that is. Poking around online hints me toward installing the
`gcc-toolchain` package - I got to this issue whose t
itle mimics my
error, and then searched the _Guix Reference Manual_ for "gcc":
<https://github.com/tensorflow/tensorflow/issues/4984>
I get a new error now:

```text
In file included from /gnu/store/h90vnqw0nwd0hhm1l5dgxsdrigddfmq4-glibc-2.28/include/errno.h:28:0,
		 from cgo-gcc-prolog:29:
/gnu/store/h90vnqw0nwd0hhm1l5dgxsdrigddfmq4-glibc-2.28/include/bits/errno.h:26:26: fatal error: linux/errno.h: No such file or directory
```

Well. Sounds like maybe installing `glibc` was the wrong package?

But I'm at a loss as to... what package would be the right one. I
don't understand enough of the various compilation toolkits to be
doing more than taking guesses.

So, let's paste error messages into search engines and see what comes
up. This thread:
<https://lists.gnu.org/archive/html/bug-guix/2013-02/msg00024.html>

It says to install `linux-libre-headers`. Which tells me to remove
`glibc`. I do, and then install `linux-libre-headers` without issue.

Let's try `make build` again? Damn! Same error: `linux/errno.h: No
such file or directory`. That thread was the only result for `"guix"
"linux/errno.h: No such file or directory"` so now I'm truly at a
loss.

Well, it does sill look like it's looking in the store for glibc. Is
that perhaps the problem? Let me try garbage collecting, can't hurt.
Didn't help, though.

Omg. I'm an idiot. A skim-reading, half-illiterate idiot. So I
uninstalled linux-libre-headers and reinstalled glibc and at the end,
it says this:

```text
export CPATH="/home/emsenn/.guix-profile/include${CPATH:+:}$CPATH"
export LIBRARY_PATH="/home/emsenn/.guix-profile/lib${LIBRARY_PATH:+:}$LIBRARY_PATH"
```

So I did that and then did `make build` and, it worked.

I'm learning: read slower. It's been a big help so far in doing all
this, but gosh. It's hard - there's so much I can't understand, it's
hard to read every line.

Okay. Well, a lesson to anyone who reads this: I said I was at a loss
and kept plugging at it, and got it to work.

Moving on!

I'm using this still:
<https://fedi.dev/gytis/build-writefreely-from-source>

It says to run this command: `./cmd/writefreely/writefreely --config`

That works, takes me through the configuration process. Now, `make
run` should get me an instance running at the configured address -
`http://localhost:8080` for now.

It works! There's no stylesheet - whoops, I missed a step- `make ui`.

Which, of course, errors. I'm going to read this error. Slowly.

So I input `make ui`, and it tells me it's entering the directory
`./less/`. It then says shows me the output of the `which` command,
telling me there's no `lessc` found. That message repeats several
times.

Then it says something I can't interpret so well:

```text
node_modules/.bin/lessc app.less --clean-css="--s1 --advanced" ../static/css/write.css
/gnu/store/q19l04vd2za80mk1845pz7r8cz29qk43-bash-minimal-4.4.23/bin/sh: node_modules/.bin/lessc: No such file or directory
```

I install `node`, then do `cd less && npm install less
less-plugin-clean-css`.

I cd back into the writefreely directory and then do `make ui`. It
fails - `lessc` complains it can't find `env`. I do `which env` to see
where it is, then edit `lessc` to match.

I `make ui` again, and no errors. I `make run` and go back to
`http://localhost:8080` and... it's there and has CSS. Wonderful.

This is what my goal product is.

Except... it's complaining that it can't store cookies. Whoops - I
missed a step, between all the hopping between manuals - runnign
`writefreely --gen-keys` from within the `./writefreely` source
directory.

So. Cool! I have a functional writefreely instance.

Now I have to learn how to do that again, but... as a package.