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
--------------------------------------------------------------------------------------------------------------------------------



--------------------------------------------------------------------------------------------------------------------------------
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
--------------------------------------------------------------------------------------------------------------------------------



--------------------------------------------------------------------------------------------------------------------------------
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
-------------------------------------------------------------------------------------------------------------------------------




--------------------------------------------------------------------------------------------------------------------------------
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
----------------------------------------------------------------------------------------------------------------------------------



----function that will call from the backend to save the user action 'Login'-------------------------------------------------------
create function login(integer) returns void as
$$
    declare
        id_user alias for $1;
    begin
        insert into user_action values(default, id_user, 'login', default);        
    end;
$$ language plpgsql;
-----------------------------------------------------------------------------------------------------------------------------------




----fuction that will call from backend to save the user action 'Logout'----------------------------------------------------------
create function logout(integer) returns void as
$$
    declare
        id_user alias for $1;
    begin
        insert into user_action values(default, id_user, 'logout', default);        
    end;
$$ language plpgsql;}
-----------------------------------------------------------------------------------------------------------------------------------