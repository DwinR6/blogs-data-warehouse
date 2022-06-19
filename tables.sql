-- database for system of manager blogs

-----------------------------------------------------tables-----------------------------------------------------------
-
------------------------------------------------------ 1 - table users-----------------------------------------------------------
create table users(
    id_user serial not null ,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    nickname varchar(50) not null unique,
    email varchar(50) not null,
    password varchar(25) not null,
    gender varchar(10) not null,
    primary key(id_user)
);             



--insert into users(first_name, last_name, nickname, email, password,  gender) values 
--('Fatima Julissa', 'Hernandez Benitez', 'FatimaHB', 'fatimahb@mail.com', '123', 'Femenino' ),
--('Adrian Alberto', 'Lopez Martinez', '2ALopez', '2ALopez@mail.com', '234554', 'Masculino' ),
--('Juan Carlos', 'Gonzalez Reyes', 'JuanG', 'juang@mail.com', '123', 'Masculino' ),
--('Miguel Angel', 'Alvarez Lopez', 'MiguelAL', 'miguelal@mail.com', '123',  'Masculino' ),
--('Nancy Maria', 'Gomez Ramirez', 'NancyG', 'nancyg@mail.com', '123',  'Femenino'),
--('Pamela Patricia', 'Garcia Blanco', 'PamelaG', 'pamelag@mail.com', '123', 'Femenino' ),
--('Natalie Maricela', 'Diaz Lopez', 'NatalieD', 'natalied@mail.com', '123', 'Femenino' ),
--('Maria Jose', 'Argueta Hernandez', 'mariajh', 'mariajh@mai.com', '123', 'Femenino' ),
--('Oscar Uriel', 'Morales Ruiz', 'OscarUM', 'oscarum@mial.com', '123', 'Masculino' ),
--('Lourdes Maria', 'Vega Luna', 'LourdesVL', 'lourdesvl@mail.com', '123', 'Femenino' );




-----------------------------------------------------------------table logup-----------------------------------------------------------
create table logup(
    id_logup serial,
    id_user int not null,
    date_logup timestamp default current_timestamp,
    primary key(id_logup),
    foreign key(id_user) references users(id_user)
);



--insert into logup(id_user) values (1),(2),(3),(4),(5),(6),(7),(8),(9),(10);
--------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------ 2 - table user_action--------------------------------------------------------
create table user_action(
    id_user_action serial not null,
    id_user integer not null,
    user_action varchar(50) not null,
    date_creation timestamp default current_timestamp,
    primary key(id_user_action)

);
 ---logups
--insert into user_action (id_user, user_action) values (1, 'logup'),(2, 'logup'),(3, 'logup'),(4, 'logup'),(5, 'logup'),(6, 'logup'),(7, 'logup'),(8, 'logup'),(9, 'logup'),(10, 'logup');

---logins
--insert into user_action (id_user, user_action) values (1, 'login'),(2, 'login'),(3, 'login'),(4, 'login'),(5, 'login'),(6, 'login'),(7, 'login'),(8, 'login'),(9, 'login'),(10, 'login');
 
---logouts
--insert into user_action (id_user, user_action) values (1, 'logout'),(2, 'logout'),(3, 'logout'),(4, 'logout'),(5, 'logout'),(6, 'logout'),(7, 'logout'),(8, 'logout'),(9, 'logout'),(10, 'logout');
--------------------------------------------------------------------------------------------------------------------------------


----------------------------------------------------- 3 - table blog----------------------------------------------------------------
create table blog (
    id_blog serial not null ,
    id_user serial not null,
    title varchar(255) not null,
    description varcharnot null,
    date_creation timestamp not null,
    icon_blog varchar(255) not null,
    cover_blog varchar(255) not null,
    primary key(id_blog),
    foreign key(id_user) references users(id_user)
);
-------------------------------------------------------------------------------------------

--------------------------------------------------------------table user_blog-------------------------------------------------------------
create table user_blog(
    id_user_blog serial,
    id_user integer not null,
    id_blog integer not null,
    user_level varchar(10) not null,
    account_status varchar(10) not null,
    primary key(id_user_blog),
    foreign key(id_blog) references blog(id_blog),
    foreign key(id_user) references users(id_user)
);
--------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------- 4 - table dontation----------------------------------------------------
create table donation (
    id_donation serial not null ,
    id_user serial not null,
    id_blog serial not null,
    amount float not null,
    date_donation timestamp not null,
    payment_method varchar(25) not null,
    primary key(id_donation),
    foreign key(id_user) references users(id_user),
    foreign key(id_blog) references blog(id_blog)
);
--------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------ 9 - table category--------------------------------------------------
create table category(
    id_category serial not null ,
    category varchar(50) not null,
    primary key(id_category)
);
---------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------ 5 - table post----------------------------------------------------------------
create table post(
    id_post serial not null,
    id_blog serial not null,
    id_user serial not null,
    title varchar(255) not null,
    description varchar not null,
    date_creation timestamp not null,
    content_url varchar(255) not null,
    id_category serial not null,
    primary key(id_post),
    foreign key(id_blog) references blog(id_blog),
    foreign key(id_category) references category(id_category),
    foreign key(id_user) references users(id_user)
);
--------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------ 10 - table subcategory----------------------------------------------
create table subcategory(
    id_subcategory serial not null ,
    id_category serial not null,
    subcategory varchar(50) not null,
    primary key(id_subcategory),
    foreign key(id_category) references category(id_category)
);
---------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------ 6 - table post_subcategory-----------------------------------------------------
create table post_subcategory(
    id_post_subcategory serial not null ,
    id_post serial not null,
    id_subcategory serial not null,
    primary key(id_post_subcategory),
    foreign key(id_post) references post(id_post),
    foreign key(id_subcategory) references subcategory(id_subcategory)
);
--------------------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------- 7 - table post_tag------------------------------------------------------
create table post_tag(
    id_post_tag serial not null ,
    id_post serial not null,
    tag varchar(50) not null,
    primary key(id_post_tag),
    foreign key(id_post) references post(id_post)
);
---------------------------------------------------------------------------------------------------------------------------------



------------------------------------------------------------ 8 - table post_comment----------------------------------------------
create table post_comment(
    id_comment serial not null ,
    id_post serial not null,
    id_user serial not null,
    comment varchar not null,
    date_creation timestamp not null,
    primary key(id_comment),
    foreign key(id_post) references post(id_post),
    foreign key(id_user) references users(id_user)
);