-- Creation of the DB and also the tables

create database CloneOfInstagram;
use CloneOfInstagram;

CREATE TABLE users(id int PRIMARY KEY AUTO_INCREMENT,
                                      username varchar(255) UNIQUE NOT NULL,
                                                                   created_at timestamp DEFAULT NOW());

DESC users;



SELECT*
FROM users;


CREATE TABLE photos(id int PRIMARY KEY AUTO_INCREMENT,
                                       image_url varchar(255) NOT NULL,
                                                              user_id int NOT NULL,
                                                                          created_at timestamp DEFAULT NOW(),
                    FOREIGN KEY (user_id) REFERENCES users(id));




SELECT *
FROM photos;


SELECT photos.image_url,
       users.username
FROM photos
JOIN users ON photos.user_id = users.id;


CREATE TABLE comments(id int PRIMARY KEY AUTO_INCREMENT,
                                         comment_text varchar(255) NOT NULL,
                                                                   user_id int NOT NULL,
                                                                               photo_id int NOT NULL,
                                                                                            created_at timestamp DEFAULT NOW(),
                      FOREIGN KEY (user_id) REFERENCES users(id),
                      FOREIGN KEY (photo_id) REFERENCES photos(id));

DESC comments;




SELECT *
FROM comments;


CREATE TABLE likes(user_id int NOT NULL,
                               photo_id int NOT NULL,
                                            created_at timestamp DEFAULT NOW(),
                   FOREIGN KEY (user_id) REFERENCES users(id),
                   FOREIGN KEY (photo_id) REFERENCES photos(id), -- In order the like to be unique per post per user they will be unique because of the primary key below
 PRIMARY KEY(user_id,
             photo_id));




SELECT *
FROM likes;

-- This will not work now insert into likes(user_id, photo_id) values (1,1);

CREATE TABLE follows (follower_id int NOT NULL,
                                      followee_id int NOT NULL,
                                                      created_at timestamp DEFAULT now(),
                      FOREIGN KEY (follower_id) REFERENCES users(id),
                      FOREIGN KEY (followee_id) REFERENCES users(id),
                                                           PRIMARY KEY(follower_id,
                                                                       followee_id));





SELECT *
FROM follows;


CREATE TABLE tags(id int AUTO_INCREMENT PRIMARY KEY,
                                        tag_name varchar(255) UNIQUE,
                                                              created_at timestamp DEFAULT now());



CREATE TABLE photo_tags(photo_id int NOT NULL,
                                     tag_id int NOT NULL,
                        FOREIGN KEY (photo_id) REFERENCES photos(id),
                        FOREIGN KEY (tag_id) REFERENCES tags(id),
                                                        PRIMARY KEY(photo_id,
                                                                    tag_id));
