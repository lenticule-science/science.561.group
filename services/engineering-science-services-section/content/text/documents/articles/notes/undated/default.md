+++
date = "{{ .Date }}"
draft = true
title = "Default"
description = "+++ date = \"{{ .Date }}\" draft = true title = \"Default\" description = \"+++ date = '{{ .Date }}' draft = true title = '{{ replace .File.ContentBaseName \\\"-\\\" \\\" \\\" | title }}' +++\" +++"
+++
