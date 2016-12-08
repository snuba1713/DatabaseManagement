--Scott Heinrich Database Z Final Project--

--Drop All Tables--
DROP TABLE IF EXISTS People;
DROP TABLE IF EXISTS LeadVillains;
DROP TABLE IF EXISTS ZFighters;
DROP TABLE IF EXISTS Affiliation;
DROP TABLE IF EXISTS PeopleAffiliation;
DROP TABLE IF EXISTS MajorBattles;
DROP TABLE IF EXISTS FoughtIn;
DROP TABLE IF EXISTS Worlds;
DROP TABLE IF EXISTS Race;



--Create People Table--
CREATE TABLE People(

PID 			INT 			NOT NULL, 
PeopleName 		TEXT			NOT NULL, 
gender 			CHAR(1) NOT NULL 	CHECK(gender='m' or gender='f'), 
birthYear 		INT,
firstDeathYear 		INT,
Race 			TEXT,
primary key(PID) 
);
--Create ZFighters Table--
CREATE TABLE ZFighters(

pid 			INT 			NOT NULL REFERENCES People(PID), 
resurrects 		INT 			NOT NULL, 
primary key(PID)
);

--Create Villains Table--
CREATE TABLE LeadVillains(

pid 			INT 			NOT NULL REFERENCES People(PID), 
catchphrase 		TEXT 			NOT NULL, 
primary key(PID)
);

--Create Affiliation Table--
CREATE TABLE Affiliation(

AID 			INT			NOT NULL, 
AffiliationName 	TEXT 			NOT NULL,
primary key(AID)
);

--Create PeopleAffiliation Table--
CREATE TABLE PeopleAffiliation(

PID 			INT 			NOT NULL REFERENCES People(PID), 
AID 			INT 			NOT NULL REFERENCES Affiliation(AID),
primary key(PID, AID)
);

--Create Worlds Table--
CREATE TABLE Worlds(

WID 			INT			 NOT NULL, 
WorldName 		TEXT			 NOT NULL,
WorldDesc 		TEXT			 NOT NULL,
primary key(WID)
);

--Create MajorBattles Table--
CREATE TABLE MajorBattles(

MBID 			INT 			NOT NULL, 
WID			INT			NOT NULL REFERENCES Worlds(WID),
BattleName 		TEXT 			NOT NULL,
BattleReason 		TEXT			NOT NULL,
BattleYear		TEXT			NOT NULL,
primary key(MBID)
);

--Create FoughtIn Table--
CREATE TABLE FoughtIn(

PID 			INT		 	NOT NULL REFERENCES People(PID), 
AID 			INT 			NOT NULL REFERENCES Affiliation(AID),
MBID 			INT 			NOT NULL REFERENCES MajorBattles(MBID),
primary key(PID, AID, MBID)
);

--Create Race Table--
CREATE TABLE Race(

PID 			INT			 NOT NULL REFERENCES People(PID),
WID 			INT			 NOT NULL REFERENCES Worlds(WID),
primary key(PID, WID)
);

--Insert Into People Table--
INSERT INTO PEOPLE(PID, PeopleName, Gender, birthYear, firstDeathYear, Race)
	VALUES(1, 'Goku', 'm', 734, 761, 'Saiyan'),
	      (2, 'Gohan', 'm', 757, 774, 'Human'),
	      (3, 'Goten', 'm', 767, 774, 'Human'),
	      (4, 'Bulma', 'f', 733, 774, 'Human'),
	      (5, 'Trunks', 'm', 766, 774, 'Human'),
	      (6, 'Krillin', 'm', 736, 762, 'Human'),
	      (7, 'Yamcha', 'm', 733, 762, 'Human'),
	      (8, 'Tien', 'm', 733, 762, 'Human'),
	      (9, 'Chiaotzu', 'm', 738, 762, 'Human'),
	      (10, 'Piccolo', 'm', 753, 764, 'Namekian'),
	      (11, 'Vegeta', 'm', 732, 764, 'Saiyan'),
	      (12, 'Frieza', 'm', NULL, 764, 'Frost Demon'),
	      (13, 'Cell', 'm', 786, 767, 'Android'),
	      (14, 'Kid Buu', 'm', NULL, 774, 'Majin'),
	      (15, 'Zarbon', 'm', NULL, 764, NULL),
	      (16, 'Dodoria', 'm', NULL, 764, NULL),
	      (17, 'Captain Ginyu', 'm', NULL, 764, NULL),
	      (18, 'Recoome', 'm', NULL, 764, NULL),
	      (19, 'Guldo', 'm', NULL, 764, NULL),
	      (20, 'Jeice', 'm', NULL, 764, NULL),
	      (21, 'Burter', 'm', NULL, 764, NULL),
	      (22, 'Yamu', 'm', NULL, 774, NULL),
	      (23, 'Pui Pui', 'm', NULL, 774, NULL),
	      (24, 'Yakon', 'm', NULL, 774, NULL),
	      (25, 'Dabura', 'm', NULL, 774, NULL),
	      (26, 'Droid 16', 'm', NULL, 767, NULL),
	      (27, 'Droid 17', 'm', NULL, 767, NULL),
	      (28, 'Droid 18', 'f', NULL, 774, NULL);
	      
--Insert Into ZFighters Table--
INSERT INTO ZFighters(PID, Resurrects)
	VALUES(1, 2),
	      (2, 1),
	      (3, 1),
	      (4, 1),
	      (5, 1),
	      (6, 1),
	      (7, 2),
	      (8, 2),
	      (9, 2);

--Insert Into Lead Villains Table--
INSERT INTO LeadVillains(PID, Catchphrase)
	VALUES(11, ' KAKAROT'),
	      (12, ' This isnt even my final form!'),
	      (13, ' I have yet to show you what Im truly capable of'),
	      (14, ' *Maniacal Laughter*');

--Insert Into Affiliation Table--
INSERT INTO Affiliation(AID, AffiliationName)
	VALUES(1, 'Frieza Allies'),
	      (2, 'Ginyu Force'),
	      (3, 'Red Ribbon Army'),
	      (4, 'Majin Minions'),
	      (5, 'Z Fighters'),
	      (6, 'Main Villain');

--Insert Into PeopleAffiliation Table--
INSERT INTO PeopleAffiliation(PID, AID)
	VALUES(1, 5),
	      (2, 5),
	      (3, 5),
	      (4, 5),
	      (5, 5),
	      (6, 5),
	      (7, 5),
	      (8, 5),
	      (9, 5),
	      (10, 5),
	      (11, 4),
	      (11, 5),
	      (11, 6),
	      (15, 1), 
	      (16, 1),
	      (17, 2),
	      (18, 2),
	      (19, 2),
	      (20, 2),
	      (21, 2),
	      (22, 4),
	      (23, 4),
	      (24, 4),
	      (25, 4),
	      (26, 3),
	      (27, 3),
	      (28, 3);

--Insert Into Worlds Table--
INSERT INTO Worlds(WID, WorldName, WorldDesc)
	VALUES(1, 'Earth', 'The Home of the Earthlings'),
	      (2, 'Namek', 'The Home of the Namekians'),
	      (3, 'Plant', 'The Home of the Saiyans'),
	      (4, 'Unknown', 'Home Planet Unkown');


--Insert Into MajorBattle Table--
INSERT INTO MajorBattles(MBID, WID, BattleName, BattleReason, BattleYear)
	VALUES(1, 1, 'Saiyan Saga', 'Power Struggle', 762),
	      (2, 2, 'Frieza Saga', 'Dragon Balls',764),
	      (3, 1, 'Cell Saga', 'World Domination', 767), 
	      (4, 1, 'Majin Buu Saga', 'Magical Being', 774);   

--Insert Into FoughtIn Table--
INSERT INTO FoughtIn(PID, AID, MBID)
	VALUES(1, 5, 1),
	      (2, 5, 1),
	      (6, 5, 1),
	      (7, 5, 1), 
	      (8, 5, 1),
	      (9, 5, 1),
	      (10, 5, 1),  
	      (11, 6, 1),
	      (1, 5, 2), 
	      (2, 5, 2), 
	      (6, 5, 2), 
	      (10, 5, 2),
	      (11, 5, 2),
	      (12, 6, 2), 
	      (15, 1, 2),
	      (16, 1, 2),
	      (17, 2, 2),
	      (18, 2, 2), 
	      (19, 2, 2),  
	      (20, 2, 2),  
	      (21, 2, 2),
	      (1, 5, 3),
	      (2, 5, 3),
	      (6, 5, 3),
	      (7, 5, 3),
	      (8, 5, 3),
	      (9, 5, 3),
	      (10, 5, 3),
	      (11, 5, 3),
	      (26, 3, 3),
	      (27, 3, 3),
	      (28, 3, 3),
	      (1, 5, 4),
	      (2, 5, 4),
	      (3, 5, 4),
	      (5, 5, 4),
	      (6, 5, 4),
	      (10, 5, 4),
	      (11, 5, 4),
	      (22, 4, 4),
	      (23, 4, 4), 
	      (24, 4, 4),
	      (25, 4, 4),
	      (11, 4, 4); 

--Insert Into Race Table--
INSERT INTO Race(PID, WID)
	VALUES(1, 3),
	      (2, 1),
	      (3, 1),
	      (4, 1),
	      (5, 1),
	      (6, 1),
	      (7, 1),
	      (8, 1),
	      (9, 1),
	      (10, 2),
	      (11, 3),
	      (12, 4),
	      (13, 4),
	      (14, 4),
	      (15, 4),
	      (16, 4),
	      (17, 4),
	      (18, 4),
	      (19, 4),
	      (20, 4),
	      (21, 4),
	      (22, 4),
	      (23, 4),
	      (24, 4),
	      (25, 4),
	      (26, 1),
	      (27, 1),
	      (28, 1);
	      
SELECT * FROM People;

-- First View involving finding out who is always dying in the show--
CREATE VIEW DangerZone as
SELECT peoplename 
FROM people p inner join ZFighters z on p.pid = z.pid
WHERE resurrects >1
ORDER BY peoplename asc ;

-- Second View which shows how many affiliations Vegeta has been in the show--
CREATE VIEW FrontRunner as
SELECT AffiliationName 
FROM PeopleAffiliation  a inner join Affiliation b  on a.aid = b.aid
			   inner join People p  on a.pid =p.pid
				WHERE peoplename = 'Vegeta';

-- Third View sees how many battles happened on earth --

CREATE VIEW WeComeInPeace as

SELECT BattleName
FROM Worlds w inner join MajorBattles m on w.wid = m.wid
WHERE WorldName = 'Earth';

-- Report that shows how old z fighters were when they first died --
-- Note that Cell came from the future, and as such his -19 death age will be fixed/updated
SELECT PeopleName, firstDeathYear - birthYear as AgeAtFirstDeath
FROM People
WHERE birthYear IS NOT NULL
ORDER by PeopleName DESC;

-- STORED PROCEDURE --

CREATE OR REPLACE FUNCTION whoFought(TEXT)
RETURNS 
as
$$
DECLARE
	-- used ti indicate a variable --
	inputName	TEXT	:= $1;
BEGIN
	SELECT PeopleName
	FROM FoughtIn f inner join people p on f.pid = p.pid
			inner join MajorBattles m on f.mbid = m.mbid
	WHERE BattleName = inputName;
	Order by peopleName DESC;
END;
$$
LANGUAGE plpgsql;

-- TRIGGER --

CREATE OR REPLACE FUNCTION RezCheck()
RETURNS TRIGGER
as
$$
DECLARE
BEGIN
	Select firstDeathYear
	FROM people
	IF (firstDeathYear = NULL)
		THEN
			RAISE EXCEPTION 'A person must be dead, before they can be resurrected.'
		Else
			--There is no issue--
	END IF;
	Return new;
END;
$$
LANGUAGE plpgsql;
	
CREATE TRIGGER ResurrectCheck
	Before Update
	ON ZFighters
	FOR EACH ROW
EXECUTE PROCEDURE RezCheck();




--Administrator Role for Security --
-- Gives administrator access to entire database, no limits--
CREATE ROLE Administrator;
REVOKE ALL ON ALL TABLES IN SCHEMA public FROM administrator;
GRANT ALL ON ALL TABLES IN SCHEMA public TO Administrator;

--Administrator Role for Kais --
-- Gives All Kais access to update records, can only change records for overseeing universe--
Create role Kai;
REVOKE ALL ON ALL TABLES IN SCHEMA public FROM Kai;
GRANT SELECT ON ALL TABLES IN SCHEMA public to Kai;
GRANT INSERT ON ALL TABLES IN SCHEMA public to Kai;
GRANT UPDATE ON ALL TABLES IN SCHEMA public to Kai;
