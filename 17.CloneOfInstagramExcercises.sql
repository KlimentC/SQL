-- The queries will be executed here 


select * from users limit 15;

use cloneofinstagram;


-- Just a test
select * from users limit 15;

-- Get the 5 oldest members
 select * 
 from users
 order by created_at
 limit 5;
 
 
 -- Get the 5 newest members
 select * 
 from users
 order by created_at desc
 limit 5;
 
 -- What day of the week do most users register on
 select max(DAYNAME(created_at)), count(*)
 from users
 group by DAYNAME(created_at)
 limit 3;
 
 
 -- Find users who have never posted a photo
  select username from users
 left join photos on users.id = photos.user_id
 where photos.user_id is NULL;
 
-- Find users who have posted photos
select username from users
join photos on users.id = photos.user_id
where photos.id is not null
group by username;
 
 
 --  Who has most likes on a photo
 
select username, image_url, count(likes.user_id) as NumberOfLikes
from photos
join likes on photos.id=likes.photo_id
join users on photos.user_id=users.id
group by photos.id
order by NumberOfLikes desc;


-- Average number of posts per user



select count(photos.id)
from photos;

select count(users.id)
from users;

select(select count(photos.id)
from photos) /(   select count(users.id)
from users) as AvgPostsPerUser;


-- Top 5 most commonly used hashtags


select tag_name,tag_id, count(tag_id) as NumOfHashUsed
from photo_tags
join tags on tags.id=photo_tags.tag_id
group by tag_id
order by NumOfHashUsed desc
limit 5;




-- Find users who have liked every single photo on the site

select username,user_id,count(photo_id) as NumberOfPicturesLiked
from likes
join users on users.id = likes.user_id
group by user_id
having NumberOfPicturesLiked=count(likes.photo_id)
order by NumberOfPicturesLiked desc;




 
 
 
