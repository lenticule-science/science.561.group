#!/bin/bash

export NEW_PROJECT = project-name
mkdir $NEW_PROJECT && cd $NEW_PROJECT
git init && echo -ne '\n' | git flow init
git flow feature start $NEW_PROJECT-init
echo '#' $NEW_PROJECT >> README.md
curl 'https://www.contributor-covenant.org/version/1/4/code-of-conduct.md' > CODE_OF_CONDUCT.md
