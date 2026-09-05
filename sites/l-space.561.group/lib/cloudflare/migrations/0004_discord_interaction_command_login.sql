-- A challenge contains no Discord identity.  The signed interaction supplies an
-- identity only long enough to derive its provider-qualified pseudonym.
CREATE TABLE IF NOT EXISTS discord_command_login_challenges (
  challenge_hash TEXT PRIMARY KEY,
  verifier_hash TEXT NOT NULL,
  expires_at INTEGER NOT NULL,
  approved_at INTEGER,
  consumed_at INTEGER,
  subject_hash TEXT,
  discord_user_ciphertext TEXT,
  created_at INTEGER NOT NULL
);

CREATE INDEX IF NOT EXISTS discord_command_login_challenges_expiry
  ON discord_command_login_challenges(expires_at);

CREATE TABLE IF NOT EXISTS discord_interaction_sessions (
  session_hash TEXT PRIMARY KEY,
  subject_hash TEXT NOT NULL,
  discord_user_ciphertext TEXT NOT NULL,
  session_expires_at INTEGER NOT NULL,
  created_at INTEGER NOT NULL
);

CREATE INDEX IF NOT EXISTS discord_interaction_sessions_expiry
  ON discord_interaction_sessions(session_expires_at);

-- Hashes of source-address buckets, not source addresses themselves.  This is
-- deliberately a small, expiring abuse-control record rather than identity.
CREATE TABLE IF NOT EXISTS discord_command_login_rate_limits (
  rate_key TEXT PRIMARY KEY,
  attempts INTEGER NOT NULL,
  reset_at INTEGER NOT NULL
);
