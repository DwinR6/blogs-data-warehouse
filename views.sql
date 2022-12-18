create materialized view view_donation as select users.nickname, donation.amount, donation.date_donation, blog.id_blog
from donation
inner join users on donation.id_user = users.id_user
inner join blog on donation.id_blog = blog.id_blog
where extract(month from donation.date_donation) = extract(month from now())
group by users.nickname, donation.amount, donation.date_donation, blog.id_blog
order by donation.amount desc;
