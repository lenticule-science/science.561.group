A Dataview of logs, most recent to oldest, tags and links used in each entry. *(Note: currently doesn't handle retroactively added logs very well.)*
```dataview
table file.etags AS "Tags", file.outlinks as "Links"
FROM "log"
FLATTEN file.path
SORT file.ctime desc
```
