# Historical tombstone

`@coesite-operations/corpus-formation-lead-courier` is not an executable compatibility package.

Its former public courier and A2A executables depended on an unavailable SCIS release. The named current location is `@561-group/corpus-formation-lead-courier@0.1.1`, but that artifact is structurally incomplete: its manifest names `test/service.test.mjs` and no such test artifact exists. Publishing replacement behavior would therefore invent unverified formation-lead handling.

This release intentionally has no code, exports, bins, or runtime dependencies. Recovery requires a complete, tested successor artifact before any executable surface is published again.
