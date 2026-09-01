---
title: "2025-07-17, 0938h, How i installed emacs on my chromebook"
aliases:
  - "2025-07-17, 0938h, How i installed emacs on my chromebook"
  - "2025-07-17, 0938h, how i installed emacs on my chromebook"
authors:
  - emsenn
date-created: 2025-07-17T09:38:00
type: babble
tags: []
---

After too many years with a Chromebook and limited Internet access as my normal computer environment, I'm back on a "real" laptop with a real Internet connection, and that means a return to Emacs. There's a lot of ways to do that; this is what felt like the simplest:
The first step in this process is installing the Windows Subsystem for Linux. To do that, I opened Windows Powershell and input the command `wsl --install` which according to the output, downloaded WSL 2.5.9, installed Ubuntu, and went ahead and started it up for me, prompting me to input a username and password.

From there, I was already in a command-line interface for the subsystem, so ran `sudo apt update && sudo apt upgrade`. (To open the CLI if it's not already, I run the "Ubuntu" app.)

This next step was habit: `sudo apt install build-essentials curl git`

Turns out Git and curl were already installled, and it's not like I plan on building Emacs from source, but now I have build-essentials installed for if/when I need it.

The next step is all that's actually necessary: `sudo apt install emacs`

This gave me a prompt to set up a mail system; I selected the option for local only, as (for now) that is true. (Though the prompt affirmed an urgency of sorting out my domain names and mail systems.)

There is one more thing I want to do, and that's symlink the `~/org` folder I'll put most of my digital content in with the matching folder in my Windows' users My Documents folder: `ln -s /mnt/c/Users/emsenn/Documents/org ~/org`
