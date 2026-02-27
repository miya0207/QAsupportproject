-- SQLite schema for post/DM attribution (minimal)
PRAGMA journal_mode=WAL;

CREATE TABLE IF NOT EXISTS posts (
  post_id TEXT PRIMARY KEY,
  posted_at TEXT NOT NULL,
  type TEXT NOT NULL,
  text TEXT NOT NULL,
  impressions INTEGER DEFAULT 0,
  likes INTEGER DEFAULT 0,
  reposts INTEGER DEFAULT 0,
  replies INTEGER DEFAULT 0,
  profile_clicks INTEGER DEFAULT 0,
  link_clicks INTEGER DEFAULT 0
);

CREATE TABLE IF NOT EXISTS dms (
  dm_id TEXT PRIMARY KEY,
  received_at TEXT NOT NULL,
  dm_label TEXT DEFAULT '',
  dm_strength INTEGER DEFAULT 0,
  note TEXT DEFAULT ''
);

CREATE TABLE IF NOT EXISTS attribution (
  dm_id TEXT NOT NULL,
  post_id TEXT NOT NULL,
  rule TEXT DEFAULT '48h_recent',
  is_override INTEGER DEFAULT 0,
  created_at TEXT NOT NULL,
  PRIMARY KEY (dm_id, post_id),
  FOREIGN KEY (dm_id) REFERENCES dms(dm_id),
  FOREIGN KEY (post_id) REFERENCES posts(post_id)
);
