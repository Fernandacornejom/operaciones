-- crear database con nombre post
\c fernandacornejo
DROP DATABASE posts;
CREATE DATABASE posts;
--cambiamos de direccion a la base de datos recien creada
\c posts

--Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación, contenido y descripción. 
CREATE TABLE post (
  id SERIAL, 
  userName VARCHAR(30),
  createdAt DATE,
  content VARCHAR,
  descipcion VARCHAR,
  PRIMARY KEY (id)
  );
  \dt
--Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos".
INSERT INTO post (userName, createdAt, content, descipcion) 
VALUES ('Pamela', '2021-04-07', 'como sabes que creciste?', 'cuando creciste');
INSERT INTO post (userName, createdAt, content, descipcion)
VALUES ('Pamela', '2021-04-08', 'como sabes que creciste?', 'cuando no quieres jugar');
INSERT INTO post (userName, createdAt, content, descipcion)
VALUES ('Carlos', '2021-04-09', 'como sabes que creciste?', 'cuando no quieres jugo');
SELECT * FROM post;
--Modificar la tabla post, agregando la columna título. 
ALTER TABLE post ADD title VARCHAR(100);
SELECT * FROM post;
--Agregar título a las publicaciones ya ingresadas. 
UPDATE post SET title = 'crecer es triste' WHERE id = 1;
UPDATE post SET title = 'crecer es bueno' WHERE id = 2;
UPDATE post SET title = 'como borro esto' WHERE id = 3;
SELECT * FROM post;
--Insertar 2 post para el usuario "Pedro". 
INSERT INTO post (userName, createdAt, content, descipcion, title)
VALUES ('Pedro', '2021-04-10', 'como sabes que creciste?', 'cuando tomas café sin azucar', 'el café es amargo');
INSERT INTO post (userName, createdAt, content, descipcion, title)
VALUES ('Pedro', '2021-04-10', 'como sabes que creciste?', 'cuando nose', 'nose');
SELECT * FROM post;--esto es para mostrar lo de la tabla post.
--Eliminar el post de Carlos. 
DELETE FROM post WHERE userName = 'Carlos';
SELECT * from post;
--Ingresar un nuevo post para el usuario "Carlos". 
INSERT INTO post (userName, createdAt, content, descipcion, title)
VALUES ('Carlos', '2021-04-11', 'como sabes que creciste?', 'cuando no quieres jugar', 'como borro esto');
SELECT * FROM post;

--Parte 2
--Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de creación y contenido, que se relacione con la tabla posts. 
CREATE TABLE comentarios (
  id SERIAL,
  post_id INT, 
  createdAt TIMESTAMP,
  content VARCHAR,
  FOREIGN KEY (post_id) REFERENCES post(id)
  );
  \dt
--Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos". 
INSERT INTO comentarios (post_id, createdAt, content)
VALUES (1, '2021-05-10 15:16:11', 'HOLA PAMELA');
INSERT INTO comentarios (post_id, createdAt, content)
VALUES (1, '2021-05-10 10:00:24', 'CHAO PAMELA');
INSERT INTO comentarios (post_id, createdAt, content)
VALUES (6, '2021-05-10 10:00:30', 'HOLA CARLITOS');
INSERT INTO comentarios (post_id, createdAt, content)
VALUES (6, '2021-05-10 10:00:32', 'COMO ESTAS CARLITOS?');
INSERT INTO comentarios (post_id, createdAt, content)
VALUES (6, '2021-05-10 10:00:33', 'ESPERO QUE BIEN CARLITOS');
INSERT INTO comentarios (post_id, createdAt, content)
VALUES (6, '2021-05-10 10:00:31', 'CHAO CARLITOS');
SELECT * FROM comentarios;
--Crear un nuevo post para "Margarita". 
INSERT INTO post (userName, createdAt, content, descipcion, title)
VALUES ('Margarita', '2021-04-12', 'cual es tu segundo nombre?', 'cual es tu apellido?', 'cual es tu edad?');
SELECT * FROM post;
--Ingresar 5 comentarios para el post de Margarita. 
INSERT INTO comentarios (post_id, createdAt, content)
VALUES (7, '2021-05-10 10:00:34', 'HOLA MARGARITA');
INSERT INTO comentarios (post_id, createdAt, content)
VALUES (7, '2021-05-10 10:00:35', 'COMO ESTAS MARGARITA?');
INSERT INTO comentarios (post_id, createdAt, content)
VALUES (7, '2021-05-10 10:00:36', 'ESPERO QUE BIEN MARGARITA');
INSERT INTO comentarios (post_id, createdAt, content)
VALUES (7, '2021-05-10 10:00:37', 'CHAO MARGARITA');
INSERT INTO comentarios (post_id, createdAt, content)
VALUES (7, '2021-05-10 10:00:38', 'HASTA LA PRÓXIMA MARGARITA');
SELECT * FROM comentarios;