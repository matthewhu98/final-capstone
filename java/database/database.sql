drop table if exists landmark;
drop table if exists address;

CREATE TABLE address
(
<<<<<<< HEAD
address_id serial,
street varchar(32) NOT NULL,
building_num int,
postal_code int NOT NULL,
city varchar(32) NOT NULL,
country varchar(32) NOT NULL,

    CONSTRAINT pk_address PRIMARY KEY (address_id)
=======
        address_id serial,
        street varchar(32) NOT NULL,
        building_num int,
        postal_code int NOT NULL,
        city varchar(32) NOT NULL,
        country varchar(32) NOT NULL,
        
        CONSTRAINT pk_address PRIMARY KEY (address_id)

>>>>>>> f1b4c48e3c11ef9804f174c26016434fc2610263
);

CREATE TABLE landmark
(
<<<<<<< HEAD
landmark_id serial,
name varchar(32) NOT NULL,
summary varchar(128) NOT NULL,
description varchar(4000) NOT NULL,
img varchar (32) NOT NULL,
address_id int NOT NULL,

    CONSTRAINT pk_landmark PRIMARY KEY (landmark_id), 
    CONSTRAINT fk_landmark_address FOREIGN KEY (address_id) REFERENCES address(address_id)   
);

INSERT INTO address (street, building_num, postal_code, city, country) VALUES
('Piazza del Colosseo',1,00184, 'Rome', 'Italy'),
('Piazza di Trevi',null ,00187,'Rome','Italy'),
('Piazza di Spagna',null ,00187,'Rome','Italy');

INSERT INTO landmark (name, summary, description, img, address_id) VALUES
('Colosseum', 'A great historic place', 'The Colosseum or Coliseum, also known as the Flavian Amphitheatre, is an oval amphitheatre in the centre of the city of Rome, Italy. Built of travertine limestone, tuff, and brick-faced concrete, it was the largest amphitheatre ever built at the time and held 50,000 to 80,000 spectators.', '.jpg', 1),
('Trevi Fountian', 'A really cool fountian', 'The Trevi Fountain is a fountain in the Trevi district in Rome, Italy, designed by Italian architect Nicola Salvi and completed by Giuseppe Pannini and several others. Standing 26.3 metres high and 49.15 metres wide, it is the largest Baroque fountain in the city and one of the most famous fountains in the world.', '.jpg', 2),
('Spanish Steps', 'Some old steps', 'The Spanish Steps are a set of steps in Rome, Italy, climbing a steep slope between the Piazza di Spagna at the base and Piazza Trinità dei Monti, dominated by the Trinità dei Monti church at the top.', '.jpg', 3);
=======
        landmark_id serial,
        name varchar(32) NOT NULL,
        summary varchar(128) NOT NULL,
        description varchar(4000) NOT NULL,
        img varchar (32) NOT NULL,
        address_id int NOT NULL,
        
        CONSTRAINT pk_landmark PRIMARY KEY (landmark_id), 
        CONSTRAINT fk_landmark_address FOREIGN KEY (address_id) REFERENCES address(address_id)   
);

INSERT INTO address (street, building_num, postal_code, city, country) VALUES
        ('Piazza del Colosseo',1,00184, 'Rome', 'Italy'),
        ('Piazza di Trevi',null ,00187,'Rome','Italy'),
        ('Piazza di Spagna',null ,00187,'Rome','Italy');
        
INSERT INTO landmark (name, summary, discription, img, address_id) VALUES
        ('Colosseum', 'A great historic place', 'The Colosseum or Coliseum, also known as the Flavian Amphitheatre, is an oval amphitheatre in the centre of the city of Rome, Italy. Built of travertine limestone, tuff, and brick-faced concrete, it was the largest amphitheatre ever built at the time and held 50,000 to 80,000 spectators.', '.jpg', 1),
        ('Trevi Fountian', 'A really cool fountian', 'The Trevi Fountain is a fountain in the Trevi district in Rome, Italy, designed by Italian architect Nicola Salvi and completed by Giuseppe Pannini and several others. Standing 26.3 metres high and 49.15 metres wide, it is the largest Baroque fountain in the city and one of the most famous fountains in the world.', '.jpg', 2),
        ('Spanish Steps', 'Some old steps', 'The Spanish Steps are a set of steps in Rome, Italy, climbing a steep slope between the Piazza di Spagna at the base and Piazza Trinità dei Monti, dominated by the Trinità dei Monti church at the top.', '.jpg', 3);


        
>>>>>>> f1b4c48e3c11ef9804f174c26016434fc2610263
