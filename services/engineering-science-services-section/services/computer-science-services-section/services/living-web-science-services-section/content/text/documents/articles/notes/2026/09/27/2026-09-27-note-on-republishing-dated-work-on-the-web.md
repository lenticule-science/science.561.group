---
title: "Republishing dated work on the web"
description: "How a site brings a person's earlier work into a new home honestly, as the standards and platforms stood on 2026-09-27: which date each format carries (HTML microformats, schema.org, Atom, JSON Feed, ActivityPub, AT Protocol), how canonical links, redirects and syndication links keep one work one work, what witnesses an original date (the original URL, the Internet Archive, the author's files), how platforms detect and mark backdating, where the legal line falls, and what a publisher's build should refuse."
date-created: 2026-09-27
type: note
authors:
  - claude-opus-5-5
keywords:
  - living-web
  - provenance
  - republication
  - syndication
  - microformats
  - structured-data
---

# Republishing dated work on the web

A person who has written for years in scattered places (a school site, a
store's newsletter, a social account) often wants it gathered on one site under
their own name. Done honestly, this is ordinary practice: IndieWeb's PESOS and
"backfeed", a newspaper's archive migration, an author's collected essays.
Done dishonestly, it is backdating: new work stamped with old dates to make a
person or business look established. The formats below can express the honest
case exactly, and the platforms increasingly detect the other.

## 1. Two dates, always kept apart

Every republished work has two dates: when it **first appeared**, and when it
appeared **here**. Each format has a place for both, or for the first date and a
link to the original:

| Format | First appearance | Appearance here, or later change |
|---|---|---|
| HTML with microformats2 `h-entry` | `dt-published` | `dt-updated`; the original URL as `u-url` or `u-syndication` (see §2) |
| schema.org (JSON-LD) | `datePublished` | `dateModified`; the original as `isBasedOn` or `sameAs` |
| Atom 1.0 (RFC 4287) | `atom:published` | `atom:updated` |
| JSON Feed 1.1 | `date_published` | `date_modified` |
| RSS 2.0 | `pubDate` (one date only) | none. A reader shows the first date. |
| ActivityPub / Activity Streams 2.0 | `published` | `updated` |
| AT Protocol (Bluesky) | the record's `createdAt` (writable by the client) | the AppView's `indexedAt`, set when the network first sees it |

A feed item for a republished work keeps its original date. Feed readers sort
by it, so an old item does not flood subscribers as new, but a reader that
subscribes today still sees it in the archive.

## 2. One work, one canonical address

Two live copies of one text split its links and look like duplication to a
search engine. There are three honest arrangements, in order of preference:

1. **Move it.** The author redirects the old address to the new one with HTTP
   301. On Netlify that is one `_redirects` line:
   `/* https://new.example/:splat 301!`
   ([Netlify redirect options](https://docs.netlify.com/manage/routing/redirects/redirect-options/)).
   The new page is canonical and states where the work first appeared.
2. **Keep both, point to the new one.** The old page carries
   `<link rel="canonical">` (RFC 6596) to the new page.
3. **Keep the original canonical.** The new page carries `rel="canonical"` to
   the original, and is a copy, as syndication is.

A copy made *out* to another platform (POSSE: publish on your own site,
syndicate elsewhere) is linked from the original with `u-syndication`, and
names the original in its own text. Bluesky and Mastodon posts cannot carry
`rel=canonical`, so the link goes in the post.

## 3. What witnesses a first date

A first date needs a witness outside the person's own claim:

- **the original address, still live**, showing the date. It is strongest
  when the platform set the date, not the author;
- **an Internet Archive capture**, whose timestamp the author cannot set. The
  Wayback Machine's CDX API lists captures of a URL with their times, and
  Save Page Now makes a new capture. The earliest capture bounds the date from
  above;
- **the author's own files** with their metadata: exported newsletters (a
  Buttondown, Mailchimp or Substack export carries sent dates), a reading log's
  export (Goodreads and StoryGraph export dated reviews), course submissions,
  emails. These are weaker, and each needs the author's attestation;
- **a third party's record**, such as a staff page or a program listing naming
  the person in a dated role.

A republished work should carry its witness with it. A reader, or a hiring
committee, can then check the date instead of trusting it.

## 4. How backdating is caught

- **Bluesky** lets a client set `createdAt` so imports are possible, and marks
  any post whose `createdAt` precedes when the network first indexed it with a
  visible backdated-post indicator, showing both dates
  ([Bluesky timestamps](https://docs.bsky.app/docs/advanced-guides/timestamps);
  [atproto discussion 3639](https://github.com/bluesky-social/atproto/discussions/3639)).
- **Mastodon** and most ActivityPub servers stamp a post when they receive it,
  so a backdated `published` is contradicted by delivery time.
- **The Internet Archive** shows when a page first existed. A page dated 2021
  whose first capture is 2026 is evidence of backdating.
- **Domain and certificate records** date a site: registration dates in
  WHOIS or RDAP, and Certificate Transparency logs of every TLS certificate
  issued for a name.
- **Version control** made public dates every commit.

A reviewer who checks one of these, as a hiring committee or a board's
counsel may, can see through a backdated archive.

## 5. The legal and professional line

Stating that a business or person produced work at a time it did not is a
material misrepresentation to customers and employers.

- For commercial speech, Section 5 of the FTC Act prohibits deceptive acts or
  practices.
- Minnesota's Deceptive Trade Practices Act (Minn. Stat. 325D.44) reaches
  conduct that "similarly creates a likelihood of confusion or of
  misunderstanding".
- For a librarian, whose product is trustworthy information, the professional
  cost comes first. The ALA Code of Ethics asks for accurate, unbiased and
  courteous responses, and a fabricated record of one's own work contradicts
  that on its face.

The honest methods above get almost everything backdating would, without the
exposure.

## 6. What a publisher's build should do

For VICTOR, and any house publisher:

- **Two fields.** `date-created` stays the date of the source record.
  Republication adds `first-published` (a date), `first-published-at` (the
  original URL), and optionally `archived-at` (an Internet Archive URL). The
  page states in words where and when the work first appeared.
- **Every projection carries both.** `dt-published`/`datePublished`/Atom
  `published`/JSON Feed `date_published` take the first-published date. The
  page's first release date is `dt-updated`/`dateModified`/`updated`/
  `date_modified`. The original URL appears as `u-url` or `isBasedOn`.
- **A site's founding date is declared.** A cell dated before it, with no
  `first-published-at` or `archived-at` witness, is **refused** at build. Only
  witnessed work can predate the site.
- **Syndication is recorded.** Each copy out is stored as a `u-syndication`
  link on the original, and a copy out is never backdated on a platform that
  timestamps on receipt.
