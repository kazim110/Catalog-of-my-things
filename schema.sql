CREATE DATABASE catalogs

CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  title VARCHAR(30),
  color VARCHAR(30),
);

CREATE TABLE Books(
  id SERIAL PRIMARY KEY,
  genre_id INT,
  author_id INT,
  label_id INT,
  published_date DATE,
  archived BOOLEAN,
  publisher VARCHAR(50) NOT NULL,
  cover_state VARCHAR(20) NOT NULL,
  FOREIGN KEY(genre_id) REFERENCES genres(id),
  FOREIGN KEY(author_id) REFERENCES authors(id),
  FOREIGN KEY(label_id) REFERENCES labels(id)
);