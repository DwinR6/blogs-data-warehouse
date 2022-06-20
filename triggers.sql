

--function trigger to after insert on donation insert too in user_action --------------------------------------------------------------------------------
create or replace function on_donate() returns trigger as
$$
    declare
    begin
        insert into user_action values(default, new.id_user, 'donate', default);
        return new;
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
        insert into subscription_blog(id_user, id_blog, user_level, account_status) values(new.id_user, new.id_blog, 'admin', 'Active');
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
    begin
        insert into user_action values(default, new.id_user, 'create_post', default);
        return new;
    end;
$$ language plpgsql;


create trigger create_post_trigger 
before insert on post
for each row execute procedure on_create_post();
--------------------------------------------------------------------------------------------------------------------------------------------------



-- function trigger before insert comment evaluate if user is on the blog how normal user and post is part of the blog
create or replace function on_create_comment() returns trigger as
$$
    begin
        insert into user_action values(default, new.id_user, 'create_comment', default);
        return new;
    end;
$$ language plpgsql;

create trigger create_comment_trigger
before insert on post_comment
for each row execute procedure on_create_comment();
--------------------------------------------------------------------------------------------------------------------------------------------------