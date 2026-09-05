:PROPERTIES:
:ID:       0dd3b087-3869-4b29-b349-edc231973b8a
:form:     [[id:495f274d-80ec-47a2-93dc-733355ef9b9c][essay]]
:public:   true
:END:
#+title: How I Installed Emacs On My Chromebook
#+date [2025-07-17 Thu 09:38]

After too many years with a [[id:9adfb0bd-644e-44ca-aff5-4414e9058185][Chromebook]] and limited [[id:9f6bf904-a2d4-4a6a-9508-cc7a2f2bec86][Internet access]] as my normal computer environment, I'm back on a [[id:b59c6255-b760-4a18-9ee2-f548c2e9c11a]["real" laptop]] with a real [[id:aa371386-8416-44ae-99f5-c2d111092e75][Internet connection]], and that means a return to [[id:6a3fc30f-fd91-4d01-b5bb-ef4f001d934a][Emacs]]. There's a lot of ways to do that; this is what felt like the simplest:

The first step in this process is [[id:e1ea6d35-c059-48c9-8086-0ec0c2c6bd1c][installing]] the [[id:173298f2-380a-477b-a408-80829f6177c8][Windows Subsystem for Linux]]. To do that, I opened [[id:cd0126e0-3150-4036-b3c8-5c426e217a0f][Windows Powershell]] and input the command `wsl --install` which according to the output, downloaded WSL 2.5.9, installed [[id:9237354f-c3e1-4e47-9e9d-5f657ecad20f][Ubuntu]], and went ahead and started it up for me, prompting me to input a username and password.

From there, I was already in a command-line interface for the subsystem, so ran `sudo apt update && sudo apt upgrade`. (To open the [[id:6db3533f-dabe-4555-8179-e4ba18ba4acc][CLI]] if it's not already, I run the "Ubuntu" app.)

This next step was habit: `sudo apt install build-essentials curl git`

Turns out [[id:841c1d45-d04a-4b6a-b16c-5604fd9a12d7][Git]] and curl were already installled, and it's not like I plan on building Emacs from source, but now I have build-essentials installed for if/when I need it.

The next step is all that's actually necessary: `sudo apt install emacs`

This gave me a prompt to set up a mail system; I selected the option for local only, as (for now) that is true. (Though the prompt affirmed an urgency of sorting out my domain names and mail systems.)

There is one more thing I want to do, and that's symlink the `~/org` folder I'll put most of my digital content in with the matching folder in my Windows' users My Documents folder: `ln -s /mnt/c/Users/emsenn/Documents/org ~/org`
