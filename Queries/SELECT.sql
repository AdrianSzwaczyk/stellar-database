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

-- S: Ministerstwo Turystyki Wszech�wiat�w chce wzmo�y� �rodki ostro�no�ci i weryfikacji podejmowane
-- co do w�a�cicieli wszech�wiat�w otwartych dla turyst�w, kt�rzy z racji interwencji przeprowadzonych
-- w ich wszech�wiatach, s� podejrzani i powinni by� obserwowani.
-- Q: Poka� dane osobowe i kontaktowe do w�a�cicieli wszech�wiat�w otwartych dla turyst�w i z ��czn� liczb� interwencji wi�ksz� ni� podana
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

-- S: Rz�d chce wspom�c biedne i ma�o zaawansowane technologicznie cywilizacje.
-- Q: Poka� wszystkie cywilizacje o typie mniejszym ni� podany i liczbie kontrolowanych obiekt�w mniejszej ni� podana,
-- posortowane wed�ug liczby kontrolowanych obiekt�w a nast�pnie wed�ug typu (oba rosn�co)
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

-- S: Rz�d podejrzewa, �e oficerowie, kt�rzy jednocze�nie s� w�a�cicielami wszech�wiat�w i brali udzia�
-- w interwencjach we w�asnych wszech�wiatach, mog� by� nie do ko�ca uczciwi.
-- Q: Podaj informacje (z danymi kontaktowymi) o oficerach, kt�rzy s� jednocze�nie w�a�cicielami przynajmniej jednego wszech�wiata
-- i brali udzia� w interwencji, kt�ra dotyczy�a ich w�asnego wszech�wiata.
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

-- S: Pewna cywilizacja prowadzi wojn� z inn� cywilizacj�. Syn (o imieniu Robert) przyw�dcy pierwszej cywilizacji
-- ma dzisiaj urodziny, jego ojciec postanowi� wi�c z tej okazji podbi� planety nale��ce do wrogiej cywilizacji,
-- zaczynaj�ce si� na liter� 'R'.
-- Q: Poka� informacje (przydatne do ataku) o cia�ach nale��cych do danej cywilizacji, o nazwach zaczynaj�cych si� od danej litery
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

-- S: Naukowcy badaj� wszech�wiat, w kt�rym prawa fizyki dzia�aj� w niecodzienny spos�b.
-- Chc� zbada�, jak w takich warunkach zachowuj� si� masywne obiekty.
-- Q: Poka� wszystkie cia�a o masie wi�kszej ni� podana w danym wszech�wiecie.
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

-- S: Przepisy m�wi�, �e dane o ka�dym wszech�wiecie powinny by� aktualizowane
-- conajmniej co 30 dni, odpowiednie organy musz� wi�c sprawdza�, czy rzeczywi�cie
-- tak si� dzieje.
-- Q: Poka� wszystkie wszech�wiaty, kt�re powinny otrzyma� aktualizacj� danych.
SELECT
    Universe_ID,
    U_Name,
    Time_since_last_update
FROM
    Universe
WHERE
    Time_since_last_update > 30;


-- S: Zwykle najciekawsz� cywilizacj� jest ta, kt�ra osi�gne�a najwy�szy stopie�
-- post�pu technologicznego. Ci, kt�rzy odwiedzaj� dany wszech�wiat, chc� wi�c
-- m�c sprawdzi�, kt�ra cywilizacja jest najbardziej zaawansowana.
-- Q: Poka� najbardziej zaawansowan� cywilizacj� w danym wszech�wiecie.
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


-- S: Pewne czasopimo sporz�dza ranking wszech�wiat�w wed�ug �redniego poziomu zaawansowania technologicznego.
-- Q: Poka� �redni typ cywilizacji dla wszystkich wszech�wiat�w, uporz�dkowane malej�co.
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