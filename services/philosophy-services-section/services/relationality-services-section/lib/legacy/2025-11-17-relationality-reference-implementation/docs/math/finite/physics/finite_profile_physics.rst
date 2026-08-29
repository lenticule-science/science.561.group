Finite profile physics
======================

.. meta::
   :xref-spec: math/infinite/physics/profile_physical_system, math/infinite/physics/filter_induced_reconstruction, math/infinite/physics/composite_and_nested_profiles, math/finite/library/profiles/geometry/finite_profiles_and_filters
   :xref-code: code/core/physics/profile_system, code/core/physics/profile_physical_system_from_filter, code/core/physics/nested_profile_physical_system_from_filter, code/library/profiles/finite_profile_from_filter, code/library/profiles/finite_profile_from_discipline
   :xref-tests: tests/core/physics/test_profile_physical_system_from_filter_and_nested

Statement
---------

Finite profile-level physical systems instantiate the ***Profile
Physics*** (*ProfilePhysicalSystem*) constructions on explicit finite
carriers. Given a finite RelationalPhysicalSystem and suitable
Filters, the helpers in ``relationing.core.physics`` and
``relationing.library.profiles.geometry.profiles`` build finite
ProfilePhysicalSystem instances whose structure, flow, nuclei, and
observables satisfy the profile geometry and profile physics
soundness results on finite fixed-point profiles.

The tests listed above exercise these finite systems, checking that
evolution and observables respect the required invariants on nested
and composite finite profiles.
