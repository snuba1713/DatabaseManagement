Scott Heinrich
Database Managment Lab 8

2.

Drop table if exists director_creds;
Drop table if exists actor_creds;
Drop table if exists directors;
Drop table if exists actors;
Drop table if exists movies;
Drop table if exists people;


create table people(
  peopleID              	int       primary key,
  fName                	text      Not null,
  lName               	text      not null,
  spouseFName          text,
  spouseLName          text,
  address               	text      not null
);


create table directors(
  peopleID             	int       primary key references people(peopleID),
  filmSchool            	text,
  directorsGuildDate   date,
  favoriteLensMaker   text
);


create table actors(
  peopleID              int       Primary key references people(peopleID),
  birthDate             DATE      not null,
  hairColor             Text      not null,
  heightInches       int       not null,
  weight                 int       not null,
  favoriteColor       text,
  sagAnnivDate     date
);


create table movies(
  movieID               int       primary key,
  name                  text      not null,
  year                    int       not null,
  mpaaRating        text      not null,
  domesticBoxSalesUSD   int,
  foreignBoxSalesUSD    int,
  dvdBlueRaySalesUSD    int
);


create table actorCredits(
  peopleID              int       references actors(peopleID),
  movieID               int       references movies(movieID),
  primary key(peopleID, movieID)
);


create table directorCredits(
  peopleID              int       references directors(peopleID),
  movieID               int       references movies(movieID),
  primary key(peopleID, movieID)
);

4.

SELECT Fname, Lname
  FROM People
WHERE PeopleID IN (SELECT PeopleID
                     FROM DirectorCredits
                     WHERE MovieID IN (SELECT MovieID
                                        FROM ActorCredits
                                         WHERE PeopleID IN (SELECT PeopleID
                                                             FROM People
                                                             WHERE Fname = “Sean”
                                                             AND Lname = “Connery”)))