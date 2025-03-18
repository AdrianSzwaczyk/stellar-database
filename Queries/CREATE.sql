CREATE FUNCTION dbo.onlyLettersAndDigits(@Name varchar(20))
RETURNS bit
AS
BEGIN
	RETURN CASE WHEN PATINDEX('^[^\x30-\x39\x41-\x5A\x61-\x7A]+$', @Name) = 0 THEN 1 ELSE 0 END;
END;
GO
CREATE FUNCTION dbo.onlyLetters(@Name varchar(20))
RETURNS bit
AS
BEGIN
	RETURN CASE WHEN PATINDEX('^[^\x41-\x5A\x61-\x7A]+$', @Name) = 0 THEN 1 ELSE 0 END;
END;
GO

CREATE TABLE Units (
	Unit_ID varchar(30) PRIMARY KEY,
	Unit_name varchar(5),
)


CREATE TABLE U_Owner (
	Universe_owner_ID varchar(9) CHECK(dbo.onlyLettersAndDigits(Universe_owner_ID) = 1 AND LEN(Universe_owner_ID) = 7) PRIMARY KEY,
	Phone_number int CHECK(Phone_number>=100000000 AND Phone_number<=999999999) UNIQUE,
	Email varchar(50) CHECK(Email LIKE '%_@__%.__%') UNIQUE,
)

CREATE TABLE Person (
	Personal_ID varchar(10) CHECK(dbo.onlyLettersAndDigits(Personal_ID) = 1 AND LEN(Personal_ID) = 8) PRIMARY KEY,
	First_name varchar(16) CHECK(dbo.onlyLetters(First_Name) = 1),
	Last_name varchar(16) CHECK(dbo.onlyLetters(Last_name) = 1),
	Owner_ID_P varchar(9) FOREIGN KEY REFERENCES U_Owner(Universe_owner_ID) ON DELETE SET NULL,
)

CREATE TABLE UniverseTypes (
    UniverseType_ID int IDENTITY(1,1) PRIMARY KEY,
    TypeName varchar(30) NOT NULL,
)


CREATE TABLE Universe (
	Universe_ID varchar(12) CHECK(dbo.onlyLettersAndDigits(Universe_ID) = 1 AND LEN(Universe_ID) = 11) PRIMARY KEY,
	U_Name varchar(40) CHECK(dbo.onlyLettersAndDigits(U_Name) = 1),
	UniverseType_ID_U int FOREIGN KEY REFERENCES UniverseTypes(UniverseType_ID) ON UPDATE CASCADE,
	Size bigint CHECK(Size >= 0),
	Age bigint CHECK(Age >= 0),
	Time_since_last_update int CHECK(Time_since_last_update >= 0),
	Open_for_tourists bit,
	Owner_ID_U varchar(9) FOREIGN KEY REFERENCES U_Owner(Universe_owner_ID) ON DELETE CASCADE,
)

CREATE TABLE Company (
	Company_Name varchar(16) CHECK(dbo.onlyLettersAndDigits(Company_Name) = 1) PRIMARY KEY,
	Person_ID_C varchar(10) FOREIGN KEY REFERENCES Person(Personal_ID) ON DELETE CASCADE,
	Owner_ID_C varchar(9) FOREIGN KEY REFERENCES U_Owner(Universe_owner_ID) ON DELETE CASCADE,
)

CREATE TABLE Civilization (
	C_Name varchar(20) CHECK(PATINDEX('^[^\x30-\x39\x41-\x5A\x61-\x7A]+$', C_Name)=0) PRIMARY KEY,
	C_Type float CHECK(C_Type>=0 AND C_Type<=7),
	CoordinatesX int,
	CoordinatesY int,
	CoordinatesZ int,
	Universe_ID_C varchar(12) FOREIGN KEY REFERENCES Universe(Universe_ID) ON DELETE CASCADE NOT NULL,
)

CREATE TABLE CivilizationalSecurityIntervention (
	Case_ID varchar(9) CHECK(dbo.onlyLettersAndDigits(Case_ID) = 1 AND LEN(Case_ID) = 6) PRIMARY KEY,
	Universe_ID_CSI varchar(12) FOREIGN KEY REFERENCES Universe(Universe_ID) ON DELETE CASCADE NOT NULL,
	Owner_ID_CSI varchar(9) FOREIGN KEY REFERENCES U_Owner(Universe_owner_ID) NOT NULL,
)

CREATE TABLE Officer (
	Officer_ID varchar(9) CHECK(dbo.onlyLettersAndDigits(Officer_ID) = 1 AND LEN(Officer_ID) = 8) PRIMARY KEY ,
	Personal_ID_O varchar(10) FOREIGN KEY REFERENCES Person(Personal_ID),
)

CREATE TABLE Intervening (
	CSI_ID_I varchar(9) FOREIGN KEY REFERENCES CivilizationalSecurityIntervention(Case_ID) ON DELETE CASCADE NOT NULL,
	Officer_ID_I varchar(9) FOREIGN KEY REFERENCES Officer(Officer_ID) ON DELETE CASCADE NOT NULL,
	CONSTRAINT KeyIntervening PRIMARY KEY (CSI_ID_I,Officer_ID_I),
)

CREATE TABLE U_Group (
	G_Name varchar(20) CHECK(dbo.onlyLettersAndDigits(G_Name) = 1) PRIMARY KEY,
	CoordinatesX int,
	CoordinatesY int,
	CoordinatesZ int,
	Universe_ID_G varchar(12) FOREIGN KEY REFERENCES Universe(Universe_ID) ON DELETE CASCADE NOT NULL,
)

CREATE TABLE GalaxyTypes (
    GalaxyType_ID int IDENTITY(1,1) PRIMARY KEY,
    TypeName varchar(30) NOT NULL,
)


CREATE TABLE Galaxy (
	G_Name varchar(32) CHECK(dbo.onlyLettersAndDigits(G_Name) = 1) PRIMARY KEY,
	G_Type int FOREIGN KEY REFERENCES GalaxyTypes(GalaxyType_ID) ON UPDATE CASCADE,
	CoordinatesX int,
	CoordinatesY int,
	CoordinatesZ int,
	GroupName_G varchar(20) FOREIGN KEY REFERENCES U_Group(G_Name) ON DELETE CASCADE ON UPDATE CASCADE,
)


CREATE TABLE SystemTypes (
    SystemType_ID int IDENTITY(1,1) PRIMARY KEY,
    TypeName varchar(50) NOT NULL
);


CREATE TABLE U_System (
    ID varchar(16) PRIMARY KEY,
    SystemType_ID_S int FOREIGN KEY REFERENCES SystemTypes(SystemType_ID) ON DELETE SET NULL ON UPDATE CASCADE DEFAULT NULL,
    CoordinatesX int,
    CoordinatesY int,
    CoordinatesZ int,
	System_ID_S varchar(16) REFERENCES U_System(ID),
	Universe_ID_S varchar(12) FOREIGN KEY REFERENCES Universe(Universe_ID) DEFAULT NULL,
	G_Name_S varchar(32) FOREIGN KEY REFERENCES Galaxy(G_Name) ON DELETE SET NULL,
)

CREATE TABLE CelestialBody (
Cb_Name varchar(20) CHECK(dbo.onlyLettersAndDigits(Cb_Name) = 1) PRIMARY KEY,
Cb_Type varchar(16) CHECK(dbo.onlyLetters(Cb_Type) = 1),
Mass bigint,
Radius bigint CHECK(Radius>3 AND Radius<10000000000000000),
CoordinatesX int,
CoordinatesY int,
CoordinatesZ int,
System_ID_CB varchar(16) FOREIGN KEY REFERENCES U_System(ID) ON DELETE CASCADE,
CivName_CB varchar(20) FOREIGN KEY REFERENCES Civilization(C_Name) ON DELETE SET NULL ON UPDATE CASCADE DEFAULT NULL,
)
GO
CREATE TRIGGER U_SystemTrig
ON U_System
INSTEAD OF DELETE
AS
BEGIN
    DELETE FROM U_System
    WHERE System_ID_S IN (SELECT ID FROM DELETED);

	DELETE FROM U_System
    WHERE ID IN (SELECT ID FROM DELETED);

	DELETE FROM U_System
	WHERE ID NOT IN (
    SELECT DISTINCT System_ID_S
    FROM CelestialBody
    WHERE System_ID_S IS NOT NULL
    UNION
    SELECT DISTINCT System_ID_CB
    FROM CelestialBody
    WHERE System_ID_CB IS NOT NULL
    UNION
    SELECT DISTINCT Sys_ID
    FROM (
        SELECT DISTINCT System_ID_S AS Sys_ID
        FROM U_System
        WHERE System_ID_S IS NOT NULL
        UNION
        SELECT DISTINCT System_ID_CB AS Sys_ID
        FROM CelestialBody
        WHERE System_ID_CB IS NOT NULL
    ) AS Systems
    WHERE Sys_ID IS NOT NULL
);
END;
GO
GO
CREATE TRIGGER GalaxyTrig
ON U_Group
AFTER DELETE
AS
BEGIN
    DELETE FROM U_System
    WHERE G_Name_S IS NULL;
END;
GO

/*CREATE TRIGGER CBTrig
ON CelestialBody
AFTER DELETE
AS
DISABLE TRIGGER U_SystemTrig ON U_System 
BEGIN
	DELETE FROM U_System
    WHERE ID NOT IN (
    SELECT DISTINCT System_ID_S
    FROM CelestialBody
    WHERE System_ID_S IS NOT NULL
    UNION
    SELECT DISTINCT System_ID_CB
    FROM CelestialBody
    WHERE System_ID_CB IS NOT NULL
    UNION
    SELECT DISTINCT Sys_ID
    FROM (
        SELECT DISTINCT System_ID_S AS Sys_ID
        FROM U_System
        WHERE System_ID_S IS NOT NULL
        UNION
        SELECT DISTINCT System_ID_CB AS Sys_ID
        FROM CelestialBody
        WHERE System_ID_CB IS NOT NULL
    ) AS Systems
    WHERE Sys_ID IS NOT NULL
);
END;
ENABLE TRIGGER U_SystemTrig ON U_System */