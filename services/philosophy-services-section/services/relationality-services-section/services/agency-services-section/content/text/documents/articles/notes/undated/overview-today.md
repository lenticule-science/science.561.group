---
title: Overview Today
---
## Tasks made today

```dataview
task
where created AND created = date(today)
```


## Tasks done today

```dataview
task
where completed AND completion = date(today)
```


## Records made today

```dataview
table description
from !"log"
where file.cday = date(today)
```

## Logs made today

```dataview
table description
from "log"
where file.cday = date(today)
```
