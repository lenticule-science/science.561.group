#!/bin/ksh

mkdocs build
doas cp -R ./site/* /var/www/htdocs/emsenn.net/holistic-project-management/
