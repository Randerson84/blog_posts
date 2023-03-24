TRUNCATE TABLE posts_tags, tags RESTART IDENTITY;
TRUNCATE TABLE posts_tags, posts RESTART IDENTITY;

INSERT INTO posts (title) VALUES ('Using IRB');
INSERT INTO posts (title) VALUES ('SQL basics');
INSERT INTO posts (title) VALUES ('Ruby classes');

INSERT INTO tags (name) VALUES ('sql');
INSERT INTO tags (name) VALUES ('coding');
INSERT INTO tags (name) VALUES ('ruby');

INSERT INTO posts_tags (post_id, tag_id) VALUES ('1', '2');
INSERT INTO posts_tags (post_id, tag_id) VALUES ('2', '1');
INSERT INTO posts_tags (post_id, tag_id) VALUES ('3', '2');
INSERT INTO posts_tags (post_id, tag_id) VALUES ('3', '3');