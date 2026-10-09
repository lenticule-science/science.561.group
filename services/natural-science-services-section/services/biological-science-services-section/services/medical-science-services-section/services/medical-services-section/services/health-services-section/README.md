# Health Services Section

Health is modeled here as a plural, related field rather than a synonym for
medical treatment. This carrier holds only health knowledge that actually
exists; it does not pre-create empty domain packages for possible future work.

Some fitness practices intentionally span several domains. Those belong in the
direct `fitness-services-section`, which is a cross-domain coordination layer,
not a fourth health domain. Martial arts, and Tai Chi within martial arts, are
modeled there.

## Current shared knowledge

- `fitness-services-section`
  - `martial-arts-services-section`
    - `tai-chi-services-section`
- `nutrition-services-section` — nutrition science, provenance, and portable
  exchange-contract boundaries; it is not a fitness domain.

The Tai Chi and nutrition practice computers consume this knowledge from
Personal Health Computer Systems Engineering. Personal records, diagnoses,
and treatment decisions do not belong in this shared-science carrier.
