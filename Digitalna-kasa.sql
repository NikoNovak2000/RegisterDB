DROP DATABASE digitalna_kasa;
CREATE DATABASE digitalna_kasa;

USE digitalna_kasa;


CREATE TABLE poslodavac (
	id INTEGER PRIMARY KEY NOT NULL,
    ime VARCHAR(15) NOT NULL,
    prezime VARCHAR(20) NOT NULL,
    datum_rodenja DATETIME NOT NULL,
    oib CHAR(11) NOT NULL
);


CREATE TABLE radnik (
	id INTEGER PRIMARY KEY NOT NULL,
    ime VARCHAR(15) NOT NULL,
    prezime VARCHAR(20) NOT NULL,
    datum_rodenja DATETIME NOT NULL,
    oib CHAR(11) NOT NULL,
    id_poslodavac INTEGER NOT NULL
);

CREATE TABLE proizvodac (
	id INTEGER PRIMARY KEY NOT NULL,
    ime VARCHAR(60) NOT NULL,
    ime_drzave VARCHAR(50) NOT NULL,
    god_nastanka_komp SMALLINT NOT NULL
);

CREATE TABLE proizvod (
	id INTEGER PRIMARY KEY NOT NULL,
    ime VARCHAR(50) NOT NULL,
    sifra CHAR(8) NOT NULL,
    id_kolicina INTEGER NOT NULL DEFAULT 1,
    id_proizvodac INTEGER NOT NULL,
    id_vrstaproizvoda INTEGER NOT NULL,
	cijena NUMERIC(4,2) NOT NULL
);

CREATE TABLE kolicina (
	id INTEGER PRIMARY KEY NOT NULL,
    velicina NUMERIC(3,2) NOT NULL,
    volumen VARCHAR(5) NOT NULL
);

CREATE TABLE vrsta_proizvoda (
	id INTEGER PRIMARY KEY NOT NULL,
    naziv VARCHAR(65) NOT NULL
);

CREATE TABLE racun (
	id INTEGER NOT NULL,
    broj_racuna CHAR(4) NOT NULL,
    id_proizvod INTEGER NOT NULL,
    broj_stavki SMALLINT DEFAULT 1 NOT NULL,
    id_radnik INTEGER NOT NULL,
	datum_izdanka_racuna DATETIME NOT NULL,
    PRIMARY KEY (id, id_proizvod),
	FOREIGN KEY (id_proizvod) REFERENCES proizvod (id),
	FOREIGN KEY (id_radnik) REFERENCES radnik (id)
);

CREATE TABLE skladiste (
	id INTEGER PRIMARY KEY NOT NULL,
    adresa_skladiste VARCHAR(35) NOT NULL,
    broj_skladiste CHAR(2) NOT NULL,
    id_poslodavac INTEGER NOT NULL,
    FOREIGN KEY (id_poslodavac) REFERENCES poslodavac (id)
);

CREATE TABLE placa (
	id INTEGER PRIMARY KEY NOT NULL,
    iznos INTEGER NOT NULL,
    valuta CHAR(3) NOT NULL,
    id_radnik INTEGER NOT NULL NOT NULL,
    broj_odradenih_sati INTEGER NOT NULL DEFAULT 0,
    FOREIGN KEY (id_radnik) REFERENCES radnik (id)
);

CREATE TABLE zalihe (
	id INTEGER PRIMARY KEY NOT NULL,
    id_skladiste INTEGER NOT NULL,
    id_proizvodac INTEGER NOT NULL,
    datum_narudzbe DATETIME NOT NULL,
    datum_isporuke DATETIME NOT NULL,
	FOREIGN KEY (id_skladiste) REFERENCES skladiste (id),
    FOREIGN KEY (id_proizvodac) REFERENCES proizvodac (id)
);

INSERT INTO poslodavac VALUES (1, 'Matija', 'Horvat', STR_TO_DATE ('04.02.1985','%d.%m.%Y.'), 56789589213),
						   (2, 'Mirko','Ivančić',  STR_TO_DATE ('15.12.1982', '%d.%m.%Y.'), 76456279521),
						   (3, 'Ivica', 'Mandulić',  STR_TO_DATE ('09.01.1979','%d.%m.%Y.'), 48240424468),
						   (4, 'Martina', 'Marković',  STR_TO_DATE ('22.06.1969','%d.%m.%Y.'), 11230129675),
                           (5, 'Marina', 'Baranašić',  STR_TO_DATE ('29.10.1976','%d.%m.%Y.'), 21230129675),
                           (6, 'Hana', 'Ivović',  STR_TO_DATE ('15.09.1965','%d.%m.%Y.'), 61230229675),
                           (7, 'Luka', 'Modrić',  STR_TO_DATE ('16.09.1981','%d.%m.%Y.'), 31240129475),
                           (8, 'Ivona', 'Marković',  STR_TO_DATE ('30.06.1970','%d.%m.%Y.'), 21230019675),
                           (9, 'Ivo', 'Kuhar',  STR_TO_DATE ('16.06.1969','%d.%m.%Y.'), 10330129675),
						   (10, 'Žana', 'Toplek',  STR_TO_DATE ('14.09.1976','%d.%m.%Y.'), 21230525675);
                           
INSERT INTO radnik VALUES (11, 'Fran', 'Novak', STR_TO_DATE ('10.04.1977','%d.%m.%Y.'), 15522341230, 3),
						  (12, 'Ivana', 'Krištofić', STR_TO_DATE ('09.03.1990','%d.%m.%Y.'), 25522341230, 8),
						  (13, 'Marta', 'Toplek', STR_TO_DATE ('06.08.1969','%d.%m.%Y.'), 35522341230, 1),
						  (14, 'Martin', 'Kovačević', STR_TO_DATE ('15.05.1982','%d.%m.%Y.'), 45522341231, 2),
                          (15, 'Tomislav', 'Sever', STR_TO_DATE ('01.05.1985','%d.%m.%Y.'), 56521341232, 4),
						  (16, 'Laura', 'Merlić', STR_TO_DATE ('08.09.1984','%d.%m.%Y.'), 53122344233, 5),
						  (17, 'Mattia', 'Grubiša', STR_TO_DATE ('19.03.1972','%d.%m.%Y.'), 45522341135, 8),
						  (18, 'Nikola', 'Grubeša', STR_TO_DATE ('29.07.1987','%d.%m.%Y.'), 98822341230, 6),
						  (19, 'Ana', 'Novak', STR_TO_DATE ('12.12.1986','%d.%m.%Y.'), 21522541230, 7),
						  (20, 'Katarina', 'Marđetko', STR_TO_DATE ('25.12.1990','%d.%m.%Y.'), 15622741238, 10),
						  (21, 'Matija', 'Bašek', STR_TO_DATE ('17.11.1983','%d.%m.%Y.'), 25442412307, 9),
                          (22, 'Marko', 'Bajčić', STR_TO_DATE ('05.11.1983','%d.%m.%Y.'), 51522347236, 10),
						  (23, 'Filip', 'Novak', STR_TO_DATE ('04.02.1989','%d.%m.%Y.'), 85222141232, 7),
						  (24, 'Marko', 'Horvat', STR_TO_DATE ('13.05.1988','%d.%m.%Y.'), 91526341236, 2),
                          (25, 'Ivona', 'Rakitić', STR_TO_DATE ('25.09.1975','%d.%m.%Y.'), 12525367238, 1),
						  (26, 'Kristijan', 'Rebić', STR_TO_DATE ('21.04.1985','%d.%m.%Y.'), 77223111270, 2),
						  (27, 'Aleksandra', 'Šupić', STR_TO_DATE ('30.10.1981','%d.%m.%Y.'), 15222341251, 3),
                          (28, 'Matija', 'Novak', STR_TO_DATE ('30.11.1989','%d.%m.%Y.'), 66227348235, 2),
						  (29, 'Matija', 'Nikić', STR_TO_DATE ('23.03.1983','%d.%m.%Y.'), 41222341230, 4),
						  (30, 'Vinko', 'Oreški', STR_TO_DATE ('06.04.1982','%d.%m.%Y.'), 23552241236, 5),
						  (31, 'Karlo', 'Matoša', STR_TO_DATE ('01.02.1991','%d.%m.%Y.'), 98222341239, 4),
						  (32, 'Laura', 'Toplek', STR_TO_DATE ('01.02.1991','%d.%m.%Y.'), 45521561271, 4);
                          
INSERT INTO proizvodac VALUES (40,  'Franck' , 'Hrvatska', 1918),
							  (41, 'Jacksons of Picaddilly', 'Engleska', 1815),
							  (42, 'Cappy', 'Poljska', 2008),
                              (43, 'Nestea', 'Švicarska', 1948),
                              (44, 'Coca-Cola', 'Sjedinjene Američke Države', 1892),
                              (45, 'Fanta', 'Njemačka', 1940),
                              (46, 'Graševina', 'Hrvatska', 1946),
                              (47, 'Merlot', 'Francuska', 1824),
                              (48, 'Kraš', 'Hrvatska', 1911),
                              (49, 'Barcaffe', 'Slovenija', 1970),
                              (50, 'OldTown White Coffee', 'Malazija', 1995),
                              (51, 'Swiss Water Decaffeinated Coffee Company', 'Švicarska', 1933),
                              (52, 'Nerrna Industry', 'Italija', 2006),
                              (53, 'Schweppes', 'Švicarska', 1783),
                              (54, 'Orangina', 'Francuska', 1935),
                              (55, 'Nestlé',  'ŠVicarska', 1886),
                              (56, 'Cedevita', 'Hrvatska', 1929),
                              (57, 'Red Bull', 'Austrija', 1984),
                              (58, 'Studenac', 'Hrvatska', 1973),
                              (59, 'Jana', 'Hrvatska' , 1828),
                              (60, 'Karlovačko', 'Hrvatska', 1854),
                              (61, 'Ožujsko', 'Hrvatska', 1892),
                              (62, 'Union', 'Slovenija', 1909),
                              (63, 'Staropramen', 'Češka', 1898),
                              (64, 'Heineken', 'Nizozemska', 1873),
                              (65, 'Becks', 'Njemačka', 1989),
                              (66, 'Corona', 'Meksiko', 1925),
							  (67, 'Maraska', 'Hrvatska', 1949),
                              (68, 'Badel', 'Hrvatska', 1862),
                              (69, 'Ballantines', 'Škotska', 1827),
                              (70, 'Chivas Regal', 'Škotska', 1801),
                              (71, 'Jack Daniel*s', 'Tennessee', 1846),
                              (72, 'Jagermeister', 'Njemačka', 1934),
                              (73, 'Martini', 'Italija', 1863),
                              (74, 'Smirnoff', 'Rusija', 1860),
                              (75, 'Gin Beefeater', 'Ujedinjeno Kraljevstvo', 1876);
                              
                              

INSERT INTO vrsta_proizvoda VALUES (100, 'Topli napitak'),
								   (101, 'Hladni napitak'),
                                   (102, 'Gazirana bezalkoholna pića'),
                                   (103, 'Negazirana bezalkoholna pića'),
                                   (104, 'Domaća vina'),
                                   (105, 'Strana  vina'),
                                   (106, 'Domaća teška alkoholna pića'),
                                   (107, 'Strana teška alkoholna pića'),
                                   (108, 'Domaće pive'),
                                   (109, 'Strane pive'),
                                   (110, 'Energetska pića');
                                   

INSERT INTO kolicina VALUES (200, '0.01', 'L'),
							(201, '0.02', 'L'),
                            (202, '0.03', 'L'),
                            (203, '0.10', 'L'),
                            (204, '0.20', 'L'),
                            (205, '0.25', 'L'),
                            (206, '0.30', 'L'),
                            (207, '0.33', 'L'),
                            (208, '0.50', 'L'),
                            (209, '0.75', 'L'),
                            (210, '1.00', 'L');

INSERT INTO proizvod VALUES (120, 'Kava espresso', 00000001, 204, 40, 100, '07.00'),
							(121, 'Kava s mlijekom mala', 00000002, 204, 40, 100, '08.00'),
                            (122, 'Kava s mlijekom velika', 00000003, 206, 40, 100, '09.00'),
                            (123, 'Kava sa šlagom',  00000004, 207, 49, 100, '09.00'),
                            (124, 'Capuccino', 00000005, 205, 52, 100, '09.00'),
                            (125, 'Kava bez kofeina', 00000006, 204, 51, 100, '09.00'),
                            (126, 'Bijela kava', 00000007, 205, 50, 100, '10.00'),
                            (127, 'Instant kava', 00000008, 205, 49, 100, '10.00'),
                            (129, 'Kakao', 00000009, 208, 48, 100, '10.00'),
                            (130, 'Čaj', 00000010, 206, 41, 100, '10.00'),
                            (131, 'Čaj s medom i limunom', 00000011, 208, 41, 100, '10.00'),
                            (132, 'Ledena kava', 00000012, 208, 49, 101, '12.00'),
                            (133, 'Coca-Cola', 00000013, 205, 44, 102, '12.00'),
                            (134, 'Fanta' , 00000014, 205, 45, 102, '12.00'),
                            (135, 'Schweppes',00000015, 205, 53, 102, '12.00'),
                            (136, 'Orangina', 00000016, 205, 54,  102, '14.00'),
                            (137, 'Prirodni sok', 00000017, 204, 55, 103, '15.00'),
                            (138, 'Ledeni čaj', 00000018, 204, 43, 103, '12.00'),
                            (139, 'Cedevita', 00000019, 204, 56, 103, '10.00'),
                            (140, 'Red Bull', 00000020, 205, 57, 110, '25.00'),
                            (141, 'Mineralna voda', 00000021, 203, 58, 102, '02.00'),
                            (142, 'Mineralna voda', 00000022, 210, 58, 102,'20.00'),
                            (143, 'Negazirana voda', 00000023, 203, 59, 102, '10.00'),
							(144, 'Karlovačko', 00000024, 208, 60, 108, '12.00'),
                            (145, 'Karlovačko radler', 00000025, 208, 60, 108, '12.00'),
                            (146, 'Karlovačko crno', 00000026, 208, 60, 108, '13.00'),
                            (147, 'Ožujsko', 00000027, 208, 61, 108, '12.00'),
                            (148, 'Ožujsko', 00000028, 207, 61, 108, '09.00'),
                            (149, 'Ožujsko radler', 00000029, 208, 61, 108, '12.00'),
                            (150, 'Union', 00000030, 208, 62, 109, '12.00'),
                            (151, 'Staropramen', 00000031, 208, 63, 109, '14.00'),
                            (152, 'Heineken', 00000032, 207, 64, 109, '15.00'),
                            (153, 'Beck*s', 00000033, 207, 65, 109, '15.00'),
                            (154, 'Corona', 00000034, 207, 66, 109, '16.00'),
                            (155, 'Amaro', 00000035, 202, 67, 106, '10.00'),
                            (156, 'Brendy', 00000036, 202, 68, 106, '10.00'),
                            (157, 'Lavov', 00000037, 202, 68, 106, '10.00'),
                            (158, 'Loza komovica', 00000038, 202, 67, 106, '10.00'),
                            (159, 'Pelinkovac', 00000039, 202, 67, 106, '10.00'),
                            (160, 'Rum', 00000040, 202, 67, 106, '10.00'),
                            (161, 'Travarica', 00000041, 202, 67, 106, '10.00'),
                            (162, 'Vodka', 00000042, 202, 67, 106, '10.00'),
                            (163, 'Šljivovica', 00000043, 202, 67, 106, '10.00'),
                            (164, 'Viljamovka', 00000044, 202, 67, 106, '15.00'),
                            (165, 'Medica', 00000045, 202, 68, 106, '10.00'),
                            (166, 'Ballantines', 00000046, 202, 69, 107, '14.00'),
                            (167, 'Chivas Regal', 00000047, 202, 70, 107, '25.00'),
                            (168, 'Jack Daniel*s', 00000048, 202, 71, 107, '10.00'),
                            (169, 'Jagermeister', 00000049, 202, 72, 107, '14.00'),
                            (170, 'Martini', 00000050, 202, 73, 107, '14.00'),
                            (171, 'Smirnoff', 00000051, 202, 74, 107, '14.00'),
                            (172, 'Gin Beefeater', 00000052, 202, 75, 107, '16.00'),
                            (173, 'Vino bijelo', 00000053, 203, 46, 104, '07.00'),
                            (174, 'Vino crno', 00000054, 203, 47,105, '07.00'),
                            (175, 'Gemišt', 00000055, 204, 46, 104, '08.00');
                            

INSERT INTO racun VALUES (500, '0001', 131, 2, 26, STR_TO_DATE ('04.01.2020','%d.%m.%Y.')),
						 (500, '0001', 150, 3, 26, STR_TO_DATE ('04.01.2020','%d.%m.%Y.')),
						 (501, '0002', 147, 1, 18, STR_TO_DATE ('05.03.2020','%d.%m.%Y.')),
                         (502, '0003', 158, 2, 12, STR_TO_DATE ('12.02.2020','%d.%m.%Y.')),
                         (503, '0004', 167, 4, 32, STR_TO_DATE ('24.05.2020','%d.%m.%Y.')),
                         (503, '0004', 129, 4, 32, STR_TO_DATE ('24.05.2020','%d.%m.%Y.')),
                         (503, '0004', 154, 4, 32, STR_TO_DATE ('24.05.2020','%d.%m.%Y.')),
                         (504, '0005', 166, 1, 24, STR_TO_DATE ('26.01.2020','%d.%m.%Y.')),
                         (505, '0006', 123, 1, 11, STR_TO_DATE ('09.03.2020','%d.%m.%Y.')),
                         (505, '0006', 143, 2, 11, STR_TO_DATE ('09.03.2020','%d.%m.%Y.')),
                         (506, '0007', 175, 2, 13, STR_TO_DATE ('13.04.2020','%d.%m.%Y.')),
                         (507, '0008', 133, 1, 19, STR_TO_DATE ('08.02.2020','%d.%m.%Y.')),
                         (508, '0009', 150, 4, 29, STR_TO_DATE ('29.02.2020','%d.%m.%Y.')),
                         (508, '0009', 159, 1, 29, STR_TO_DATE ('29.02.2020','%d.%m.%Y.')),
                         (508, '0009', 155, 1, 29, STR_TO_DATE ('29.02.2020','%d.%m.%Y.')),
                         (509, '0010', 170, 3, 28, STR_TO_DATE ('30.04.2020','%d.%m.%Y.')),
                         (510, '0011', 123, 2, 25, STR_TO_DATE ('18.05.2020','%d.%m.%Y.')),
                         (511, '0012', 165, 2, 27, STR_TO_DATE ('16.03.2020','%d.%m.%Y.')),
                         (512, '0013', 137, 1, 16, STR_TO_DATE ('10.01.2020','%d.%m.%Y.')),
                         (512, '0013', 148, 2, 16, STR_TO_DATE ('10.01.2020','%d.%m.%Y.')),
                         (513, '0014', 145, 5, 15, STR_TO_DATE ('08.03.2020','%d.%m.%Y.')),
                         (514, '0015', 159, 2, 23, STR_TO_DATE ('11.04.2020','%d.%m.%Y.')),
                         (515, '0016', 132, 3, 30, STR_TO_DATE ('17.05.2020','%d.%m.%Y.')),
                         (516, '0017', 146, 6, 14, STR_TO_DATE ('23.03.2020','%d.%m.%Y.')),
                         (517, '0018', 139, 2, 22, STR_TO_DATE ('21.02.2020','%d.%m.%Y.')),
                         (517, '0018', 132, 3, 22, STR_TO_DATE ('21.02.2020','%d.%m.%Y.')),
                         (518, '0019', 126, 1, 31, STR_TO_DATE ('21.03.2020','%d.%m.%Y.')),
                         (519, '0020', 141, 4, 11, STR_TO_DATE ('13.01.2020','%d.%m.%Y.')),
                         (520, '0021', 174, 5, 22, STR_TO_DATE ('06.02.2020','%d.%m.%Y.')),
                         (521, '0022', 137, 2, 21, STR_TO_DATE ('09.03.2020','%d.%m.%Y.')),
                         (522, '0023', 167, 1, 25, STR_TO_DATE ('28.03.2020','%d.%m.%Y.')),
                         (522, '0023', 171, 2, 25, STR_TO_DATE ('28.03.2020','%d.%m.%Y.')),
                         (523, '0024', 154, 6, 27, STR_TO_DATE ('15.02.2020','%d.%m.%Y.')),
                         (524, '0025', 135, 2, 17, STR_TO_DATE ('11.01.2020','%d.%m.%Y.')),
                         (525, '0017', 143, 1, 18, STR_TO_DATE ('23.04.2020','%d.%m.%Y.')),
                         (526, '0017', 150, 3, 19, STR_TO_DATE ('21.03.2020','%d.%m.%Y.')),
                         (527, '0017', 134, 4, 21, STR_TO_DATE ('27.01.2020','%d.%m.%Y.')),
                         (528, '0017', 125, 2, 22, STR_TO_DATE ('20.02.2020','%d.%m.%Y.')),
                         (529, '0017', 175, 1, 23, STR_TO_DATE ('01.03.2020','%d.%m.%Y.')),
                         (529, '0017', 138, 3, 23, STR_TO_DATE ('01.03.2020','%d.%m.%Y.')),
                         (530, '0017', 167, 5, 24, STR_TO_DATE ('01.02.2020','%d.%m.%Y.')),
                         (531, '0017', 136, 1, 25, STR_TO_DATE ('15.03.2020','%d.%m.%Y.')),
                         (532, '0017', 152, 1, 28, STR_TO_DATE ('17.02.2020','%d.%m.%Y.')),
                         (532, '0017', 129, 3, 28, STR_TO_DATE ('17.02.2020','%d.%m.%Y.')),
                         (533, '0017', 174, 2, 27, STR_TO_DATE ('28.01.2020','%d.%m.%Y.'));

INSERT INTO placa VALUES (600, 4500, 'kn', 11, 180),
						 (601, 4800, 'kn', 12, 196),
						 (602, 5150, 'kn', 13, 220),
                         (603, 4650, 'kn', 14, 188),
						 (604, 4675, 'kn', 15, 189),
                         (605, 4900, 'kn', 16, 200),
                         (606, 4950, 'kn', 17, 202),
                         (607, 4525, 'kn', 18, 185),
                         (608, 4400, 'kn', 19, 178),
                         (609, 4500, 'kn', 20, 180),
                         (610, 4750, 'kn', 21, 192),
                         (611, 4775, 'kn', 22, 195),
                         (612, 4700, 'kn', 23, 190),
                         (613, 4550, 'kn', 24, 186),
                         (614, 4600, 'kn', 25, 188),
                         (615, 4750, 'kn', 26, 192),
                         (616, 4750, 'kn', 27, 192),
                         (617, 4500, 'kn', 28, 184),
                         (618, 4750, 'kn', 29, 192),
                         (619, 4800, 'kn', 30, 194),
                         (620, 4850, 'kn', 31, 196),
                         (621, 4775, 'kn', 32, 192);
                         
INSERT INTO skladiste VALUES (700,'Heinzelova 64,Zagreb', '01', 9),
							 (701,'Banija 5,Karlovac', '02', 10),
                             (702,'Kolodvorska 13,Velika Gorica', '03', 2),
                             (703,'Ilije Gregorića 20, Zaprešić', '04', 4),
                             (704,'Savska 128,Zagreb', '05', 7);
                             
INSERT INTO zalihe VALUES    (300, 700, 40, STR_TO_DATE ('04.01.2020','%d.%m.%Y.'), STR_TO_DATE ('06.01.2020','%d.%m.%Y.')),
							 (301, 700, 41, STR_TO_DATE ('05.01.2020','%d.%m.%Y.'), STR_TO_DATE ('07.01.2020','%d.%m.%Y.')),
                             (302, 700, 49, STR_TO_DATE ('06.01.2020','%d.%m.%Y.'), STR_TO_DATE ('09.01.2020','%d.%m.%Y.')),
                             (303, 700, 50, STR_TO_DATE ('12.01.2020','%d.%m.%Y.'), STR_TO_DATE ('15.01.2020','%d.%m.%Y.')),
                             (304, 700, 51, STR_TO_DATE ('11.01.2020','%d.%m.%Y.'), STR_TO_DATE ('13.01.2020','%d.%m.%Y.')),
                             (305, 700, 52, STR_TO_DATE ('09.01.2020','%d.%m.%Y.'), STR_TO_DATE ('14.01.2020','%d.%m.%Y.')),
                             (306, 700, 59, STR_TO_DATE ('01.02.2020','%d.%m.%Y.'), STR_TO_DATE ('06.02.2020','%d.%m.%Y.')),
                             (307, 700, 55, STR_TO_DATE ('01.01.2020','%d.%m.%Y.'), STR_TO_DATE ('03.01.2020','%d.%m.%Y.')),
                             (308, 700, 43, STR_TO_DATE ('02.01.2020','%d.%m.%Y.'), STR_TO_DATE ('06.01.2020','%d.%m.%Y.')),
                             (309, 700, 56, STR_TO_DATE ('03.02.2020','%d.%m.%Y.'), STR_TO_DATE ('16.02.2020','%d.%m.%Y.')),
                             (310, 701, 44, STR_TO_DATE ('15.01.2020','%d.%m.%Y.'), STR_TO_DATE ('18.01.2020','%d.%m.%Y.')),
                             (311, 701, 45, STR_TO_DATE ('14.01.2020','%d.%m.%Y.'), STR_TO_DATE ('17.01.2020','%d.%m.%Y.')),
                             (312, 701, 53, STR_TO_DATE ('13.01.2020','%d.%m.%Y.'), STR_TO_DATE ('15.01.2020','%d.%m.%Y.')),
                             (313, 701, 54, STR_TO_DATE ('12.02.2020','%d.%m.%Y.'), STR_TO_DATE ('19.02.2020','%d.%m.%Y.')),
                             (314, 701, 57, STR_TO_DATE ('14.02.2020','%d.%m.%Y.'), STR_TO_DATE ('20.02.2020','%d.%m.%Y.')),
                             (315, 701, 58, STR_TO_DATE ('12.01.2020','%d.%m.%Y.'), STR_TO_DATE ('26.01.2020','%d.%m.%Y.')),
                             (316, 701, 60, STR_TO_DATE ('15.01.2020','%d.%m.%Y.'), STR_TO_DATE ('19.01.2020','%d.%m.%Y.')),
                             (317, 701, 61, STR_TO_DATE ('16.01.2020','%d.%m.%Y.'), STR_TO_DATE ('22.01.2020','%d.%m.%Y.')),
                             (318, 701, 62, STR_TO_DATE ('17.01.2020','%d.%m.%Y.'), STR_TO_DATE ('25.01.2020','%d.%m.%Y.')),
                             (319, 701, 63, STR_TO_DATE ('15.01.2020','%d.%m.%Y.'), STR_TO_DATE ('23.01.2020','%d.%m.%Y.')),
                             (320, 702, 64, STR_TO_DATE ('14.01.2020','%d.%m.%Y.'), STR_TO_DATE ('22.01.2020','%d.%m.%Y.')),
                             (321, 702, 65, STR_TO_DATE ('25.01.2020','%d.%m.%Y.'), STR_TO_DATE ('28.01.2020','%d.%m.%Y.')),
                             (322, 702, 66, STR_TO_DATE ('26.01.2020','%d.%m.%Y.'), STR_TO_DATE ('03.02.2020','%d.%m.%Y.')),
                             (323, 702, 46, STR_TO_DATE ('25.01.2020','%d.%m.%Y.'), STR_TO_DATE ('01.02.2020','%d.%m.%Y.')),
                             (324, 702, 47, STR_TO_DATE ('27.01.2020','%d.%m.%Y.'), STR_TO_DATE ('01.02.2020','%d.%m.%Y.')),
                             (325, 703, 67, STR_TO_DATE ('29.01.2020','%d.%m.%Y.'), STR_TO_DATE ('01.02.2020','%d.%m.%Y.')),
                             (326, 703, 68, STR_TO_DATE ('29.01.2020','%d.%m.%Y.'), STR_TO_DATE ('01.02.2020','%d.%m.%Y.')),
                             (327, 703, 69, STR_TO_DATE ('15.02.2020','%d.%m.%Y.'), STR_TO_DATE ('20.02.2020','%d.%m.%Y.')),
                             (328, 703, 70, STR_TO_DATE ('14.02.2020','%d.%m.%Y.'), STR_TO_DATE ('22.02.2020','%d.%m.%Y.')),
                             (329, 703, 71, STR_TO_DATE ('03.02.2020','%d.%m.%Y.'), STR_TO_DATE ('11.02.2020','%d.%m.%Y.')),
                             (330, 704, 72, STR_TO_DATE ('02.02.2020','%d.%m.%Y.'), STR_TO_DATE ('06.02.2020','%d.%m.%Y.')),
                             (331, 704, 73, STR_TO_DATE ('01.02.2020','%d.%m.%Y.'), STR_TO_DATE ('06.02.2020','%d.%m.%Y.')),
                             (332, 704, 74, STR_TO_DATE ('08.02.2020','%d.%m.%Y.'), STR_TO_DATE ('14.02.2020','%d.%m.%Y.')),
                             (333, 704, 75, STR_TO_DATE ('09.02.2020','%d.%m.%Y.'), STR_TO_DATE ('17.02.2020','%d.%m.%Y.'));
                             
                             

-- 1. Prikaži id radnika sa najvećim brojem odrađenih sati.
SELECT id_radnik
	FROM placa
    WHERE broj_odradenih_sati = (SELECT MAX(broj_odradenih_sati) FROM placa);
    
-- 2. Prikaži radnike sa najmanjom plaćom.
SELECT id_radnik
	FROM placa
    WHERE iznos = (SELECT MIN(iznos) FROM placa);

-- 3. Prikaži imena proizvoda koji su skuplji od 20.00 kn.
SELECT ime
	FROM proizvod
    WHERE cijena <20.00;

-- 4. "Otpusti"(izbriši) sve radnike koji imaju ispodprosječni broj odrađenih sati te prikaži one koji su ostali.
DELETE 
	FROM placa 
	WHERE broj_odradenih_sati < (SELECT * FROM ( SELECT AVG(broj_odradenih_sati) FROM placa) AS prosjek);

-- 5. Prikaži poslodavce koji ne posjeduju skladiste.
SELECT p.*
FROM poslodavac AS p LEFT OUTER JOIN skladiste AS s ON p.id=s.id_poslodavac
WHERE s.id IS NULL;

-- 6. Prikaži sve pive.
SELECT pr.*
 FROM proizvod AS pr INNER JOIN vrsta_proizvoda AS vp 
 ON pr.id_vrstaproizvoda=vp.id
 WHERE naziv LIKE '%pive%';


-- 7. Napravi pogled sa nazivom cijena_vina koji će prikazivati vrste vina i njihove cijene
CREATE VIEW cijena_vina AS
SELECT naziv, cijena
FROM vrsta_proizvoda as v, proizvod as p
WHERE v.id = p.id_vrstaproizovda AND v.naziv LIKE '%vina%'; 


-- 8. Prikaži najstarijeg hrvatskog proizvođača
SELECT ime
	FROM proizvodac
    WHERE ime_drzave ='Hrvatska'
    ORDER BY god_nastanka_komp ASC
    LIMIT 1;

-- 9. Prikaži koliko je računa izdao Nikola Grubeša
SELECT r.ime, r.prezime, COUNT(rac.id) AS broj_racuna
	FROM radnik AS r INNER JOIN racun AS rac ON r.id=rac.id_radnik 
    GROUP BY r.id                         
	HAVING r.ime="Nikola" AND r.prezime="Grubeša";
    

/* 10. Napravi pogled koji povezuje radnika sa plaćom,
 	   a zatim prikaži radnike svakog poslodavca, sa najvećom plaćom */

CREATE VIEW radnik_placa AS
SELECT r.*, p.id AS placa_id, p.iznos, p.valuta, p.id_radnik, p.broj_odradenih_sati
FROM radnik AS r INNER JOIN placa AS p ON r.id=p.id_radnik;

SELECT *
	FROM radnik_placa
	WHERE (id_poslodavac, iznos) IN
    (SELECT DISTINCT id_poslodavac, MAX(iznos) 
    FROM radnik_placa
    GROUP BY id_poslodavac)
		ORDER BY id_poslodavac ASC;