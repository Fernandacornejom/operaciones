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