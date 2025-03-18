SELECT * FROM U_Owner
SELECT * FROM Person
SELECT * FROM Universe
JOIN UniverseTypes ON Universe.UniverseType_ID_U = UniverseTypes.UniverseType_ID;
SELECT * FROM Company
SELECT * FROM Civilization
SELECT * FROM CivilizationalSecurityIntervention
SELECT * FROM Officer
SELECT * FROM Intervening
SELECT * FROM U_Group
SELECT * FROM Galaxy
JOIN GalaxyTypes ON Galaxy.G_Type = GalaxyTypes.GalaxyType_ID;
SELECT * FROM U_System
JOIN SystemTypes ON U_System.SystemType_ID_S = SystemTypes.SystemType_ID;
SELECT * FROM CelestialBody

-- S: Ministerstwo Turystyki Wszechœwiatów chce wzmo¿yæ œrodki ostro¿noœci i weryfikacji podejmowane
-- co do w³aœcicieli wszechœwiatów otwartych dla turystów, którzy z racji interwencji przeprowadzonych
-- w ich wszechœwiatach, s¹ podejrzani i powinni byæ obserwowani.
-- Q: Poka¿ dane osobowe i kontaktowe do w³aœcicieli wszechœwiatów otwartych dla turystów i z ³¹czn¹ liczb¹ interwencji wiêksz¹ ni¿ podana
SELECT
    U_Owner.Universe_owner_ID,
    U_Owner.Phone_number,
    U_Owner.Email,
    COUNT(CivilizationalSecurityIntervention.Case_ID) AS Interventions
FROM
    U_Owner
JOIN
    Universe ON U_Owner.Universe_owner_ID = Universe.Owner_ID_U
JOIN
    CivilizationalSecurityIntervention ON Universe.Universe_ID = CivilizationalSecurityIntervention.Universe_ID_CSI
WHERE
    Universe.Open_for_tourists = 1
GROUP BY
    U_Owner.Universe_owner_ID, U_Owner.Phone_number, U_Owner.Email
HAVING
    COUNT(CivilizationalSecurityIntervention.Case_ID) > 1;

-- S: Rz¹d chce wspomóc biedne i ma³o zaawansowane technologicznie cywilizacje.
-- Q: Poka¿ wszystkie cywilizacje o typie mniejszym ni¿ podany i liczbie kontrolowanych obiektów mniejszej ni¿ podana,
-- posortowane wed³ug liczby kontrolowanych obiektów a nastêpnie wed³ug typu (oba rosn¹co)
SELECT 
    C_Name,
    C_Type,
    (SELECT COUNT(*) FROM CelestialBody WHERE Civilization.C_Name = CelestialBody.CivName_CB) AS Controlled_Bodies
FROM 
    Civilization
WHERE 
    C_Type < 2
    AND (SELECT COUNT(*) FROM CelestialBody WHERE Civilization.C_Name = CelestialBody.CivName_CB) <= 2
ORDER BY 
    Controlled_Bodies, C_Type;

-- S: Rz¹d podejrzewa, ¿e oficerowie, którzy jednoczeœnie s¹ w³aœcicielami wszechœwiatów i brali udzia³
-- w interwencjach we w³asnych wszechœwiatach, mog¹ byæ nie do koñca uczciwi.
-- Q: Podaj informacje (z danymi kontaktowymi) o oficerach, którzy s¹ jednoczeœnie w³aœcicielami przynajmniej jednego wszechœwiata
-- i brali udzia³ w interwencji, która dotyczy³a ich w³asnego wszechœwiata.
SELECT DISTINCT
    P.First_name,
    P.Last_name,
    UO.Phone_number,
    UO.Email
FROM
    Person AS P
JOIN
    Officer AS O ON P.Personal_ID = O.Personal_ID_O
JOIN
    Intervening AS I ON O.Officer_ID = I.Officer_ID_I
JOIN
    CivilizationalSecurityIntervention AS CSI ON I.CSI_ID_I = CSI.Case_ID
JOIN
    U_Owner AS UO ON P.Owner_ID_P = UO.Universe_owner_ID AND UO.Universe_owner_ID = CSI.Owner_ID_CSI
JOIN
    Universe AS U ON CSI.Universe_ID_CSI = U.Universe_ID;

-- S: Pewna cywilizacja prowadzi wojnê z inn¹ cywilizacj¹. Syn (o imieniu Robert) przywódcy pierwszej cywilizacji
-- ma dzisiaj urodziny, jego ojciec postanowi³ wiêc z tej okazji podbiæ planety nale¿¹ce do wrogiej cywilizacji,
-- zaczynaj¹ce siê na literê 'R'.
-- Q: Poka¿ informacje (przydatne do ataku) o cia³ach nale¿¹cych do danej cywilizacji, o nazwach zaczynaj¹cych siê od danej litery
GO
CREATE VIEW CBbyR AS
SELECT
    CB.Cb_Name,
    CB.Cb_Type,
    CB.Mass,
    CB.Radius,
    CB.CoordinatesX,
    CB.CoordinatesY,
    CB.CoordinatesZ
FROM
    CelestialBody AS CB
JOIN
    Civilization AS C ON CB.CivName_CB = C.C_Name
WHERE
    CB.Cb_Name LIKE 'R%' AND C.C_Name = 'Civ2';
GO
SELECT *
FROM CBbyR;

DROP VIEW CBbyR

-- S: Naukowcy badaj¹ wszechœwiat, w którym prawa fizyki dzia³aj¹ w niecodzienny sposób.
-- Chc¹ zbadaæ, jak w takich warunkach zachowuj¹ siê masywne obiekty.
-- Q: Poka¿ wszystkie cia³a o masie wiêkszej ni¿ podana w danym wszechœwiecie.
SELECT
    CB.Cb_Name,
    CB.Cb_Type,
    CB.Mass,
	CB.Radius,
    CB.CoordinatesX,
    CB.CoordinatesY,
    CB.CoordinatesZ,
	CB.System_ID_CB,
    CB.CivName_CB
FROM
    CelestialBody CB
JOIN
    U_System US ON CB.System_ID_CB = US.ID
JOIN
    Galaxy G ON US.G_Name_S = G.G_Name
JOIN
    U_Group UG ON G.GroupName_G = UG.G_Name
JOIN
    Universe U ON UG.Universe_ID_G = U.Universe_ID
WHERE
    CB.Mass > 10000
    AND U.Universe_ID = 'universe2xx';

-- S: Przepisy mówi¹, ¿e dane o ka¿dym wszechœwiecie powinny byæ aktualizowane
-- conajmniej co 30 dni, odpowiednie organy musz¹ wiêc sprawdzaæ, czy rzeczywiœcie
-- tak siê dzieje.
-- Q: Poka¿ wszystkie wszechœwiaty, które powinny otrzymaæ aktualizacjê danych.
SELECT
    Universe_ID,
    U_Name,
    Time_since_last_update
FROM
    Universe
WHERE
    Time_since_last_update > 30;


-- S: Zwykle najciekawsz¹ cywilizacj¹ jest ta, która osi¹gne³a najwy¿szy stopieñ
-- postêpu technologicznego. Ci, którzy odwiedzaj¹ dany wszechœwiat, chc¹ wiêc
-- móc sprawdziæ, która cywilizacja jest najbardziej zaawansowana.
-- Q: Poka¿ najbardziej zaawansowan¹ cywilizacjê w danym wszechœwiecie.
SELECT
    C.C_Name,
    C.C_Type,
    C.CoordinatesX,
    C.CoordinatesY,
    C.CoordinatesZ
FROM
    Civilization C
JOIN
    Universe U ON C.Universe_ID_C = U.Universe_ID
WHERE
    U.Universe_ID = 'universe1ax'
    AND C.C_Type = (SELECT MAX(C_Type) FROM Civilization WHERE Universe_ID_C = U.Universe_ID);


-- S: Pewne czasopimo sporz¹dza ranking wszechœwiatów wed³ug œredniego poziomu zaawansowania technologicznego.
-- Q: Poka¿ œredni typ cywilizacji dla wszystkich wszechœwiatów, uporz¹dkowane malej¹co.
SELECT
    U.Universe_ID,
    U.U_Name,
    AVG(C.C_Type) AS Avg_Civilization_Type
FROM
    Universe U
LEFT JOIN
    Civilization C ON U.Universe_ID = C.Universe_ID_C
GROUP BY
    U.Universe_ID, U.U_Name
ORDER BY
    Avg_Civilization_Type DESC;