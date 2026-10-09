---
description: "A lookup in which the client sends only a short prefix of a value's hash and compares the returned candidates itself, so the server never learns the value and the client never receives the whole list."
identity: k-anonymity-range-query
name: k-Anonymity Range Query
date-created: 2026-09-26
references:
  hibpapi: {title: "Have I Been Pwned API v3", url: "https://haveibeenpwned.com/API/v3"}
  hunt2018: {authors: [Troy Hunt], title: "Understanding Have I Been Pwned's use of SHA-1 and k-anonymity", url: "https://www.troyhunt.com/understanding-have-i-been-pwneds-use-of-sha-1-and-k-anonymity/"}
---
In a k-anonymity range query the client hashes the value it wants to check, for
example a password or an email address. It sends only the first few characters
of that hash. The server returns every stored hash suffix that shares the
prefix, and the client checks for its own suffix locally. The server learns
only that the value is one of the many values sharing that prefix, and the
client learns nothing about any value it did not already hold.

Have I Been Pwned uses it at scale: a 5-character prefix of a SHA-1 hash for
passwords and a 6-character prefix for email addresses, because the email
corpus is larger.

It answers the harvesting objection that sank the 2004 do-not-email registry.
Nobody can enumerate the addresses on such a list; they can only confirm an
address they already have.
