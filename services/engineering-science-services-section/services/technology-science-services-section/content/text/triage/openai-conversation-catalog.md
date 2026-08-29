Here's a list of conversations I've had with OpenAI.

- [ ] Sort [[OpenAI Conversation Catalog]] alphabetically by first link mentioned in the file.

```dataview
TABLE
  file.etags AS "Tags",
  file.outlinks AS "Links"
FROM "streams/conversations/openai"
FLATTEN file.path
SORT file.ctime desc

```
