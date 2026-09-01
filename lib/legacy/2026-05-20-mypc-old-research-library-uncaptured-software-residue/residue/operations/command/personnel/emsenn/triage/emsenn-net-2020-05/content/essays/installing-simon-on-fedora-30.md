+++
title = "Installing Simon on Fedora 30"
author = ["emsenn"]
date = 2019-07-04
tags = ["Simon", "Fedora"]
draft = true
+++

I'm looking to try and set up speech recognition on my Fedora system. Julius, the speech recognition engine, is way too complicated for me given my lack of knowledge on the topic. Simon, a GUI for the speech recognition engines, has a broken dependency in Fedora 30, Sphinxtrain. So I've downloaded the [source code](https://simon.kde.org/download) and installed a few packages, `cmake`, `gcc`, and `kdelibs`, which should give me the minimum required dependencies to run the application - from there maybe the GUI can help poke me toward what else I need to learn.

With those installed, the `./build.sh` script in Simon's source directory tells me that CMake can't find my compiler.