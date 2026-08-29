# Health Services Section

Health is modeled here as a plural, related field rather than a synonym for
medical treatment. Its three named domains are physical, mental, and spiritual
health. Each domain owns its corresponding fitness: its cultivated capacity to
act, adapt, recover, and remain well within that domain.

Some fitness practices intentionally span several domains. Those belong in the
direct `fitness-services-section`, which is a cross-domain coordination layer,
not a fourth health domain. Martial arts, and Tai Chi within martial arts, are
modeled there.

## Domain services

- `physical-health-services-section`
  - `physical-fitness-services-section`
- `mental-health-services-section`
  - `mental-fitness-services-section`
- `spiritual-health-services-section`
  - `spiritual-fitness-services-section`

## Cross-domain services

- `fitness-services-section`
  - `martial-arts-services-section`
    - `tai-chi-services-section`

## Related health services

- `nutrition-services-section` — shared nutrition science, provenance, and
  portable exchange contracts; it is not a fitness domain.
