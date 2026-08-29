---
name: Issue report
about: Create a report to help us improve Agda
title: ''
labels: ''
assignees: ''
---


---

Please make sure it is actually a problem with Agda or its documentation. For user questions, the [mailing list](https://lists.chalmers.se/mailman/listinfo/agda) or the [chat](https://agda.zulipchat.com) are better fora.

Please take some time to search through the existing issues whether the problem has already been reported.  If it is already an open issue, you might confine yourself with just adding your problem instance as a comment there.

For opening a new issue, please make sure you can check the following boxes:

* [ ] My report includes the version of Agda (and Emacs, GHC, and OS versions where relevant).

* [ ] The issue can be reproduced with the _latest version_ of Agda (either [released](https://wiki.portal.chalmers.se/agda/Main/Download) or `master` branch).
      Note: We do not fix issues in older versions of Agda.

* [ ] I have supplied all information so the bug can be easily reproduced (in particular, the reproducer is a complete Agda file).

Note: The best reproducers are those only using the `Agda.Builtin` and `Agda.Primitive` modules shipped with Agda.

Once you have ticked the boxes, you can delete this text (no need to include the checklist in the issue report).


---

<!-- source: archive/library/issue-templates/references/emacs/bug_report--000770.md -->

## Imported source: archive/library/issue-templates/references/emacs/bug_report--000770.md

---
name: Bug report
about: I think I have found something wrong with straight.el
title: ''
labels: bug
assignees: ''

---

## What's wrong



## Directions to reproduce

<!--
Please give instructions for how to reproduce the behavior _starting from an empty `~/.emacs.d`_. Unfortunately, I simply don't have enough time to check out your bug report unless it has clear instructions for this.

straight.el provides a macro, `straight-bug-report`, which can be used to easily create a minimal reproduction case in a clean Emacs environment. Please use this if possible. For instructions, see <https://github.com/radian-software/straight.el#debugging> and the `straight-bug-report` docstring.

If `straight-bug-report` is not available or fails you can still create a reproduction case manually. To do this, start with an empty `~/.emacs.d/init.el`, add the bootstrap snippet, and then add any additional code from your init-file that's needed to set up the buggy behavior. Then include a list of steps to follow (commands to run, files to modify, whatever) after Emacs startup.

Make sure you're using the latest version of straight.el. You can do this by including (setq straight-repository-branch "develop") in your init-file before the bootstrap snippet.

Also, unless you are already quite certain that your problem is specific to straight.el, please verify that it cannot be reproduced using package.el. If you can reproduce your problem with package.el, then it's not a bug in straight.el and I can't do anything about it!

If you try these steps and can't reproduce the problem, it must be something particular to your environment or configuration. In this case, you'll have to bisect in order to figure out what is causing the problem. I won't be able to debug a problem that only happens on your computer!
-->



### Version information

* Emacs version:
* Operating system:


---

<!-- source: archive/library/issue-templates/references/emacs/bug_report--000799.md -->

## Imported source: archive/library/issue-templates/references/emacs/bug_report--000799.md

---
title: 
name: 🪳 Bug report
about: Report a defect. Do not use this for support requests and feature suggestions.
---

Please explain
    (1) what behavior you expected
    (2) what behavior you observed
    (3) and how we can reproduce the issue.

You don't have to quote the above lines to do that.

Please include a backtrace in your report.  In most cases doing:

    M-x toggle-debug-on-error RET

and then going through the steps again should result in a backtrace.

---- now delete this line and everything above ----


---

<!-- source: archive/library/issue-templates/references/emacs/bug_report--000837.md -->

## Imported source: archive/library/issue-templates/references/emacs/bug_report--000837.md

---
title: 
name: 🪳 Report a bug
about: Report a defect. Do not use this for support requests and feature suggestions.
note: Keep in sync with wiki/How-to-report-a-bug.md
---

Please do not ignore these instructions.

If you have just updated Magit, then restart Emacs. If that does not fix the issue, then also uninstall Magit and all dependencies that were updated at the same time, restart Emacs and then reinstall Magit.

The reason why this might fix the issue is that updating a package does not cause the old version to be unloaded, so you might end up with a franken-version; a mixture of parts of the old and new version being loaded at the same time. Worse it is possible for the old version to leak into the byte-code of the new version, which is why reinstalling might help.

Please explain
    (1) what behavior you expected
    (2) what behavior you observed
    (3) and how we can reproduce the issue.

Please include a backtrace in your report.  In most cases doing:

    M-x toggle-debug-on-error RET

and then going through the steps again should result in a backtrace.

Also post the output of:

    M-x magit-version RET

Before reporting a defect please try to reproduce it using an Emacs instance in which only Magit and its dependencies have been loaded. Other packages or your configuration should not be loaded. This makes it easier to determine whether the issue lays with Magit or something else.

If you run Magit from its Git repository, then you can do so using:

    $ cd /path/to/magit
    $ make emacs-Q

Alternatively, run:

    M-x magit-emacs-Q-command RET

to save a shell command to the `kill-ring` and the system's clip-board, which you can then copy into a shell to run.

Finally, if that didn't work and you have installed Magit from Melpa, then run commands similar to the ones above, but use tab completion to replace the various Ns with the correct versions:

    $ cd ~/.emacs.d/elpa/magit-N
    $ emacs -Q --debug-init --eval '(setq debug-on-error t)' -L ../llama-N -L ../seq-N -L ../transient-N -L ../with-editor-N -L . -l magit

More debugging tools are described in the manual.

    https://magit.vc/manual/magit/Debugging-Tools.html

---- now delete this line and everything above ----


---

<!-- source: archive/library/issue-templates/references/emacs/bug_report--000897.md -->

## Imported source: archive/library/issue-templates/references/emacs/bug_report--000897.md

---
title:
name: 🐞 Bug report
about: Report a bug. Do not use this for questions, support or feature requests.
---
Thank you for reporting a bug.

Please use the latest stable release of Emacs 30.1 and start with `emacs -Q` or
`package-isolate` in order to only load a minimal set of packages. This way your
Emacs configuration is not loaded.

Make sure that you install the newest versions of the involved packages. Please
also reinstall and recompile the involved packages, ideally remove all and
reinstall all packages, to exclude compilation issues due to outdated
dependencies.

Please provide precise information, stack traces and the exact steps to
reproduce the issue. This is important to ensure that your problem can be
reproduced on a different machine.

If you are not really sure if your issue is a bug, please open a discussion
instead.


---

<!-- source: archive/library/issue-templates/references/emacs/bug_report--000907.md -->

## Imported source: archive/library/issue-templates/references/emacs/bug_report--000907.md

---
name: Bug report
about: Report an unexpected Flycheck behavior
title: ''
labels: 'kind: bug'
assignees: ''

---

Thank you for taking the time to report an issue and improve Flycheck.  This template is for **actual bugs you observed**.  If you have trouble setting up Flycheck, or if you have a question, please use the relevant issue template instead.

## Checklist

- [ ] I have checked existing issues for potential duplicates before creating this one.
- [ ] I have read the [Troubleshooting guide][].

## Bug description

A clear and concise description of what the bug is.

## Steps to reproduce

Steps to reproduce the behavior:
1. Open file '...'
2. Do '....'
3. See error

- [ ] I have read https://emacs.stackexchange.com/questions/28429/how-do-i-troubleshoot-emacs-problems

## Expected behavior

A clear and concise description of what you expected to happen.

## Screenshots

If applicable, add screenshots to help explain your problem.

## System configuration

```
Paste the output of `M-x flycheck-verify-setup` here.
```

Emacs configuration:
- [ ] Plain Emacs / Custom configuration
- [ ] Spacemacs
- [ ] Doom Emacs
- [ ] Other shared configuration

## Additional notes

Add any other context about the problem here.

[Troubleshooting guide]:  https://www.flycheck.org/en/latest/user/troubleshooting.html


---

<!-- source: archive/library/issue-templates/references/emacs/bug_report--000916.md -->

## Imported source: archive/library/issue-templates/references/emacs/bug_report--000916.md

---
title: 
name: 🪳 Bug report
about: Report a defect. Do not use this for support requests and feature suggestions.
---

Please explain
    (1) what behavior you expected
    (2) what behavior you observed
    (3) and how we can reproduce the issue.

You don't have to quote the above lines to do that.

Please include a backtrace in your report.  In most cases doing:

    M-x toggle-debug-on-error RET

and then going through the steps again should result in a backtrace.

Also post the output of:

    M-x magit-version RET

Before reporting a defect please try to reproduce it using an Emacs instance in which only Magit and its dependencies have been loaded. Other packages or your configuration should not be loaded. This makes it easier to determine whether the issue lays with Magit or something else.

---- now delete this line and everything above ----


---

<!-- source: archive/library/issue-templates/references/org-roam/bug_report--000776.md -->

## Imported source: archive/library/issue-templates/references/org-roam/bug_report--000776.md

---
name: Bug report
about: Create a report to help us improve
title: "[BUG]"
labels: bug
assignees: ThomasFKJorna

---

**Describe the bug**
A clear and concise description of what the bug is.

**To Reproduce**
Which specific things did you do which lead to said bug? E.g. what did you click, which commands did you call, etc.
1. Go to '...'
2. Click on '....'
3. Scroll down to '....'
4. See error

**Expected behavior**
A clear and concise description of what you expected to happen.

**Screenshots**
If applicable, add screenshots to help explain your problem.

**What browser were you using?**
Firefox/Chrome/Webkit

**Additional context**
Add any other context about the problem here.


---

<!-- source: archive/library/issue-templates/references/org-roam/bug_report--000815.md -->

## Imported source: archive/library/issue-templates/references/org-roam/bug_report--000815.md

---
name: Bug Report
about: Something's not working.
title: ""
labels: ""
assignees: ""
---

### Description

#### Steps to Reproduce

<!--
Example:

1. Load Emacs
2. Run `org-roam--build-cache-async`
3. Run `org-roam-find-file`
...
-->

#### Backtrace
<!--
   Will help us track and understand issues faster.
   How to provide a backtrace:
   1. M-x toggle-debug-on-error
   2. Trigger error. The debugger buffer should pop up.
   3. Copy the contents of the debugger buffer and paste here
-->

#### Expected Results

<!-- Example: File A is there -->

#### Actual Results

<!-- Example: File A is missing -->

### Environment

<!-- Please M-x org-roam-diagnostics and paste results here -->


---

<!-- source: archive/library/issue-templates/references/org-roam/bug_report--003090.md -->

## Imported source: archive/library/issue-templates/references/org-roam/bug_report--003090.md

---
name: Bug report
about: Create a report to help us improve
title: '[BUG]'
labels: bug
assignees: ThomasFKJorna
---

**Describe the bug**
A clear and concise description of what the bug is.

**To Reproduce**
Which specific things did you do which lead to said bug? E.g. what did you click, which commands did you call, etc.

1. Go to '...'
2. Click on '....'
3. Scroll down to '....'
4. See error

**Expected behavior**
A clear and concise description of what you expected to happen.

**Screenshots**
If applicable, add screenshots to help explain your problem.

**What browser were you using?**
Firefox/Chrome/Webkit

**Additional context**
Add any other context about the problem here.
