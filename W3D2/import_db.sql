CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  user_id INTEGER NOT NULL,
  reply_body TEXT NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);


INSERT INTO
  users (fname, lname)
VALUES
  ('Eric', 'Adams'),
  ('Eric', 'Windmill'),
  ('Eric', 'Smith');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('Fastest Land Animal?', 'What is the fastest land animal in Africa?', 1),
  ('Fastest Bird?', 'Which bird can fly the at the highest speed?', 1),
  ('Fastest Sea Animal?', 'Which sea creature can swim the at the highest speed?', 2),
  ('Tallest Mammal?', 'Which mammal can grow to the tallest height?', 2),
  ('Heaviest Mammal?', 'Which mammal can grow to the heaviest weight?', 3),
  ('Smallest Mammal?', 'Which mammal is the smallest in average size?', 3);

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  (1, 3),
  (1, 5),
  (2, 1),
  (2, 6),
  (3, 2),
  (3, 4),
  (1, 4),
  (2, 4),
  (3, 1);

INSERT INTO
  replies (question_id, parent_id, user_id, reply_body)
VALUES
  (1, NULL, 3, "The fastest land animal is a tortoise." ),
  (1, 1, 2, "Actually, the fastest land animal is a cheetah."),
  (1, 1, 1, "Thanks Eric!"),
  (3, NULL, 1, "A great white shark can swim up to 60 mph, making it the quickest."),
  (5, NULL, 1, "The heaviest mammal is a Rhinocerarus."),
  (5, 5, 2, "Actually, the heaviest mammal is a blue whale.");

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  (1,1),
  (1,2),
  (1,3),
  (1,4),
  (1,5),
  (1,6),
  (2,1),
  (2,2),
  (3,1),
  (3,4);
