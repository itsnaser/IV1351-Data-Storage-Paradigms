SET search_path TO soundgood, public;
BEGIN;
--#region 1.person
INSERT INTO person (personal_no,first_name,last_name)
VALUES
  /* Instructors */
  ('458623820265','Hakeem','Nash'),
  ('875694111150','Cedric','Weaver'),
  ('394944713963','Ori','Atkins'),
  ('973083737324','Nash','Webster'),
  ('549557484720','Lynn','Duncan'),
  ('713963549557','Ellis','Zero'),
  ('137167275583','Odom','Riko'),
  ('315692843725','Bonner','Roy'),
  /* Students */
  ('020917916761','Justin','Best'),
  ('734856659913','Hillary','Rodgers'),
  ('181169492830','Lewis','Gillespie'),
  ('925982542554','Jorden','Carey'),
  ('490385137167','Elmo','Lott'),
  ('672858627217','Jasper','Davenport'),
  ('264221315692','Keefe','Haley'),
  ('288636443481','Vivien','Ellis'),
  ('843725779762','Jack','Gilliam'),
  ('275583161161','Reagan','Odom'),
  ('291725123236','Joel','Cleveland'),
  ('251275348883','Dara','James'),
  ('156981559155','Jakeem','Abbott'),
  ('394486566668','Quinn','Cantrell'),
  ('727712662573','Rafael','Bonner'),
  ('511645955066','Uriel','Kaufman'),
  ('545887152443','Roth','Holt'),
  ('628049851148','Kiayada','Dunn'),
  ('117994864236','Branden','Rasmussen'),
  ('087941344391','Mark','Cobb'),
  ('236801570489','Alexander','Hickman'),
  ('344558288412','Camille','Berg'),
  ('125750731765','Deirdre','Coffey'),
  ('184179193248','Ashely','Buchanan'),
  ('766827699665','Branden','Blair');
--#endregion

--#region 2.student
INSERT INTO student (person_id)
VALUES
  (9),
  (10),
  (11),
  (12),
  (13),
  (14),
  (15),
  (16),
  (17),
  (18),
  (19),
  (20),
  (21),
  (22),
  (23),
  (24),
  (25),
  (26),
  (27),
  (28),
  (29),
  (30),
  (31),
  (32),
  (33);
--#endregion

--#region 3.instructor
INSERT INTO instructor (person_id,can_teach_ensemble)
VALUES
  (1,'Y'),
  (2,'N'),
  (3,'Y'),
  (4,'N'),
  (5,'Y'),
  (6,'Y'),
  (7,'Y'),
  (8,'Y');
--#endregion

--#region 4.email
INSERT INTO email (email_address,person_id)
VALUES
  /* Instructors */
  ('nunc.id@outlook.org',1),
  ('tellus.aenean.egestas@outlook.com',2),
  ('orci.in@yahoo.org',3),
  ('lorem.vitae@outlook.net',4),
  ('dolor.dolor@hotmail.org',5),
  ('eget.venenatis@protonmail.edu',6),
  ('id.libero@yahoo.ca',7),
  ('mauris.magna@yahoo.ca',8),
  /* Students */
  ('velit@google.edu',9),
  ('semper@aol.net',10),
  ('euismod.et@hotmail.com',11),
  ('cubilia.curae.donec@protonmail.couk',12),
  ('pede.nec@hotmail.com',13),
  ('mauris@aol.edu',14),
  ('facilisis@protonmail.net',15),
  ('quis.pede@hotmail.org',16),
  ('lacinia@yahoo.couk',17),
  ('dui.fusce@outlook.net',18),
  ('aliquam@outlook.couk',19),
  ('feugiat.sed.nec@aol.couk',20),
  ('ligula.nullam@google.org',21),
  ('luctus.vulputate@hotmail.org',22),
  ('mauris.blandit.mattis@hotmail.com',23),
  ('fringilla.donec@aol.ca',24),
  ('turpis@aol.edu',25),
  ('proin.eget.odio@hotmail.edu',26),
  ('enim.nisl@outlook.ca',27),
  ('sed@hotmail.edu',28),
  ('turpis.egestas.fusce@protonmail.net',29),
  ('eget.metus.eu@aol.couk',30),
  ('eget.masc@aol.couk',31),
  ('egcasca@aol.couk',32),
  ('odio.eu@aol.couk',33);
--#endregion

--#region phone_no
INSERT INTO phone_no (phone_no,person_id)
VALUES
  /* Instructors */
  ('0713154918',1),
  ('0741252134',2),
  ('0748421663',3),
  ('0768677676',4),
  ('0725696654',5),
  ('0741581887',6),
  ('0796588548',7),
  ('0777743483',8),
  /* Students */
  ('0785112552',9),
  ('0748773525',10),
  ('0713621718',11),
  ('0742656413',12),
  ('0724842021',13),
  ('0717033837',14),
  ('0712625258',15),
  ('0733945305',16),
  ('0727598520',17),
  ('0718241270',18),
  ('0715689586',19),
  ('0748955255',20),
  ('0797489181',21),
  ('0781282627',22),
  ('0739847445',23),
  ('0720492599',24),
  ('0758078545',25),
  ('0765767707',26),
  ('0791707184',27),
  ('0755008429',28),
  ('0787049728',29),
  ('0786717101',30),
  ('0786723261',31),
  ('0756717661',32),
  ('0781717341',33);
--#endregion

--#region 6.address
INSERT INTO address (street,zip,city)
VALUES
  ('Ap #221-8281 Mi Rd.','33270','Falun'),
  ('6685 Tincidunt Avenue','53357','Boo'),
  ('221-5999 Lacinia Road','94486','Täby'),
  ('P.O. Box 696, 3243 Eu Av.','08788','Borlänge'),
  ('288-6782 Cursus Street','57573','Motala'),
  ('272-8347 Ipsum Rd.','42674','Söderhamn'),
  ('Ap #265-7991 Vulputate, Rd.','20885','Söderhamn'),
  ('8167 Montes, Av.','27116','Vetlanda'),
  ('P.O. Box 444, 4667 Et, Av.','56717','Mjölby'),
  ('721-166 Montes, St.','40498','Nässjö'),
  ('991-1044 Lectus. St.','63853','Mora'),
  ('Ap #110-9031 Risus. St.','86791','Göteborg'),
  ('990-1868 Curabitur Rd.','38777','Mjölby'),
  ('663-3277 Adipiscing Street','08208','Tranås'),
  ('193-8205 Molestie Ave','63682','Sandviken'),
  ('252-5073 Magna. Rd.','88522','Stockholm'),
  ('4169 In Av.','45639','Värnamo'),
  ('131-8220 Dui Rd.','37027','Vetlanda'),
  ('906-3047 Quis Rd.','33886','Sandviken'),
  ('Ap #422-774 Nulla. Road','55321','Bollnäs'),
  ('879-5322 Convallis Rd.','56257','Bollnäs'),
  ('P.O. Box 354, 3356 Ullamcorper St.','22404','Tumba'),
  ('P.O. Box 831, 6548 Eleifend. Rd.','17712','Alingsås'),
  ('Ap #232-1726 Quisque Avenue','18354','Ockelbo'),
  ('282-4539 Aliquam St.','00487','Borås');
--#endregion

--#region 7.1.person_address
INSERT INTO person_address (person_id,address_id)
VALUES
  (1,1),
  (2,2),
  (3,3),
  (4,4),
  (5,5),
  (6,6),
  (7,7),
  (8,8);
--#endregion

--#region 7.2.person_address
INSERT INTO person_address (person_id,address_id)
VALUES
  (9,17),
  (10,19),
  (11,23),
  (12,11),
  (13,12),
  (14,19),
  (15,12),
  (16,23),
  (17,9),
  (18,15),
  (19,17),
  (20,11),
  (21,10),
  (22,10),
  (23,11),
  (24,21),
  (25,19),
  (26,18),
  (27,21),
  (28,22),
  (29,13),
  (30,23),
  (31,25),
  (32,16),
  (33,20);
--#endregion

--#region 8.contact_person
INSERT INTO contact_person (student_id,relation_to_student,phone_no,email)
VALUES
  (13,'ante. Nunc mauris','0772866147','at@outlook.com'),
  (17,'eget, ipsum. Donec sollicitudin adipiscing','0744016606','mattis.ornare.lectus@hotmail.com'),
  (16,'Aliquam ornare, libero at auctor ullamcorper,','0795218455','adipiscing.ligula.aenean@outlook.couk'),
  (18,'ipsum non arcu. Vivamus','0743771573','interdum.feugiat@aol.org'),
  (9,'ligula. Nullam enim. Sed','0755156032','dolor.egestas.rhoncus@outlook.com'),
  (21,'risus. Nunc ac sem ut dolor dapibus','0720177444','scelerisque.neque@icloud.couk'),
  (25,'fermentum vel, mauris. Integer','0716886467','pellentesque.habitant@yahoo.couk'),
  (20,'dolor. Donec fringilla. Donec feugiat metus sit','0758860360','est.ac.facilisis@aol.org');
--#endregion

--#region 9.sibling
INSERT INTO sibling (student_id,sibling_id)
VALUES
/* 
(amount_students) | student_id:s = amount_siblings
(8) | 2,3,4,5,8,14,21,24,26 = 0
(8) | 1,7,9,10,15,16,17,20 = 1
(2) | 6,22 = 2
(6) | 12,13,18,19,23,25 = 3
(1) | 11 = 4
*/
  (6,25),
  (9,12),
  (11,25),
  (11,23),
  (13,18),
  (13,19),
  (13,25),
  (15,11),
  (17,6),
  (18,16),
  (18,12),
  (19,1),
  (19,11),
  (20,23),
  (22,12),
  (22,7),
  (23,10);
--#endregion

--#region 10.instructor_working_time
INSERT INTO instructor_working_time (instructor_id, start_time, end_time)
VALUES

  -- Data for Week 49
  (1, '2024-12-02 08:00:00', '2024-12-02 17:00:00'),
  (2, '2024-12-02 08:00:00', '2024-12-02 17:00:00'),
  (3, '2024-12-02 08:00:00', '2024-12-02 17:00:00'),
  (4, '2024-12-02 08:00:00', '2024-12-02 17:00:00'),
  (5, '2024-12-02 08:00:00', '2024-12-02 17:00:00'),
  (6, '2024-12-02 08:00:00', '2024-12-02 17:00:00'),
  (7, '2024-12-02 08:00:00', '2024-12-02 17:00:00'),
  (8, '2024-12-02 08:00:00', '2024-12-02 17:00:00'),

  (1, '2024-12-03 08:00:00', '2024-12-03 17:00:00'),
  (2, '2024-12-03 08:00:00', '2024-12-03 17:00:00'),
  (3, '2024-12-03 08:00:00', '2024-12-03 17:00:00'),
  (4, '2024-12-03 08:00:00', '2024-12-03 17:00:00'),
  (5, '2024-12-03 08:00:00', '2024-12-03 17:00:00'),
  (6, '2024-12-03 08:00:00', '2024-12-03 17:00:00'),
  (7, '2024-12-03 08:00:00', '2024-12-03 17:00:00'),
  (8, '2024-12-03 08:00:00', '2024-12-03 17:00:00'),

  (1, '2024-12-04 08:00:00', '2024-12-04 17:00:00'),
  (2, '2024-12-04 08:00:00', '2024-12-04 17:00:00'),
  (3, '2024-12-04 08:00:00', '2024-12-04 17:00:00'),
  (4, '2024-12-04 08:00:00', '2024-12-04 17:00:00'),
  (5, '2024-12-04 08:00:00', '2024-12-04 17:00:00'),
  (6, '2024-12-04 08:00:00', '2024-12-04 17:00:00'),
  (7, '2024-12-04 08:00:00', '2024-12-04 17:00:00'),
  (8, '2024-12-04 08:00:00', '2024-12-04 17:00:00'),

  (1, '2024-12-05 08:00:00', '2024-12-05 17:00:00'),
  (2, '2024-12-05 08:00:00', '2024-12-05 17:00:00'),
  (3, '2024-12-05 08:00:00', '2024-12-05 17:00:00'),
  (4, '2024-12-05 08:00:00', '2024-12-05 17:00:00'),
  (5, '2024-12-05 08:00:00', '2024-12-05 17:00:00'),
  (6, '2024-12-05 08:00:00', '2024-12-05 17:00:00'),
  (7, '2024-12-05 08:00:00', '2024-12-05 17:00:00'),
  (8, '2024-12-05 08:00:00', '2024-12-05 17:00:00'),
  
  (1, '2024-12-06 08:00:00', '2024-12-06 17:00:00'),
  (2, '2024-12-06 08:00:00', '2024-12-06 17:00:00'),
  (3, '2024-12-06 08:00:00', '2024-12-06 17:00:00'),
  (4, '2024-12-06 08:00:00', '2024-12-06 17:00:00'),
  (5, '2024-12-06 08:00:00', '2024-12-06 17:00:00'),
  (6, '2024-12-06 08:00:00', '2024-12-06 17:00:00'),
  (7, '2024-12-06 08:00:00', '2024-12-06 17:00:00'),
  (8, '2024-12-06 08:00:00', '2024-12-06 17:00:00'),

  (1, '2024-12-07 08:00:00', '2024-12-07 17:00:00'),
  (2, '2024-12-07 08:00:00', '2024-12-07 17:00:00'),
  (3, '2024-12-07 08:00:00', '2024-12-07 17:00:00'),
  (4, '2024-12-07 08:00:00', '2024-12-07 17:00:00'),
  (5, '2024-12-07 08:00:00', '2024-12-07 17:00:00'),
  (6, '2024-12-07 08:00:00', '2024-12-07 17:00:00'),
  (7, '2024-12-07 08:00:00', '2024-12-07 17:00:00'),
  (8, '2024-12-07 08:00:00', '2024-12-07 17:00:00'),

  (1, '2024-12-08 08:00:00', '2024-12-08 17:00:00'),
  (2, '2024-12-08 08:00:00', '2024-12-08 17:00:00'),
  (3, '2024-12-08 08:00:00', '2024-12-08 17:00:00'),
  (4, '2024-12-08 08:00:00', '2024-12-08 17:00:00'),
  (5, '2024-12-08 08:00:00', '2024-12-08 17:00:00'),
  (6, '2024-12-08 08:00:00', '2024-12-08 17:00:00'),
  (7, '2024-12-08 08:00:00', '2024-12-08 17:00:00'),
  (8, '2024-12-08 08:00:00', '2024-12-08 17:00:00'),

  -- Data for Week 50
  (1, '2024-12-09 08:00:00', '2024-12-09 17:00:00'),
  (2, '2024-12-09 08:00:00', '2024-12-09 17:00:00'),
  (3, '2024-12-09 08:00:00', '2024-12-09 17:00:00'),
  (4, '2024-12-09 08:00:00', '2024-12-09 17:00:00'),
  (5, '2024-12-09 08:00:00', '2024-12-09 17:00:00'),
  (6, '2024-12-09 08:00:00', '2024-12-09 17:00:00'),
  (7, '2024-12-09 08:00:00', '2024-12-09 17:00:00'),
  (8, '2024-12-09 08:00:00', '2024-12-09 17:00:00'),

  (1, '2024-12-10 08:00:00', '2024-12-10 17:00:00'),
  (2, '2024-12-10 08:00:00', '2024-12-10 17:00:00'),
  (3, '2024-12-10 08:00:00', '2024-12-10 17:00:00'),
  (4, '2024-12-10 08:00:00', '2024-12-10 17:00:00'),
  (5, '2024-12-10 08:00:00', '2024-12-10 17:00:00'),
  (6, '2024-12-10 08:00:00', '2024-12-10 17:00:00'),
  (7, '2024-12-10 08:00:00', '2024-12-10 17:00:00'),
  (8, '2024-12-10 08:00:00', '2024-12-10 17:00:00'),

  (1, '2024-12-11 08:00:00', '2024-12-11 17:00:00'),
  (2, '2024-12-11 08:00:00', '2024-12-11 17:00:00'),
  (3, '2024-12-11 08:00:00', '2024-12-11 17:00:00'),
  (4, '2024-12-11 08:00:00', '2024-12-11 17:00:00'),
  (5, '2024-12-11 08:00:00', '2024-12-11 17:00:00'),
  (6, '2024-12-11 08:00:00', '2024-12-11 17:00:00'),
  (7, '2024-12-11 08:00:00', '2024-12-11 17:00:00'),
  (8, '2024-12-11 08:00:00', '2024-12-11 17:00:00'),

  (1, '2024-12-12 08:00:00', '2024-12-12 17:00:00'),
  (2, '2024-12-12 08:00:00', '2024-12-12 17:00:00'),
  (3, '2024-12-12 08:00:00', '2024-12-12 17:00:00'),
  (4, '2024-12-12 08:00:00', '2024-12-12 17:00:00'),
  (5, '2024-12-12 08:00:00', '2024-12-12 17:00:00'),
  (6, '2024-12-12 08:00:00', '2024-12-12 17:00:00'),
  (7, '2024-12-12 08:00:00', '2024-12-12 17:00:00'),
  (8, '2024-12-12 08:00:00', '2024-12-12 17:00:00'),
  
  (1, '2024-12-13 08:00:00', '2024-12-13 17:00:00'),
  (2, '2024-12-13 08:00:00', '2024-12-13 17:00:00'),
  (3, '2024-12-13 08:00:00', '2024-12-13 17:00:00'),
  (4, '2024-12-13 08:00:00', '2024-12-13 17:00:00'),
  (5, '2024-12-13 08:00:00', '2024-12-13 17:00:00'),
  (6, '2024-12-13 08:00:00', '2024-12-13 17:00:00'),
  (7, '2024-12-13 08:00:00', '2024-12-13 17:00:00'),
  (8, '2024-12-13 08:00:00', '2024-12-13 17:00:00'),

  (1, '2024-12-14 08:00:00', '2024-12-14 17:00:00'),
  (2, '2024-12-14 08:00:00', '2024-12-14 17:00:00'),
  (3, '2024-12-14 08:00:00', '2024-12-14 17:00:00'),
  (4, '2024-12-14 08:00:00', '2024-12-14 17:00:00'),
  (5, '2024-12-14 08:00:00', '2024-12-14 17:00:00'),
  (6, '2024-12-14 08:00:00', '2024-12-14 17:00:00'),
  (7, '2024-12-14 08:00:00', '2024-12-14 17:00:00'),
  (8, '2024-12-14 08:00:00', '2024-12-14 17:00:00'),

  (1, '2024-12-15 08:00:00', '2024-12-15 17:00:00'),
  (2, '2024-12-15 08:00:00', '2024-12-15 17:00:00'),
  (3, '2024-12-15 08:00:00', '2024-12-15 17:00:00'),
  (4, '2024-12-15 08:00:00', '2024-12-15 17:00:00'),
  (5, '2024-12-15 08:00:00', '2024-12-15 17:00:00'),
  (6, '2024-12-15 08:00:00', '2024-12-15 17:00:00'),
  (7, '2024-12-15 08:00:00', '2024-12-15 17:00:00'),
  (8, '2024-12-15 08:00:00', '2024-12-15 17:00:00');
--#endregion

--#region 11.instrument_type
INSERT INTO instrument_type (name)
VALUES
  ('Guitar'),
  ('Saxophone'),
  ('Flute'),
  ('Violin'),
  ('Clarinet'),
  ('Piano'),
  ('Trumpet'),
  ('Drums'),
  ('Bass guitar'),
  ('Cello'),
  ('Accordion'),
  ('Harp'),
  ('Mandolin'),
  ('Harmonica'),
  ('Trombone');
--#endregion

--#region 12.instrument
INSERT INTO instrument (brand,monthly_fee,type_id)
VALUES
  ('Leblanc Bliss L225S',280,5),
  ('Yamaha YAS-280 Alto',183,2),
  ('Yamaha P-125A',224,6),
  ('Taylor 214ce',224,1),
  ('Yamaha YSL-354 Tenor',102,15),
  ('Fender Precision Bass',250,9),
  ('Eastman MD315',275,13),
  ('Gibson F-5 Master Model',131,13),
  ('Kawai ES920',169,6),
  ('Selmer AS42 Alto',234,2),
  ('Pearl Roadshow',165,8),
  ('Yamaha YTR-2330',226,7),
  ('Yamaha Stage Custom Birch',161,8),
  ('DW Collectors Series',167,8),
  ('Hohner Bravo III 120',195,11),
  ('Lyon & Healy Prelude 40',201,12),
  ('Yamaha YFL-222',245,3),
  ('Gibson Les Paul Standard',286,1),
  ('Bach 42BO Stradivarius Professional',206,15),
  ('Camac Aziliz',108,12),
  ('Bach TR600 Bb',177,7),
  ('Conn 88H Tenor',197,15),
  ('Yamaha VC5S',281,10),
  ('Azumi AZ3',279,3),
  ('Jupiter JAS-769 Alto',293,2),
  ('Collings MF',128,13),
  ('Fender Stratocaster',101,1),
  ('Cecilio CCO-500',221,10),
  ('Hohner Marine Band 1896',226,14),
  ('Ludwig Breakbeats by Questlove',275,8),
  ('Yamaha YCL-255',156,5),
  ('Eastman VC305',298,10),
  ('Yamaha YVN Model 2',120,4),
  ('Roland FR-4X',281,11),
  ('Tama Imperialstar',245,8),
  ('Kentucky KM-272',293,13),
  ('Michael Kelly Legacy Special',267,13),
  ('Scott Cao 750 Series',210,4),
  ('Roland TD-27KV',254,8),
  ('Suzuki Promaster MR-350',142,14),
  ('Gretsch Catalina Maple',177,8),
  ('Seydel 1847 Classic',215,14),
  ('Alesis Nitro Mesh Kit',125,8),
  ('Buffet Crampon E11',277,5),
  ('Stradivari Model (Stentor SR 1600)',164,4),
  ('Stradivarius Replica (by Jay Haide)',171,10),
  ('Selmer CL211',198,5),
  ('Scandalli Super VI',182,11),
  ('Antonio Stradivari Copy (Maggini Model)',126,4),
  ('Recording King RM-25',292,13),
  ('Roland FP-30X',163,6),
  ('Buffet Crampon R13',112,5),
  ('Conn 1B Professional Bb',201,7),
  ('Conn 880 Tenor',238,2),
  ('PDP Concept Maple',175,8),
  ('Getzen 590-S Eterna Bb',264,7),
  ('Yanagisawa SC-991 Soprano',183,2),
  ('Sonor SQ2',259,8),
  ('Jupiter JTB700 Tenor',245,15),
  ('Yamaha U1 Upright',286,6);
--#endregion

--#region 13.rental_period
INSERT INTO rental_period (student_id, instrument_id, rented_from, rented_until, termination_date)
VALUES
-- Rentals that has been endded
(9, 4,  '2024-03-01', '2025-03-01', '2024-09-01'),
(10, 5, '2024-04-01', '2025-04-01', '2024-10-01'),

-- Rentals active today
(11, 6, '2024-07-01', '2025-07-01', NULL),
(12, 7, '2024-06-15', '2025-06-15', NULL),
(13, 8, '2024-05-20', '2025-05-20', NULL),
(14, 9, '2024-08-01', '2025-08-01', NULL),
(15, 10,'2024-09-01', '2025-09-01', NULL),

-- Same student with two active rentals (ensuring no conflict)
(16, 16, '2024-08-15', '2025-08-15', NULL),
(17, 17, '2024-07-10', '2025-07-10', NULL),

-- Additional rows ensuring variety
(18, 18, '2024-06-01', '2025-06-01', NULL),
(19, 19, '2024-05-01', '2025-02-01', NULL),
(20, 20, '2024-04-01', '2025-01-01', NULL),

-- Students with two rentals that don't overlap
(21, 21, '2024-02-01', '2025-02-01', NULL),
(21, 22, '2024-07-01', '2025-07-01', NULL),
(22, 23, '2024-01-01', '2025-01-01', NULL),
(22, 24, '2024-06-01', '2025-06-01', NULL),
(23, 25, '2024-09-01', '2025-09-01', NULL),
(23, 26, '2024-09-01', '2025-09-01', NULL);
--#endregion

--#region 14.pricing_scheme
INSERT INTO pricing_scheme (lesson_price,instructor_payment,lesson_level,lesson_type,sibling_discount,valid_since)
	VALUES
	(200,50,'Beginner','Individual',30,NOW()),
	(150,50,'Beginner','Group',20,NOW()),
	(100,50,'Beginner','Ensemble',10,NOW()),
	
	(250,50,'Intermediate','Individual',25,NOW()),
	(200,50,'Intermediate','Group',15,NOW()),
	(150,50,'Intermediate','Ensemble',5,NOW()),
	
	(300,50,'Advanced','Individual',20,NOW()),
	(250,50,'Advanced','Group',10,NOW()),
	(200,50,'Advanced','Ensemble',0,NOW());
--#endregion

--#region 15.lesson
INSERT INTO lesson (start_time, end_time, level, type, instructor_id)
VALUES
-- #15 lessons
('2024-10-30 08:00:00', '2024-10-30 09:30:00', 'Beginner', 'Individual', 3),
('2024-10-30 10:00:00', '2024-10-30 11:00:00', 'Intermediate', 'Group', 2),
('2024-10-30 12:00:00', '2024-10-30 13:00:00', 'Advanced', 'Ensemble', 1),
('2024-10-01 09:00:00', '2024-10-01 10:30:00', 'Beginner', 'Group', 4),
('2024-10-01 11:00:00', '2024-10-01 12:00:00', 'Intermediate', 'Individual', 5),

('2024-11-02 14:00:00', '2024-11-02 15:30:00', 'Advanced', 'Ensemble', 1),
('2024-11-02 16:00:00', '2024-11-02 17:30:00', 'Beginner', 'Group', 2),
('2024-11-03 08:00:00', '2024-11-03 09:30:00', 'Intermediate', 'Individual', 3),
('2024-11-03 10:00:00', '2024-11-03 11:30:00', 'Advanced', 'Group', 4),
('2024-11-03 12:00:00', '2024-11-03 13:30:00', 'Beginner', 'Ensemble', 5),

('2024-12-04 07:00:00', '2024-12-04 08:30:00', 'Intermediate', 'Group', 1),
('2024-12-04 09:00:00', '2024-12-04 10:30:00', 'Advanced', 'Individual', 2),
('2024-12-04 11:00:00', '2024-12-04 12:30:00', 'Beginner', 'Group', 4),
('2024-12-05 15:00:00', '2024-12-05 16:30:00', 'Intermediate', 'Ensemble', 3),
('2024-12-05 17:00:00', '2024-12-05 18:30:00', 'Advanced', 'Group', 5),

-- Test for ensembles
-- 2024 Week 48 - #10 lessons
('2024-11-27 16:00:00', '2024-11-27 17:30:00', 'Beginner', 'Ensemble', 1),
('2024-11-29 10:00:00', '2024-11-29 11:30:00', 'Advanced', 'Ensemble', 1),
('2024-11-25 14:00:00', '2024-11-25 15:30:00', 'Advanced', 'Ensemble', 1),
('2024-11-27 16:00:00', '2024-11-27 17:30:00', 'Beginner', 'Ensemble', 1),

('2024-11-29 12:00:00', '2024-11-29 13:30:00', 'Beginner', 'Ensemble', 3),
('2024-11-27 08:00:00', '2024-11-27 09:30:00', 'Intermediate', 'Ensemble', 3),
('2024-11-25 14:00:00', '2024-11-25 15:30:00', 'Advanced', 'Ensemble', 3),
('2024-11-27 08:00:00', '2024-11-27 09:30:00', 'Intermediate', 'Ensemble', 3),

('2024-11-29 10:00:00', '2024-11-29 11:30:00', 'Advanced', 'Ensemble', 5),
('2024-11-29 12:00:00', '2024-11-29 13:30:00', 'Beginner', 'Ensemble', 5),

-- 2024 Week 49 -- #25 lessons
('2024-12-02 14:00:00', '2024-12-02 15:30:00', 'Advanced', 'Ensemble', 1),
('2024-12-02 10:00:00', '2024-12-02 11:30:00', 'Beginner', 'Ensemble', 1),
('2024-12-06 10:00:00', '2024-12-06 11:30:00', 'Advanced', 'Ensemble', 1),
('2024-12-04 10:00:00', '2024-12-04 11:30:00', 'Intermediate', 'Ensemble', 1),
('2024-12-05 10:00:00', '2024-12-05 11:30:00', 'Advanced', 'Ensemble', 1),
('2024-12-07 10:00:00', '2024-12-07 11:30:00', 'Intermediate', 'Ensemble', 1),

('2024-12-02 08:00:00', '2024-12-02 09:30:00', 'Intermediate', 'Ensemble', 3),
('2024-12-02 08:00:00', '2024-12-02 09:30:00', 'Intermediate', 'Ensemble', 3),
('2024-12-03 10:00:00', '2024-12-03 11:30:00', 'Advanced', 'Ensemble', 3),
('2024-12-04 10:00:00', '2024-12-04 11:30:00', 'Advanced', 'Ensemble', 3),
('2024-12-04 10:00:00', '2024-12-04 11:30:00', 'Beginner', 'Ensemble', 3),
('2024-12-06 10:00:00', '2024-12-06 11:30:00', 'Beginner', 'Ensemble', 3),
('2024-12-08 10:00:00', '2024-12-08 11:30:00', 'Advanced', 'Ensemble', 3),

('2024-12-03 12:00:00', '2024-12-03 13:30:00', 'Advanced', 'Ensemble', 5),
('2024-12-04 15:00:00', '2024-12-04 16:30:00', 'Beginner', 'Ensemble', 5),
('2024-12-04 12:00:00', '2024-12-04 13:30:00', 'Beginner', 'Ensemble', 5),
('2024-12-05 12:00:00', '2024-12-05 13:30:00', 'Intermediate', 'Ensemble', 5),
('2024-12-06 12:00:00', '2024-12-06 13:30:00', 'Intermediate', 'Ensemble', 5),
('2024-12-07 12:00:00', '2024-12-07 13:30:00', 'Beginner', 'Ensemble', 5),
('2024-12-08 12:00:00', '2024-12-08 13:30:00', 'Advanced', 'Ensemble', 5),

('2024-12-02 14:00:00', '2024-12-02 15:30:00', 'Beginner', 'Ensemble', 6),

('2024-12-02 14:00:00', '2024-12-02 15:30:00', 'Intermediate', 'Ensemble', 7),
('2024-12-02 14:00:00', '2024-12-02 15:30:00', 'Advanced', 'Ensemble', 7),

('2024-12-02 14:00:00', '2024-12-02 15:30:00', 'Beginner', 'Ensemble', 8),
('2024-12-02 14:00:00', '2024-12-02 15:30:00', 'Intermediate', 'Ensemble', 8),

-- 2024 Week 50 -- #25 lessons
('2024-12-09 14:00:00', '2024-12-09 15:30:00', 'Advanced', 'Ensemble', 1),
('2024-12-09 10:00:00', '2024-12-09 11:30:00', 'Beginner', 'Ensemble', 1),
('2024-12-10 10:00:00', '2024-12-10 11:30:00', 'Advanced', 'Ensemble', 1),
('2024-12-11 10:00:00', '2024-12-11 11:30:00', 'Intermediate', 'Ensemble', 1),
('2024-12-12 10:00:00', '2024-12-12 11:30:00', 'Advanced', 'Ensemble', 1),
('2024-12-14 10:00:00', '2024-12-14 11:30:00', 'Intermediate', 'Ensemble', 1),

('2024-12-09 08:00:00', '2024-12-09 09:30:00', 'Intermediate', 'Ensemble', 3),
('2024-12-09 08:00:00', '2024-12-09 09:30:00', 'Intermediate', 'Ensemble', 3),
('2024-12-10 10:00:00', '2024-12-10 11:30:00', 'Advanced', 'Ensemble', 3),
('2024-12-11 10:00:00', '2024-12-11 11:30:00', 'Advanced', 'Ensemble', 3),
('2024-12-11 10:00:00', '2024-12-11 11:30:00', 'Beginner', 'Ensemble', 3),
('2024-12-13 10:00:00', '2024-12-13 11:30:00', 'Beginner', 'Ensemble', 3),
('2024-12-15 10:00:00', '2024-12-15 11:30:00', 'Advanced', 'Ensemble', 3),

('2024-12-10 12:00:00', '2024-12-10 13:30:00', 'Advanced', 'Ensemble', 5),
('2024-12-11 15:00:00', '2024-12-11 16:30:00', 'Beginner', 'Ensemble', 5),
('2024-12-11 12:00:00', '2024-12-11 13:30:00', 'Beginner', 'Ensemble', 5),
('2024-12-12 12:00:00', '2024-12-12 13:30:00', 'Intermediate', 'Ensemble', 5),
('2024-12-13 12:00:00', '2024-12-13 13:30:00', 'Intermediate', 'Ensemble', 5),
('2024-12-14 12:00:00', '2024-12-14 13:30:00', 'Beginner', 'Ensemble', 5),
('2024-12-15 12:00:00', '2024-12-15 13:30:00', 'Advanced', 'Ensemble', 5),

('2024-12-09 14:00:00', '2024-12-09 15:30:00', 'Advanced', 'Ensemble', 6),

('2024-12-09 14:00:00', '2024-12-09 15:30:00', 'Intermediate', 'Ensemble', 7),
('2024-12-09 14:00:00', '2024-12-09 15:30:00', 'Advanced', 'Ensemble', 7),

('2024-12-09 14:00:00', '2024-12-09 15:30:00', 'Intermediate', 'Ensemble', 8),
('2024-12-09 14:00:00', '2024-12-09 15:30:00', 'Advanced', 'Ensemble', 8);
--#endregion

--#region 16.individual_lesson
INSERT INTO individual_lesson (lesson_id, student_id, instrument_id)
SELECT 
    l.id AS lesson_id,
    (SELECT id FROM student ORDER BY RANDOM() LIMIT 1) AS student_id,
    (SELECT id FROM instrument_type ORDER BY RANDOM() LIMIT 1) AS instrument_id
FROM lesson l
WHERE l.type = 'Individual';
--#endregion

--#region 17.group_lesson
INSERT INTO group_lesson (lesson_id, instrument_id, max_num_of_students, min_num_of_students)
SELECT 
    l.id AS lesson_id,
    (SELECT id FROM instrument_type ORDER BY RANDOM() LIMIT 1) AS instrument_id,
    FLOOR(RANDOM() * (12 - 9 + 1) + 9) AS max_num_of_students, -- Random between 9 and 12
    FLOOR(RANDOM() * (8 - 5 + 1) + 5) AS min_num_of_students -- Random between 5 and 8
FROM lesson l
WHERE l.type = 'Group';
--#endregion

--#region 18.ensemble_lesson
INSERT INTO ensemble_lesson (lesson_id, target_genre, max_num_of_students, min_num_of_students)
SELECT 
    l.id AS lesson_id,
    (array['Jazz', 'Classical', 'Rock', 'Pop'])[floor(random() * 4 + 1)]AS target_genre,
    FLOOR(RANDOM() * (12 - 9 + 1) + 9) AS max_num_of_students, -- Random between 9 and 12
    FLOOR(RANDOM() * (8 - 5 + 1) + 5) AS min_num_of_students -- Random between 5 and 8
FROM lesson l
WHERE l.type = 'Ensemble';
--#endregion

--#region 19.student_group
INSERT INTO student_group (lesson_id, student_id)
SELECT 
    gl.lesson_id AS lesson_id,
    s.id AS student_id
FROM group_lesson gl
CROSS JOIN LATERAL (
    SELECT id 
    FROM student 
    ORDER BY RANDOM() 
    LIMIT FLOOR(RANDOM() * (gl.max_num_of_students - gl.min_num_of_students + 1) + gl.min_num_of_students) -- Random number of students between max and min for each lesson_id
) s;
--#endregion

--#region 20.student_ensemble
INSERT INTO student_ensemble (lesson_id, student_id)
SELECT 
    el.lesson_id AS lesson_id,
    s.id AS student_id
FROM ensemble_lesson el
CROSS JOIN LATERAL (
    SELECT id 
    FROM student 
    ORDER BY RANDOM() 
    LIMIT FLOOR(RANDOM() * (el.max_num_of_students - el.min_num_of_students + 1) + el.min_num_of_students) -- Random number of students between max and min for each lesson_id
) s;
--#endregion

COMMIT;