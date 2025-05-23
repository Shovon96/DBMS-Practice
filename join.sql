
CREATE Table "joinUser"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
)

CREATE Table joinPost(
    id SERIAL PRIMARY KEY,
    title text NOT NULL,
    user_id INTEGER REFERENCES "joinUser"(id)
)



INSERT INTO "joinUser" (username) VALUES
('akash'),
('batash'),
('sagor'),
('nodi');

INSERT INTO joinPost (title, user_id) VALUES
('Enjoying a sunny day with Akash! ☀️', 2),
('Batash just shared an amazing recipe! 🍲', 1),
('Exploring adventures with Sagor.🌟', 4),
('Nodi''s wisdom always leaves me inspired. 📚', 4);


DROP Table joinPost;
DROP Table "joinUser";

SELECT * from "joinUser";
SELECT * from joinPost;

SELECT * FROM joinPost as p
JOIN "joinUser" u on p.user_id = u.id;

INSERT INTO joinPost (id, title, user_id) VALUES
(5,'this is a test post title', NULL);


SELECT * FROM joinPost as p
LEFt OUTER JOIN "joinUser" u on p.user_id = u.id;


SELECT * FROM joinPost as p
RIGHT OUTER JOIN "joinUser" u on p.user_id = u.id;

SELECT * FROM joinPost as p
FULL OUTER JOIN "joinUser" u on p.user_id = u.id;