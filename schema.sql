CREATE DATABASE catalogs

CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  title VARCHAR(30),
  color VARCHAR(30),
);

CREATE TABLE genres (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
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

CREATE TABLE music_albums (
  id BIGSERIAL PRIMARY KEY,
  genre_id INT NOT NULL,
  author_id INT NOT NULL,
  source_id INT NOT NULL,
  label_id INT NOT NULL,
  published_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  CONSTRAINT fk_genre_id
    FOREIGN KEY (genre_id)
    REFERENCES genres(id)
  CONSTRAINT fk_author_id
    FOREIGN KEY (author_id)
    REFERENCES authors(id)
  CONSTRAINT fk_source_id
    FOREIGN KEY (source_id)
    REFERENCES sources(id)
  CONSTRAINT fk_label_id
    FOREIGN KEY label_id
    REFERENCES labels(id)
);