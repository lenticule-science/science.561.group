---
title: Releases
description: "[222]: https://github.com/indexmap-rs/indexmap/pull/222"
aliases:
  - Release 0.2.19 (2024-05-03)
---
# Releases

## 2.12.1 (2025-11-20)

- Simplified a lot of internals using `hashbrown`'s new bucket API.

## 2.12.0 (2025-10-17)

- **MSRV**: Rust 1.82.0 or later is now required.
- Updated the `hashbrown` dependency to 0.16 alone.
- Error types now implement `core::error::Error`.
- Added `pop_if` methods to `IndexMap` and `IndexSet`, similar to the
  method for `Vec` added in Rust 1.86.

## 2.11.4 (2025-09-18)

- Updated the `hashbrown` dependency to a range allowing 0.15 or 0.16.

## 2.11.3 (2025-09-15)

- Make the minimum `serde` version only apply when "serde" is enabled.

## 2.11.2 (2025-09-15)

- Switched the "serde" feature to depend on `serde_core`, improving build
  parallelism in cases where other dependents have enabled "serde/derive".

## 2.11.1 (2025-09-08)

- Added a `get_key_value_mut` method to `IndexMap`.
- Removed the unnecessary `Ord` bound on `insert_sorted_by` methods.

## 2.11.0 (2025-08-22)

- Added `insert_sorted_by` and `insert_sorted_by_key` methods to `IndexMap`,
  `IndexSet`, and `VacantEntry`, like customizable versions of `insert_sorted`.
- Added `is_sorted`, `is_sorted_by`, and `is_sorted_by_key` methods to
  `IndexMap` and `IndexSet`, as well as their `Slice` counterparts.
- Added `sort_by_key` and `sort_unstable_by_key` methods to `IndexMap` and
  `IndexSet`, as well as parallel counterparts.
- Added `replace_index` methods to `IndexMap`, `IndexSet`, and `VacantEntry`
  to replace the key (or set value) at a given index.
- Added optional `sval` serialization support.

## 2.10.0 (2025-06-26)

- Added `extract_if` methods to `IndexMap` and `IndexSet`, similar to the
  methods for `HashMap` and `HashSet` with ranges like `Vec::extract_if`.
- Added more `#[track_caller]` annotations to functions that may panic.

## 2.9.0 (2025-04-04)

- Added a `get_disjoint_mut` method to `IndexMap`, matching Rust 1.86's
  `HashMap` method.
- Added a `get_disjoint_indices_mut` method to `IndexMap` and `map::Slice`,
  matching Rust 1.86's `get_disjoint_mut` method on slices.
- Deprecated the `borsh` feature in favor of their own `indexmap` feature,
  solving a cyclic dependency that occurred via `borsh-derive`.

## 2.8.0 (2025-03-10)

- Added `indexmap_with_default!` and `indexset_with_default!` to be used with
  alternative hashers, especially when using the crate without `std`.
- Implemented `PartialEq` between each `Slice` and `[]`/arrays.
- Removed the internal `rustc-rayon` feature and dependency.

## 2.7.1 (2025-01-19)

- Added `#[track_caller]` to functions that may panic.
- Improved memory reservation for `insert_entry`.

## 2.7.0 (2024-11-30)

- Added methods `Entry::insert_entry` and `VacantEntry::insert_entry`, returning
  an `OccupiedEntry` after insertion.

## 2.6.0 (2024-10-01)

- Implemented `Clone` for `map::IntoIter` and `set::IntoIter`.
- Updated the `hashbrown` dependency to version 0.15.

## 2.5.0 (2024-08-30)

- Added an `insert_before` method to `IndexMap` and `IndexSet`, as an
  alternative to `shift_insert` with different behavior on existing entries.
- Added `first_entry` and `last_entry` methods to `IndexMap`.
- Added `From` implementations between `IndexedEntry` and `OccupiedEntry`.

## 2.4.0 (2024-08-13)

- Added methods `IndexMap::append` and `IndexSet::append`, moving all items from
  one map or set into another, and leaving the original capacity for reuse.

## 2.3.0 (2024-07-31)

- Added trait `MutableEntryKey` for opt-in mutable access to map entry keys.
- Added method `MutableKeys::iter_mut2` for opt-in mutable iteration of map
  keys and values.

## 2.2.6 (2024-03-22)

- Added trait `MutableValues` for opt-in mutable access to set values.

## 2.2.5 (2024-02-29)

- Added optional `borsh` serialization support.

## 2.2.4 (2024-02-28)

- Added an `insert_sorted` method on `IndexMap`, `IndexSet`, and `VacantEntry`.
- Avoid hashing for lookups in single-entry maps.
- Limit preallocated memory in `serde` deserializers.

## 2.2.3 (2024-02-11)

- Added `move_index` and `swap_indices` methods to `IndexedEntry`,
  `OccupiedEntry`, and `RawOccupiedEntryMut`, functioning like the existing
  methods on `IndexMap`.
- Added `shift_insert` methods on `VacantEntry` and `RawVacantEntryMut`, as
  well as `shift_insert_hashed_nocheck` on the latter, to insert the new entry
  at a particular index.
- Added `shift_insert` methods on `IndexMap` and `IndexSet` to insert a new
  entry at a particular index, or else move an existing entry there.

## 2.2.2 (2024-01-31)

- Added indexing methods to raw entries: `RawEntryBuilder::from_hash_full`,
  `RawEntryBuilder::index_from_hash`, and `RawEntryMut::index`.

## 2.2.1 (2024-01-28)

- Corrected the signature of `RawOccupiedEntryMut::into_key(self) -> &'a mut K`,
  This a breaking change from 2.2.0, but that version was published for less
  than a day and has now been yanked.

## 2.2.0 (2024-01-28)

- The new `IndexMap::get_index_entry` method finds an entry by its index for
  in-place manipulation.

- The `Keys` iterator now implements `Index<usize>` for quick access to the
  entry's key, compared to indexing the map to get the value.

- The new `IndexMap::splice` and `IndexSet::splice` methods will drain the
  given range as an iterator, and then replace that range with entries from
  an input iterator.

- The new trait `RawEntryApiV1` offers opt-in access to a raw entry API for
  `IndexMap`, corresponding to the unstable API on `HashSet` as of Rust 1.75.

- Many `IndexMap` and `IndexSet` methods have relaxed their type constraints,
  e.g. removing `K: Hash` on methods that don't actually need to hash.

- Removal methods `remove`, `remove_entry`, and `take` are now deprecated
  in favor of their `shift_` or `swap_` prefixed variants, which are more
  explicit about their effect on the index and order of remaining items.
  The deprecated methods will remain to guide drop-in replacements from
  `HashMap` and `HashSet` toward the prefixed methods.

## 2.1.0 (2023-10-31)

- Empty slices can now be created with `map::Slice::{new, new_mut}` and
  `set::Slice::new`. In addition, `Slice::new`, `len`, and `is_empty` are
  now `const` functions on both types.

- `IndexMap`, `IndexSet`, and their respective `Slice`s all have binary
  search methods for sorted data: map `binary_search_keys` and set
  `binary_search` for plain comparison, `binary_search_by` for custom
  comparators, `binary_search_by_key` for key extraction, and
  `partition_point` for boolean conditions.

## 2.0.2 (2023-09-29)

- The `hashbrown` dependency has been updated to version 0.14.1 to
  complete the support for Rust 1.63.

## 2.0.1 (2023-09-27)

- **MSRV**: Rust 1.63.0 is now supported as well, pending publication of
  `hashbrown`'s relaxed MSRV (or use cargo `--ignore-rust-version`).

## 2.0.0 (2023-06-23)

- **MSRV**: Rust 1.64.0 or later is now required.

- The `"std"` feature is no longer auto-detected. It is included in the
  default feature set, or else can be enabled like any other Cargo feature.

- The `"serde-1"` feature has been removed, leaving just the optional
  `"serde"` dependency to be enabled like a feature itself.

- `IndexMap::get_index_mut` now returns `Option<(&K, &mut V)>`, changing
  the key part from `&mut K` to `&K`. There is also a new alternative
  `MutableKeys::get_index_mut2` to access the former behavior.

- The new `map::Slice<K, V>` and `set::Slice<T>` offer a linear view of maps
  and sets, behaving a lot like normal `[(K, V)]` and `[T]` slices. Notably,
  comparison traits like `Eq` only consider items in order, rather than hash
  lookups, and slices even implement `Hash`.

- `IndexMap` and `IndexSet` now have `sort_by_cached_key` and
  `par_sort_by_cached_key` methods which perform stable sorts in place
  using a key extraction function.

- `IndexMap` and `IndexSet` now have `reserve_exact`, `try_reserve`, and
  `try_reserve_exact` methods that correspond to the same methods on `Vec`.
  However, exactness only applies to the direct capacity for items, while the
  raw hash table still follows its own rules for capacity and load factor.

- The `Equivalent` trait is now re-exported from the `equivalent` crate,
  intended as a common base to allow types to work with multiple map types.

- The `hashbrown` dependency has been updated to version 0.14.

- The `serde_seq` module has been moved from the crate root to below the
  `map` module.

## 1.9.3 (2023-03-24)

- Bump the `rustc-rayon` dependency, for compiler use only.

## 1.9.2 (2022-11-17)

- `IndexMap` and `IndexSet` both implement `arbitrary::Arbitrary<'_>` and
  `quickcheck::Arbitrary` if those optional dependency features are enabled.

## 1.9.1 (2022-06-21)

- The MSRV now allows Rust 1.56.0 as well. However, currently `hashbrown`
  0.12.1 requires 1.56.1, so users on 1.56.0 should downgrade that to 0.12.0
  until there is a later published version relaxing its requirement.

## 1.9.0 (2022-06-16)

- **MSRV**: Rust 1.56.1 or later is now required.

- The `hashbrown` dependency has been updated to version 0.12.

- `IterMut` and `ValuesMut` now implement `Debug`.

- The new `IndexMap::shrink_to` and `IndexSet::shrink_to` methods shrink
  the capacity with a lower bound.

- The new `IndexMap::move_index` and `IndexSet::move_index` methods change
  the position of an item from one index to another, shifting the items
  between to accommodate the move.

## 1.8.2 (2022-05-27)

- Bump the `rustc-rayon` dependency, for compiler use only.

## 1.8.1 (2022-03-29)

- The new `IndexSet::replace_full` will return the index of the item along
  with the replaced value, if any, by @zakcutner in PR [222].

[222]: https://github.com/indexmap-rs/indexmap/pull/222

## 1.8.0 (2022-01-07)

- The new `IndexMap::into_keys` and `IndexMap::into_values` will consume
  the map into keys or values, respectively, matching Rust 1.54's `HashMap`
  methods, by @taiki-e in PR [195].

- More of the iterator types implement `Debug`, `ExactSizeIterator`, and
  `FusedIterator`, by @cuviper in PR [196].

- `IndexMap` and `IndexSet` now implement rayon's `ParallelDrainRange`,
  by @cuviper in PR [197].

- `IndexMap::with_hasher` and `IndexSet::with_hasher` are now `const`
  functions, allowing static maps and sets, by @mwillsey in PR [203].

- `IndexMap` and `IndexSet` now implement `From` for arrays, matching
  Rust 1.56's implementation for `HashMap`, by @rouge8 in PR [205].

- `IndexMap` and `IndexSet` now have methods `sort_unstable_keys`,
  `sort_unstable_by`, `sorted_unstable_by`, and `par_*` equivalents,
  which sort in-place without preserving the order of equal items, by
  @bhgomes in PR [211].

[195]: https://github.com/indexmap-rs/indexmap/pull/195
[196]: https://github.com/indexmap-rs/indexmap/pull/196
[197]: https://github.com/indexmap-rs/indexmap/pull/197
[203]: https://github.com/indexmap-rs/indexmap/pull/203
[205]: https://github.com/indexmap-rs/indexmap/pull/205
[211]: https://github.com/indexmap-rs/indexmap/pull/211

## 1.7.0 (2021-06-29)

- **MSRV**: Rust 1.49 or later is now required.

- The `hashbrown` dependency has been updated to version 0.11.

## 1.6.2 (2021-03-05)

- Fixed to match `std` behavior, `OccupiedEntry::key` now references the
  existing key in the map instead of the lookup key, by @cuviper in PR [170].

- The new `Entry::or_insert_with_key` matches Rust 1.50's `Entry` method,
  passing `&K` to the callback to create a value, by @cuviper in PR [175].

[170]: https://github.com/indexmap-rs/indexmap/pull/170
[175]: https://github.com/indexmap-rs/indexmap/pull/175

## 1.6.1 (2020-12-14)

- The new `serde_seq` module implements `IndexMap` serialization as a
  sequence to ensure order is preserved, by @cuviper in PR [158].

- New methods on maps and sets work like the `Vec`/slice methods by the same name:
  `truncate`, `split_off`, `first`, `first_mut`, `last`, `last_mut`, and
  `swap_indices`, by @cuviper in PR [160].

[158]: https://github.com/indexmap-rs/indexmap/pull/158
[160]: https://github.com/indexmap-rs/indexmap/pull/160

## 1.6.0 (2020-09-05)

- **MSRV**: Rust 1.36 or later is now required.

- The `hashbrown` dependency has been updated to version 0.9.

## 1.5.2 (2020-09-01)

- The new "std" feature will force the use of `std` for users that explicitly
  want the default `S = RandomState`, bypassing the autodetection added in 1.3.0,
  by @cuviper in PR [145].

[145]: https://github.com/indexmap-rs/indexmap/pull/145

## 1.5.1 (2020-08-07)

- Values can now be indexed by their `usize` position by @cuviper in PR [132].

- Some of the generic bounds have been relaxed to match `std` by @cuviper in PR [141].

- `drain` now accepts any `R: RangeBounds<usize>` by @cuviper in PR [142].

[132]: https://github.com/indexmap-rs/indexmap/pull/132
[141]: https://github.com/indexmap-rs/indexmap/pull/141
[142]: https://github.com/indexmap-rs/indexmap/pull/142

## 1.5.0 (2020-07-17)

- **MSRV**: Rust 1.32 or later is now required.

- The inner hash table is now based on `hashbrown` by @cuviper in PR [131].
  This also completes the method `reserve` and adds `shrink_to_fit`.

- Add new methods `get_key_value`, `remove_entry`, `swap_remove_entry`,
  and `shift_remove_entry`, by @cuviper in PR [136]

- `Clone::clone_from` reuses allocations by @cuviper in PR [125]

- Add new method `reverse` by @linclelinkpart5 in PR [128]

[125]: https://github.com/indexmap-rs/indexmap/pull/125
[128]: https://github.com/indexmap-rs/indexmap/pull/128
[131]: https://github.com/indexmap-rs/indexmap/pull/131
[136]: https://github.com/indexmap-rs/indexmap/pull/136

## 1.4.0 (2020-06-01)

- Add new method `get_index_of` by @Thermatrix in PR [115] and [120]

- Fix build script rebuild-if-changed configuration to use "build.rs";
  fixes issue [123]. Fix by @cuviper.

- Dev-dependencies (rand and quickcheck) have been updated. The crate's tests
  now run using Rust 1.32 or later (MSRV for building the crate has not changed).
  by @kjeremy and @bluss

[123]: https://github.com/indexmap-rs/indexmap/issues/123
[115]: https://github.com/indexmap-rs/indexmap/pull/115
[120]: https://github.com/indexmap-rs/indexmap/pull/120

## 1.3.2 (2020-02-05)

- Maintenance update to regenerate the published `Cargo.toml`.

## 1.3.1 (2020-01-15)

- Maintenance update for formatting and `autocfg` 1.0.

## 1.3.0 (2019-10-18)

- The deprecation messages in the previous version have been removed.
  (The methods have not otherwise changed.) Docs for removal methods have been
  improved.
- From Rust 1.36, this crate supports being built **without std**, requiring
  `alloc` instead. This is enabled automatically when it is detected that
  `std` is not available. There is no crate feature to enable/disable to
  trigger this. The new build-dep `autocfg` enables this.

## 1.2.0 (2019-09-08)

- Plain `.remove()` now has a deprecation message, it informs the user
  about picking one of the removal functions `swap_remove` and `shift_remove`
  which have different performance and order semantics.
  Plain `.remove()` will not be removed, the warning message and method
  will remain until further.

- Add new method `shift_remove` for order preserving removal on the map,
  and `shift_take` for the corresponding operation on the set.

- Add methods `swap_remove`, `swap_remove_entry` to `Entry`.

- Fix indexset/indexmap to support full paths, like `indexmap::indexmap!()`

- Internal improvements: fix warnings, deprecations and style lints

## 1.1.0 (2019-08-20)

- Added optional feature `"rayon"` that adds parallel iterator support
  to `IndexMap` and `IndexSet` using Rayon. This includes all the regular
  iterators in parallel versions, and parallel sort.

- Implemented `Clone` for `map::{Iter, Keys, Values}` and
  `set::{Difference, Intersection, Iter, SymmetricDifference, Union}`

- Implemented `Debug` for `map::{Entry, IntoIter, Iter, Keys, Values}` and
  `set::{Difference, Intersection, IntoIter, Iter, SymmetricDifference, Union}`

- Serde trait `IntoDeserializer` are implemented for `IndexMap` and `IndexSet`.

- Minimum Rust version requirement increased to Rust 1.30 for development builds.

## 1.0.2 (2018-10-22)

- The new methods `IndexMap::insert_full` and `IndexSet::insert_full` are
  both like `insert` with the index included in the return value.

- The new method `Entry::and_modify` can be used to modify occupied
  entries, matching the new methods of `std` maps in Rust 1.26.

- The new method `Entry::or_default` inserts a default value in unoccupied
  entries, matching the new methods of `std` maps in Rust 1.28.

## 1.0.1 (2018-03-24)

- Document Rust version policy for the crate (see rustdoc)

## 1.0.0 (2018-03-11)

- This is the 1.0 release for `indexmap`! (the crate and datastructure
  formerly known as “ordermap”)
- `OccupiedEntry::insert` changed its signature, to use `&mut self` for
  the method receiver, matching the equivalent method for a standard
  `HashMap`.  Thanks to @dtolnay for finding this bug.
- The deprecated old names from ordermap were removed: `OrderMap`,
  `OrderSet`, `ordermap!{}`, `orderset!{}`. Use the new `IndexMap`
  etc names instead.

## 0.4.1 (2018-02-14)

- Renamed crate to `indexmap`; the `ordermap` crate is now deprecated
  and the types `OrderMap/Set` now have a deprecation notice.

## 0.4.0 (2018-02-02)

- This is the last release series for this `ordermap` under that name,
  because the crate is **going to be renamed** to `indexmap` (with types
  `IndexMap`, `IndexSet`) and no change in functionality!
- The map and its associated structs moved into the `map` submodule of the
  crate, so that the map and set are symmetric

    + The iterators, `Entry` and other structs are now under `ordermap::map::`

- Internally refactored `OrderMap<K, V, S>` so that all the main algorithms
  (insertion, lookup, removal etc) that don't use the `S` parameter (the
  hasher) are compiled without depending on `S`, which reduces generics bloat.

- `Entry<K, V>` no longer has a type parameter `S`, which is just like
  the standard `HashMap`'s entry.

- Minimum Rust version requirement increased to Rust 1.18

## 0.3.5 (2018-01-14)

- Documentation improvements

## 0.3.4 (2018-01-04)

- The `.retain()` methods for `OrderMap` and `OrderSet` now
  traverse the elements in order, and the retained elements **keep their order**
- Added new methods `.sort_by()`, `.sort_keys()` to `OrderMap` and
  `.sort_by()`, `.sort()` to `OrderSet`. These methods allow you to
  sort the maps in place efficiently.

## 0.3.3 (2017-12-28)

- Document insertion behaviour better by @lucab
- Updated dependences (no feature changes) by @ignatenkobrain

## 0.3.2 (2017-11-25)

- Add `OrderSet` by @cuviper!
- `OrderMap::drain` is now (too) a double ended iterator.

## 0.3.1 (2017-11-19)

- In all ordermap iterators, forward the `collect` method to the underlying
  iterator as well.
- Add crates.io categories.

## 0.3.0 (2017-10-07)

- The methods `get_pair`, `get_pair_index` were both replaced by
  `get_full` (and the same for the mutable case).
- Method `swap_remove_pair` replaced by `swap_remove_full`.
- Add trait `MutableKeys` for opt-in mutable key access. Mutable key access
  is only possible through the methods of this extension trait.
- Add new trait `Equivalent` for key equivalence. This extends the
  `Borrow` trait mechanism for `OrderMap::get` in a backwards compatible
  way, just some minor type inference related issues may become apparent.
  See [#10] for more information.
- Implement `Extend<(&K, &V)>` by @xfix.

[#10]: https://github.com/indexmap-rs/indexmap/pull/10

## 0.2.13 (2017-09-30)

- Fix deserialization to support custom hashers by @Techcable.
- Add methods `.index()` on the entry types by @garro95.

## 0.2.12 (2017-09-11)

- Add methods `.with_hasher()`, `.hasher()`.

## 0.2.11 (2017-08-29)

- Support `ExactSizeIterator` for the iterators. By @Binero.
- Use `Box<[Pos]>` internally, saving a word in the `OrderMap` struct.
- Serde support, with crate feature `"serde-1"`. By @xfix.

## 0.2.10 (2017-04-29)

- Add iterator `.drain(..)` by @stevej.

## 0.2.9 (2017-03-26)

- Add method `.is_empty()` by @overvenus.
- Implement `PartialEq, Eq` by @overvenus.
- Add method `.sorted_by()`.

## 0.2.8 (2017-03-01)

- Add iterators `.values()` and `.values_mut()`.
- Fix compatibility with 32-bit platforms.

## 0.2.7 (2016-11-02)

- Add `.retain()`.

## 0.2.6 (2016-11-02)

- Add `OccupiedEntry::remove_entry` and other minor entry methods,
  so that it now has all the features of `HashMap`'s entries.

## 0.2.5 (2016-10-31)

- Improved `.pop()` slightly.

## 0.2.4 (2016-10-22)

- Improved performance of `.insert()` ([#3]) by @pczarn.

[#3]: https://github.com/indexmap-rs/indexmap/pull/3

## 0.2.3 (2016-10-11)

- Generalize `Entry` for now, so that it works on hashmaps with non-default
  hasher. However, there's a lingering compat issue since libstd `HashMap`
  does not parameterize its entries by the hasher (`S` typarm).
- Special case some iterator methods like `.nth()`.

## 0.2.2 (2016-10-02)

- Disable the verbose `Debug` impl by default.

## 0.2.1 (2016-10-02)

- Fix doc links and clarify docs.

## 0.2.0 (2016-10-01)

- Add more `HashMap` methods & compat with its API.
- Experimental support for `.entry()` (the simplest parts of the API).
- Add `.reserve()` (placeholder impl).
- Add `.remove()` as synonym for `.swap_remove()`.
- Changed `.insert()` to swap value if the entry already exists, and
  return `Option`.
- Experimental support as an *indexed* hash map! Added methods
  `.get_index()`, `.get_index_mut()`, `.swap_remove_index()`,
  `.get_pair_index()`, `.get_pair_index_mut()`.

## 0.1.2 (2016-09-19)

- Implement the 32/32 split idea for `Pos` which improves cache utilization
  and lookup performance.

## 0.1.1 (2016-09-16)

- Initial release.


---

<!-- source: archive/library/rust/references/crates/ipnet/releases/RELEASES--001068.md -->

## Imported source: archive/library/rust/references/crates/ipnet/releases/RELEASES--001068.md

# Releases

## Version 2.10.1

* ipnet-2.10.0 Rust crate has executable permission on source files. #59

## Version 2.10.0

* Add new_assert implementations #57 
* Remove redundant curly braces so that the example program can compile #53 

## Version 2.9.0

*  Add ser_as_str feature to serialize using serialize_str() #52 

## Version 2.8.0

* Add no_std support on nightly #51 

## Version 2.7.2

* Inline constructors and field getters #48 
* Use Serializer::collect_str to serialize output of Display #39 

## Version 2.7.1

* Fix overflow in mask to prefix conversion #47

## Version 2.7.0

* Allow to invoke some functions as const fn #43 

## Version 2.6.0

* Add IP netmask to prefix conversion functions and new `with_netmask()` constructors.

## Version 2.5.0

* Manually implement JsonSchema for IpNet, Ipv4Net, Ipv6Net #41 because default derived JsonSchema does not correspond to Serde representation #40
* Migrate to edition 2018

## Version 2.4.0

* Add 'schemars' feature for deriving JSON schema #31 
* add convenience IpNet::new method #36 

## Version 2.3.1 (2020-06-15)

* Merge Fix Error::description() deprecation warning #28.

## Version 2.3.0 (2020-03-15)

* Merge @imp's `Default` implementation. See #18. `Ipv4Net` and `Ipv6Net` now default to 0.0.0.0/0 and ::/0 respectively. `IpNet` defaults to the 0/0 `Ipv4Net`.

* Add `#[allow(arithmetic_overflow)]` for `Ipv4AddrRange::count()` and `Ipv6AddrRange::count()`. Since 1.43.0-nightly it gives a build error but this panic behavior is desired. In future it may be replaced with explicit use of `panic!`. See #21.

## Version 2.2.0 (2020-02-02)

* Implement `From<IpAddr>`, `From<Ipv4Addr>`, and `From<Ipv6Addr>` for `IpNet`, `Ipv4Net`, and `Ipv6Net` respectively.

## Version 2.1.0 (2019-11-08)

* Implement `FusedIterator` for `IpAddrRange`, `Ipv4AddrRange`, `Ipv6AddrRange`, `IpSubnets`, `Ipv4Subnets`, and `Ipv6Subnets`.

* Implement `DoubleEndedIterator` for `IpAddrRange`, `Ipv4AddrRange`, `Ipv6AddrRange`.

* Implement custom `count()`, `last()`, `max()`, `min()`, `nth()`, and `size_hint()` for `IpAddrRange`, `Ipv4AddrRange`, `Ipv6AddrRange`.

## Version 2.0.1 (2019-10-12)

* Fix bug where IpAddrRange never ends when start and end are both 0 #11

* Fix warning about missing 'dyn'

## Version 2.0.0 (2018-08-21)

* The `Emu128` module has been removed. This provided an emulated 128-bit integer for supporting IPv6 addresses. As of Rust 1.26 the built-in 128-bit integers have been marked stable and this library has been updated to use these instead of `Emu128`.

* The `with-serde` feature name shim has been removed. The `serde` feature should now be used using the bare `serde` feature name per the Rust API Guidelines.

* The `Deref` on `Ipv4Net` and `Ipv6Net` has been removed. This dereferenced to the `Ipv4Addr` and `Ipv6Addr` contained in the type. To use these methods call them directly on the contained IP address of interest, which may be accessed using the `addr()` or `network()` methods.

* In prior versions it was necessary to use the `Contains` trait to access the `contains()` methods. These are now inherited in public methods on the `IpNet`, `Ipv4Net`, and `Ipv6Net` types so are always available.

* The implementations of `IpAdd<u32>` and `IpSub<u32>` for IpAddr have been removed.

* The implementations of `IpAdd<u32>` and `IpSub<u32>` for `Ipv6Addr` have been removed.

## Version 1.2.1 (2018-06-06)

* Fix to resolve an issue with the optional serde support, where compact binary formats were not properly supported. See issue #10.

## Version 1.2.0 (2018-04-17)

* The previous release (1.1.0) introduced serde support using the feature name `with-serde`, but the Rust API Guidelines recommend using `serde` as the name of the feature. This release changes the feature name from `with-serde` to `serde`, but it is backwards compatible for those that already started using the `with-serde` feature name. The 1.1.0 release was yanked on crates.io to discourage further use of this feature name. See pull request #7.

## Version 1.1.0 (2018-04-13)

* Adds serde support. See pull request #6.


---

<!-- source: archive/library/rust/references/crates/num-traits/releases/RELEASES--000979.md -->

## Imported source: archive/library/rust/references/crates/num-traits/releases/RELEASES--000979.md

# Release 0.2.19 (2024-05-03)

- [Upgrade to 2021 edition, **MSRV 1.60**][310]
- [The new `Float::clamp` limits values by minimum and maximum][305]

**Contributors**: @cuviper, @michaelciraci

[305]: https://github.com/rust-num/num-traits/pull/305
[310]: https://github.com/rust-num/num-traits/pull/310

# Release 0.2.18 (2024-02-07)

- [The new `Euclid::div_rem_euclid` and `CheckedEuclid::checked_div_rem_euclid` methods][291]
  compute and return the quotient and remainder at the same time.
- [The new `TotalOrder` trait implements the IEEE 754 `totalOrder` predicate.][295]
- [The new `ConstZero` and `ConstOne` traits offered associated constants][303],
  extending the non-const `Zero` and `One` traits for types that have constant values.

**Contributors**: @andrewjradcliffe, @cuviper, @tarcieri, @tdelabro, @waywardmonkeys

[291]: https://github.com/rust-num/num-traits/pull/291
[295]: https://github.com/rust-num/num-traits/pull/295
[303]: https://github.com/rust-num/num-traits/pull/303

# Release 0.2.17 (2023-10-07)

- [Fix a doc warning about custom classes with newer rustdoc.][286]

**Contributors**: @robamu

[286]: https://github.com/rust-num/num-traits/pull/286

# Release 0.2.16 (2023-07-20)

- [Upgrade to 2018 edition, **MSRV 1.31**][240]
- [The new `ToBytes` and `FromBytes` traits][224] convert to and from byte
  representations of a value, with little, big, and native-endian options.
- [The new `Float::is_subnormal` method checks for subnormal values][279], with
  a non-zero magnitude that is less than the normal minimum positive value.
- Several other improvements to documentation and testing.

**Contributors**: @ctrlcctrlv, @cuviper, @flier, @GuillaumeGomez, @kaidokert,
@rs017991, @vicsn

[224]: https://github.com/rust-num/num-traits/pull/224
[240]: https://github.com/rust-num/num-traits/pull/240
[279]: https://github.com/rust-num/num-traits/pull/279

# Release 0.2.15 (2022-05-02)

- [The new `Euclid` trait calculates Euclidean division][195], where the
  remainder is always positive or zero.
- [The new `LowerBounded` and `UpperBounded` traits][210] separately describe
  types with lower and upper bounds. These traits are automatically implemented
  for all fully-`Bounded` types.
- [The new `Float::copysign` method copies the sign of the argument][207] to
  to the magnitude of `self`.
- [The new `PrimInt::leading_ones` and `trailing_ones` methods][205] are the
  complement of the existing methods that count zero bits.
- [The new `PrimInt::reverse_bits` method reverses the order of all bits][202]
  of a primitive integer.
- [Improved `Num::from_str_radix` for floats][201], also [ignoring case][214].
- [`Float` and `FloatCore` use more from `libm`][196] when that is enabled.

**Contributors**: @alion02, @clarfonthey, @cuviper, @ElectronicRU,
@ibraheemdev, @SparrowLii, @sshilovsky, @tspiteri, @XAMPPRocky, @Xiretza

[195]: https://github.com/rust-num/num-traits/pull/195
[196]: https://github.com/rust-num/num-traits/pull/196
[201]: https://github.com/rust-num/num-traits/pull/201
[202]: https://github.com/rust-num/num-traits/pull/202
[205]: https://github.com/rust-num/num-traits/pull/205
[207]: https://github.com/rust-num/num-traits/pull/207
[210]: https://github.com/rust-num/num-traits/pull/210
[214]: https://github.com/rust-num/num-traits/pull/214

# Release 0.2.14 (2020-10-29)

- Clarify the license specification as "MIT OR Apache-2.0".

**Contributors**: @cuviper

# Release 0.2.13 (2020-10-29)

- [The new `OverflowingAdd`, `OverflowingSub`, and `OverflowingMul` traits][180]
  return a tuple with the operation result and a `bool` indicating overflow.
- [The "i128" feature now overrides compiler probes for that support][185].
  This may fix scenarios where `autocfg` probing doesn't work properly.
- [Casts from large `f64` values to `f32` now saturate to infinity][186]. They
  previously returned `None` because that was once thought to be undefined
  behavior, but [rust#15536] resolved that such casts are fine.
- [`Num::from_str_radix` documents requirements for radix support][192], which
  are now more relaxed than previously implied. It is suggested to accept at
  least `2..=36` without panicking, but `Err` may be returned otherwise.

**Contributors**: @cuviper, @Enet4, @KaczuH, @martin-t, @newpavlov

[180]: https://github.com/rust-num/num-traits/pull/180
[185]: https://github.com/rust-num/num-traits/pull/185
[186]: https://github.com/rust-num/num-traits/pull/186
[192]: https://github.com/rust-num/num-traits/issues/192
[rust#15536]: https://github.com/rust-lang/rust/issues/15536

# Release 0.2.12 (2020-06-11)

- [The new `WrappingNeg` trait][153] will wrap the result if it exceeds the
  boundary of the type, e.g. `i32::MIN.wrapping_neg() == i32::MIN`.
- [The new `SaturatingAdd`, `SaturatingSub`, and `SaturatingMul` traits][165]
  will saturate at the numeric bounds if the operation would overflow. These
  soft-deprecate the existing `Saturating` trait that only has addition and
  subtraction methods.
- [Added new constants for logarithms, `FloatConst::{LOG10_2, LOG2_10}`][171].

**Contributors**: @cuviper, @ocstl, @trepetti, @vallentin

[153]: https://github.com/rust-num/num-traits/pull/153
[165]: https://github.com/rust-num/num-traits/pull/165
[171]: https://github.com/rust-num/num-traits/pull/171

# Release 0.2.11 (2020-01-09)

- [Added the full circle constant τ as `FloatConst::TAU`][145].
- [Updated the `autocfg` build dependency to 1.0][148].

**Contributors**: @cuviper, @m-ou-se

[145]: https://github.com/rust-num/num-traits/pull/145
[148]: https://github.com/rust-num/num-traits/pull/148

# Release 0.2.10 (2019-11-22)

- [Updated the `libm` dependency to 0.2][144].

**Contributors**: @CryZe

[144]: https://github.com/rust-num/num-traits/pull/144

# Release 0.2.9 (2019-11-12)

- [A new optional `libm` dependency][99] enables the `Float` and `Real` traits
  in `no_std` builds.
- [The new `clamp_min` and `clamp_max`][122] limit minimum and maximum values
  while preserving input `NAN`s.
- [Fixed a panic in floating point `from_str_radix` on invalid signs][126].
- Miscellaneous documentation updates.

**Contributors**: @cuviper, @dingelish, @HeroicKatora, @jturner314, @ocstl,
@Shnatsel, @termoshtt, @waywardmonkeys, @yoanlcq

[99]: https://github.com/rust-num/num-traits/pull/99
[122]: https://github.com/rust-num/num-traits/pull/122
[126]: https://github.com/rust-num/num-traits/pull/126

# Release 0.2.8 (2019-05-21)

- [Fixed feature detection on `no_std` targets][116].

**Contributors**: @cuviper

[116]: https://github.com/rust-num/num-traits/pull/116

# Release 0.2.7 (2019-05-20)

- [Documented when `CheckedShl` and `CheckedShr` return `None`][90].
- [The new `Zero::set_zero` and `One::set_one`][104] will set values to their
  identities in place, possibly optimized better than direct assignment.
- [Documented general features and intentions of `PrimInt`][108].

**Contributors**: @cuviper, @dvdhrm, @ignatenkobrain, @lcnr, @samueltardieu

[90]: https://github.com/rust-num/num-traits/pull/90
[104]: https://github.com/rust-num/num-traits/pull/104
[108]: https://github.com/rust-num/num-traits/pull/108

# Release 0.2.6 (2018-09-13)

- [Documented that `pow(0, 0)` returns `1`][79].  Mathematically, this is not
  strictly defined, but the current behavior is a pragmatic choice that has
  precedent in Rust `core` for the primitives and in many other languages.
- [The new `WrappingShl` and `WrappingShr` traits][81] will wrap the shift count
  if it exceeds the bit size of the type.

**Contributors**: @cuviper, @edmccard, @meltinglava

[79]: https://github.com/rust-num/num-traits/pull/79
[81]: https://github.com/rust-num/num-traits/pull/81

# Release 0.2.5 (2018-06-20)

- [Documentation for `mul_add` now clarifies that it's not always faster.][70]
- [The default methods in `FromPrimitive` and `ToPrimitive` are more robust.][73]

**Contributors**: @cuviper, @frewsxcv

[70]: https://github.com/rust-num/num-traits/pull/70
[73]: https://github.com/rust-num/num-traits/pull/73

# Release 0.2.4 (2018-05-11)

- [Support for 128-bit integers is now automatically detected and enabled.][69]
  Setting the `i128` crate feature now causes the build script to panic if such
  support is not detected.

**Contributors**: @cuviper

[69]: https://github.com/rust-num/num-traits/pull/69

# Release 0.2.3 (2018-05-10)

- [The new `CheckedNeg` and `CheckedRem` traits][63] perform checked `Neg` and
  `Rem`, returning `Some(output)` or `None` on overflow.
- [The `no_std` implementation of `FloatCore::to_degrees` for `f32`][61] now
  uses a constant for greater accuracy, mirroring [rust#47919].  (With `std` it
  just calls the inherent `f32::to_degrees` in the standard library.)
- [The new `MulAdd` and `MulAddAssign` traits][59] perform a fused multiply-
  add.  For integer types this is just a convenience, but for floating point
  types this produces a more accurate result than the separate operations.
- [All applicable traits are now implemented for 128-bit integers][60] starting
  with Rust 1.26, enabled by the new `i128` crate feature.  The `FromPrimitive`
  and `ToPrimitive` traits now also have corresponding 128-bit methods, which
  default to converting via 64-bit integers for compatibility.

**Contributors**: @cuviper, @LEXUGE, @regexident, @vks

[59]: https://github.com/rust-num/num-traits/pull/59
[60]: https://github.com/rust-num/num-traits/pull/60
[61]: https://github.com/rust-num/num-traits/pull/61
[63]: https://github.com/rust-num/num-traits/pull/63
[rust#47919]: https://github.com/rust-lang/rust/pull/47919

# Release 0.2.2 (2018-03-18)

- [Casting from floating point to integers now returns `None` on overflow][52],
  avoiding [rustc's undefined behavior][rust-10184]. This applies to the `cast`
  function and the traits `NumCast`, `FromPrimitive`, and `ToPrimitive`.

**Contributors**: @apopiak, @cuviper, @dbarella

[52]: https://github.com/rust-num/num-traits/pull/52
[rust-10184]: https://github.com/rust-lang/rust/issues/10184


# Release 0.2.1 (2018-03-01)

- [The new `FloatCore` trait][32] offers a subset of `Float` for `#![no_std]` use.
  [This includes everything][41] except the transcendental functions and FMA.
- [The new `Inv` trait][37] returns the multiplicative inverse, or reciprocal.
- [The new `Pow` trait][37] performs exponentiation, much like the existing `pow`
  function, but with generic exponent types.
- [The new `One::is_one` method][39] tests if a value equals 1.  Implementers
  should override this method if there's a more efficient way to check for 1,
  rather than comparing with a temporary `one()`.

**Contributors**: @clarcharr, @cuviper, @vks

[32]: https://github.com/rust-num/num-traits/pull/32
[37]: https://github.com/rust-num/num-traits/pull/37
[39]: https://github.com/rust-num/num-traits/pull/39
[41]: https://github.com/rust-num/num-traits/pull/41


# Release 0.2.0 (2018-02-06)

- **breaking change**: [There is now a `std` feature][30], enabled by default, along
  with the implication that building *without* this feature makes this a
  `#![no_std]` crate.
  - The `Float` and `Real` traits are only available when `std` is enabled.
  - Otherwise, the API is unchanged, and num-traits 0.1.43 now re-exports its
    items from num-traits 0.2 for compatibility (the [semver-trick]).

**Contributors**: @cuviper, @termoshtt, @vks

[semver-trick]: https://github.com/dtolnay/semver-trick
[30]: https://github.com/rust-num/num-traits/pull/30


# Release 0.1.43 (2018-02-06)

- All items are now [re-exported from num-traits 0.2][31] for compatibility.

[31]: https://github.com/rust-num/num-traits/pull/31


# Release 0.1.42 (2018-01-22)

- [num-traits now has its own source repository][num-356] at [rust-num/num-traits][home].
- [`ParseFloatError` now implements `Display`][22].
- [The new `AsPrimitive` trait][17] implements generic casting with the `as` operator.
- [The new `CheckedShl` and `CheckedShr` traits][21] implement generic
  support for the `checked_shl` and `checked_shr` methods on primitive integers.
- [The new `Real` trait][23] offers a subset of `Float` functionality that may be applicable to more
  types, with a blanket implementation for all existing `T: Float` types.

Thanks to @cuviper, @Enet4, @fabianschuiki, @svartalf, and @yoanlcq for their contributions!

[home]: https://github.com/rust-num/num-traits
[num-356]: https://github.com/rust-num/num/pull/356
[17]: https://github.com/rust-num/num-traits/pull/17
[21]: https://github.com/rust-num/num-traits/pull/21
[22]: https://github.com/rust-num/num-traits/pull/22
[23]: https://github.com/rust-num/num-traits/pull/23


# Prior releases

No prior release notes were kept.  Thanks all the same to the many
contributors that have made this crate what it is!
