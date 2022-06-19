

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



-- function trigger before insert evaluate if the user is admin or not, where only admin can create a new blog---------------------
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
---------------------------------------------------------------------------------------------------------------------------------------------




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
                insert into post(id_blog, id_user, title, content, date_post) values(new.id_blog, new.id_user, new.title, new.content, now());
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
--------------------------------------------------------------------------------------------------------------------------------------------------



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
--------------------------------------------------------------------------------------------------------------------------------------------------