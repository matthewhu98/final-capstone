drop table if exists images;
drop table if exists itinerary_landmarks;
drop table if exists itinerary;
drop table if exists landmark;
drop table if exists address;

CREATE TABLE itinerary
(
itinerary_id serial,
name varchar(32),
user_id int,

CONSTRAINT pk_itinerary PRIMARY KEY (itinerary_id),
CONSTRAINT fk_users FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE address
(
address_id serial,
street varchar(64),
building_num int,
postal_code int,
city varchar(32),
country varchar(32),

CONSTRAINT pk_address PRIMARY KEY (address_id)
);

CREATE TABLE landmark
(
landmark_id serial,
name varchar(32) NOT NULL,
summary varchar(128) NOT NULL,
description varchar(4000) NOT NULL,
img varchar (32) NOT NULL,
address_id int NOT NULL,

CONSTRAINT pk_landmark PRIMARY KEY (landmark_id),
CONSTRAINT fk_landmark_address FOREIGN KEY (address_id) REFERENCES address(address_id)
);

CREATE TABLE itinerary_landmarks
(
itinerary_id int,
landmark_id int,

CONSTRAINT pk_itinerary_landmarks PRIMARY KEY (itinerary_id, landmark_id),
CONSTRAINT fk_itinerary FOREIGN KEY (itinerary_id) REFERENCES itinerary(itinerary_id),
CONSTRAINT fk_landmark FOREIGN KEY (landmark_id) REFERENCES landmark(landmark_id)
);


CREATE TABLE images
(
landmark_id int,
image_name varchar(64),

CONSTRAINT pk_images PRIMARY KEY (image_name),
CONSTRAINT fk_landmark FOREIGN KEY (landmark_id) REFERENCES landmark(landmark_id)
);

INSERT INTO address (street, building_num, postal_code, city, country) VALUES
('Piazza del Colosseo', 1, 00184, 'Rome', 'Italy'),
('Piazza di Trevi', null , 00187, 'Rome', 'Italy'),
('Piazza di Spagna', null , 00187, 'Rome', 'Italy'),
('Piazza della Rotonda', null, 00186, 'Rome', 'Italy'),
('Via della Salara Vecchia', 5, 00186, 'Rome', 'Italy'),
(null, null, 00120, 'Vatican City', 'Vatican City'),
('Piazza Navona', null, 00186, 'Rome', 'Italy'),
('Via di San Gregorio', 30, 00186, 'Vatican City', 'Vatican City'),
('Città del Vaticano', null, null, 'Vatican City', 'Vatican City'),
('Search Results Viale delle Terme di Caracalla', null, 00153, 'Rome', 'Italy');

INSERT INTO landmark (name, summary, description, img, address_id) VALUES
('Colosseum', 'Iconic ancient Roman gladiatorial arena', 'The Colosseum or Coliseum, also known as the Flavian Amphitheatre, is an oval amphitheatre in the centre of the city of Rome, Italy. Built of travertine limestone, tuff, and brick-faced concrete, it was the largest amphitheatre ever built at the time and held 50,000 to 80,000 spectators.', 'colosseum-main.jpg', 1),
('Trevi Fountain', 'Iconic 18th century sculpted fountain', 'The Trevi Fountain is a fountain in the Trevi district in Rome, Italy, designed by Italian architect Nicola Salvi and completed by Giuseppe Pannini and several others. Standing 26.3 metres high and 49.15 metres wide, it is the largest Baroque fountain in the city and one of the most famous fountains in the world.', 'trevi-fountain-main.jpg', 2),
('Spanish Steps', 'Iconic baroque starway and meeting place', 'The Spanish Steps are a set of steps in Rome, Italy, climbing a steep slope between the Piazza di Spagna at the base and Piazza Trinità dei Monti, dominated by the Trinità dei Monti church at the top.', 'spanish-steps-main.jpg', 3),
('Pantheon', 'Landmark Roman church and historic tombs', 'The Pantheon is a former Roman temple, now a Catholic church, in Rome, Italy, on the site of an earlier temple commissioned by Marcus Agrippa during the reign of Augustus. It was rebuilt by the emperor Hadrian and probably dedicated about 126 AD. ', 'panthen-main.jpg', 4),
('Roman Forum', 'Excabated heart of the Roman Empire', 'The Roman Forum, also known by its Latin name Forum Romanum, is a rectangular forum surrounded by the ruins of several important ancient government buildings at the center of the city of Rome. Citizens of the ancient city referred to this space, originally a marketplace, as the Forum Magnum, or simply the Forum.', 'roman-forum-main.jpg', 5),
('Sistine Chapel', 'Michelangelo''s iconic painted ceiling', 'The Sistine Chapel is a chapel in the Apostolic Palace, the official residence of the pope, in Vatican City. Originally known as the Cappella Magna, the chapel takes its name from Pope Sixtus IV, who restored it between 1473 and 1481. Since that time, the chapel has served as a place of both religious and functionary papal activity.', 'sistine-chapel-main.jpg', 6),
('Piazza Navona','Elegant square with a fountain and bars','Piazza Navona is a public open space in Rome, Italy. It is built on the site of the Stadium of Domitian, built in the 1st century AD, and follows the form of the open space of the stadium. The ancient Romans went there to watch the agones, and hence it was known as "Circus Agonalis".','piazza-navona-main.jpg', 7),
('Palatine Hill','Historic area with Roman ruins','The Palatine Hill, which is the centremost of the Seven Hills of Rome, is one of the most ancient parts of the city and has been called "the first nucleus of the Roman Empire." The site is now mainly a large open-air museum while the Palatine Museum houses many finds from the excavations here and from other ancient Italian sites.','palatine-hill-main.jpg', 8),
('Saint Peter''s Square','Religous plaza with a fountain and obelisk','St. Peter''s Square is a large plaza located directly in front of St. Peter''s Basilica in the Vatican City, the papal enclave inside Rome, directly west of the neighborhood or rione of Borgo. Both the square and the basilica are named after Saint Peter, an apostle of Jesus considered by Catholics to be the first Pope.','saint-peters-square-main.jpg', 9),
('Baths of Caracalla','Ruins of a vast Roman bath complex','The Baths of Caracalla in Rome, Italy, were the city''s second largest Roman public baths, or thermae, likely built between AD 212 and 216/217, during the reigns of emperors Septimius Severus and Caracalla.','baths-of-caracalla-main.jpg', 10);

INSERT INTO itinerary(name, user_id) VALUES
('trip 1', 1),
('trip 2', 1);

INSERT INTO itinerary_landmarks(itinerary_id, landmark_id) VALUES
(1, 2),
(1, 3),
(2, 1),
(2, 2);

INSERT INTO images(landmark_id, image_name) VALUES
(1, 'colosseum-1.jpg'),
(1, 'colosseum-2.jpg'),
(1, 'colosseum-3.jpg'),
(1, 'colosseum-4.jpg'),
(1, 'colosseum-5.jpg'),

(2, 'trevi-fountain-1.jpg'),
(2, 'trevi-fountain-2.jpg'),
(2, 'trevi-fountain-3.jpg'),
(2, 'trevi-fountain-4.jpg'),
(2, 'trevi-fountain-5.jpg'),

(3, 'spanish-steps-1.jpg'),
(3, 'spanish-steps-2.jpg'),
(3, 'spanish-steps-3.jpg'),
(3, 'spanish-steps-4.jpg'),
(3, 'spanish-steps-5.jpg'),

(4, 'pantheon-1.jpg'),
(4, 'pantheon-2.jpg'),
(4, 'pantheon-3.jpg'),
(4, 'pantheon-4.jpg'),
(4, 'pantheon-5.jpg'),

(5, 'roman-forum-1.jpg'),
(5, 'roman-forum-2.jpg'),
(5, 'roman-forum-3.jpg'),
(5, 'roman-forum-4.jpg'),
(5, 'roman-forum-5.jpg'),

(6, 'sistine-chapel-1.jpg'),
(6, 'sistine-chapel-2.jpg'),
(6, 'sistine-chapel-3.jpg'),
(6, 'sistine-chapel-4.jpg'),
(6, 'sistine-chapel-5.jpg'),

(7, 'piazza-navona-1.jpg'),
(7, 'piazza-navona-2.jpg'),
(7, 'piazza-navona-3.jpg'),
(7, 'piazza-navona-4.jpg'),
(7, 'piazza-navona-5.jpg'),

(8, 'palatine-hill-1.jpg'),
(8, 'palatine-hill-2.jpg'),
(8, 'palatine-hill-3.jpg'),
(8, 'palatine-hill-4.jpg'),
(8, 'palatine-hill-5.jpg'),

(9, 'saint-peters-square-1.jpg'),
(9, 'saint-peters-square-2.jpg'),
(9, 'saint-peters-square-3.jpg'),
(9, 'saint-peters-square-4.jpg'),
(9, 'saint-peters-square-5.jpg'),

(10, 'baths-of-caracalla-1.jpg'),
(10, 'baths-of-caracalla-2.jpg'),
(10, 'baths-of-caracalla-3.jpg'),
(10, 'baths-of-caracalla-4.jpg'),
(10, 'baths-of-caracalla-5.jpg');

