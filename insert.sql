

------------------------Siempre verificar que el registro de las relaciones exista antes de insertar--------------------------------------------------------
-- caso de no existir el registro de la relacion borrar los registros de la tabla relacionada y usar la sentencia alter secuence para cada tabla, con esto se resetea el id counter
--ALTER SEQUENCE user_action_user_action_id_seq RESTART WITH 1;
--ALTER SEQUENCE logup_logup_id_seq RESTART WITH 1;
--ALTER SEQUENCE users_id_user_seq RESTART WITH 1;
-------------------------------------------------------------------inserts into users---------------------------------------------------------------------------------
-- al insertar un usuario en users se inserta un registro en la tabla logup y se inserta un registro en la tabla user_action mediante un trigger llamado logup_trigger

insert into users(first_name, last_name, nickname, email, password,  gender) values 
('Fatima Julissa', 'Hernandez Benitez', 'FatimaHB', 'fatimahb@mail.com', '123', 'Femenino' ),
('Adrian Alberto', 'Lopez Martinez', '2ALopez', '2ALopez@mail.com', '234554', 'Masculino' ),
('Juan Carlos', 'Gonzalez Reyes', 'JuanG', 'juang@mail.com', '123', 'Masculino' ),
('Miguel Angel', 'Alvarez Lopez', 'MiguelAL', 'miguelal@mail.com', '123',  'Masculino' ),
('Nancy Maria', 'Gomez Ramirez', 'NancyG', 'nancyg@mail.com', '123',  'Femenino'),
('Pamela Patricia', 'Garcia Blanco', 'PamelaG', 'pamelag@mail.com', '123', 'Femenino' ),
('Natalie Maricela', 'Diaz Lopez', 'NatalieD', 'natalied@mail.com', '123', 'Femenino' ),
('Maria Jose', 'Argueta Hernandez', 'mariajh', 'mariajh@mai.com', '123', 'Femenino' ),
('Oscar Uriel', 'Morales Ruiz', 'OscarUM', 'oscarum@mial.com', '123', 'Masculino' ),
('Lourdes Maria', 'Vega Luna', 'LourdesVL', 'lourdesvl@mail.com', '123', 'Femenino' );


------------------------------------------------------------------------insert into blog---------------------------------------------------------------------------------
-- al insertar un registro en la table blog:
-- se dispara un trigger llamado create_blog_trigger  que:
    -- se inserta un registro en la subcription_blog table, donde user_level = 'admin'
    -- se inserta un registro en la user_action table, donde el action = 'create_blog'
--
-- En id_user verificar que exista el usuario en la tabla users

insert into blog(id_blog, id_user, title, description, icon_blog, cover_blog, date_creation) values 
(default, 1, 'Aprendiendo Postgresql', 'Todo lo que necesitas saber sobre postgresql. El mejor motor de base de datos', 'icon_blogfile.png', 'cover_blog_file.jpg', now()),
(default, 2, 'Aprendiendo Python', 'Todo lo que necesitas saber sobre python. El mejor lenguaje de programacion', 'icon_blogfile.png', 'cover_blog_file.jpg', now()),
(default, 3, 'Aprendiendo Java', 'Todo lo que necesitas saber sobre java. El mejor lenguaje de programacion', 'icon_blogfile.png', 'cover_blog_file.jpg', now()),
(default, 4, 'Aprendiendo C++', 'Todo lo que necesitas saber sobre C++. El mejor lenguaje de programacion', 'icon_blogfile.png', 'cover_blog_file.jpg', now()),
(default, 5, 'Aprendiendo C#', 'Todo lo que necesitas saber sobre C#. El mejor lenguaje de programacion', 'icon_blogfile.png', 'cover_blog_file.jpg', now()),
(default, 6, 'Aprendiendo PHP', 'Todo lo que necesitas saber sobre PHP. El mejor lenguaje de programacion', 'icon_blogfile.png', 'cover_blog_file.jpg', now()),
(default, 7, 'Aprendiendo Ruby', 'Todo lo que necesitas saber sobre Ruby. El mejor lenguaje de programacion', 'icon_blogfile.png', 'cover_blog_file.jpg', now()),
(default, 8, 'Aprendiendo Javascript', 'Todo lo que necesitas saber sobre Javascript. El mejor lenguaje de programacion', 'icon_blogfile.png', 'cover_blog_file.jpg', now()),
(default, 9, 'Aprendiendo C', 'Todo lo que necesitas saber sobre C. El mejor lenguaje de programacion', 'icon_blogfile.png', 'cover_blog_file.jpg', now());



------------------------------------------------------------------------insert into subscription_blog-----------------------------------------------------------------
-- al insertar un registro en la table subscription_blog:
-- verificar que exista el usuario en la tabla users
-- verificar que exista el blog en la tabla blog

insert into subscription_blog(id_subscription_blog, id_blog, id_user, user_level, account_status) values
(default, 1, 2, 'moderador', 'Active'),
(default, 2, 3, 'usuario', 'Active'), 
(default, 3, 4, 'moderador', 'Active'),
(default, 4, 5, 'usuario', 'Active'), 
(default, 5, 6, 'moderador', 'Active'),
(default, 6, 7, 'usuario', 'Active'), 
(default, 7, 8, 'moderador', 'Active'),
(default, 8, 9, 'usuario', 'Active'), 
(default, 9, 1, 'moderador', 'Active');


----------------------------------------------------------------insert into donation---------------------------------------------------------------------------------
-- al insertar un registro en la table donation:
-- se dispara un trigger llamado donation_trigger  que:
    -- se inserta un registro en la user_action table, donde el action = 'donation'


insert into donation(id_donation, id_user, id_blog, amount, date_donation, payment_method) values 
(default, 1, 2, 290, now(), 'paypal'),
(default, 2, 3, 960, now(), 'paypal'),
(default, 3, 4, 800, now(), 'paypal'),
(default, 4, 5, 600, now(), 'tarjeta'),
(default, 5, 6, 700, now(), 'tarjeta'),
(default, 6, 7, 880, now(), 'tarjeta'),
(default, 7, 8, 900, now(), 'bitcoin'),
(default, 8, 9, 1000, now(), 'bitcoin');


------------------------------------------------------------------insert into category---------------------------------------------------------------------------------
-- al insertar un registro en la table category:

insert into category(id_category, category) values 
(default, 'Programacion'),
(default, 'Peliculas'),
(default, 'Series'),
(default, 'Libros'),
(default, 'Musica'),
(default, 'Videojuegos');


---------------------------------------------------insert into subcategory---------------------------------------------------------------------------------
-- al insertar un registro en la table subcategory:
-- para id_category verificar que exista la categoria en la tabla category

insert into subcategory(id_subcategory, id_category, subcategory) values
(default, 1, 'Base de Datos'),
(default, 1, 'Programccion Orientada a Objetos'),
(default, 1, 'Programacion Funcional'),
(default, 1, 'Desarrollo Web'),
(default, 1, 'Desarrollo de Aplicaciones'),
(default, 2, 'Accion'),
(default, 2, 'Comedia'),
(default, 2, 'Drama'),
(default, 2, 'Fantasia'),
(default, 2, 'Ficcion'),
(default, 2, 'Policiaca'),
(default, 2, 'Romance'),
(default, 2, 'Terror'),
(default, 3, 'Harry Potter'),
(default, 3, 'Poesia'),
(default, 3, 'Historia'),
(default, 3, 'Ficcion'),
(default, 3, 'Fantasia'),
(default, 3, 'Policiaca'),
(default, 3, 'Romance'),
(default, 3, 'Terror'),
(default, 5, 'Rol'),
(default, 5, 'Aventura'),
(default, 5, 'Ficcion'),
(default, 5, 'Fantasia'),
(default, 5, 'Mundo Abierto'),
(default, 5, 'Estrategia'),
(default, 5, 'Simulacion');



---------------------------------------------------------------------------insert into post---------------------------------------------------------------------------------
-- al insertar un registro en la table post:
-- se dispara un trigger llamado create_post_trigger  que:
    -- se inserta un registro en la user_action table, donde el action = 'create_post'
--
-- se comprueba que el usuario que crea el post tenga una subscripcion a ese blog de tipo admin
--
-- en id_user verificar que exista el usuario en la tabla users
-- en id_blog verificar que exista el blog en la tabla blog
-- en id_category verificar que exista la categoria en la tabla category
--
-- sera necesario realizar el registro de las tags del post en la tabla post_tag y las sucategorias a las que pertenece el post en la tabla post_subcategory


insert into post(id_post, id_blog, id_user, title, description, content_url, id_category) values
(default, 1, 1, 'Leccion 1. Que es una base de datos', 'En esta leccion se explicara que es una base de datos y como se utiliza',  'url/postgre.txt', 1),
(default, 1, 1, 'Leccion 2. El Gestor de Base de Datos PostgreSQL', 'En esta leccion se explicara como se utiliza el gestor de base de datos PostgreSQL',  'url/postgre.txt', 1),
(default, 1, 1, 'Leccion 3. Crear una base de datos', 'En esta leccion se explicara como se crea una base de datos',  'url/postgre.txt', 1),
(default, 1, 1, 'Leccion 4. Tablas', 'En esta leccion se explicara como se crea una tabla',  'url/postgre.txt', 1),
(default, 1, 1, 'Leccion 5. Campos', 'En esta leccion se explicara como se crea un campo',  'url/postgre.txt', 1),
(default, 1, 1, 'Leccion 6. Indices', 'En esta leccion se explicara como se crea un indice',  'url/postgre.txt', 1),
(default, 1, 1, 'Leccion 7. Filtros', 'En esta leccion se explicara como se crea un filtro',  'url/postgre.txt', 1),
(default, 1, 1, 'Leccion 8. Triggers', 'En esta leccion se explicara como se crea un trigger',  'url/postgre.txt', 1),
(default, 1, 1, 'Leccion 9. Funciones', 'En esta leccion se explicara como se crea una funcion',  'url/postgre.txt', 1),

(default, 2, 2, 'Leccion 1. Que es Python', 'En esta leccion se explicara que es Python', 'content_url.txt' ,1),
(default, 2, 2, 'Leccion 2. Instalar Python', 'En esta leccion se explicara como se instala Python', 'content_url.txt' ,1),
(default, 2, 2, 'Leccion 3. Crear una aplicacion', 'En esta leccion se explicara como se crea una aplicacion', 'content_url.txt' ,1),
(default, 2, 2, 'Leccion 4. Variables', 'En esta leccion se explicara como se crea una variable', 'content_url.txt' ,1),
(default, 2, 2, 'Leccion 5. Listas', 'En esta leccion se explicara como se crea una lista', 'content_url.txt' ,1),
(default, 2, 2, 'Leccion 6. Tuplas', 'En esta leccion se explicara como se crea una tupla', 'content_url.txt' ,1),
(default, 2, 2, 'Leccion 7. Diccionarios', 'En esta leccion se explicara como se crea un diccionario', 'content_url.txt' ,1),
(default, 2, 2, 'Leccion 8. Funciones', 'En esta leccion se explicara como se crea una funcion', 'content_url.txt' ,1),
(default, 2, 2, 'Leccion 9. Clases', 'En esta leccion se explicara como se crea una clase', 'content_url.txt' ,1),
(default, 2, 2, 'Leccion 10. Heretacion', 'En esta leccion se explicara como se hereda una clase', 'content_url.txt' ,1),
(default, 2, 2, 'Leccion 11. Metodos', 'En esta leccion se explicara como se crea un metodo', 'content_url.txt' ,1),
(default, 2, 2, 'Leccion 12. Atributos', 'En esta leccion se explicara como se crea un atributo', 'content_url.txt' ,1),
(default, 2, 2, 'Leccion 13. Herencias', 'En esta leccion se explicara como se herencia una clase', 'content_url.txt' ,1),

(default, 3, 3, 'Leccion 1. Que es Java', 'En esta leccion se explicara que es Java', 'content_url.txt' ,1),
(default, 3, 3, 'Leccion 2. Instalar Java', 'En esta leccion se explicara como se instala Java', 'content_url.txt' ,1),
(default, 3, 3, 'Leccion 3. Crear una aplicacion', 'En esta leccion se explicara como se crea una aplicacion', 'content_url.txt' ,1),
(default, 3, 3, 'Leccion 4. Variables', 'En esta leccion se explicara como se crea una variable', 'content_url.txt' ,1),
(default, 3, 3, 'Leccion 5. Listas', 'En esta leccion se explicara como se crea una lista', 'content_url.txt' ,1),
(default, 3, 3, 'Leccion 6. Tuplas', 'En esta leccion se explicara como se crea una tupla', 'content_url.txt' ,1),
(default, 3, 3, 'Leccion 7. Diccionarios', 'En esta leccion se explicara como se crea un diccionario', 'content_url.txt' ,1),
(default, 3, 3, 'Leccion 8. Funciones', 'En esta leccion se explicara como se crea una funcion', 'content_url.txt' ,1),
(default, 3, 3, 'Leccion 9. Clases', 'En esta leccion se explicara como se crea una clase', 'content_url.txt' ,1),
(default, 3, 3, 'Leccion 10. Heretacion', 'En esta leccion se explicara como se hereda una clase', 'content_url.txt' ,1),
(default, 3, 3, 'Leccion 11. Metodos', 'En esta leccion se explicara como se crea un metodo', 'content_url.txt' ,1),
(default, 3, 3, 'Leccion 12. Atributos', 'En esta leccion se explicara como se crea un atributo', 'content_url.txt' ,1),
(default, 3, 3, 'Leccion 13. Herencias', 'En esta leccion se explicara como se herencia una clase', 'content_url.txt' ,1),

(default, 4, 4, 'Leccion 1. Que es C++', 'En esta leccion se explicara que es C#', 'content_url.txt' ,1),
(default, 5, 5, 'Leccion 1. Que es C#', 'En esta leccion se explicara que es C++', 'content_url.txt' ,1);


--------------------------------------------------------------------insert into post_tag ------------------------------------------------------

insert into post_tag(id_post, tag) values
(1, 'PostgreSQL'),
(1, 'Base de datos'),
(2, 'Python'),
(2, 'Lenguaje de programacion'),
(3, 'Java'),
(3, 'Lenguaje de programacion'),
(4, 'C++'),
(4, 'Lenguaje de programacion'),
(5, 'C#'),
(5, 'Lenguaje de programacion');


--------------------------------------------------------------insert into post_subcategory ------------------------------------------------------


insert into post_subcategory(id_post, id_subcategory) values
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2);

---------------------------------------------------------insert into post_comment ------------------------------------------------------
-- al insertar un comentario se dispara un trigger llamado create_comment_trigger:
   -- inserta un registro en la tabla user_action donde action = 'comment'

   insert into post_comment(id_post, id_user, comment) values
   (1, 1, 'Comentario 1'),
   (1, 2, 'Comentario 2'),
   (1, 3, 'Comentario 3'),
   (2, 1, 'Comentario 1'),
   (2, 2, 'Comentario 2'),
   (2, 3, 'Comentario 3'),
   (3, 1, 'Comentario 1'),
   (3, 2, 'Comentario 2'),
   (3, 3, 'Comentario 3'),
   (4, 1, 'Comentario 1'),
   (4, 2, 'Comentario 2'),
   (4, 3, 'Comentario 3'),
   (5, 1, 'Comentario 1'),
   (5, 2, 'Comentario 2'),
   (5, 3, 'Comentario 3'),
   (6, 1, 'Comentario 1'),
   (6, 2, 'Comentario 2'),
   (6, 3, 'Comentario 3'),
   (7, 1, 'Comentario 1'),
   (7, 2, 'Comentario 2'),
   (7, 3, 'Comentario 3'),
   (8, 1, 'Comentario 1'),
   (8, 2, 'Comentario 2'),
   (8, 3, 'Comentario 3'),
   (9, 1, 'Comentario 1'),
   (9, 2, 'Comentario 2'),
   (9, 3, 'Comentario 3'),
   (10, 1, 'Comentario 1'),
   (10, 2, 'Comentario 2'),
   (10, 3, 'Comentario 3'),
   (11, 1, 'Comentario 1'),
   (11, 2, 'Comentario 2'),
   (11, 3, 'Comentario 3'),
   (12, 1, 'Comentario 1'),
   (12, 2, 'Comentario 2'),
   (12, 3, 'Comentario 3'),
   (13, 1, 'Comentario 1'),
   (13, 2, 'Comentario 2'),
   (13, 3, 'Comentario 3'),
   (14, 1, 'Comentario 1'),
   (14, 2, 'Comentario 2'),
   (14, 3, 'Comentario 3'),
   (15, 1, 'Comentario 1'),
   (15, 2, 'Comentario 2'),
   (15, 3, 'Comentario 3'),
   (16, 1, 'Comentario 1'),
   (16, 2, 'Comentario 2'),
   (16, 3, 'Comentario 3'),
   (17, 1, 'Comentario 1'),
   (17, 2, 'Comentario 2'),
   (17, 3, 'Comentario 3'),
   (18, 1, 'Comentario 1'),
   (18, 2, 'Comentario 2'),
   (18, 3, 'Comentario 3'),
   (19, 1, 'Comentario 1'),
   (19, 2, 'Comentario 2'),
   (19, 3, 'Comentario 3'),
   (20, 1, 'Comentario 1'),
   (20, 2, 'Comentario 2'),
   (20, 3, 'Comentario 3'),
   (21, 1, 'Comentario 1'),
   (21, 2, 'Comentario 2'),
   (21, 3, 'Comentario 3'),
   (22, 1, 'Comentario 1'),
   (22, 2, 'Comentario 2'),
   (22, 3, 'Comentario 3'),
   (23, 1, 'Comentario 1'),
   (23, 2, 'Comentario 2'),
   (23, 3, 'Comentario 3'),
   (24, 1, 'Comentario 1'),
   (24, 2, 'Comentario 2'),
   (24, 3, 'Comentario 3');












