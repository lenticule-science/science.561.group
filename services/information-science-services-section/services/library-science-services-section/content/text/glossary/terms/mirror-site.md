---
description: A full, independently hosted, independently operated copy of a collection kept synchronized against an upstream source by a stated protocol, as documented in Project Gutenberg's own mirroring practice.
identity: mirror-site
name: Mirror Site
date-created: 2026-09-08
references:
  pglaf2000:
    authors:
      - Project Gutenberg Literary Archive Foundation
    title: Mirroring How-To
    publisher: Project Gutenberg
    year: 2000
    url: https://www.gutenberg.org/help/mirroring.html
    note: Page itself undated as observed 2026-09-08; PGLAF incorporated 2000, cited here for lack of a page-level date
relations:
  distinguished-from:
    - lots-of-copies-keep-stuff-safe
---
A mirror site, as a library and software-distribution practice, is a full, independently hosted, independently operated copy of a collection kept synchronized against one or more upstream sources by a stated protocol. Project Gutenberg's own mirroring documentation states the library-world version of this practice plainly: 'we highly recommend that you use rsync to create and refresh your mirror,' because tools like wget or curl 'need to look at all files just to get the ones that were updated recently,' and it maintains a public list of the mirrors that follow this recommendation (Project Gutenberg Literary Archive Foundation, Mirroring How-To).

A mirror site is distinguished from a Lots Of Copies Keep Stuff Safe deployment by administration and repair behavior, not by copy count: a mirror is typically pulled by its own operator, on their own schedule, from a single upstream source, and it does not itself detect or repair damage the way a LOCKSS cache cooperates with its peers to do; a set of mirrors becomes LOCKSS-safe only once its copies are administered independently of one another and of the upstream, and they actively poll and repair one another rather than simply pulling on a schedule.

Because a mirror only protects a collection to the extent its operators are independent of the upstream and of each other, a library that publishes one canonical source (for example, one git remote) and calls every read-only clone of it a mirror has not thereby achieved independent administration: an upstream outage, seizure, or policy change still determines what every purely-pulling mirror serves until an operator chooses to diverge.
