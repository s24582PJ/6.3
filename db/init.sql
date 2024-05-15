CREATE TABLE IF NOT EXISTS people (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL
);

INSERT INTO people (name, age) VALUES ('Jakub', 15);
INSERT INTO people (name, age) VALUES ('Grzeogrz', 13);
INSERT INTO people (name, age) VALUES ('Wojtek', 2);
INSERT INTO people (name, age) VALUES ('Kacper', 14);
