-- database for system of manager blogs

-----------------------------------------------------tables-----------------------------------------------------------
---Tabla1: blogs---

create table users(
    id_user serial not null ,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    nickname varchar(50) not null unique,
    email varchar(25) not null,
    password varchar(25) not null,
    user_level varchar(10) not null,
    gender varchar(10) not null,
    last_connection timestamp not null,
    account_status varchar(10) not null,
    primary key(id_user)
);

---tabla2:user_action---
create table user_action(
    id_user_action serial not null,
    id_user integer not null,
    user_action varchar(50) not null,
    date_creation timestamp not null,
    primary key(id_user_action)

);

--tabla3:blogs---
create table blog (
    id_blog serial not null ,
    id_user serial not null,
    title varchar(50) not null,
    description varchar(50) not null,
    date_creation timestamp not null,
    icon_blog varchar(100) not null,
    cover_blog varchar(100) not null,
    primary key(id_blog),
    foreign key(id_user) references users(id_user)
);
---tabla4:donation---
create table donation (
    id_donation serial not null ,
    id_user serial not null,
    id_blog serial not null,
    amount serial not null,
    date_donation timestamp not null,
    payment_method varchar(25) not null,
    primary key(id_donation),
    foreign key(id_user) references users(id_user),
    foreign key(id_blog) references blog(id_blog)
);

---tabla5:post---
create table post(
    id_post serial not null ,
    id_blog serial not null,
    title varchar(50) not null,
    description varchar(50) not null,
    date_creation timestamp not null,
    content_url varchar(50) not null,
    id_category serial not null,
    primary key(id_post),
    foreign key(id_blog) references blog(id_blog)
);
---tabla6:post_subcategory---
create table post_subcategory(
    id_post_detail serial not null ,
    id_post serial not null,
    subcategory varchar(50) not null,
    primary key(id_post_detail),
    foreign key(id_post) references post(id_post)
);
---tabla7:post_tag---
create table post_tag(
    id_post_tag serial not null ,
    id_post serial not null,
    tag varchar(50) not null,
    primary key(id_post_tag),
    foreign key(id_post) references post(id_post)
);
---tabla8:post_comment---
create table post_comment(
    id_comment serial not null ,
    id_post serial not null,
    id_user serial not null,
    comment varchar(255) not null,
    date_creation timestamp not null,
    primary key(id_comment),
    foreign key(id_post) references post(id_post),
    foreign key(id_user) references users(id_user)
);
---tabla9:category---
create table category(
    id_category serial not null ,
    category varchar(50) not null,
    primary key(id_category)
);
---tabla10:subcategory---
create table subcategory(
    id_subcategory serial not null ,
    id_category serial not null,
    subcategory varchar(50) not null,
    primary key(id_subcategory),
    foreign key(id_category) references category(id_category)
);

-- punto 2
create function get_posts(int) returns table
$$
    declare 
        id_blog int alias for $1;
    begin
        select post.id_post, post.title, post.description, post.date_creation, category.category, subcategory.subcategory
        from post
        inner join category on post.id_category = category.id_category
        inner join subcategory on post.id_subcategory = subcategory.id_subcategory
        where post.id_blog = id_blog;
    end;
$$ language plpgsql;

create function get_post_by_category(int, int) returns table



create view view_donation as select user.nickname, donation.amount, donation.date_donation
from donation
inner join user on donation.id_user = user.id_user
group by user.nickname, donation.amount;


create function on_donation() returns trigger
$$
    declare
        rw record;
    begin
        for rw in select user.nickname, donation.amount, donation.date_donation
        from user
        inner join donation on user.id_user = donation.id_user
        where user.id_user = new.id_user
        insert into view_donation values(rw.nickname, rw.amount, rw.date_donation);

    end;
$$ language plpgsql;


create trigger donation_trigger 
after insert on donation
for each row execute procedure on_donation();



create function on_view_donation() returns trigger
$$
    begin
        raise notice 'Donacion: %', new.nickname;
    end;
$$ language plpgsql;

create trigger donation_view_trigger
after insert on view_donation
execute procedure on_view_donation();

select * from view_donation where extract(month from date_donation) = extract(month from now());
-- title_post | category | subcategory 
-- Post x  | Peliculas     | Accion, Aventura
-- Post s  | Juegos     | Terror
-- categoria : Peliculas
-- subcategoria : Accion
-- subcategoria : Aventura
-- subcategoria : Comedia

---using dart:io
--createPost(
    subcategories: [
      'Accion',
      'Aventura',
      'Comedia'
    ],
    categoriy: 'Peliculas',

);