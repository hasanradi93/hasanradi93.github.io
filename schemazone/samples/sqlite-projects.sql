PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "users"(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  email TEXT NOT NULL UNIQUE,
  display_name TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO users VALUES(1,'maya@example.com','Maya Okafor','2025-03-02 08:15:00');
INSERT INTO users VALUES(2,'lukas@example.com','Lukas Brandt','2025-03-02 08:20:41');
CREATE TABLE IF NOT EXISTS "teams"(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  created_by INTEGER REFERENCES users(id) ON DELETE SET NULL
);
CREATE TABLE IF NOT EXISTS "team_members"(
  team_id INTEGER NOT NULL REFERENCES teams(id) ON DELETE CASCADE,
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  role TEXT NOT NULL DEFAULT 'member',
  joined_at TEXT,
  PRIMARY KEY (team_id, user_id)
);
CREATE TABLE IF NOT EXISTS "projects"(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  team_id INTEGER NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  status TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active','paused','archived')),
  budget REAL,
  starts_on TEXT,
  FOREIGN KEY (team_id) REFERENCES teams(id)
);
CREATE TABLE IF NOT EXISTS "tasks"(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  project_id INTEGER NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
  parent_id INTEGER REFERENCES tasks(id),
  assignee_id INTEGER REFERENCES users(id),
  title TEXT NOT NULL,
  done INTEGER NOT NULL DEFAULT 0,
  priority INTEGER DEFAULT 3,
  due_on TEXT
);
CREATE TABLE IF NOT EXISTS "labels"(
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  colour TEXT DEFAULT '#888888'
);
CREATE TABLE IF NOT EXISTS "task_labels"(
  task_id INTEGER NOT NULL,
  label_id INTEGER NOT NULL,
  PRIMARY KEY (task_id, label_id),
  FOREIGN KEY (task_id) REFERENCES tasks(id) ON DELETE CASCADE,
  FOREIGN KEY (label_id) REFERENCES labels(id) ON DELETE CASCADE
) WITHOUT ROWID;
CREATE TABLE IF NOT EXISTS "comments"(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  task_id INTEGER NOT NULL REFERENCES tasks(id) ON DELETE CASCADE,
  author_id INTEGER NOT NULL REFERENCES users(id),
  body TEXT NOT NULL,
  posted_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('users',2);
CREATE INDEX idx_tasks_project ON tasks(project_id);
CREATE INDEX idx_tasks_assignee ON tasks(assignee_id);
CREATE UNIQUE INDEX idx_projects_team_name ON projects(team_id, name);
CREATE TRIGGER trg_tasks_close_children AFTER UPDATE OF done ON tasks
WHEN NEW.done = 1
BEGIN
  UPDATE tasks SET done = 1 WHERE parent_id = NEW.id;
  INSERT INTO comments(task_id, author_id, body) VALUES (NEW.id, COALESCE(NEW.assignee_id, 1), 'Closed together with its subtasks; done.');
END;
COMMIT;
