--------------------------------------             Project PHOTOGALLERY                   ------------------------------------
--------------------------------------   Developed by Partho Choudhury Shoumya - 1807021  ------------------------------------


--------------------------------------   		Project Starts From Here  				  -------------------------------------

-- Connecting to the DBMS user interface;

drop user shoumya cascade;
create user shoumya identified by kuetcse;
grant all privileges to shoumya;
connect shoumya;
kuetcse

-- Removing pre-existing tables;

drop table roles;
drop table permission;
drop table login;
drop table image;
drop table userr;
drop table gallery;

-- Creating table userr where primary key is user_id

create table userr
	(
		user_id number(10) not null,
		name varchar(20),
		password number(20),
        about varchar(20),
        primary key(user_id)
		);

--role table has role_id as primary key and user_id as foreign key.

create table role
	(
		role_id number(5) not null,
        role_name varchar(20),
        role_desc varchar(20),
		user_id number(10) not null 
		);

/* gallery table has gallery_id as primary key*/

create table gallery
	(
		gallery_id number(10) not null,
		gallery_name varchar(10),
		user_id number(10) not null,
		role_id number(2) not null
		);


-- image table has primary key image_id.
-- user_id and gallery_id are foreign key.

create table image
	(
		gallery_id number(10) not null,
		user_id number(10) not null,
		image_id number(10) not null,
		filename varchar(15),
		description varchar(30),
		upload_date date
		);

/* login table has primary key login_id. user_id is foreign key.*/

create table login
    (
        login_id number(10) not null,
        user_id number(10) not null,
        login_userrname varchar(20),
        user_password number(20)
    );

/* permission table has primary key per_id. user_id is foreign key.*/

create table permission
    (
        per_id number(10) not null,
        per_name varchar(20),
        per_module varchar(20),
        user_id number(10)
    );


-- Below command shows all the tables in Oracle databse.

SELECT * FROM tab;

-- Usage of 'ALTER' command is shown below:
-- First we add 'Gender', 'Age' and 'Email' column to the userr table.

ALTER TABLE userr
	ADD gender varchar(10);

ALTER TABLE userr
	ADD (age number(3),
		email varchar(20));

-- Now we modify 'Email' column of 'USERR' table to varchar(50),
-- 'Age' column to number(10) and 'Gender' column to varchar(1);

ALTER TABLE userr
	MODIFY email varchar(10);

ALTER TABLE userr
	MODIFY (age number(10),
			gender varchar(1));

-- Now we rename 'Email' column of 'USERR' table to 'Postcode';
ALTER TABLE userr
	RENAME COLUMN email to postcode;

-- Lastly we drop 'Gender', 'Age' and 'postcode' columns from 'USERR' table;

ALTER TABLE userr
	DROP COLUMN gender;
ALTER TABLE userr
	DROP COLUMN age;
ALTER TABLE userr
	DROP COLUMN postcode;

-- This section creates primary keys
-- primary key section starts here

alter table image add constraint imagePKey
primary key(image_id);

alter table gallery add constraint galleryPKey
primary key(gallery_id);

alter table role add constraint rolePKey
primary key(role_id);

alter table login add constraint loginPKey
primary key(login_id);

alter table permission add constraint perPKey
primary key(per_id);

-- primary key section ends here

-- This section creates foreign keys
-- foreign key section starts here

alter table role add constraint roleFKey1
foreign key(user_id) references userr(user_id) on delete cascade;

alter table image add constraint imageFKey1
foreign key(user_id) references userr(user_id) on delete cascade;

alter table image add constraint imageFKey2
foreign key(gallery_id) references gallery(gallery_id) on delete cascade;

alter table login add constraint loginFKey
foreign key(user_id) references userr(user_id) on delete cascade;

alter table permission add constraint perFKey
foreign key(user_id) references userr(user_id) on delete cascade;

--foreign key section ends here

-- Trigger section starts here to validate input data.

--Triggering for Insertion and Update for userr TABLE
--SET SERVEROUTPUT ON

CREATE OR REPLACE TRIGGER userr BEFORE INSERT OR UPDATE ON USERR
FOR EACH ROW
DECLARE
	u_id USERR.user_id%type := 0;
	-- Least id is 0
BEGIN
	IF :new.user_id<u_id THEN
	 	RAISE_APPLICATION_ERROR(-20000,'User id cannot be negative.');
	END IF;
END;
/

--Triggering for Insertion and Update for role TABLE
--SET SERVEROUTPUT ON

CREATE OR REPLACE TRIGGER role BEFORE INSERT OR UPDATE ON ROLE
FOR EACH ROW
DECLARE
	u_id USERR.user_id%type := 0;
	-- Least id is 0
BEGIN
	IF :new.user_id<u_id THEN
	 	RAISE_APPLICATION_ERROR(-20000,'User id cannot be negative.');
	END IF;
END;
/

--Triggering for Insertion and Update for image TABLE
--SET SERVEROUTPUT ON

CREATE OR REPLACE TRIGGER image BEFORE INSERT OR UPDATE ON IMAGE
FOR EACH ROW
DECLARE
	u_id USERR.user_id%type := 0;
	-- Least id is 0
BEGIN
	IF :new.user_id<u_id THEN
	 	RAISE_APPLICATION_ERROR(-20000,'User id cannot be negative.');
	END IF;
END;
/

--Triggering for Insertion and Update for gallery TABLE
--SET SERVEROUTPUT ON

CREATE OR REPLACE TRIGGER galery BEFORE INSERT OR UPDATE ON GALLERY
FOR EACH ROW
DECLARE
	u_id USERR.user_id%type := 0;
	-- Least id is 0
BEGIN
	IF :new.user_id<u_id THEN
	 	RAISE_APPLICATION_ERROR(-20000,'User id cannot be negative.');
	END IF;
END;
/

--Triggering for Insertion and Update for permission TABLE
--SET SERVEROUTPUT ON

CREATE OR REPLACE TRIGGER permission BEFORE INSERT OR UPDATE ON PERMISSION
FOR EACH ROW
DECLARE
	u_id USERR.user_id%type := 0;
	-- Least id is 0
BEGIN
	IF :new.user_id<u_id THEN
	 	RAISE_APPLICATION_ERROR(-20000,'User id cannot be negative.');
	END IF;
END;
/

--Triggering for Insertion and Update for login TABLE
--SET SERVEROUTPUT ON

CREATE OR REPLACE TRIGGER login BEFORE INSERT OR UPDATE ON LOGIN
FOR EACH ROW
DECLARE
	u_id USERR.user_id%type := 0;
	-- Least id is 0
BEGIN
	IF :new.user_id<u_id THEN
	 	RAISE_APPLICATION_ERROR(-20000,'User id cannot be negative.');
	END IF;
END;
/

-- Some sample value inserted in this section
-- sample value insertion section starts here

insert into userr values(1,'Akash',11111,'Photographer');
insert into userr values(2,'Swad',11112,'Designer');
insert into userr values(3,'Rashik',11113,'Developer');
insert into userr values(4,'Abirrr',11114,'Photographer');
insert into userr values(5,'Rafi',11115,'Designer');
insert into userr values(6,'Tanmoy',11116,'Developer');
insert into userr values(19,'Alvi',111119,'Photographer');
insert into userr values(22,'Mazid',111122,'Designer');
insert into userr values(2222,'Dummy',2222,'Delete');

insert into role values(01,'Admin','administritive_role',1);
insert into role values(02,'Member','membership_role',2);
insert into role values(03,'Viewer','viewership_role',3);
insert into role values(14,'Admin','administritive_role',4);
insert into role values(05,'Viewer','viewership_role',5);
insert into role values(16,'Admin','administritive_role',6);
insert into role values(019,'Viewer','viewership_role',19);
insert into role values(022,'Member','membership_role',22);


insert into gallery values(2221,'Carmichael',1,1);
insert into gallery values(2222,'Carmichael',2,2);
insert into gallery values(2223,'ThirdLine',3,3);
insert into gallery values(2224,'Carmichael',4,14);
insert into gallery values(2225,'FecalFace',5,5);
insert into gallery values(2226,'ThirdLine',6,16);
insert into gallery values(2227,'FecalFace',19,19);
insert into gallery values(2228,'ThirdLine',22,22);


insert into image values(2221,1,3331,'profPic','Just a profile pic','19-JUNE-2016');
insert into image values(2222,2,3332,'rand','Just a random pic','20-JUNE-2016');
insert into image values(2223,3,3333,'userrPic','none','19-JUNE-2016');
insert into image values(2224,4,3334,'stubborn','Just for fun','28-JUNE-2016');
insert into image values(2225,5,3335,'clever','Just having fun','1-JUNE-2016');
insert into image values(2226,6,3336,'programmer','#Respect','17-JUNE-2016');
insert into image values(2227,19,3337,'eater','Only Like','19-JUNE-2016');
insert into image values(2228,22,3338,'dope','none','17-JUNE-2016');


insert into login values(111,1,'UName1',11111);
insert into login values(112,2,'UName2',11112);
insert into login values(113,3,'UName3',11113);
insert into login values(114,4,'UName4',11114);
insert into login values(115,5,'UName5',11115);
insert into login values(116,6,'UName6',11116);
insert into login values(117,19,'UName7',111119);
insert into login values(118,22,'UName8',111122);


insert into permission values(221,'admin_per','admin_per_mod',1);
insert into permission values(222,'member_per','member_per_mod',2);
insert into permission values(223,'viewer_per','viewer_per_mod',3);
insert into permission values(224,'admin_per','admin_per_mod',4);
insert into permission values(225,'viewer_per','viewer_per_mod',5);
insert into permission values(226,'admin_per','admin_per_mod',6);
insert into permission values(227,'viewer_per','viewer_per_mod',19);
insert into permission values(228,'member_per','member_per_mod',22);

-- sample value insert section ends here

-- View section starts here

-- Below snippet creates a simple view to show all details of user id >= 5

CREATE VIEW userView AS
	SELECT *
	FROM userr
	WHERE user_id>=5;

SELECT * FROM userView;

-- Below snippet updates view to show all details of user id>=10

CREATE OR REPLACE VIEW userView AS
	SELECT *
	FROM userr
	WHERE user_id>=10;

-- Below snippet drops a view;

DROP VIEW userView;

-- View section ends here

-- Using 'UPDATE' command to update value of 'USERR' table which is already present in the table;

UPDATE userr
	SET name='Abir' WHERE about='Photographer';

-- Deleting a value from 'USERR' table using 'DELETE' command;

DELETE FROM userr
	WHERE about='Delete';


-- Example of Aggregate functions applied to the project


-- Intuition of Aggregate function starts here


--using of count function on userr table counts the number of userrs
select count(user_id) from userr;

select count(gallery_id) from gallery where gallery_id>=2224; -- count on gallery

--using of sum function on image table sum up the values of gallery_id
select sum(gallery_id) as gallerySum from image;

-- --using of avg function on role table finds the avg value of userr_id

select avg(user_id) from role;

--using of min and max functions on userr table finds the maximum and minimum values of userr_id respectively

select max(user_id) from userr;
select min(user_id) from userr;


--Second Highest user_id FROM USERR
SELECT MAX(user_id) FROM userr WHERE user_id NOT IN(SELECT MAX(user_id) FROM userr);

-- -- Intuition of Aggregate function ends here

-- Example of Union all function. Basically union all unions data without eliminating duplication

select u.user_id,u.name from userr u union all select g.user_id,g.gallery_name from gallery g where g.user_id in(select user_id from role where role_id>=14);

-- Example of Union function. Union function eliminates the duplicates

select u.user_id,u.name from userr u union select g.user_id,g.gallery_name from gallery g where g.user_id in(select user_id from role where role_id>=14);

-- Example of Intersect funtion. it selects data which are common on both table

select u.user_id,u.name from userr u intersect select g.user_id,g.gallery_name from gallery g where g.user_id in(select user_id from role where role_id>=14);

-- Example of Minus function. It selects data from the first table excluding common data in second table

select u.user_id,u.name from userr u minus select g.user_id,g.gallery_name from gallery g where g.user_id in(select user_id from role where role_id>=14);

-- The following section gives intuition on join. The join section starts here.

-- The simple join. inner join and simple join are same

select u.name,r.role_id from userr u join role r on u.user_id=r.user_id;

-- here on is used

select u.name,r.role_id from userr u join role r using (user_id);

-- here using is used

-- The natural join also acts as join but it compares all the same column and there is no need of condition

select u.name,i.filename from userr u natural join image i;

-- The cross join results in cartesian product of two table contents

select u.name,g.gallery_name from userr u cross join gallery g;

-- Outer Join
-- left outer join

select g.gallery_name,i.filename from gallery g left outer join image i on g.gallery_id = i.gallery_id;

-- right outer join

select g.gallery_name,i.filename from gallery g right outer join image i on g.gallery_id = i.gallery_id;

-- full outer join

select g.gallery_name,i.filename from gallery g full outer join image i on g.gallery_id = i.gallery_id;

-- Demonstration of 'JOIN' section ends here. --

-- Example of plsql on project
-- One Thing to remeber use proper indentation in plsql else you may see errors
-- The plsql section starts here

-- Example of userid and name checking

set serveroutput on;
declare   
	-- variable of user_id type from userr table is declared and initialized with value
	u_id1  userr.user_id%type:=1;
	-- variable of name type from userr table is declared and initialized with value
	u_name userr.name%type:='Akash'; 
	-- variable of user_id type from userr table is declared and initialized with value
	u_id2 userr.user_id%type;
begin
	-- query of user_id where initialized u_name is equivalent to userr tables one of the name
	-- if the name is found then u_id2 will contain the corresponding user_id
	select user_id into u_id2 from userr where name=u_name;
	-- checking if u_id1 and u_id2 is equal if equal
	if u_id1=u_id2 then
             dbms_output.put_line('User found in database');
	else
    	dbms_output.put_line('User not found in database');
	end if;
end;
/
show errors;

-- pl sql to show image filename of a gallery using loop
set serveroutput on
declare
	-- Here a row of gallery is selected by gallery_cur which contains gallery name 'Carmichael'
	cursor gallery_cur is select gallery_id from gallery where gallery_name='Carmichael';
	-- To store a particular row a gallery_pointer of gallery_cur is declared
	gallery_pointer gallery_cur%rowtype;
	fname image.filename%type;
	up_date image.upload_date%type;
begin
	open gallery_cur;
	-- By the loop each time a filename and upload date of an image is selected of current gallery id which is collected by gallery pointer
	loop
		fetch gallery_cur into gallery_pointer;
		select filename,upload_date into fname,up_date from image where image.gallery_id=gallery_pointer.gallery_id;

		dbms_output.put_line('The '||gallery_pointer.gallery_id||' contains '||fname||' uploaded in '||up_date);
		exit when gallery_cur%rowcount>2;
	end loop;
	close gallery_cur;
end;
/

commit;

-- Procedure to insert data into userr table;

CREATE OR REPLACE PROCEDURE InsertIntoUSERR(userId userr.user_id%type,name userr.name%type, pass userr.password%type,about userr.about%type) IS
BEGIN
	INSERT INTO userr VALUES(userId,name,pass, about);
	commit;
END InsertIntoUSERR;
/


--Calling the PROCEDURE for Inserting into USERR

SET SERVEROUTPUT ON
BEGIN
	InsertIntoUSERR(40,'New name',123456,'New about');
END;
/

SELECT * FROM USERR;


-- Procedure to update data of userr table;

CREATE OR REPLACE PROCEDURE updateUSERR(userId userr.user_id%type,newName userr.name%type, newPass userr.password%type,newAbout userr.about%type) IS
BEGIN
	UPDATE USERR SET name=newName,password=newPass,about=newAbout WHERE user_id=userId;
	commit;
END updateUSERR;
/


--Calling the PROCEDURE for Inserting into USERR

SET SERVEROUTPUT ON
BEGIN
	updateUSERR(40,'Old name',123456,'Old about');
END;
/

SELECT * FROM USERR;


--Deleting from userr table using PROCEDURE

CREATE OR REPLACE PROCEDURE DeletingUserr(userId userr.user_id%type) IS
BEGIN
	DELETE FROM userr WHERE user_id=userId;
	commit;
END DeletingUserr;
/

--Calling the PROCEDURE for Deleting from USERR
SET SERVEROUTPUT ON
BEGIN
	DeletingUserr(40);
END;
/

SELECT * FROM userr;


--Finding image's name for a given image id  using FUNCTION

CREATE OR REPLACE FUNCTION getImageName(imgId image.image_id%type) RETURN VARCHAR IS
	imageName image.filename%type;
BEGIN
	SELECT (filename) INTO imageName FROM image WHERE image_id=imgId;
	RETURN imageName;
END getImageName;
/


--Calling the FUNCTION to get image's name for a given image id

--id :=&imgId;
SET SERVEROUTPUT ON
DECLARE
	id image.image_id%type;
BEGIN
	DBMS_OUTPUT.PUT_LINE('The name for IMAGE ID ' ||'3332' ||' is : '||getImageName(3332));
END;
/

------ PL/SQL Segment ends here ---------

-- Transcation Management(Rollback)
SELECT * from userr;
DELETE FROM userr;
DELETE * FROM userr;
ROLLBACK;
SELECT * FROM userr;
INSERT INTO userr VALUES(35,'New Name1',654321,'New About1');
SAVEPOINT INSERT1;
INSERT INTO userr VALUES(30,'New Name2',123456,'New About2');
SAVEPOINT INSERT2;
ROLLBACK TO INSERT1;

SELECT * FROM userr;

-----------------------------------------------       END OF PROJECT       ------------------------------------------------------