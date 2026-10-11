CREATE TABLE vaultmaze_reviews (
  subject_hash TEXT NOT NULL,
  card_id TEXT NOT NULL,
  reviewed_at INTEGER NOT NULL,
  rating INTEGER NOT NULL CHECK (rating BETWEEN 1 AND 4),
  stability REAL NOT NULL CHECK (stability >= 0),
  difficulty REAL NOT NULL CHECK (difficulty >= 0),
  PRIMARY KEY (subject_hash, card_id)
);
CREATE INDEX vaultmaze_reviews_due ON vaultmaze_reviews (subject_hash, reviewed_at);
