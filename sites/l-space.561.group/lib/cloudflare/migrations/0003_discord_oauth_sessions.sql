CREATE TABLE IF NOT EXISTS discord_oauth_sessions (
  session_hash TEXT PRIMARY KEY,
  subject_hash TEXT NOT NULL,
  discord_user_id TEXT NOT NULL,
  display_name TEXT NOT NULL,
  authorization_ciphertext TEXT NOT NULL,
  authorization_version INTEGER NOT NULL DEFAULT 0,
  token_expires_at INTEGER NOT NULL,
  session_expires_at INTEGER NOT NULL,
  retry_after INTEGER NOT NULL DEFAULT 0,
  created_at INTEGER NOT NULL,
  updated_at INTEGER NOT NULL
);

CREATE INDEX IF NOT EXISTS discord_oauth_sessions_subject
  ON discord_oauth_sessions(subject_hash);

CREATE INDEX IF NOT EXISTS discord_oauth_sessions_expiry
  ON discord_oauth_sessions(session_expires_at);
