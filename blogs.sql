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
---------------------------------------------------------------------------------------------------------------------------------





-- punto 2

------------------------------------------------------------ function get_posts --------------------------------------------------
-- this function return all posts of a blog by id_blog ---------------------------------------------------------------------------
create or replace function get_posts(integer) returns table(
    id_post integer,
    post varchar(255),
    description varchar,
    created timestamp,
    category varchar(50),
    subcategories varchar,
    tags varchar(255),
    autor varchar(50),
    blog varchar(255),
    total_comments integer
    
) as
$$
    declare 
        id_b alias for $1;
    begin
        return query select 
        post.id_post as id_post, 
        post.title as post, 
        post.description as description, 
        post.date_creation as created, 
        category.category as category, 
        string_agg(subcategory.subcategory, ', ')::varchar as subcategories, 
        string_agg(post_tag.tag, ', ')::varchar as tags, 
        users.nickname as autor, 
        blog.title as blog, 
        count(post_comment.id_comment)::int as total_comments 

        from post
        inner join category on post.id_category = category.id_category
        inner join post_subcategory on post_subcategory.id_post = post.id_post
        inner join subcategory on subcategory.id_subcategory = post_subcategory.id_subcategory
        inner join post_tag on post_tag.id_post = post.id_post
        inner join post_comment on post_comment.id_post = post.id_post
        inner join users on users.id_user = post.id_user
        inner join blog on blog.id_blog = post.id_blog
        where blog.id_blog = id_b
        group by post.id_post, post.title, post.description, post.date_creation, category.category, users.nickname, blog.title;
        
        
    end;
$$ language plpgsql;


----------------------------------------------------------- view view_donation ----------------------------------------------------
-- this view save data to show the donors on posts  -------------------------------------------------------------------------------
create materialized view view_donation as select users.nickname, donation.amount, donation.date_donation, blog.id_blog
from donation
inner join users on donation.id_user = users.id_user
inner join blog on donation.id_blog = blog.id_blog
where extract(month from donation.date_donation) = extract(month from now())
group by users.nickname, donation.amount, donation.date_donation, blog.id_blog
order by donation.amount desc;

------------------------------------------------------------ trigger function to donation_trigger --------------------------------------------------
--create function on_donation() returns trigger
--$$
--    declare
--        rw record;
--    begin
--        
--        for rw in select user.nickname, donation.amount, donation.date_donation
--        from user
--        inner join donation on user.id_user = donation.id_user
--        where user.id_user = new.id_user
--        insert into view_donation values(rw.nickname, rw.amount, rw.date_donation)
--        insert into user_action values(default, rw.id_user, 'Donation', default);
--
--    end;
--$$ language plpgsql;
--
--
-------------------------------------------------------------- trigger to insert on view_donation --------------------------------------------------
--create trigger donation_trigger 
--after insert on donation
--for each row execute procedure on_donation();
--
--
------------------------------------------------------------- trigger function donation_view_trigger -------------------------------------------------
--create function on_view_donation() returns trigger
--$$
--    begin
--        raise notice 'Donacion: %', new.nickname;
--    end;
--$$ language plpgsql;
--
--
-------------------------------------------------------------- trigger to permit insert operations on  --------------------------------------------------
--create trigger donation_view_trigger
--after insert on view_donation
--execute procedure on_view_donation();


create or replace function get_donors(integer) returns table(
    nickname varchar(50),
    amount float,
    date_donation timestamp

) as
$$
    declare
        id_b alias for $1; 
    begin
        refresh materialized view view_donation;
        return query select 
        view_donation.nickname as nickname, 
        view_donation.amount as amount, 
        view_donation.date_donation as date_donation 
        from view_donation
        where view_donation.id_blog = id_b;
    end;
$$ language plpgsql;


--function trigger to before insert on donation evaluate if the user is on blog or not --------------------------------------------------------------------------------
create or replace function on_donate() returns trigger as
$$
    declare
        rw record;
    begin
        for rw in select * from user_blog where user_blog.id_user = new.id_user and user_blog.id_blog = new.id_blog loop
            if(rw.user_level = 'admin') then
                raise exception 'No puedes donar a un blog que eres administrador';
                return null;
            else 
                insert into donation values(default, new.id_user, new.id_blog, new.amount);
                insert into user_action values(default, new.id_user, 'Donation', default);
                refresh materialized view view_donation;
                return new;
            end if;
        end loop;
    end;
$$ language plpgsql;

create trigger donation_trigger 
before insert on donation
for each row execute procedure on_donate();



create function donate(integer, integer, float, varchar) returns void as
$$
    declare
        id_user alias for $1;
        id_blog alias for $2;
        amount  alias for $3;
        payment_method alias for $4;
        rw record;
    begin
        for rw in select * from user_blog where user_blog.id_user = id_user and user_blog.id_blog =  loop
            if(rw.user_level = 'admin')
            then
                raise exception 'No puedes donar';
            else 
                insert into donation values(default, id_user, id_blog, amount, now(), payment_method);
                insert into user_action values(default, id_user, 'donation', default);

            end if;
        end loop;
        
    end;
$$ language plpgsql;


create function ban_user(integer, integer, integer) returns void as
$$
    declare
        id_admin alias for $1;
        id_other alias for $2;
        id_b alias for $3;
        rw record;
        rw2 record;
    begin
        for rw in select * from user_blog where user_blog.id_user = id_admin and user_blog.id_blog = id_b loop
            if(rw.user_level = 'admin')
            then
                for rw2 in select * from user_blog where user_blog.id_user = id_other and user_bloc.id_bloc = id_b loop
                    if(rw2.user_level = 'admin')
                    then
                        raise exception 'No puedes banear a un administrador';
                    else
                        update user_blog set account_status = 'Blocked' where id_user = id_other;
                        insert into user_action values(default, id_admin, 'block', default);
                    end if;
                end loop;
            else
                raise exception 'No tienes permisos para banear';
            end if;
        end loop;

    end;
$$ language plpgsql;

create or replace function unban_user(integer, integer) returns void as
$$
    declare
        id_admin alias for $1;
        id_other alias for $2;
        rw record;
        rw2 record;
    begin
        for rw in select * from user_blog where user_blog.id_user = id_admin loop
            if(rw.user_level = 'admin')
            then
                for rw2 in select * from user_blog where user_blog.id_user = id_other loop
                    update user_blog set account_status = 'Active' where id_user = id_other;
                    insert into user_action values(default, id_admin, 'unblock', default);
                end loop;
            else
                raise exception 'No tienes permisos para desbanear';
            end if;
        end loop;

    end;
$$ language plpgsql;


---- function trigger to save user action 'logup' when do insert into users --------------------------------------------------
create or replace function on_logup() returns trigger as
$$
    begin
        insert into user_action values(default, new.id_user, 'logup', default);
        insert into logup values(default, new.id_user, now());
        return new;        
    end;
$$ language plpgsql;

create trigger logup_trigger 
after insert on users 
for each row execute procedure on_logup();


----function that will call from the backend to save the user action 'Login'
create function login(integer) returns void as
$$
    declare
        id_user alias for $1;
    begin
        insert into user_action values(default, id_user, 'login', default);        
    end;
$$ language plpgsql;


----fuction that will call from backend to save the user action 'Logout'
create function logout(integer) returns void as
$$
    declare
        id_user alias for $1;
    begin
        insert into user_action values(default, id_user, 'logout', default);        
    end;
$$ language plpgsql;

-- function trigger before insert evaluate if the user is admin or not, where only admin can create a new blog
create or replace function on_create_blog() returns trigger as
$$
    begin
        insert into user_action values(default, new.id_user, 'create_blog', default);
        insert into user_blog(id_user, id_blog, user_level, account_status) values(new.id_user, new.id_blog, 'admin', 'Active');
        return new;
    end;
$$ language plpgsql;

create trigger create_blog_trigger 
after insert on blog
for each row execute procedure on_create_blog();


-- function trigger before insert evaluate if the user is admin or not, where only admin can create a new blog
create or replace function on_create_post() returns trigger as
$$
    declare
        rw record;
    begin
        for rw in select * from user_blog where user_blog.id_user = new.id_user and user_blog.id_blog = new.id_blog loop
            if(rw.user_level = 'admin')
            then
                insert into user_action values(default, new.id_user, 'create_post', default);
                --insert into post(id_blog, id_user, title, content, date_post) values(new.id_blog, new.id_user, new.title, new.content, now());
                return new;
            else
                raise exception 'No tienes permisos para crear un post';
                return null;
            end if;
        end loop;
    end;
$$ language plpgsql;


create trigger create_post_trigger 
before insert on post
for each row execute procedure on_create_post();


create_post(1, 1, 'Tipos de datos en Flutter', 'En este tutorial vamos a aprender los tipos de datos que se pueden usar en Flutter', 'tipos_datos.png');
create_post(1, 1, 'Estructuras de control en Flutter', 'En este tutorial vamos a aprender las estructuras de control que se pueden usar en Flutter', 'estructuras_control.png');
create_post(1, 1, 'Variables en Flutter', 'En este tutorial vamos a aprender las variables que se pueden usar en Flutter', 'variables.png');
create_post(1, 1, 'Funciones en Flutter', 'En este tutorial vamos a aprender las funciones que se pueden usar en Flutter', 'funciones.png');
create_post(1, 1, 'Clases en Flutter', 'En este tutorial vamos a aprender las clases que se pueden usar en Flutter', 'clases.png');
create_post(1, 1, 'Objetos en Flutter', 'En este tutorial vamos a aprender los objetos que se pueden usar en Flutter', 'objetos.png');  

create_post(2, 2, 'Tipos de datos en React', 'En este tutorial vamos a aprender los tipos de datos que se pueden usar en React', 'tipos_datos.png');
create_post(2, 2, 'Estructuras de control en React', 'En este tutorial vamos a aprender las estructuras de control que se pueden usar en React', 'estructuras_control.png');
create_post(2, 2, 'Variables en React', 'En este tutorial vamos a aprender las variables que se pueden usar en React', 'variables.png');
create_post(2, 2, 'Funciones en React', 'En este tutorial vamos a aprender las funciones que se pueden usar en React', 'funciones.png');
create_post(2, 2, 'Clases en React', 'En este tutorial vamos a aprender las clases que se pueden usar en React', 'clases.png');
create_post(2, 2, 'Objetos en React', 'En este tutorial vamos a aprender los objetos que se pueden usar en React', 'objetos.png');

create_post(3, 3, 'Tipos de datos en Java', 'En este tutorial vamos a aprender los tipos de datos que se pueden usar en Java', 'tipos_datos.png');
create_post(3, 3, 'Estructuras de control en Java', 'En este tutorial vamos a aprender las estructuras de control que se pueden usar en Java', 'estructuras_control.png');
create_post(3, 3, 'Variables en Java', 'En este tutorial vamos a aprender las variables que se pueden usar en Java', 'variables.png');
create_post(3, 3, 'Funciones en Java', 'En este tutorial vamos a aprender las funciones que se pueden usar en Java', 'funciones.png');
create_post(3, 3, 'Clases en Java', 'En este tutorial vamos a aprender las clases que se pueden usar en Java', 'clases.png');
create_post(3, 3, 'Objetos en Java', 'En este tutorial vamos a aprender los objetos que se pueden usar en Java', 'objetos.png');



-- function trigger before insert comment evaluate if user is on the blog how normal user and post is part of the blog
create or replace function on_create_comment() returns trigger as
$$
    declare
        rw record;
        rw2 record;
    begin
        for rw in select * from post where post.id_post = new.id_post loop
            for rw2 in select * from user_blog where user_blog.id_blog = rw.id_blog and user_blog.id_user = new.id_user loop
                if(rw2.user_level = 'normal')
                then
                    insert into user_action values(default, new.id_user, 'create_comment', default);
                    --insert into post_comment(id_post, id_user, comment, date_creation) values(new.id_post, new.id_user, new.comment, now());
                    return new;
                else
                    raise exception 'No tienes permisos para crear un comentario';
                    return null;
                end if;
            end loop;
        end loop;
    end;
$$ language plpgsql;

create trigger create_comment_trigger
before insert on post_comment
for each row execute procedure on_create_comment();


create_comment(2, 1, 'Muchas gracias por este tutorial');
create_comment(3, 1, 'Gracias por este tutorial');
create_comment(4, 1, 'Gracias por este tutorial');
create_comment(5, 1, 'Gracias por este tutorial');
create_comment(6, 1, 'Gracias por este tutorial');
create_comment(7, 1, 'Gracias por este tutorial');
create_comment(8, 1, 'Gracias por este tutorial');
create_comment(9, 1, 'Gracias por este tutorial');
create_comment(10, 1, 'Gracias por este tutorial');


create function delete_comment(int, int, int) returns void
$$
    declare
        id_user int alias for $1;
        id_comment int alias for $2;
        rw record;
    begin
        for rw in select * from users where users.id_user = id_user
        if(rw.user_level = 'moderador' || rw.user_level = 'admin')
        then
            delete from post_comment where id_comment = id_comment;
            insert into user_action values(default, id_user, 'delete_comment', default);
            return 1;
        else
            raise exception 'No tienes permiso para eliminar comentarios';
        end if;
    end;
$$ language plpgsql;




create function delete_post(int, int) returns void
$$
    declare
        id_user int alias for $1;
        id_post int alias for $2;
        rw record;
    begin
        for rw in select * from users where users.id_user = id_user
        if(rw.user_level = 'admin')
        then
            delete from post where id_post = id_post;
            insert into user_action values(default, id_user, 'delete_post', default);
            return 1;
        else
            raise exception 'No tienes permiso para eliminar posts';
        end if;
    end;
$$ language plpgsql;


create function edit_post(int, int, varchar, varchar, varchar) returns void
$$
    declare
        id_user int alias for $1;
        id_post int alias for $2;
        title varchar alias for $3;
        content varchar alias for $4;
        image varchar alias for $5;
        rw record;
    begin
        for rw in select * from users where users.id_user = id_user
        if(rw.user_level = 'admin')
        then
            update post set title = title, content = content, image = image where id_post = id_post;
            insert into user_action values(default, id_user, 'edit_post', default);
            return 1;
        else
            raise exception 'No tienes permiso para editar posts';
        end if;
    end;
$$ language plpgsql;


create function edit_blog(int, int, varchar, varchar, varchar, varchar) returns void
$$
    declare
        id_user int alias for $1;
        id_blog int alias for $2;
        title varchar alias for $3;
        description varchar alias for $4;
        icon_blog varchar alias for $5;
        cover_blog varchar alias for $6;
        rw record;
    begin
        for rw in select * from users where users.id_user = id_user
        if(rw.user_level = 'admin')
        then
            update blog set title = title, description = description, icon_blog = icon_blog, cover_blog = cover_blog where id_blog = id_blog;
            insert into user_action values(default, id_user, 'edit_blog', default);
            return 1;
        else
            raise exception 'No tienes permiso para editar blogs';
        end if;
    end;
$$ language plpgsql;















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