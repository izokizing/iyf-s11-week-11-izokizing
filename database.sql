-- Create posts table
CREATE TABLE posts (
  id      INTEGER PRIMARY KEY,
  author  TEXT NOT NULL,
  title   TEXT NOT NULL,
  likes   INTEGER DEFAULT 0
);

-- Insert posts
INSERT INTO posts (author, title, likes) VALUES
  ('maisori', 'Hello SQL', 3),
  ('amina', 'Joins are fun', 7),
  ('maisori', 'Second post', 1);


-- 2. Select all posts ordered by likes (descending)
SELECT *
FROM posts
ORDER BY likes DESC;


-- 3. Select posts by one author
SELECT *
FROM posts
WHERE author = 'maisori';


-- 4. Create users table
CREATE TABLE users (
  id       INTEGER PRIMARY KEY,
  username TEXT NOT NULL UNIQUE,
  email    TEXT NOT NULL UNIQUE
);

-- Insert users
INSERT INTO users (username, email) VALUES
  ('maisori', 'maisori@example.com'),
  ('amina', 'amina@example.com');


-- 5. JOIN posts with users
SELECT
  posts.id,
  posts.title,
  posts.likes,
  users.username,
  users.email
FROM posts
JOIN users
  ON posts.author = users.username;