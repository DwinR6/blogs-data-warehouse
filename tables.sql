-- database for system of manager blogs

-----------------------------------------------------tables-----------------------------------------------------------
--
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
    on delete cascade
);



--insert into logup(id_user) values (1),(2),(3),(4),(5),(6),(7),(8),(9),(10);
--------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------ 2 - table user_action--------------------------------------------------------
create table user_action(
    id_user_action serial not null,
    id_user integer not null,
    user_action varchar(50) not null,
    date_creation timestamp default current_timestamp,
    primary key(id_user_action),
    foreign key(id_user) references users(id_user)
    on delete cascade

);
--------------------------------------------------------------------------------------------------------------------------------


----------------------------------------------------- 3 - table blog----------------------------------------------------------------
create table blog (
    id_blog serial not null ,
    id_user serial not null,
    title varchar(255) not null,
    description varchar not null,
    date_creation timestamp default current_timestamp,
    icon_blog varchar(255) not null,
    cover_blog varchar(255) not null,
    primary key(id_blog),
    foreign key(id_user) references users(id_user)
    on delete cascade
);
-------------------------------------------------------------------------------------------

--------------------------------------------------------------table user_blog-------------------------------------------------------------
create table subscription_blog(
    id_subscription_blog serial,
    id_user integer not null,
    id_blog integer not null,
    user_level varchar(10) not null,
    account_status varchar(10) not null,
    primary key(id_subscription_blog),
    foreign key(id_blog) references blog(id_blog),
    foreign key(id_user) references users(id_user)
    on delete cascade
);
--------------------------------------------------------------------------------------------------------------------------------




------------------------------------------------------------- 4 - table dontation----------------------------------------------------
create table donation (
    id_donation serial not null ,
    id_user serial not null,
    id_blog serial not null,
    amount float not null,
    date_donation timestamp default current_timestamp,
    payment_method varchar(25) not null,
    primary key(id_donation),
    foreign key(id_user) references users(id_user),
    foreign key(id_blog) references blog(id_blog)
    on delete cascade
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
    date_creation timestamp default current_timestamp,
    content_url varchar(255) not null,
    id_category serial not null,
    primary key(id_post),
    foreign key(id_blog) references blog(id_blog),
    foreign key(id_category) references category(id_category),
    foreign key(id_user) references users(id_user)
    on delete cascade
);
--------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------ 10 - table subcategory----------------------------------------------
create table subcategory(
    id_subcategory serial not null ,
    id_category serial not null,
    subcategory varchar(50) not null,
    primary key(id_subcategory),
    foreign key(id_category) references category(id_category)
    on delete cascade
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
    on delete cascade
);
--------------------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------- 7 - table post_tag------------------------------------------------------
create table post_tag(
    id_post_tag serial not null ,
    id_post serial not null,
    tag varchar(50) not null,
    primary key(id_post_tag),
    foreign key(id_post) references post(id_post)
    on delete cascade
);
---------------------------------------------------------------------------------------------------------------------------------



------------------------------------------------------------ 8 - table post_comment----------------------------------------------
create table post_comment(
    id_comment serial not null ,
    id_post serial not null,
    id_user serial not null,
    comment varchar not null,
    date_creation timestamp default current_timestamp,
    primary key(id_comment),
    foreign key(id_post) references post(id_post),
    foreign key(id_user) references users(id_user)
    on delete cascade
);

--------------------------------------------------------------------------------------------------------------------------------
create table view_post(
    id_view_post serial not null ,
    id_post serial not null,
    id_user integer default null,
    primary key(id_view_post),
    foreign key(id_post) references post(id_post),
    foreign key(id_user) references users(id_user)
    on delete cascade
);

ALTER SEQUENCE user_action_id_user_action_seq RESTART WITH 1;
ALTER SEQUENCE logup_id_logup_seq RESTART WITH 1;
ALTER SEQUENCE users_id_user_seq RESTART WITH 1;
ALTER SEQUENCE blog_id_blog_seq RESTART WITH 1;
ALTER SEQUENCE post_id_post_seq RESTART WITH 1;
ALTER SEQUENCE category_id_category_seq RESTART WITH 1;
ALTER SEQUENCE subcategory_id_subcategory_seq RESTART WITH 1;
ALTER SEQUENCE post_subcategory_id_post_subcategory_seq RESTART WITH 1;
ALTER SEQUENCE post_tag_id_post_tag_seq RESTART WITH 1;
ALTER SEQUENCE post_comment_id_comment_seq RESTART WITH 1;
ALTER SEQUENCE donation_id_donation_seq RESTART WITH 1;
ALTER SEQUENCE subscription_blog_id_subscription_blog_seq RESTART WITH 1;
ALTER SEQUENCE view_post_id_view_post_seq RESTART WITH 1;
