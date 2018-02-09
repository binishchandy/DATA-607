drop database movies;
create database movies;

/* Delete the tables if they already exist */
drop table if exists Movie;
drop table if exists Reviewer;
drop table if exists Rating;

/* Create the schema for our tables */
create table Movie(mID int, title text, director text);
create table Reviewer(rID int, name text);
create table Rating(rID int, mID int, stars int);

/* Populate the tables with our data */

insert into Movie values(101, 'GET OUT', 'Jordan Peele');
insert into Movie values(102, 'THE BIG SICK', 'Michael Showalter');
insert into Movie values(103, 'DUNKIRK', 'Christopher Nolan');
insert into Movie values(104, 'WONDER WOMAN', 'Patty Jenkins');
insert into Movie values(105, 'LADY BIRD', 'Greta Gerwig');
insert into Movie values(106, 'LOGAN', ' James Mangold');	

insert into Reviewer values(201, 'Sarah Martinez');
insert into Reviewer values(202, 'Daniel Lewis');
insert into Reviewer values(203, 'Brittany Harris');
insert into Reviewer values(204, 'Mike Anderson');
insert into Reviewer values(205, 'Chris Jackson');
insert into Reviewer values(206, 'Elizabeth Thomas');
insert into Reviewer values(207, 'James Cameron');
insert into Reviewer values(208, 'Ashley White');

insert into Rating values(201, 101, floor(random()*(5-1+1))+1);
insert into Rating values(201, 102, floor(random()*(5-1+1))+1);
insert into Rating values(201, 103, floor(random()*(5-1+1))+1);
insert into Rating values(201, 104, floor(random()*(5-1+1))+1);
insert into Rating values(201, 105, floor(random()*(5-1+1))+1);
insert into Rating values(201, 106, floor(random()*(5-1+1))+1);	

insert into Rating values(202, 101, floor(random()*(5-1+1))+1);
insert into Rating values(202, 102, floor(random()*(5-1+1))+1);
insert into Rating values(202, 103, floor(random()*(5-1+1))+1);
insert into Rating values(202, 104, floor(random()*(5-1+1))+1);
insert into Rating values(202, 105, floor(random()*(5-1+1))+1);
insert into Rating values(202, 106, floor(random()*(5-1+1))+1);	

insert into Rating values(203, 101, floor(random()*(5-1+1))+1);
insert into Rating values(203, 102, floor(random()*(5-1+1))+1);
insert into Rating values(203, 103, floor(random()*(5-1+1))+1);
insert into Rating values(203, 104, floor(random()*(5-1+1))+1);
insert into Rating values(203, 105, floor(random()*(5-1+1))+1);
insert into Rating values(203, 106, floor(random()*(5-1+1))+1);	

insert into Rating values(204, 101, floor(random()*(5-1+1))+1);
insert into Rating values(204, 102, floor(random()*(5-1+1))+1);
insert into Rating values(204, 103, floor(random()*(5-1+1))+1);
insert into Rating values(204, 104, floor(random()*(5-1+1))+1);
insert into Rating values(204, 105, floor(random()*(5-1+1))+1);
insert into Rating values(204, 106, floor(random()*(5-1+1))+1);	

insert into Rating values(205, 101, floor(random()*(5-1+1))+1);
insert into Rating values(205, 102, floor(random()*(5-1+1))+1);
insert into Rating values(205, 103, floor(random()*(5-1+1))+1);
insert into Rating values(205, 104, floor(random()*(5-1+1))+1);
insert into Rating values(205, 105, floor(random()*(5-1+1))+1);
insert into Rating values(205, 106, floor(random()*(5-1+1))+1);	

insert into Rating values(206, 101, floor(random()*(5-1+1))+1);
insert into Rating values(206, 102, floor(random()*(5-1+1))+1);
insert into Rating values(206, 103, floor(random()*(5-1+1))+1);
insert into Rating values(206, 104, floor(random()*(5-1+1))+1);
insert into Rating values(206, 105, floor(random()*(5-1+1))+1);
insert into Rating values(206, 106, floor(random()*(5-1+1))+1);	

insert into Rating values(207, 101, floor(random()*(5-1+1))+1);
insert into Rating values(207, 102, floor(random()*(5-1+1))+1);
insert into Rating values(207, 103, floor(random()*(5-1+1))+1);
insert into Rating values(207, 104, floor(random()*(5-1+1))+1);
insert into Rating values(207, 105, floor(random()*(5-1+1))+1);
insert into Rating values(207, 106, floor(random()*(5-1+1))+1);	

insert into Rating values(208, 101, floor(random()*(5-1+1))+1);
insert into Rating values(208, 102, floor(random()*(5-1+1))+1);
insert into Rating values(208, 103, floor(random()*(5-1+1))+1);
insert into Rating values(208, 104, floor(random()*(5-1+1))+1);
insert into Rating values(208, 105, floor(random()*(5-1+1))+1);
insert into Rating values(208, 106, floor(random()*(5-1+1))+1);		


