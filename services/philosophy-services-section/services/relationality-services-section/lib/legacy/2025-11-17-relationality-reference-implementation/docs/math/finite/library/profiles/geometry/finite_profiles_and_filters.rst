Finite profiles and filters
===========================

.. meta::
   :xref-spec: math/infinite/geometry/regimes_and_profiles, math/infinite/physics/profile_geometry
   :xref-code: code/library/profiles/finite_profile, code/library/profiles/finite_profile_from_filter, code/library/profiles/finite_profile_from_discipline, code/library/profiles/composite_profile_from_filters, code/library/profiles/nested_profile_from_filters
   :xref-tests: tests/core/geometry/test_profiles_from_filters_and_disciplines, tests/core/geometry/test_profile_composites_and_compatibility, tests/core/physics/test_profile_physical_system_from_filter_and_nested

Statement
---------

Finite profiles and their filters provide concrete finite witnesses of
the profile constructions in the infinite Geometry and Physics notes:

- given a finite *Relational Geometry* and a Filter or Discipline, the
  set of Filter-stable recognitions forms a finite profile;
- composite and nested filters induce composite and nested finite
  profiles; and
- these finite profiles support the restricted nuclei and flows used
  to build finite ProfileGeometry and ProfilePhysics examples.

The helpers in ``relationing.library.profiles.geometry`` construct and
manipulate these finite profiles, and the tests listed above exercise
their behaviour on explicit finite carriers.

