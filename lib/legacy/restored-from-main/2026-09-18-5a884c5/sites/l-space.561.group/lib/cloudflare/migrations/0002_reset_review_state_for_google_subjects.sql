-- Review rows were keyed by a SHA-256 pseudonym of the Cloudflare Access
-- identity. Google OIDC supplies a different subject, so every existing row
-- belongs to a subject key that can no longer be derived from anyone signing in.
-- The rows are removed rather than left to accumulate as unreachable state.
-- The table shape is unchanged: only the meaning of subject_hash has changed,
-- from SHA-256(Access identity) to SHA-256(Google sub).
DELETE FROM vaultmaze_reviews;
