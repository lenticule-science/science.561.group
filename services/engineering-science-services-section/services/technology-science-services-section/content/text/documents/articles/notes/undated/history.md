---
title: History
description: This release only changed documentation.
---
1.3.8 / 2022-02-02
==================

  * deps: mime-types@~2.1.34
    - deps: mime-db@~1.51.0
  * deps: negotiator@0.6.3

1.3.7 / 2019-04-29
==================

  * deps: negotiator@0.6.2
    - Fix sorting charset, encoding, and language with extra parameters

1.3.6 / 2019-04-28
==================

  * deps: mime-types@~2.1.24
    - deps: mime-db@~1.40.0

1.3.5 / 2018-02-28
==================

  * deps: mime-types@~2.1.18
    - deps: mime-db@~1.33.0

1.3.4 / 2017-08-22
==================

  * deps: mime-types@~2.1.16
    - deps: mime-db@~1.29.0

1.3.3 / 2016-05-02
==================

  * deps: mime-types@~2.1.11
    - deps: mime-db@~1.23.0
  * deps: negotiator@0.6.1
    - perf: improve `Accept` parsing speed
    - perf: improve `Accept-Charset` parsing speed
    - perf: improve `Accept-Encoding` parsing speed
    - perf: improve `Accept-Language` parsing speed

1.3.2 / 2016-03-08
==================

  * deps: mime-types@~2.1.10
    - Fix extension of `application/dash+xml`
    - Update primary extension for `audio/mp4`
    - deps: mime-db@~1.22.0

1.3.1 / 2016-01-19
==================

  * deps: mime-types@~2.1.9
    - deps: mime-db@~1.21.0

1.3.0 / 2015-09-29
==================

  * deps: mime-types@~2.1.7
    - deps: mime-db@~1.19.0
  * deps: negotiator@0.6.0
    - Fix including type extensions in parameters in `Accept` parsing
    - Fix parsing `Accept` parameters with quoted equals
    - Fix parsing `Accept` parameters with quoted semicolons
    - Lazy-load modules from main entry point
    - perf: delay type concatenation until needed
    - perf: enable strict mode
    - perf: hoist regular expressions
    - perf: remove closures getting spec properties
    - perf: remove a closure from media type parsing
    - perf: remove property delete from media type parsing

1.2.13 / 2015-09-06
===================

  * deps: mime-types@~2.1.6
    - deps: mime-db@~1.18.0

1.2.12 / 2015-07-30
===================

  * deps: mime-types@~2.1.4
    - deps: mime-db@~1.16.0

1.2.11 / 2015-07-16
===================

  * deps: mime-types@~2.1.3
    - deps: mime-db@~1.15.0

1.2.10 / 2015-07-01
===================

  * deps: mime-types@~2.1.2
    - deps: mime-db@~1.14.0

1.2.9 / 2015-06-08
==================

  * deps: mime-types@~2.1.1
    - perf: fix deopt during mapping

1.2.8 / 2015-06-07
==================

  * deps: mime-types@~2.1.0
    - deps: mime-db@~1.13.0
  * perf: avoid argument reassignment & argument slice
  * perf: avoid negotiator recursive construction
  * perf: enable strict mode
  * perf: remove unnecessary bitwise operator

1.2.7 / 2015-05-10
==================

  * deps: negotiator@0.5.3
    - Fix media type parameter matching to be case-insensitive

1.2.6 / 2015-05-07
==================

  * deps: mime-types@~2.0.11
    - deps: mime-db@~1.9.1
  * deps: negotiator@0.5.2
    - Fix comparing media types with quoted values
    - Fix splitting media types with quoted commas

1.2.5 / 2015-03-13
==================

  * deps: mime-types@~2.0.10
    - deps: mime-db@~1.8.0

1.2.4 / 2015-02-14
==================

  * Support Node.js 0.6
  * deps: mime-types@~2.0.9
    - deps: mime-db@~1.7.0
  * deps: negotiator@0.5.1
    - Fix preference sorting to be stable for long acceptable lists

1.2.3 / 2015-01-31
==================

  * deps: mime-types@~2.0.8
    - deps: mime-db@~1.6.0

1.2.2 / 2014-12-30
==================

  * deps: mime-types@~2.0.7
    - deps: mime-db@~1.5.0

1.2.1 / 2014-12-30
==================

  * deps: mime-types@~2.0.5
    - deps: mime-db@~1.3.1

1.2.0 / 2014-12-19
==================

  * deps: negotiator@0.5.0
    - Fix list return order when large accepted list
    - Fix missing identity encoding when q=0 exists
    - Remove dynamic building of Negotiator class

1.1.4 / 2014-12-10
==================

  * deps: mime-types@~2.0.4
    - deps: mime-db@~1.3.0

1.1.3 / 2014-11-09
==================

  * deps: mime-types@~2.0.3
    - deps: mime-db@~1.2.0

1.1.2 / 2014-10-14
==================

  * deps: negotiator@0.4.9
    - Fix error when media type has invalid parameter

1.1.1 / 2014-09-28
==================

  * deps: mime-types@~2.0.2
    - deps: mime-db@~1.1.0
  * deps: negotiator@0.4.8
    - Fix all negotiations to be case-insensitive
    - Stable sort preferences of same quality according to client order

1.1.0 / 2014-09-02
==================

  * update `mime-types`

1.0.7 / 2014-07-04
==================

  * Fix wrong type returned from `type` when match after unknown extension

1.0.6 / 2014-06-24
==================

  * deps: negotiator@0.4.7

1.0.5 / 2014-06-20
==================

 * fix crash when unknown extension given

1.0.4 / 2014-06-19
==================

  * use `mime-types`

1.0.3 / 2014-06-11
==================

  * deps: negotiator@0.4.6
    - Order by specificity when quality is the same

1.0.2 / 2014-05-29
==================

  * Fix interpretation when header not in request
  * deps: pin negotiator@0.4.5

1.0.1 / 2014-01-18
==================

  * Identity encoding isn't always acceptable
  * deps: negotiator@~0.4.0

1.0.0 / 2013-12-27
==================

  * Genesis


---

<!-- source: archive/library/javascript/references/packages/body-parser/HISTORY--000383.md -->

## Imported source: archive/library/javascript/references/packages/body-parser/HISTORY--000383.md

1.20.3 / 2024-09-10
===================

  * deps: qs@6.13.0
  * add `depth` option to customize the depth level in the parser
  * IMPORTANT: The default `depth` level for parsing URL-encoded data is now `32` (previously was `Infinity`)

1.20.2 / 2023-02-21
===================

  * Fix strict json error message on Node.js 19+
  * deps: content-type@~1.0.5
    - perf: skip value escaping when unnecessary
  * deps: raw-body@2.5.2

1.20.1 / 2022-10-06
===================

  * deps: qs@6.11.0
  * perf: remove unnecessary object clone

1.20.0 / 2022-04-02
===================

  * Fix error message for json parse whitespace in `strict`
  * Fix internal error when inflated body exceeds limit
  * Prevent loss of async hooks context
  * Prevent hanging when request already read
  * deps: depd@2.0.0
    - Replace internal `eval` usage with `Function` constructor
    - Use instance methods on `process` to check for listeners
  * deps: http-errors@2.0.0
    - deps: depd@2.0.0
    - deps: statuses@2.0.1
  * deps: on-finished@2.4.1
  * deps: qs@6.10.3
  * deps: raw-body@2.5.1
    - deps: http-errors@2.0.0

1.19.2 / 2022-02-15
===================

  * deps: bytes@3.1.2
  * deps: qs@6.9.7
    * Fix handling of `__proto__` keys
  * deps: raw-body@2.4.3
    - deps: bytes@3.1.2

1.19.1 / 2021-12-10
===================

  * deps: bytes@3.1.1
  * deps: http-errors@1.8.1
    - deps: inherits@2.0.4
    - deps: toidentifier@1.0.1
    - deps: setprototypeof@1.2.0
  * deps: qs@6.9.6
  * deps: raw-body@2.4.2
    - deps: bytes@3.1.1
    - deps: http-errors@1.8.1
  * deps: safe-buffer@5.2.1
  * deps: type-is@~1.6.18

1.19.0 / 2019-04-25
===================

  * deps: bytes@3.1.0
    - Add petabyte (`pb`) support
  * deps: http-errors@1.7.2
    - Set constructor name when possible
    - deps: setprototypeof@1.1.1
    - deps: statuses@'>= 1.5.0 < 2'
  * deps: iconv-lite@0.4.24
    - Added encoding MIK
  * deps: qs@6.7.0
    - Fix parsing array brackets after index
  * deps: raw-body@2.4.0
    - deps: bytes@3.1.0
    - deps: http-errors@1.7.2
    - deps: iconv-lite@0.4.24
  * deps: type-is@~1.6.17
    - deps: mime-types@~2.1.24
    - perf: prevent internal `throw` on invalid type

1.18.3 / 2018-05-14
===================

  * Fix stack trace for strict json parse error
  * deps: depd@~1.1.2
    - perf: remove argument reassignment
  * deps: http-errors@~1.6.3
    - deps: depd@~1.1.2
    - deps: setprototypeof@1.1.0
    - deps: statuses@'>= 1.3.1 < 2'
  * deps: iconv-lite@0.4.23
    - Fix loading encoding with year appended
    - Fix deprecation warnings on Node.js 10+
  * deps: qs@6.5.2
  * deps: raw-body@2.3.3
    - deps: http-errors@1.6.3
    - deps: iconv-lite@0.4.23
  * deps: type-is@~1.6.16
    - deps: mime-types@~2.1.18

1.18.2 / 2017-09-22
===================

  * deps: debug@2.6.9
  * perf: remove argument reassignment

1.18.1 / 2017-09-12
===================

  * deps: content-type@~1.0.4
    - perf: remove argument reassignment
    - perf: skip parameter parsing when no parameters
  * deps: iconv-lite@0.4.19
    - Fix ISO-8859-1 regression
    - Update Windows-1255
  * deps: qs@6.5.1
    - Fix parsing & compacting very deep objects
  * deps: raw-body@2.3.2
    - deps: iconv-lite@0.4.19

1.18.0 / 2017-09-08
===================

  * Fix JSON strict violation error to match native parse error
  * Include the `body` property on verify errors
  * Include the `type` property on all generated errors
  * Use `http-errors` to set status code on errors
  * deps: bytes@3.0.0
  * deps: debug@2.6.8
  * deps: depd@~1.1.1
    - Remove unnecessary `Buffer` loading
  * deps: http-errors@~1.6.2
    - deps: depd@1.1.1
  * deps: iconv-lite@0.4.18
    - Add support for React Native
    - Add a warning if not loaded as utf-8
    - Fix CESU-8 decoding in Node.js 8
    - Improve speed of ISO-8859-1 encoding
  * deps: qs@6.5.0
  * deps: raw-body@2.3.1
    - Use `http-errors` for standard emitted errors
    - deps: bytes@3.0.0
    - deps: iconv-lite@0.4.18
    - perf: skip buffer decoding on overage chunk
  * perf: prevent internal `throw` when missing charset

1.17.2 / 2017-05-17
===================

  * deps: debug@2.6.7
    - Fix `DEBUG_MAX_ARRAY_LENGTH`
    - deps: ms@2.0.0
  * deps: type-is@~1.6.15
    - deps: mime-types@~2.1.15

1.17.1 / 2017-03-06
===================

  * deps: qs@6.4.0
    - Fix regression parsing keys starting with `[`

1.17.0 / 2017-03-01
===================

  * deps: http-errors@~1.6.1
    - Make `message` property enumerable for `HttpError`s
    - deps: setprototypeof@1.0.3
  * deps: qs@6.3.1
    - Fix compacting nested arrays

1.16.1 / 2017-02-10
===================

  * deps: debug@2.6.1
    - Fix deprecation messages in WebStorm and other editors
    - Undeprecate `DEBUG_FD` set to `1` or `2`

1.16.0 / 2017-01-17
===================

  * deps: debug@2.6.0
    - Allow colors in workers
    - Deprecated `DEBUG_FD` environment variable
    - Fix error when running under React Native
    - Use same color for same namespace
    - deps: ms@0.7.2
  * deps: http-errors@~1.5.1
    - deps: inherits@2.0.3
    - deps: setprototypeof@1.0.2
    - deps: statuses@'>= 1.3.1 < 2'
  * deps: iconv-lite@0.4.15
    - Added encoding MS-31J
    - Added encoding MS-932
    - Added encoding MS-936
    - Added encoding MS-949
    - Added encoding MS-950
    - Fix GBK/GB18030 handling of Euro character
  * deps: qs@6.2.1
    - Fix array parsing from skipping empty values
  * deps: raw-body@~2.2.0
    - deps: iconv-lite@0.4.15
  * deps: type-is@~1.6.14
    - deps: mime-types@~2.1.13

1.15.2 / 2016-06-19
===================

  * deps: bytes@2.4.0
  * deps: content-type@~1.0.2
    - perf: enable strict mode
  * deps: http-errors@~1.5.0
    - Use `setprototypeof` module to replace `__proto__` setting
    - deps: statuses@'>= 1.3.0 < 2'
    - perf: enable strict mode
  * deps: qs@6.2.0
  * deps: raw-body@~2.1.7
    - deps: bytes@2.4.0
    - perf: remove double-cleanup on happy path
  * deps: type-is@~1.6.13
    - deps: mime-types@~2.1.11

1.15.1 / 2016-05-05
===================

  * deps: bytes@2.3.0
    - Drop partial bytes on all parsed units
    - Fix parsing byte string that looks like hex
  * deps: raw-body@~2.1.6
    - deps: bytes@2.3.0
  * deps: type-is@~1.6.12
    - deps: mime-types@~2.1.10

1.15.0 / 2016-02-10
===================

  * deps: http-errors@~1.4.0
    - Add `HttpError` export, for `err instanceof createError.HttpError`
    - deps: inherits@2.0.1
    - deps: statuses@'>= 1.2.1 < 2'
  * deps: qs@6.1.0
  * deps: type-is@~1.6.11
    - deps: mime-types@~2.1.9

1.14.2 / 2015-12-16
===================

  * deps: bytes@2.2.0
  * deps: iconv-lite@0.4.13
  * deps: qs@5.2.0
  * deps: raw-body@~2.1.5
    - deps: bytes@2.2.0
    - deps: iconv-lite@0.4.13
  * deps: type-is@~1.6.10
    - deps: mime-types@~2.1.8

1.14.1 / 2015-09-27
===================

  * Fix issue where invalid charset results in 400 when `verify` used
  * deps: iconv-lite@0.4.12
    - Fix CESU-8 decoding in Node.js 4.x
  * deps: raw-body@~2.1.4
    - Fix masking critical errors from `iconv-lite`
    - deps: iconv-lite@0.4.12
  * deps: type-is@~1.6.9
    - deps: mime-types@~2.1.7

1.14.0 / 2015-09-16
===================

  * Fix JSON strict parse error to match syntax errors
  * Provide static `require` analysis in `urlencoded` parser
  * deps: depd@~1.1.0
    - Support web browser loading
  * deps: qs@5.1.0
  * deps: raw-body@~2.1.3
    - Fix sync callback when attaching data listener causes sync read
  * deps: type-is@~1.6.8
    - Fix type error when given invalid type to match against
    - deps: mime-types@~2.1.6

1.13.3 / 2015-07-31
===================

  * deps: type-is@~1.6.6
    - deps: mime-types@~2.1.4

1.13.2 / 2015-07-05
===================

  * deps: iconv-lite@0.4.11
  * deps: qs@4.0.0
    - Fix dropping parameters like `hasOwnProperty`
    - Fix user-visible incompatibilities from 3.1.0
    - Fix various parsing edge cases
  * deps: raw-body@~2.1.2
    - Fix error stack traces to skip `makeError`
    - deps: iconv-lite@0.4.11
  * deps: type-is@~1.6.4
    - deps: mime-types@~2.1.2
    - perf: enable strict mode
    - perf: remove argument reassignment

1.13.1 / 2015-06-16
===================

  * deps: qs@2.4.2
    - Downgraded from 3.1.0 because of user-visible incompatibilities

1.13.0 / 2015-06-14
===================

  * Add `statusCode` property on `Error`s, in addition to `status`
  * Change `type` default to `application/json` for JSON parser
  * Change `type` default to `application/x-www-form-urlencoded` for urlencoded parser
  * Provide static `require` analysis
  * Use the `http-errors` module to generate errors
  * deps: bytes@2.1.0
    - Slight optimizations
  * deps: iconv-lite@0.4.10
    - The encoding UTF-16 without BOM now defaults to UTF-16LE when detection fails
    - Leading BOM is now removed when decoding
  * deps: on-finished@~2.3.0
    - Add defined behavior for HTTP `CONNECT` requests
    - Add defined behavior for HTTP `Upgrade` requests
    - deps: ee-first@1.1.1
  * deps: qs@3.1.0
    - Fix dropping parameters like `hasOwnProperty`
    - Fix various parsing edge cases
    - Parsed object now has `null` prototype
  * deps: raw-body@~2.1.1
    - Use `unpipe` module for unpiping requests
    - deps: iconv-lite@0.4.10
  * deps: type-is@~1.6.3
    - deps: mime-types@~2.1.1
    - perf: reduce try block size
    - perf: remove bitwise operations
  * perf: enable strict mode
  * perf: remove argument reassignment
  * perf: remove delete call

1.12.4 / 2015-05-10
===================

  * deps: debug@~2.2.0
  * deps: qs@2.4.2
    - Fix allowing parameters like `constructor`
  * deps: on-finished@~2.2.1
  * deps: raw-body@~2.0.1
    - Fix a false-positive when unpiping in Node.js 0.8
    - deps: bytes@2.0.1
  * deps: type-is@~1.6.2
    - deps: mime-types@~2.0.11

1.12.3 / 2015-04-15
===================

  * Slight efficiency improvement when not debugging
  * deps: depd@~1.0.1
  * deps: iconv-lite@0.4.8
    - Add encoding alias UNICODE-1-1-UTF-7
  * deps: raw-body@1.3.4
    - Fix hanging callback if request aborts during read
    - deps: iconv-lite@0.4.8

1.12.2 / 2015-03-16
===================

  * deps: qs@2.4.1
    - Fix error when parameter `hasOwnProperty` is present

1.12.1 / 2015-03-15
===================

  * deps: debug@~2.1.3
    - Fix high intensity foreground color for bold
    - deps: ms@0.7.0
  * deps: type-is@~1.6.1
    - deps: mime-types@~2.0.10

1.12.0 / 2015-02-13
===================

  * add `debug` messages
  * accept a function for the `type` option
  * use `content-type` to parse `Content-Type` headers
  * deps: iconv-lite@0.4.7
    - Gracefully support enumerables on `Object.prototype`
  * deps: raw-body@1.3.3
    - deps: iconv-lite@0.4.7
  * deps: type-is@~1.6.0
    - fix argument reassignment
    - fix false-positives in `hasBody` `Transfer-Encoding` check
    - support wildcard for both type and subtype (`*/*`)
    - deps: mime-types@~2.0.9

1.11.0 / 2015-01-30
===================

  * make internal `extended: true` depth limit infinity
  * deps: type-is@~1.5.6
    - deps: mime-types@~2.0.8

1.10.2 / 2015-01-20
===================

  * deps: iconv-lite@0.4.6
    - Fix rare aliases of single-byte encodings
  * deps: raw-body@1.3.2
    - deps: iconv-lite@0.4.6

1.10.1 / 2015-01-01
===================

  * deps: on-finished@~2.2.0
  * deps: type-is@~1.5.5
    - deps: mime-types@~2.0.7

1.10.0 / 2014-12-02
===================

  * make internal `extended: true` array limit dynamic

1.9.3 / 2014-11-21
==================

  * deps: iconv-lite@0.4.5
    - Fix Windows-31J and X-SJIS encoding support
  * deps: qs@2.3.3
    - Fix `arrayLimit` behavior
  * deps: raw-body@1.3.1
    - deps: iconv-lite@0.4.5
  * deps: type-is@~1.5.3
    - deps: mime-types@~2.0.3

1.9.2 / 2014-10-27
==================

  * deps: qs@2.3.2
    - Fix parsing of mixed objects and values

1.9.1 / 2014-10-22
==================

  * deps: on-finished@~2.1.1
    - Fix handling of pipelined requests
  * deps: qs@2.3.0
    - Fix parsing of mixed implicit and explicit arrays
  * deps: type-is@~1.5.2
    - deps: mime-types@~2.0.2

1.9.0 / 2014-09-24
==================

  * include the charset in "unsupported charset" error message
  * include the encoding in "unsupported content encoding" error message
  * deps: depd@~1.0.0

1.8.4 / 2014-09-23
==================

  * fix content encoding to be case-insensitive

1.8.3 / 2014-09-19
==================

  * deps: qs@2.2.4
    - Fix issue with object keys starting with numbers truncated

1.8.2 / 2014-09-15
==================

  * deps: depd@0.4.5

1.8.1 / 2014-09-07
==================

  * deps: media-typer@0.3.0
  * deps: type-is@~1.5.1

1.8.0 / 2014-09-05
==================

  * make empty-body-handling consistent between chunked requests
    - empty `json` produces `{}`
    - empty `raw` produces `new Buffer(0)`
    - empty `text` produces `''`
    - empty `urlencoded` produces `{}`
  * deps: qs@2.2.3
    - Fix issue where first empty value in array is discarded
  * deps: type-is@~1.5.0
    - fix `hasbody` to be true for `content-length: 0`

1.7.0 / 2014-09-01
==================

  * add `parameterLimit` option to `urlencoded` parser
  * change `urlencoded` extended array limit to 100
  * respond with 413 when over `parameterLimit` in `urlencoded`

1.6.7 / 2014-08-29
==================

  * deps: qs@2.2.2
    - Remove unnecessary cloning

1.6.6 / 2014-08-27
==================

  * deps: qs@2.2.0
    - Array parsing fix
    - Performance improvements

1.6.5 / 2014-08-16
==================

  * deps: on-finished@2.1.0

1.6.4 / 2014-08-14
==================

  * deps: qs@1.2.2

1.6.3 / 2014-08-10
==================

  * deps: qs@1.2.1

1.6.2 / 2014-08-07
==================

  * deps: qs@1.2.0
    - Fix parsing array of objects

1.6.1 / 2014-08-06
==================

  * deps: qs@1.1.0
    - Accept urlencoded square brackets
    - Accept empty values in implicit array notation

1.6.0 / 2014-08-05
==================

  * deps: qs@1.0.2
    - Complete rewrite
    - Limits array length to 20
    - Limits object depth to 5
    - Limits parameters to 1,000

1.5.2 / 2014-07-27
==================

  * deps: depd@0.4.4
    - Work-around v8 generating empty stack traces

1.5.1 / 2014-07-26
==================

  * deps: depd@0.4.3
    - Fix exception when global `Error.stackTraceLimit` is too low

1.5.0 / 2014-07-20
==================

  * deps: depd@0.4.2
    - Add `TRACE_DEPRECATION` environment variable
    - Remove non-standard grey color from color output
    - Support `--no-deprecation` argument
    - Support `--trace-deprecation` argument
  * deps: iconv-lite@0.4.4
    - Added encoding UTF-7
  * deps: raw-body@1.3.0
    - deps: iconv-lite@0.4.4
    - Added encoding UTF-7
    - Fix `Cannot switch to old mode now` error on Node.js 0.10+
  * deps: type-is@~1.3.2

1.4.3 / 2014-06-19
==================

  * deps: type-is@1.3.1
    - fix global variable leak

1.4.2 / 2014-06-19
==================

  * deps: type-is@1.3.0
    - improve type parsing

1.4.1 / 2014-06-19
==================

  * fix urlencoded extended deprecation message

1.4.0 / 2014-06-19
==================

  * add `text` parser
  * add `raw` parser
  * check accepted charset in content-type (accepts utf-8)
  * check accepted encoding in content-encoding (accepts identity)
  * deprecate `bodyParser()` middleware; use `.json()` and `.urlencoded()` as needed
  * deprecate `urlencoded()` without provided `extended` option
  * lazy-load urlencoded parsers
  * parsers split into files for reduced mem usage
  * support gzip and deflate bodies
    - set `inflate: false` to turn off
  * deps: raw-body@1.2.2
    - Support all encodings from `iconv-lite`

1.3.1 / 2014-06-11
==================

  * deps: type-is@1.2.1
    - Switch dependency from mime to mime-types@1.0.0

1.3.0 / 2014-05-31
==================

  * add `extended` option to urlencoded parser

1.2.2 / 2014-05-27
==================

  * deps: raw-body@1.1.6
    - assert stream encoding on node.js 0.8
    - assert stream encoding on node.js < 0.10.6
    - deps: bytes@1

1.2.1 / 2014-05-26
==================

  * invoke `next(err)` after request fully read
    - prevents hung responses and socket hang ups

1.2.0 / 2014-05-11
==================

  * add `verify` option
  * deps: type-is@1.2.0
    - support suffix matching

1.1.2 / 2014-05-11
==================

  * improve json parser speed

1.1.1 / 2014-05-11
==================

  * fix repeated limit parsing with every request

1.1.0 / 2014-05-10
==================

  * add `type` option
  * deps: pin for safety and consistency

1.0.2 / 2014-04-14
==================

  * use `type-is` module

1.0.1 / 2014-03-20
==================

  * lower default limits to 100kb


---

<!-- source: archive/library/javascript/references/packages/bytes/History--000276.md -->

## Imported source: archive/library/javascript/references/packages/bytes/History--000276.md

3.1.2 / 2022-01-27
==================

  * Fix return value for un-parsable strings

3.1.1 / 2021-11-15
==================

  * Fix "thousandsSeparator" incorrecting formatting fractional part

3.1.0 / 2019-01-22
==================

  * Add petabyte (`pb`) support

3.0.0 / 2017-08-31
==================

  * Change "kB" to "KB" in format output
  * Remove support for Node.js 0.6
  * Remove support for ComponentJS

2.5.0 / 2017-03-24
==================

  * Add option "unit"

2.4.0 / 2016-06-01
==================

  * Add option "unitSeparator"

2.3.0 / 2016-02-15
==================

  * Drop partial bytes on all parsed units
  * Fix non-finite numbers to `.format` to return `null`
  * Fix parsing byte string that looks like hex
  * perf: hoist regular expressions

2.2.0 / 2015-11-13
==================

  * add option "decimalPlaces"
  * add option "fixedDecimals"

2.1.0 / 2015-05-21
==================

  * add `.format` export
  * add `.parse` export

2.0.2 / 2015-05-20
==================

  * remove map recreation
  * remove unnecessary object construction

2.0.1 / 2015-05-07
==================

  * fix browserify require
  * remove node.extend dependency

2.0.0 / 2015-04-12
==================

  * add option "case"
  * add option "thousandsSeparator"
  * return "null" on invalid parse input
  * support proper round-trip: bytes(bytes(num)) === num
  * units no longer case sensitive when parsing

1.0.0 / 2014-05-05
==================

 * add negative support. fixes #6

0.3.0 / 2014-03-19
==================

 * added terabyte support

0.2.1 / 2013-04-01
==================

  * add .component

0.2.0 / 2012-10-28
==================

  * bytes(200).should.eql('200b')

0.1.0 / 2012-07-04
==================

  * add bytes to string conversion [yields]


---

<!-- source: archive/library/javascript/references/packages/content-disposition/HISTORY--000249.md -->

## Imported source: archive/library/javascript/references/packages/content-disposition/HISTORY--000249.md

0.5.4 / 2021-12-10
==================

  * deps: safe-buffer@5.2.1

0.5.3 / 2018-12-17
==================

  * Use `safe-buffer` for improved Buffer API

0.5.2 / 2016-12-08
==================

  * Fix `parse` to accept any linear whitespace character

0.5.1 / 2016-01-17
==================

  * perf: enable strict mode

0.5.0 / 2014-10-11
==================

  * Add `parse` function

0.4.0 / 2014-09-21
==================

  * Expand non-Unicode `filename` to the full ISO-8859-1 charset

0.3.0 / 2014-09-20
==================

  * Add `fallback` option
  * Add `type` option

0.2.0 / 2014-09-19
==================

  * Reduce ambiguity of file names with hex escape in buggy browsers

0.1.2 / 2014-09-19
==================

  * Fix periodic invalid Unicode filename header

0.1.1 / 2014-09-19
==================

  * Fix invalid characters appearing in `filename*` parameter

0.1.0 / 2014-09-18
==================

  * Make the `filename` argument optional

0.0.0 / 2014-09-18
==================

  * Initial release


---

<!-- source: archive/library/javascript/references/packages/content-type/HISTORY--000417.md -->

## Imported source: archive/library/javascript/references/packages/content-type/HISTORY--000417.md

0.3.0 / 2014-09-07
==================

  * Support Node.js 0.6
  * Throw error when parameter format invalid on parse

0.2.0 / 2014-06-18
==================

  * Add `typer.format()` to format media types

0.1.0 / 2014-06-17
==================

  * Accept `req` as argument to `parse`
  * Accept `res` as argument to `parse`
  * Parse media type with extra LWS between type and first parameter

0.0.0 / 2014-06-13
==================

  * Initial implementation


---

<!-- source: archive/library/javascript/references/packages/content-type/HISTORY--000443.md -->

## Imported source: archive/library/javascript/references/packages/content-type/HISTORY--000443.md

1.0.5 / 2023-01-29
==================

  * perf: skip value escaping when unnecessary

1.0.4 / 2017-09-11
==================

  * perf: skip parameter parsing when no parameters

1.0.3 / 2017-09-10
==================

  * perf: remove argument reassignment

1.0.2 / 2016-05-09
==================

  * perf: enable strict mode

1.0.1 / 2015-02-13
==================

  * Improve missing `Content-Type` header error message

1.0.0 / 2015-02-01
==================

  * Initial implementation, derived from `media-typer@0.3.0`


---

<!-- source: archive/library/javascript/references/packages/cookie-signature/History--000322.md -->

## Imported source: archive/library/javascript/references/packages/cookie-signature/History--000322.md

1.0.6 / 2015-02-03
==================

* use `npm test` instead of `make test` to run tests
* clearer assertion messages when checking input


1.0.5 / 2014-09-05
==================

* add license to package.json

1.0.4 / 2014-06-25
==================

 * corrected avoidance of timing attacks (thanks @tenbits!)

1.0.3 / 2014-01-28
==================

 * [incorrect] fix for timing attacks

1.0.2 / 2014-01-28
==================

 * fix missing repository warning
 * fix typo in test

1.0.1 / 2013-04-15
==================

  * Revert "Changed underlying HMAC algo. to sha512."
  * Revert "Fix for timing attacks on MAC verification."

0.0.1 / 2010-01-03
==================

  * Initial release


---

<!-- source: archive/library/javascript/references/packages/cors/HISTORY--000318.md -->

## Imported source: archive/library/javascript/references/packages/cors/HISTORY--000318.md

2.8.5 / 2018-11-04
==================

  * Fix setting `maxAge` option to `0`

2.8.4 / 2017-07-12
==================

  * Work-around Safari bug in default pre-flight response

2.8.3 / 2017-03-29
==================

  * Fix error when options delegate missing `methods` option

2.8.2 / 2017-03-28
==================

  * Fix error when frozen options are passed
  * Send "Vary: Origin" when using regular expressions
  * Send "Vary: Access-Control-Request-Headers" when dynamic `allowedHeaders`

2.8.1 / 2016-09-08
==================

This release only changed documentation.

2.8.0 / 2016-08-23
==================

  * Add `optionsSuccessStatus` option

2.7.2 / 2016-08-23
==================

  * Fix error when Node.js running in strict mode

2.7.1 / 2015-05-28
==================

  * Move module into expressjs organization

2.7.0 / 2015-05-28
==================

  * Allow array of matching condition as `origin` option
  * Allow regular expression as `origin` option

2.6.1 / 2015-05-28
==================

  * Update `license` in package.json

2.6.0 / 2015-04-27
==================

  * Add `preflightContinue` option
  * Fix "Vary: Origin" header added for "*"


---

<!-- source: archive/library/javascript/references/packages/depd/History--000445.md -->

## Imported source: archive/library/javascript/references/packages/depd/History--000445.md

2.0.0 / 2018-10-26
==================

  * Drop support for Node.js 0.6
  * Replace internal `eval` usage with `Function` constructor
  * Use instance methods on `process` to check for listeners

1.1.2 / 2018-01-11
==================

  * perf: remove argument reassignment
  * Support Node.js 0.6 to 9.x

1.1.1 / 2017-07-27
==================

  * Remove unnecessary `Buffer` loading
  * Support Node.js 0.6 to 8.x

1.1.0 / 2015-09-14
==================

  * Enable strict mode in more places
  * Support io.js 3.x
  * Support io.js 2.x
  * Support web browser loading
    - Requires bundler like Browserify or webpack

1.0.1 / 2015-04-07
==================

  * Fix `TypeError`s when under `'use strict'` code
  * Fix useless type name on auto-generated messages
  * Support io.js 1.x
  * Support Node.js 0.12

1.0.0 / 2014-09-17
==================

  * No changes

0.4.5 / 2014-09-09
==================

  * Improve call speed to functions using the function wrapper
  * Support Node.js 0.6

0.4.4 / 2014-07-27
==================

  * Work-around v8 generating empty stack traces

0.4.3 / 2014-07-26
==================

  * Fix exception when global `Error.stackTraceLimit` is too low

0.4.2 / 2014-07-19
==================

  * Correct call site for wrapped functions and properties

0.4.1 / 2014-07-19
==================

  * Improve automatic message generation for function properties

0.4.0 / 2014-07-19
==================

  * Add `TRACE_DEPRECATION` environment variable
  * Remove non-standard grey color from color output
  * Support `--no-deprecation` argument
  * Support `--trace-deprecation` argument
  * Support `deprecate.property(fn, prop, message)`

0.3.0 / 2014-06-16
==================

  * Add `NO_DEPRECATION` environment variable

0.2.0 / 2014-06-15
==================

  * Add `deprecate.property(obj, prop, message)`
  * Remove `supports-color` dependency for node.js 0.8

0.1.0 / 2014-06-15
==================

  * Add `deprecate.function(fn, message)`
  * Add `process.on('deprecation', fn)` emitter
  * Automatically generate message when omitted from `deprecate()`

0.0.1 / 2014-06-15
==================

  * Fix warning for dynamic calls at singe call site

0.0.0 / 2014-06-15
==================

  * Initial implementation


---

<!-- source: archive/library/javascript/references/packages/encodeurl/HISTORY--000388.md -->

## Imported source: archive/library/javascript/references/packages/encodeurl/HISTORY--000388.md

1.0.2 / 2018-01-21
==================

  * Fix encoding `%` as last character

1.0.1 / 2016-06-09
==================

  * Fix encoding unpaired surrogates at start/end of string

1.0.0 / 2016-06-08
==================

  * Initial release


---

<!-- source: archive/library/javascript/references/packages/etag/HISTORY--000380.md -->

## Imported source: archive/library/javascript/references/packages/etag/HISTORY--000380.md

1.8.1 / 2017-09-12
==================

  * perf: replace regular expression with substring

1.8.0 / 2017-02-18
==================

  * Use SHA1 instead of MD5 for ETag hashing
    - Improves performance for larger entities
    - Works with FIPS 140-2 OpenSSL configuration

1.7.0 / 2015-06-08
==================

  * Always include entity length in ETags for hash length extensions
  * Generate non-Stats ETags using MD5 only (no longer CRC32)
  * Improve stat performance by removing hashing
  * Remove base64 padding in ETags to shorten
  * Use MD5 instead of MD4 in weak ETags over 1KB

1.6.0 / 2015-05-10
==================

  * Improve support for JXcore
  * Remove requirement of `atime` in the stats object
  * Support "fake" stats objects in environments without `fs`

1.5.1 / 2014-11-19
==================

  * deps: crc@3.2.1
    - Minor fixes

1.5.0 / 2014-10-14
==================

  * Improve string performance
  * Slightly improve speed for weak ETags over 1KB

1.4.0 / 2014-09-21
==================

  * Support "fake" stats objects
  * Support Node.js 0.6

1.3.1 / 2014-09-14
==================

  * Use the (new and improved) `crc` for crc32

1.3.0 / 2014-08-29
==================

  * Default strings to strong ETags
  * Improve speed for weak ETags over 1KB

1.2.1 / 2014-08-29
==================

  * Use the (much faster) `buffer-crc32` for crc32

1.2.0 / 2014-08-24
==================

  * Add support for file stat objects

1.1.0 / 2014-08-24
==================

  * Add fast-path for empty entity
  * Add weak ETag generation
  * Shrink size of generated ETags

1.0.1 / 2014-08-24
==================

  * Fix behavior of string containing Unicode

1.0.0 / 2014-05-18
==================

  * Initial release


---

<!-- source: archive/library/javascript/references/packages/express/History--000294.md -->

## Imported source: archive/library/javascript/references/packages/express/History--000294.md

4.21.2 / 2024-11-06
==========

  * deps: path-to-regexp@0.1.12
    - Fix backtracking protection
  * deps: path-to-regexp@0.1.11
    - Throws an error on invalid path values

4.21.1 / 2024-10-08
==========

  * Backported a fix for [CVE-2024-47764](https://nvd.nist.gov/vuln/detail/CVE-2024-47764)


4.21.0 / 2024-09-11
==========

  * Deprecate `res.location("back")` and `res.redirect("back")` magic string
  * deps: serve-static@1.16.2
    * includes send@0.19.0
  * deps: finalhandler@1.3.1
  * deps: qs@6.13.0

4.20.0 / 2024-09-10
==========
  * deps: serve-static@0.16.0
    * Remove link renderization in html while redirecting
  * deps: send@0.19.0
    * Remove link renderization in html while redirecting
  * deps: body-parser@0.6.0
    * add `depth` option to customize the depth level in the parser
    * IMPORTANT: The default `depth` level for parsing URL-encoded data is now `32` (previously was `Infinity`)
  * Remove link renderization in html while using `res.redirect`
  * deps: path-to-regexp@0.1.10
    - Adds support for named matching groups in the routes using a regex
    - Adds backtracking protection to parameters without regexes defined
  * deps: encodeurl@~2.0.0
    - Removes encoding of `\`, `|`, and `^` to align better with URL spec
  * Deprecate passing `options.maxAge` and `options.expires` to `res.clearCookie`
    - Will be ignored in v5, clearCookie will set a cookie with an expires in the past to instruct clients to delete the cookie

4.19.2 / 2024-03-25
==========

  * Improved fix for open redirect allow list bypass

4.19.1 / 2024-03-20
==========

  * Allow passing non-strings to res.location with new encoding handling checks

4.19.0 / 2024-03-20
==========

  * Prevent open redirect allow list bypass due to encodeurl
  * deps: cookie@0.6.0

4.18.3 / 2024-02-29
==========

  * Fix routing requests without method
  * deps: body-parser@1.20.2
    - Fix strict json error message on Node.js 19+
    - deps: content-type@~1.0.5
    - deps: raw-body@2.5.2
  * deps: cookie@0.6.0
    - Add `partitioned` option

4.18.2 / 2022-10-08
===================

  * Fix regression routing a large stack in a single route
  * deps: body-parser@1.20.1
    - deps: qs@6.11.0
    - perf: remove unnecessary object clone
  * deps: qs@6.11.0

4.18.1 / 2022-04-29
===================

  * Fix hanging on large stack of sync routes

4.18.0 / 2022-04-25
===================

  * Add "root" option to `res.download`
  * Allow `options` without `filename` in `res.download`
  * Deprecate string and non-integer arguments to `res.status`
  * Fix behavior of `null`/`undefined` as `maxAge` in `res.cookie`
  * Fix handling very large stacks of sync middleware
  * Ignore `Object.prototype` values in settings through `app.set`/`app.get`
  * Invoke `default` with same arguments as types in `res.format`
  * Support proper 205 responses using `res.send`
  * Use `http-errors` for `res.format` error
  * deps: body-parser@1.20.0
    - Fix error message for json parse whitespace in `strict`
    - Fix internal error when inflated body exceeds limit
    - Prevent loss of async hooks context
    - Prevent hanging when request already read
    - deps: depd@2.0.0
    - deps: http-errors@2.0.0
    - deps: on-finished@2.4.1
    - deps: qs@6.10.3
    - deps: raw-body@2.5.1
  * deps: cookie@0.5.0
    - Add `priority` option
    - Fix `expires` option to reject invalid dates
  * deps: depd@2.0.0
    - Replace internal `eval` usage with `Function` constructor
    - Use instance methods on `process` to check for listeners
  * deps: finalhandler@1.2.0
    - Remove set content headers that break response
    - deps: on-finished@2.4.1
    - deps: statuses@2.0.1
  * deps: on-finished@2.4.1
    - Prevent loss of async hooks context
  * deps: qs@6.10.3
  * deps: send@0.18.0
    - Fix emitted 416 error missing headers property
    - Limit the headers removed for 304 response
    - deps: depd@2.0.0
    - deps: destroy@1.2.0
    - deps: http-errors@2.0.0
    - deps: on-finished@2.4.1
    - deps: statuses@2.0.1
  * deps: serve-static@1.15.0
    - deps: send@0.18.0
  * deps: statuses@2.0.1
    - Remove code 306
    - Rename `425 Unordered Collection` to standard `425 Too Early`

4.17.3 / 2022-02-16
===================

  * deps: accepts@~1.3.8
    - deps: mime-types@~2.1.34
    - deps: negotiator@0.6.3
  * deps: body-parser@1.19.2
    - deps: bytes@3.1.2
    - deps: qs@6.9.7
    - deps: raw-body@2.4.3
  * deps: cookie@0.4.2
  * deps: qs@6.9.7
    * Fix handling of `__proto__` keys
  * pref: remove unnecessary regexp for trust proxy

4.17.2 / 2021-12-16
===================

  * Fix handling of `undefined` in `res.jsonp`
  * Fix handling of `undefined` when `"json escape"` is enabled
  * Fix incorrect middleware execution with unanchored `RegExp`s
  * Fix `res.jsonp(obj, status)` deprecation message
  * Fix typo in `res.is` JSDoc
  * deps: body-parser@1.19.1
    - deps: bytes@3.1.1
    - deps: http-errors@1.8.1
    - deps: qs@6.9.6
    - deps: raw-body@2.4.2
    - deps: safe-buffer@5.2.1
    - deps: type-is@~1.6.18
  * deps: content-disposition@0.5.4
    - deps: safe-buffer@5.2.1
  * deps: cookie@0.4.1
    - Fix `maxAge` option to reject invalid values
  * deps: proxy-addr@~2.0.7
    - Use `req.socket` over deprecated `req.connection`
    - deps: forwarded@0.2.0
    - deps: ipaddr.js@1.9.1
  * deps: qs@6.9.6
  * deps: safe-buffer@5.2.1
  * deps: send@0.17.2
    - deps: http-errors@1.8.1
    - deps: ms@2.1.3
    - pref: ignore empty http tokens
  * deps: serve-static@1.14.2
    - deps: send@0.17.2
  * deps: setprototypeof@1.2.0

4.17.1 / 2019-05-25
===================

  * Revert "Improve error message for `null`/`undefined` to `res.status`"

4.17.0 / 2019-05-16
===================

  * Add `express.raw` to parse bodies into `Buffer`
  * Add `express.text` to parse bodies into string
  * Improve error message for non-strings to `res.sendFile`
  * Improve error message for `null`/`undefined` to `res.status`
  * Support multiple hosts in `X-Forwarded-Host`
  * deps: accepts@~1.3.7
  * deps: body-parser@1.19.0
    - Add encoding MIK
    - Add petabyte (`pb`) support
    - Fix parsing array brackets after index
    - deps: bytes@3.1.0
    - deps: http-errors@1.7.2
    - deps: iconv-lite@0.4.24
    - deps: qs@6.7.0
    - deps: raw-body@2.4.0
    - deps: type-is@~1.6.17
  * deps: content-disposition@0.5.3
  * deps: cookie@0.4.0
    - Add `SameSite=None` support
  * deps: finalhandler@~1.1.2
    - Set stricter `Content-Security-Policy` header
    - deps: parseurl@~1.3.3
    - deps: statuses@~1.5.0
  * deps: parseurl@~1.3.3
  * deps: proxy-addr@~2.0.5
    - deps: ipaddr.js@1.9.0
  * deps: qs@6.7.0
    - Fix parsing array brackets after index
  * deps: range-parser@~1.2.1
  * deps: send@0.17.1
    - Set stricter CSP header in redirect & error responses
    - deps: http-errors@~1.7.2
    - deps: mime@1.6.0
    - deps: ms@2.1.1
    - deps: range-parser@~1.2.1
    - deps: statuses@~1.5.0
    - perf: remove redundant `path.normalize` call
  * deps: serve-static@1.14.1
    - Set stricter CSP header in redirect response
    - deps: parseurl@~1.3.3
    - deps: send@0.17.1
  * deps: setprototypeof@1.1.1
  * deps: statuses@~1.5.0
    - Add `103 Early Hints`
  * deps: type-is@~1.6.18
    - deps: mime-types@~2.1.24
    - perf: prevent internal `throw` on invalid type

4.16.4 / 2018-10-10
===================

  * Fix issue where `"Request aborted"` may be logged in `res.sendfile`
  * Fix JSDoc for `Router` constructor
  * deps: body-parser@1.18.3
    - Fix deprecation warnings on Node.js 10+
    - Fix stack trace for strict json parse error
    - deps: depd@~1.1.2
    - deps: http-errors@~1.6.3
    - deps: iconv-lite@0.4.23
    - deps: qs@6.5.2
    - deps: raw-body@2.3.3
    - deps: type-is@~1.6.16
  * deps: proxy-addr@~2.0.4
    - deps: ipaddr.js@1.8.0
  * deps: qs@6.5.2
  * deps: safe-buffer@5.1.2

4.16.3 / 2018-03-12
===================

  * deps: accepts@~1.3.5
    - deps: mime-types@~2.1.18
  * deps: depd@~1.1.2
    - perf: remove argument reassignment
  * deps: encodeurl@~1.0.2
    - Fix encoding `%` as last character
  * deps: finalhandler@1.1.1
    - Fix 404 output for bad / missing pathnames
    - deps: encodeurl@~1.0.2
    - deps: statuses@~1.4.0
  * deps: proxy-addr@~2.0.3
    - deps: ipaddr.js@1.6.0
  * deps: send@0.16.2
    - Fix incorrect end tag in default error & redirects
    - deps: depd@~1.1.2
    - deps: encodeurl@~1.0.2
    - deps: statuses@~1.4.0
  * deps: serve-static@1.13.2
    - Fix incorrect end tag in redirects
    - deps: encodeurl@~1.0.2
    - deps: send@0.16.2
  * deps: statuses@~1.4.0
  * deps: type-is@~1.6.16
    - deps: mime-types@~2.1.18

4.16.2 / 2017-10-09
===================

  * Fix `TypeError` in `res.send` when given `Buffer` and `ETag` header set
  * perf: skip parsing of entire `X-Forwarded-Proto` header

4.16.1 / 2017-09-29
===================

  * deps: send@0.16.1
  * deps: serve-static@1.13.1
    - Fix regression when `root` is incorrectly set to a file
    - deps: send@0.16.1

4.16.0 / 2017-09-28
===================

  * Add `"json escape"` setting for `res.json` and `res.jsonp`
  * Add `express.json` and `express.urlencoded` to parse bodies
  * Add `options` argument to `res.download`
  * Improve error message when autoloading invalid view engine
  * Improve error messages when non-function provided as middleware
  * Skip `Buffer` encoding when not generating ETag for small response
  * Use `safe-buffer` for improved Buffer API
  * deps: accepts@~1.3.4
    - deps: mime-types@~2.1.16
  * deps: content-type@~1.0.4
    - perf: remove argument reassignment
    - perf: skip parameter parsing when no parameters
  * deps: etag@~1.8.1
    - perf: replace regular expression with substring
  * deps: finalhandler@1.1.0
    - Use `res.headersSent` when available
  * deps: parseurl@~1.3.2
    - perf: reduce overhead for full URLs
    - perf: unroll the "fast-path" `RegExp`
  * deps: proxy-addr@~2.0.2
    - Fix trimming leading / trailing OWS in `X-Forwarded-For`
    - deps: forwarded@~0.1.2
    - deps: ipaddr.js@1.5.2
    - perf: reduce overhead when no `X-Forwarded-For` header
  * deps: qs@6.5.1
    - Fix parsing & compacting very deep objects
  * deps: send@0.16.0
    - Add 70 new types for file extensions
    - Add `immutable` option
    - Fix missing `</html>` in default error & redirects
    - Set charset as "UTF-8" for .js and .json
    - Use instance methods on steam to check for listeners
    - deps: mime@1.4.1
    - perf: improve path validation speed
  * deps: serve-static@1.13.0
    - Add 70 new types for file extensions
    - Add `immutable` option
    - Set charset as "UTF-8" for .js and .json
    - deps: send@0.16.0
  * deps: setprototypeof@1.1.0
  * deps: utils-merge@1.0.1
  * deps: vary@~1.1.2
    - perf: improve header token parsing speed
  * perf: re-use options object when generating ETags
  * perf: remove dead `.charset` set in `res.jsonp`

4.15.5 / 2017-09-24
===================

  * deps: debug@2.6.9
  * deps: finalhandler@~1.0.6
    - deps: debug@2.6.9
    - deps: parseurl@~1.3.2
  * deps: fresh@0.5.2
    - Fix handling of modified headers with invalid dates
    - perf: improve ETag match loop
    - perf: improve `If-None-Match` token parsing
  * deps: send@0.15.6
    - Fix handling of modified headers with invalid dates
    - deps: debug@2.6.9
    - deps: etag@~1.8.1
    - deps: fresh@0.5.2
    - perf: improve `If-Match` token parsing
  * deps: serve-static@1.12.6
    - deps: parseurl@~1.3.2
    - deps: send@0.15.6
    - perf: improve slash collapsing

4.15.4 / 2017-08-06
===================

  * deps: debug@2.6.8
  * deps: depd@~1.1.1
    - Remove unnecessary `Buffer` loading
  * deps: finalhandler@~1.0.4
    - deps: debug@2.6.8
  * deps: proxy-addr@~1.1.5
    - Fix array argument being altered
    - deps: ipaddr.js@1.4.0
  * deps: qs@6.5.0
  * deps: send@0.15.4
    - deps: debug@2.6.8
    - deps: depd@~1.1.1
    - deps: http-errors@~1.6.2
  * deps: serve-static@1.12.4
    - deps: send@0.15.4

4.15.3 / 2017-05-16
===================

  * Fix error when `res.set` cannot add charset to `Content-Type`
  * deps: debug@2.6.7
    - Fix `DEBUG_MAX_ARRAY_LENGTH`
    - deps: ms@2.0.0
  * deps: finalhandler@~1.0.3
    - Fix missing `</html>` in HTML document
    - deps: debug@2.6.7
  * deps: proxy-addr@~1.1.4
    - deps: ipaddr.js@1.3.0
  * deps: send@0.15.3
    - deps: debug@2.6.7
    - deps: ms@2.0.0
  * deps: serve-static@1.12.3
    - deps: send@0.15.3
  * deps: type-is@~1.6.15
    - deps: mime-types@~2.1.15
  * deps: vary@~1.1.1
    - perf: hoist regular expression

4.15.2 / 2017-03-06
===================

  * deps: qs@6.4.0
    - Fix regression parsing keys starting with `[`

4.15.1 / 2017-03-05
===================

  * deps: send@0.15.1
    - Fix issue when `Date.parse` does not return `NaN` on invalid date
    - Fix strict violation in broken environments
  * deps: serve-static@1.12.1
    - Fix issue when `Date.parse` does not return `NaN` on invalid date
    - deps: send@0.15.1

4.15.0 / 2017-03-01
===================

  * Add debug message when loading view engine
  * Add `next("router")` to exit from router
  * Fix case where `router.use` skipped requests routes did not
  * Remove usage of `res._headers` private field
    - Improves compatibility with Node.js 8 nightly
  * Skip routing when `req.url` is not set
  * Use `%o` in path debug to tell types apart
  * Use `Object.create` to setup request & response prototypes
  * Use `setprototypeof` module to replace `__proto__` setting
  * Use `statuses` instead of `http` module for status messages
  * deps: debug@2.6.1
    - Allow colors in workers
    - Deprecated `DEBUG_FD` environment variable set to `3` or higher
    - Fix error when running under React Native
    - Use same color for same namespace
    - deps: ms@0.7.2
  * deps: etag@~1.8.0
    - Use SHA1 instead of MD5 for ETag hashing
    - Works with FIPS 140-2 OpenSSL configuration
  * deps: finalhandler@~1.0.0
    - Fix exception when `err` cannot be converted to a string
    - Fully URL-encode the pathname in the 404
    - Only include the pathname in the 404 message
    - Send complete HTML document
    - Set `Content-Security-Policy: default-src 'self'` header
    - deps: debug@2.6.1
  * deps: fresh@0.5.0
    - Fix false detection of `no-cache` request directive
    - Fix incorrect result when `If-None-Match` has both `*` and ETags
    - Fix weak `ETag` matching to match spec
    - perf: delay reading header values until needed
    - perf: enable strict mode
    - perf: hoist regular expressions
    - perf: remove duplicate conditional
    - perf: remove unnecessary boolean coercions
    - perf: skip checking modified time if ETag check failed
    - perf: skip parsing `If-None-Match` when no `ETag` header
    - perf: use `Date.parse` instead of `new Date`
  * deps: qs@6.3.1
    - Fix array parsing from skipping empty values
    - Fix compacting nested arrays
  * deps: send@0.15.0
    - Fix false detection of `no-cache` request directive
    - Fix incorrect result when `If-None-Match` has both `*` and ETags
    - Fix weak `ETag` matching to match spec
    - Remove usage of `res._headers` private field
    - Support `If-Match` and `If-Unmodified-Since` headers
    - Use `res.getHeaderNames()` when available
    - Use `res.headersSent` when available
    - deps: debug@2.6.1
    - deps: etag@~1.8.0
    - deps: fresh@0.5.0
    - deps: http-errors@~1.6.1
  * deps: serve-static@1.12.0
    - Fix false detection of `no-cache` request directive
    - Fix incorrect result when `If-None-Match` has both `*` and ETags
    - Fix weak `ETag` matching to match spec
    - Remove usage of `res._headers` private field
    - Send complete HTML document in redirect response
    - Set default CSP header in redirect response
    - Support `If-Match` and `If-Unmodified-Since` headers
    - Use `res.getHeaderNames()` when available
    - Use `res.headersSent` when available
    - deps: send@0.15.0
  * perf: add fast match path for `*` route
  * perf: improve `req.ips` performance

4.14.1 / 2017-01-28
===================

  * deps: content-disposition@0.5.2
  * deps: finalhandler@0.5.1
    - Fix exception when `err.headers` is not an object
    - deps: statuses@~1.3.1
    - perf: hoist regular expressions
    - perf: remove duplicate validation path
  * deps: proxy-addr@~1.1.3
    - deps: ipaddr.js@1.2.0
  * deps: send@0.14.2
    - deps: http-errors@~1.5.1
    - deps: ms@0.7.2
    - deps: statuses@~1.3.1
  * deps: serve-static@~1.11.2
    - deps: send@0.14.2
  * deps: type-is@~1.6.14
    - deps: mime-types@~2.1.13

4.14.0 / 2016-06-16
===================

  * Add `acceptRanges` option to `res.sendFile`/`res.sendfile`
  * Add `cacheControl` option to `res.sendFile`/`res.sendfile`
  * Add `options` argument to `req.range`
    - Includes the `combine` option
  * Encode URL in `res.location`/`res.redirect` if not already encoded
  * Fix some redirect handling in `res.sendFile`/`res.sendfile`
  * Fix Windows absolute path check using forward slashes
  * Improve error with invalid arguments to `req.get()`
  * Improve performance for `res.json`/`res.jsonp` in most cases
  * Improve `Range` header handling in `res.sendFile`/`res.sendfile`
  * deps: accepts@~1.3.3
    - Fix including type extensions in parameters in `Accept` parsing
    - Fix parsing `Accept` parameters with quoted equals
    - Fix parsing `Accept` parameters with quoted semicolons
    - Many performance improvements
    - deps: mime-types@~2.1.11
    - deps: negotiator@0.6.1
  * deps: content-type@~1.0.2
    - perf: enable strict mode
  * deps: cookie@0.3.1
    - Add `sameSite` option
    - Fix cookie `Max-Age` to never be a floating point number
    - Improve error message when `encode` is not a function
    - Improve error message when `expires` is not a `Date`
    - Throw better error for invalid argument to parse
    - Throw on invalid values provided to `serialize`
    - perf: enable strict mode
    - perf: hoist regular expression
    - perf: use for loop in parse
    - perf: use string concatenation for serialization
  * deps: finalhandler@0.5.0
    - Change invalid or non-numeric status code to 500
    - Overwrite status message to match set status code
    - Prefer `err.statusCode` if `err.status` is invalid
    - Set response headers from `err.headers` object
    - Use `statuses` instead of `http` module for status messages
  * deps: proxy-addr@~1.1.2
    - Fix accepting various invalid netmasks
    - Fix IPv6-mapped IPv4 validation edge cases
    - IPv4 netmasks must be contiguous
    - IPv6 addresses cannot be used as a netmask
    - deps: ipaddr.js@1.1.1
  * deps: qs@6.2.0
    - Add `decoder` option in `parse` function
  * deps: range-parser@~1.2.0
    - Add `combine` option to combine overlapping ranges
    - Fix incorrectly returning -1 when there is at least one valid range
    - perf: remove internal function
  * deps: send@0.14.1
    - Add `acceptRanges` option
    - Add `cacheControl` option
    - Attempt to combine multiple ranges into single range
    - Correctly inherit from `Stream` class
    - Fix `Content-Range` header in 416 responses when using `start`/`end` options
    - Fix `Content-Range` header missing from default 416 responses
    - Fix redirect error when `path` contains raw non-URL characters
    - Fix redirect when `path` starts with multiple forward slashes
    - Ignore non-byte `Range` headers
    - deps: http-errors@~1.5.0
    - deps: range-parser@~1.2.0
    - deps: statuses@~1.3.0
    - perf: remove argument reassignment
  * deps: serve-static@~1.11.1
    - Add `acceptRanges` option
    - Add `cacheControl` option
    - Attempt to combine multiple ranges into single range
    - Fix redirect error when `req.url` contains raw non-URL characters
    - Ignore non-byte `Range` headers
    - Use status code 301 for redirects
    - deps: send@0.14.1
  * deps: type-is@~1.6.13
    - Fix type error when given invalid type to match against
    - deps: mime-types@~2.1.11
  * deps: vary@~1.1.0
    - Only accept valid field names in the `field` argument
  * perf: use strict equality when possible

4.13.4 / 2016-01-21
===================

  * deps: content-disposition@0.5.1
    - perf: enable strict mode
  * deps: cookie@0.1.5
    - Throw on invalid values provided to `serialize`
  * deps: depd@~1.1.0
    - Support web browser loading
    - perf: enable strict mode
  * deps: escape-html@~1.0.3
    - perf: enable strict mode
    - perf: optimize string replacement
    - perf: use faster string coercion
  * deps: finalhandler@0.4.1
    - deps: escape-html@~1.0.3
  * deps: merge-descriptors@1.0.1
    - perf: enable strict mode
  * deps: methods@~1.1.2
    - perf: enable strict mode
  * deps: parseurl@~1.3.1
    - perf: enable strict mode
  * deps: proxy-addr@~1.0.10
    - deps: ipaddr.js@1.0.5
    - perf: enable strict mode
  * deps: range-parser@~1.0.3
    - perf: enable strict mode
  * deps: send@0.13.1
    - deps: depd@~1.1.0
    - deps: destroy@~1.0.4
    - deps: escape-html@~1.0.3
    - deps: range-parser@~1.0.3
  * deps: serve-static@~1.10.2
    - deps: escape-html@~1.0.3
    - deps: parseurl@~1.3.0
    - deps: send@0.13.1

4.13.3 / 2015-08-02
===================

  * Fix infinite loop condition using `mergeParams: true`
  * Fix inner numeric indices incorrectly altering parent `req.params`

4.13.2 / 2015-07-31
===================

  * deps: accepts@~1.2.12
    - deps: mime-types@~2.1.4
  * deps: array-flatten@1.1.1
    - perf: enable strict mode
  * deps: path-to-regexp@0.1.7
    - Fix regression with escaped round brackets and matching groups
  * deps: type-is@~1.6.6
    - deps: mime-types@~2.1.4

4.13.1 / 2015-07-05
===================

  * deps: accepts@~1.2.10
    - deps: mime-types@~2.1.2
  * deps: qs@4.0.0
    - Fix dropping parameters like `hasOwnProperty`
    - Fix various parsing edge cases
  * deps: type-is@~1.6.4
    - deps: mime-types@~2.1.2
    - perf: enable strict mode
    - perf: remove argument reassignment

4.13.0 / 2015-06-20
===================

  * Add settings to debug output
  * Fix `res.format` error when only `default` provided
  * Fix issue where `next('route')` in `app.param` would incorrectly skip values
  * Fix hiding platform issues with `decodeURIComponent`
    - Only `URIError`s are a 400
  * Fix using `*` before params in routes
  * Fix using capture groups before params in routes
  * Simplify `res.cookie` to call `res.append`
  * Use `array-flatten` module for flattening arrays
  * deps: accepts@~1.2.9
    - deps: mime-types@~2.1.1
    - perf: avoid argument reassignment & argument slice
    - perf: avoid negotiator recursive construction
    - perf: enable strict mode
    - perf: remove unnecessary bitwise operator
  * deps: cookie@0.1.3
    - perf: deduce the scope of try-catch deopt
    - perf: remove argument reassignments
  * deps: escape-html@1.0.2
  * deps: etag@~1.7.0
    - Always include entity length in ETags for hash length extensions
    - Generate non-Stats ETags using MD5 only (no longer CRC32)
    - Improve stat performance by removing hashing
    - Improve support for JXcore
    - Remove base64 padding in ETags to shorten
    - Support "fake" stats objects in environments without fs
    - Use MD5 instead of MD4 in weak ETags over 1KB
  * deps: finalhandler@0.4.0
    - Fix a false-positive when unpiping in Node.js 0.8
    - Support `statusCode` property on `Error` objects
    - Use `unpipe` module for unpiping requests
    - deps: escape-html@1.0.2
    - deps: on-finished@~2.3.0
    - perf: enable strict mode
    - perf: remove argument reassignment
  * deps: fresh@0.3.0
    - Add weak `ETag` matching support
  * deps: on-finished@~2.3.0
    - Add defined behavior for HTTP `CONNECT` requests
    - Add defined behavior for HTTP `Upgrade` requests
    - deps: ee-first@1.1.1
  * deps: path-to-regexp@0.1.6
  * deps: send@0.13.0
    - Allow Node.js HTTP server to set `Date` response header
    - Fix incorrectly removing `Content-Location` on 304 response
    - Improve the default redirect response headers
    - Send appropriate headers on default error response
    - Use `http-errors` for standard emitted errors
    - Use `statuses` instead of `http` module for status messages
    - deps: escape-html@1.0.2
    - deps: etag@~1.7.0
    - deps: fresh@0.3.0
    - deps: on-finished@~2.3.0
    - perf: enable strict mode
    - perf: remove unnecessary array allocations
  * deps: serve-static@~1.10.0
    - Add `fallthrough` option
    - Fix reading options from options prototype
    - Improve the default redirect response headers
    - Malformed URLs now `next()` instead of 400
    - deps: escape-html@1.0.2
    - deps: send@0.13.0
    - perf: enable strict mode
    - perf: remove argument reassignment
  * deps: type-is@~1.6.3
    - deps: mime-types@~2.1.1
    - perf: reduce try block size
    - perf: remove bitwise operations
  * perf: enable strict mode
  * perf: isolate `app.render` try block
  * perf: remove argument reassignments in application
  * perf: remove argument reassignments in request prototype
  * perf: remove argument reassignments in response prototype
  * perf: remove argument reassignments in routing
  * perf: remove argument reassignments in `View`
  * perf: skip attempting to decode zero length string
  * perf: use saved reference to `http.STATUS_CODES`

4.12.4 / 2015-05-17
===================

  * deps: accepts@~1.2.7
    - deps: mime-types@~2.0.11
    - deps: negotiator@0.5.3
  * deps: debug@~2.2.0
    - deps: ms@0.7.1
  * deps: depd@~1.0.1
  * deps: etag@~1.6.0
    - Improve support for JXcore
    - Support "fake" stats objects in environments without `fs`
  * deps: finalhandler@0.3.6
    - deps: debug@~2.2.0
    - deps: on-finished@~2.2.1
  * deps: on-finished@~2.2.1
    - Fix `isFinished(req)` when data buffered
  * deps: proxy-addr@~1.0.8
    - deps: ipaddr.js@1.0.1
  * deps: qs@2.4.2
   - Fix allowing parameters like `constructor`
  * deps: send@0.12.3
    - deps: debug@~2.2.0
    - deps: depd@~1.0.1
    - deps: etag@~1.6.0
    - deps: ms@0.7.1
    - deps: on-finished@~2.2.1
  * deps: serve-static@~1.9.3
    - deps: send@0.12.3
  * deps: type-is@~1.6.2
    - deps: mime-types@~2.0.11

4.12.3 / 2015-03-17
===================

  * deps: accepts@~1.2.5
    - deps: mime-types@~2.0.10
  * deps: debug@~2.1.3
    - Fix high intensity foreground color for bold
    - deps: ms@0.7.0
  * deps: finalhandler@0.3.4
    - deps: debug@~2.1.3
  * deps: proxy-addr@~1.0.7
    - deps: ipaddr.js@0.1.9
  * deps: qs@2.4.1
    - Fix error when parameter `hasOwnProperty` is present
  * deps: send@0.12.2
    - Throw errors early for invalid `extensions` or `index` options
    - deps: debug@~2.1.3
  * deps: serve-static@~1.9.2
    - deps: send@0.12.2
  * deps: type-is@~1.6.1
    - deps: mime-types@~2.0.10

4.12.2 / 2015-03-02
===================

  * Fix regression where `"Request aborted"` is logged using `res.sendFile`

4.12.1 / 2015-03-01
===================

  * Fix constructing application with non-configurable prototype properties
  * Fix `ECONNRESET` errors from `res.sendFile` usage
  * Fix `req.host` when using "trust proxy" hops count
  * Fix `req.protocol`/`req.secure` when using "trust proxy" hops count
  * Fix wrong `code` on aborted connections from `res.sendFile`
  * deps: merge-descriptors@1.0.0

4.12.0 / 2015-02-23
===================

  * Fix `"trust proxy"` setting to inherit when app is mounted
  * Generate `ETag`s for all request responses
    - No longer restricted to only responses for `GET` and `HEAD` requests
  * Use `content-type` to parse `Content-Type` headers
  * deps: accepts@~1.2.4
    - Fix preference sorting to be stable for long acceptable lists
    - deps: mime-types@~2.0.9
    - deps: negotiator@0.5.1
  * deps: cookie-signature@1.0.6
  * deps: send@0.12.1
    - Always read the stat size from the file
    - Fix mutating passed-in `options`
    - deps: mime@1.3.4
  * deps: serve-static@~1.9.1
    - deps: send@0.12.1
  * deps: type-is@~1.6.0
    - fix argument reassignment
    - fix false-positives in `hasBody` `Transfer-Encoding` check
    - support wildcard for both type and subtype (`*/*`)
    - deps: mime-types@~2.0.9

4.11.2 / 2015-02-01
===================

  * Fix `res.redirect` double-calling `res.end` for `HEAD` requests
  * deps: accepts@~1.2.3
    - deps: mime-types@~2.0.8
  * deps: proxy-addr@~1.0.6
    - deps: ipaddr.js@0.1.8
  * deps: type-is@~1.5.6
    - deps: mime-types@~2.0.8

4.11.1 / 2015-01-20
===================

  * deps: send@0.11.1
    - Fix root path disclosure
  * deps: serve-static@~1.8.1
    - Fix redirect loop in Node.js 0.11.14
    - Fix root path disclosure
    - deps: send@0.11.1

4.11.0 / 2015-01-13
===================

  * Add `res.append(field, val)` to append headers
  * Deprecate leading `:` in `name` for `app.param(name, fn)`
  * Deprecate `req.param()` -- use `req.params`, `req.body`, or `req.query` instead
  * Deprecate `app.param(fn)`
  * Fix `OPTIONS` responses to include the `HEAD` method properly
  * Fix `res.sendFile` not always detecting aborted connection
  * Match routes iteratively to prevent stack overflows
  * deps: accepts@~1.2.2
    - deps: mime-types@~2.0.7
    - deps: negotiator@0.5.0
  * deps: send@0.11.0
    - deps: debug@~2.1.1
    - deps: etag@~1.5.1
    - deps: ms@0.7.0
    - deps: on-finished@~2.2.0
  * deps: serve-static@~1.8.0
    - deps: send@0.11.0

4.10.8 / 2015-01-13
===================

  * Fix crash from error within `OPTIONS` response handler
  * deps: proxy-addr@~1.0.5
    - deps: ipaddr.js@0.1.6

4.10.7 / 2015-01-04
===================

  * Fix `Allow` header for `OPTIONS` to not contain duplicate methods
  * Fix incorrect "Request aborted" for `res.sendFile` when `HEAD` or 304
  * deps: debug@~2.1.1
  * deps: finalhandler@0.3.3
    - deps: debug@~2.1.1
    - deps: on-finished@~2.2.0
  * deps: methods@~1.1.1
  * deps: on-finished@~2.2.0
  * deps: serve-static@~1.7.2
    - Fix potential open redirect when mounted at root
  * deps: type-is@~1.5.5
    - deps: mime-types@~2.0.7

4.10.6 / 2014-12-12
===================

  * Fix exception in `req.fresh`/`req.stale` without response headers

4.10.5 / 2014-12-10
===================

  * Fix `res.send` double-calling `res.end` for `HEAD` requests
  * deps: accepts@~1.1.4
    - deps: mime-types@~2.0.4
  * deps: type-is@~1.5.4
    - deps: mime-types@~2.0.4

4.10.4 / 2014-11-24
===================

  * Fix `res.sendfile` logging standard write errors

4.10.3 / 2014-11-23
===================

  * Fix `res.sendFile` logging standard write errors
  * deps: etag@~1.5.1
  * deps: proxy-addr@~1.0.4
    - deps: ipaddr.js@0.1.5
  * deps: qs@2.3.3
    - Fix `arrayLimit` behavior

4.10.2 / 2014-11-09
===================

  * Correctly invoke async router callback asynchronously
  * deps: accepts@~1.1.3
    - deps: mime-types@~2.0.3
  * deps: type-is@~1.5.3
    - deps: mime-types@~2.0.3

4.10.1 / 2014-10-28
===================

  * Fix handling of URLs containing `://` in the path
  * deps: qs@2.3.2
    - Fix parsing of mixed objects and values

4.10.0 / 2014-10-23
===================

  * Add support for `app.set('views', array)`
    - Views are looked up in sequence in array of directories
  * Fix `res.send(status)` to mention `res.sendStatus(status)`
  * Fix handling of invalid empty URLs
  * Use `content-disposition` module for `res.attachment`/`res.download`
    - Sends standards-compliant `Content-Disposition` header
    - Full Unicode support
  * Use `path.resolve` in view lookup
  * deps: debug@~2.1.0
    - Implement `DEBUG_FD` env variable support
  * deps: depd@~1.0.0
  * deps: etag@~1.5.0
    - Improve string performance
    - Slightly improve speed for weak ETags over 1KB
  * deps: finalhandler@0.3.2
    - Terminate in progress response only on error
    - Use `on-finished` to determine request status
    - deps: debug@~2.1.0
    - deps: on-finished@~2.1.1
  * deps: on-finished@~2.1.1
    - Fix handling of pipelined requests
  * deps: qs@2.3.0
    - Fix parsing of mixed implicit and explicit arrays
  * deps: send@0.10.1
    - deps: debug@~2.1.0
    - deps: depd@~1.0.0
    - deps: etag@~1.5.0
    - deps: on-finished@~2.1.1
  * deps: serve-static@~1.7.1
    - deps: send@0.10.1

4.9.8 / 2014-10-17
==================

  * Fix `res.redirect` body when redirect status specified
  * deps: accepts@~1.1.2
    - Fix error when media type has invalid parameter
    - deps: negotiator@0.4.9

4.9.7 / 2014-10-10
==================

  * Fix using same param name in array of paths

4.9.6 / 2014-10-08
==================

  * deps: accepts@~1.1.1
    - deps: mime-types@~2.0.2
    - deps: negotiator@0.4.8
  * deps: serve-static@~1.6.4
    - Fix redirect loop when index file serving disabled
  * deps: type-is@~1.5.2
    - deps: mime-types@~2.0.2

4.9.5 / 2014-09-24
==================

  * deps: etag@~1.4.0
  * deps: proxy-addr@~1.0.3
    - Use `forwarded` npm module
  * deps: send@0.9.3
    - deps: etag@~1.4.0
  * deps: serve-static@~1.6.3
    - deps: send@0.9.3

4.9.4 / 2014-09-19
==================

  * deps: qs@2.2.4
    - Fix issue with object keys starting with numbers truncated

4.9.3 / 2014-09-18
==================

  * deps: proxy-addr@~1.0.2
    - Fix a global leak when multiple subnets are trusted
    - deps: ipaddr.js@0.1.3

4.9.2 / 2014-09-17
==================

  * Fix regression for empty string `path` in `app.use`
  * Fix `router.use` to accept array of middleware without path
  * Improve error message for bad `app.use` arguments

4.9.1 / 2014-09-16
==================

  * Fix `app.use` to accept array of middleware without path
  * deps: depd@0.4.5
  * deps: etag@~1.3.1
  * deps: send@0.9.2
    - deps: depd@0.4.5
    - deps: etag@~1.3.1
    - deps: range-parser@~1.0.2
  * deps: serve-static@~1.6.2
    - deps: send@0.9.2

4.9.0 / 2014-09-08
==================

  * Add `res.sendStatus`
  * Invoke callback for sendfile when client aborts
    - Applies to `res.sendFile`, `res.sendfile`, and `res.download`
    - `err` will be populated with request aborted error
  * Support IP address host in `req.subdomains`
  * Use `etag` to generate `ETag` headers
  * deps: accepts@~1.1.0
    - update `mime-types`
  * deps: cookie-signature@1.0.5
  * deps: debug@~2.0.0
  * deps: finalhandler@0.2.0
    - Set `X-Content-Type-Options: nosniff` header
    - deps: debug@~2.0.0
  * deps: fresh@0.2.4
  * deps: media-typer@0.3.0
    - Throw error when parameter format invalid on parse
  * deps: qs@2.2.3
    - Fix issue where first empty value in array is discarded
  * deps: range-parser@~1.0.2
  * deps: send@0.9.1
    - Add `lastModified` option
    - Use `etag` to generate `ETag` header
    - deps: debug@~2.0.0
    - deps: fresh@0.2.4
  * deps: serve-static@~1.6.1
    - Add `lastModified` option
    - deps: send@0.9.1
  * deps: type-is@~1.5.1
    - fix `hasbody` to be true for `content-length: 0`
    - deps: media-typer@0.3.0
    - deps: mime-types@~2.0.1
  * deps: vary@~1.0.0
    - Accept valid `Vary` header string as `field`

4.8.8 / 2014-09-04
==================

  * deps: send@0.8.5
    - Fix a path traversal issue when using `root`
    - Fix malicious path detection for empty string path
  * deps: serve-static@~1.5.4
    - deps: send@0.8.5

4.8.7 / 2014-08-29
==================

  * deps: qs@2.2.2
    - Remove unnecessary cloning

4.8.6 / 2014-08-27
==================

  * deps: qs@2.2.0
    - Array parsing fix
    - Performance improvements

4.8.5 / 2014-08-18
==================

  * deps: send@0.8.3
    - deps: destroy@1.0.3
    - deps: on-finished@2.1.0
  * deps: serve-static@~1.5.3
    - deps: send@0.8.3

4.8.4 / 2014-08-14
==================

  * deps: qs@1.2.2
  * deps: send@0.8.2
    - Work around `fd` leak in Node.js 0.10 for `fs.ReadStream`
  * deps: serve-static@~1.5.2
    - deps: send@0.8.2

4.8.3 / 2014-08-10
==================

  * deps: parseurl@~1.3.0
  * deps: qs@1.2.1
  * deps: serve-static@~1.5.1
    - Fix parsing of weird `req.originalUrl` values
    - deps: parseurl@~1.3.0
    - deps: utils-merge@1.0.0

4.8.2 / 2014-08-07
==================

  * deps: qs@1.2.0
    - Fix parsing array of objects

4.8.1 / 2014-08-06
==================

  * fix incorrect deprecation warnings on `res.download`
  * deps: qs@1.1.0
    - Accept urlencoded square brackets
    - Accept empty values in implicit array notation

4.8.0 / 2014-08-05
==================

  * add `res.sendFile`
    - accepts a file system path instead of a URL
    - requires an absolute path or `root` option specified
  * deprecate `res.sendfile` -- use `res.sendFile` instead
  * support mounted app as any argument to `app.use()`
  * deps: qs@1.0.2
    - Complete rewrite
    - Limits array length to 20
    - Limits object depth to 5
    - Limits parameters to 1,000
  * deps: send@0.8.1
    - Add `extensions` option
  * deps: serve-static@~1.5.0
    - Add `extensions` option
    - deps: send@0.8.1

4.7.4 / 2014-08-04
==================

  * fix `res.sendfile` regression for serving directory index files
  * deps: send@0.7.4
    - Fix incorrect 403 on Windows and Node.js 0.11
    - Fix serving index files without root dir
  * deps: serve-static@~1.4.4
    - deps: send@0.7.4

4.7.3 / 2014-08-04
==================

  * deps: send@0.7.3
    - Fix incorrect 403 on Windows and Node.js 0.11
  * deps: serve-static@~1.4.3
    - Fix incorrect 403 on Windows and Node.js 0.11
    - deps: send@0.7.3

4.7.2 / 2014-07-27
==================

  * deps: depd@0.4.4
    - Work-around v8 generating empty stack traces
  * deps: send@0.7.2
    - deps: depd@0.4.4
  * deps: serve-static@~1.4.2

4.7.1 / 2014-07-26
==================

  * deps: depd@0.4.3
    - Fix exception when global `Error.stackTraceLimit` is too low
  * deps: send@0.7.1
    - deps: depd@0.4.3
  * deps: serve-static@~1.4.1

4.7.0 / 2014-07-25
==================

  * fix `req.protocol` for proxy-direct connections
  * configurable query parser with `app.set('query parser', parser)`
    - `app.set('query parser', 'extended')` parse with "qs" module
    - `app.set('query parser', 'simple')` parse with "querystring" core module
    - `app.set('query parser', false)` disable query string parsing
    - `app.set('query parser', true)` enable simple parsing
  * deprecate `res.json(status, obj)` -- use `res.status(status).json(obj)` instead
  * deprecate `res.jsonp(status, obj)` -- use `res.status(status).jsonp(obj)` instead
  * deprecate `res.send(status, body)` -- use `res.status(status).send(body)` instead
  * deps: debug@1.0.4
  * deps: depd@0.4.2
    - Add `TRACE_DEPRECATION` environment variable
    - Remove non-standard grey color from color output
    - Support `--no-deprecation` argument
    - Support `--trace-deprecation` argument
  * deps: finalhandler@0.1.0
    - Respond after request fully read
    - deps: debug@1.0.4
  * deps: parseurl@~1.2.0
    - Cache URLs based on original value
    - Remove no-longer-needed URL mis-parse work-around
    - Simplify the "fast-path" `RegExp`
  * deps: send@0.7.0
    - Add `dotfiles` option
    - Cap `maxAge` value to 1 year
    - deps: debug@1.0.4
    - deps: depd@0.4.2
  * deps: serve-static@~1.4.0
    - deps: parseurl@~1.2.0
    - deps: send@0.7.0
  * perf: prevent multiple `Buffer` creation in `res.send`

4.6.1 / 2014-07-12
==================

  * fix `subapp.mountpath` regression for `app.use(subapp)`

4.6.0 / 2014-07-11
==================

  * accept multiple callbacks to `app.use()`
  * add explicit "Rosetta Flash JSONP abuse" protection
    - previous versions are not vulnerable; this is just explicit protection
  * catch errors in multiple `req.param(name, fn)` handlers
  * deprecate `res.redirect(url, status)` -- use `res.redirect(status, url)` instead
  * fix `res.send(status, num)` to send `num` as json (not error)
  * remove unnecessary escaping when `res.jsonp` returns JSON response
  * support non-string `path` in `app.use(path, fn)`
    - supports array of paths
    - supports `RegExp`
  * router: fix optimization on router exit
  * router: refactor location of `try` blocks
  * router: speed up standard `app.use(fn)`
  * deps: debug@1.0.3
    - Add support for multiple wildcards in namespaces
  * deps: finalhandler@0.0.3
    - deps: debug@1.0.3
  * deps: methods@1.1.0
    - add `CONNECT`
  * deps: parseurl@~1.1.3
    - faster parsing of href-only URLs
  * deps: path-to-regexp@0.1.3
  * deps: send@0.6.0
    - deps: debug@1.0.3
  * deps: serve-static@~1.3.2
    - deps: parseurl@~1.1.3
    - deps: send@0.6.0
  * perf: fix arguments reassign deopt in some `res` methods

4.5.1 / 2014-07-06
==================

 * fix routing regression when altering `req.method`

4.5.0 / 2014-07-04
==================

 * add deprecation message to non-plural `req.accepts*`
 * add deprecation message to `res.send(body, status)`
 * add deprecation message to `res.vary()`
 * add `headers` option to `res.sendfile`
   - use to set headers on successful file transfer
 * add `mergeParams` option to `Router`
   - merges `req.params` from parent routes
 * add `req.hostname` -- correct name for what `req.host` returns
 * deprecate things with `depd` module
 * deprecate `req.host` -- use `req.hostname` instead
 * fix behavior when handling request without routes
 * fix handling when `route.all` is only route
 * invoke `router.param()` only when route matches
 * restore `req.params` after invoking router
 * use `finalhandler` for final response handling
 * use `media-typer` to alter content-type charset
 * deps: accepts@~1.0.7
 * deps: send@0.5.0
   - Accept string for `maxage` (converted by `ms`)
   - Include link in default redirect response
 * deps: serve-static@~1.3.0
   - Accept string for `maxAge` (converted by `ms`)
   - Add `setHeaders` option
   - Include HTML link in redirect response
   - deps: send@0.5.0
 * deps: type-is@~1.3.2

4.4.5 / 2014-06-26
==================

 * deps: cookie-signature@1.0.4
   - fix for timing attacks

4.4.4 / 2014-06-20
==================

 * fix `res.attachment` Unicode filenames in Safari
 * fix "trim prefix" debug message in `express:router`
 * deps: accepts@~1.0.5
 * deps: buffer-crc32@0.2.3

4.4.3 / 2014-06-11
==================

 * fix persistence of modified `req.params[name]` from `app.param()`
 * deps: accepts@1.0.3
   - deps: negotiator@0.4.6
 * deps: debug@1.0.2
 * deps: send@0.4.3
   - Do not throw uncatchable error on file open race condition
   - Use `escape-html` for HTML escaping
   - deps: debug@1.0.2
   - deps: finished@1.2.2
   - deps: fresh@0.2.2
 * deps: serve-static@1.2.3
   - Do not throw uncatchable error on file open race condition
   - deps: send@0.4.3

4.4.2 / 2014-06-09
==================

 * fix catching errors from top-level handlers
 * use `vary` module for `res.vary`
 * deps: debug@1.0.1
 * deps: proxy-addr@1.0.1
 * deps: send@0.4.2
   - fix "event emitter leak" warnings
   - deps: debug@1.0.1
   - deps: finished@1.2.1
 * deps: serve-static@1.2.2
   - fix "event emitter leak" warnings
   - deps: send@0.4.2
 * deps: type-is@1.2.1

4.4.1 / 2014-06-02
==================

 * deps: methods@1.0.1
 * deps: send@0.4.1
   - Send `max-age` in `Cache-Control` in correct format
 * deps: serve-static@1.2.1
   - use `escape-html` for escaping
   - deps: send@0.4.1

4.4.0 / 2014-05-30
==================

 * custom etag control with `app.set('etag', val)`
   - `app.set('etag', function(body, encoding){ return '"etag"' })` custom etag generation
   - `app.set('etag', 'weak')` weak tag
   - `app.set('etag', 'strong')` strong etag
   - `app.set('etag', false)` turn off
   - `app.set('etag', true)` standard etag
 * mark `res.send` ETag as weak and reduce collisions
 * update accepts to 1.0.2
   - Fix interpretation when header not in request
 * update send to 0.4.0
   - Calculate ETag with md5 for reduced collisions
   - Ignore stream errors after request ends
   - deps: debug@0.8.1
 * update serve-static to 1.2.0
   - Calculate ETag with md5 for reduced collisions
   - Ignore stream errors after request ends
   - deps: send@0.4.0

4.3.2 / 2014-05-28
==================

 * fix handling of errors from `router.param()` callbacks

4.3.1 / 2014-05-23
==================

 * revert "fix behavior of multiple `app.VERB` for the same path"
   - this caused a regression in the order of route execution

4.3.0 / 2014-05-21
==================

 * add `req.baseUrl` to access the path stripped from `req.url` in routes
 * fix behavior of multiple `app.VERB` for the same path
 * fix issue routing requests among sub routers
 * invoke `router.param()` only when necessary instead of every match
 * proper proxy trust with `app.set('trust proxy', trust)`
   - `app.set('trust proxy', 1)` trust first hop
   - `app.set('trust proxy', 'loopback')` trust loopback addresses
   - `app.set('trust proxy', '10.0.0.1')` trust single IP
   - `app.set('trust proxy', '10.0.0.1/16')` trust subnet
   - `app.set('trust proxy', '10.0.0.1, 10.0.0.2')` trust list
   - `app.set('trust proxy', false)` turn off
   - `app.set('trust proxy', true)` trust everything
 * set proper `charset` in `Content-Type` for `res.send`
 * update type-is to 1.2.0
   - support suffix matching

4.2.0 / 2014-05-11
==================

 * deprecate `app.del()` -- use `app.delete()` instead
 * deprecate `res.json(obj, status)` -- use `res.json(status, obj)` instead
   - the edge-case `res.json(status, num)` requires `res.status(status).json(num)`
 * deprecate `res.jsonp(obj, status)` -- use `res.jsonp(status, obj)` instead
   - the edge-case `res.jsonp(status, num)` requires `res.status(status).jsonp(num)`
 * fix `req.next` when inside router instance
 * include `ETag` header in `HEAD` requests
 * keep previous `Content-Type` for `res.jsonp`
 * support PURGE method
   - add `app.purge`
   - add `router.purge`
   - include PURGE in `app.all`
 * update debug to 0.8.0
   - add `enable()` method
   - change from stderr to stdout
 * update methods to 1.0.0
   - add PURGE

4.1.2 / 2014-05-08
==================

 * fix `req.host` for IPv6 literals
 * fix `res.jsonp` error if callback param is object

4.1.1 / 2014-04-27
==================

 * fix package.json to reflect supported node version

4.1.0 / 2014-04-24
==================

 * pass options from `res.sendfile` to `send`
 * preserve casing of headers in `res.header` and `res.set`
 * support unicode file names in `res.attachment` and `res.download`
 * update accepts to 1.0.1
   - deps: negotiator@0.4.0
 * update cookie to 0.1.2
   - Fix for maxAge == 0
   - made compat with expires field
 * update send to 0.3.0
   - Accept API options in options object
   - Coerce option types
   - Control whether to generate etags
   - Default directory access to 403 when index disabled
   - Fix sending files with dots without root set
   - Include file path in etag
   - Make "Can't set headers after they are sent." catchable
   - Send full entity-body for multi range requests
   - Set etags to "weak"
   - Support "If-Range" header
   - Support multiple index paths
   - deps: mime@1.2.11
 * update serve-static to 1.1.0
   - Accept options directly to `send` module
   - Resolve relative paths at middleware setup
   - Use parseurl to parse the URL from request
   - deps: send@0.3.0
 * update type-is to 1.1.0
   - add non-array values support
   - add `multipart` as a shorthand

4.0.0 / 2014-04-09
==================

 * remove:
   - node 0.8 support
   - connect and connect's patches except for charset handling
   - express(1) - moved to [express-generator](https://github.com/expressjs/generator)
   - `express.createServer()` - it has been deprecated for a long time. Use `express()`
   - `app.configure` - use logic in your own app code
   - `app.router` - is removed
   - `req.auth` - use `basic-auth` instead
   - `req.accepted*` - use `req.accepts*()` instead
   - `res.location` - relative URL resolution is removed
   - `res.charset` - include the charset in the content type when using `res.set()`
   - all bundled middleware except `static`
 * change:
   - `app.route` -> `app.mountpath` when mounting an express app in another express app
   - `json spaces` no longer enabled by default in development
   - `req.accepts*` -> `req.accepts*s` - i.e. `req.acceptsEncoding` -> `req.acceptsEncodings`
   - `req.params` is now an object instead of an array
   - `res.locals` is no longer a function. It is a plain js object. Treat it as such.
   - `res.headerSent` -> `res.headersSent` to match node.js ServerResponse object
 * refactor:
   - `req.accepts*` with [accepts](https://github.com/expressjs/accepts)
   - `req.is` with [type-is](https://github.com/expressjs/type-is)
   - [path-to-regexp](https://github.com/component/path-to-regexp)
 * add:
   - `app.router()` - returns the app Router instance
   - `app.route()` - Proxy to the app's `Router#route()` method to create a new route
   - Router & Route - public API

3.21.2 / 2015-07-31
===================

  * deps: connect@2.30.2
    - deps: body-parser@~1.13.3
    - deps: compression@~1.5.2
    - deps: errorhandler@~1.4.2
    - deps: method-override@~2.3.5
    - deps: serve-index@~1.7.2
    - deps: type-is@~1.6.6
    - deps: vhost@~3.0.1
  * deps: vary@~1.0.1
    - Fix setting empty header from empty `field`
    - perf: enable strict mode
    - perf: remove argument reassignments

3.21.1 / 2015-07-05
===================

  * deps: basic-auth@~1.0.3
  * deps: connect@2.30.1
    - deps: body-parser@~1.13.2
    - deps: compression@~1.5.1
    - deps: errorhandler@~1.4.1
    - deps: morgan@~1.6.1
    - deps: pause@0.1.0
    - deps: qs@4.0.0
    - deps: serve-index@~1.7.1
    - deps: type-is@~1.6.4

3.21.0 / 2015-06-18
===================

  * deps: basic-auth@1.0.2
    - perf: enable strict mode
    - perf: hoist regular expression
    - perf: parse with regular expressions
    - perf: remove argument reassignment
  * deps: connect@2.30.0
    - deps: body-parser@~1.13.1
    - deps: bytes@2.1.0
    - deps: compression@~1.5.0
    - deps: cookie@0.1.3
    - deps: cookie-parser@~1.3.5
    - deps: csurf@~1.8.3
    - deps: errorhandler@~1.4.0
    - deps: express-session@~1.11.3
    - deps: finalhandler@0.4.0
    - deps: fresh@0.3.0
    - deps: morgan@~1.6.0
    - deps: serve-favicon@~2.3.0
    - deps: serve-index@~1.7.0
    - deps: serve-static@~1.10.0
    - deps: type-is@~1.6.3
  * deps: cookie@0.1.3
    - perf: deduce the scope of try-catch deopt
    - perf: remove argument reassignments
  * deps: escape-html@1.0.2
  * deps: etag@~1.7.0
    - Always include entity length in ETags for hash length extensions
    - Generate non-Stats ETags using MD5 only (no longer CRC32)
    - Improve stat performance by removing hashing
    - Improve support for JXcore
    - Remove base64 padding in ETags to shorten
    - Support "fake" stats objects in environments without fs
    - Use MD5 instead of MD4 in weak ETags over 1KB
  * deps: fresh@0.3.0
    - Add weak `ETag` matching support
  * deps: mkdirp@0.5.1
    - Work in global strict mode
  * deps: send@0.13.0
    - Allow Node.js HTTP server to set `Date` response header
    - Fix incorrectly removing `Content-Location` on 304 response
    - Improve the default redirect response headers
    - Send appropriate headers on default error response
    - Use `http-errors` for standard emitted errors
    - Use `statuses` instead of `http` module for status messages
    - deps: escape-html@1.0.2
    - deps: etag@~1.7.0
    - deps: fresh@0.3.0
    - deps: on-finished@~2.3.0
    - perf: enable strict mode
    - perf: remove unnecessary array allocations

3.20.3 / 2015-05-17
===================

  * deps: connect@2.29.2
    - deps: body-parser@~1.12.4
    - deps: compression@~1.4.4
    - deps: connect-timeout@~1.6.2
    - deps: debug@~2.2.0
    - deps: depd@~1.0.1
    - deps: errorhandler@~1.3.6
    - deps: finalhandler@0.3.6
    - deps: method-override@~2.3.3
    - deps: morgan@~1.5.3
    - deps: qs@2.4.2
    - deps: response-time@~2.3.1
    - deps: serve-favicon@~2.2.1
    - deps: serve-index@~1.6.4
    - deps: serve-static@~1.9.3
    - deps: type-is@~1.6.2
  * deps: debug@~2.2.0
    - deps: ms@0.7.1
  * deps: depd@~1.0.1
  * deps: proxy-addr@~1.0.8
    - deps: ipaddr.js@1.0.1
  * deps: send@0.12.3
    - deps: debug@~2.2.0
    - deps: depd@~1.0.1
    - deps: etag@~1.6.0
    - deps: ms@0.7.1
    - deps: on-finished@~2.2.1

3.20.2 / 2015-03-16
===================

  * deps: connect@2.29.1
    - deps: body-parser@~1.12.2
    - deps: compression@~1.4.3
    - deps: connect-timeout@~1.6.1
    - deps: debug@~2.1.3
    - deps: errorhandler@~1.3.5
    - deps: express-session@~1.10.4
    - deps: finalhandler@0.3.4
    - deps: method-override@~2.3.2
    - deps: morgan@~1.5.2
    - deps: qs@2.4.1
    - deps: serve-index@~1.6.3
    - deps: serve-static@~1.9.2
    - deps: type-is@~1.6.1
  * deps: debug@~2.1.3
    - Fix high intensity foreground color for bold
    - deps: ms@0.7.0
  * deps: merge-descriptors@1.0.0
  * deps: proxy-addr@~1.0.7
    - deps: ipaddr.js@0.1.9
  * deps: send@0.12.2
    - Throw errors early for invalid `extensions` or `index` options
    - deps: debug@~2.1.3

3.20.1 / 2015-02-28
===================

  * Fix `req.host` when using "trust proxy" hops count
  * Fix `req.protocol`/`req.secure` when using "trust proxy" hops count

3.20.0 / 2015-02-18
===================

  * Fix `"trust proxy"` setting to inherit when app is mounted
  * Generate `ETag`s for all request responses
    - No longer restricted to only responses for `GET` and `HEAD` requests
  * Use `content-type` to parse `Content-Type` headers
  * deps: connect@2.29.0
    - Use `content-type` to parse `Content-Type` headers
    - deps: body-parser@~1.12.0
    - deps: compression@~1.4.1
    - deps: connect-timeout@~1.6.0
    - deps: cookie-parser@~1.3.4
    - deps: cookie-signature@1.0.6
    - deps: csurf@~1.7.0
    - deps: errorhandler@~1.3.4
    - deps: express-session@~1.10.3
    - deps: http-errors@~1.3.1
    - deps: response-time@~2.3.0
    - deps: serve-index@~1.6.2
    - deps: serve-static@~1.9.1
    - deps: type-is@~1.6.0
  * deps: cookie-signature@1.0.6
  * deps: send@0.12.1
    - Always read the stat size from the file
    - Fix mutating passed-in `options`
    - deps: mime@1.3.4

3.19.2 / 2015-02-01
===================

  * deps: connect@2.28.3
    - deps: compression@~1.3.1
    - deps: csurf@~1.6.6
    - deps: errorhandler@~1.3.3
    - deps: express-session@~1.10.2
    - deps: serve-index@~1.6.1
    - deps: type-is@~1.5.6
  * deps: proxy-addr@~1.0.6
    - deps: ipaddr.js@0.1.8

3.19.1 / 2015-01-20
===================

  * deps: connect@2.28.2
    - deps: body-parser@~1.10.2
    - deps: serve-static@~1.8.1
  * deps: send@0.11.1
    - Fix root path disclosure

3.19.0 / 2015-01-09
===================

  * Fix `OPTIONS` responses to include the `HEAD` method property
  * Use `readline` for prompt in `express(1)`
  * deps: commander@2.6.0
  * deps: connect@2.28.1
    - deps: body-parser@~1.10.1
    - deps: compression@~1.3.0
    - deps: connect-timeout@~1.5.0
    - deps: csurf@~1.6.4
    - deps: debug@~2.1.1
    - deps: errorhandler@~1.3.2
    - deps: express-session@~1.10.1
    - deps: finalhandler@0.3.3
    - deps: method-override@~2.3.1
    - deps: morgan@~1.5.1
    - deps: serve-favicon@~2.2.0
    - deps: serve-index@~1.6.0
    - deps: serve-static@~1.8.0
    - deps: type-is@~1.5.5
  * deps: debug@~2.1.1
  * deps: methods@~1.1.1
  * deps: proxy-addr@~1.0.5
    - deps: ipaddr.js@0.1.6
  * deps: send@0.11.0
    - deps: debug@~2.1.1
    - deps: etag@~1.5.1
    - deps: ms@0.7.0
    - deps: on-finished@~2.2.0

3.18.6 / 2014-12-12
===================

  * Fix exception in `req.fresh`/`req.stale` without response headers

3.18.5 / 2014-12-11
===================

  * deps: connect@2.27.6
    - deps: compression@~1.2.2
    - deps: express-session@~1.9.3
    - deps: http-errors@~1.2.8
    - deps: serve-index@~1.5.3
    - deps: type-is@~1.5.4

3.18.4 / 2014-11-23
===================

  * deps: connect@2.27.4
    - deps: body-parser@~1.9.3
    - deps: compression@~1.2.1
    - deps: errorhandler@~1.2.3
    - deps: express-session@~1.9.2
    - deps: qs@2.3.3
    - deps: serve-favicon@~2.1.7
    - deps: serve-static@~1.5.1
    - deps: type-is@~1.5.3
  * deps: etag@~1.5.1
  * deps: proxy-addr@~1.0.4
    - deps: ipaddr.js@0.1.5

3.18.3 / 2014-11-09
===================

  * deps: connect@2.27.3
    - Correctly invoke async callback asynchronously
    - deps: csurf@~1.6.3

3.18.2 / 2014-10-28
===================

  * deps: connect@2.27.2
    - Fix handling of URLs containing `://` in the path
    - deps: body-parser@~1.9.2
    - deps: qs@2.3.2

3.18.1 / 2014-10-22
===================

  * Fix internal `utils.merge` deprecation warnings
  * deps: connect@2.27.1
    - deps: body-parser@~1.9.1
    - deps: express-session@~1.9.1
    - deps: finalhandler@0.3.2
    - deps: morgan@~1.4.1
    - deps: qs@2.3.0
    - deps: serve-static@~1.7.1
  * deps: send@0.10.1
    - deps: on-finished@~2.1.1

3.18.0 / 2014-10-17
===================

  * Use `content-disposition` module for `res.attachment`/`res.download`
    - Sends standards-compliant `Content-Disposition` header
    - Full Unicode support
  * Use `etag` module to generate `ETag` headers
  * deps: connect@2.27.0
    - Use `http-errors` module for creating errors
    - Use `utils-merge` module for merging objects
    - deps: body-parser@~1.9.0
    - deps: compression@~1.2.0
    - deps: connect-timeout@~1.4.0
    - deps: debug@~2.1.0
    - deps: depd@~1.0.0
    - deps: express-session@~1.9.0
    - deps: finalhandler@0.3.1
    - deps: method-override@~2.3.0
    - deps: morgan@~1.4.0
    - deps: response-time@~2.2.0
    - deps: serve-favicon@~2.1.6
    - deps: serve-index@~1.5.0
    - deps: serve-static@~1.7.0
  * deps: debug@~2.1.0
    - Implement `DEBUG_FD` env variable support
  * deps: depd@~1.0.0
  * deps: send@0.10.0
    - deps: debug@~2.1.0
    - deps: depd@~1.0.0
    - deps: etag@~1.5.0

3.17.8 / 2014-10-15
===================

  * deps: connect@2.26.6
    - deps: compression@~1.1.2
    - deps: csurf@~1.6.2
    - deps: errorhandler@~1.2.2

3.17.7 / 2014-10-08
===================

  * deps: connect@2.26.5
    - Fix accepting non-object arguments to `logger`
    - deps: serve-static@~1.6.4

3.17.6 / 2014-10-02
===================

  * deps: connect@2.26.4
    - deps: morgan@~1.3.2
    - deps: type-is@~1.5.2

3.17.5 / 2014-09-24
===================

  * deps: connect@2.26.3
    - deps: body-parser@~1.8.4
    - deps: serve-favicon@~2.1.5
    - deps: serve-static@~1.6.3
  * deps: proxy-addr@~1.0.3
    - Use `forwarded` npm module
  * deps: send@0.9.3
    - deps: etag@~1.4.0

3.17.4 / 2014-09-19
===================

  * deps: connect@2.26.2
    - deps: body-parser@~1.8.3
    - deps: qs@2.2.4

3.17.3 / 2014-09-18
===================

  * deps: proxy-addr@~1.0.2
    - Fix a global leak when multiple subnets are trusted
    - deps: ipaddr.js@0.1.3

3.17.2 / 2014-09-15
===================

  * Use `crc` instead of `buffer-crc32` for speed
  * deps: connect@2.26.1
    - deps: body-parser@~1.8.2
    - deps: depd@0.4.5
    - deps: express-session@~1.8.2
    - deps: morgan@~1.3.1
    - deps: serve-favicon@~2.1.3
    - deps: serve-static@~1.6.2
  * deps: depd@0.4.5
  * deps: send@0.9.2
    - deps: depd@0.4.5
    - deps: etag@~1.3.1
    - deps: range-parser@~1.0.2

3.17.1 / 2014-09-08
===================

  * Fix error in `req.subdomains` on empty host

3.17.0 / 2014-09-08
===================

  * Support `X-Forwarded-Host` in `req.subdomains`
  * Support IP address host in `req.subdomains`
  * deps: connect@2.26.0
    - deps: body-parser@~1.8.1
    - deps: compression@~1.1.0
    - deps: connect-timeout@~1.3.0
    - deps: cookie-parser@~1.3.3
    - deps: cookie-signature@1.0.5
    - deps: csurf@~1.6.1
    - deps: debug@~2.0.0
    - deps: errorhandler@~1.2.0
    - deps: express-session@~1.8.1
    - deps: finalhandler@0.2.0
    - deps: fresh@0.2.4
    - deps: media-typer@0.3.0
    - deps: method-override@~2.2.0
    - deps: morgan@~1.3.0
    - deps: qs@2.2.3
    - deps: serve-favicon@~2.1.3
    - deps: serve-index@~1.2.1
    - deps: serve-static@~1.6.1
    - deps: type-is@~1.5.1
    - deps: vhost@~3.0.0
  * deps: cookie-signature@1.0.5
  * deps: debug@~2.0.0
  * deps: fresh@0.2.4
  * deps: media-typer@0.3.0
    - Throw error when parameter format invalid on parse
  * deps: range-parser@~1.0.2
  * deps: send@0.9.1
    - Add `lastModified` option
    - Use `etag` to generate `ETag` header
    - deps: debug@~2.0.0
    - deps: fresh@0.2.4
  * deps: vary@~1.0.0
    - Accept valid `Vary` header string as `field`

3.16.10 / 2014-09-04
====================

  * deps: connect@2.25.10
    - deps: serve-static@~1.5.4
  * deps: send@0.8.5
    - Fix a path traversal issue when using `root`
    - Fix malicious path detection for empty string path

3.16.9 / 2014-08-29
===================

  * deps: connect@2.25.9
    - deps: body-parser@~1.6.7
    - deps: qs@2.2.2

3.16.8 / 2014-08-27
===================

  * deps: connect@2.25.8
    - deps: body-parser@~1.6.6
    - deps: csurf@~1.4.1
    - deps: qs@2.2.0

3.16.7 / 2014-08-18
===================

  * deps: connect@2.25.7
    - deps: body-parser@~1.6.5
    - deps: express-session@~1.7.6
    - deps: morgan@~1.2.3
    - deps: serve-static@~1.5.3
  * deps: send@0.8.3
    - deps: destroy@1.0.3
    - deps: on-finished@2.1.0

3.16.6 / 2014-08-14
===================

  * deps: connect@2.25.6
    - deps: body-parser@~1.6.4
    - deps: qs@1.2.2
    - deps: serve-static@~1.5.2
  * deps: send@0.8.2
    - Work around `fd` leak in Node.js 0.10 for `fs.ReadStream`

3.16.5 / 2014-08-11
===================

  * deps: connect@2.25.5
    - Fix backwards compatibility in `logger`

3.16.4 / 2014-08-10
===================

  * Fix original URL parsing in `res.location`
  * deps: connect@2.25.4
    - Fix `query` middleware breaking with argument
    - deps: body-parser@~1.6.3
    - deps: compression@~1.0.11
    - deps: connect-timeout@~1.2.2
    - deps: express-session@~1.7.5
    - deps: method-override@~2.1.3
    - deps: on-headers@~1.0.0
    - deps: parseurl@~1.3.0
    - deps: qs@1.2.1
    - deps: response-time@~2.0.1
    - deps: serve-index@~1.1.6
    - deps: serve-static@~1.5.1
  * deps: parseurl@~1.3.0

3.16.3 / 2014-08-07
===================

  * deps: connect@2.25.3
    - deps: multiparty@3.3.2

3.16.2 / 2014-08-07
===================

  * deps: connect@2.25.2
    - deps: body-parser@~1.6.2
    - deps: qs@1.2.0

3.16.1 / 2014-08-06
===================

  * deps: connect@2.25.1
    - deps: body-parser@~1.6.1
    - deps: qs@1.1.0

3.16.0 / 2014-08-05
===================

  * deps: connect@2.25.0
    - deps: body-parser@~1.6.0
    - deps: compression@~1.0.10
    - deps: csurf@~1.4.0
    - deps: express-session@~1.7.4
    - deps: qs@1.0.2
    - deps: serve-static@~1.5.0
  * deps: send@0.8.1
    - Add `extensions` option

3.15.3 / 2014-08-04
===================

  * fix `res.sendfile` regression for serving directory index files
  * deps: connect@2.24.3
    - deps: serve-index@~1.1.5
    - deps: serve-static@~1.4.4
  * deps: send@0.7.4
    - Fix incorrect 403 on Windows and Node.js 0.11
    - Fix serving index files without root dir

3.15.2 / 2014-07-27
===================

  * deps: connect@2.24.2
    - deps: body-parser@~1.5.2
    - deps: depd@0.4.4
    - deps: express-session@~1.7.2
    - deps: morgan@~1.2.2
    - deps: serve-static@~1.4.2
  * deps: depd@0.4.4
    - Work-around v8 generating empty stack traces
  * deps: send@0.7.2
    - deps: depd@0.4.4

3.15.1 / 2014-07-26
===================

  * deps: connect@2.24.1
    - deps: body-parser@~1.5.1
    - deps: depd@0.4.3
    - deps: express-session@~1.7.1
    - deps: morgan@~1.2.1
    - deps: serve-index@~1.1.4
    - deps: serve-static@~1.4.1
  * deps: depd@0.4.3
    - Fix exception when global `Error.stackTraceLimit` is too low
  * deps: send@0.7.1
    - deps: depd@0.4.3

3.15.0 / 2014-07-22
===================

  * Fix `req.protocol` for proxy-direct connections
  * Pass options from `res.sendfile` to `send`
  * deps: connect@2.24.0
    - deps: body-parser@~1.5.0
    - deps: compression@~1.0.9
    - deps: connect-timeout@~1.2.1
    - deps: debug@1.0.4
    - deps: depd@0.4.2
    - deps: express-session@~1.7.0
    - deps: finalhandler@0.1.0
    - deps: method-override@~2.1.2
    - deps: morgan@~1.2.0
    - deps: multiparty@3.3.1
    - deps: parseurl@~1.2.0
    - deps: serve-static@~1.4.0
  * deps: debug@1.0.4
  * deps: depd@0.4.2
    - Add `TRACE_DEPRECATION` environment variable
    - Remove non-standard grey color from color output
    - Support `--no-deprecation` argument
    - Support `--trace-deprecation` argument
  * deps: parseurl@~1.2.0
    - Cache URLs based on original value
    - Remove no-longer-needed URL mis-parse work-around
    - Simplify the "fast-path" `RegExp`
  * deps: send@0.7.0
    - Add `dotfiles` option
    - Cap `maxAge` value to 1 year
    - deps: debug@1.0.4
    - deps: depd@0.4.2

3.14.0 / 2014-07-11
===================

 * add explicit "Rosetta Flash JSONP abuse" protection
   - previous versions are not vulnerable; this is just explicit protection
 * deprecate `res.redirect(url, status)` -- use `res.redirect(status, url)` instead
 * fix `res.send(status, num)` to send `num` as json (not error)
 * remove unnecessary escaping when `res.jsonp` returns JSON response
 * deps: basic-auth@1.0.0
   - support empty password
   - support empty username
 * deps: connect@2.23.0
   - deps: debug@1.0.3
   - deps: express-session@~1.6.4
   - deps: method-override@~2.1.0
   - deps: parseurl@~1.1.3
   - deps: serve-static@~1.3.1
  * deps: debug@1.0.3
    - Add support for multiple wildcards in namespaces
  * deps: methods@1.1.0
    - add `CONNECT`
  * deps: parseurl@~1.1.3
    - faster parsing of href-only URLs

3.13.0 / 2014-07-03
===================

 * add deprecation message to `app.configure`
 * add deprecation message to `req.auth`
 * use `basic-auth` to parse `Authorization` header
 * deps: connect@2.22.0
   - deps: csurf@~1.3.0
   - deps: express-session@~1.6.1
   - deps: multiparty@3.3.0
   - deps: serve-static@~1.3.0
 * deps: send@0.5.0
   - Accept string for `maxage` (converted by `ms`)
   - Include link in default redirect response

3.12.1 / 2014-06-26
===================

 * deps: connect@2.21.1
   - deps: cookie-parser@1.3.2
   - deps: cookie-signature@1.0.4
   - deps: express-session@~1.5.2
   - deps: type-is@~1.3.2
 * deps: cookie-signature@1.0.4
   - fix for timing attacks

3.12.0 / 2014-06-21
===================

 * use `media-typer` to alter content-type charset
 * deps: connect@2.21.0
   - deprecate `connect(middleware)` -- use `app.use(middleware)` instead
   - deprecate `connect.createServer()` -- use `connect()` instead
   - fix `res.setHeader()` patch to work with get -> append -> set pattern
   - deps: compression@~1.0.8
   - deps: errorhandler@~1.1.1
   - deps: express-session@~1.5.0
   - deps: serve-index@~1.1.3

3.11.0 / 2014-06-19
===================

 * deprecate things with `depd` module
 * deps: buffer-crc32@0.2.3
 * deps: connect@2.20.2
   - deprecate `verify` option to `json` -- use `body-parser` npm module instead
   - deprecate `verify` option to `urlencoded` -- use `body-parser` npm module instead
   - deprecate things with `depd` module
   - use `finalhandler` for final response handling
   - use `media-typer` to parse `content-type` for charset
   - deps: body-parser@1.4.3
   - deps: connect-timeout@1.1.1
   - deps: cookie-parser@1.3.1
   - deps: csurf@1.2.2
   - deps: errorhandler@1.1.0
   - deps: express-session@1.4.0
   - deps: multiparty@3.2.9
   - deps: serve-index@1.1.2
   - deps: type-is@1.3.1
   - deps: vhost@2.0.0

3.10.5 / 2014-06-11
===================

 * deps: connect@2.19.6
   - deps: body-parser@1.3.1
   - deps: compression@1.0.7
   - deps: debug@1.0.2
   - deps: serve-index@1.1.1
   - deps: serve-static@1.2.3
 * deps: debug@1.0.2
 * deps: send@0.4.3
   - Do not throw uncatchable error on file open race condition
   - Use `escape-html` for HTML escaping
   - deps: debug@1.0.2
   - deps: finished@1.2.2
   - deps: fresh@0.2.2

3.10.4 / 2014-06-09
===================

 * deps: connect@2.19.5
   - fix "event emitter leak" warnings
   - deps: csurf@1.2.1
   - deps: debug@1.0.1
   - deps: serve-static@1.2.2
   - deps: type-is@1.2.1
 * deps: debug@1.0.1
 * deps: send@0.4.2
   - fix "event emitter leak" warnings
   - deps: finished@1.2.1
   - deps: debug@1.0.1

3.10.3 / 2014-06-05
===================

 * use `vary` module for `res.vary`
 * deps: connect@2.19.4
   - deps: errorhandler@1.0.2
   - deps: method-override@2.0.2
   - deps: serve-favicon@2.0.1
 * deps: debug@1.0.0

3.10.2 / 2014-06-03
===================

 * deps: connect@2.19.3
   - deps: compression@1.0.6

3.10.1 / 2014-06-03
===================

 * deps: connect@2.19.2
   - deps: compression@1.0.4
 * deps: proxy-addr@1.0.1

3.10.0 / 2014-06-02
===================

 * deps: connect@2.19.1
   - deprecate `methodOverride()` -- use `method-override` npm module instead
   - deps: body-parser@1.3.0
   - deps: method-override@2.0.1
   - deps: multiparty@3.2.8
   - deps: response-time@2.0.0
   - deps: serve-static@1.2.1
 * deps: methods@1.0.1
 * deps: send@0.4.1
   - Send `max-age` in `Cache-Control` in correct format

3.9.0 / 2014-05-30
==================

 * custom etag control with `app.set('etag', val)`
   - `app.set('etag', function(body, encoding){ return '"etag"' })` custom etag generation
   - `app.set('etag', 'weak')` weak tag
   - `app.set('etag', 'strong')` strong etag
   - `app.set('etag', false)` turn off
   - `app.set('etag', true)` standard etag
 * Include ETag in HEAD requests
 * mark `res.send` ETag as weak and reduce collisions
 * update connect to 2.18.0
   - deps: compression@1.0.3
   - deps: serve-index@1.1.0
   - deps: serve-static@1.2.0
 * update send to 0.4.0
   - Calculate ETag with md5 for reduced collisions
   - Ignore stream errors after request ends
   - deps: debug@0.8.1

3.8.1 / 2014-05-27
==================

 * update connect to 2.17.3
   - deps: body-parser@1.2.2
   - deps: express-session@1.2.1
   - deps: method-override@1.0.2

3.8.0 / 2014-05-21
==================

 * keep previous `Content-Type` for `res.jsonp`
 * set proper `charset` in `Content-Type` for `res.send`
 * update connect to 2.17.1
   - fix `res.charset` appending charset when `content-type` has one
   - deps: express-session@1.2.0
   - deps: morgan@1.1.1
   - deps: serve-index@1.0.3

3.7.0 / 2014-05-18
==================

 * proper proxy trust with `app.set('trust proxy', trust)`
   - `app.set('trust proxy', 1)` trust first hop
   - `app.set('trust proxy', 'loopback')` trust loopback addresses
   - `app.set('trust proxy', '10.0.0.1')` trust single IP
   - `app.set('trust proxy', '10.0.0.1/16')` trust subnet
   - `app.set('trust proxy', '10.0.0.1, 10.0.0.2')` trust list
   - `app.set('trust proxy', false)` turn off
   - `app.set('trust proxy', true)` trust everything
 * update connect to 2.16.2
   - deprecate `res.headerSent` -- use `res.headersSent`
   - deprecate `res.on("header")` -- use on-headers module instead
   - fix edge-case in `res.appendHeader` that would append in wrong order
   - json: use body-parser
   - urlencoded: use body-parser
   - dep: bytes@1.0.0
   - dep: cookie-parser@1.1.0
   - dep: csurf@1.2.0
   - dep: express-session@1.1.0
   - dep: method-override@1.0.1

3.6.0 / 2014-05-09
==================

 * deprecate `app.del()` -- use `app.delete()` instead
 * deprecate `res.json(obj, status)` -- use `res.json(status, obj)` instead
   - the edge-case `res.json(status, num)` requires `res.status(status).json(num)`
 * deprecate `res.jsonp(obj, status)` -- use `res.jsonp(status, obj)` instead
   - the edge-case `res.jsonp(status, num)` requires `res.status(status).jsonp(num)`
 * support PURGE method
   - add `app.purge`
   - add `router.purge`
   - include PURGE in `app.all`
 * update connect to 2.15.0
   * Add `res.appendHeader`
   * Call error stack even when response has been sent
   * Patch `res.headerSent` to return Boolean
   * Patch `res.headersSent` for node.js 0.8
   * Prevent default 404 handler after response sent
   * dep: compression@1.0.2
   * dep: connect-timeout@1.1.0
   * dep: debug@^0.8.0
   * dep: errorhandler@1.0.1
   * dep: express-session@1.0.4
   * dep: morgan@1.0.1
   * dep: serve-favicon@2.0.0
   * dep: serve-index@1.0.2
 * update debug to 0.8.0
   * add `enable()` method
   * change from stderr to stdout
 * update methods to 1.0.0
   - add PURGE
 * update mkdirp to 0.5.0

3.5.3 / 2014-05-08
==================

 * fix `req.host` for IPv6 literals
 * fix `res.jsonp` error if callback param is object

3.5.2 / 2014-04-24
==================

 * update connect to 2.14.5
 * update cookie to 0.1.2
 * update mkdirp to 0.4.0
 * update send to 0.3.0

3.5.1 / 2014-03-25
==================

 * pin less-middleware in generated app

3.5.0 / 2014-03-06
==================

 * bump deps

3.4.8 / 2014-01-13
==================

 * prevent incorrect automatic OPTIONS responses #1868 @dpatti
 * update binary and examples for jade 1.0 #1876 @yossi, #1877 @reqshark, #1892 @matheusazzi
 * throw 400 in case of malformed paths @rlidwka

3.4.7 / 2013-12-10
==================

 * update connect

3.4.6 / 2013-12-01
==================

 * update connect (raw-body)

3.4.5 / 2013-11-27
==================

 * update connect
 * res.location: remove leading ./ #1802 @kapouer
 * res.redirect: fix `res.redirect('toString') #1829 @michaelficarra
 * res.send: always send ETag when content-length > 0
 * router: add Router.all() method

3.4.4 / 2013-10-29
==================

 * update connect
 * update supertest
 * update methods
 * express(1): replace bodyParser() with urlencoded() and json() #1795 @chirag04

3.4.3 / 2013-10-23
==================

 * update connect

3.4.2 / 2013-10-18
==================

 * update connect
 * downgrade commander

3.4.1 / 2013-10-15
==================

 * update connect
 * update commander
 * jsonp: check if callback is a function
 * router: wrap encodeURIComponent in a try/catch #1735 (@lxe)
 * res.format: now includes charset @1747 (@sorribas)
 * res.links: allow multiple calls @1746 (@sorribas)

3.4.0 / 2013-09-07
==================

 * add res.vary(). Closes #1682
 * update connect

3.3.8 / 2013-09-02
==================

 * update connect

3.3.7 / 2013-08-28
==================

 * update connect

3.3.6 / 2013-08-27
==================

 * Revert "remove charset from json responses. Closes #1631" (causes issues in some clients)
 * add: req.accepts take an argument list

3.3.4 / 2013-07-08
==================

 * update send and connect

3.3.3 / 2013-07-04
==================

 * update connect

3.3.2 / 2013-07-03
==================

 * update connect
 * update send
 * remove .version export

3.3.1 / 2013-06-27
==================

 * update connect

3.3.0 / 2013-06-26
==================

 * update connect
 * add support for multiple X-Forwarded-Proto values. Closes #1646
 * change: remove charset from json responses. Closes #1631
 * change: return actual booleans from req.accept* functions
 * fix jsonp callback array throw

3.2.6 / 2013-06-02
==================

 * update connect

3.2.5 / 2013-05-21
==================

 * update connect
 * update node-cookie
 * add: throw a meaningful error when there is no default engine
 * change generation of ETags with res.send() to GET requests only. Closes #1619

3.2.4 / 2013-05-09
==================

  * fix `req.subdomains` when no Host is present
  * fix `req.host` when no Host is present, return undefined

3.2.3 / 2013-05-07
==================

  * update connect / qs

3.2.2 / 2013-05-03
==================

  * update qs

3.2.1 / 2013-04-29
==================

  * add app.VERB() paths array deprecation warning
  * update connect
  * update qs and remove all ~ semver crap
  * fix: accept number as value of Signed Cookie

3.2.0 / 2013-04-15
==================

  * add "view" constructor setting to override view behaviour
  * add req.acceptsEncoding(name)
  * add req.acceptedEncodings
  * revert cookie signature change causing session race conditions
  * fix sorting of Accept values of the same quality

3.1.2 / 2013-04-12
==================

  * add support for custom Accept parameters
  * update cookie-signature

3.1.1 / 2013-04-01
==================

  * add X-Forwarded-Host support to `req.host`
  * fix relative redirects
  * update mkdirp
  * update buffer-crc32
  * remove legacy app.configure() method from app template.

3.1.0 / 2013-01-25
==================

  * add support for leading "." in "view engine" setting
  * add array support to `res.set()`
  * add node 0.8.x to travis.yml
  * add "subdomain offset" setting for tweaking `req.subdomains`
  * add `res.location(url)` implementing `res.redirect()`-like setting of Location
  * use app.get() for x-powered-by setting for inheritance
  * fix colons in passwords for `req.auth`

3.0.6 / 2013-01-04
==================

  * add http verb methods to Router
  * update connect
  * fix mangling of the `res.cookie()` options object
  * fix jsonp whitespace escape. Closes #1132

3.0.5 / 2012-12-19
==================

  * add throwing when a non-function is passed to a route
  * fix: explicitly remove Transfer-Encoding header from 204 and 304 responses
  * revert "add 'etag' option"

3.0.4 / 2012-12-05
==================

  * add 'etag' option to disable `res.send()` Etags
  * add escaping of urls in text/plain in `res.redirect()`
    for old browsers interpreting as html
  * change crc32 module for a more liberal license
  * update connect

3.0.3 / 2012-11-13
==================

  * update connect
  * update cookie module
  * fix cookie max-age

3.0.2 / 2012-11-08
==================

  * add OPTIONS to cors example. Closes #1398
  * fix route chaining regression. Closes #1397

3.0.1 / 2012-11-01
==================

  * update connect

3.0.0 / 2012-10-23
==================

  * add `make clean`
  * add "Basic" check to req.auth
  * add `req.auth` test coverage
  * add cb && cb(payload) to `res.jsonp()`. Closes #1374
  * add backwards compat for `res.redirect()` status. Closes #1336
  * add support for `res.json()` to retain previously defined Content-Types. Closes #1349
  * update connect
  * change `res.redirect()` to utilize a pathname-relative Location again. Closes #1382
  * remove non-primitive string support for `res.send()`
  * fix view-locals example. Closes #1370
  * fix route-separation example

3.0.0rc5 / 2012-09-18
==================

  * update connect
  * add redis search example
  * add static-files example
  * add "x-powered-by" setting (`app.disable('x-powered-by')`)
  * add "application/octet-stream" redirect Accept test case. Closes #1317

3.0.0rc4 / 2012-08-30
==================

  * add `res.jsonp()`. Closes #1307
  * add "verbose errors" option to error-pages example
  * add another route example to express(1) so people are not so confused
  * add redis online user activity tracking example
  * update connect dep
  * fix etag quoting. Closes #1310
  * fix error-pages 404 status
  * fix jsonp callback char restrictions
  * remove old OPTIONS default response

3.0.0rc3 / 2012-08-13
==================

  * update connect dep
  * fix signed cookies to work with `connect.cookieParser()` ("s:" prefix was missing) [tnydwrds]
  * fix `res.render()` clobbering of "locals"

3.0.0rc2 / 2012-08-03
==================

  * add CORS example
  * update connect dep
  * deprecate `.createServer()` & remove old stale examples
  * fix: escape `res.redirect()` link
  * fix vhost example

3.0.0rc1 / 2012-07-24
==================

  * add more examples to view-locals
  * add scheme-relative redirects (`res.redirect("//foo.com")`) support
  * update cookie dep
  * update connect dep
  * update send dep
  * fix `express(1)` -h flag, use -H for hogan. Closes #1245
  * fix `res.sendfile()` socket error handling regression

3.0.0beta7 / 2012-07-16
==================

  * update connect dep for `send()` root normalization regression

3.0.0beta6 / 2012-07-13
==================

  * add `err.view` property for view errors. Closes #1226
  * add "jsonp callback name" setting
  * add support for "/foo/:bar*" non-greedy matches
  * change `res.sendfile()` to use `send()` module
  * change `res.send` to use "response-send" module
  * remove `app.locals.use` and `res.locals.use`, use regular middleware

3.0.0beta5 / 2012-07-03
==================

  * add "make check" support
  * add route-map example
  * add `res.json(obj, status)` support back for BC
  * add "methods" dep, remove internal methods module
  * update connect dep
  * update auth example to utilize cores pbkdf2
  * updated tests to use "supertest"

3.0.0beta4 / 2012-06-25
==================

  * Added `req.auth`
  * Added `req.range(size)`
  * Added `res.links(obj)`
  * Added `res.send(body, status)` support back for backwards compat
  * Added `.default()` support to `res.format()`
  * Added 2xx / 304 check to `req.fresh`
  * Revert "Added + support to the router"
  * Fixed `res.send()` freshness check, respect res.statusCode

3.0.0beta3 / 2012-06-15
==================

  * Added hogan `--hjs` to express(1) [nullfirm]
  * Added another example to content-negotiation
  * Added `fresh` dep
  * Changed: `res.send()` always checks freshness
  * Fixed: expose connects mime module. Closes #1165

3.0.0beta2 / 2012-06-06
==================

  * Added `+` support to the router
  * Added `req.host`
  * Changed `req.param()` to check route first
  * Update connect dep

3.0.0beta1 / 2012-06-01
==================

  * Added `res.format()` callback to override default 406 behaviour
  * Fixed `res.redirect()` 406. Closes #1154

3.0.0alpha5 / 2012-05-30
==================

  * Added `req.ip`
  * Added `{ signed: true }` option to `res.cookie()`
  * Removed `res.signedCookie()`
  * Changed: dont reverse `req.ips`
  * Fixed "trust proxy" setting check for `req.ips`

3.0.0alpha4 / 2012-05-09
==================

  * Added: allow `[]` in jsonp callback. Closes #1128
  * Added `PORT` env var support in generated template. Closes #1118 [benatkin]
  * Updated: connect 2.2.2

3.0.0alpha3 / 2012-05-04
==================

  * Added public `app.routes`. Closes #887
  * Added _view-locals_ example
  * Added _mvc_ example
  * Added `res.locals.use()`. Closes #1120
  * Added conditional-GET support to `res.send()`
  * Added: coerce `res.set()` values to strings
  * Changed: moved `static()` in generated apps below router
  * Changed: `res.send()` only set ETag when not previously set
  * Changed connect 2.2.1 dep
  * Changed: `make test` now runs unit / acceptance tests
  * Fixed req/res proto inheritance

3.0.0alpha2 / 2012-04-26
==================

  * Added `make benchmark` back
  * Added `res.send()` support for `String` objects
  * Added client-side data exposing example
  * Added `res.header()` and `req.header()` aliases for BC
  * Added `express.createServer()` for BC
  * Perf: memoize parsed urls
  * Perf: connect 2.2.0 dep
  * Changed: make `expressInit()` middleware self-aware
  * Fixed: use app.get() for all core settings
  * Fixed redis session example
  * Fixed session example. Closes #1105
  * Fixed generated express dep. Closes #1078

3.0.0alpha1 / 2012-04-15
==================

  * Added `app.locals.use(callback)`
  * Added `app.locals` object
  * Added `app.locals(obj)`
  * Added `res.locals` object
  * Added `res.locals(obj)`
  * Added `res.format()` for content-negotiation
  * Added `app.engine()`
  * Added `res.cookie()` JSON cookie support
  * Added "trust proxy" setting
  * Added `req.subdomains`
  * Added `req.protocol`
  * Added `req.secure`
  * Added `req.path`
  * Added `req.ips`
  * Added `req.fresh`
  * Added `req.stale`
  * Added comma-delimited / array support for `req.accepts()`
  * Added debug instrumentation
  * Added `res.set(obj)`
  * Added `res.set(field, value)`
  * Added `res.get(field)`
  * Added `app.get(setting)`. Closes #842
  * Added `req.acceptsLanguage()`
  * Added `req.acceptsCharset()`
  * Added `req.accepted`
  * Added `req.acceptedLanguages`
  * Added `req.acceptedCharsets`
  * Added "json replacer" setting
  * Added "json spaces" setting
  * Added X-Forwarded-Proto support to `res.redirect()`. Closes #92
  * Added `--less` support to express(1)
  * Added `express.response` prototype
  * Added `express.request` prototype
  * Added `express.application` prototype
  * Added `app.path()`
  * Added `app.render()`
  * Added `res.type()` to replace `res.contentType()`
  * Changed: `res.redirect()` to add relative support
  * Changed: enable "jsonp callback" by default
  * Changed: renamed "case sensitive routes" to "case sensitive routing"
  * Rewrite of all tests with mocha
  * Removed "root" setting
  * Removed `res.redirect('home')` support
  * Removed `req.notify()`
  * Removed `app.register()`
  * Removed `app.redirect()`
  * Removed `app.is()`
  * Removed `app.helpers()`
  * Removed `app.dynamicHelpers()`
  * Fixed `res.sendfile()` with non-GET. Closes #723
  * Fixed express(1) public dir for windows. Closes #866

2.5.9/ 2012-04-02
==================

  * Added support for PURGE request method [pbuyle]
  * Fixed `express(1)` generated app `app.address()` before `listening` [mmalecki]

2.5.8 / 2012-02-08
==================

  * Update mkdirp dep. Closes #991

2.5.7 / 2012-02-06
==================

  * Fixed `app.all` duplicate DELETE requests [mscdex]

2.5.6 / 2012-01-13
==================

  * Updated hamljs dev dep. Closes #953

2.5.5 / 2012-01-08
==================

  * Fixed: set `filename` on cached templates [matthewleon]

2.5.4 / 2012-01-02
==================

  * Fixed `express(1)` eol on 0.4.x. Closes #947

2.5.3 / 2011-12-30
==================

  * Fixed `req.is()` when a charset is present

2.5.2 / 2011-12-10
==================

  * Fixed: express(1) LF -> CRLF for windows

2.5.1 / 2011-11-17
==================

  * Changed: updated connect to 1.8.x
  * Removed sass.js support from express(1)

2.5.0 / 2011-10-24
==================

  * Added ./routes dir for generated app by default
  * Added npm install reminder to express(1) app gen
  * Added 0.5.x support
  * Removed `make test-cov` since it wont work with node 0.5.x
  * Fixed express(1) public dir for windows. Closes #866

2.4.7 / 2011-10-05
==================

  * Added mkdirp to express(1). Closes #795
  * Added simple _json-config_ example
  * Added  shorthand for the parsed request's pathname via `req.path`
  * Changed connect dep to 1.7.x to fix npm issue...
  * Fixed `res.redirect()` __HEAD__ support. [reported by xerox]
  * Fixed `req.flash()`, only escape args
  * Fixed absolute path checking on windows. Closes #829 [reported by andrewpmckenzie]

2.4.6 / 2011-08-22
==================

  * Fixed multiple param callback regression. Closes #824 [reported by TroyGoode]

2.4.5 / 2011-08-19
==================

  * Added support for routes to handle errors. Closes #809
  * Added `app.routes.all()`. Closes #803
  * Added "basepath" setting to work in conjunction with reverse proxies etc.
  * Refactored `Route` to use a single array of callbacks
  * Added support for multiple callbacks for `app.param()`. Closes #801
Closes #805
  * Changed: removed .call(self) for route callbacks
  * Dependency: `qs >= 0.3.1`
  * Fixed `res.redirect()` on windows due to `join()` usage. Closes #808

2.4.4 / 2011-08-05
==================

  * Fixed `res.header()` intention of a set, even when `undefined`
  * Fixed `*`, value no longer required
  * Fixed `res.send(204)` support. Closes #771

2.4.3 / 2011-07-14
==================

  * Added docs for `status` option special-case. Closes #739
  * Fixed `options.filename`, exposing the view path to template engines

2.4.2. / 2011-07-06
==================

  * Revert "removed jsonp stripping" for XSS

2.4.1 / 2011-07-06
==================

  * Added `res.json()` JSONP support. Closes #737
  * Added _extending-templates_ example. Closes #730
  * Added "strict routing" setting for trailing slashes
  * Added support for multiple envs in `app.configure()` calls. Closes #735
  * Changed: `res.send()` using `res.json()`
  * Changed: when cookie `path === null` don't default it
  * Changed; default cookie path to "home" setting. Closes #731
  * Removed _pids/logs_ creation from express(1)

2.4.0 / 2011-06-28
==================

  * Added chainable `res.status(code)`
  * Added `res.json()`, an explicit version of `res.send(obj)`
  * Added simple web-service example

2.3.12 / 2011-06-22
==================

  * \#express is now on freenode! come join!
  * Added `req.get(field, param)`
  * Added links to Japanese documentation, thanks @hideyukisaito!
  * Added; the `express(1)` generated app outputs the env
  * Added `content-negotiation` example
  * Dependency: connect >= 1.5.1 < 2.0.0
  * Fixed view layout bug. Closes #720
  * Fixed; ignore body on 304. Closes #701

2.3.11 / 2011-06-04
==================

  * Added `npm test`
  * Removed generation of dummy test file from `express(1)`
  * Fixed; `express(1)` adds express as a dep
  * Fixed; prune on `prepublish`

2.3.10 / 2011-05-27
==================

  * Added `req.route`, exposing the current route
  * Added _package.json_ generation support to `express(1)`
  * Fixed call to `app.param()` function for optional params. Closes #682

2.3.9 / 2011-05-25
==================

  * Fixed bug-ish with `../' in `res.partial()` calls

2.3.8 / 2011-05-24
==================

  * Fixed `app.options()`

2.3.7 / 2011-05-23
==================

  * Added route `Collection`, ex: `app.get('/user/:id').remove();`
  * Added support for `app.param(fn)` to define param logic
  * Removed `app.param()` support for callback with return value
  * Removed module.parent check from express(1) generated app. Closes #670
  * Refactored router. Closes #639

2.3.6 / 2011-05-20
==================

  * Changed; using devDependencies instead of git submodules
  * Fixed redis session example
  * Fixed markdown example
  * Fixed view caching, should not be enabled in development

2.3.5 / 2011-05-20
==================

  * Added export `.view` as alias for `.View`

2.3.4 / 2011-05-08
==================

  * Added `./examples/say`
  * Fixed `res.sendfile()` bug preventing the transfer of files with spaces

2.3.3 / 2011-05-03
==================

  * Added "case sensitive routes" option.
  * Changed; split methods supported per rfc [slaskis]
  * Fixed route-specific middleware when using the same callback function several times

2.3.2 / 2011-04-27
==================

  * Fixed view hints

2.3.1 / 2011-04-26
==================

  * Added `app.match()` as `app.match.all()`
  * Added `app.lookup()` as `app.lookup.all()`
  * Added `app.remove()` for `app.remove.all()`
  * Added `app.remove.VERB()`
  * Fixed template caching collision issue. Closes #644
  * Moved router over from connect and started refactor

2.3.0 / 2011-04-25
==================

  * Added options support to `res.clearCookie()`
  * Added `res.helpers()` as alias of `res.locals()`
  * Added; json defaults to UTF-8 with `res.send()`. Closes #632. [Daniel   * Dependency `connect >= 1.4.0`
  * Changed; auto set Content-Type in res.attachement [Aaron Heckmann]
  * Renamed "cache views" to "view cache". Closes #628
  * Fixed caching of views when using several apps. Closes #637
  * Fixed gotcha invoking `app.param()` callbacks once per route middleware.
Closes #638
  * Fixed partial lookup precedence. Closes #631
Shaw]

2.2.2 / 2011-04-12
==================

  * Added second callback support for `res.download()` connection errors
  * Fixed `filename` option passing to template engine

2.2.1 / 2011-04-04
==================

  * Added `layout(path)` helper to change the layout within a view. Closes #610
  * Fixed `partial()` collection object support.
    Previously only anything with `.length` would work.
    When `.length` is present one must still be aware of holes,
    however now `{ collection: {foo: 'bar'}}` is valid, exposes
    `keyInCollection` and `keysInCollection`.

  * Performance improved with better view caching
  * Removed `request` and `response` locals
  * Changed; errorHandler page title is now `Express` instead of `Connect`

2.2.0 / 2011-03-30
==================

  * Added `app.lookup.VERB()`, ex `app.lookup.put('/user/:id')`. Closes #606
  * Added `app.match.VERB()`, ex `app.match.put('/user/12')`. Closes #606
  * Added `app.VERB(path)` as alias of `app.lookup.VERB()`.
  * Dependency `connect >= 1.2.0`

2.1.1 / 2011-03-29
==================

  * Added; expose `err.view` object when failing to locate a view
  * Fixed `res.partial()` call `next(err)` when no callback is given [reported by aheckmann]
  * Fixed; `res.send(undefined)` responds with 204 [aheckmann]

2.1.0 / 2011-03-24
==================

  * Added `<root>/_?<name>` partial lookup support. Closes #447
  * Added `request`, `response`, and `app` local variables
  * Added `settings` local variable, containing the app's settings
  * Added `req.flash()` exception if `req.session` is not available
  * Added `res.send(bool)` support (json response)
  * Fixed stylus example for latest version
  * Fixed; wrap try/catch around `res.render()`

2.0.0 / 2011-03-17
==================

  * Fixed up index view path alternative.
  * Changed; `res.locals()` without object returns the locals

2.0.0rc3 / 2011-03-17
==================

  * Added `res.locals(obj)` to compliment `res.local(key, val)`
  * Added `res.partial()` callback support
  * Fixed recursive error reporting issue in `res.render()`

2.0.0rc2 / 2011-03-17
==================

  * Changed; `partial()` "locals" are now optional
  * Fixed `SlowBuffer` support. Closes #584 [reported by tyrda01]
  * Fixed .filename view engine option [reported by drudge]
  * Fixed blog example
  * Fixed `{req,res}.app` reference when mounting [Ben Weaver]

2.0.0rc / 2011-03-14
==================

  * Fixed; expose `HTTPSServer` constructor
  * Fixed express(1) default test charset. Closes #579 [reported by secoif]
  * Fixed; default charset to utf-8 instead of utf8 for lame IE [reported by NickP]

2.0.0beta3 / 2011-03-09
==================

  * Added support for `res.contentType()` literal
    The original `res.contentType('.json')`,
    `res.contentType('application/json')`, and `res.contentType('json')`
    will work now.
  * Added `res.render()` status option support back
  * Added charset option for `res.render()`
  * Added `.charset` support (via connect 1.0.4)
  * Added view resolution hints when in development and a lookup fails
  * Added layout lookup support relative to the page view.
    For example while rendering `./views/user/index.jade` if you create
    `./views/user/layout.jade` it will be used in favour of the root layout.
  * Fixed `res.redirect()`. RFC states absolute url [reported by unlink]
  * Fixed; default `res.send()` string charset to utf8
  * Removed `Partial` constructor (not currently used)

2.0.0beta2 / 2011-03-07
==================

  * Added res.render() `.locals` support back to aid in migration process
  * Fixed flash example

2.0.0beta / 2011-03-03
==================

  * Added HTTPS support
  * Added `res.cookie()` maxAge support
  * Added `req.header()` _Referrer_ / _Referer_ special-case, either works
  * Added mount support for `res.redirect()`, now respects the mount-point
  * Added `union()` util, taking place of `merge(clone())` combo
  * Added stylus support to express(1) generated app
  * Added secret to session middleware used in examples and generated app
  * Added `res.local(name, val)` for progressive view locals
  * Added default param support to `req.param(name, default)`
  * Added `app.disabled()` and `app.enabled()`
  * Added `app.register()` support for omitting leading ".", either works
  * Added `res.partial()`, using the same interface as `partial()` within a view. Closes #539
  * Added `app.param()` to map route params to async/sync logic
  * Added; aliased `app.helpers()` as `app.locals()`. Closes #481
  * Added extname with no leading "." support to `res.contentType()`
  * Added `cache views` setting, defaulting to enabled in "production" env
  * Added index file partial resolution, eg: partial('user') may try _views/user/index.jade_.
  * Added `req.accepts()` support for extensions
  * Changed; `res.download()` and `res.sendfile()` now utilize Connect's
    static file server `connect.static.send()`.
  * Changed; replaced `connect.utils.mime()` with npm _mime_ module
  * Changed; allow `req.query` to be pre-defined (via middleware or other parent
  * Changed view partial resolution, now relative to parent view
  * Changed view engine signature. no longer `engine.render(str, options, callback)`, now `engine.compile(str, options) -> Function`, the returned function accepts `fn(locals)`.
  * Fixed `req.param()` bug returning Array.prototype methods. Closes #552
  * Fixed; using `Stream#pipe()` instead of `sys.pump()` in `res.sendfile()`
  * Fixed; using _qs_ module instead of _querystring_
  * Fixed; strip unsafe chars from jsonp callbacks
  * Removed "stream threshold" setting

1.0.8 / 2011-03-01
==================

  * Allow `req.query` to be pre-defined (via middleware or other parent app)
  * "connect": ">= 0.5.0 < 1.0.0". Closes #547
  * Removed the long deprecated __EXPRESS_ENV__ support

1.0.7 / 2011-02-07
==================

  * Fixed `render()` setting inheritance.
    Mounted apps would not inherit "view engine"

1.0.6 / 2011-02-07
==================

  * Fixed `view engine` setting bug when period is in dirname

1.0.5 / 2011-02-05
==================

  * Added secret to generated app `session()` call

1.0.4 / 2011-02-05
==================

  * Added `qs` dependency to _package.json_
  * Fixed namespaced `require()`s for latest connect support

1.0.3 / 2011-01-13
==================

  * Remove unsafe characters from JSONP callback names [Ryan Grove]

1.0.2 / 2011-01-10
==================

  * Removed nested require, using `connect.router`

1.0.1 / 2010-12-29
==================

  * Fixed for middleware stacked via `createServer()`
    previously the `foo` middleware passed to `createServer(foo)`
    would not have access to Express methods such as `res.send()`
    or props like `req.query` etc.

1.0.0 / 2010-11-16
==================

  * Added; deduce partial object names from the last segment.
    For example by default `partial('forum/post', postObject)` will
    give you the _post_ object, providing a meaningful default.
  * Added http status code string representation to `res.redirect()` body
  * Added; `res.redirect()` supporting _text/plain_ and _text/html_ via __Accept__.
  * Added `req.is()` to aid in content negotiation
  * Added partial local inheritance [suggested by masylum]. Closes #102
    providing access to parent template locals.
  * Added _-s, --session[s]_ flag to express(1) to add session related middleware
  * Added _--template_ flag to express(1) to specify the
    template engine to use.
  * Added _--css_ flag to express(1) to specify the
    stylesheet engine to use (or just plain css by default).
  * Added `app.all()` support [thanks aheckmann]
  * Added partial direct object support.
    You may now `partial('user', user)` providing the "user" local,
    vs previously `partial('user', { object: user })`.
  * Added _route-separation_ example since many people question ways
    to do this with CommonJS modules. Also view the _blog_ example for
    an alternative.
  * Performance; caching view path derived partial object names
  * Fixed partial local inheritance precedence. [reported by Nick Poulden] Closes #454
  * Fixed jsonp support; _text/javascript_ as per mailinglist discussion

1.0.0rc4 / 2010-10-14
==================

  * Added _NODE_ENV_ support, _EXPRESS_ENV_ is deprecated and will be removed in 1.0.0
  * Added route-middleware support (very helpful, see the [docs](http://expressjs.com/guide.html#Route-Middleware))
  * Added _jsonp callback_ setting to enable/disable jsonp autowrapping [Dav Glass]
  * Added callback query check on response.send to autowrap JSON objects for simple webservice implementations [Dav Glass]
  * Added `partial()` support for array-like collections. Closes #434
  * Added support for swappable querystring parsers
  * Added session usage docs. Closes #443
  * Added dynamic helper caching. Closes #439 [suggested by maritz]
  * Added authentication example
  * Added basic Range support to `res.sendfile()` (and `res.download()` etc)
  * Changed; `express(1)` generated app using 2 spaces instead of 4
  * Default env to "development" again [aheckmann]
  * Removed _context_ option is no more, use "scope"
  * Fixed; exposing _./support_ libs to examples so they can run without installs
  * Fixed mvc example

1.0.0rc3 / 2010-09-20
==================

  * Added confirmation for `express(1)` app generation. Closes #391
  * Added extending of flash formatters via `app.flashFormatters`
  * Added flash formatter support. Closes #411
  * Added streaming support to `res.sendfile()` using `sys.pump()` when >= "stream threshold"
  * Added _stream threshold_ setting for `res.sendfile()`
  * Added `res.send()` __HEAD__ support
  * Added `res.clearCookie()`
  * Added `res.cookie()`
  * Added `res.render()` headers option
  * Added `res.redirect()` response bodies
  * Added `res.render()` status option support. Closes #425 [thanks aheckmann]
  * Fixed `res.sendfile()` responding with 403 on malicious path
  * Fixed `res.download()` bug; when an error occurs remove _Content-Disposition_
  * Fixed; mounted apps settings now inherit from parent app [aheckmann]
  * Fixed; stripping Content-Length / Content-Type when 204
  * Fixed `res.send()` 204. Closes #419
  * Fixed multiple _Set-Cookie_ headers via `res.header()`. Closes #402
  * Fixed bug messing with error handlers when `listenFD()` is called instead of `listen()`. [thanks guillermo]


1.0.0rc2 / 2010-08-17
==================

  * Added `app.register()` for template engine mapping. Closes #390
  * Added `res.render()` callback support as second argument (no options)
  * Added callback support to `res.download()`
  * Added callback support for `res.sendfile()`
  * Added support for middleware access via `express.middlewareName()` vs `connect.middlewareName()`
  * Added "partials" setting to docs
  * Added default expresso tests to `express(1)` generated app. Closes #384
  * Fixed `res.sendfile()` error handling, defer via `next()`
  * Fixed `res.render()` callback when a layout is used [thanks guillermo]
  * Fixed; `make install` creating ~/.node_libraries when not present
  * Fixed issue preventing error handlers from being defined anywhere. Closes #387

1.0.0rc / 2010-07-28
==================

  * Added mounted hook. Closes #369
  * Added connect dependency to _package.json_

  * Removed "reload views" setting and support code
    development env never caches, production always caches.

  * Removed _param_ in route callbacks, signature is now
    simply (req, res, next), previously (req, res, params, next).
    Use _req.params_ for path captures, _req.query_ for GET params.

  * Fixed "home" setting
  * Fixed middleware/router precedence issue. Closes #366
  * Fixed; _configure()_ callbacks called immediately. Closes #368

1.0.0beta2 / 2010-07-23
==================

  * Added more examples
  * Added; exporting `Server` constructor
  * Added `Server#helpers()` for view locals
  * Added `Server#dynamicHelpers()` for dynamic view locals. Closes #349
  * Added support for absolute view paths
  * Added; _home_ setting defaults to `Server#route` for mounted apps. Closes #363
  * Added Guillermo Rauch to the contributor list
  * Added support for "as" for non-collection partials. Closes #341
  * Fixed _install.sh_, ensuring _~/.node_libraries_ exists. Closes #362 [thanks jf]
  * Fixed `res.render()` exceptions, now passed to `next()` when no callback is given [thanks guillermo]
  * Fixed instanceof `Array` checks, now `Array.isArray()`
  * Fixed express(1) expansion of public dirs. Closes #348
  * Fixed middleware precedence. Closes #345
  * Fixed view watcher, now async [thanks aheckmann]

1.0.0beta / 2010-07-15
==================

  * Re-write
    - much faster
    - much lighter
    - Check [ExpressJS.com](http://expressjs.com) for migration guide and updated docs

0.14.0 / 2010-06-15
==================

  * Utilize relative requires
  * Added Static bufferSize option [aheckmann]
  * Fixed caching of view and partial subdirectories [aheckmann]
  * Fixed mime.type() comments now that ".ext" is not supported
  * Updated haml submodule
  * Updated class submodule
  * Removed bin/express

0.13.0 / 2010-06-01
==================

  * Added node v0.1.97 compatibility
  * Added support for deleting cookies via Request#cookie('key', null)
  * Updated haml submodule
  * Fixed not-found page, now using charset utf-8
  * Fixed show-exceptions page, now using charset utf-8
  * Fixed view support due to fs.readFile Buffers
  * Changed; mime.type() no longer accepts ".type" due to node extname() changes

0.12.0 / 2010-05-22
==================

  * Added node v0.1.96 compatibility
  * Added view `helpers` export which act as additional local variables
  * Updated haml submodule
  * Changed ETag; removed inode, modified time only
  * Fixed LF to CRLF for setting multiple cookies
  * Fixed cookie compilation; values are now urlencoded
  * Fixed cookies parsing; accepts quoted values and url escaped cookies

0.11.0 / 2010-05-06
==================

  * Added support for layouts using different engines
    - this.render('page.html.haml', { layout: 'super-cool-layout.html.ejs' })
    - this.render('page.html.haml', { layout: 'foo' }) // assumes 'foo.html.haml'
    - this.render('page.html.haml', { layout: false }) // no layout
  * Updated ext submodule
  * Updated haml submodule
  * Fixed EJS partial support by passing along the context. Issue #307

0.10.1 / 2010-05-03
==================

  * Fixed binary uploads.

0.10.0 / 2010-04-30
==================

  * Added charset support via Request#charset (automatically assigned to 'UTF-8' when respond()'s
    encoding is set to 'utf8' or 'utf-8').
  * Added "encoding" option to Request#render(). Closes #299
  * Added "dump exceptions" setting, which is enabled by default.
  * Added simple ejs template engine support
  * Added error response support for text/plain, application/json. Closes #297
  * Added callback function param to Request#error()
  * Added Request#sendHead()
  * Added Request#stream()
  * Added support for Request#respond(304, null) for empty response bodies
  * Added ETag support to Request#sendfile()
  * Added options to Request#sendfile(), passed to fs.createReadStream()
  * Added filename arg to Request#download()
  * Performance enhanced due to pre-reversing plugins so that plugins.reverse() is not called on each request
  * Performance enhanced by preventing several calls to toLowerCase() in Router#match()
  * Changed; Request#sendfile() now streams
  * Changed; Renamed Request#halt() to Request#respond(). Closes #289
  * Changed; Using sys.inspect() instead of JSON.encode() for error output
  * Changed; run() returns the http.Server instance. Closes #298
  * Changed; Defaulting Server#host to null (INADDR_ANY)
  * Changed; Logger "common" format scale of 0.4f
  * Removed Logger "request" format
  * Fixed; Catching ENOENT in view caching, preventing error when "views/partials" is not found
  * Fixed several issues with http client
  * Fixed Logger Content-Length output
  * Fixed bug preventing Opera from retaining the generated session id. Closes #292

0.9.0 / 2010-04-14
==================

  * Added DSL level error() route support
  * Added DSL level notFound() route support
  * Added Request#error()
  * Added Request#notFound()
  * Added Request#render() callback function. Closes #258
  * Added "max upload size" setting
  * Added "magic" variables to collection partials (\_\_index\_\_, \_\_length\_\_, \_\_isFirst\_\_, \_\_isLast\_\_). Closes #254
  * Added [haml.js](http://github.com/visionmedia/haml.js) submodule; removed haml-js
  * Added callback function support to Request#halt() as 3rd/4th arg
  * Added preprocessing of route param wildcards using param(). Closes #251
  * Added view partial support (with collections etc.)
  * Fixed bug preventing falsey params (such as ?page=0). Closes #286
  * Fixed setting of multiple cookies. Closes #199
  * Changed; view naming convention is now NAME.TYPE.ENGINE (for example page.html.haml)
  * Changed; session cookie is now httpOnly
  * Changed; Request is no longer global
  * Changed; Event is no longer global
  * Changed; "sys" module is no longer global
  * Changed; moved Request#download to Static plugin where it belongs
  * Changed; Request instance created before body parsing. Closes #262
  * Changed; Pre-caching views in memory when "cache view contents" is enabled. Closes #253
  * Changed; Pre-caching view partials in memory when "cache view partials" is enabled
  * Updated support to node --version 0.1.90
  * Updated dependencies
  * Removed set("session cookie") in favour of use(Session, { cookie: { ... }})
  * Removed utils.mixin(); use Object#mergeDeep()

0.8.0 / 2010-03-19
==================

  * Added coffeescript example app. Closes #242
  * Changed; cache api now async friendly. Closes #240
  * Removed deprecated 'express/static' support. Use 'express/plugins/static'

0.7.6 / 2010-03-19
==================

  * Added Request#isXHR. Closes #229
  * Added `make install` (for the executable)
  * Added `express` executable for setting up simple app templates
  * Added "GET /public/*" to Static plugin, defaulting to <root>/public
  * Added Static plugin
  * Fixed; Request#render() only calls cache.get() once
  * Fixed; Namespacing View caches with "view:"
  * Fixed; Namespacing Static caches with "static:"
  * Fixed; Both example apps now use the Static plugin
  * Fixed set("views"). Closes #239
  * Fixed missing space for combined log format
  * Deprecated Request#sendfile() and 'express/static'
  * Removed Server#running

0.7.5 / 2010-03-16
==================

  * Added Request#flash() support without args, now returns all flashes
  * Updated ext submodule

0.7.4 / 2010-03-16
==================

  * Fixed session reaper
  * Changed; class.js replacing js-oo Class implementation (quite a bit faster, no browser cruft)

0.7.3 / 2010-03-16
==================

  * Added package.json
  * Fixed requiring of haml / sass due to kiwi removal

0.7.2 / 2010-03-16
==================

  * Fixed GIT submodules (HAH!)

0.7.1 / 2010-03-16
==================

  * Changed; Express now using submodules again until a PM is adopted
  * Changed; chat example using millisecond conversions from ext

0.7.0 / 2010-03-15
==================

  * Added Request#pass() support (finds the next matching route, or the given path)
  * Added Logger plugin (default "common" format replaces CommonLogger)
  * Removed Profiler plugin
  * Removed CommonLogger plugin

0.6.0 / 2010-03-11
==================

  * Added seed.yml for kiwi package management support
  * Added HTTP client query string support when method is GET. Closes #205

  * Added support for arbitrary view engines.
    For example "foo.engine.html" will now require('engine'),
    the exports from this module are cached after the first require().

  * Added async plugin support

  * Removed usage of RESTful route funcs as http client
    get() etc, use http.get() and friends

  * Removed custom exceptions

0.5.0 / 2010-03-10
==================

  * Added ext dependency (library of js extensions)
  * Removed extname() / basename() utils. Use path module
  * Removed toArray() util. Use arguments.values
  * Removed escapeRegexp() util. Use RegExp.escape()
  * Removed process.mixin() dependency. Use utils.mixin()
  * Removed Collection
  * Removed ElementCollection
  * Shameless self promotion of ebook "Advanced JavaScript" (http://dev-mag.com)  ;)

0.4.0 / 2010-02-11
==================

  * Added flash() example to sample upload app
  * Added high level restful http client module (express/http)
  * Changed; RESTful route functions double as HTTP clients. Closes #69
  * Changed; throwing error when routes are added at runtime
  * Changed; defaulting render() context to the current Request. Closes #197
  * Updated haml submodule

0.3.0 / 2010-02-11
==================

  * Updated haml / sass submodules. Closes #200
  * Added flash message support. Closes #64
  * Added accepts() now allows multiple args. fixes #117
  * Added support for plugins to halt. Closes #189
  * Added alternate layout support. Closes #119
  * Removed Route#run(). Closes #188
  * Fixed broken specs due to use(Cookie) missing

0.2.1 / 2010-02-05
==================

  * Added "plot" format option for Profiler (for gnuplot processing)
  * Added request number to Profiler plugin
  * Fixed binary encoding for multipart file uploads, was previously defaulting to UTF8
  * Fixed issue with routes not firing when not files are present. Closes #184
  * Fixed process.Promise -> events.Promise

0.2.0 / 2010-02-03
==================

  * Added parseParam() support for name[] etc. (allows for file inputs with "multiple" attr) Closes #180
  * Added Both Cache and Session option "reapInterval" may be "reapEvery". Closes #174
  * Added expiration support to cache api with reaper. Closes #133
  * Added cache Store.Memory#reap()
  * Added Cache; cache api now uses first class Cache instances
  * Added abstract session Store. Closes #172
  * Changed; cache Memory.Store#get() utilizing Collection
  * Renamed MemoryStore -> Store.Memory
  * Fixed use() of the same plugin several time will always use latest options. Closes #176

0.1.0 / 2010-02-03
==================

  * Changed; Hooks (before / after) pass request as arg as well as evaluated in their context
  * Updated node support to 0.1.27 Closes #169
  * Updated dirname(__filename) -> __dirname
  * Updated libxmljs support to v0.2.0
  * Added session support with memory store / reaping
  * Added quick uid() helper
  * Added multi-part upload support
  * Added Sass.js support / submodule
  * Added production env caching view contents and static files
  * Added static file caching. Closes #136
  * Added cache plugin with memory stores
  * Added support to StaticFile so that it works with non-textual files.
  * Removed dirname() helper
  * Removed several globals (now their modules must be required)

0.0.2 / 2010-01-10
==================

  * Added view benchmarks; currently haml vs ejs
  * Added Request#attachment() specs. Closes #116
  * Added use of node's parseQuery() util. Closes #123
  * Added `make init` for submodules
  * Updated Haml
  * Updated sample chat app to show messages on load
  * Updated libxmljs parseString -> parseHtmlString
  * Fixed `make init` to work with older versions of git
  * Fixed specs can now run independent specs for those who can't build deps. Closes #127
  * Fixed issues introduced by the node url module changes. Closes 126.
  * Fixed two assertions failing due to Collection#keys() returning strings
  * Fixed faulty Collection#toArray() spec due to keys() returning strings
  * Fixed `make test` now builds libxmljs.node before testing

0.0.1 / 2010-01-03
==================

  * Initial release


---

<!-- source: archive/library/javascript/references/packages/finalhandler/HISTORY--000273.md -->

## Imported source: archive/library/javascript/references/packages/finalhandler/HISTORY--000273.md

v1.3.1 / 2024-09-11
==================

  * deps: encodeurl@~2.0.0

v1.3.0 / 2024-09-03
==================

  * ignore status message for HTTP/2 (#53)

v1.2.1 / 2024-09-02
==================

  * Gracefully handle when handling an error and socket is null

1.2.0 / 2022-03-22
==================

  * Remove set content headers that break response
  * deps: on-finished@2.4.1
  * deps: statuses@2.0.1
    - Rename `425 Unordered Collection` to standard `425 Too Early`

1.1.2 / 2019-05-09
==================

  * Set stricter `Content-Security-Policy` header
  * deps: parseurl@~1.3.3
  * deps: statuses@~1.5.0

1.1.1 / 2018-03-06
==================

  * Fix 404 output for bad / missing pathnames
  * deps: encodeurl@~1.0.2
    - Fix encoding `%` as last character
  * deps: statuses@~1.4.0

1.1.0 / 2017-09-24
==================

  * Use `res.headersSent` when available

1.0.6 / 2017-09-22
==================

  * deps: debug@2.6.9

1.0.5 / 2017-09-15
==================

  * deps: parseurl@~1.3.2
    - perf: reduce overhead for full URLs
    - perf: unroll the "fast-path" `RegExp`

1.0.4 / 2017-08-03
==================

  * deps: debug@2.6.8

1.0.3 / 2017-05-16
==================

  * deps: debug@2.6.7
    - deps: ms@2.0.0

1.0.2 / 2017-04-22
==================

  * deps: debug@2.6.4
    - deps: ms@0.7.3

1.0.1 / 2017-03-21
==================

  * Fix missing `</html>` in HTML document
  * deps: debug@2.6.3
    - Fix: `DEBUG_MAX_ARRAY_LENGTH`

1.0.0 / 2017-02-15
==================

  * Fix exception when `err` cannot be converted to a string
  * Fully URL-encode the pathname in the 404 message
  * Only include the pathname in the 404 message
  * Send complete HTML document
  * Set `Content-Security-Policy: default-src 'self'` header
  * deps: debug@2.6.1
    - Allow colors in workers
    - Deprecated `DEBUG_FD` environment variable set to `3` or higher
    - Fix error when running under React Native
    - Use same color for same namespace
    - deps: ms@0.7.2

0.5.1 / 2016-11-12
==================

  * Fix exception when `err.headers` is not an object
  * deps: statuses@~1.3.1
  * perf: hoist regular expressions
  * perf: remove duplicate validation path

0.5.0 / 2016-06-15
==================

  * Change invalid or non-numeric status code to 500
  * Overwrite status message to match set status code
  * Prefer `err.statusCode` if `err.status` is invalid
  * Set response headers from `err.headers` object
  * Use `statuses` instead of `http` module for status messages
    - Includes all defined status messages

0.4.1 / 2015-12-02
==================

  * deps: escape-html@~1.0.3
    - perf: enable strict mode
    - perf: optimize string replacement
    - perf: use faster string coercion

0.4.0 / 2015-06-14
==================

  * Fix a false-positive when unpiping in Node.js 0.8
  * Support `statusCode` property on `Error` objects
  * Use `unpipe` module for unpiping requests
  * deps: escape-html@1.0.2
  * deps: on-finished@~2.3.0
    - Add defined behavior for HTTP `CONNECT` requests
    - Add defined behavior for HTTP `Upgrade` requests
    - deps: ee-first@1.1.1
  * perf: enable strict mode
  * perf: remove argument reassignment

0.3.6 / 2015-05-11
==================

  * deps: debug@~2.2.0
    - deps: ms@0.7.1

0.3.5 / 2015-04-22
==================

  * deps: on-finished@~2.2.1
    - Fix `isFinished(req)` when data buffered

0.3.4 / 2015-03-15
==================

  * deps: debug@~2.1.3
    - Fix high intensity foreground color for bold
    - deps: ms@0.7.0

0.3.3 / 2015-01-01
==================

  * deps: debug@~2.1.1
  * deps: on-finished@~2.2.0

0.3.2 / 2014-10-22
==================

  * deps: on-finished@~2.1.1
    - Fix handling of pipelined requests

0.3.1 / 2014-10-16
==================

  * deps: debug@~2.1.0
    - Implement `DEBUG_FD` env variable support

0.3.0 / 2014-09-17
==================

  * Terminate in progress response only on error
  * Use `on-finished` to determine request status

0.2.0 / 2014-09-03
==================

  * Set `X-Content-Type-Options: nosniff` header
  * deps: debug@~2.0.0

0.1.0 / 2014-07-16
==================

  * Respond after request fully read
    - prevents hung responses and socket hang ups
  * deps: debug@1.0.4

0.0.3 / 2014-07-11
==================

  * deps: debug@1.0.3
    - Add support for multiple wildcards in namespaces

0.0.2 / 2014-06-19
==================

  * Handle invalid status codes

0.0.1 / 2014-06-05
==================

  * deps: debug@1.0.2

0.0.0 / 2014-06-05
==================

  * Extracted from connect/express


---

<!-- source: archive/library/javascript/references/packages/forwarded/HISTORY--000456.md -->

## Imported source: archive/library/javascript/references/packages/forwarded/HISTORY--000456.md

0.2.0 / 2021-05-31
==================

  * Use `req.socket` over deprecated `req.connection`

0.1.2 / 2017-09-14
==================

  * perf: improve header parsing
  * perf: reduce overhead when no `X-Forwarded-For` header

0.1.1 / 2017-09-10
==================

  * Fix trimming leading / trailing OWS
  * perf: hoist regular expression

0.1.0 / 2014-09-21
==================

  * Initial release


---

<!-- source: archive/library/javascript/references/packages/fresh/HISTORY--000301.md -->

## Imported source: archive/library/javascript/references/packages/fresh/HISTORY--000301.md

0.5.2 / 2017-09-13
==================

  * Fix regression matching multiple ETags in `If-None-Match`
  * perf: improve `If-None-Match` token parsing

0.5.1 / 2017-09-11
==================

  * Fix handling of modified headers with invalid dates
  * perf: improve ETag match loop

0.5.0 / 2017-02-21
==================

  * Fix incorrect result when `If-None-Match` has both `*` and ETags
  * Fix weak `ETag` matching to match spec
  * perf: delay reading header values until needed
  * perf: skip checking modified time if ETag check failed
  * perf: skip parsing `If-None-Match` when no `ETag` header
  * perf: use `Date.parse` instead of `new Date`

0.4.0 / 2017-02-05
==================

  * Fix false detection of `no-cache` request directive
  * perf: enable strict mode
  * perf: hoist regular expressions
  * perf: remove duplicate conditional
  * perf: remove unnecessary boolean coercions

0.3.0 / 2015-05-12
==================

  * Add weak `ETag` matching support

0.2.4 / 2014-09-07
==================

  * Support Node.js 0.6

0.2.3 / 2014-09-07
==================

  * Move repository to jshttp

0.2.2 / 2014-02-19
==================

  * Revert "Fix for blank page on Safari reload"

0.2.1 / 2014-01-29
==================

  * Fix for blank page on Safari reload

0.2.0 / 2013-08-11
==================

  * Return stale for `Cache-Control: no-cache`

0.1.0 / 2012-06-15
==================

  * Add `If-None-Match: *` support

0.0.1 / 2012-06-10
==================

  * Initial release


---

<!-- source: archive/library/javascript/references/packages/http-errors/HISTORY--000262.md -->

## Imported source: archive/library/javascript/references/packages/http-errors/HISTORY--000262.md

2.0.0 / 2021-12-17
==================

  * Drop support for Node.js 0.6
  * Remove `I'mateapot` export; use `ImATeapot` instead
  * Remove support for status being non-first argument
  * Rename `UnorderedCollection` constructor to `TooEarly`
  * deps: depd@2.0.0
    - Replace internal `eval` usage with `Function` constructor
    - Use instance methods on `process` to check for listeners
  * deps: statuses@2.0.1
    - Fix messaging casing of `418 I'm a Teapot`
    - Remove code 306
    - Rename `425 Unordered Collection` to standard `425 Too Early`

2021-11-14 / 1.8.1
==================

  * deps: toidentifier@1.0.1

2020-06-29 / 1.8.0
==================

  * Add `isHttpError` export to determine if value is an HTTP error
  * deps: setprototypeof@1.2.0

2019-06-24 / 1.7.3
==================

  * deps: inherits@2.0.4

2019-02-18 / 1.7.2
==================

  * deps: setprototypeof@1.1.1

2018-09-08 / 1.7.1
==================

  * Fix error creating objects in some environments

2018-07-30 / 1.7.0
==================

  * Set constructor name when possible
  * Use `toidentifier` module to make class names
  * deps: statuses@'>= 1.5.0 < 2'

2018-03-29 / 1.6.3
==================

  * deps: depd@~1.1.2
    - perf: remove argument reassignment
  * deps: setprototypeof@1.1.0
  * deps: statuses@'>= 1.4.0 < 2'

2017-08-04 / 1.6.2
==================

  * deps: depd@1.1.1
    - Remove unnecessary `Buffer` loading

2017-02-20 / 1.6.1
==================

  * deps: setprototypeof@1.0.3
    - Fix shim for old browsers

2017-02-14 / 1.6.0
==================

  * Accept custom 4xx and 5xx status codes in factory
  * Add deprecation message to `"I'mateapot"` export
  * Deprecate passing status code as anything except first argument in factory
  * Deprecate using non-error status codes
  * Make `message` property enumerable for `HttpError`s

2016-11-16 / 1.5.1
==================

  * deps: inherits@2.0.3
    - Fix issue loading in browser
  * deps: setprototypeof@1.0.2
  * deps: statuses@'>= 1.3.1 < 2'

2016-05-18 / 1.5.0
==================

  * Support new code `421 Misdirected Request`
  * Use `setprototypeof` module to replace `__proto__` setting
  * deps: statuses@'>= 1.3.0 < 2'
    - Add `421 Misdirected Request`
    - perf: enable strict mode
  * perf: enable strict mode

2016-01-28 / 1.4.0
==================

  * Add `HttpError` export, for `err instanceof createError.HttpError`
  * deps: inherits@2.0.1
  * deps: statuses@'>= 1.2.1 < 2'
    - Fix message for status 451
    - Remove incorrect nginx status code

2015-02-02 / 1.3.1
==================

  * Fix regression where status can be overwritten in `createError` `props`

2015-02-01 / 1.3.0
==================

  * Construct errors using defined constructors from `createError`
  * Fix error names that are not identifiers
    - `createError["I'mateapot"]` is now `createError.ImATeapot`
  * Set a meaningful `name` property on constructed errors

2014-12-09 / 1.2.8
==================

  * Fix stack trace from exported function
  * Remove `arguments.callee` usage

2014-10-14 / 1.2.7
==================

  * Remove duplicate line

2014-10-02 / 1.2.6
==================

  * Fix `expose` to be `true` for `ClientError` constructor

2014-09-28 / 1.2.5
==================

  * deps: statuses@1

2014-09-21 / 1.2.4
==================

  * Fix dependency version to work with old `npm`s

2014-09-21 / 1.2.3
==================

  * deps: statuses@~1.1.0

2014-09-21 / 1.2.2
==================

  * Fix publish error

2014-09-21 / 1.2.1
==================

  * Support Node.js 0.6
  * Use `inherits` instead of `util`

2014-09-09 / 1.2.0
==================

  * Fix the way inheriting functions
  * Support `expose` being provided in properties argument

2014-09-08 / 1.1.0
==================

  * Default status to 500
  * Support provided `error` to extend

2014-09-08 / 1.0.1
==================

  * Fix accepting string message

2014-09-08 / 1.0.0
==================

  * Initial release


---

<!-- source: archive/library/javascript/references/packages/merge-descriptors/HISTORY--000267.md -->

## Imported source: archive/library/javascript/references/packages/merge-descriptors/HISTORY--000267.md

1.0.1 / 2016-01-17
==================

  * perf: enable strict mode

1.0.0 / 2015-03-01
==================

  * Add option to only add new descriptors
  * Add simple argument validation
  * Add jsdoc to source file

0.0.2 / 2013-12-14
==================

  * Move repository to `component` organization

0.0.1 / 2013-10-29
==================

  * Initial release


---

<!-- source: archive/library/javascript/references/packages/methods/HISTORY--000420.md -->

## Imported source: archive/library/javascript/references/packages/methods/HISTORY--000420.md

1.1.2 / 2016-01-17
==================

  * perf: enable strict mode

1.1.1 / 2014-12-30
==================

  * Improve `browserify` support

1.1.0 / 2014-07-05
==================

  * Add `CONNECT` method
 
1.0.1 / 2014-06-02
==================

  * Fix module to work with harmony transform

1.0.0 / 2014-05-08
==================

  * Add `PURGE` method

0.1.0 / 2013-10-28
==================

  * Add `http.METHODS` support


---

<!-- source: archive/library/javascript/references/packages/mime-db/HISTORY--000313.md -->

## Imported source: archive/library/javascript/references/packages/mime-db/HISTORY--000313.md

1.52.0 / 2022-02-21
===================

  * Add extensions from IANA for more `image/*` types
  * Add extension `.asc` to `application/pgp-keys`
  * Add extensions to various XML types
  * Add new upstream MIME types

1.51.0 / 2021-11-08
===================

  * Add new upstream MIME types
  * Mark `image/vnd.microsoft.icon` as compressible
  * Mark `image/vnd.ms-dds` as compressible

1.50.0 / 2021-09-15
===================

  * Add deprecated iWorks mime types and extensions
  * Add new upstream MIME types

1.49.0 / 2021-07-26
===================

  * Add extension `.trig` to `application/trig`
  * Add new upstream MIME types

1.48.0 / 2021-05-30
===================

  * Add extension `.mvt` to `application/vnd.mapbox-vector-tile`
  * Add new upstream MIME types
  * Mark `text/yaml` as compressible

1.47.0 / 2021-04-01
===================

  * Add new upstream MIME types
  * Remove ambigious extensions from IANA for `application/*+xml` types
  * Update primary extension to `.es` for `application/ecmascript`

1.46.0 / 2021-02-13
===================

  * Add extension `.amr` to `audio/amr`
  * Add extension `.m4s` to `video/iso.segment`
  * Add extension `.opus` to `audio/ogg`
  * Add new upstream MIME types

1.45.0 / 2020-09-22
===================

  * Add `application/ubjson` with extension `.ubj`
  * Add `image/avif` with extension `.avif`
  * Add `image/ktx2` with extension `.ktx2`
  * Add extension `.dbf` to `application/vnd.dbf`
  * Add extension `.rar` to `application/vnd.rar`
  * Add extension `.td` to `application/urc-targetdesc+xml`
  * Add new upstream MIME types
  * Fix extension of `application/vnd.apple.keynote` to be `.key`

1.44.0 / 2020-04-22
===================

  * Add charsets from IANA
  * Add extension `.cjs` to `application/node`
  * Add new upstream MIME types

1.43.0 / 2020-01-05
===================

  * Add `application/x-keepass2` with extension `.kdbx`
  * Add extension `.mxmf` to `audio/mobile-xmf`
  * Add extensions from IANA for `application/*+xml` types
  * Add new upstream MIME types

1.42.0 / 2019-09-25
===================

  * Add `image/vnd.ms-dds` with extension `.dds`
  * Add new upstream MIME types
  * Remove compressible from `multipart/mixed`

1.41.0 / 2019-08-30
===================

  * Add new upstream MIME types
  * Add `application/toml` with extension `.toml`
  * Mark `font/ttf` as compressible

1.40.0 / 2019-04-20
===================

  * Add extensions from IANA for `model/*` types
  * Add `text/mdx` with extension `.mdx`

1.39.0 / 2019-04-04
===================

  * Add extensions `.siv` and `.sieve` to `application/sieve`
  * Add new upstream MIME types

1.38.0 / 2019-02-04
===================

  * Add extension `.nq` to `application/n-quads`
  * Add extension `.nt` to `application/n-triples`
  * Add new upstream MIME types
  * Mark `text/less` as compressible

1.37.0 / 2018-10-19
===================

  * Add extensions to HEIC image types
  * Add new upstream MIME types

1.36.0 / 2018-08-20
===================

  * Add Apple file extensions from IANA
  * Add extensions from IANA for `image/*` types
  * Add new upstream MIME types

1.35.0 / 2018-07-15
===================

  * Add extension `.owl` to `application/rdf+xml`
  * Add new upstream MIME types
    - Removes extension `.woff` from `application/font-woff`

1.34.0 / 2018-06-03
===================

  * Add extension `.csl` to `application/vnd.citationstyles.style+xml`
  * Add extension `.es` to `application/ecmascript`
  * Add new upstream MIME types
  * Add `UTF-8` as default charset for `text/turtle`
  * Mark all XML-derived types as compressible

1.33.0 / 2018-02-15
===================

  * Add extensions from IANA for `message/*` types
  * Add new upstream MIME types
  * Fix some incorrect OOXML types
  * Remove `application/font-woff2`

1.32.0 / 2017-11-29
===================

  * Add new upstream MIME types
  * Update `text/hjson` to registered `application/hjson`
  * Add `text/shex` with extension `.shex`

1.31.0 / 2017-10-25
===================

  * Add `application/raml+yaml` with extension `.raml`
  * Add `application/wasm` with extension `.wasm`
  * Add new `font` type from IANA
  * Add new upstream font extensions
  * Add new upstream MIME types
  * Add extensions for JPEG-2000 images

1.30.0 / 2017-08-27
===================

  * Add `application/vnd.ms-outlook`
  * Add `application/x-arj`
  * Add extension `.mjs` to `application/javascript`
  * Add glTF types and extensions
  * Add new upstream MIME types
  * Add `text/x-org`
  * Add VirtualBox MIME types
  * Fix `source` records for `video/*` types that are IANA
  * Update `font/opentype` to registered `font/otf`

1.29.0 / 2017-07-10
===================

  * Add `application/fido.trusted-apps+json`
  * Add extension `.wadl` to `application/vnd.sun.wadl+xml`
  * Add new upstream MIME types
  * Add `UTF-8` as default charset for `text/css`

1.28.0 / 2017-05-14
===================

  * Add new upstream MIME types
  * Add extension `.gz` to `application/gzip`
  * Update extensions `.md` and `.markdown` to be `text/markdown`

1.27.0 / 2017-03-16
===================

  * Add new upstream MIME types
  * Add `image/apng` with extension `.apng`

1.26.0 / 2017-01-14
===================

  * Add new upstream MIME types
  * Add extension `.geojson` to `application/geo+json`

1.25.0 / 2016-11-11
===================

  * Add new upstream MIME types

1.24.0 / 2016-09-18
===================

  * Add `audio/mp3`
  * Add new upstream MIME types

1.23.0 / 2016-05-01
===================

  * Add new upstream MIME types
  * Add extension `.3gpp` to `audio/3gpp`

1.22.0 / 2016-02-15
===================

  * Add `text/slim`
  * Add extension `.rng` to `application/xml`
  * Add new upstream MIME types
  * Fix extension of `application/dash+xml` to be `.mpd`
  * Update primary extension to `.m4a` for `audio/mp4`

1.21.0 / 2016-01-06
===================

  * Add Google document types
  * Add new upstream MIME types

1.20.0 / 2015-11-10
===================

  * Add `text/x-suse-ymp`
  * Add new upstream MIME types

1.19.0 / 2015-09-17
===================

  * Add `application/vnd.apple.pkpass`
  * Add new upstream MIME types

1.18.0 / 2015-09-03
===================

  * Add new upstream MIME types

1.17.0 / 2015-08-13
===================

  * Add `application/x-msdos-program`
  * Add `audio/g711-0`
  * Add `image/vnd.mozilla.apng`
  * Add extension `.exe` to `application/x-msdos-program`

1.16.0 / 2015-07-29
===================

  * Add `application/vnd.uri-map`

1.15.0 / 2015-07-13
===================

  * Add `application/x-httpd-php`

1.14.0 / 2015-06-25
===================

  * Add `application/scim+json`
  * Add `application/vnd.3gpp.ussd+xml`
  * Add `application/vnd.biopax.rdf+xml`
  * Add `text/x-processing`

1.13.0 / 2015-06-07
===================

  * Add nginx as a source
  * Add `application/x-cocoa`
  * Add `application/x-java-archive-diff`
  * Add `application/x-makeself`
  * Add `application/x-perl`
  * Add `application/x-pilot`
  * Add `application/x-redhat-package-manager`
  * Add `application/x-sea`
  * Add `audio/x-m4a`
  * Add `audio/x-realaudio`
  * Add `image/x-jng`
  * Add `text/mathml`

1.12.0 / 2015-06-05
===================

  * Add `application/bdoc`
  * Add `application/vnd.hyperdrive+json`
  * Add `application/x-bdoc`
  * Add extension `.rtf` to `text/rtf`

1.11.0 / 2015-05-31
===================

  * Add `audio/wav`
  * Add `audio/wave`
  * Add extension `.litcoffee` to `text/coffeescript`
  * Add extension `.sfd-hdstx` to `application/vnd.hydrostatix.sof-data`
  * Add extension `.n-gage` to `application/vnd.nokia.n-gage.symbian.install`

1.10.0 / 2015-05-19
===================

  * Add `application/vnd.balsamiq.bmpr`
  * Add `application/vnd.microsoft.portable-executable`
  * Add `application/x-ns-proxy-autoconfig`

1.9.1 / 2015-04-19
==================

  * Remove `.json` extension from `application/manifest+json`
    - This is causing bugs downstream

1.9.0 / 2015-04-19
==================

  * Add `application/manifest+json`
  * Add `application/vnd.micro+json`
  * Add `image/vnd.zbrush.pcx`
  * Add `image/x-ms-bmp`

1.8.0 / 2015-03-13
==================

  * Add `application/vnd.citationstyles.style+xml`
  * Add `application/vnd.fastcopy-disk-image`
  * Add `application/vnd.gov.sk.xmldatacontainer+xml`
  * Add extension `.jsonld` to `application/ld+json`

1.7.0 / 2015-02-08
==================

  * Add `application/vnd.gerber`
  * Add `application/vnd.msa-disk-image`

1.6.1 / 2015-02-05
==================

  * Community extensions ownership transferred from `node-mime`

1.6.0 / 2015-01-29
==================

  * Add `application/jose`
  * Add `application/jose+json`
  * Add `application/json-seq`
  * Add `application/jwk+json`
  * Add `application/jwk-set+json`
  * Add `application/jwt`
  * Add `application/rdap+json`
  * Add `application/vnd.gov.sk.e-form+xml`
  * Add `application/vnd.ims.imsccv1p3`

1.5.0 / 2014-12-30
==================

  * Add `application/vnd.oracle.resource+json`
  * Fix various invalid MIME type entries
    - `application/mbox+xml`
    - `application/oscp-response`
    - `application/vwg-multiplexed`
    - `audio/g721`

1.4.0 / 2014-12-21
==================

  * Add `application/vnd.ims.imsccv1p2`
  * Fix various invalid MIME type entries
    - `application/vnd-acucobol`
    - `application/vnd-curl`
    - `application/vnd-dart`
    - `application/vnd-dxr`
    - `application/vnd-fdf`
    - `application/vnd-mif`
    - `application/vnd-sema`
    - `application/vnd-wap-wmlc`
    - `application/vnd.adobe.flash-movie`
    - `application/vnd.dece-zip`
    - `application/vnd.dvb_service`
    - `application/vnd.micrografx-igx`
    - `application/vnd.sealed-doc`
    - `application/vnd.sealed-eml`
    - `application/vnd.sealed-mht`
    - `application/vnd.sealed-ppt`
    - `application/vnd.sealed-tiff`
    - `application/vnd.sealed-xls`
    - `application/vnd.sealedmedia.softseal-html`
    - `application/vnd.sealedmedia.softseal-pdf`
    - `application/vnd.wap-slc`
    - `application/vnd.wap-wbxml`
    - `audio/vnd.sealedmedia.softseal-mpeg`
    - `image/vnd-djvu`
    - `image/vnd-svf`
    - `image/vnd-wap-wbmp`
    - `image/vnd.sealed-png`
    - `image/vnd.sealedmedia.softseal-gif`
    - `image/vnd.sealedmedia.softseal-jpg`
    - `model/vnd-dwf`
    - `model/vnd.parasolid.transmit-binary`
    - `model/vnd.parasolid.transmit-text`
    - `text/vnd-a`
    - `text/vnd-curl`
    - `text/vnd.wap-wml`
  * Remove example template MIME types
    - `application/example`
    - `audio/example`
    - `image/example`
    - `message/example`
    - `model/example`
    - `multipart/example`
    - `text/example`
    - `video/example`

1.3.1 / 2014-12-16
==================

  * Fix missing extensions
    - `application/json5`
    - `text/hjson`

1.3.0 / 2014-12-07
==================

  * Add `application/a2l`
  * Add `application/aml`
  * Add `application/atfx`
  * Add `application/atxml`
  * Add `application/cdfx+xml`
  * Add `application/dii`
  * Add `application/json5`
  * Add `application/lxf`
  * Add `application/mf4`
  * Add `application/vnd.apache.thrift.compact`
  * Add `application/vnd.apache.thrift.json`
  * Add `application/vnd.coffeescript`
  * Add `application/vnd.enphase.envoy`
  * Add `application/vnd.ims.imsccv1p1`
  * Add `text/csv-schema`
  * Add `text/hjson`
  * Add `text/markdown`
  * Add `text/yaml`

1.2.0 / 2014-11-09
==================

  * Add `application/cea`
  * Add `application/dit`
  * Add `application/vnd.gov.sk.e-form+zip`
  * Add `application/vnd.tmd.mediaflex.api+xml`
  * Type `application/epub+zip` is now IANA-registered

1.1.2 / 2014-10-23
==================

  * Rebuild database for `application/x-www-form-urlencoded` change

1.1.1 / 2014-10-20
==================

  * Mark `application/x-www-form-urlencoded` as compressible.

1.1.0 / 2014-09-28
==================

  * Add `application/font-woff2`

1.0.3 / 2014-09-25
==================

  * Fix engine requirement in package

1.0.2 / 2014-09-25
==================

  * Add `application/coap-group+json`
  * Add `application/dcd`
  * Add `application/vnd.apache.thrift.binary`
  * Add `image/vnd.tencent.tap`
  * Mark all JSON-derived types as compressible
  * Update `text/vtt` data

1.0.1 / 2014-08-30
==================

  * Fix extension ordering

1.0.0 / 2014-08-30
==================

  * Add `application/atf`
  * Add `application/merge-patch+json`
  * Add `multipart/x-mixed-replace`
  * Add `source: 'apache'` metadata
  * Add `source: 'iana'` metadata
  * Remove badly-assumed charset data


---

<!-- source: archive/library/javascript/references/packages/mime-types/HISTORY--000423.md -->

## Imported source: archive/library/javascript/references/packages/mime-types/HISTORY--000423.md

2.1.35 / 2022-03-12
===================

  * deps: mime-db@1.52.0
    - Add extensions from IANA for more `image/*` types
    - Add extension `.asc` to `application/pgp-keys`
    - Add extensions to various XML types
    - Add new upstream MIME types

2.1.34 / 2021-11-08
===================

  * deps: mime-db@1.51.0
    - Add new upstream MIME types

2.1.33 / 2021-10-01
===================

  * deps: mime-db@1.50.0
    - Add deprecated iWorks mime types and extensions
    - Add new upstream MIME types

2.1.32 / 2021-07-27
===================

  * deps: mime-db@1.49.0
    - Add extension `.trig` to `application/trig`
    - Add new upstream MIME types

2.1.31 / 2021-06-01
===================

  * deps: mime-db@1.48.0
    - Add extension `.mvt` to `application/vnd.mapbox-vector-tile`
    - Add new upstream MIME types

2.1.30 / 2021-04-02
===================

  * deps: mime-db@1.47.0
    - Add extension `.amr` to `audio/amr`
    - Remove ambigious extensions from IANA for `application/*+xml` types
    - Update primary extension to `.es` for `application/ecmascript`

2.1.29 / 2021-02-17
===================

  * deps: mime-db@1.46.0
    - Add extension `.amr` to `audio/amr`
    - Add extension `.m4s` to `video/iso.segment`
    - Add extension `.opus` to `audio/ogg`
    - Add new upstream MIME types

2.1.28 / 2021-01-01
===================

  * deps: mime-db@1.45.0
    - Add `application/ubjson` with extension `.ubj`
    - Add `image/avif` with extension `.avif`
    - Add `image/ktx2` with extension `.ktx2`
    - Add extension `.dbf` to `application/vnd.dbf`
    - Add extension `.rar` to `application/vnd.rar`
    - Add extension `.td` to `application/urc-targetdesc+xml`
    - Add new upstream MIME types
    - Fix extension of `application/vnd.apple.keynote` to be `.key`

2.1.27 / 2020-04-23
===================

  * deps: mime-db@1.44.0
    - Add charsets from IANA
    - Add extension `.cjs` to `application/node`
    - Add new upstream MIME types

2.1.26 / 2020-01-05
===================

  * deps: mime-db@1.43.0
    - Add `application/x-keepass2` with extension `.kdbx`
    - Add extension `.mxmf` to `audio/mobile-xmf`
    - Add extensions from IANA for `application/*+xml` types
    - Add new upstream MIME types

2.1.25 / 2019-11-12
===================

  * deps: mime-db@1.42.0
    - Add new upstream MIME types
    - Add `application/toml` with extension `.toml`
    - Add `image/vnd.ms-dds` with extension `.dds`

2.1.24 / 2019-04-20
===================

  * deps: mime-db@1.40.0
    - Add extensions from IANA for `model/*` types
    - Add `text/mdx` with extension `.mdx`

2.1.23 / 2019-04-17
===================

  * deps: mime-db@~1.39.0
    - Add extensions `.siv` and `.sieve` to `application/sieve`
    - Add new upstream MIME types

2.1.22 / 2019-02-14
===================

  * deps: mime-db@~1.38.0
    - Add extension `.nq` to `application/n-quads`
    - Add extension `.nt` to `application/n-triples`
    - Add new upstream MIME types

2.1.21 / 2018-10-19
===================

  * deps: mime-db@~1.37.0
    - Add extensions to HEIC image types
    - Add new upstream MIME types

2.1.20 / 2018-08-26
===================

  * deps: mime-db@~1.36.0
    - Add Apple file extensions from IANA
    - Add extensions from IANA for `image/*` types
    - Add new upstream MIME types

2.1.19 / 2018-07-17
===================

  * deps: mime-db@~1.35.0
    - Add extension `.csl` to `application/vnd.citationstyles.style+xml`
    - Add extension `.es` to `application/ecmascript`
    - Add extension `.owl` to `application/rdf+xml`
    - Add new upstream MIME types
    - Add UTF-8 as default charset for `text/turtle`

2.1.18 / 2018-02-16
===================

  * deps: mime-db@~1.33.0
    - Add `application/raml+yaml` with extension `.raml`
    - Add `application/wasm` with extension `.wasm`
    - Add `text/shex` with extension `.shex`
    - Add extensions for JPEG-2000 images
    - Add extensions from IANA for `message/*` types
    - Add new upstream MIME types
    - Update font MIME types
    - Update `text/hjson` to registered `application/hjson`

2.1.17 / 2017-09-01
===================

  * deps: mime-db@~1.30.0
    - Add `application/vnd.ms-outlook`
    - Add `application/x-arj`
    - Add extension `.mjs` to `application/javascript`
    - Add glTF types and extensions
    - Add new upstream MIME types
    - Add `text/x-org`
    - Add VirtualBox MIME types
    - Fix `source` records for `video/*` types that are IANA
    - Update `font/opentype` to registered `font/otf`

2.1.16 / 2017-07-24
===================

  * deps: mime-db@~1.29.0
    - Add `application/fido.trusted-apps+json`
    - Add extension `.wadl` to `application/vnd.sun.wadl+xml`
    - Add extension `.gz` to `application/gzip`
    - Add new upstream MIME types
    - Update extensions `.md` and `.markdown` to be `text/markdown`

2.1.15 / 2017-03-23
===================

  * deps: mime-db@~1.27.0
    - Add new mime types
    - Add `image/apng`

2.1.14 / 2017-01-14
===================

  * deps: mime-db@~1.26.0
    - Add new mime types

2.1.13 / 2016-11-18
===================

  * deps: mime-db@~1.25.0
    - Add new mime types

2.1.12 / 2016-09-18
===================

  * deps: mime-db@~1.24.0
    - Add new mime types
    - Add `audio/mp3`

2.1.11 / 2016-05-01
===================

  * deps: mime-db@~1.23.0
    - Add new mime types

2.1.10 / 2016-02-15
===================

  * deps: mime-db@~1.22.0
    - Add new mime types
    - Fix extension of `application/dash+xml`
    - Update primary extension for `audio/mp4`

2.1.9 / 2016-01-06
==================

  * deps: mime-db@~1.21.0
    - Add new mime types

2.1.8 / 2015-11-30
==================

  * deps: mime-db@~1.20.0
    - Add new mime types

2.1.7 / 2015-09-20
==================

  * deps: mime-db@~1.19.0
    - Add new mime types

2.1.6 / 2015-09-03
==================

  * deps: mime-db@~1.18.0
    - Add new mime types

2.1.5 / 2015-08-20
==================

  * deps: mime-db@~1.17.0
    - Add new mime types

2.1.4 / 2015-07-30
==================

  * deps: mime-db@~1.16.0
    - Add new mime types

2.1.3 / 2015-07-13
==================

  * deps: mime-db@~1.15.0
    - Add new mime types

2.1.2 / 2015-06-25
==================

  * deps: mime-db@~1.14.0
    - Add new mime types

2.1.1 / 2015-06-08
==================

  * perf: fix deopt during mapping

2.1.0 / 2015-06-07
==================

  * Fix incorrectly treating extension-less file name as extension
    - i.e. `'path/to/json'` will no longer return `application/json`
  * Fix `.charset(type)` to accept parameters
  * Fix `.charset(type)` to match case-insensitive
  * Improve generation of extension to MIME mapping
  * Refactor internals for readability and no argument reassignment
  * Prefer `application/*` MIME types from the same source
  * Prefer any type over `application/octet-stream`
  * deps: mime-db@~1.13.0
    - Add nginx as a source
    - Add new mime types

2.0.14 / 2015-06-06
===================

  * deps: mime-db@~1.12.0
    - Add new mime types

2.0.13 / 2015-05-31
===================

  * deps: mime-db@~1.11.0
    - Add new mime types

2.0.12 / 2015-05-19
===================

  * deps: mime-db@~1.10.0
    - Add new mime types

2.0.11 / 2015-05-05
===================

  * deps: mime-db@~1.9.1
    - Add new mime types

2.0.10 / 2015-03-13
===================

  * deps: mime-db@~1.8.0
    - Add new mime types

2.0.9 / 2015-02-09
==================

  * deps: mime-db@~1.7.0
    - Add new mime types
    - Community extensions ownership transferred from `node-mime`

2.0.8 / 2015-01-29
==================

  * deps: mime-db@~1.6.0
    - Add new mime types

2.0.7 / 2014-12-30
==================

  * deps: mime-db@~1.5.0
    - Add new mime types
    - Fix various invalid MIME type entries

2.0.6 / 2014-12-30
==================

  * deps: mime-db@~1.4.0
    - Add new mime types
    - Fix various invalid MIME type entries
    - Remove example template MIME types

2.0.5 / 2014-12-29
==================

  * deps: mime-db@~1.3.1
    - Fix missing extensions

2.0.4 / 2014-12-10
==================

  * deps: mime-db@~1.3.0
    - Add new mime types

2.0.3 / 2014-11-09
==================

  * deps: mime-db@~1.2.0
    - Add new mime types

2.0.2 / 2014-09-28
==================

  * deps: mime-db@~1.1.0
    - Add new mime types
    - Update charsets

2.0.1 / 2014-09-07
==================

  * Support Node.js 0.6

2.0.0 / 2014-09-02
==================

  * Use `mime-db`
  * Remove `.define()`

1.0.2 / 2014-08-04
==================

  * Set charset=utf-8 for `text/javascript`

1.0.1 / 2014-06-24
==================

  * Add `text/jsx` type

1.0.0 / 2014-05-12
==================

  * Return `false` for unknown types
  * Set charset=utf-8 for `application/json`

0.1.0 / 2014-05-02
==================

  * Initial release


---

<!-- source: archive/library/javascript/references/packages/negotiator/HISTORY--000439.md -->

## Imported source: archive/library/javascript/references/packages/negotiator/HISTORY--000439.md

0.6.3 / 2022-01-22
==================

  * Revert "Lazy-load modules from main entry point"

0.6.2 / 2019-04-29
==================

  * Fix sorting charset, encoding, and language with extra parameters

0.6.1 / 2016-05-02
==================

  * perf: improve `Accept` parsing speed
  * perf: improve `Accept-Charset` parsing speed
  * perf: improve `Accept-Encoding` parsing speed
  * perf: improve `Accept-Language` parsing speed

0.6.0 / 2015-09-29
==================

  * Fix including type extensions in parameters in `Accept` parsing
  * Fix parsing `Accept` parameters with quoted equals
  * Fix parsing `Accept` parameters with quoted semicolons
  * Lazy-load modules from main entry point
  * perf: delay type concatenation until needed
  * perf: enable strict mode
  * perf: hoist regular expressions
  * perf: remove closures getting spec properties
  * perf: remove a closure from media type parsing
  * perf: remove property delete from media type parsing

0.5.3 / 2015-05-10
==================

  * Fix media type parameter matching to be case-insensitive

0.5.2 / 2015-05-06
==================

  * Fix comparing media types with quoted values
  * Fix splitting media types with quoted commas

0.5.1 / 2015-02-14
==================

  * Fix preference sorting to be stable for long acceptable lists

0.5.0 / 2014-12-18
==================

  * Fix list return order when large accepted list
  * Fix missing identity encoding when q=0 exists
  * Remove dynamic building of Negotiator class

0.4.9 / 2014-10-14
==================

  * Fix error when media type has invalid parameter

0.4.8 / 2014-09-28
==================

  * Fix all negotiations to be case-insensitive
  * Stable sort preferences of same quality according to client order
  * Support Node.js 0.6

0.4.7 / 2014-06-24
==================

  * Handle invalid provided languages
  * Handle invalid provided media types

0.4.6 / 2014-06-11
==================

  *  Order by specificity when quality is the same

0.4.5 / 2014-05-29
==================

  * Fix regression in empty header handling

0.4.4 / 2014-05-29
==================

  * Fix behaviors when headers are not present

0.4.3 / 2014-04-16
==================

  * Handle slashes on media params correctly

0.4.2 / 2014-02-28
==================

  * Fix media type sorting
  * Handle media types params strictly

0.4.1 / 2014-01-16
==================

  * Use most specific matches

0.4.0 / 2014-01-09
==================

  * Remove preferred prefix from methods


---

<!-- source: archive/library/javascript/references/packages/on-finished/HISTORY--000378.md -->

## Imported source: archive/library/javascript/references/packages/on-finished/HISTORY--000378.md

2.4.1 / 2022-02-22
==================

  * Fix error on early async hooks implementations

2.4.0 / 2022-02-21
==================

  * Prevent loss of async hooks context

2.3.0 / 2015-05-26
==================

  * Add defined behavior for HTTP `CONNECT` requests
  * Add defined behavior for HTTP `Upgrade` requests
  * deps: ee-first@1.1.1

2.2.1 / 2015-04-22
==================

  * Fix `isFinished(req)` when data buffered

2.2.0 / 2014-12-22
==================

  * Add message object to callback arguments

2.1.1 / 2014-10-22
==================

  * Fix handling of pipelined requests

2.1.0 / 2014-08-16
==================

  * Check if `socket` is detached
  * Return `undefined` for `isFinished` if state unknown

2.0.0 / 2014-08-16
==================

  * Add `isFinished` function
  * Move to `jshttp` organization
  * Remove support for plain socket argument
  * Rename to `on-finished`
  * Support both `req` and `res` as arguments
  * deps: ee-first@1.0.5

1.2.2 / 2014-06-10
==================

  * Reduce listeners added to emitters
    - avoids "event emitter leak" warnings when used multiple times on same request

1.2.1 / 2014-06-08
==================

  * Fix returned value when already finished

1.2.0 / 2014-06-05
==================

  * Call callback when called on already-finished socket

1.1.4 / 2014-05-27
==================

  * Support node.js 0.8

1.1.3 / 2014-04-30
==================

  * Make sure errors passed as instanceof `Error`

1.1.2 / 2014-04-18
==================

  * Default the `socket` to passed-in object

1.1.1 / 2014-01-16
==================

  * Rename module to `finished`

1.1.0 / 2013-12-25
==================

  * Call callback when called on already-errored socket

1.0.1 / 2013-12-20
==================

  * Actually pass the error to the callback

1.0.0 / 2013-12-20
==================

  * Initial release


---

<!-- source: archive/library/javascript/references/packages/parseurl/HISTORY--000299.md -->

## Imported source: archive/library/javascript/references/packages/parseurl/HISTORY--000299.md

1.3.3 / 2019-04-15
==================

  * Fix Node.js 0.8 return value inconsistencies

1.3.2 / 2017-09-09
==================

  * perf: reduce overhead for full URLs
  * perf: unroll the "fast-path" `RegExp`

1.3.1 / 2016-01-17
==================

  * perf: enable strict mode

1.3.0 / 2014-08-09
==================

  * Add `parseurl.original` for parsing `req.originalUrl` with fallback
  * Return `undefined` if `req.url` is `undefined`

1.2.0 / 2014-07-21
==================

  * Cache URLs based on original value
  * Remove no-longer-needed URL mis-parse work-around
  * Simplify the "fast-path" `RegExp`

1.1.3 / 2014-07-08
==================

  * Fix typo

1.1.2 / 2014-07-08
==================

  * Seriously fix Node.js 0.8 compatibility

1.1.1 / 2014-07-08
==================

  * Fix Node.js 0.8 compatibility

1.1.0 / 2014-07-08
==================

  * Incorporate URL href-only parse fast-path

1.0.1 / 2014-03-08
==================

  * Add missing `require`

1.0.0 / 2014-03-08
==================

  * Genesis from `connect`


---

<!-- source: archive/library/javascript/references/packages/proxy-addr/HISTORY--000413.md -->

## Imported source: archive/library/javascript/references/packages/proxy-addr/HISTORY--000413.md

2.0.7 / 2021-05-31
==================

  * deps: forwarded@0.2.0
    - Use `req.socket` over deprecated `req.connection`

2.0.6 / 2020-02-24
==================

  * deps: ipaddr.js@1.9.1

2.0.5 / 2019-04-16
==================

  * deps: ipaddr.js@1.9.0

2.0.4 / 2018-07-26
==================

  * deps: ipaddr.js@1.8.0

2.0.3 / 2018-02-19
==================

  * deps: ipaddr.js@1.6.0

2.0.2 / 2017-09-24
==================

  * deps: forwarded@~0.1.2
    - perf: improve header parsing
    - perf: reduce overhead when no `X-Forwarded-For` header

2.0.1 / 2017-09-10
==================

  * deps: forwarded@~0.1.1
    - Fix trimming leading / trailing OWS
    - perf: hoist regular expression
  * deps: ipaddr.js@1.5.2

2.0.0 / 2017-08-08
==================

  * Drop support for Node.js below 0.10

1.1.5 / 2017-07-25
==================

  * Fix array argument being altered
  * deps: ipaddr.js@1.4.0

1.1.4 / 2017-03-24
==================

  * deps: ipaddr.js@1.3.0

1.1.3 / 2017-01-14
==================

  * deps: ipaddr.js@1.2.0

1.1.2 / 2016-05-29
==================

  * deps: ipaddr.js@1.1.1
    - Fix IPv6-mapped IPv4 validation edge cases

1.1.1 / 2016-05-03
==================

  * Fix regression matching mixed versions against multiple subnets

1.1.0 / 2016-05-01
==================

  * Fix accepting various invalid netmasks
    - IPv4 netmasks must be contingous
    - IPv6 addresses cannot be used as a netmask
  * deps: ipaddr.js@1.1.0

1.0.10 / 2015-12-09
===================

  * deps: ipaddr.js@1.0.5
    - Fix regression in `isValid` with non-string arguments

1.0.9 / 2015-12-01
==================

  * deps: ipaddr.js@1.0.4
    - Fix accepting some invalid IPv6 addresses
    - Reject CIDRs with negative or overlong masks
  * perf: enable strict mode

1.0.8 / 2015-05-10
==================

  * deps: ipaddr.js@1.0.1

1.0.7 / 2015-03-16
==================

  * deps: ipaddr.js@0.1.9
    - Fix OOM on certain inputs to `isValid`

1.0.6 / 2015-02-01
==================

  * deps: ipaddr.js@0.1.8

1.0.5 / 2015-01-08
==================

  * deps: ipaddr.js@0.1.6

1.0.4 / 2014-11-23
==================

  * deps: ipaddr.js@0.1.5
    - Fix edge cases with `isValid`

1.0.3 / 2014-09-21
==================

  * Use `forwarded` npm module

1.0.2 / 2014-09-18
==================

  * Fix a global leak when multiple subnets are trusted
  * Support Node.js 0.6
  * deps: ipaddr.js@0.1.3

1.0.1 / 2014-06-03
==================

  * Fix links in npm package

1.0.0 / 2014-05-08
==================

  * Add `trust` argument to determine proxy trust on
    * Accepts custom function
    * Accepts IPv4/IPv6 address(es)
    * Accepts subnets
    * Accepts pre-defined names
  * Add optional `trust` argument to `proxyaddr.all` to
    stop at first untrusted
  * Add `proxyaddr.compile` to pre-compile `trust` function
    to make subsequent calls faster

0.0.1 / 2014-05-04
==================

  * Fix bad npm publish

0.0.0 / 2014-05-04
==================

  * Initial release


---

<!-- source: archive/library/javascript/references/packages/range-parser/HISTORY--000325.md -->

## Imported source: archive/library/javascript/references/packages/range-parser/HISTORY--000325.md

1.2.1 / 2019-05-10
==================

  * Improve error when `str` is not a string

1.2.0 / 2016-06-01
==================

  * Add `combine` option to combine overlapping ranges

1.1.0 / 2016-05-13
==================

  * Fix incorrectly returning -1 when there is at least one valid range
  * perf: remove internal function

1.0.3 / 2015-10-29
==================

  * perf: enable strict mode

1.0.2 / 2014-09-08
==================

  * Support Node.js 0.6

1.0.1 / 2014-09-07
==================

  * Move repository to jshttp

1.0.0 / 2013-12-11
==================

  * Add repository to package.json
  * Add MIT license

0.0.4 / 2012-06-17
==================

  * Change ret -1 for unsatisfiable and -2 when invalid

0.0.3 / 2012-06-17
==================

  * Fix last-byte-pos default to len - 1

0.0.2 / 2012-06-14
==================

  * Add `.type`

0.0.1 / 2012-06-11
==================

  * Initial release


---

<!-- source: archive/library/javascript/references/packages/raw-body/HISTORY--000340.md -->

## Imported source: archive/library/javascript/references/packages/raw-body/HISTORY--000340.md

3.0.0 / 2024-07-25
==================

  * deps: iconv-lite@0.6.3
    - Fix HKSCS encoding to prefer Big5 codes
    - Fix minor issue in UTF-32 decoder's endianness detection code
    - Update 'gb18030' encoding to :2005 edition

3.0.0-beta.1 / 2023-02-21
=========================

  * Change TypeScript argument to `NodeJS.ReadableStream` interface
  * Drop support for Node.js 0.8
  * deps: iconv-lite@0.5.2
    - Add encoding cp720
    - Add encoding UTF-32

2.5.2 / 2023-02-21
==================

  * Fix error message for non-stream argument

2.5.1 / 2022-02-28
==================

  * Fix error on early async hooks implementations

2.5.0 / 2022-02-21
==================

  * Prevent loss of async hooks context
  * Prevent hanging when stream is not readable
  * deps: http-errors@2.0.0
    - deps: depd@2.0.0
    - deps: statuses@2.0.1

2.4.3 / 2022-02-14
==================

  * deps: bytes@3.1.2

2.4.2 / 2021-11-16
==================

  * deps: bytes@3.1.1
  * deps: http-errors@1.8.1
    - deps: setprototypeof@1.2.0
    - deps: toidentifier@1.0.1

2.4.1 / 2019-06-25
==================

  * deps: http-errors@1.7.3
    - deps: inherits@2.0.4

2.4.0 / 2019-04-17
==================

  * deps: bytes@3.1.0
    - Add petabyte (`pb`) support
  * deps: http-errors@1.7.2
    - Set constructor name when possible
    - deps: setprototypeof@1.1.1
    - deps: statuses@'>= 1.5.0 < 2'
  * deps: iconv-lite@0.4.24
    - Added encoding MIK

2.3.3 / 2018-05-08
==================

  * deps: http-errors@1.6.3
    - deps: depd@~1.1.2
    - deps: setprototypeof@1.1.0
    - deps: statuses@'>= 1.3.1 < 2'
  * deps: iconv-lite@0.4.23
    - Fix loading encoding with year appended
    - Fix deprecation warnings on Node.js 10+

2.3.2 / 2017-09-09
==================

  * deps: iconv-lite@0.4.19
    - Fix ISO-8859-1 regression
    - Update Windows-1255

2.3.1 / 2017-09-07
==================

  * deps: bytes@3.0.0
  * deps: http-errors@1.6.2
    - deps: depd@1.1.1
  * perf: skip buffer decoding on overage chunk

2.3.0 / 2017-08-04
==================

  * Add TypeScript definitions
  * Use `http-errors` for standard emitted errors
  * deps: bytes@2.5.0
  * deps: iconv-lite@0.4.18
    - Add support for React Native
    - Add a warning if not loaded as utf-8
    - Fix CESU-8 decoding in Node.js 8
    - Improve speed of ISO-8859-1 encoding

2.2.0 / 2017-01-02
==================

  * deps: iconv-lite@0.4.15
    - Added encoding MS-31J
    - Added encoding MS-932
    - Added encoding MS-936
    - Added encoding MS-949
    - Added encoding MS-950
    - Fix GBK/GB18030 handling of Euro character

2.1.7 / 2016-06-19
==================

  * deps: bytes@2.4.0
  * perf: remove double-cleanup on happy path

2.1.6 / 2016-03-07
==================

  * deps: bytes@2.3.0
    - Drop partial bytes on all parsed units
    - Fix parsing byte string that looks like hex

2.1.5 / 2015-11-30
==================

  * deps: bytes@2.2.0
  * deps: iconv-lite@0.4.13

2.1.4 / 2015-09-27
==================

  * Fix masking critical errors from `iconv-lite`
  * deps: iconv-lite@0.4.12
    - Fix CESU-8 decoding in Node.js 4.x

2.1.3 / 2015-09-12
==================

  * Fix sync callback when attaching data listener causes sync read
    - Node.js 0.10 compatibility issue

2.1.2 / 2015-07-05
==================

  * Fix error stack traces to skip `makeError`
  * deps: iconv-lite@0.4.11
    - Add encoding CESU-8

2.1.1 / 2015-06-14
==================

  * Use `unpipe` module for unpiping requests

2.1.0 / 2015-05-28
==================

  * deps: iconv-lite@0.4.10
    - Improved UTF-16 endianness detection
    - Leading BOM is now removed when decoding
    - The encoding UTF-16 without BOM now defaults to UTF-16LE when detection fails

2.0.2 / 2015-05-21
==================

  * deps: bytes@2.1.0
    - Slight optimizations

2.0.1 / 2015-05-10
==================

  * Fix a false-positive when unpiping in Node.js 0.8

2.0.0 / 2015-05-08
==================

  * Return a promise without callback instead of thunk
  * deps: bytes@2.0.1
    - units no longer case sensitive when parsing

1.3.4 / 2015-04-15
==================

  * Fix hanging callback if request aborts during read
  * deps: iconv-lite@0.4.8
    - Add encoding alias UNICODE-1-1-UTF-7

1.3.3 / 2015-02-08
==================

  * deps: iconv-lite@0.4.7
    - Gracefully support enumerables on `Object.prototype`

1.3.2 / 2015-01-20
==================

  * deps: iconv-lite@0.4.6
    - Fix rare aliases of single-byte encodings

1.3.1 / 2014-11-21
==================

  * deps: iconv-lite@0.4.5
    - Fix Windows-31J and X-SJIS encoding support

1.3.0 / 2014-07-20
==================

  * Fully unpipe the stream on error
    - Fixes `Cannot switch to old mode now` error on Node.js 0.10+

1.2.3 / 2014-07-20
==================

  * deps: iconv-lite@0.4.4
    - Added encoding UTF-7

1.2.2 / 2014-06-19
==================

  * Send invalid encoding error to callback

1.2.1 / 2014-06-15
==================

  * deps: iconv-lite@0.4.3
    - Added encodings UTF-16BE and UTF-16 with BOM

1.2.0 / 2014-06-13
==================

  * Passing string as `options` interpreted as encoding
  * Support all encodings from `iconv-lite`

1.1.7 / 2014-06-12
==================

  * use `string_decoder` module from npm

1.1.6 / 2014-05-27
==================

  * check encoding for old streams1
  * support node.js < 0.10.6

1.1.5 / 2014-05-14
==================

  * bump bytes

1.1.4 / 2014-04-19
==================

  * allow true as an option
  * bump bytes

1.1.3 / 2014-03-02
==================

  * fix case when length=null

1.1.2 / 2013-12-01
==================

  * be less strict on state.encoding check

1.1.1 / 2013-11-27
==================

  * add engines

1.1.0 / 2013-11-27
==================

  * add err.statusCode and err.type
  * allow for encoding option to be true
  * pause the stream instead of dumping on error
  * throw if the stream's encoding is set

1.0.1 / 2013-11-19
==================

  * dont support streams1, throw if dev set encoding

1.0.0 / 2013-11-17
==================

  * rename `expected` option to `length`

0.2.0 / 2013-11-15
==================

  * republish

0.1.1 / 2013-11-15
==================

  * use bytes

0.1.0 / 2013-11-11
==================

  * generator support

0.0.3 / 2013-10-10
==================

  * update repo

0.0.2 / 2013-09-14
==================

  * dump stream on bad headers
  * listen to events after defining received and buffers

0.0.1 / 2013-09-14
==================

  * Initial release


---

<!-- source: archive/library/javascript/references/packages/raw-body/HISTORY--000395.md -->

## Imported source: archive/library/javascript/references/packages/raw-body/HISTORY--000395.md

2.5.2 / 2023-02-21
==================

  * Fix error message for non-stream argument

2.5.1 / 2022-02-28
==================

  * Fix error on early async hooks implementations

2.5.0 / 2022-02-21
==================

  * Prevent loss of async hooks context
  * Prevent hanging when stream is not readable
  * deps: http-errors@2.0.0
    - deps: depd@2.0.0
    - deps: statuses@2.0.1

2.4.3 / 2022-02-14
==================

  * deps: bytes@3.1.2

2.4.2 / 2021-11-16
==================

  * deps: bytes@3.1.1
  * deps: http-errors@1.8.1
    - deps: setprototypeof@1.2.0
    - deps: toidentifier@1.0.1

2.4.1 / 2019-06-25
==================

  * deps: http-errors@1.7.3
    - deps: inherits@2.0.4

2.4.0 / 2019-04-17
==================

  * deps: bytes@3.1.0
    - Add petabyte (`pb`) support
  * deps: http-errors@1.7.2
    - Set constructor name when possible
    - deps: setprototypeof@1.1.1
    - deps: statuses@'>= 1.5.0 < 2'
  * deps: iconv-lite@0.4.24
    - Added encoding MIK

2.3.3 / 2018-05-08
==================

  * deps: http-errors@1.6.3
    - deps: depd@~1.1.2
    - deps: setprototypeof@1.1.0
    - deps: statuses@'>= 1.3.1 < 2'
  * deps: iconv-lite@0.4.23
    - Fix loading encoding with year appended
    - Fix deprecation warnings on Node.js 10+

2.3.2 / 2017-09-09
==================

  * deps: iconv-lite@0.4.19
    - Fix ISO-8859-1 regression
    - Update Windows-1255

2.3.1 / 2017-09-07
==================

  * deps: bytes@3.0.0
  * deps: http-errors@1.6.2
    - deps: depd@1.1.1
  * perf: skip buffer decoding on overage chunk

2.3.0 / 2017-08-04
==================

  * Add TypeScript definitions
  * Use `http-errors` for standard emitted errors
  * deps: bytes@2.5.0
  * deps: iconv-lite@0.4.18
    - Add support for React Native
    - Add a warning if not loaded as utf-8
    - Fix CESU-8 decoding in Node.js 8
    - Improve speed of ISO-8859-1 encoding

2.2.0 / 2017-01-02
==================

  * deps: iconv-lite@0.4.15
    - Added encoding MS-31J
    - Added encoding MS-932
    - Added encoding MS-936
    - Added encoding MS-949
    - Added encoding MS-950
    - Fix GBK/GB18030 handling of Euro character

2.1.7 / 2016-06-19
==================

  * deps: bytes@2.4.0
  * perf: remove double-cleanup on happy path

2.1.6 / 2016-03-07
==================

  * deps: bytes@2.3.0
    - Drop partial bytes on all parsed units
    - Fix parsing byte string that looks like hex

2.1.5 / 2015-11-30
==================

  * deps: bytes@2.2.0
  * deps: iconv-lite@0.4.13

2.1.4 / 2015-09-27
==================

  * Fix masking critical errors from `iconv-lite`
  * deps: iconv-lite@0.4.12
    - Fix CESU-8 decoding in Node.js 4.x

2.1.3 / 2015-09-12
==================

  * Fix sync callback when attaching data listener causes sync read
    - Node.js 0.10 compatibility issue

2.1.2 / 2015-07-05
==================

  * Fix error stack traces to skip `makeError`
  * deps: iconv-lite@0.4.11
    - Add encoding CESU-8

2.1.1 / 2015-06-14
==================

  * Use `unpipe` module for unpiping requests

2.1.0 / 2015-05-28
==================

  * deps: iconv-lite@0.4.10
    - Improved UTF-16 endianness detection
    - Leading BOM is now removed when decoding
    - The encoding UTF-16 without BOM now defaults to UTF-16LE when detection fails

2.0.2 / 2015-05-21
==================

  * deps: bytes@2.1.0
    - Slight optimizations

2.0.1 / 2015-05-10
==================

  * Fix a false-positive when unpiping in Node.js 0.8

2.0.0 / 2015-05-08
==================

  * Return a promise without callback instead of thunk
  * deps: bytes@2.0.1
    - units no longer case sensitive when parsing

1.3.4 / 2015-04-15
==================

  * Fix hanging callback if request aborts during read
  * deps: iconv-lite@0.4.8
    - Add encoding alias UNICODE-1-1-UTF-7

1.3.3 / 2015-02-08
==================

  * deps: iconv-lite@0.4.7
    - Gracefully support enumerables on `Object.prototype`

1.3.2 / 2015-01-20
==================

  * deps: iconv-lite@0.4.6
    - Fix rare aliases of single-byte encodings

1.3.1 / 2014-11-21
==================

  * deps: iconv-lite@0.4.5
    - Fix Windows-31J and X-SJIS encoding support

1.3.0 / 2014-07-20
==================

  * Fully unpipe the stream on error
    - Fixes `Cannot switch to old mode now` error on Node.js 0.10+

1.2.3 / 2014-07-20
==================

  * deps: iconv-lite@0.4.4
    - Added encoding UTF-7

1.2.2 / 2014-06-19
==================

  * Send invalid encoding error to callback

1.2.1 / 2014-06-15
==================

  * deps: iconv-lite@0.4.3
    - Added encodings UTF-16BE and UTF-16 with BOM

1.2.0 / 2014-06-13
==================

  * Passing string as `options` interpreted as encoding
  * Support all encodings from `iconv-lite`

1.1.7 / 2014-06-12
==================

  * use `string_decoder` module from npm

1.1.6 / 2014-05-27
==================

  * check encoding for old streams1
  * support node.js < 0.10.6

1.1.5 / 2014-05-14
==================

  * bump bytes

1.1.4 / 2014-04-19
==================

  * allow true as an option
  * bump bytes

1.1.3 / 2014-03-02
==================

  * fix case when length=null

1.1.2 / 2013-12-01
==================

  * be less strict on state.encoding check

1.1.1 / 2013-11-27
==================

  * add engines

1.1.0 / 2013-11-27
==================

  * add err.statusCode and err.type
  * allow for encoding option to be true
  * pause the stream instead of dumping on error
  * throw if the stream's encoding is set

1.0.1 / 2013-11-19
==================

  * dont support streams1, throw if dev set encoding

1.0.0 / 2013-11-17
==================

  * rename `expected` option to `length`

0.2.0 / 2013-11-15
==================

  * republish

0.1.1 / 2013-11-15
==================

  * use bytes

0.1.0 / 2013-11-11
==================

  * generator support

0.0.3 / 2013-10-10
==================

  * update repo

0.0.2 / 2013-09-14
==================

  * dump stream on bad headers
  * listen to events after defining received and buffers

0.0.1 / 2013-09-14
==================

  * Initial release


---

<!-- source: archive/library/javascript/references/packages/send/HISTORY--000386.md -->

## Imported source: archive/library/javascript/references/packages/send/HISTORY--000386.md

0.19.0 / 2024-09-10
===================

* Remove link renderization in html while redirecting

0.18.0 / 2022-03-23
===================

  * Fix emitted 416 error missing headers property
  * Limit the headers removed for 304 response
  * deps: depd@2.0.0
    - Replace internal `eval` usage with `Function` constructor
    - Use instance methods on `process` to check for listeners
  * deps: destroy@1.2.0
  * deps: http-errors@2.0.0
    - deps: depd@2.0.0
    - deps: statuses@2.0.1
  * deps: on-finished@2.4.1
  * deps: statuses@2.0.1

0.17.2 / 2021-12-11
===================

  * pref: ignore empty http tokens
  * deps: http-errors@1.8.1
    - deps: inherits@2.0.4
    - deps: toidentifier@1.0.1
    - deps: setprototypeof@1.2.0
  * deps: ms@2.1.3

0.17.1 / 2019-05-10
===================

  * Set stricter CSP header in redirect & error responses
  * deps: range-parser@~1.2.1

0.17.0 / 2019-05-03
===================

  * deps: http-errors@~1.7.2
    - Set constructor name when possible
    - Use `toidentifier` module to make class names
    - deps: depd@~1.1.2
    - deps: setprototypeof@1.1.1
    - deps: statuses@'>= 1.5.0 < 2'
  * deps: mime@1.6.0
    - Add extensions for JPEG-2000 images
    - Add new `font/*` types from IANA
    - Add WASM mapping
    - Update `.bdoc` to `application/bdoc`
    - Update `.bmp` to `image/bmp`
    - Update `.m4a` to `audio/mp4`
    - Update `.rtf` to `application/rtf`
    - Update `.wav` to `audio/wav`
    - Update `.xml` to `application/xml`
    - Update generic extensions to `application/octet-stream`:
      `.deb`, `.dll`, `.dmg`, `.exe`, `.iso`, `.msi`
    - Use mime-score module to resolve extension conflicts
  * deps: ms@2.1.1
    - Add `week`/`w` support
    - Fix negative number handling
  * deps: statuses@~1.5.0
  * perf: remove redundant `path.normalize` call

0.16.2 / 2018-02-07
===================

  * Fix incorrect end tag in default error & redirects
  * deps: depd@~1.1.2
    - perf: remove argument reassignment
  * deps: encodeurl@~1.0.2
    - Fix encoding `%` as last character
  * deps: statuses@~1.4.0

0.16.1 / 2017-09-29
===================

  * Fix regression in edge-case behavior for empty `path`

0.16.0 / 2017-09-27
===================

  * Add `immutable` option
  * Fix missing `</html>` in default error & redirects
  * Use instance methods on steam to check for listeners
  * deps: mime@1.4.1
    - Add 70 new types for file extensions
    - Set charset as "UTF-8" for .js and .json
  * perf: improve path validation speed

0.15.6 / 2017-09-22
===================

  * deps: debug@2.6.9
  * perf: improve `If-Match` token parsing

0.15.5 / 2017-09-20
===================

  * deps: etag@~1.8.1
    - perf: replace regular expression with substring
  * deps: fresh@0.5.2
    - Fix handling of modified headers with invalid dates
    - perf: improve ETag match loop
    - perf: improve `If-None-Match` token parsing

0.15.4 / 2017-08-05
===================

  * deps: debug@2.6.8
  * deps: depd@~1.1.1
    - Remove unnecessary `Buffer` loading
  * deps: http-errors@~1.6.2
    - deps: depd@1.1.1

0.15.3 / 2017-05-16
===================

  * deps: debug@2.6.7
    - deps: ms@2.0.0
  * deps: ms@2.0.0

0.15.2 / 2017-04-26
===================

  * deps: debug@2.6.4
    - Fix `DEBUG_MAX_ARRAY_LENGTH`
    - deps: ms@0.7.3
  * deps: ms@1.0.0

0.15.1 / 2017-03-04
===================

  * Fix issue when `Date.parse` does not return `NaN` on invalid date
  * Fix strict violation in broken environments

0.15.0 / 2017-02-25
===================

  * Support `If-Match` and `If-Unmodified-Since` headers
  * Add `res` and `path` arguments to `directory` event
  * Remove usage of `res._headers` private field
    - Improves compatibility with Node.js 8 nightly
  * Send complete HTML document in redirect & error responses
  * Set default CSP header in redirect & error responses
  * Use `res.getHeaderNames()` when available
  * Use `res.headersSent` when available
  * deps: debug@2.6.1
    - Allow colors in workers
    - Deprecated `DEBUG_FD` environment variable set to `3` or higher
    - Fix error when running under React Native
    - Use same color for same namespace
    - deps: ms@0.7.2
  * deps: etag@~1.8.0
  * deps: fresh@0.5.0
    - Fix false detection of `no-cache` request directive
    - Fix incorrect result when `If-None-Match` has both `*` and ETags
    - Fix weak `ETag` matching to match spec
    - perf: delay reading header values until needed
    - perf: enable strict mode
    - perf: hoist regular expressions
    - perf: remove duplicate conditional
    - perf: remove unnecessary boolean coercions
    - perf: skip checking modified time if ETag check failed
    - perf: skip parsing `If-None-Match` when no `ETag` header
    - perf: use `Date.parse` instead of `new Date`
  * deps: http-errors@~1.6.1
    - Make `message` property enumerable for `HttpError`s
    - deps: setprototypeof@1.0.3

0.14.2 / 2017-01-23
===================

  * deps: http-errors@~1.5.1
    - deps: inherits@2.0.3
    - deps: setprototypeof@1.0.2
    - deps: statuses@'>= 1.3.1 < 2'
  * deps: ms@0.7.2
  * deps: statuses@~1.3.1

0.14.1 / 2016-06-09
===================

  * Fix redirect error when `path` contains raw non-URL characters
  * Fix redirect when `path` starts with multiple forward slashes

0.14.0 / 2016-06-06
===================

  * Add `acceptRanges` option
  * Add `cacheControl` option
  * Attempt to combine multiple ranges into single range
  * Correctly inherit from `Stream` class
  * Fix `Content-Range` header in 416 responses when using `start`/`end` options
  * Fix `Content-Range` header missing from default 416 responses
  * Ignore non-byte `Range` headers
  * deps: http-errors@~1.5.0
    - Add `HttpError` export, for `err instanceof createError.HttpError`
    - Support new code `421 Misdirected Request`
    - Use `setprototypeof` module to replace `__proto__` setting
    - deps: inherits@2.0.1
    - deps: statuses@'>= 1.3.0 < 2'
    - perf: enable strict mode
  * deps: range-parser@~1.2.0
    - Fix incorrectly returning -1 when there is at least one valid range
    - perf: remove internal function
  * deps: statuses@~1.3.0
    - Add `421 Misdirected Request`
    - perf: enable strict mode
  * perf: remove argument reassignment

0.13.2 / 2016-03-05
===================

  * Fix invalid `Content-Type` header when `send.mime.default_type` unset

0.13.1 / 2016-01-16
===================

  * deps: depd@~1.1.0
    - Support web browser loading
    - perf: enable strict mode
  * deps: destroy@~1.0.4
    - perf: enable strict mode
  * deps: escape-html@~1.0.3
    - perf: enable strict mode
    - perf: optimize string replacement
    - perf: use faster string coercion
  * deps: range-parser@~1.0.3
    - perf: enable strict mode

0.13.0 / 2015-06-16
===================

  * Allow Node.js HTTP server to set `Date` response header
  * Fix incorrectly removing `Content-Location` on 304 response
  * Improve the default redirect response headers
  * Send appropriate headers on default error response
  * Use `http-errors` for standard emitted errors
  * Use `statuses` instead of `http` module for status messages
  * deps: escape-html@1.0.2
  * deps: etag@~1.7.0
    - Improve stat performance by removing hashing
  * deps: fresh@0.3.0
    - Add weak `ETag` matching support
  * deps: on-finished@~2.3.0
    - Add defined behavior for HTTP `CONNECT` requests
    - Add defined behavior for HTTP `Upgrade` requests
    - deps: ee-first@1.1.1
  * perf: enable strict mode
  * perf: remove unnecessary array allocations

0.12.3 / 2015-05-13
===================

  * deps: debug@~2.2.0
    - deps: ms@0.7.1
  * deps: depd@~1.0.1
  * deps: etag@~1.6.0
   - Improve support for JXcore
   - Support "fake" stats objects in environments without `fs`
  * deps: ms@0.7.1
    - Prevent extraordinarily long inputs
  * deps: on-finished@~2.2.1

0.12.2 / 2015-03-13
===================

  * Throw errors early for invalid `extensions` or `index` options
  * deps: debug@~2.1.3
    - Fix high intensity foreground color for bold
    - deps: ms@0.7.0

0.12.1 / 2015-02-17
===================

  * Fix regression sending zero-length files

0.12.0 / 2015-02-16
===================

  * Always read the stat size from the file
  * Fix mutating passed-in `options`
  * deps: mime@1.3.4

0.11.1 / 2015-01-20
===================

  * Fix `root` path disclosure

0.11.0 / 2015-01-05
===================

  * deps: debug@~2.1.1
  * deps: etag@~1.5.1
    - deps: crc@3.2.1
  * deps: ms@0.7.0
    - Add `milliseconds`
    - Add `msecs`
    - Add `secs`
    - Add `mins`
    - Add `hrs`
    - Add `yrs`
  * deps: on-finished@~2.2.0

0.10.1 / 2014-10-22
===================

  * deps: on-finished@~2.1.1
    - Fix handling of pipelined requests

0.10.0 / 2014-10-15
===================

  * deps: debug@~2.1.0
    - Implement `DEBUG_FD` env variable support
  * deps: depd@~1.0.0
  * deps: etag@~1.5.0
    - Improve string performance
    - Slightly improve speed for weak ETags over 1KB

0.9.3 / 2014-09-24
==================

  * deps: etag@~1.4.0
    - Support "fake" stats objects

0.9.2 / 2014-09-15
==================

  * deps: depd@0.4.5
  * deps: etag@~1.3.1
  * deps: range-parser@~1.0.2

0.9.1 / 2014-09-07
==================

  * deps: fresh@0.2.4

0.9.0 / 2014-09-07
==================

  * Add `lastModified` option
  * Use `etag` to generate `ETag` header
  * deps: debug@~2.0.0

0.8.5 / 2014-09-04
==================

  * Fix malicious path detection for empty string path

0.8.4 / 2014-09-04
==================

  * Fix a path traversal issue when using `root`

0.8.3 / 2014-08-16
==================

  * deps: destroy@1.0.3
    - renamed from dethroy
  * deps: on-finished@2.1.0

0.8.2 / 2014-08-14
==================

  * Work around `fd` leak in Node.js 0.10 for `fs.ReadStream`
  * deps: dethroy@1.0.2

0.8.1 / 2014-08-05
==================

  * Fix `extensions` behavior when file already has extension

0.8.0 / 2014-08-05
==================

  * Add `extensions` option

0.7.4 / 2014-08-04
==================

  * Fix serving index files without root dir

0.7.3 / 2014-07-29
==================

  * Fix incorrect 403 on Windows and Node.js 0.11

0.7.2 / 2014-07-27
==================

  * deps: depd@0.4.4
    - Work-around v8 generating empty stack traces

0.7.1 / 2014-07-26
==================

 * deps: depd@0.4.3
   - Fix exception when global `Error.stackTraceLimit` is too low

0.7.0 / 2014-07-20
==================

 * Deprecate `hidden` option; use `dotfiles` option
 * Add `dotfiles` option
 * deps: debug@1.0.4
 * deps: depd@0.4.2
   - Add `TRACE_DEPRECATION` environment variable
   - Remove non-standard grey color from color output
   - Support `--no-deprecation` argument
   - Support `--trace-deprecation` argument

0.6.0 / 2014-07-11
==================

 * Deprecate `from` option; use `root` option
 * Deprecate `send.etag()` -- use `etag` in `options`
 * Deprecate `send.hidden()` -- use `hidden` in `options`
 * Deprecate `send.index()` -- use `index` in `options`
 * Deprecate `send.maxage()` -- use `maxAge` in `options`
 * Deprecate `send.root()` -- use `root` in `options`
 * Cap `maxAge` value to 1 year
 * deps: debug@1.0.3
   - Add support for multiple wildcards in namespaces

0.5.0 / 2014-06-28
==================

 * Accept string for `maxAge` (converted by `ms`)
 * Add `headers` event
 * Include link in default redirect response
 * Use `EventEmitter.listenerCount` to count listeners

0.4.3 / 2014-06-11
==================

 * Do not throw un-catchable error on file open race condition
 * Use `escape-html` for HTML escaping
 * deps: debug@1.0.2
   - fix some debugging output colors on node.js 0.8
 * deps: finished@1.2.2
 * deps: fresh@0.2.2

0.4.2 / 2014-06-09
==================

 * fix "event emitter leak" warnings
 * deps: debug@1.0.1
 * deps: finished@1.2.1

0.4.1 / 2014-06-02
==================

 * Send `max-age` in `Cache-Control` in correct format

0.4.0 / 2014-05-27
==================

 * Calculate ETag with md5 for reduced collisions
 * Fix wrong behavior when index file matches directory
 * Ignore stream errors after request ends
   - Goodbye `EBADF, read`
 * Skip directories in index file search
 * deps: debug@0.8.1

0.3.0 / 2014-04-24
==================

 * Fix sending files with dots without root set
 * Coerce option types
 * Accept API options in options object
 * Set etags to "weak"
 * Include file path in etag
 * Make "Can't set headers after they are sent." catchable
 * Send full entity-body for multi range requests
 * Default directory access to 403 when index disabled
 * Support multiple index paths
 * Support "If-Range" header
 * Control whether to generate etags
 * deps: mime@1.2.11

0.2.0 / 2014-01-29
==================

 * update range-parser and fresh

0.1.4 / 2013-08-11 
==================

 * update fresh

0.1.3 / 2013-07-08 
==================

 * Revert "Fix fd leak"

0.1.2 / 2013-07-03 
==================

 * Fix fd leak

0.1.0 / 2012-08-25 
==================

  * add options parameter to send() that is passed to fs.createReadStream() [kanongil]

0.0.4 / 2012-08-16 
==================

  * allow custom "Accept-Ranges" definition

0.0.3 / 2012-07-16 
==================

  * fix normalization of the root directory. Closes #3

0.0.2 / 2012-07-09 
==================

  * add passing of req explicitly for now (YUCK)

0.0.1 / 2010-01-03
==================

  * Initial release


---

<!-- source: archive/library/javascript/references/packages/serve-static/HISTORY--000431.md -->

## Imported source: archive/library/javascript/references/packages/serve-static/HISTORY--000431.md

1.16.2 / 2024-09-11
===================

* deps: encodeurl@~2.0.0

1.16.1 / 2024-09-11
===================

* deps: send@0.19.0

1.16.0 / 2024-09-10
===================

* Remove link renderization in html while redirecting


1.15.0 / 2022-03-24
===================

  * deps: send@0.18.0
    - Fix emitted 416 error missing headers property
    - Limit the headers removed for 304 response
    - deps: depd@2.0.0
    - deps: destroy@1.2.0
    - deps: http-errors@2.0.0
    - deps: on-finished@2.4.1
    - deps: statuses@2.0.1

1.14.2 / 2021-12-15
===================

  * deps: send@0.17.2
    - deps: http-errors@1.8.1
    - deps: ms@2.1.3
    - pref: ignore empty http tokens

1.14.1 / 2019-05-10
===================

  * Set stricter CSP header in redirect response
  * deps: send@0.17.1
    - deps: range-parser@~1.2.1

1.14.0 / 2019-05-07
===================

  * deps: parseurl@~1.3.3
  * deps: send@0.17.0
    - deps: http-errors@~1.7.2
    - deps: mime@1.6.0
    - deps: ms@2.1.1
    - deps: statuses@~1.5.0
    - perf: remove redundant `path.normalize` call

1.13.2 / 2018-02-07
===================

  * Fix incorrect end tag in redirects
  * deps: encodeurl@~1.0.2
    - Fix encoding `%` as last character
  * deps: send@0.16.2
    - deps: depd@~1.1.2
    - deps: encodeurl@~1.0.2
    - deps: statuses@~1.4.0

1.13.1 / 2017-09-29
===================

  * Fix regression when `root` is incorrectly set to a file
  * deps: send@0.16.1

1.13.0 / 2017-09-27
===================

  * deps: send@0.16.0
    - Add 70 new types for file extensions
    - Add `immutable` option
    - Fix missing `</html>` in default error & redirects
    - Set charset as "UTF-8" for .js and .json
    - Use instance methods on steam to check for listeners
    - deps: mime@1.4.1
    - perf: improve path validation speed

1.12.6 / 2017-09-22
===================

  * deps: send@0.15.6
    - deps: debug@2.6.9
    - perf: improve `If-Match` token parsing
  * perf: improve slash collapsing

1.12.5 / 2017-09-21
===================

  * deps: parseurl@~1.3.2
    - perf: reduce overhead for full URLs
    - perf: unroll the "fast-path" `RegExp`
  * deps: send@0.15.5
    - Fix handling of modified headers with invalid dates
    - deps: etag@~1.8.1
    - deps: fresh@0.5.2

1.12.4 / 2017-08-05
===================

  * deps: send@0.15.4
    - deps: debug@2.6.8
    - deps: depd@~1.1.1
    - deps: http-errors@~1.6.2

1.12.3 / 2017-05-16
===================

  * deps: send@0.15.3
    - deps: debug@2.6.7

1.12.2 / 2017-04-26
===================

  * deps: send@0.15.2
    - deps: debug@2.6.4

1.12.1 / 2017-03-04
===================

  * deps: send@0.15.1
    - Fix issue when `Date.parse` does not return `NaN` on invalid date
    - Fix strict violation in broken environments

1.12.0 / 2017-02-25
===================

  * Send complete HTML document in redirect response
  * Set default CSP header in redirect response
  * deps: send@0.15.0
    - Fix false detection of `no-cache` request directive
    - Fix incorrect result when `If-None-Match` has both `*` and ETags
    - Fix weak `ETag` matching to match spec
    - Remove usage of `res._headers` private field
    - Support `If-Match` and `If-Unmodified-Since` headers
    - Use `res.getHeaderNames()` when available
    - Use `res.headersSent` when available
    - deps: debug@2.6.1
    - deps: etag@~1.8.0
    - deps: fresh@0.5.0
    - deps: http-errors@~1.6.1

1.11.2 / 2017-01-23
===================

  * deps: send@0.14.2
    - deps: http-errors@~1.5.1
    - deps: ms@0.7.2
    - deps: statuses@~1.3.1

1.11.1 / 2016-06-10
===================

  * Fix redirect error when `req.url` contains raw non-URL characters
  * deps: send@0.14.1

1.11.0 / 2016-06-07
===================

  * Use status code 301 for redirects
  * deps: send@0.14.0
    - Add `acceptRanges` option
    - Add `cacheControl` option
    - Attempt to combine multiple ranges into single range
    - Correctly inherit from `Stream` class
    - Fix `Content-Range` header in 416 responses when using `start`/`end` options
    - Fix `Content-Range` header missing from default 416 responses
    - Ignore non-byte `Range` headers
    - deps: http-errors@~1.5.0
    - deps: range-parser@~1.2.0
    - deps: statuses@~1.3.0
    - perf: remove argument reassignment

1.10.3 / 2016-05-30
===================

  * deps: send@0.13.2
    - Fix invalid `Content-Type` header when `send.mime.default_type` unset

1.10.2 / 2016-01-19
===================

  * deps: parseurl@~1.3.1
    - perf: enable strict mode

1.10.1 / 2016-01-16
===================

  * deps: escape-html@~1.0.3
    - perf: enable strict mode
    - perf: optimize string replacement
    - perf: use faster string coercion
  * deps: send@0.13.1
    - deps: depd@~1.1.0
    - deps: destroy@~1.0.4
    - deps: escape-html@~1.0.3
    - deps: range-parser@~1.0.3

1.10.0 / 2015-06-17
===================

  * Add `fallthrough` option
    - Allows declaring this middleware is the final destination
    - Provides better integration with Express patterns
  * Fix reading options from options prototype
  * Improve the default redirect response headers
  * deps: escape-html@1.0.2
  * deps: send@0.13.0
    - Allow Node.js HTTP server to set `Date` response header
    - Fix incorrectly removing `Content-Location` on 304 response
    - Improve the default redirect response headers
    - Send appropriate headers on default error response
    - Use `http-errors` for standard emitted errors
    - Use `statuses` instead of `http` module for status messages
    - deps: escape-html@1.0.2
    - deps: etag@~1.7.0
    - deps: fresh@0.3.0
    - deps: on-finished@~2.3.0
    - perf: enable strict mode
    - perf: remove unnecessary array allocations
  * perf: enable strict mode
  * perf: remove argument reassignment

1.9.3 / 2015-05-14
==================

  * deps: send@0.12.3
    - deps: debug@~2.2.0
    - deps: depd@~1.0.1
    - deps: etag@~1.6.0
    - deps: ms@0.7.1
    - deps: on-finished@~2.2.1

1.9.2 / 2015-03-14
==================

  * deps: send@0.12.2
    - Throw errors early for invalid `extensions` or `index` options
    - deps: debug@~2.1.3

1.9.1 / 2015-02-17
==================

  * deps: send@0.12.1
    - Fix regression sending zero-length files

1.9.0 / 2015-02-16
==================

  * deps: send@0.12.0
    - Always read the stat size from the file
    - Fix mutating passed-in `options`
    - deps: mime@1.3.4

1.8.1 / 2015-01-20
==================

  * Fix redirect loop in Node.js 0.11.14
  * deps: send@0.11.1
    - Fix root path disclosure

1.8.0 / 2015-01-05
==================

  * deps: send@0.11.0
    - deps: debug@~2.1.1
    - deps: etag@~1.5.1
    - deps: ms@0.7.0
    - deps: on-finished@~2.2.0

1.7.2 / 2015-01-02
==================

  * Fix potential open redirect when mounted at root

1.7.1 / 2014-10-22
==================

  * deps: send@0.10.1
    - deps: on-finished@~2.1.1

1.7.0 / 2014-10-15
==================

  * deps: send@0.10.0
    - deps: debug@~2.1.0
    - deps: depd@~1.0.0
    - deps: etag@~1.5.0

1.6.5 / 2015-02-04
==================

  * Fix potential open redirect when mounted at root
    - Back-ported from v1.7.2

1.6.4 / 2014-10-08
==================

  * Fix redirect loop when index file serving disabled

1.6.3 / 2014-09-24
==================

  * deps: send@0.9.3
    - deps: etag@~1.4.0

1.6.2 / 2014-09-15
==================

  * deps: send@0.9.2
    - deps: depd@0.4.5
    - deps: etag@~1.3.1
    - deps: range-parser@~1.0.2

1.6.1 / 2014-09-07
==================

  * deps: send@0.9.1
    - deps: fresh@0.2.4

1.6.0 / 2014-09-07
==================

  * deps: send@0.9.0
    - Add `lastModified` option
    - Use `etag` to generate `ETag` header
    - deps: debug@~2.0.0

1.5.4 / 2014-09-04
==================

  * deps: send@0.8.5
    - Fix a path traversal issue when using `root`
    - Fix malicious path detection for empty string path

1.5.3 / 2014-08-17
==================

  * deps: send@0.8.3

1.5.2 / 2014-08-14
==================

  * deps: send@0.8.2
    - Work around `fd` leak in Node.js 0.10 for `fs.ReadStream`

1.5.1 / 2014-08-09
==================

  * Fix parsing of weird `req.originalUrl` values
  * deps: parseurl@~1.3.0
  * deps: utils-merge@1.0.0

1.5.0 / 2014-08-05
==================

  * deps: send@0.8.1
    - Add `extensions` option

1.4.4 / 2014-08-04
==================

  * deps: send@0.7.4
    - Fix serving index files without root dir

1.4.3 / 2014-07-29
==================

  * deps: send@0.7.3
    - Fix incorrect 403 on Windows and Node.js 0.11

1.4.2 / 2014-07-27
==================

  * deps: send@0.7.2
    - deps: depd@0.4.4

1.4.1 / 2014-07-26
==================

  * deps: send@0.7.1
    - deps: depd@0.4.3

1.4.0 / 2014-07-21
==================

  * deps: parseurl@~1.2.0
    - Cache URLs based on original value
    - Remove no-longer-needed URL mis-parse work-around
    - Simplify the "fast-path" `RegExp`
  * deps: send@0.7.0
    - Add `dotfiles` option
    - deps: debug@1.0.4
    - deps: depd@0.4.2

1.3.2 / 2014-07-11
==================

  * deps: send@0.6.0
    - Cap `maxAge` value to 1 year
    - deps: debug@1.0.3

1.3.1 / 2014-07-09
==================

  * deps: parseurl@~1.1.3
    - faster parsing of href-only URLs

1.3.0 / 2014-06-28
==================

  * Add `setHeaders` option
  * Include HTML link in redirect response
  * deps: send@0.5.0
    - Accept string for `maxAge` (converted by `ms`)

1.2.3 / 2014-06-11
==================

  * deps: send@0.4.3
    - Do not throw un-catchable error on file open race condition
    - Use `escape-html` for HTML escaping
    - deps: debug@1.0.2
    - deps: finished@1.2.2
    - deps: fresh@0.2.2

1.2.2 / 2014-06-09
==================

  * deps: send@0.4.2
    - fix "event emitter leak" warnings
    - deps: debug@1.0.1
    - deps: finished@1.2.1

1.2.1 / 2014-06-02
==================

  * use `escape-html` for escaping
  * deps: send@0.4.1
    - Send `max-age` in `Cache-Control` in correct format

1.2.0 / 2014-05-29
==================

  * deps: send@0.4.0
    - Calculate ETag with md5 for reduced collisions
    - Fix wrong behavior when index file matches directory
    - Ignore stream errors after request ends
    - Skip directories in index file search
    - deps: debug@0.8.1

1.1.0 / 2014-04-24
==================

  * Accept options directly to `send` module
  * deps: send@0.3.0

1.0.4 / 2014-04-07
==================

  * Resolve relative paths at middleware setup
  * Use parseurl to parse the URL from request

1.0.3 / 2014-03-20
==================

  * Do not rely on connect-like environments

1.0.2 / 2014-03-06
==================

  * deps: send@0.2.0

1.0.1 / 2014-03-05
==================

  * Add mime export for back-compat

1.0.0 / 2014-03-05
==================

  * Genesis from `connect`


---

<!-- source: archive/library/javascript/references/packages/statuses/HISTORY--000458.md -->

## Imported source: archive/library/javascript/references/packages/statuses/HISTORY--000458.md

2.0.1 / 2021-01-03
==================

  * Fix returning values from `Object.prototype`

2.0.0 / 2020-04-19
==================

  * Drop support for Node.js 0.6
  * Fix messaging casing of `418 I'm a Teapot`
  * Remove code 306
  * Remove `status[code]` exports; use `status.message[code]`
  * Remove `status[msg]` exports; use `status.code[msg]`
  * Rename `425 Unordered Collection` to standard `425 Too Early`
  * Rename `STATUS_CODES` export to `message`
  * Return status message for `statuses(code)` when given code

1.5.0 / 2018-03-27
==================

  * Add `103 Early Hints`

1.4.0 / 2017-10-20
==================

  * Add `STATUS_CODES` export

1.3.1 / 2016-11-11
==================

  * Fix return type in JSDoc

1.3.0 / 2016-05-17
==================

  * Add `421 Misdirected Request`
  * perf: enable strict mode

1.2.1 / 2015-02-01
==================

  * Fix message for status 451
    - `451 Unavailable For Legal Reasons`

1.2.0 / 2014-09-28
==================

  * Add `208 Already Repored`
  * Add `226 IM Used`
  * Add `306 (Unused)`
  * Add `415 Unable For Legal Reasons`
  * Add `508 Loop Detected`

1.1.1 / 2014-09-24
==================

  * Add missing 308 to `codes.json`

1.1.0 / 2014-09-21
==================

  * Add `codes.json` for universal support

1.0.4 / 2014-08-20
==================

  * Package cleanup

1.0.3 / 2014-06-08
==================

  * Add 308 to `.redirect` category

1.0.2 / 2014-03-13
==================

  * Add `.retry` category

1.0.1 / 2014-03-12
==================

  * Initial release


---

<!-- source: archive/library/javascript/references/packages/toidentifier/HISTORY--000287.md -->

## Imported source: archive/library/javascript/references/packages/toidentifier/HISTORY--000287.md

1.0.1 / 2021-11-14
==================

  * pref: enable strict mode

1.0.0 / 2018-07-09
==================

  * Initial release


---

<!-- source: archive/library/javascript/references/packages/type-is/HISTORY--000425.md -->

## Imported source: archive/library/javascript/references/packages/type-is/HISTORY--000425.md

1.6.18 / 2019-04-26
===================

  * Fix regression passing request object to `typeis.is`

1.6.17 / 2019-04-25
===================

  * deps: mime-types@~2.1.24
    - Add Apple file extensions from IANA
    - Add extension `.csl` to `application/vnd.citationstyles.style+xml`
    - Add extension `.es` to `application/ecmascript`
    - Add extension `.nq` to `application/n-quads`
    - Add extension `.nt` to `application/n-triples`
    - Add extension `.owl` to `application/rdf+xml`
    - Add extensions `.siv` and `.sieve` to `application/sieve`
    - Add extensions from IANA for `image/*` types
    - Add extensions from IANA for `model/*` types
    - Add extensions to HEIC image types
    - Add new mime types
    - Add `text/mdx` with extension `.mdx`
  * perf: prevent internal `throw` on invalid type

1.6.16 / 2018-02-16
===================

  * deps: mime-types@~2.1.18
    - Add `application/raml+yaml` with extension `.raml`
    - Add `application/wasm` with extension `.wasm`
    - Add `text/shex` with extension `.shex`
    - Add extensions for JPEG-2000 images
    - Add extensions from IANA for `message/*` types
    - Add extension `.mjs` to `application/javascript`
    - Add extension `.wadl` to `application/vnd.sun.wadl+xml`
    - Add extension `.gz` to `application/gzip`
    - Add glTF types and extensions
    - Add new mime types
    - Update extensions `.md` and `.markdown` to be `text/markdown`
    - Update font MIME types
    - Update `text/hjson` to registered `application/hjson`

1.6.15 / 2017-03-31
===================

  * deps: mime-types@~2.1.15
    - Add new mime types

1.6.14 / 2016-11-18
===================

  * deps: mime-types@~2.1.13
    - Add new mime types

1.6.13 / 2016-05-18
===================

  * deps: mime-types@~2.1.11
    - Add new mime types

1.6.12 / 2016-02-28
===================

  * deps: mime-types@~2.1.10
    - Add new mime types
    - Fix extension of `application/dash+xml`
    - Update primary extension for `audio/mp4`

1.6.11 / 2016-01-29
===================

  * deps: mime-types@~2.1.9
    - Add new mime types

1.6.10 / 2015-12-01
===================

  * deps: mime-types@~2.1.8
    - Add new mime types

1.6.9 / 2015-09-27
==================

  * deps: mime-types@~2.1.7
    - Add new mime types

1.6.8 / 2015-09-04
==================

  * deps: mime-types@~2.1.6
    - Add new mime types

1.6.7 / 2015-08-20
==================

  * Fix type error when given invalid type to match against
  * deps: mime-types@~2.1.5
    - Add new mime types

1.6.6 / 2015-07-31
==================

  * deps: mime-types@~2.1.4
    - Add new mime types

1.6.5 / 2015-07-16
==================

  * deps: mime-types@~2.1.3
    - Add new mime types

1.6.4 / 2015-07-01
==================

  * deps: mime-types@~2.1.2
    - Add new mime types
  * perf: enable strict mode
  * perf: remove argument reassignment

1.6.3 / 2015-06-08
==================

  * deps: mime-types@~2.1.1
    - Add new mime types
  * perf: reduce try block size
  * perf: remove bitwise operations

1.6.2 / 2015-05-10
==================

  * deps: mime-types@~2.0.11
    - Add new mime types

1.6.1 / 2015-03-13
==================

  * deps: mime-types@~2.0.10
    - Add new mime types

1.6.0 / 2015-02-12
==================

  * fix false-positives in `hasBody` `Transfer-Encoding` check
  * support wildcard for both type and subtype (`*/*`)

1.5.7 / 2015-02-09
==================

  * fix argument reassignment
  * deps: mime-types@~2.0.9
    - Add new mime types

1.5.6 / 2015-01-29
==================

  * deps: mime-types@~2.0.8
    - Add new mime types

1.5.5 / 2014-12-30
==================

  * deps: mime-types@~2.0.7
    - Add new mime types
    - Fix missing extensions
    - Fix various invalid MIME type entries
    - Remove example template MIME types
    - deps: mime-db@~1.5.0

1.5.4 / 2014-12-10
==================

  * deps: mime-types@~2.0.4
    - Add new mime types
    - deps: mime-db@~1.3.0

1.5.3 / 2014-11-09
==================

  * deps: mime-types@~2.0.3
    - Add new mime types
    - deps: mime-db@~1.2.0

1.5.2 / 2014-09-28
==================

  * deps: mime-types@~2.0.2
    - Add new mime types
    - deps: mime-db@~1.1.0

1.5.1 / 2014-09-07
==================

  * Support Node.js 0.6
  * deps: media-typer@0.3.0
  * deps: mime-types@~2.0.1
    - Support Node.js 0.6

1.5.0 / 2014-09-05
==================

 * fix `hasbody` to be true for `content-length: 0`

1.4.0 / 2014-09-02
==================

 * update mime-types

1.3.2 / 2014-06-24
==================

 * use `~` range on mime-types

1.3.1 / 2014-06-19
==================

 * fix global variable leak

1.3.0 / 2014-06-19
==================

 * improve type parsing

   - invalid media type never matches
   - media type not case-sensitive
   - extra LWS does not affect results

1.2.2 / 2014-06-19
==================

 * fix behavior on unknown type argument

1.2.1 / 2014-06-03
==================

 * switch dependency from `mime` to `mime-types@1.0.0`

1.2.0 / 2014-05-11
==================

 * support suffix matching:

   - `+json` matches `application/vnd+json`
   - `*/vnd+json` matches `application/vnd+json`
   - `application/*+json` matches `application/vnd+json`

1.1.0 / 2014-04-12
==================

 * add non-array values support
 * expose internal utilities:

   - `.is()`
   - `.hasBody()`
   - `.normalize()`
   - `.match()`

1.0.1 / 2014-03-30
==================

 * add `multipart` as a shorthand


---

<!-- source: archive/library/javascript/references/packages/vary/HISTORY--000357.md -->

## Imported source: archive/library/javascript/references/packages/vary/HISTORY--000357.md

1.1.2 / 2017-09-23
==================

  * perf: improve header token parsing speed

1.1.1 / 2017-03-20
==================

  * perf: hoist regular expression

1.1.0 / 2015-09-29
==================

  * Only accept valid field names in the `field` argument
    - Ensures the resulting string is a valid HTTP header value

1.0.1 / 2015-07-08
==================

  * Fix setting empty header from empty `field`
  * perf: enable strict mode
  * perf: remove argument reassignments

1.0.0 / 2014-08-10
==================

  * Accept valid `Vary` header string as `field`
  * Add `vary.append` for low-level string manipulation
  * Move to `jshttp` orgainzation

0.1.0 / 2014-06-05
==================

  * Support array of fields to set

0.0.0 / 2014-06-04
==================

  * Initial release
