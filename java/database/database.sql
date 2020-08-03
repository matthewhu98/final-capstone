drop table if exists landmark;

CREATE TABLE landmark
(
        landmark_id serial,
        name varchar(32),
        summery varchar(128),
        discription varchar(4000),
        img varchar (32),
        
        CONSTRAINT pk_landmark PRIMARY KEY (landmark_id)      
);

