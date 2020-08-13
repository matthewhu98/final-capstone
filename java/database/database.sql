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
name varchar(64) NOT NULL,
summary varchar(128) NOT NULL,
description varchar(4000) NOT NULL,
img varchar (64) NOT NULL,
address_id int NOT NULL,
map_link varchar(4000),

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
('Piazza Navona', null, 00186, 'Rome', 'Italy'),
('Città del Vaticano', null, null, 'Vatican City', 'Vatican City'),
(null, null, 00120, 'Vatican City', 'Vatican City'),
('Piazza Venezia', null, null, 'Rome', 'Italy');

INSERT INTO landmark (name, summary, description, img, address_id, map_link) VALUES
('Colosseum', 'Iconic ancient Roman gladiatorial arena', 'The Colosseum or Coliseum, also known as the Flavian Amphitheatre, is an oval amphitheatre in the centre of the city of Rome, Italy. Built of travertine limestone, tuff, and brick-faced concrete, it was the largest amphitheatre ever built at the time and held 50,000 to 80,000 spectators.', 'colosseum-main.jpg', 1 , 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2970.1230738089853!2d12.490042215661843!3d41.890210179221214!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x132f61b6532013ad%3A0x28f1c82e908503c4!2sColosseum!5e0!3m2!1sen!2sus!4v1597086508274!5m2!1sen!2sus'),
('Trevi Fountain', 'Iconic 18th century sculpted fountain', 'The Trevi Fountain is a fountain in the Trevi district in Rome, Italy, designed by Italian architect Nicola Salvi and completed by Giuseppe Pannini and several others. Standing 26.3 metres high and 49.15 metres wide, it is the largest Baroque fountain in the city and one of the most famous fountains in the world.', 'trevi-fountain-main.jpg', 2,'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2969.6197902371746!2d12.481084265662115!3d41.90103327922048!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x132f6053278340d5%3A0xf676f1e1cc02bbb6!2sTrevi%20Fountain!5e0!3m2!1sen!2sus!4v1597093213427!5m2!1sen!2sus'),
('Spanish Steps', 'Iconic baroque starway and meeting place', 'The Spanish Steps are a set of steps in Rome, Italy, climbing a steep slope between the Piazza di Spagna at the base and Piazza Trinità dei Monti, dominated by the Trinità dei Monti church at the top.', 'spanish-steps-main.jpg', 3,'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2969.389515149601!2d12.480565665662265!3d41.905984579219805!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x132f60541678ae75%3A0x7fc0d4978aae690f!2sSpanish%20Steps!5e0!3m2!1sen!2sus!4v1597093369444!5m2!1sen!2sus'),
('Pantheon', 'Landmark Roman church and historic tombs', 'The Pantheon is a former Roman temple, now a Catholic church, in Rome, Italy, on the site of an earlier temple commissioned by Marcus Agrippa during the reign of Augustus. It was rebuilt by the emperor Hadrian and probably dedicated about 126 AD. ', 'pantheon-main.jpg', 4,'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2969.7324478011583!2d12.474684215662!3d41.89861077922055!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x132f604f678640a9%3A0xcad165fa2036ce2c!2sPantheon!5e0!3m2!1sen!2sus!4v1597093458820!5m2!1sen!2sus'),
('Roman Forum', 'Excabated heart of the Roman Empire', 'The Roman Forum, also known by its Latin name Forum Romanum, is a rectangular forum surrounded by the ruins of several important ancient government buildings at the center of the city of Rome. Citizens of the ancient city referred to this space, originally a marketplace, as the Forum Magnum, or simply the Forum.', 'roman-forum-main.jpg', 5,'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2970.0183579299696!2d12.483136315661856!3d41.892462279221!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x132f61b383a9cdef%3A0xfa914007c0ec7de6!2sRoman%20Forum!5e0!3m2!1sen!2sus!4v1597093519664!5m2!1sen!2sus'),
('Piazza Navona','Elegant square with a fountain and bars','Piazza Navona is a public open space in Rome, Italy. It is built on the site of the Stadium of Domitian, built in the 1st century AD, and follows the form of the open space of the stadium. The ancient Romans went there to watch the agones, and hence it was known as "Circus Agonalis".','piazza-navona-main.jpg', 6,'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2969.706754438092!2d12.470885515662035!3d41.8991632792205!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x132f6083c19d1c3d%3A0xa35724562e82334a!2sPiazza%20Navona!5e0!3m2!1sen!2sus!4v1597093622318!5m2!1sen!2sus'),
('Saint Peter''s Square','Religous plaza with a fountain and obelisk','St. Peter''s Square is a large plaza located directly in front of St. Peter''s Basilica in the Vatican City, the papal enclave inside Rome, directly west of the neighborhood or rione of Borgo. Both the square and the basilica are named after Saint Peter, an apostle of Jesus considered by Catholics to be the first Pope.','saint-peters-square-main.jpg', 7,'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1484.78204677911!2d12.455692708276477!3d41.90223089480502!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x132f6067b0ad3535%3A0xb0be9b5b5aad7258!2sPiazza%20San%20Pietro%2C%20Citt%C3%A0%20del%20Vaticano%2C%20Vatican%20City!5e0!3m2!1sen!2sus!4v1597093765545!5m2!1sen!2sus'),
('Sistine Chapel', 'Michelangelo''s iconic painted ceiling', 'The Sistine Chapel is a chapel in the Apostolic Palace, the official residence of the pope, in Vatican City. Originally known as the Cappella Magna, the chapel takes its name from Pope Sixtus IV, who restored it between 1473 and 1481. Since that time, the chapel has served as a place of both religious and functionary papal activity.', 'sistine-chapel-main.jpg', 8,'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1484.7653995364515!2d12.453389158244331!3d41.90294679480508!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x132f6065c523afdb%3A0xab16c8877fb53e22!2sSistine%20Chapel!5e0!3m2!1sen!2sus!4v1597093830858!5m2!1sen!2sus'),
('Victor Emmanuel', 'White marble memorial monument', 'The Victor Emmanuel II National Monument or Vittoriano, called Altare della Patria, is a national monument built in honour of Victor Emmanuel II, the first king of a unified Italy, located in Rome, Italy.','victor-emmanuel-monument-main.jpg', 9,'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1484.9566323685779!2d12.481915008276415!3d41.89472239480519!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x132f604d1b805de3%3A0x21154807a7b83fe1!2sAltar%20of%20the%20Fatherland!5e0!3m2!1sen!2sus!4v1597093909087!5m2!1sen!2sus');

INSERT INTO itinerary(name, user_id) VALUES
('Historic Ruins', 1),
('Cool Public Spaces', 1);

INSERT INTO itinerary_landmarks(itinerary_id, landmark_id) VALUES
(1, 1),
(1, 4),
(1, 5),
(2, 2),
(2, 3),
(2, 6),
(2, 7);

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

(6, 'piazza-navona-1.jpg'),
(6, 'piazza-navona-2.jpg'),
(6, 'piazza-navona-3.jpg'),
(6, 'piazza-navona-4.jpg'),
(6, 'piazza-navona-5.jpg'),

(7, 'saint-peters-square-1.jpg'),
(7, 'saint-peters-square-2.jpg'),
(7, 'saint-peters-square-3.jpg'),
(7, 'saint-peters-square-4.jpg'),
(7, 'saint-peters-square-5.jpg'),

(8, 'sistine-chapel-1.jpg'),
(8, 'sistine-chapel-2.jpg'),
(8, 'sistine-chapel-3.jpg'),
(8, 'sistine-chapel-4.jpg'),
(8, 'sistine-chapel-5.jpg'),

(9, 'victor-emmanuel-monument-1.jpg'),
(9, 'victor-emmanuel-monument-2.jpg'),
(9, 'victor-emmanuel-monument-3.jpg'),
(9, 'victor-emmanuel-monument-4.jpg'),
(9, 'victor-emmanuel-monument-5.jpg');




