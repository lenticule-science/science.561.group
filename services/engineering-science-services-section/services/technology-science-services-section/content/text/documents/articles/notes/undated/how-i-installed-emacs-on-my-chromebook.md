---
id: 0dd3b087-3869-4b29-b349-edc231973b8a
title: How I Installed Emacs On My Chromebook
description: After too many years with a Chromebook and limited Internet access as my normal computer environment, I'm back on a…
aliases:
  - How I Installed Emacs On My Chromebook
type: essay
visibility: public
---

After too many years with a [Chromebook](../../../../../../../computer-science-services-section/services/computer-systems-science-services-section/content/text/glossary/terms/chromebook.md) and limited [Internet access](../../../../../../../computer-science-services-section/services/computer-systems-science-services-section/services/computer-web-science-services-section/content/text/glossary/terms/internet-access.md) as my normal computer environment, I'm back on a ["real" laptop](../../../../../../../../../../content/text/documents/articles/biographies/emsenn/emsenns-omnibook.md) with a real [Internet connection](../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/internet-connection.md), and that means a return to [Emacs](../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/emacs.md). There's a lot of ways to do that; this is what felt like the simplest:

The first step in this process is [installing](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/terms/installing.md) the [Windows Subsystem for Linux](../../../../../../../computer-science-services-section/content/text/glossary/terms/windows-subsystem-for-linux.md). To do that, I opened [Windows Powershell](../../../../../../../computer-science-services-section/content/text/glossary/terms/windows-powershell.md) and input the command \`wsl –install\` which according to the output, downloaded WSL 2.5.9, installed [Ubuntu](../../../../../../../../../philosophy-services-section/content/text/glossary/terms/ubuntu.md), and went ahead and started it up for me, prompting me to input a username and password.

From there, I was already in a command-line interface for the subsystem, so ran \`sudo apt update && sudo apt upgrade\`. (To open the [CLI](../../../../../../../computer-science-services-section/services/computer-systems-science-services-section/content/text/glossary/terms/command-line-interface.md) if it's not already, I run the "Ubuntu" app.)

This next step was habit: \`sudo apt install build-essentials curl git\`

Turns out [Git](../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-code-engineering-services-section/services/computer-code-development-services-section/services/version-control-services-section/services/git-services-section/content/text/glossary/terms/git.md) and curl were already installled, and it's not like I plan on building Emacs from source, but now I have build-essentials installed for if/when I need it.

The next step is all that's actually necessary: \`sudo apt install emacs\`

This gave me a prompt to set up a mail system; I selected the option for local only, as (for now) that is true. (Though the prompt affirmed an urgency of sorting out my domain names and mail systems.)

There is one more thing I want to do, and that's symlink the \`~/org\` folder I'll put most of my digital content in with the matching folder in my Windows' users My Documents folder: \`ln -s /mnt/c/Users/emsenn/Documents/org ~/org\`

\## Earlier material

After too many years with a \[Chromebook\](../../../../../../../computer-science-services-section/content/text/glossary/terms/chromebook–002239.org.md) and limited \[Internet access\](../../../../../../../computer-science-services-section/content/text/glossary/terms/internet-access–002415.org.md) as my normal computer environment, I'm back on a \["real" laptop\](../../../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/triage/per/enc/emsenn-s-omnibook.md) with a real \[Internet connection\](../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/internet-connection.md), and that means a return to \[Emacs\](../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/emacs.md). There's a lot of ways to do that; this is what felt like the simplest:

The first step in this process is \[installing\](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/relational-systems-terms-installing-installing.md) the \[Windows Subsystem for Linux\](../../../../../../../computer-science-services-section/content/text/glossary/terms/windows-subsystem-for-linux.md). To do that, I opened \[Windows Powershell\](../../../../../../../computer-science-services-section/content/text/glossary/terms/windows-powershell.md) and input the command \\wsl –install\\ which according to the output, downloaded WSL 2.5.9, installed \[Ubuntu\](../../../../../../../../../philosophy-services-section/content/text/glossary/terms/ubuntu.md), and went ahead and started it up for me, prompting me to input a username and password.

From there, I was already in a command-line interface for the subsystem, so ran \\sudo apt update && sudo apt upgrade\\. (To open the \[CLI\](../../../../../../../computer-science-services-section/content/text/glossary/terms/command-line-interface–002255.org.md) if it's not already, I run the "Ubuntu" app.)

Turns out \[Git\](../../../../../../../computer-science-services-section/content/text/glossary/terms/git–002364.md) and curl were already installled, and it's not like I plan on building Emacs from source, but now I have build-essentials installed for if/when I need it.
