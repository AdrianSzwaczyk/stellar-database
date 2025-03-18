INSERT INTO Units (Unit_ID, Unit_name)
VALUES
    ('Size','AU'),
	('Age','y'),
	('Mass','kg'),
	('Radius','km'),
	('Time_since_last_update','d'),
	('CoordinatesX','AU'),
	('CoordinatesY','AU'),
	('CoordinatesZ','AU');

INSERT INTO UniverseTypes (TypeName)
VALUES
    ('Powerhouse'),
    ('Scientific'),
    ('Recreational'),
    ('Confidential'),
    ('Government'),
    ('Simulation'),
    ('Private'),
    ('Test'),
    ('For sell'),
    ('Empty');

INSERT INTO GalaxyTypes (TypeName)
VALUES
    ('Spiral'),
    ('Elliptical'),
    ('Irregular'),
    ('Dwarf'),
    ('Lenticular'),
    ('Barred Spiral'),
    ('Ringed'),
    ('Quasar'),
    ('Colliding'),
    ('Ultra-Compact');

INSERT INTO SystemTypes (TypeName)
VALUES
    ('Planetary System'),
    ('Binary star'),
    ('Satellite system'),
    ('Binary planet'),
    ('Asteroid belt'),
    ('Nebula'),
    ('Comet system'),
    ('Exoplanetary System'),
    ('Pulsar System'),
    ('Quasar System');

INSERT INTO U_Owner (Universe_owner_ID, Phone_number, Email)
VALUES
('owner1x', 999999999, 'owner1@example.com'),
('owner2x', 888888888, 'owner2@example.com'),
('owner3x', 777777777, 'owner3@example.com'),
('owner4x', 666666666, 'owner4@example.com'),
('owner5x', 555555555, 'owner5@example.com'),
('owner6x', 444444444, 'owner6@example.com'),
('owner7x', 333333333, 'owner7@example.com'),
('owner8x', 222222222, 'owner8@example.com'),
('owner9x', 111111111, 'owner9@example.com'),
('owner10', 123456789, 'owner10@example.com'),
('owner11', 987654321, 'owner11@example.com'),
('owner12', 876543210, 'owner12@example.com'),
('owner13', 765432109, 'owner13@example.com'),
('owner14', 654321098, 'owner14@example.com'),
('owner15', 543210987, 'owner15@example.com'),
('owner16', 432109876, 'owner16@example.com'),
('owner17', 321098765, 'owner17@example.com'),
('owner18', 210987654, 'owner18@example.com'),
('owner19', 109876543, 'owner19@example.com'),
('owner20', 987654331, 'owner20@example.com'),
('owner21', 987654322, 'owner21@example.com'),
('owner22', 987654323, 'owner22@example.com'),
('owner23', 987654324, 'owner23@example.com'),
('owner24', 987654325, 'owner24@example.com'),
('owner25', 987654326, 'owner25@example.com');

INSERT INTO Person (Personal_ID, First_name, Last_name, Owner_ID_P)
VALUES
('person1x', 'John', 'Doe', 'owner1x'),
('person2x', 'Jane', 'Smith', 'owner2x'),
('person3x', 'Mike', 'Johnson', 'owner3x'),
('person4x', 'Emily', 'Williams', 'owner4x'),
('person5x', 'Chris', 'Brown', 'owner5x'),
('person6x', 'Olivia', 'Miller', 'owner6x'),
('person7x', 'Daniel', 'Davis', 'owner7x'),
('person8x', 'Sophia', 'Jones', 'owner8x'),
('person9x', 'Matthew', 'Clark', 'owner9x'),
('person10', 'Emma', 'Taylor', 'owner10'),
('person11', 'Michael', 'White', 'owner11'),
('person12', 'Grace', 'Harris', 'owner12'),
('person13', 'Andrew', 'Smith', 'owner13'),
('person14', 'Chloe', 'Anderson', 'owner14'),
('person15', 'Joshua', 'Turner', 'owner15'),
('person16', 'Ava', 'Walker', NULL),
('person17', 'David', 'Ward', NULL),
('person18', 'Ella', 'Fisher', NULL),
('person19', 'Ryan', 'Baker', NULL),
('person20', 'Alice', 'Johnson', NULL),
('person21', 'Bob', 'Smith', 'owner21'),
('person22', 'Catherine', 'Davis', 'owner22'),
('person23', 'Daniel', 'Miller', 'owner23'),
('person24', 'Eleanor', 'Brown', 'owner24'),
('person25', 'Felix', 'White', 'owner25');


INSERT INTO Universe (Universe_ID, U_Name, UniverseType_ID_U, Size, Age, Time_since_last_update, Open_for_tourists, Owner_ID_U)
VALUES
('universe1ax', 'Cosmic Marvel', 1, 3000000000, 13000000000, 30, 1, 'owner1x'),
('universe1bx', 'Celestial Vortex', 1, 1000000000, 13000000000, 10, 0, 'owner1x'),
('universe1cx', 'Ethereal Cosmos', 1, 2000000000, 13000000000, 1, 1, 'owner1x'),
('universe2xx', 'Andromeda Expanse', 1, 800000000, 14000000000, 20, 0, 'owner2x'),
('universe3xx', 'Triangulum Realm', 3, 500000000, 12000000000, 32, 1, 'owner3x'),
('universe4ax', 'Sombrero Nebula', 4, 200000000, 11000000000, 90, 1, 'owner4x'),
('universe4bx', 'Galactic Hat', 4, 210000000, 11200000000, 9, 0, 'owner4x'),
('universe5xx', 'Whirlpool Galaxy', 5, 600000000, 15000000000, 64, 0, 'owner5x'),
('universe6xx', 'Pinwheel Universe', 2, 320000000, 12600000000, 12, 1, 'owner6x'),
('universe7xx', 'Messier 87 Domain', 8, 155000000, 16100000000, 7, 1, 'owner7x'),
('universe8ax', 'Centaurus A Expanse', 6, 98000000, 10600000000, 9, 0, 'owner8x'),
('universe8bx', 'Centaurus A Cosmos', 6, 99000000, 10700000000, 95, 0, 'owner8x'),
('universe8cx', 'Centaurus A Frontier', 6, 100500000, 10800000000, 10, 1, 'owner8x'),
('universe8dx', 'Centaurus A Galactic Core', 6, 99000000, 10750000000, 5, 1, 'owner8x'),
('universe9xx', 'Messier 81 Expanse', 7, 410000000, 11400000000, 20, 1, 'owner9x'),
('universe10x', 'Black Eye Universe', 9, 710000000, 15400000000, 20, 0, 'owner10'),
('universe11a', 'Cartwheel Galaxy Domain', 1, 122000000, 14400000000, 92, 0, 'owner11'),
('universe11b', 'Cartwheel Galactic Vortex', 1, 121000000, 14600000000, 30, 1, 'owner11'),
('universe12x', 'Sombrero Vastness', 2, 255000000, 13300000000, 10, 1, 'owner12'),
('universe13x', 'NGC 1300 Celestial Haven', 3, 183000000, 11850000000, 12, 0, 'owner13'),
('universe14a', 'Messier 101 Galactic Haven', 9, 455000000, 10900000000, 50, 1, 'owner14'),
('universe14b', 'Messier 101 Celestial Realm', 9, 460000000, 11100000000, 8, 1, 'owner14'),
('universe14c', 'Messier 101 Ethereal Expanse', 9, 440000000, 11200000000, 18, 1, 'owner14'),
('universe14d', 'Messier 101 Celestial Oasis', 9, 445000000, 10850000000, 30, 0, 'owner14'),
('universe14e', 'Messier 101 Vast Cosmos', 9, 465000000, 10950000000, 15, 1, 'owner14'),
('universe14f', 'Messier 101 Galactic Serenity', 9, 445000000, 11000000000, 14, 1, 'owner14'),
('universe15x', 'Messier 51 Stellar Nexus', 6, 308000000, 17100000000, 20, 1, 'owner15'),
('universe16x', 'Sculptor Celestial Haven', 4, 78000000, 8900000000, 130, 0, 'owner16'),
('universe17x', 'NGC 4414 Galactic Sanctuary', 5, 355000000, 12900000000, 11, 1, 'owner17'),
('universe18a', 'Whale Nebula Expanse', 6, 92000000, 14900000000, 1, 1, 'owner18'),
('universe18b', 'Whale Galaxy Domain', 6, 94000000, 15100000000, 0, 1, 'owner18'),
('universe19x', 'Antennae Vast Cosmos', 3, 200000000, 14000000000, 5, 0, 'owner19'),
('universe20x', 'Bode''s Celestial Haven', 3, 500000000, 16000000000, 2, 1, 'owner20'),
('universe21x', 'Bode''s Celestial Haven', 3, 500000000, 16000000000, 12, 0, 'owner21'),
('universe22x', 'Bode''s Celestial Haven', 3, 500000000, 16000000000, 10, 1, 'owner22'),
('universe23x', 'Bode''s Celestial Haven', 3, 500000000, 16000000000, 12, 1, 'owner23'),
('universe24x', 'Bode''s Celestial Haven', 3, 500000000, 16000000000, 120, 0, 'owner24'),
('universe25x', 'Bode''s Celestial Haven', 3, 500000000, 16000000000, 4, 1, 'owner25');


INSERT INTO Company (Company_Name, Person_ID_C, Owner_ID_C)
VALUES
('TechCorp', 'person16', 'owner16'),
('BioTech', 'person17', 'owner17'),
('DataSolutions', 'person18', 'owner18'),
('InnovateSoft', 'person19', 'owner19'),
('AlphaTech', 'person20', 'owner20');


INSERT INTO Civilization (C_Name, C_Type, CoordinatesX, CoordinatesY, CoordinatesZ, Universe_ID_C)
VALUES
('Civ1a', 0.69, 1, 1, 1, 'universe1ax'),
('Civ1b', 2, 2, 2, 2, 'universe1ax'),
('Civ1c', 4, 3, 3, 3, 'universe1ax'),
('Civ2', 1.23, 2, 2, 2, 'universe2xx'),
('Civ3', 0.98, 3, 3, 3, 'universe3xx'),
('Civ4a', 2, 4, 4, 4, 'universe4ax'),
('Civ4b', 1.54, 5, 5, 5, 'universe4ax'),
('Civ4c', 4.4, 6, 6, 6, 'universe4bx'),
('Civ4d', 0.5, 7, 7, 7, 'universe4bx'),
('Civ4e', 1.6, 8, 8, 8, 'universe4bx'),
('Civ5', 1.21, 5, 5, 5, 'universe5xx'),
('Civ6', 0.87, 6, 6, 6, 'universe6xx'),
('Civ7', 1.32, 7, 7, 7, 'universe7xx'),
('Civ8', 1.09, 8, 8, 8, 'universe8ax'),
('Civ9', 0.76, 9, 9, 9, 'universe9xx'),
('Civ10', 1.65, 10, 10, 10, 'universe10x'),
('Civ11', 1.43, 11, 11, 11, 'universe11a'),
('Civ12', 1.78, 12, 12, 12, 'universe12x'),
('Civ13', 0.54, 13, 13, 13, 'universe13x'),
('Civ14', 1.87, 14, 14, 14, 'universe14b'),
('Civ15', 1.09, 15, 15, 15, 'universe15x'),
('Civ16', 1.32, 16, 16, 16, 'universe16x'),
('Civ17', 1.65, 17, 17, 17, 'universe17x'),
('Civ18', 0.87, 18, 18, 18, 'universe18a'),
('Civ19', 1.43, 19, 19, 19, 'universe19x'),
('Civ20a', 1.1, 20, 20, 20, 'universe20x'),
('Civ20b', 0.21, 21, 21, 21, 'universe20x'),
('Civ20c', 1, 22, 22, 22, 'universe20x'),
('Civ20d', 5.2, 23, 23, 23, 'universe20x');


INSERT INTO CivilizationalSecurityIntervention (Case_ID, Universe_ID_CSI, Owner_ID_CSI)
VALUES
('case1x', 'universe1ax', 'owner1x'),
('case2x', 'universe1ax', 'owner1x'),
('case3x', 'universe1ax', 'owner1x'),
('case4x', 'universe2xx', 'owner2x'),
('case5x', 'universe2xx', 'owner2x'),
('case6x', 'universe4bx', 'owner4x'),
('case7x', 'universe4bx', 'owner4x'),
('case8x', 'universe7xx', 'owner7x'),
('case9x', 'universe7xx', 'owner7x'),
('case10', 'universe7xx', 'owner7x'),
('case11', 'universe8ax', 'owner8x'),
('case12', 'universe8bx', 'owner8x'),
('case13', 'universe8cx', 'owner8x'),
('case14', 'universe8dx', 'owner8x'),
('case15', 'universe9xx', 'owner9x'),
('case16', 'universe10x', 'owner10'),
('case17', 'universe14a', 'owner14'),
('case18', 'universe14b', 'owner14'),
('case19', 'universe14b', 'owner14'),
('case20', 'universe14b', 'owner14'),
('case21', 'universe21x', 'owner21'),
('case22', 'universe22x', 'owner22'),
('case23', 'universe23x', 'owner23'),
('case24', 'universe24x', 'owner24'),
('case25', 'universe24x', 'owner24');


INSERT INTO Officer (Officer_ID, Personal_ID_O)
VALUES
('officer1', 'person21'),
('officer2', 'person22'),
('officer3', 'person23'),
('officer4', 'person24'),
('officer5', 'person25');


INSERT INTO Intervening (CSI_ID_I, Officer_ID_I)
VALUES
('case1x', 'officer1'),
('case1x', 'officer2'),
('case1x', 'officer3'),
('case2x', 'officer4'),
('case2x', 'officer5'),
('case3x', 'officer1'),
('case3x', 'officer2'),
('case4x', 'officer3'),
('case4x', 'officer4'),
('case5x', 'officer5'),
('case6x', 'officer1'),
('case6x', 'officer2'),
('case7x', 'officer3'),
('case7x', 'officer4'),
('case8x', 'officer5'),
('case9x', 'officer1'),
('case10', 'officer2'),
('case11', 'officer3'),
('case11', 'officer4'),
('case11', 'officer5'),
('case12', 'officer4'),
('case13', 'officer5'),
('case14', 'officer1'),
('case14', 'officer2'),
('case15', 'officer3'),
('case16', 'officer4'),
('case17', 'officer5'),
('case18', 'officer1'),
('case19', 'officer2'),
('case20', 'officer3'),
('case21', 'officer1'),
('case22', 'officer2'),
('case23', 'officer3'),
('case24', 'officer4'),
('case25', 'officer5');


INSERT INTO U_Group (G_Name, CoordinatesX, CoordinatesY, CoordinatesZ, Universe_ID_G)
VALUES
('Group1a', 1, 1, 1, 'universe1ax'),
('Group1b', 1, 1, 1, 'universe1ax'),
('Group1c', 1, 1, 1, 'universe1ax'),
('Group2', 2, 2, 2, 'universe2xx'),
('Group3', 3, 3, 3, 'universe3xx'),
('Group4', 4, 4, 4, 'universe4ax'),
('Group5a', 5, 5, 5, 'universe5xx'),
('Group5b', 5, 5, 5, 'universe5xx'),
('Group5c', 5, 5, 5, 'universe5xx'),
('Group6', 6, 6, 6, 'universe6xx'),
('Group7', 7, 7, 7, 'universe7xx'),
('Group8', 8, 8, 8, 'universe8ax'),
('Group9', 9, 9, 9, 'universe9xx'),
('Group10', 10, 10, 10, 'universe10x'),
('Group11', 11, 11, 11, 'universe11a'),
('Group12', 12, 12, 12, 'universe12x'),
('Group13', 13, 13, 13, 'universe13x'),
('Group14', 14, 14, 14, 'universe14a'),
('Group15', 15, 15, 15, 'universe15x'),
('Group16', 16, 16, 16, 'universe16x'),
('Group17', 17, 17, 17, 'universe17x'),
('Group18', 18, 18, 18, 'universe18a'),
('Group19', 19, 19, 19, 'universe19x'),
('Group20', 20, 20, 20, 'universe20x');



INSERT INTO Galaxy (G_Name, G_Type, CoordinatesX, CoordinatesY, CoordinatesZ, GroupName_G)
VALUES
('Galaxy1a1', 1, 1, 1, 1, 'Group1a'),
('Galaxy1a2', 1, 1, 1, 1, 'Group1a'),
('Galaxy1a3', 1, 1, 1, 1, 'Group1a'),
('Galaxy1b1', 1, 1, 1, 1, 'Group1b'),
('Galaxy1b2', 1, 1, 1, 1, 'Group1b'),
('Galaxy1c', 1, 1, 1, 1, 'Group1c'),
('Galaxy2', 2, 2, 2, 2, 'Group2'),
('Galaxy3', 3, 3, 3, 3, 'Group3'),
('Galaxy4', 1, 4, 4, 4, 'Group4'),
('Galaxy5a1', 1, 5, 5, 5, 'Group5a'),
('Galaxy5a2', 1, 5, 5, 5, 'Group5a'),
('Galaxy6', 6, 6, 6, 6, 'Group6'),
('Galaxy7', 1, 7, 7, 7, 'Group7'),
('Galaxy8', 2, 8, 8, 8, 'Group8'),
('Galaxy9', 1, 9, 9, 9, 'Group9'),
('Galaxy10', 3, 10, 10, 10, 'Group10'),
('Galaxy11', 1, 11, 11, 11, 'Group11'),
('Galaxy12', 1, 12, 12, 12, 'Group12'),
('Galaxy13', 2, 13, 13, 13, 'Group13'),
('Galaxy14', 1, 14, 14, 14, 'Group14'),
('Galaxy15', 3, 15, 15, 15, 'Group15'),
('Galaxy16', 1, 16, 16, 16, 'Group16'),
('Galaxy17', 1, 17, 17, 17, 'Group17'),
('Galaxy18', 2, 18, 18, 18, 'Group18'),
('Galaxy19', 1, 19, 19, 19, 'Group19'),
('Galaxy20', 1, 20, 20, 20, 'Group20');



INSERT INTO U_System (ID, SystemType_ID_S, CoordinatesX, CoordinatesY, CoordinatesZ, System_ID_S, Universe_ID_S, G_Name_S)
VALUES
('Sys1', 2, 1, 1, 1, NULL, NULL,'Galaxy1a1'),
('Sys2', 1, 2, 2, 2, 'Sys1', NULL,'Galaxy2'),
('Sys3', 2, 3, 3, 3, NULL, NULL,'Galaxy3'),
('Sys4', 3, 4, 4, 4, NULL, NULL,'Galaxy4'),
('Sys5', 2, 5, 5, 5, NULL, NULL,'Galaxy5a2'),
('Sys6', 5, 6, 6, 6, NULL, NULL,'Galaxy6'),
('Sys7', 4, 7, 7, 7, NULL, NULL,'Galaxy7'),
('Sys8', 9, 8, 8, 8, NULL, NULL,'Galaxy8'),
('Sys9', 6, 9, 9, 9, 'Sys7', NULL,'Galaxy9'),
('Sys10', 10, 10, 10, 10, 'Sys7', NULL,'Galaxy10'),
('Sys11', 3, 11, 11, 11, NULL, NULL,'Galaxy11'),
('Sys12', 2, 12, 12, 12, NULL, NULL,'Galaxy12'),
('Sys13', 1, 13, 13, 13, 'Sys7', NULL,'Galaxy13'),
('Sys14', 2, 14, 14, 14, NULL, NULL,'Galaxy14'),
('Sys15', 5, 15, 15, 15, NULL, NULL,'Galaxy15'),
('Sys16', 3, 16, 16, 16, NULL, NULL,'Galaxy16'),
('Sys17', 1, 17, 17, 17, 'Sys7', NULL,'Galaxy17'),
('Sys18', 1, 18, 18, 18, 'Sys1', NULL,'Galaxy18'),
('Sys19', 2, 19, 19, 19, NULL, NULL,'Galaxy19'),
('Sys20', 4, 20, 20, 20, NULL, NULL,'Galaxy20');


INSERT INTO CelestialBody (Cb_Name, Cb_Type, Mass, Radius, CoordinatesX, CoordinatesY, CoordinatesZ, System_ID_CB, CivName_CB)
VALUES
('Star1a', 'Main Sequence', 1000000, 500000, 1, 1, 1, 'Sys1', 'Civ1a'),
('Star1b', 'Main Sequence', 2000000, 400000, 1, 1, 1, 'Sys1', 'Civ1a'),
('Star1c', 'Main Sequence', 3000000, 600000, 1, 1, 1, 'Sys1', 'Civ1a'),
('Star1d', 'Main Sequence', 1000000, 500000, 1, 1, 1, 'Sys2', 'Civ1b'),
('Star1e', 'Main Sequence', 1000000, 500000, 1, 1, 1, 'Sys2', 'Civ1c'),
('Planet1a', 'Terrestrial', 5000, 8000, 2, 2, 2, 'Sys2', 'Civ2'),
('rPlanet1b', 'Terrestrial', 5000, 8000, 2, 2, 2, 'Sys2', 'Civ2'),
('rPlanet1c', 'Terrestrial', 2000, 1000, 3, 3, 3, 'Sys2', 'Civ2'),
('Moon1', 'Rocky', 100, 500, 3, 3, 3, 'Sys3', 'Civ3'),
('Star2', 'Giant', 5000000, 200000, 4, 4, 4, 'Sys4', 'Civ4b'),
('Planet2', 'Gas Giant', 20000, 15000, 5, 5, 5, 'Sys5', 'Civ5'),
('Asteroid1', 'Rocky', 50, 200, 6, 6, 6, 'Sys6', 'Civ6'),
('Star3', 'Main Sequence', 800000, 400000, 7, 7, 7, 'Sys7', 'Civ7'),
('rPlanet3a', 'Terrestrial', 3000, 6000, 8, 8, 8, 'Sys8', 'Civ8'),
('Planet3b', 'Terrestrial', 3000, 6000, 8, 8, 8, 'Sys8', 'Civ8'),
('Moon2', 'Rocky', 80, 400, 9, 9, 9, 'Sys9', 'Civ9'),
('Star4', 'Giant', 3000000, 120000, 10, 10, 10, 'Sys10', 'Civ10'),
('Planet4', 'Gas Giant', 12000, 9000, 11, 11, 11, 'Sys11', 'Civ11'),
('Asteroid2', 'Rocky', 40, 180, 12, 12, 12, 'Sys12', 'Civ12'),
('Star5', 'Main Sequence', 900000, 450000, 13, 13, 13, 'Sys13', 'Civ13'),
('Planet5a', 'Terrestrial', 3500, 7000, 14, 14, 14, 'Sys14', 'Civ14'),
('Planet5b', 'Terrestrial', 3500, 7000, 14, 14, 14, 'Sys14', 'Civ14'),
('rPlanet5c', 'Terrestrial', 3500, 7000, 14, 14, 14, 'Sys14', 'Civ14'),
('Moon3', 'Rocky', 120, 550, 15, 15, 15, 'Sys15', 'Civ15'),
('Star6', 'Giant', 4500000, 180000, 16, 16, 16, 'Sys16', 'Civ16'),
('Planet6', 'Gas Giant', 18000, 13500, 17, 17, 17, 'Sys17', 'Civ17'),
('Asteroid3', 'Rocky', 60, 220, 18, 18, 18, 'Sys18', 'Civ18'),
('Star7', 'Main Sequence', 950000, 475000, 19, 19, 19, 'Sys19', 'Civ19'),
('Planet7', 'Terrestrial', 4000, 7500, 20, 20, 20, 'Sys20', 'Civ20a');

